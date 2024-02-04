import 'package:blackrock_task/data/models/travel_inspiration_model.dart';
import 'package:dartz/dartz.dart';

import '../datasource/datasource.dart';
import '../errors/failure.dart';

typedef DataResponse<T> = Future<Either<Failure, T>>;

abstract class Repository {
  DataResponse<TravelInspirationModel> getTravelInspiration();
}

class RepositoryImpl implements Repository {
  final DataSource dataSource;
  RepositoryImpl(this.dataSource);

  @override
  DataResponse<TravelInspirationModel> getTravelInspiration() async {
    try {
      return await dataSource.getTravelInspiration().then((value) => Right(travelInspirationFromJson(value)));
    } on Exception {
      return Left(Failure(message: 'Failed to fetch data'));
    }
  }
}
