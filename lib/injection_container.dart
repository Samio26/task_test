import 'package:internet_connection_checker/internet_connection_checker.dart';


import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tesstt_task/core/network/internet_connectivity.dart';
import 'package:tesstt_task/features/home/data/datasource/collection_local_datasource.dart';
import 'package:tesstt_task/features/home/data/datasource/collection_remote_datasource.dart';
import 'package:tesstt_task/features/home/data/repository/collection_repo_impl.dart';
import 'package:tesstt_task/features/home/domain/repository/collection_repo.dart';
import 'package:tesstt_task/features/home/domain/usecases/get_collection_usecase.dart';
import 'package:tesstt_task/features/home/presentation/bloc/collection_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {


// Bloc



// Usecases

  sl.registerLazySingleton(() => GetCollectionsUsecase(sl()));
  
// Repository

sl.registerLazySingleton<CollectionRepository>(()=>CollectionRepoImpl(
  remoteDataSource: sl(), localDataSource: sl(), 
  networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<CollectionRemoteDataSource>(
      () => CollectionRemoteDataSourceImpl());
  sl.registerLazySingleton<CollectionLocalDataSoruce>(
      () => CollectionLocalDataSoruceImpl(sharedPreferences: sl()));


  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));


//bloc 

  sl.registerFactory(() => CollectionBloc(getCollectionsUsecase:  sl()));

//! External


  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
sl.registerLazySingleton<InternetConnectionChecker>(
  () => InternetConnectionChecker.createInstance(),
);}