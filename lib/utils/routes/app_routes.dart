import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poxedex/presentation/pages/detail/pokemon_detail_page.dart';
import 'package:poxedex/presentation/pages/home/home_page.dart';

import '../../presentation/pages/splash/splash_page.dart';

class AppRoutes{
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {
      case SplashPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case PokemonDetailPage.routeName:
        final arguments = settings.arguments as PokemonDetailPage;
        return MaterialPageRoute(
          builder: (context) => PokemonDetailPage(
            pokemonName: arguments.pokemonName,
            imageUrl: arguments.imageUrl,
            cardColor: arguments.cardColor,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
    }
  }
}