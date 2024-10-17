import 'package:chatapp/model/user_model.dart';
import 'package:get/get.dart';

class GroupController extends GetxController {
  RxList<UserModel> groupMembers = <UserModel>[].obs;

  void selectMembers(UserModel userModel) {
    if (groupMembers.contains(userModel)) {
      groupMembers.remove(userModel);
    } else {
      groupMembers.add(userModel);
    }
  }
}
