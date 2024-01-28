import 'package:bloc_project/bloc/update_event.dart';
import 'package:bloc_project/bloc/update_state.dart';
import 'package:bloc_project/services/update_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(UpdateInitial()) {
    on<PerformUpdateEvent>((event, emit) async {
      try {
        bool isSuccess = await UpdateApiService.updateUser(
            event.userId, event.signUpRequestModel);
        if (isSuccess) {
          emit(UpdateSuccess());
        } else {
          emit(UpdateFailed());
        }
      } catch (e) {
        emit(UpdateFailed());
      }
    });
  }
}
