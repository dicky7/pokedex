import 'package:get_it/get_it.dart';
import 'package:poxedex/data/datasource/pokemon_data_source.dart';
import 'package:poxedex/data/repository/pokemon_repository.dart';
import 'package:poxedex/presentation/providers/details/pokemon_detail_provider.dart';
import 'package:poxedex/presentation/providers/home/pokemon_providers.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init(){
  //providers
  locator.registerFactory(
    () => PokemonProviders(locator()),
  );
  locator.registerFactory(
    () => PokemonDetailProvider(locator()),
  );

  //data source
  locator.registerLazySingleton<PokemonDataSource>(
    () => PokemonDataSourceImpl(locator()),
  );

  //repository
  locator.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(locator()),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}