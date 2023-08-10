part of 'transactions_bloc.dart';

@immutable
abstract class TransactionsState {
  const TransactionsState([this.filter = Filter.all]);
  final Filter filter;
}

class TransactionsInitial extends TransactionsState {
  const TransactionsInitial();
}

class TransactionsLoading extends TransactionsState {}

class LinkTokenNotAvailable extends TransactionsState {}

class TokensGenerated extends TransactionsState {}

class TransactionsLoaded extends TransactionsState {
  const TransactionsLoaded(this.items, super.filter, this.income, this.expense);
  final List<Transaction> items;
  final double income;
  final double expense;
}

class TransactionsEmpty extends TransactionsState {
  const TransactionsEmpty(this.message, super.filter);
  final String message;
}

class TransactionsError extends TransactionsState {
  const TransactionsError(this.message);
  final String message;
}