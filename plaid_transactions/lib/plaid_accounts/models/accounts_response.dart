class AccountsResponse {
  List<Accounts>? accounts;
  Item? item;
  String? requestId;

  AccountsResponse({this.accounts, this.item, this.requestId});

  AccountsResponse.fromJson(Map<String, dynamic> json) {
    if (json['accounts'] != null) {
      accounts = <Accounts>[];
      json['accounts'].forEach((v) => accounts!.add(Accounts.fromJson(v)));
    }
    item = json['item'] != null ? Item.fromJson(json['item']) : null;
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (accounts != null) {
      data['accounts'] = accounts!.map((v) => v.toJson()).toList();
    }
    if (item != null) {
      data['item'] = item!.toJson();
    }
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
  String? consentExpirationTime;
  dynamic error;
  String? institutionId;
  String? itemId;
  dynamic optionalProducts;
  List<String>? products;
  String? updateType;
  String? webhook;

  Item({
    this.availableProducts,
    this.billedProducts,
    this.consentExpirationTime,
    this.error,
    this.institutionId,
    this.itemId,
    this.optionalProducts,
    this.products,
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
    optionalProducts = json['optional_products'];
    products = json['products'].cast<String>();
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
    data['optional_products'] = optionalProducts;
    data['products'] = products;
    data['update_type'] = updateType;
    data['webhook'] = webhook;
    return data;
  }
}
