import 'package:dartz/dartz.dart';
import 'package:estudo_auth/src/modules/home/data/datasources/home_datasource.dart';
import 'package:estudo_auth/src/shared/helpers/debug_print/debug_print.dart';

class HomeRemoteDataSource implements HomeDataSource {
  @override
  Future<Either<Exception, bool>> example() async {
    try {
      debugPrintHelper("remote");
      return const Right(false);
    } catch (e) {
      return Left(Exception());
    }
  }
}
