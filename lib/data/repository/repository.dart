import 'package:dartz/dartz.dart';

import '../datasource/datasource.dart';
import '../errors/failure.dart';
import '../models/travel_model.dart';

typedef DataResponse<T> = Future<Either<Failure, T>>;

abstract class Repository {
  DataResponse<List<TravelModel>> getTravelInspiration();
}

class RepositoryImpl implements Repository {
  final DataSource dataSource;
  RepositoryImpl(this.dataSource);

  @override
  DataResponse<List<TravelModel>> getTravelInspiration() async {
    try {
      return await dataSource.getTravelInspiration().then((value) => Right(travelItemsFromJson(value)));
    } on Exception {
      return Left(Failure(message: 'Failed to fetch data'));
    }
  }
}
