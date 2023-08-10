import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tax/constants/oauth.dart';
import 'package:tax/pages/home/home.dart';
import 'package:tax/services/local_data_saver.dart';

class AuthCtrl extends GetxController {
  final FlutterAppAuth appAuth = const FlutterAppAuth();
  RxBool isLoading = false.obs;

//LOGIN AUTH OR SIGNUP
  Future<void> login() async {
    isLoading.value = true;
    try {
      final result = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientId,
          redirectUrl,
          clientSecret: clientSecret,
          serviceConfiguration: const AuthorizationServiceConfiguration(
            authorizationEndpoint: authorizationEndpoint,
            tokenEndpoint: tokenEndpoint,
          ),
          scopes: ['openid'],
        ),
      );
      if (result != null) {
        Logger().t(result);
        saveUserTokens(result);
      } else {
        Get.snackbar("null", "message",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
      isLoading.value = false;
    } catch (e) {
      Logger().t(e.toString());
      isLoading.value = false;

      Get.snackbar("error", "message",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  //SAVE USER TOKEN
  Future<void> saveUserTokens(TokenResponse result) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      //SAVE ACCESS TOKEN
      prefs.setString(AppLocalDataSaver.accesstoken, result.accessToken!);
      //SAVE ID TOKEN
      prefs.setString(AppLocalDataSaver.idtoken, result.idToken!);
      //SAVE REFRESH TOKEN
      prefs.setString(AppLocalDataSaver.refreshToken, result.refreshToken!);
      //SAVE LOGIN BOOLEAN
      prefs.setBool(AppLocalDataSaver.userLogin, true);

      Get.off(HomeScreen());
    } catch (e) {
      // ignore: deprecated_member_use
      Logger().v(e.toString());
    }
  }

//LOGOUT
  Future<void> logout() async {
    try {
      await appAuth.endSession(EndSessionRequest(
        idTokenHint:
            await (AppLocalDataSaver.getString(AppLocalDataSaver.idtoken)),
        postLogoutRedirectUrl: redirectUrl,
        serviceConfiguration: const AuthorizationServiceConfiguration(
          authorizationEndpoint: authorizationEndpoint,
          tokenEndpoint: tokenEndpoint,
        ),
        // Clear any saved tokens and navigate to the login screen.
        // Example: SharedPreferences or other storage clearing logic.
      ));
    } catch (e) {
      // ignore: deprecated_member_use
      Logger().v(e.toString());
    }
  }

  // Future<void> authorization() async {
  //   isLoading.value = true;

  //   oauth2.AuthorizationCodeGrant? result;
  //   try {
  //     result = oauth2.AuthorizationCodeGrant(
  //       clientId,
  //       Uri.parse(authorizationEndpoint),
  //       Uri.parse(tokenEndpoint),
  //       secret: clientSecret,
  //     );
  //     if (result == null) {
  //       Get.snackbar("true", "message");
  //     } else {
  //       Get.snackbar("null", "message");
  //     }
  //     isLoading.value = false;
  //   } catch (e) {
  //     Logger().v(e.toString());
  //     isLoading.value = false;

  //     Get.snackbar("error", "message");
  //   }
  // }
}
