// ignore_for_file: constant_identifier_names

enum PersonalFinanceCategory {
  INCOME_DIVIDENDS,
  INCOME_INTEREST_EARNED,
  INCOME_RETIREMENT_PENSION,
  INCOME_TAX_REFUND,
  INCOME_UNEMPLOYMENT,
  INCOME_WAGES,
  INCOME_OTHER_INCOME,
  TRANSFER_IN_CASH_ADVANCES_AND_LOANS,
  TRANSFER_IN_DEPOSIT,
  TRANSFER_IN_INVESTMENT_AND_RETIREMENT_FUNDS,
  TRANSFER_IN_SAVINGS,
  TRANSFER_IN_ACCOUNT_TRANSFER,
  TRANSFER_IN_OTHER_TRANSFER_IN,
  TRANSFER_OUT_INVESTMENT_AND_RETIREMENT_FUNDS,
  TRANSFER_OUT_SAVINGS,
  TRANSFER_OUT_WITHDRAWAL,
  TRANSFER_OUT_ACCOUNT_TRANSFER,
  TRANSFER_OUT_OTHER_TRANSFER_OUT,
  LOAN_PAYMENTS_CAR_PAYMENT,
  LOAN_PAYMENTS_CREDIT_CARD_PAYMENT,
  LOAN_PAYMENTS_PERSONAL_LOAN_PAYMENT,
  LOAN_PAYMENTS_MORTGAGE_PAYMENT,
  LOAN_PAYMENTS_STUDENT_LOAN_PAYMENT,
  LOAN_PAYMENTS_OTHER_PAYMENT,
  BANK_FEES_ATM_FEES,
  BANK_FEES_FOREIGN_TRANSACTION_FEES,
  BANK_FEES_INSUFFICIENT_FUNDS,
  BANK_FEES_INTEREST_CHARGE,
  BANK_FEES_OVERDRAFT_FEES,
  BANK_FEES_OTHER_BANK_FEES,
  ENTERTAINMENT_CASINOS_AND_GAMBLING,
  ENTERTAINMENT_MUSIC_AND_AUDIO,
  ENTERTAINMENT_SPORTING_EVENTS_AMUSEMENT_PARKS_AND_MUSEUMS,
  ENTERTAINMENT_TV_AND_MOVIES,
  ENTERTAINMENT_VIDEO_GAMES,
  ENTERTAINMENT_OTHER_ENTERTAINMENT,
  FOOD_AND_DRINK_BEER_WINE_AND_LIQUOR,
  FOOD_AND_DRINK_COFFEE,
  FOOD_AND_DRINK_FAST_FOOD,
  FOOD_AND_DRINK_GROCERIES,
  FOOD_AND_DRINK_RESTAURANT,
  FOOD_AND_DRINK_VENDING_MACHINES,
  FOOD_AND_DRINK_OTHER_FOOD_AND_DRINK,
  GENERAL_MERCHANDISE_BOOKSTORES_AND_NEWSSTANDS,
  GENERAL_MERCHANDISE_CLOTHING_AND_ACCESSORIES,
  GENERAL_MERCHANDISE_CONVENIENCE_STORES,
  GENERAL_MERCHANDISE_DEPARTMENT_STORES,
  GENERAL_MERCHANDISE_DISCOUNT_STORES,
  GENERAL_MERCHANDISE_ELECTRONICS,
  GENERAL_MERCHANDISE_GIFTS_AND_NOVELTIES,
  GENERAL_MERCHANDISE_OFFICE_SUPPLIES,
  GENERAL_MERCHANDISE_ONLINE_MARKETPLACES,
  GENERAL_MERCHANDISE_PET_SUPPLIES,
  GENERAL_MERCHANDISE_SPORTING_GOODS,
  GENERAL_MERCHANDISE_SUPERSTORES,
  GENERAL_MERCHANDISE_TOBACCO_AND_VAPE,
  GENERAL_MERCHANDISE_OTHER_GENERAL_MERCHANDISE,
  HOME_IMPROVEMENT_FURNITURE,
  HOME_IMPROVEMENT_HARDWARE,
  HOME_IMPROVEMENT_REPAIR_AND_MAINTENANCE,
  HOME_IMPROVEMENT_SECURITY,
  HOME_IMPROVEMENT_OTHER_HOME_IMPROVEMENT,
  MEDICAL_DENTAL_CARE,
  MEDICAL_EYE_CARE,
  MEDICAL_NURSING_CARE,
  MEDICAL_PHARMACIES_AND_SUPPLEMENTS,
  MEDICAL_PRIMARY_CARE,
  MEDICAL_VETERINARY_SERVICES,
  MEDICAL_OTHER_MEDICAL,
  PERSONAL_CARE_GYMS_AND_FITNESS_CENTERS,
  PERSONAL_CARE_HAIR_AND_BEAUTY,
  PERSONAL_CARE_LAUNDRY_AND_DRY_CLEANING,
  PERSONAL_CARE_OTHER_PERSONAL_CARE,
  GENERAL_SERVICES_ACCOUNTING_AND_FINANCIAL_PLANNING,
  GENERAL_SERVICES_AUTOMOTIVE,
  GENERAL_SERVICES_CHILDCARE,
  GENERAL_SERVICES_CONSULTING_AND_LEGAL,
  GENERAL_SERVICES_EDUCATION,
  GENERAL_SERVICES_INSURANCE,
  GENERAL_SERVICES_POSTAGE_AND_SHIPPING,
  GENERAL_SERVICES_STORAGE,
  GENERAL_SERVICES_OTHER_GENERAL_SERVICES,
  GOVERNMENT_AND_NON_PROFIT_DONATIONS,
  GOVERNMENT_AND_NON_PROFIT_GOVERNMENT_DEPARTMENTS_AND_AGENCIES,
  GOVERNMENT_AND_NON_PROFIT_TAX_PAYMENT,
  GOVERNMENT_AND_NON_PROFIT_OTHER_GOVERNMENT_AND_NON_PROFIT,
  TRANSPORTATION_BIKES_AND_SCOOTERS,
  TRANSPORTATION_GAS,
  TRANSPORTATION_PARKING,
  TRANSPORTATION_PUBLIC_TRANSIT,
  TRANSPORTATION_TAXIS_AND_RIDE_SHARES,
  TRANSPORTATION_TOLLS,
  TRANSPORTATION_OTHER_TRANSPORTATION,
  TRAVEL_FLIGHTS,
  TRAVEL_LODGING,
  TRAVEL_RENTAL_CARS,
  TRAVEL_OTHER_TRAVEL,
  RENT_AND_UTILITIES_GAS_AND_ELECTRICITY,
  RENT_AND_UTILITIES_INTERNET_AND_CABLE,
  RENT_AND_UTILITIES_RENT,
  RENT_AND_UTILITIES_SEWAGE_AND_WASTE_MANAGEMENT,
  RENT_AND_UTILITIES_TELEPHONE,
  RENT_AND_UTILITIES_WATER,
  RENT_AND_UTILITIES_OTHER_UTILITIES,
}

extension PersonalFinanceCategoryExt on PersonalFinanceCategory {
  String get title {
    var result = name.replaceAll('_', ' ').toLowerCase();
    result = result[0].toUpperCase() + result.substring(1);
    return result;
  }

  String get primary {
    switch (this) {
      case PersonalFinanceCategory.INCOME_DIVIDENDS:
        return 'INCOME';
      case PersonalFinanceCategory.INCOME_INTEREST_EARNED:
        return 'INCOME';
      case PersonalFinanceCategory.INCOME_RETIREMENT_PENSION:
        return 'INCOME';
      case PersonalFinanceCategory.INCOME_TAX_REFUND:
        return 'INCOME';
      case PersonalFinanceCategory.INCOME_UNEMPLOYMENT:
        return 'INCOME';
      case PersonalFinanceCategory.INCOME_WAGES:
        return 'INCOME';
      case PersonalFinanceCategory.INCOME_OTHER_INCOME:
        return 'INCOME';
      case PersonalFinanceCategory.TRANSFER_IN_CASH_ADVANCES_AND_LOANS:
        return 'TRANSFER_IN';
      case PersonalFinanceCategory.TRANSFER_IN_DEPOSIT:
        return 'TRANSFER_IN';
      case PersonalFinanceCategory.TRANSFER_IN_INVESTMENT_AND_RETIREMENT_FUNDS:
        return 'TRANSFER_IN';
      case PersonalFinanceCategory.TRANSFER_IN_SAVINGS:
        return 'TRANSFER_IN';
      case PersonalFinanceCategory.TRANSFER_IN_ACCOUNT_TRANSFER:
        return 'TRANSFER_IN';
      case PersonalFinanceCategory.TRANSFER_IN_OTHER_TRANSFER_IN:
        return 'TRANSFER_IN';
      case PersonalFinanceCategory.TRANSFER_OUT_INVESTMENT_AND_RETIREMENT_FUNDS:
        return 'TRANSFER_OUT';
      case PersonalFinanceCategory.TRANSFER_OUT_SAVINGS:
        return 'TRANSFER_OUT';
      case PersonalFinanceCategory.TRANSFER_OUT_WITHDRAWAL:
        return 'TRANSFER_OUT';
      case PersonalFinanceCategory.TRANSFER_OUT_ACCOUNT_TRANSFER:
        return 'TRANSFER_OUT';
      case PersonalFinanceCategory.TRANSFER_OUT_OTHER_TRANSFER_OUT:
        return 'TRANSFER_OUT';
      case PersonalFinanceCategory.LOAN_PAYMENTS_CAR_PAYMENT:
        return 'LOAN_PAYMENTS';
      case PersonalFinanceCategory.LOAN_PAYMENTS_CREDIT_CARD_PAYMENT:
        return 'LOAN_PAYMENTS';
      case PersonalFinanceCategory.LOAN_PAYMENTS_PERSONAL_LOAN_PAYMENT:
        return 'LOAN_PAYMENTS';
      case PersonalFinanceCategory.LOAN_PAYMENTS_MORTGAGE_PAYMENT:
        return 'LOAN_PAYMENTS';
      case PersonalFinanceCategory.LOAN_PAYMENTS_STUDENT_LOAN_PAYMENT:
        return 'LOAN_PAYMENTS';
      case PersonalFinanceCategory.LOAN_PAYMENTS_OTHER_PAYMENT:
        return 'LOAN_PAYMENTS';
      case PersonalFinanceCategory.BANK_FEES_ATM_FEES:
        return 'BANK_FEES';
      case PersonalFinanceCategory.BANK_FEES_FOREIGN_TRANSACTION_FEES:
        return 'BANK_FEES';
      case PersonalFinanceCategory.BANK_FEES_INSUFFICIENT_FUNDS:
        return 'BANK_FEES';
      case PersonalFinanceCategory.BANK_FEES_INTEREST_CHARGE:
        return 'BANK_FEES';
      case PersonalFinanceCategory.BANK_FEES_OVERDRAFT_FEES:
        return 'BANK_FEES';
      case PersonalFinanceCategory.BANK_FEES_OTHER_BANK_FEES:
        return 'BANK_FEES';
      case PersonalFinanceCategory.ENTERTAINMENT_CASINOS_AND_GAMBLING:
        return 'ENTERTAINMENT';
      case PersonalFinanceCategory.ENTERTAINMENT_MUSIC_AND_AUDIO:
        return 'ENTERTAINMENT';
      case PersonalFinanceCategory
          .ENTERTAINMENT_SPORTING_EVENTS_AMUSEMENT_PARKS_AND_MUSEUMS:
        return 'ENTERTAINMENT';
      case PersonalFinanceCategory.ENTERTAINMENT_TV_AND_MOVIES:
        return 'ENTERTAINMENT';
      case PersonalFinanceCategory.ENTERTAINMENT_VIDEO_GAMES:
        return 'ENTERTAINMENT';
      case PersonalFinanceCategory.ENTERTAINMENT_OTHER_ENTERTAINMENT:
        return 'ENTERTAINMENT';
      case PersonalFinanceCategory.FOOD_AND_DRINK_BEER_WINE_AND_LIQUOR:
        return 'FOOD_AND_DRINK';
      case PersonalFinanceCategory.FOOD_AND_DRINK_COFFEE:
        return 'FOOD_AND_DRINK';
      case PersonalFinanceCategory.FOOD_AND_DRINK_FAST_FOOD:
        return 'FOOD_AND_DRINK';
      case PersonalFinanceCategory.FOOD_AND_DRINK_GROCERIES:
        return 'FOOD_AND_DRINK';
      case PersonalFinanceCategory.FOOD_AND_DRINK_RESTAURANT:
        return 'FOOD_AND_DRINK';
      case PersonalFinanceCategory.FOOD_AND_DRINK_VENDING_MACHINES:
        return 'FOOD_AND_DRINK';
      case PersonalFinanceCategory.FOOD_AND_DRINK_OTHER_FOOD_AND_DRINK:
        return 'FOOD_AND_DRINK';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_BOOKSTORES_AND_NEWSSTANDS:
        return 'GENERAL_MERCHANDISE';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_CLOTHING_AND_ACCESSORIES:
        return 'GENERAL_MERCHANDISE';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_CONVENIENCE_STORES:
        return 'GENERAL_MERCHANDISE';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_DEPARTMENT_STORES:
        return 'GENERAL_MERCHANDISE';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_DISCOUNT_STORES:
        return 'GENERAL_MERCHANDISE';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_ELECTRONICS:
        return 'GENERAL_MERCHANDISE';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_GIFTS_AND_NOVELTIES:
        return 'GENERAL_MERCHANDISE';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_OFFICE_SUPPLIES:
        return 'GENERAL_MERCHANDISE';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_ONLINE_MARKETPLACES:
        return 'GENERAL_MERCHANDISE';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_PET_SUPPLIES:
        return 'GENERAL_MERCHANDISE';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_SPORTING_GOODS:
        return 'GENERAL_MERCHANDISE';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_SUPERSTORES:
        return 'GENERAL_MERCHANDISE';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_TOBACCO_AND_VAPE:
        return 'GENERAL_MERCHANDISE';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_OTHER_GENERAL_MERCHANDISE:
        return 'GENERAL_MERCHANDISE';
      case PersonalFinanceCategory.HOME_IMPROVEMENT_FURNITURE:
        return 'HOME_IMPROVEMENT';
      case PersonalFinanceCategory.HOME_IMPROVEMENT_HARDWARE:
        return 'HOME_IMPROVEMENT';
      case PersonalFinanceCategory.HOME_IMPROVEMENT_REPAIR_AND_MAINTENANCE:
        return 'HOME_IMPROVEMENT';
      case PersonalFinanceCategory.HOME_IMPROVEMENT_SECURITY:
        return 'HOME_IMPROVEMENT';
      case PersonalFinanceCategory.HOME_IMPROVEMENT_OTHER_HOME_IMPROVEMENT:
        return 'HOME_IMPROVEMENT';
      case PersonalFinanceCategory.MEDICAL_DENTAL_CARE:
        return 'MEDICAL';
      case PersonalFinanceCategory.MEDICAL_EYE_CARE:
        return 'MEDICAL';
      case PersonalFinanceCategory.MEDICAL_NURSING_CARE:
        return 'MEDICAL';
      case PersonalFinanceCategory.MEDICAL_PHARMACIES_AND_SUPPLEMENTS:
        return 'MEDICAL';
      case PersonalFinanceCategory.MEDICAL_PRIMARY_CARE:
        return 'MEDICAL';
      case PersonalFinanceCategory.MEDICAL_VETERINARY_SERVICES:
        return 'MEDICAL';
      case PersonalFinanceCategory.MEDICAL_OTHER_MEDICAL:
        return 'MEDICAL';
      case PersonalFinanceCategory.PERSONAL_CARE_GYMS_AND_FITNESS_CENTERS:
        return 'PERSONAL_CARE';
      case PersonalFinanceCategory.PERSONAL_CARE_HAIR_AND_BEAUTY:
        return 'PERSONAL_CARE';
      case PersonalFinanceCategory.PERSONAL_CARE_LAUNDRY_AND_DRY_CLEANING:
        return 'PERSONAL_CARE';
      case PersonalFinanceCategory.PERSONAL_CARE_OTHER_PERSONAL_CARE:
        return 'PERSONAL_CARE';
      case PersonalFinanceCategory.GENERAL_SERVICES_ACCOUNTING_AND_FINANCIAL_PLANNING:
        return 'GENERAL_SERVICES';
      case PersonalFinanceCategory.GENERAL_SERVICES_AUTOMOTIVE:
        return 'GENERAL_SERVICES';
      case PersonalFinanceCategory.GENERAL_SERVICES_CHILDCARE:
        return 'GENERAL_SERVICES';
      case PersonalFinanceCategory.GENERAL_SERVICES_CONSULTING_AND_LEGAL:
        return 'GENERAL_SERVICES';
      case PersonalFinanceCategory.GENERAL_SERVICES_EDUCATION:
        return 'GENERAL_SERVICES';
      case PersonalFinanceCategory.GENERAL_SERVICES_INSURANCE:
        return 'GENERAL_SERVICES';
      case PersonalFinanceCategory.GENERAL_SERVICES_POSTAGE_AND_SHIPPING:
        return 'GENERAL_SERVICES';
      case PersonalFinanceCategory.GENERAL_SERVICES_STORAGE:
        return 'GENERAL_SERVICES';
      case PersonalFinanceCategory.GENERAL_SERVICES_OTHER_GENERAL_SERVICES:
        return 'GENERAL_SERVICES';
      case PersonalFinanceCategory.GOVERNMENT_AND_NON_PROFIT_DONATIONS:
        return 'GOVERNMENT_AND_NON_PROFIT';
      case PersonalFinanceCategory
          .GOVERNMENT_AND_NON_PROFIT_GOVERNMENT_DEPARTMENTS_AND_AGENCIES:
        return 'GOVERNMENT_AND_NON_PROFIT';
      case PersonalFinanceCategory.GOVERNMENT_AND_NON_PROFIT_TAX_PAYMENT:
        return 'GOVERNMENT_AND_NON_PROFIT';
      case PersonalFinanceCategory
          .GOVERNMENT_AND_NON_PROFIT_OTHER_GOVERNMENT_AND_NON_PROFIT:
        return 'GOVERNMENT_AND_NON_PROFIT';
      case PersonalFinanceCategory.TRANSPORTATION_BIKES_AND_SCOOTERS:
        return 'TRANSPORTATION';
      case PersonalFinanceCategory.TRANSPORTATION_GAS:
        return 'TRANSPORTATION';
      case PersonalFinanceCategory.TRANSPORTATION_PARKING:
        return 'TRANSPORTATION';
      case PersonalFinanceCategory.TRANSPORTATION_PUBLIC_TRANSIT:
        return 'TRANSPORTATION';
      case PersonalFinanceCategory.TRANSPORTATION_TAXIS_AND_RIDE_SHARES:
        return 'TRANSPORTATION';
      case PersonalFinanceCategory.TRANSPORTATION_TOLLS:
        return 'TRANSPORTATION';
      case PersonalFinanceCategory.TRANSPORTATION_OTHER_TRANSPORTATION:
        return 'TRANSPORTATION';
      case PersonalFinanceCategory.TRAVEL_FLIGHTS:
        return 'TRAVEL';
      case PersonalFinanceCategory.TRAVEL_LODGING:
        return 'TRAVEL';
      case PersonalFinanceCategory.TRAVEL_RENTAL_CARS:
        return 'TRAVEL';
      case PersonalFinanceCategory.TRAVEL_OTHER_TRAVEL:
        return 'TRAVEL';
      case PersonalFinanceCategory.RENT_AND_UTILITIES_GAS_AND_ELECTRICITY:
        return 'RENT_AND_UTILITIES';
      case PersonalFinanceCategory.RENT_AND_UTILITIES_INTERNET_AND_CABLE:
        return 'RENT_AND_UTILITIES';
      case PersonalFinanceCategory.RENT_AND_UTILITIES_RENT:
        return 'RENT_AND_UTILITIES';
      case PersonalFinanceCategory.RENT_AND_UTILITIES_SEWAGE_AND_WASTE_MANAGEMENT:
        return 'RENT_AND_UTILITIES';
      case PersonalFinanceCategory.RENT_AND_UTILITIES_TELEPHONE:
        return 'RENT_AND_UTILITIES';
      case PersonalFinanceCategory.RENT_AND_UTILITIES_WATER:
        return 'RENT_AND_UTILITIES';
      case PersonalFinanceCategory.RENT_AND_UTILITIES_OTHER_UTILITIES:
        return 'RENT_AND_UTILITIES';
    }
  }

  String get description {
    switch (this) {
      case PersonalFinanceCategory.INCOME_DIVIDENDS:
        return 'Dividends from investment accounts';
      case PersonalFinanceCategory.INCOME_INTEREST_EARNED:
        return 'Income from interest on savings accounts';
      case PersonalFinanceCategory.INCOME_RETIREMENT_PENSION:
        return 'Income from pension payments';
      case PersonalFinanceCategory.INCOME_TAX_REFUND:
        return 'Income from tax refunds';
      case PersonalFinanceCategory.INCOME_UNEMPLOYMENT:
        return 'Income from unemployment benefits, including unemployment insurance and healthcare';
      case PersonalFinanceCategory.INCOME_WAGES:
        return 'Income from salaries, gig-economy work, and tips earned';
      case PersonalFinanceCategory.INCOME_OTHER_INCOME:
        return 'Other miscellaneous income, including alimony, social security, child support, and rental';
      case PersonalFinanceCategory.TRANSFER_IN_CASH_ADVANCES_AND_LOANS:
        return 'Loans and cash advances deposited into a bank account';
      case PersonalFinanceCategory.TRANSFER_IN_DEPOSIT:
        return 'Cash, checks, and ATM deposits into a bank account';
      case PersonalFinanceCategory.TRANSFER_IN_INVESTMENT_AND_RETIREMENT_FUNDS:
        return 'Inbound transfers to an investment or retirement account';
      case PersonalFinanceCategory.TRANSFER_IN_SAVINGS:
        return 'Inbound transfers to a savings account';
      case PersonalFinanceCategory.TRANSFER_IN_ACCOUNT_TRANSFER:
        return 'General inbound transfers from another account';
      case PersonalFinanceCategory.TRANSFER_IN_OTHER_TRANSFER_IN:
        return 'Other miscellaneous inbound transactions';
      case PersonalFinanceCategory.TRANSFER_OUT_INVESTMENT_AND_RETIREMENT_FUNDS:
        return 'Transfers to an investment or retirement account, including investment apps such as Acorns, Betterment';
      case PersonalFinanceCategory.TRANSFER_OUT_SAVINGS:
        return 'Outbound transfers to savings accounts';
      case PersonalFinanceCategory.TRANSFER_OUT_WITHDRAWAL:
        return 'Withdrawals from a bank account';
      case PersonalFinanceCategory.TRANSFER_OUT_ACCOUNT_TRANSFER:
        return 'General outbound transfers to another account';
      case PersonalFinanceCategory.TRANSFER_OUT_OTHER_TRANSFER_OUT:
        return 'Other miscellaneous outbound transactions';
      case PersonalFinanceCategory.LOAN_PAYMENTS_CAR_PAYMENT:
        return 'Car loans and leases';
      case PersonalFinanceCategory.LOAN_PAYMENTS_CREDIT_CARD_PAYMENT:
        return 'Payments to a credit card. These are positive amounts for credit card subtypes and negative for depository subtypes';
      case PersonalFinanceCategory.LOAN_PAYMENTS_PERSONAL_LOAN_PAYMENT:
        return 'Personal loans, including cash advances and buy now pay later repayments';
      case PersonalFinanceCategory.LOAN_PAYMENTS_MORTGAGE_PAYMENT:
        return 'Payments on mortgages';
      case PersonalFinanceCategory.LOAN_PAYMENTS_STUDENT_LOAN_PAYMENT:
        return 'Payments on student loans. For college tuition, refer to "General Services - Education"';
      case PersonalFinanceCategory.LOAN_PAYMENTS_OTHER_PAYMENT:
        return 'Other miscellaneous debt payments';
      case PersonalFinanceCategory.BANK_FEES_ATM_FEES:
        return 'Fees incurred for out-of-network ATMs';
      case PersonalFinanceCategory.BANK_FEES_FOREIGN_TRANSACTION_FEES:
        return 'Fees incurred on non-domestic transactions';
      case PersonalFinanceCategory.BANK_FEES_INSUFFICIENT_FUNDS:
        return 'Fees relating to insufficient funds';
      case PersonalFinanceCategory.BANK_FEES_INTEREST_CHARGE:
        return 'Fees incurred for interest on purchases, including not-paid-in-full or interest on cash advances';
      case PersonalFinanceCategory.BANK_FEES_OVERDRAFT_FEES:
        return 'Fees incurred when an account is in overdraft';
      case PersonalFinanceCategory.BANK_FEES_OTHER_BANK_FEES:
        return 'Other miscellaneous bank fees';
      case PersonalFinanceCategory.ENTERTAINMENT_CASINOS_AND_GAMBLING:
        return 'Gambling, casinos, and sports betting';
      case PersonalFinanceCategory.ENTERTAINMENT_MUSIC_AND_AUDIO:
        return 'Digital and in-person music purchases, including music streaming services';
      case PersonalFinanceCategory
          .ENTERTAINMENT_SPORTING_EVENTS_AMUSEMENT_PARKS_AND_MUSEUMS:
        return 'Purchases made at sporting events, music venues, concerts, museums, and amusement parks';
      case PersonalFinanceCategory.ENTERTAINMENT_TV_AND_MOVIES:
        return 'In home movie streaming services and movie theaters';
      case PersonalFinanceCategory.ENTERTAINMENT_VIDEO_GAMES:
        return 'Digital and in-person video game purchases';
      case PersonalFinanceCategory.ENTERTAINMENT_OTHER_ENTERTAINMENT:
        return 'Other miscellaneous entertainment purchases, including night life and adult entertainment';
      case PersonalFinanceCategory.FOOD_AND_DRINK_BEER_WINE_AND_LIQUOR:
        return 'Beer, Wine & Liquor Stores';
      case PersonalFinanceCategory.FOOD_AND_DRINK_COFFEE:
        return 'Purchases at coffee shops or cafes';
      case PersonalFinanceCategory.FOOD_AND_DRINK_FAST_FOOD:
        return 'Dining expenses for fast food chains';
      case PersonalFinanceCategory.FOOD_AND_DRINK_GROCERIES:
        return 'Purchases for fresh produce and groceries, including farmers\' markets';
      case PersonalFinanceCategory.FOOD_AND_DRINK_RESTAURANT:
        return 'Dining expenses for restaurants, bars, gastropubs, and diners';
      case PersonalFinanceCategory.FOOD_AND_DRINK_VENDING_MACHINES:
        return 'Purchases made at vending machine operators';
      case PersonalFinanceCategory.FOOD_AND_DRINK_OTHER_FOOD_AND_DRINK:
        return 'Other miscellaneous food and drink, including desserts, juice bars, and delis';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_BOOKSTORES_AND_NEWSSTANDS:
        return 'Books, magazines, and news ';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_CLOTHING_AND_ACCESSORIES:
        return 'Apparel, shoes, and jewelry';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_CONVENIENCE_STORES:
        return 'Purchases at convenience stores';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_DEPARTMENT_STORES:
        return 'Retail stores with wide ranges of consumer goods, typically specializing in clothing and home goods';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_DISCOUNT_STORES:
        return 'Stores selling goods at a discounted price';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_ELECTRONICS:
        return 'Electronics stores and websites';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_GIFTS_AND_NOVELTIES:
        return 'Photo, gifts, cards, and floral stores';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_OFFICE_SUPPLIES:
        return 'Stores that specialize in office goods';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_ONLINE_MARKETPLACES:
        return 'Multi-purpose e-commerce platforms such as Etsy, Ebay and Amazon';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_PET_SUPPLIES:
        return 'Pet supplies and pet food';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_SPORTING_GOODS:
        return 'Sporting goods, camping gear, and outdoor equipment';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_SUPERSTORES:
        return 'Superstores such as Target and Walmart, selling both groceries and general merchandise';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_TOBACCO_AND_VAPE:
        return 'Purchases for tobacco and vaping products';
      case PersonalFinanceCategory.GENERAL_MERCHANDISE_OTHER_GENERAL_MERCHANDISE:
        return 'Other miscellaneous merchandise, including toys, hobbies, and arts and crafts';
      case PersonalFinanceCategory.HOME_IMPROVEMENT_FURNITURE:
        return 'Furniture, bedding, and home accessories';
      case PersonalFinanceCategory.HOME_IMPROVEMENT_HARDWARE:
        return 'Building materials, hardware stores, paint, and wallpaper';
      case PersonalFinanceCategory.HOME_IMPROVEMENT_REPAIR_AND_MAINTENANCE:
        return 'Plumbing, lighting, gardening, and roofing';
      case PersonalFinanceCategory.HOME_IMPROVEMENT_SECURITY:
        return 'Home security system purchases';
      case PersonalFinanceCategory.HOME_IMPROVEMENT_OTHER_HOME_IMPROVEMENT:
        return 'Other miscellaneous home purchases, including pool installation and pest control';
      case PersonalFinanceCategory.MEDICAL_DENTAL_CARE:
        return 'Dentists and general dental care';
      case PersonalFinanceCategory.MEDICAL_EYE_CARE:
        return 'Optometrists, contacts, and glasses stores';
      case PersonalFinanceCategory.MEDICAL_NURSING_CARE:
        return 'Nursing care and facilities';
      case PersonalFinanceCategory.MEDICAL_PHARMACIES_AND_SUPPLEMENTS:
        return 'Pharmacies and nutrition shops';
      case PersonalFinanceCategory.MEDICAL_PRIMARY_CARE:
        return 'Doctors and physicians';
      case PersonalFinanceCategory.MEDICAL_VETERINARY_SERVICES:
        return 'Prevention and care procedures for animals';
      case PersonalFinanceCategory.MEDICAL_OTHER_MEDICAL:
        return 'Other miscellaneous medical, including blood work, hospitals, and ambulances';
      case PersonalFinanceCategory.PERSONAL_CARE_GYMS_AND_FITNESS_CENTERS:
        return 'Gyms, fitness centers, and workout classes';
      case PersonalFinanceCategory.PERSONAL_CARE_HAIR_AND_BEAUTY:
        return 'Manicures, haircuts, waxing, spa/massages, and bath and beauty products ';
      case PersonalFinanceCategory.PERSONAL_CARE_LAUNDRY_AND_DRY_CLEANING:
        return 'Wash and fold, and dry cleaning expenses';
      case PersonalFinanceCategory.PERSONAL_CARE_OTHER_PERSONAL_CARE:
        return 'Other miscellaneous personal care, including mental health apps and services';
      case PersonalFinanceCategory.GENERAL_SERVICES_ACCOUNTING_AND_FINANCIAL_PLANNING:
        return 'Financial planning, and tax and accounting services';
      case PersonalFinanceCategory.GENERAL_SERVICES_AUTOMOTIVE:
        return 'Oil changes, car washes, repairs, and towing';
      case PersonalFinanceCategory.GENERAL_SERVICES_CHILDCARE:
        return 'Babysitters and daycare';
      case PersonalFinanceCategory.GENERAL_SERVICES_CONSULTING_AND_LEGAL:
        return 'Consulting and legal services';
      case PersonalFinanceCategory.GENERAL_SERVICES_EDUCATION:
        return 'Elementary, high school, professional schools, and college tuition';
      case PersonalFinanceCategory.GENERAL_SERVICES_INSURANCE:
        return 'Insurance for auto, home, and healthcare';
      case PersonalFinanceCategory.GENERAL_SERVICES_POSTAGE_AND_SHIPPING:
        return 'Mail, packaging, and shipping services';
      case PersonalFinanceCategory.GENERAL_SERVICES_STORAGE:
        return 'Storage services and facilities';
      case PersonalFinanceCategory.GENERAL_SERVICES_OTHER_GENERAL_SERVICES:
        return 'Other miscellaneous services, including advertising and cloud storage ';
      case PersonalFinanceCategory.GOVERNMENT_AND_NON_PROFIT_DONATIONS:
        return 'Charitable, political, and religious donations';
      case PersonalFinanceCategory
          .GOVERNMENT_AND_NON_PROFIT_GOVERNMENT_DEPARTMENTS_AND_AGENCIES:
        return 'Government departments and agencies, such as driving licences, and passport renewal';
      case PersonalFinanceCategory.GOVERNMENT_AND_NON_PROFIT_TAX_PAYMENT:
        return 'Tax payments, including income and property taxes';
      case PersonalFinanceCategory
          .GOVERNMENT_AND_NON_PROFIT_OTHER_GOVERNMENT_AND_NON_PROFIT:
        return 'Other miscellaneous government and non-profit agencies';
      case PersonalFinanceCategory.TRANSPORTATION_BIKES_AND_SCOOTERS:
        return 'Bike and scooter rentals';
      case PersonalFinanceCategory.TRANSPORTATION_GAS:
        return 'Purchases at a gas station';
      case PersonalFinanceCategory.TRANSPORTATION_PARKING:
        return 'Parking fees and expenses';
      case PersonalFinanceCategory.TRANSPORTATION_PUBLIC_TRANSIT:
        return 'Public transportation, including rail and train, buses, and metro';
      case PersonalFinanceCategory.TRANSPORTATION_TAXIS_AND_RIDE_SHARES:
        return 'Taxi and ride share services';
      case PersonalFinanceCategory.TRANSPORTATION_TOLLS:
        return 'Toll expenses';
      case PersonalFinanceCategory.TRANSPORTATION_OTHER_TRANSPORTATION:
        return 'Other miscellaneous transportation expenses';
      case PersonalFinanceCategory.TRAVEL_FLIGHTS:
        return 'Airline expenses';
      case PersonalFinanceCategory.TRAVEL_LODGING:
        return 'Hotels, motels, and hosted accommodation such as Airbnb';
      case PersonalFinanceCategory.TRAVEL_RENTAL_CARS:
        return 'Rental cars, charter buses, and trucks';
      case PersonalFinanceCategory.TRAVEL_OTHER_TRAVEL:
        return 'Other miscellaneous travel expenses';
      case PersonalFinanceCategory.RENT_AND_UTILITIES_GAS_AND_ELECTRICITY:
        return 'Gas and electricity bills';
      case PersonalFinanceCategory.RENT_AND_UTILITIES_INTERNET_AND_CABLE:
        return 'Internet and cable bills';
      case PersonalFinanceCategory.RENT_AND_UTILITIES_RENT:
        return 'Rent payment';
      case PersonalFinanceCategory.RENT_AND_UTILITIES_SEWAGE_AND_WASTE_MANAGEMENT:
        return 'Sewage and garbage disposal bills';
      case PersonalFinanceCategory.RENT_AND_UTILITIES_TELEPHONE:
        return 'Cell phone bills';
      case PersonalFinanceCategory.RENT_AND_UTILITIES_WATER:
        return 'Water bills';
      case PersonalFinanceCategory.RENT_AND_UTILITIES_OTHER_UTILITIES:
        return 'Other miscellaneous utility bills';
    }
  }

  // Categories in this list will determine whether to show the transactions under Income or Expense.
  // Add category in this list to consider the transaction as Income and the transations with
  // categories that are not in this list will be considered as Expense.
  static const _incomeCategories = [
    PersonalFinanceCategory.INCOME_DIVIDENDS,
    PersonalFinanceCategory.INCOME_INTEREST_EARNED,
    PersonalFinanceCategory.INCOME_RETIREMENT_PENSION,
    PersonalFinanceCategory.INCOME_TAX_REFUND,
    PersonalFinanceCategory.INCOME_UNEMPLOYMENT,
    PersonalFinanceCategory.INCOME_WAGES,
    PersonalFinanceCategory.INCOME_OTHER_INCOME,
  ];

  // Categories in this list will further categorize an Expense as 'Tax Saving Allowable Expense'
  static const _allowableExpenseCategories = [
    PersonalFinanceCategory.GENERAL_MERCHANDISE_OFFICE_SUPPLIES,
    PersonalFinanceCategory.TRANSPORTATION_BIKES_AND_SCOOTERS,
    PersonalFinanceCategory.TRANSPORTATION_GAS,
    PersonalFinanceCategory.TRANSPORTATION_PARKING,
    PersonalFinanceCategory.TRANSPORTATION_PUBLIC_TRANSIT,
    PersonalFinanceCategory.TRANSPORTATION_TAXIS_AND_RIDE_SHARES,
    PersonalFinanceCategory.TRANSPORTATION_TOLLS,
    PersonalFinanceCategory.TRANSPORTATION_OTHER_TRANSPORTATION,
    PersonalFinanceCategory.TRAVEL_FLIGHTS,
    PersonalFinanceCategory.TRAVEL_LODGING,
    PersonalFinanceCategory.TRAVEL_RENTAL_CARS,
    PersonalFinanceCategory.TRAVEL_OTHER_TRAVEL,
  ];

  bool get isIncome => _incomeCategories.contains(this);

  bool get isAllowableExpense => _allowableExpenseCategories.contains(this);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['detailed'] = name;
    data['primary'] = primary;
    return data;
  }
}

extension ToPersonalFinanceCategory on String? {
  PersonalFinanceCategory? toPersonalFinanceCategory() {
    try {
      return PersonalFinanceCategory.values.firstWhere((value) => this == value.name);
    } catch (e) {
      return null;
    }
  }
}
