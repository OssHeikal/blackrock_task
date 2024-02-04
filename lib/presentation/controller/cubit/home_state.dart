part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = CubitStatus.initial,
    this.message = '',
    this.travelModel = const [],
  });

  final CubitStatus status;
  final String message;
  final List<TravelModel> travelModel;

  HomeState copyWith({
    CubitStatus? status,
    String? message,
    List<TravelModel>? travelModel,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      travelModel: travelModel ?? this.travelModel,
    );
  }

  @override
  List<Object> get props => [status, message, travelModel];
}
