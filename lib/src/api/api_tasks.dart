import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> taskAppi() async {
  try {
    final response = await http.get(
        Uri.parse(
            'https://ecsdevapi.nextline.mx/vdev/tasks-challenge/tasks'),
        headers: {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Authorization':
          'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd'
    });
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      print('DENTRO DEL JSON');
      print(jsonResponse);
      return jsonResponse;
    } else {
      return [];
    }
  } catch (e) {
    return [e];
  }
}

