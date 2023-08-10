import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaid_transactions/plaid_accounts/models/accounts_response.dart';
import 'package:plaid_transactions/service/plaid_service.dart';

part 'accounts_event.dart';
part 'accounts_state.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  AccountsBloc([super.initialState = const AccountsInitial()]) {
    on<GenerateTokens>(onGenerateTokens);
    on<LoadAccounts>(onLoadAccounts);
  }

  Future<void> onLoadAccounts(LoadAccounts event, Emitter<AccountsState> emit) async {
    try {
      emit(AccountsLoading());
      if (await PlaidService.checkTokens()) {
        emit(LinkTokenNotAvailable());
        return;
      }
      emit(AccountsLoaded(await PlaidService.getAccounts()));
    } catch (e) {
      emit(AccountsError('$e'));
    }
  }

  Future<void> onGenerateTokens(GenerateTokens event, Emitter<AccountsState> emit) async {
    try {
      emit(AccountsLoading());
      final linkToken = await PlaidService.generateToken();
      await PlaidService.setLinkToken(linkToken);
      PlaidService.openPlaidLink(linkToken, (message) => print(message));
      emit(TokensGenerated());
    } catch (e) {
      emit(AccountsError('$e'));
    }
  }
}