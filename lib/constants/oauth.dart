const String clientId = '6yPuIvYI4mPGFLvbcFkfV41DmGKs';
// const String clientId = 'n3WusEPUDkAaxxC1DBLw3Uc2t8Wwv08P';
// const String clientSecret =
//     'fALcjrijeE7-w_iecI5Syeyc72WMqfJakb-Ie_ogTsqhtE2cYUz93XO8emeyDWMH';
const String clientSecret = '3347cc8c-e690-4ff7-b2f7-2a4934a4da4d';
const String authorizationEndpoint =
    'https://test-api.service.hmrc.gov.uk/oauth/authorize';
    // 'https://dev-e6j44177uf8fh6rd.us.auth0.com/authorize';
const String tokenEndpoint =
 'https://test-api.service.hmrc.gov.uk/oauth/token';
    // 'https://dev-e6j44177uf8fh6rd.us.auth0.com/oauth/token';
const String redirectUrl =
'flyn.hmrc.com.tax.app:/oauth2redirect';
    // 'https://dev-e6j44177uf8fh6rd.us.auth0.com/android/flyn.hmrc.com.tax.app/callback';
final List<String> scopes =
//  ["openid","profile","offline_access"];
['read:self-assessment'];
// ['openid'];
// ['read:employment'];
