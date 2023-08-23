import 'package:dartz/dartz.dart';
import 'package:estudo_auth/src/modules/home/data/datasources/impl/home_remote_datasource.dart';
import 'package:estudo_auth/src/modules/home/domain/repository/home_repository.dart';
import 'package:estudo_auth/src/shared/core/abstractions/network_settings/network_settings.dart';

import '../datasources/impl/home_local_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final NetworkSettings settings;
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({
    required this.settings,
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<Exception, bool>> example() async {
    return await settings.selectRepository(
      local: () {
        return homeLocalDataSource.example();
      },
      remote: () {
        return homeRemoteDataSource.example();
      },
    );
  }
}
