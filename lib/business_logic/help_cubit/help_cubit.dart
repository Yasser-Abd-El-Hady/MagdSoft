import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/help_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/help_response.dart';
import 'package:meta/meta.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit() : super(HelpInitial());
  List<HelpModel> _allhelps = [];

  List<HelpModel> get allhelp => _allhelps;

  Future getData() async {
    try {
      var response =
          await DioHelper.getData(url: "$baseURL/getHelp", query: {});

      HelpResponse res = HelpResponse.fromJson(response.data);

      if (res.status != 200) {
        emit(ErrorState(res.message!));
      } else {
        _allhelps = res.help!;
        emit(FetchedState(res.message!));
      }
    } on DioError catch (e) {
      emit(ErrorState(e.response?.data['message']));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
