part of 'accounts_bloc.dart';

@immutable
abstract class AccountsEvent {
  const AccountsEvent();
}

class GenerateTokens extends AccountsEvent {}

class LoadAccounts extends AccountsEvent {}
