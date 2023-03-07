import 'package:http/http.dart' as http;

class FirebaseAuthRemoteDataSource {
  final String url = '';

  Future<String> createCustomToken(Map<String, dynamic> user) async {
    final customTokenResponse = await http.post(Uri.parse(url), body: user);

    return customTokenResponse.body;
  }
}
