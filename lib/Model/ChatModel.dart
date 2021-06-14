class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String status;
  String currentMessage;
  bool Select = false;

  ChatModel(
      {this.name, this.currentMessage, this.icon, this.isGroup, this.time, this.status,this.Select = false});
}
