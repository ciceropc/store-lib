class PushNotification {
  String title;
  String body;
  DateTime received;
  Map<String, dynamic> destination;

  PushNotification({
    this.title,
    this.body,
    this.received,
    this.destination,
  });

  PushNotification.fromJson(Map<String, dynamic> json) {
    if (json['title'] != null) title = json['title'];
    if (json['body'] != null) body = json['body'];
    if (json['received'] != null) received = json['received'];
    if (json['destination'] != null) destination = json['destination'].cast<String, dynamic>();
  }

  toJson() {
    Map<String, dynamic> map = Map();

    map['title'] = title;
    map['body'] = body;
    map['received'] = received;
    map['destination'] = destination;

    return map;
  }
}
