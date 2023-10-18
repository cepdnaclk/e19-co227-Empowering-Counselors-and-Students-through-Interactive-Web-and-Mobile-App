// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityLog _$ActivityLogFromJson(Map<String, dynamic> json) => ActivityLog(
      adminName: json['adminName'] as String,
      userName: json['userName'] as String,
      change: json['change'] as String,
      dateTime: ActivityLog._dateTimeFromJson(json['dateTime'] as Timestamp),
    );

Map<String, dynamic> _$ActivityLogToJson(ActivityLog instance) =>
    <String, dynamic>{
      'adminName': instance.adminName,
      'userName': instance.userName,
      'change': instance.change,
      'dateTime': instance.dateTime.toIso8601String(),
    };

AdminModel _$AdminModelFromJson(Map<String, dynamic> json) => AdminModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      userType: json['userType'] as String,
      imgUrl: json['imgUrl'] as String,
      credential: json['credential'] as String,
    );

Map<String, dynamic> _$AdminModelToJson(AdminModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'credential': instance.credential,
      'userType': instance.userType,
      'imgUrl': instance.imgUrl,
    };

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      id: json['id'] as String,
      studentId: json['studentId'] as String,
      counselorId: json['counselorId'] as String,
      studentName: json['studentName'] as String,
      counselorName: json['counselorName'] as String,
      studentEmail: json['studentEmail'] as String,
      studentFaculty: json['studentFaculty'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      status: json['status'] as String,
      note: json['note'] as String,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'counselorId': instance.counselorId,
      'studentName': instance.studentName,
      'counselorName': instance.counselorName,
      'studentEmail': instance.studentEmail,
      'studentFaculty': instance.studentFaculty,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
      'note': instance.note,
    };

CalenderModel _$CalenderModelFromJson(Map<String, dynamic> json) =>
    CalenderModel(
      eventName: json['eventName'] as String,
      date: DateTime.parse(json['date'] as String),
      time: DateTime.parse(json['time'] as String),
      isAllDay: json['isAllDay'] as bool,
      studentName: json['studentName'] as String,
      studentEmail: json['studentEmail'] as String,
    );

Map<String, dynamic> _$CalenderModelToJson(CalenderModel instance) =>
    <String, dynamic>{
      'eventName': instance.eventName,
      'date': instance.date.toIso8601String(),
      'time': instance.time.toIso8601String(),
      'isAllDay': instance.isAllDay,
      'studentName': instance.studentName,
      'studentEmail': instance.studentEmail,
    };

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      img: json['img'] as String,
      lastSeen: json['lastSeen'] as String,
      isOnline: json['isOnline'] as bool,
      token: json['token'] as String? ?? '',
      userType: json['userType'] as String,
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'img': instance.img,
      'lastSeen': instance.lastSeen,
      'isOnline': instance.isOnline,
      'token': instance.token,
      'userType': instance.userType,
    };

ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) =>
    ConversationModel(
      id: json['id'] as String,
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
      usersArray: (json['usersArray'] as List<dynamic>)
          .map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastMessage: json['lastMessage'] as String,
      lastMessageTime: json['lastMessageTime'] as String,
      createdBy: json['createdBy'] as String,
    );

Map<String, dynamic> _$ConversationModelToJson(ConversationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'users': instance.users,
      'usersArray': instance.usersArray.map((e) => e.toJson()).toList(),
      'lastMessage': instance.lastMessage,
      'lastMessageTime': instance.lastMessageTime,
      'createdBy': instance.createdBy,
    };

CounsellorModel _$CounsellorModelFromJson(Map<String, dynamic> json) =>
    CounsellorModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      faculty: json['faculty'] as String,
      userCredential: json['userCredential'] as String,
      userType: json['userType'] as String,
      imgUrl: json['imgUrl'] as String,
    );

Map<String, dynamic> _$CounsellorModelToJson(CounsellorModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'faculty': instance.faculty,
      'userCredential': instance.userCredential,
      'userType': instance.userType,
      'imgUrl': instance.imgUrl,
    };

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      conId: json['conId'] as String,
      senderName: json['senderName'] as String,
      senderId: json['senderId'] as String,
      reciverId: json['reciverId'] as String,
      message: json['message'] as String,
      messageTime: json['messageTime'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'conId': instance.conId,
      'senderName': instance.senderName,
      'senderId': instance.senderId,
      'reciverId': instance.reciverId,
      'message': instance.message,
      'messageTime': instance.messageTime,
    };

NoteModel _$NoteModelFromJson(Map<String, dynamic> json) => NoteModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$NoteModelToJson(NoteModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: json['id'] as String,
      studentId: json['studentId'] as String,
      counselorId: json['counselorId'] as String,
      studentName: json['studentName'] as String,
      counselorName: json['counselorName'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      status: json['status'] as String,
      note: json['note'] as String,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'counselorId': instance.counselorId,
      'studentName': instance.studentName,
      'counselorName': instance.counselorName,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
      'note': instance.note,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      department: json['department'] as String,
      faculty: json['faculty'] as String,
      year: json['year'] as String,
      userCredential: json['userCredential'] as String,
      userType: json['userType'] as String,
      imgUrl: json['imgUrl'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'department': instance.department,
      'faculty': instance.faculty,
      'year': instance.year,
      'userCredential': instance.userCredential,
      'userType': instance.userType,
      'imgUrl': instance.imgUrl,
    };
