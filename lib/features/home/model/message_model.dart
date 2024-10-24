class MessageModel {
  final String text;
  final bool isMe;
  final String time;
  final bool isSeen;
  final bool isDelivered;

  MessageModel({
    required this.text,
    required this.isMe,
    required this.time,
    required this.isSeen,
    required this.isDelivered,
  });

  MessageModel copyWith({
    String? text,
    bool? isMe,
    String? time,
    bool? isSeen,
    bool? isDelivered,
  }) {
    return MessageModel(
      text: text ?? this.text,
      isMe: isMe ?? this.isMe,
      time: time ?? this.time,
      isSeen: isSeen ?? this.isSeen,
      isDelivered: isDelivered ?? this.isDelivered,
    );
  }


  // from json
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      text: json['text'],
      isMe: json['isMe'],
      time: json['time'],
      isSeen: json['isSeen'],
      isDelivered: json['isDelivered'],
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'isMe': isMe,
      'time': time,
      'isSeen': isSeen,
      'isDelivered': isDelivered,
    };
  }



  static List<MessageModel> dummyMessages = [
    MessageModel(
      text: 'Hello, How are you?',
      isMe: false,
      time: '10:00 AM',
      isSeen: true,
      isDelivered: true,
    ),
    MessageModel(
      text: 'I am fine, How about you?',
      isMe: true,
      time: '10:01 AM',
      isSeen: true,
      isDelivered: true,
    ),
    MessageModel(
      text: 'I am also fine',
      isMe: false,
      time: '10:02 AM',
      isSeen: true,
      isDelivered: true,
    ),
    MessageModel(
      text: 'What are you doing?',
      isMe: false,
      time: '10:03 AM',
      isSeen: true,
      isDelivered: true,
    ),
    MessageModel(
      text: 'I am working on a project',
      isMe: true,
      time: '10:04 AM',
      isSeen: true,
      isDelivered: true,
    ),
    MessageModel(
      text: 'That\'s great',
      isMe: false,
      time: '10:05 AM',
      isSeen: true,
      isDelivered: true,
    ),
    MessageModel(
      text: 'Yes, I am enjoying it',
      isMe: true,
      time: '10:06 AM',
      isSeen: true,
      isDelivered: true,
    ),
    MessageModel(
      text: 'That\'s great',
      isMe: false,
      time: '10:07 AM',
      isSeen: true,
      isDelivered: true,
    ),
    MessageModel(
      text: 'Yes, I am enjoying it',
      isMe: true,
      time: '10:08 AM',
      isSeen: true,
      isDelivered: true,
    ),
    MessageModel(
      text: 'That\'s great',
      isMe: false,
      time: '10:09 AM',
      isSeen: true,
      isDelivered: true,
    ),
    MessageModel(
      text: 'Yes, I am enjoying it',
      isMe: true,
      time: '10:10 AM',
      isSeen: true,
      isDelivered: true,
    ),
    MessageModel(
      text: 'That\'s great',
      isMe: false,
      time: '10:11 AM',
      isSeen: true,
      isDelivered: true,
    ),

    MessageModel(
      text: 'Tell me about your project',
      isMe: true,
      time: '10:12 AM',
      isSeen: true,
      isDelivered: true,
    ),

    MessageModel(
      text: 'It is a chat app',
      isMe: false,
      time: '10:13 AM',
      isSeen: true,
      isDelivered: true,
    ),
    MessageModel(
      text: 'That\'s great',
      isMe: true,
      time: '10:14 AM',
      isSeen: true,
      isDelivered: true,
    ),

    MessageModel(
      text: 'Yes, I am enjoying it',
      isMe: false,
      time: '10:15 AM',
      isSeen: true,
      isDelivered: true,
    ),
  ];
}