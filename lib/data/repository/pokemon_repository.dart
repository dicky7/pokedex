import 'package:dartz/dartz.dart';
import 'package:poxedex/data/datasource/pokemon_data_source.dart';
import 'package:poxedex/data/models/pokemon_about_model.dart';
import 'package:poxedex/data/models/pokemon_basic_model.dart';
import 'package:poxedex/data/models/pokemon_detail_model.dart';
import 'package:poxedex/utils/exception_handling/exception.dart';
import 'package:poxedex/utils/exception_handling/failure.dart';

abstract class PokemonRepository{
  Future<Either<Failure, List<PokemonBasicItem>>> getPokemonBasic();
  Future<Either<Failure, PokemonDetailModel>> getPokemonDetail(String name);
  Future<Either<Failure, PokemonAboutModel>> getPokemonAbout(String name);
  String pokemonImage(String pokemonId);
}
class PokemonRepositoryImpl extends PokemonRepository{
  final PokemonDataSource pokemonDataSource;

  PokemonRepositoryImpl(this.pokemonDataSource);

  @override
  Future<Either<Failure, List<PokemonBasicItem>>> getPokemonBasic() async{
    try{
      final response = await pokemonDataSource.getPokemonBasic();
      return right(response.results);
    }on ServerException catch(e){
      return left(ServerFailure(e.message));
    }catch (e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PokemonDetailModel>> getPokemonDetail(String name) async{
    try{
      final result = await pokemonDataSource.getPokemonByName(name);
      return right(result);
    }on ServerException catch(e){
      return left(ServerFailure(e.message));
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PokemonAboutModel>> getPokemonAbout(String name) async{
    try{
      final result = await pokemonDataSource.getPokemonAboutByName(name);
      return right(result);
    }on ServerException catch(e){
      return left(ServerFailure(e.message));
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  String pokemonImage(String pokemonId) {
    return pokemonDataSource.pokemonImage(pokemonId);
  }
}