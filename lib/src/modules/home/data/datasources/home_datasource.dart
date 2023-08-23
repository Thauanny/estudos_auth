import 'package:dartz/dartz.dart';

abstract class HomeDataSource {
  Future<Either<Exception, bool>> example();
}
