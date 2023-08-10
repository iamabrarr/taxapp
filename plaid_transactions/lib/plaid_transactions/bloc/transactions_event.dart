part of 'transactions_bloc.dart';

@immutable
abstract class TransactionsEvent {
  const TransactionsEvent();
}

class GenerateTokens extends TransactionsEvent {}

class LoadTransactions extends TransactionsEvent {}

class FilterTransactions extends TransactionsEvent {
  const FilterTransactions(this.filter);
  final Filter filter;
}
