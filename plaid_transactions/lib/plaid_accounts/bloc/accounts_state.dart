part of 'accounts_bloc.dart';

@immutable
abstract class AccountsState {
  const AccountsState();
}

class AccountsInitial extends AccountsState {
  const AccountsInitial();
}

class AccountsLoading extends AccountsState {}

class LinkTokenNotAvailable extends AccountsState {}

class TokensGenerated extends AccountsState {}

class AccountsLoaded extends AccountsState {
  const AccountsLoaded(this.accountsResponse);
  final AccountsResponse accountsResponse;
}

class AccountsError extends AccountsState {
  const AccountsError(this.message);
  final String message;
}
