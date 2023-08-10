import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaid_transactions/plaid_accounts/bloc/accounts_bloc.dart';
import 'package:plaid_transactions/plaid_accounts/models/accounts_response.dart';

class PlaidAccounts extends StatelessWidget {
  const PlaidAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = AccountsBloc();
    return BlocProvider(
      create: (_) => bloc..add(LoadAccounts()),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                BlocBuilder<AccountsBloc, AccountsState>(builder: (_, state) {
                  if (state is LinkTokenNotAvailable) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Center(
                        child: FilledButton(
                          onPressed: () => bloc.add(GenerateTokens()),
                          child: const Text('Get Link Token'),
                        ),
                      ),
                    );
                  }
                  if (state is TokensGenerated) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Center(
                        child: FilledButton(
                          onPressed: () => bloc.add(LoadAccounts()),
                          child: const Text('Load Accounts'),
                        ),
                      ),
                    );
                  }
                  if (state is AccountsLoaded) {
                    final accounts = state.accountsResponse.accounts ?? [];
                    if (accounts.isEmpty) {
                      return const Expanded(child: Center(child: Text('No accounts found')));
                    }
                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        itemCount: accounts.length,
                        itemBuilder: (context, i) => AccountItem(item: accounts[i]),
                      ),
                    );
                  }
                  return const SizedBox();
                }),
              ],
            ),
            BlocConsumer<AccountsBloc, AccountsState>(
              listener: (_, state) {
                if (state is AccountsError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (_, state) {
                return Visibility(
                  visible: state is AccountsLoading,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.2),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AccountItem extends StatelessWidget {
  const AccountItem({super.key, required this.item});

  final Accounts item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name ?? '-',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                    const Text('Account:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 2.0),
                    Text('XXXX ${item.mask}'),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Balance', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4.0),
                  Text(
                    '\$${item.balances?.current?.toStringAsFixed(2) ?? 0.0} ',
                    style: const TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1.0,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
