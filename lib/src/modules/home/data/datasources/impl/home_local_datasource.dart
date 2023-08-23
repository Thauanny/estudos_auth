import 'package:dartz/dartz.dart';
import 'package:estudo_auth/src/modules/home/data/datasources/home_datasource.dart';
import 'package:estudo_auth/src/shared/helpers/debug_print/debug_print.dart';

class HomeLocalDataSource implements HomeDataSource {
  @override
  Future<Either<Exception, bool>> example() async {
    try {
      debugPrintHelper("local");
      return const Right(true);
    } catch (e) {
      return Left(Exception());
    }
  }
}
