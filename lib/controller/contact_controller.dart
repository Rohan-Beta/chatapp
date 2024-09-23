import 'package:chatapp/model/chat_room_model.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  RxList<UserModel> userList = <UserModel>[].obs;
  RxBool isLoading = false.obs;
  RxList<ChatRoomModel> chatRoomList = <ChatRoomModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserList();
    await getChatRoomList();
  }

  Future<void> getUserList() async {
    isLoading.value = true;

    try {
      userList.clear();
      await db.collection("users").get().then(
            (value) => {
              userList.value = value.docs
                  .map(
                    (e) => UserModel.fromJson(
                      e.data(),
                    ),
                  )
                  .toList(),
            },
          );
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<void> getChatRoomList() async {
    List<ChatRoomModel> chatRoom = [];

    await db
        .collection("chats")
        .orderBy("lastMessageTimeStamp", descending: true)
        .get()
        .then(
      (value) {
        chatRoom = value.docs
            .map(
              (e) => ChatRoomModel.fromJson(
                e.data(),
              ),
            )
            .toList();
      },
    );
    chatRoomList.value = chatRoom
        .where(
          (e) => e.id!.contains(auth.currentUser!.uid),
        )
        .toList();
  }
}
