import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/sign_in_request.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/sign_in_response.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future login({required String name, required String phone}) async {
    emit(LoadingState());
    try {
      var response = await DioHelper.postData(
          url: "$baseURL/verifyPhone",
          body: SignInRequest(name: name, phone: phone).toJson());

      SignInResponse res = SignInResponse.fromJson(response.data);

      if (res.status != 200) {
        emit(LoginFailure(res.message!));
      } else {
        CacheHelper.saveDataSharedPreference(key: "phone", value: phone);
        emit(LoginSuccess(res.message!));
      }
    } on DioError catch (e) {
      emit(LoginFailure(e.response.toString()));
    }
  }
}
