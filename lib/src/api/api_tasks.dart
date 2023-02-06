import 'dart:convert';
import 'package:http/http.dart' as http;

// Future<List<dynamic>> taskAppi() async {
//   try {
//     final response = await http.get(
//         Uri.parse(
//             'https://ecsdevapi.nextline.mx/vdev/tasks-challenge/tasks'),
//         headers: {
//       'Accept': '*/*',
//       'Authorization':
//           'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd'
//       },
//     );

//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
//       print('DENTRO DEL JSON');
//       print(jsonResponse);
//       return jsonResponse;
//     } else {
//       return [];
//     }
//   } catch (e) {
//     return [e];
//   }
// }
Future<List<dynamic>> taskAppi() async {
  var headersList = {
    'Authorization':
        'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd',
    'Content-Type': 'application/json',
  };
  var url =
      Uri.parse('https://ecsdevapi.nextline.mx/vdev/tasks-challenge/tasks');

  var body = {"token": "Leonardo"};

  var req = http.Request('GET', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  List results = jsonDecode(resBody);
  // print(results);

  return results;
}

Future<List<dynamic>> taskAppiId(id) async {
  var headersList = {
    'Authorization':
        'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd',
    'Content-Type': 'application/json',
  };
  var url =
      Uri.parse('https://ecsdevapi.nextline.mx/vdev/tasks-challenge/tasks/$id');

  var body = {"token": "Leonardo"};

  var req = http.Request('GET', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  List results = jsonDecode(resBody);
  // print(results);

  return results;
}

Future<String> putTaskAppi(String id, body) async {
  var headersList = {
    'Authorization':
        'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd',
    'Content-Type': 'application/json',
  };
  var url =
      Uri.parse('https://ecsdevapi.nextline.mx/vdev/tasks-challenge/tasks/$id');

  var req = http.Request('PUT', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  // print(resBody);

  return resBody;
}

Future<String> deleteTaskAppi(String id, body) async {
  var headersList = {
    'Authorization':
        'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd',
    'Content-Type': 'application/json',
  };
  var url =
      Uri.parse('https://ecsdevapi.nextline.mx/vdev/tasks-challenge/tasks/$id');

  var req = http.Request('DELETE', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  // print(resBody);

  return resBody;
}

Future<String> addTaskAppi(body) async {
  var headersList = {
    'Authorization':
        'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd',
    'Content-Type': 'application/json',
  };
  var url =
      Uri.parse('https://ecsdevapi.nextline.mx/vdev/tasks-challenge/tasks');

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  // print(resBody);

  return resBody;
}
