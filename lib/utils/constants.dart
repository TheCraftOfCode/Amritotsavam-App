import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;

const String networkAddress = '10.0.2.2:8000';
const bool isHTTPS = false;
const String storageJWTKey = "USER_AUTH_JWT";

var gradientDecoration = BoxDecoration(
    gradient: LinearGradient(
        colors: colors.gradientColors,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.0,0.5,1.0]
    ));

var loginGradients = [colors.loginGradientBeginColor, colors.loginGradientEndColor];