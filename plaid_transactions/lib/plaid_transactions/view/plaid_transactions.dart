import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaid_transactions/plaid_transactions/bloc/transactions_bloc.dart';
import 'package:plaid_transactions/plaid_transactions/models/personal_finance_category.dart';
import 'package:plaid_transactions/plaid_transactions/models/transactions_response.dart';
import 'package:plaid_transactions/plaid_transactions/view/filter_switcher.dart';

class PlaidTransactions extends StatelessWidget {
  const PlaidTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = TransactionsBloc();
    return BlocProvider(
      create: (_) => bloc..add(LoadTransactions()),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                BlocBuilder<TransactionsBloc, TransactionsState>(
                    builder: (_, state) {
                  if (state is LinkTokenNotAvailable) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Center(
                        child: FilledButton(
                          onPressed: () => bloc.add(GenerateTokens()),
                          child: const Text('Setup',
                              style: TextStyle(color: Colors.white)),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is TokensGenerated) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Center(
                        child: FilledButton(
                          onPressed: () => bloc.add(LoadTransactions()),
                          child: const Text('Load Information',
                              style: TextStyle(color: Colors.white)),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is TransactionsLoaded ||
                      state is TransactionsEmpty) {
                    return Expanded(
                      child: Column(
                        children: [
                          FilterSwitcher(
                            value: state.filter,
                            onUpdate: (filter) =>
                                bloc.add(FilterTransactions(filter)),
                          ),
                          if (state is TransactionsLoaded) ...[
                            Expanded(
                              child: ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                itemCount: state.items.length,
                                itemBuilder: (context, i) =>
                                    TransactionItem(item: state.items[i]),
                              ),
                            ),
                          ] else if (state is TransactionsEmpty) ...[
                            Expanded(child: Center(child: Text(state.message))),
                          ],
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                }),
              ],
            ),
            BlocConsumer<TransactionsBloc, TransactionsState>(
              listener: (_, state) {
                if (state is TransactionsError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (_, state) {
                return Visibility(
                  visible: state is TransactionsLoading,
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



class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.item});

  final Transaction item;

  @override
  Widget build(BuildContext context) {
    bool isExpense = item.amount != null && item.amount! > 0;
    Color amountColor = isExpense ? Colors.red : Colors.green;
    double displayAmount = item.amount!;
    String amountText = isExpense
        ? '\£ -${displayAmount.toStringAsFixed(2)}'
        : '\£ ${displayAmount.abs().toStringAsFixed(2)}';

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Category:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 2.0),
                    Text(item.personalFinanceCategory?.description ?? '-'),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      item.name ?? '-',
                      style: const TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      amountText,
                      style: TextStyle(fontSize: 14.0, color: amountColor),
                    ),
                  ],
                ),
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
