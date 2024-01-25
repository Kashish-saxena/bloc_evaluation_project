import 'package:bloc/bloc.dart';
import 'package:bloc_project/bloc/api_event.dart';
import 'package:bloc_project/bloc/api_state.dart';
import 'package:bloc_project/models/signup_response_model.dart';
import 'package:bloc_project/services/get_api_service.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    
    on<GetApiList>((event, emit) async {
      try {
        emit(ApiLoading());
        List<SignUpResponseModel> mList = await GetApiService.getData();
        emit(ApiLoaded(mList));
        if (mList.isEmpty) {
          emit(const ApiError("List is Empty"));
        }
      }
      catch (e) {
        emit(const ApiError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
