// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      senderID: json['sender_ID'] as String,
      text: json['text'] as String,
      createdAt: json['created_at'] as int,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'sender_ID': instance.senderID,
      'text': instance.text,
      'created_at': instance.createdAt,
    };
