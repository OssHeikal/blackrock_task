import 'package:blackrock_task/data/repository/repository.dart';
import 'package:blackrock_task/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/travel_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Repository repository;
  HomeCubit(this.repository) : super(const HomeState());

  Future<void> getTravelInspiration() async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await repository.getTravelInspiration();
    result.fold(
      (failure) => emit(state.copyWith(status: CubitStatus.error, message: failure.message)),
      (travelInspirationModel) => emit(
        state.copyWith(status: CubitStatus.loaded, travelModel: travelInspirationModel),
      ),
    );
  }
}
