import 'package:doggo_pedia/presentation/breed/breed_screen.dart';
import 'package:doggo_pedia/presentation/detail_breed/detail_breed_screen.dart';
import 'package:flutter/material.dart';

class RouteName {
  RouteName._();
  //static const String signIn = "/sign_in";
  //static const String welcome = '/welcome';
  static const String breeds = '/breeds';
  static const String detailBreed = '/detail_breed';
}

class RouteGenerator {
  static final routes = <String, WidgetBuilder>{
    RouteName.breeds: (BuildContext context) => const BreedScreen(),
    //RouteName.detailBreed: (BuildContext context) => const DetailBreedScreen(),
  };
}
