import 'package:login_work/app/home/screens/admin_panel_screen/model/user_get_all_response.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/service/AdminPanelService.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/service/IAdminPanelService.dart';
import 'package:login_work/export_import.dart';
import 'package:mobx/mobx.dart';
part 'admin_panel_view_model.g.dart';

class AdminPanelViewModel = _AdminPanelViewModelBase with _$AdminPanelViewModel;

abstract class _AdminPanelViewModelBase with Store {
  @observable
  IAdminPanelService service =
      AdminPanelService(dio: Dio(BaseOptions(baseUrl: allUserUrl)));
  @observable
  UserGetAllResponse? userGetAllResponse = UserGetAllResponse();
  @observable
  UserGetAllResponse? userComputerResponse = UserGetAllResponse();
  @observable
  UserGetAllResponse? userMachineResponse = UserGetAllResponse();
  @observable
  double allStudentValue = 0.0;
  @observable
  double computerStudentValue = 0.0;
  @observable
  double machineStudentValue = 0.0;
  @observable
  List<Color> colorList = [
    Colors.amber,
    const Color(0xff3EE094),
    const Color(0xff3398F6),
  ];
  Future<UserGetAllResponse?> getAllUser() async {
    //userGetAllResponse?.data?.length.toDouble()??0.0
    userGetAllResponse = await service.getAllUser();
    allStudentValue = userGetAllResponse?.data?.length.toDouble() ?? 0.0;
    return userGetAllResponse;
  }

  Future<UserGetAllResponse?> getByIdComputerUser() async {
    userComputerResponse = await service.getByIdComputerUser();
    computerStudentValue = userComputerResponse?.data?.length.toDouble() ?? 0.0;
    return userComputerResponse;
  }

  Future<UserGetAllResponse?> getByIdMachineUser() async {
    userMachineResponse = await service.getByIdMachineUser();
    machineStudentValue = userMachineResponse?.data?.length.toDouble() ?? 0.0;
    return userMachineResponse;
  }
}