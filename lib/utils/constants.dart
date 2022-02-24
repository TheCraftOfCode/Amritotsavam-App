import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;

const String networkAddress = 'amritotsavam-api.herokuapp.com';
const bool isHTTPS = true;
const String storageJWTKey = "USER_AUTH_JWT";
const String nameKey = "USER_NAME";
const String roleKey = "USER_ROLE";
const String dateRegistered = "USER_REGISTER_DATE";
const String emailIdKey = "USER_EMAIL";
const String userIdKey = "USER_ID";
const textFieldPadding =
    EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10);
const String urlPattern =
    r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';

const List<String> eventType = [
  'FINE ARTS',
  'LITERARY',
  'DANCE',
  'MUSIC',
  'THEATRE',
  'INFORMALS'
];
const user = "user";
const admin = "admin";
const superAdmin = "super_admin";

var gradientDecoration = BoxDecoration(
    gradient: LinearGradient(
        colors: colors.gradientColors,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.0, 0.5, 1.0]));

var loginGradients = [
  colors.loginGradientBeginColor,
  colors.loginGradientEndColor
];
