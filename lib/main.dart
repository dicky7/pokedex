import 'package:flutter/material.dart';
import 'package:poxedex/data/datasource/pokemon_data_source.dart';
import 'package:poxedex/data/repository/pokemon_repository.dart';
import 'package:poxedex/presentation/pages/splash/splash_page.dart';
import 'package:poxedex/presentation/providers/details/pokemon_detail_provider.dart';
import 'package:poxedex/presentation/providers/home/pokemon_providers.dart';
import 'package:poxedex/utils/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.locator<PokemonProviders>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<PokemonDetailProvider>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRoutes.onGenerateRoute
      ),
    );
  }
}
