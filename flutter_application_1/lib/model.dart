class MyData {
  final int id;
  final String username;
  final String password;
  final bool admin;
  final int branchId;

  MyData({required this.id, required this.username,required this.password,required this.admin,required this.branchId});

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      id: json['userId'],
      username: json['username'],
      password: json['password'],
      admin: json['admin'],
      branchId:json['branchId'],
    );
  }
}

class OfficeLocationData{
  final int branchId;
  final String branchName;
  final double latitude;
  final double longitude;

  OfficeLocationData({required this.branchId,required this.branchName,required this.latitude,required this.longitude});

  factory OfficeLocationData.fromJson(Map<String, dynamic> json){
    return OfficeLocationData(
      branchId: json['branchId'],
      branchName: json['branchName'],
      latitude: json['latitude'],
      longitude: json['longitude'] , 

      );
  }

}