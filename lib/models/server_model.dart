class ServerModel{
  final String serverName;
  final String serverUrl;
  final bool  isDefault;

  ServerModel({required this.serverName,required this.serverUrl,required this.isDefault});
  factory ServerModel.fromJson(Map<String,dynamic>json){
    return ServerModel(
      serverName: json['serverName']as String,
      serverUrl: json['serverUrl']as String,
      isDefault: json['isDefault'] as bool
    );
  }
}