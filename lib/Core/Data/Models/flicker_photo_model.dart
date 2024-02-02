class FlickerPhotoModel {
  final String id;
  final String owner;
  final String secret;
  final String server;
  final int farm;
  final String title;
  final bool ispublic;
  final bool isfriend;
  final bool isfamily;

  FlickerPhotoModel({
    required this.id,
    required this.owner,
    required this.secret,
    required this.server,
    required this.farm,
    required this.title,
    required this.ispublic,
    required this.isfriend,
    required this.isfamily,
  });

  factory FlickerPhotoModel.fromJson(Map<String, dynamic> json) {
    return FlickerPhotoModel(
      id: json['id'],
      owner: json['owner'],
      secret: json['secret'],
      server: json['server'],
      farm: json['farm'],
      title: json['title'],
      ispublic: json['ispublic'] == 1,
      isfriend: json['isfriend'] == 1,
      isfamily: json['isfamily'] == 1,
    );
  }
}
