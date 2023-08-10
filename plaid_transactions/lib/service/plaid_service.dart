import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:plaid_flutter/plaid_flutter.dart';
import 'package:plaid_transactions/plaid_accounts/models/accounts_response.dart';
import 'package:plaid_transactions/plaid_transactions/models/transactions_response.dart';
import 'package:uuid/uuid.dart';

enum PlaidEnvironment { sandbox, development, production }

extension PlaidEnvironmentExt on PlaidEnvironment {
  String get baseURL {
    switch (this) {
      case PlaidEnvironment.sandbox:
        return 'https://sandbox.plaid.com';
      case PlaidEnvironment.development:
        return 'https://development.plaid.com';
      case PlaidEnvironment.production:
        return 'https://api.plaid.com';
    }
  }
}

class PlaidService {
  static PlaidEnvironment? _environment;
  static String? _clientId;
  static String? _secret;

  static const _storage = FlutterSecureStorage();
  static const KEY_LINK_TOKEN = 'LINK_TOKEN';
  static const KEY_PUBLIC_TOKEN = 'PUBLIC_TOKEN';
  static const KEY_ACCESS_TOKEN = 'ACCESS_TOKEN';
  static const KEY_METADATA = 'METADATA';

  static setConfig({
    required PlaidEnvironment environment,
    required String clientId,
    required String secret,
  }) {
    _environment = environment;
    _clientId = clientId;
    _secret = secret;
  }

  static void checkConfig() {
    if (_environment == null ||
        _clientId == null ||
        _secret == null ||
        _clientId?.isEmpty == true ||
        _secret?.isEmpty == true) {
      throw Exception(
          'Config not set properly, please use PlaidService.setConfig() function before using PlaidTransactions or PlaidAccounts widget');
    }
  }

  static Map<String, String> get headers {
    return {
      'Content-Type': 'application/json',
      'PLAID-CLIENT-ID': _clientId!,
      'PLAID-SECRET': _secret!,
    };
  }

  static Future<String?> getLinkToken() async {
    return await _storage.read(key: KEY_LINK_TOKEN);
  }

  static Future<void> setLinkToken(String linkToken) {
    return _storage.write(key: KEY_LINK_TOKEN, value: linkToken);
  }

  static Future<String?> getPublicToken() async {
    return await _storage.read(key: KEY_PUBLIC_TOKEN);
  }

  static Future<void> setPublicToken(String publicToken) {
    return _storage.write(key: KEY_PUBLIC_TOKEN, value: publicToken);
  }

  static Future<String?> getMetadata() async {
    return await _storage.read(key: KEY_METADATA);
  }

  static Future<void> setMetadata(String metadata) {
    return _storage.write(key: KEY_METADATA, value: metadata);
  }

  static Future<String?> getAccessToken() async {
    return await _storage.read(key: KEY_ACCESS_TOKEN);
  }

  static Future<void> setAccessToken(String accessToken) {
    return _storage.write(key: KEY_ACCESS_TOKEN, value: accessToken);
  }

  // Returns true if any of the tokens is null
  static Future<bool> checkTokens() async {
    final linkToken = await getLinkToken();
    final publicToken = await getPublicToken();
    final accessToken = await getAccessToken();
    return [linkToken, publicToken, accessToken].any((item) => item == null);
  }

  static void openPlaidLink(String linkToken, void Function(String) onError) {
    PlaidLink.open(configuration: LinkTokenConfiguration(token: linkToken));
    PlaidLink.onSuccess.listen((event) async {
      await setPublicToken(event.publicToken);
      await setMetadata(event.metadata.description());

      final accessToken = await publicTokenExchange();
      await setAccessToken(accessToken);
    });

    PlaidLink.onExit.listen((event) async {
      // Implement onExit
      onError('${event.error?.displayMessage}');
    });

    PlaidLink.onEvent.listen((event) async {
      // Implement onEvent
      onError(event.metadata.description());
    });
  }

  // It's recommended by Plaid that this API call should be called from your own backend service,
  // for security reasons. Move this API call to your backend service.
  static Future<String> generateToken() async {
    checkConfig();
    final response = await http.post(
      Uri.parse('${_environment!.baseURL}/link/token/create'),
      headers: headers,
      body: jsonEncode({
        'client_name': 'Plaid Transactions',
        'user': {'client_user_id': const Uuid().v4()},
        'products': ['transactions'],
        'country_codes': ['GB'],
        'language': 'en',
        'android_package_name': 'flyn.hmrc.com.tax.appapp'
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['link_token'];
    } else {
      print(response.body);
      throw Exception('Failed to generate Link Token');
    }
  }

  static Future<String> publicTokenExchange() async {
    checkConfig();
    final response = await http.post(
      Uri.parse('${_environment!.baseURL}/item/public_token/exchange'),
      headers: headers,
      body: jsonEncode({'public_token': await getPublicToken()}),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      return responseData['access_token'];
    } else {
      throw Exception('Failed to exchange public token');
    }
  }

  static Future<List<Transaction>> getTransactions(
      String startDate, String endDate) async {
    List<Transaction> transactions = [];

    final response = await getTransactionsResponse(startDate, endDate);

    if (response.statusCode == 200) {
      final data = TransactionsResponse.fromJson(jsonDecode(response.body));
      transactions = data.transactions ?? [];
      int totalTransactions = data.totalTransactions ?? 0;

      while (transactions.length < totalTransactions) {
        final response = await getTransactionsResponse(
            startDate, endDate, transactions.length);

        if (response.statusCode == 200) {
          final data = TransactionsResponse.fromJson(jsonDecode(response.body));
          transactions.addAll(data.transactions ?? []);
        } else {
          throw Exception(
              'Failed to load paginated transactions: ${response.reasonPhrase}');
        }
      }
    } else {
      throw Exception('Failed to load transactions: ${response.reasonPhrase}');
    }
    return transactions;
  }

  // static Future<List<Transaction>> getRecurringTransactions() async {
  //   List<Transaction> recurringTransactions = [];

  //   final response = await getRecurringTransactionsResponse();

  //   if (response.statusCode == 200) {
  //     final data = TransactionsResponse.fromJson(jsonDecode(response.body));
  //     recurringTransactions = data.transactions ?? [];
  //     int totalTransactions = data.totalTransactions ?? 0;

  //     while (recurringTransactions.length < totalTransactions) {
  //       final response = await getRecurringTransactionsResponse();

  //       if (response.statusCode == 200) {
  //         final data = TransactionsResponse.fromJson(jsonDecode(response.body));
  //         recurringTransactions.addAll(data.transactions ?? []);
  //       } else {
  //         throw Exception(
  //             'Failed to load paginated recurring transactions: ${response.reasonPhrase}');
  //       }
  //     }
  //   } else {
  //     throw Exception(
  //         'Failed to load recurring transactions: ${response.reasonPhrase}');
  //   }
  //   return recurringTransactions;
  // }


  // static Future<http.Response> getRecurringTransactionsResponse() async {
  //   checkConfig();
  //   final request = {
  //     'access_token': await getAccessToken(),
  //     'client_id': _clientId,
  //     'secret': _secret,
  //     'account_ids':[
  //       "iRMxGT59gs5zPcE8yoHrUb0kU33jo899RCEyw",
  //       "4fPFAM3KDA2bi0ctj8SYX0KgwJQGx8A2Y6OLP",
  //       "kYcHNDmCoBDwIyD2ssgwTcZOASdvZZRjIg6I6"
  //    ],
  //     'options': {
  //       'include_personal_finance_category': true
  //     },
  //   };

  //   return await http.post(
  //     Uri.parse(
  //         '${_environment!.baseURL}/transactions/recurring/get'), //transactions/recurring/get
  //     headers: headers,
  //     body: jsonEncode(request),
  //   );
  // }

  static Future<http.Response> getTransactionsResponse(
    String startDate,
    String endDate, [
    int offset = 0,
  ]) async {
    checkConfig();
    final request = {
      'access_token': await getAccessToken(),
      'start_date': startDate,
      'end_date': endDate,
      'options': {'offset': offset, 'include_personal_finance_category': true},
    };

    return await http.post(
      Uri.parse('${_environment!.baseURL}/transactions/get'),
      headers: headers,
      body: jsonEncode(request),
    );
  }

  static Future<AccountsResponse> getAccounts() async {
    checkConfig();

    final response = await http.post(
      Uri.parse('${_environment!.baseURL}/accounts/get'),
      headers: headers,
      body: jsonEncode({'access_token': await getAccessToken()}),
    );

    if (response.statusCode == 200) {
      return AccountsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load accounts: ${response.reasonPhrase}');
    }
  }
}
