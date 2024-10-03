import 'package:chatapp/model/user_model.dart';

class GroupModel {
  //
  String? id;
  String? name;
  String? description;
  String? profileUrl;
  List<UserModel>? members;

  //
  String? createdAt;
  String? createdBy;
  String? status;
  String? lastMessage;
  String? lastMessageTimeStamp;

  //
  String? lastMessageBy;
  int? unReadCount;
  String? timeStamp;

  GroupModel({
    //
    this.id,
    this.name,
    this.description,
    this.profileUrl,
    this.members,

    //
    this.createdAt,
    this.createdBy,
    this.status,
    this.lastMessage,
    this.lastMessageTimeStamp,

    //
    this.lastMessageBy,
    this.unReadCount,
    this.timeStamp,
  });
  GroupModel.fromJson(Map<String, dynamic> json) {
    //
    id = json["id"];
    name = json["name"];
    description = json["description"];
    profileUrl = json["profileUrl"];

    if (json["members" is Map]) {
      json["members"] == null ? null : UserModel.fromJson(json["members"]);
    }

    //
    createdAt = json["createdAt"];
    createdBy = json["createdBy"];
    status = json["status"];
    lastMessage = json["lastMessage"];
    lastMessageTimeStamp = json["lastMessageTimeStamp"];

    //
    lastMessageBy = json["lastMessageBy"];
    unReadCount = json["unReadCount"];
    timeStamp = json["timeStamp"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    //
    _data["id"] = id;
    _data["name"] = name;
    _data["description"] = description;
    _data["profileUrl"] = profileUrl;

    if (members != null) {
      _data["members"] = members;
    }

    //
    _data["members"] = members;
    _data["createdAt"] = createdAt;
    _data["status"] = status;
    _data["lastMessage"] = lastMessage;
    _data["lastMessageTimeStamp"] = lastMessageTimeStamp;

    //
    _data["lastMessageBy"] = lastMessageBy;
    _data["unReadCount"] = unReadCount;
    _data["timeStamp"] = timeStamp;

    return _data;
  }
}
