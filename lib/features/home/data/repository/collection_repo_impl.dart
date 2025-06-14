
import 'package:tesstt_task/core/error/exception.dart';
import 'package:tesstt_task/core/error/failures.dart';
import 'package:tesstt_task/core/error/result.dart';
import 'package:tesstt_task/core/network/internet_connectivity.dart';
import 'package:tesstt_task/features/home/data/datasource/collection_local_datasource.dart';
import 'package:tesstt_task/features/home/data/datasource/collection_remote_datasource.dart';
import 'package:tesstt_task/features/home/domain/entities/bottle.dart';
import 'package:tesstt_task/features/home/domain/repository/collection_repo.dart';

class CollectionRepoImpl implements CollectionRepository {
  final CollectionRemoteDataSource remoteDataSource;
  final CollectionLocalDataSoruce localDataSource;
  final NetworkInfo networkInfo;

  CollectionRepoImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Result<List<Bottle>>> getCollections() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getColletions();
        localDataSource.cacheBottles(remotePosts);
        return Result.success(remotePosts);
      } on ServerException {
        return Result.failure(const ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedBottles();
        return Result.success(localPosts);
      } on CacheMissException {
        return Result.failure(const CacheMissFailure());
      }
    }
  }
}
