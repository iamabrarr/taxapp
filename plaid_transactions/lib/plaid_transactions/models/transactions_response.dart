import 'package:plaid_transactions/plaid_transactions/models/personal_finance_category.dart';

class TransactionsResponse {
  List<Accounts>? accounts;
  List<Transaction>? transactions;
  Item? item;
  int? totalTransactions;
  String? requestId;

  TransactionsResponse({
    this.accounts,
    this.transactions,
    this.item,
    this.totalTransactions,
    this.requestId,
  });

  TransactionsResponse.fromJson(Map<String, dynamic> json) {
    if (json['accounts'] != null) {
      accounts = <Accounts>[];
      json['accounts'].forEach((v) {
        accounts!.add(Accounts.fromJson(v));
      });
    }
    if (json['transactions'] != null) {
      transactions = <Transaction>[];
      json['transactions'].forEach((v) {
        transactions!.add(Transaction.fromJson(v));
      });
    }
    item = json['item'] != null ? Item.fromJson(json['item']) : null;
    totalTransactions = json['total_transactions'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (accounts != null) {
      data['accounts'] = accounts!.map((v) => v.toJson()).toList();
    }
    if (transactions != null) {
      data['transactions'] = transactions!.map((v) => v.toJson()).toList();
    }
    if (item != null) {
      data['item'] = item!.toJson();
    }
    data['total_transactions'] = totalTransactions;
    data['request_id'] = requestId;
    return data;
  }
}

class Accounts {
  String? accountId;
  Balances? balances;
  String? mask;
  String? name;
  String? officialName;
  String? subtype;
  String? type;

  Accounts({
    this.accountId,
    this.balances,
    this.mask,
    this.name,
    this.officialName,
    this.subtype,
    this.type,
  });

  Accounts.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    balances = json['balances'] != null ? Balances.fromJson(json['balances']) : null;
    mask = json['mask'];
    name = json['name'];
    officialName = json['official_name'];
    subtype = json['subtype'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['account_id'] = accountId;
    if (balances != null) {
      data['balances'] = balances!.toJson();
    }
    data['mask'] = mask;
    data['name'] = name;
    data['official_name'] = officialName;
    data['subtype'] = subtype;
    data['type'] = type;
    return data;
  }
}

class Balances {
  double? available;
  double? current;
  String? isoCurrencyCode;
  dynamic limit;
  dynamic unofficialCurrencyCode;

  Balances({
    this.available,
    this.current,
    this.isoCurrencyCode,
    this.limit,
    this.unofficialCurrencyCode,
  });

  Balances.fromJson(Map<String, dynamic> json) {
    available = double.tryParse('${json['available'] ?? '0.0'}');
    current = double.tryParse('${json['current'] ?? '0.0'}');
    isoCurrencyCode = json['iso_currency_code'];
    limit = json['limit'];
    unofficialCurrencyCode = json['unofficial_currency_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['available'] = available;
    data['current'] = current;
    data['iso_currency_code'] = isoCurrencyCode;
    data['limit'] = limit;
    data['unofficial_currency_code'] = unofficialCurrencyCode;
    return data;
  }
}

class Item {
  List<String>? availableProducts;
  List<String>? billedProducts;
  dynamic consentExpirationTime;
  dynamic error;
  String? institutionId;
  String? itemId;
  String? updateType;
  String? webhook;

  Item({
    this.availableProducts,
    this.billedProducts,
    this.consentExpirationTime,
    this.error,
    this.institutionId,
    this.itemId,
    this.updateType,
    this.webhook,
  });

  Item.fromJson(Map<String, dynamic> json) {
    availableProducts = json['available_products'].cast<String>();
    billedProducts = json['billed_products'].cast<String>();
    consentExpirationTime = json['consent_expiration_time'];
    error = json['error'];
    institutionId = json['institution_id'];
    itemId = json['item_id'];
    updateType = json['update_type'];
    webhook = json['webhook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['available_products'] = availableProducts;
    data['billed_products'] = billedProducts;
    data['consent_expiration_time'] = consentExpirationTime;
    data['error'] = error;
    data['institution_id'] = institutionId;
    data['item_id'] = itemId;
    data['update_type'] = updateType;
    data['webhook'] = webhook;
    return data;
  }
}

class Transaction {
  String? accountId;
  double? amount;
  bool? isRecurring; // Add the new field
  String? isoCurrencyCode;
  dynamic unofficialCurrencyCode;
  List<String>? category;
  String? categoryId;
  dynamic checkNumber;
  String? date;
  String? datetime;
  String? authorizedDate;
  String? authorizedDatetime;
  Location? location;
  String? name;
  String? merchantName;
  PaymentMeta? paymentMeta;
  String? paymentChannel;
  bool? pending;
  dynamic pendingTransactionId;
  dynamic accountOwner;
  String? transactionId;
  dynamic transactionCode;
  String? transactionType;
  PersonalFinanceCategory? personalFinanceCategory;

  Transaction({
    this.accountId,
    this.amount,
    this.isRecurring, // Add the new field to the constructor
    this.isoCurrencyCode,
    this.unofficialCurrencyCode,
    this.category,
    this.categoryId,
    this.checkNumber,
    this.date,
    this.datetime,
    this.authorizedDate,
    this.authorizedDatetime,
    this.location,
    this.name,
    this.merchantName,
    this.paymentMeta,
    this.paymentChannel,
    this.pending,
    this.pendingTransactionId,
    this.accountOwner,
    this.transactionId,
    this.transactionCode,
    this.transactionType,
    this.personalFinanceCategory,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    amount = double.tryParse('${json['amount']}');
    isRecurring = json['is_recurring']; // Parse the new field from JSON
    isoCurrencyCode = json['iso_currency_code'];
    unofficialCurrencyCode = json['unofficial_currency_code'];
    category = json['category'].cast<String>();
    categoryId = json['category_id'];
    checkNumber = json['check_number'];
    date = json['date'];
    datetime = json['datetime'];
    authorizedDate = json['authorized_date'];
    authorizedDatetime = json['authorized_datetime'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    name = json['name'];
    merchantName = json['merchant_name'];
    paymentMeta =
        json['payment_meta'] != null ? PaymentMeta.fromJson(json['payment_meta']) : null;
    paymentChannel = json['payment_channel'];
    pending = json['pending'];
    pendingTransactionId = json['pending_transaction_id'];
    accountOwner = json['account_owner'];
    transactionId = json['transaction_id'];
    transactionCode = json['transaction_code'];
    transactionType = json['transaction_type'];
    personalFinanceCategory = json['personal_finance_category'] != null
        ? '${json['personal_finance_category']['detailed']}'.toPersonalFinanceCategory()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['account_id'] = accountId;
    data['amount'] = amount;
    data['is_recurring'] = isRecurring; // Add the new field to the JSON output
    data['iso_currency_code'] = isoCurrencyCode;
    data['unofficial_currency_code'] = unofficialCurrencyCode;
    data['category'] = category;
    data['category_id'] = categoryId;
    data['check_number'] = checkNumber;
    data['date'] = date;
    data['datetime'] = datetime;
    data['authorized_date'] = authorizedDate;
    data['authorized_datetime'] = authorizedDatetime;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['name'] = name;
    data['merchant_name'] = merchantName;
    if (paymentMeta != null) {
      data['payment_meta'] = paymentMeta!.toJson();
    }
    data['payment_channel'] = paymentChannel;
    data['pending'] = pending;
    data['pending_transaction_id'] = pendingTransactionId;
    data['account_owner'] = accountOwner;
    data['transaction_id'] = transactionId;
    data['transaction_code'] = transactionCode;
    data['transaction_type'] = transactionType;
    if (personalFinanceCategory != null) {
      data['personal_finance_category'] = personalFinanceCategory!.toJson();
    }
    return data;
  }
}

class Location {
  String? address;
  String? city;
  String? region;
  String? postalCode;
  String? country;
  double? lat;
  double? lon;
  String? storeNumber;

  Location({
    this.address,
    this.city,
    this.region,
    this.postalCode,
    this.country,
    this.lat,
    this.lon,
    this.storeNumber,
  });

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    region = json['region'];
    postalCode = json['postal_code'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    storeNumber = json['store_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['address'] = address;
    data['city'] = city;
    data['region'] = region;
    data['postal_code'] = postalCode;
    data['country'] = country;
    data['lat'] = lat;
    data['lon'] = lon;
    data['store_number'] = storeNumber;
    return data;
  }
}

class PaymentMeta {
  dynamic byOrderOf;
  dynamic payee;
  dynamic payer;
  dynamic paymentMethod;
  dynamic paymentProcessor;
  dynamic ppdId;
  dynamic reason;
  dynamic referenceNumber;

  PaymentMeta({
    this.byOrderOf,
    this.payee,
    this.payer,
    this.paymentMethod,
    this.paymentProcessor,
    this.ppdId,
    this.reason,
    this.referenceNumber,
  });

  PaymentMeta.fromJson(Map<String, dynamic> json) {
    byOrderOf = json['by_order_of'];
    payee = json['payee'];
    payer = json['payer'];
    paymentMethod = json['payment_method'];
    paymentProcessor = json['payment_processor'];
    ppdId = json['ppd_id'];
    reason = json['reason'];
    referenceNumber = json['reference_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['by_order_of'] = byOrderOf;
    data['payee'] = payee;
    data['payer'] = payer;
    data['payment_method'] = paymentMethod;
    data['payment_processor'] = paymentProcessor;
    data['ppd_id'] = ppdId;
    data['reason'] = reason;
    data['reference_number'] = referenceNumber;
    return data;
  }
}
