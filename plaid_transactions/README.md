Plaid integration package, that has features such as Plaid link flow, and widgets
such as PlaidAccounts and PlaidTransactions.

## Features
PlaidAccounts - widget to diplay a list of all accounts connected via Plaid with balances
PlaidTransactions - widget to diplay a list of all transactions from connecter accounts

## Usage

Before using any widgets, the config needs to be setup first, for example in main() function, before runApp()
PlaidService.setConfig() - this function has three required params environment, clientId and secret
```dart
PlaidService.setConfig(
  environment: PlaidEnvironment.sandbox,
  clientId: 'xxxxxxxxxxxxxxxxxxxxxxxx',
  secret: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
);
```

Using PlaidAccounts widget
```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Plaid Accounts')),
    body: const PlaidAccounts(),
  );
}
```

Using PlaidTransactions widget
```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Plaid Transactions')),
    body: const PlaidTransactions(),
  );
}
```

## Additional information
Notes: 
* plaid_transactions\lib\plaid_transactions\bloc\transactions_bloc.dart:55
  Transactions are fetched for last 365 days, to limit or get more items modify line 55 in below file

* plaid_transactions\lib\plaid_transactions\models\personal_finance_category.dart:552
  _incomeCategories -
  Categories in this list will determine whether to show the transactions under Income or Expense.
  Add category in this list to consider the transaction as Income and the transations with
  categories that are not in this list will be considered as Expense.

* plaid_transactions\lib\plaid_transactions\models\personal_finance_category.dart:563
  _allowableExpenseCategories -
  Categories in this list will further categorize an Expense as 'Tax Saving Allowable Expense'
