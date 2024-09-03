import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

Future<MyData> authenticateUser(String username, String password) async {
  final response = await http.post(
    Uri.parse('https://417f-2401-4900-4de6-cb5e-559-b636-765f-3ca7.ngrok-free.app/User/login'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    print("Response body: ${response.body}");
    final jsonResponse = json.decode(response.body);
    bool isAdmin = false;
    if (jsonResponse['admin'] is bool) {
      isAdmin = jsonResponse['admin'];
    } else if (jsonResponse['admin'] is int) {
      isAdmin = jsonResponse['admin'] == 1;
    } else if (jsonResponse['admin'] is String) {
      isAdmin = jsonResponse['admin'].toLowerCase() == 'true';
    } else {
      throw Exception('Unexpected value for admin field');
    }

    return MyData(
      id: jsonResponse['userId'],
      username: jsonResponse['username'],
      password: jsonResponse['password'],
      admin: isAdmin,
      branchId: jsonResponse['branchId']
    );
  } else {
    throw Exception('Failed to authenticate user');
  }
}
Future<OfficeLocationData> getOfficeLocation(int branchId) async{
  final response = await http.get(
    Uri.parse('https://417f-2401-4900-4de6-cb5e-559-b636-765f-3ca7.ngrok-free.app/OfficeLocation/getByBranchId/${branchId}')
  );
  if(response.statusCode == 200){
    final jsonResponse = jsonDecode(response.body);
    return OfficeLocationData(
      branchId: jsonResponse['branchId'],
      branchName: jsonResponse['branchName'],
      latitude: jsonResponse['latitude'], 
      longitude: jsonResponse['longitude'],
      );
  }
  else{
    throw Exception('Failed to getLocation');
  }
}