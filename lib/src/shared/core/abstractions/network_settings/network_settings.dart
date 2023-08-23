import 'package:dartz/dartz.dart';

abstract class NetworkSettings {
  String get repository;

  Future<Either<Exception, T>> selectRepository<T>({
    required Future<Either<Exception, T>> Function() local,
    required Future<Either<Exception, T>> Function() remote,
  }) async {
    if (repository == "local") {
      return local();
    } else {
      return remote();
    }
  }
}

class DevSettingsNetwork extends NetworkSettings {
  @override
  String get repository => "local";
}

class HmlSettingsNetwork extends NetworkSettings {
  @override
  String get repository => "remote";
}
