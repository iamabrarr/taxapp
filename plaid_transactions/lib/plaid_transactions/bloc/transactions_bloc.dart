import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaid_transactions/plaid_transactions/models/personal_finance_category.dart';
import 'package:plaid_transactions/plaid_transactions/models/transactions_response.dart';
import 'package:plaid_transactions/plaid_transactions/view/filter_switcher.dart';
import 'package:plaid_transactions/service/plaid_service.dart';

part 'transactions_state.dart';
part 'transactions_event.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc([super.initialState = const TransactionsInitial()]) {
    on<GenerateTokens>(onGenerateTokens);
    on<LoadTransactions>(onLoadTransactions);
    on<FilterTransactions>(onFilterTransactions);
  }

  static const noTranxMessage = 'No transactions yet';
  static const noTranxFilterMessage = 'No transactions for the selected filter';
  List<Transaction> transactions = [];
  Filter filter = Filter.all;

  Future<void> onFilterTransactions(
      FilterTransactions event, Emitter<TransactionsState> emit) async {
    filter = event.filter;
    List<Transaction> filtered = [];

    // List<Transaction> recurringTransactions =
    //     await fetchAndDisplayRecurringTransactions();

    // if (filter == Filter.recurring) {
    //   emit(TransactionsLoading());
    //   try {
    //     filtered = await fetchAndDisplayRecurringTransactions();
    //     if (filtered.isEmpty) {
    //       emit(TransactionsEmpty('No recurring transactions found.', filter));
    //     }
    //   } catch (e) {
    //     emit(TransactionsError('Failed to load recurring transactions: $e'));
    //   }
    // } else {
      switch (filter) {
        case Filter.all:
          filtered = transactions;
          break;
        case Filter.income:
          filtered = transactions
              .where((item) => item.personalFinanceCategory?.isIncome == true)
              .toList();
          // filtered.addAll(recurringTransactions);
          break;
        case Filter.expense:
          filtered = transactions
              .where((item) => item.personalFinanceCategory?.isIncome == false)
              .toList();
          break;
        case Filter.allowableExpense:
          filtered = transactions
              .where((item) =>
                  item.personalFinanceCategory?.isAllowableExpense == true)
              .toList();
          break;
      }
  //  }

    Map<String, double> filteredTotals = _calculateTotals(filtered);

    emit(filtered.isEmpty
        ? TransactionsEmpty(noTranxFilterMessage, filter)
        : TransactionsLoaded(filtered, filter, filteredTotals['income']!,
            filteredTotals['expense']!));
  }

  // Future<List<Transaction>> fetchAndDisplayRecurringTransactions() async {

  //   try {
  //     // Call the getRecurringTransactions method to fetch the transactions
  //     List<Transaction> recurringTransactions =
  //         await PlaidService.getRecurringTransactions();

  //     // Process and display the fetched transactions
  //     // For example, you can print them to the console for now
  //     recurringTransactions.forEach((transaction) {
  //       print(
  //           'Transaction: ${transaction.name}, Amount: ${transaction.amount}');
  //     });

  //     return recurringTransactions;
  //   } catch (e) {
  //     print('Error fetching recurring transactions: $e');
  //   }
  //   return [];
  // }

  Future<void> onLoadTransactions(
      LoadTransactions event, Emitter<TransactionsState> emit) async {
    try {
      emit(TransactionsLoading());
      if (await PlaidService.checkTokens()) {
        emit(LinkTokenNotAvailable());
        return;
      }

      final start = DateTime.now().subtract(const Duration(days: 365));
      final end = DateTime.now();
      String preZero(int v) => '$v'.length == 1 ? '0$v' : '$v';
      String date(DateTime d) =>
          '${d.year}-${preZero(d.month)}-${preZero(d.day)}';
      transactions = await PlaidService.getTransactions(date(start), date(end));

      Map<String, double> totals = _calculateTotals(transactions);

      emit(transactions.isEmpty
          ? TransactionsEmpty(noTranxMessage, filter)
          : TransactionsLoaded(
              transactions, filter, totals['income']!, totals['expense']!));

              
    } catch (e) {
      emit(TransactionsError('$e'));
    }
  }

  Map<String, double> _calculateTotals(List<Transaction> transactions) {
    double totalIncome = 0.0;
    double totalExpense = 0.0;

    for (Transaction transaction in transactions) {
      if (transaction.personalFinanceCategory?.isIncome == true) {
        totalIncome += transaction.amount ?? 0.0;
      } else if (transaction.personalFinanceCategory?.isIncome == false) {
        totalExpense += transaction.amount ?? 0.0;
      }
    }

    return {'income': totalIncome, 'expense': totalExpense};
  }

  Future<void> onGenerateTokens(
      GenerateTokens event, Emitter<TransactionsState> emit) async {
    try {
      emit(TransactionsLoading());
      final linkToken = await PlaidService.generateToken();
      await PlaidService.setLinkToken(linkToken);
      PlaidService.openPlaidLink(linkToken, (message) => print(message));
      emit(TokensGenerated());
    } catch (e) {
      emit(TransactionsError('$e'));
    }
  }
}
