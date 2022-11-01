import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/otp_request.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/otp_response.dart';
import 'package:meta/meta.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());

  late AccountModel _user;
  AccountModel? get user => _user;

  Future verify({required String code}) async {
    emit(VLoadingState());
    try {
      var response = await DioHelper.postData(
          url: "$baseURL/otp",
          body: OTPRequest(
                  phone: CacheHelper.getDataFromSharedPreference(key: "phone"),
                  code: code)
              .toJson());
      OtpResponseModel res = OtpResponseModel.fromJson(response.data);

      if (res.status != 200) {
        emit(VerificationFailed(res.message!));
      } else {
        _user = res.account!;
        CacheHelper.saveDataSharedPreference(key: "id", value: _user.id);
        CacheHelper.saveDataSharedPreference(key: "name", value: _user.name);

        emit(VerificationSuccess(res.message!));
      }
    } on DioError catch (e) {
      emit(VerificationFailed(e.response.toString()));
    } catch (e) {
      emit(VerificationFailed(e.toString()));
    }
  }
}
