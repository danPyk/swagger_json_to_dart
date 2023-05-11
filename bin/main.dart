import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:translator/translator.dart';
import 'json.dart';
import 'dart:io';

Future<void> main(List<String> arguments) async {
  final translator = GoogleTranslator();
  print(
      'Press "a" to generate api or "r" to generate repository, then press enter');
  String? name = stdin.readLineSync(); // null safety in name string

  if (name == 'a') {
    await generateApi(translator);
  }
  if (name == 'r') {
    await generateRepo(translator);
  }

}

Future<void> generateApi(GoogleTranslator translator) async {
  // Set the URL of the Swagger JSON file
  var swaggerUrl = 'https://petstore.swagger.io/v2/swagger.json';

  // Define the base URL for the API requests
  var baseUrl = 'https://courtme.t1s.pl/api-docs';

  // Generate the Dart functions for each endpoint in the JSON schema
  for (var path in json['paths']!.keys) {
    for (var method in json['paths']![path].keys) {
      // Get the endpoint information

      final auth =
          "final user = _auth.currentUser; final token = await user!.getIdToken()";
      var operation = json['paths']![path][method];
      var tags = operation['tags'];
      var summary = operation['description'] as String;

      var operationId = operation['operationId'];
      var requestBody = operation['requestBody'];

      var param = '';

      List<String> params = [];
      List<String> paramsRequestBody = [];

      if (operation['parameters'] != null) {
        try {
          for (Map<String, dynamic> paramter in operation['parameters']) {
            if (paramter['name'] == null) {
              break;
            }
            final name = paramter['name'];
            String type = (paramter['type'] ?? 'String');

            final convertedName = toCamelCase(name);

            param = 'required' + ' ' + type.capitalize() + ' ' + convertedName;
            params.add(param);
          }

          params.join(', ');
        } catch (e) {}
      }
      List<Map<String, dynamic>> list = [];

      if (requestBody != null) {
        LinkedHashMap<String, Map<String, Object>> hashMap;

        try {
          if (requestBody['content']['application/json']['schema']['items'] !=
              null) {
            hashMap = operation['requestBody']['content']['application/json']
                    ['schema']['items']['properties']
                as LinkedHashMap<String, Map<String, Object>>;
          } else {
            hashMap = requestBody['content']['application/json']['schema']
                ['properties'] as LinkedHashMap<String, Map<String, Object>>;
          }
          requestBody = hashMap;

          list = hashMap.entries
              .map((entry) => {'id': entry.key, ...entry.value})
              .toList();

          for (Map<String, dynamic> singleParam in list) {
            // if (singleParam['name'] == null) {
            //   break;
            // }
            final name = singleParam['id'];
            String type = (singleParam['type'] ?? 'String');

            final convertedName = toCamelCase(name);
            paramsRequestBody.add(convertedName);

            param = 'required' + ' ' + type.capitalize() + ' ' + convertedName;
            params.add(param);
          }
        } catch (e) {}
      }

      var translatedString;

      if (summary != null) {
        translatedString = await translateString(summary, translator);
      } else {
        translatedString = 'functionName';
      }
      var functionName = toCamelCase(translatedString);
      var returnType = 'Future<http.Response>';
      var function;
      if (params.isEmpty) {
        function = '$returnType $functionName() async {\n';
      } else {
        function =
            '$returnType $functionName({${params.join(', ')}} ) async {\n';
      }
      function += auth;
      function += '  var url = \'$baseUrl$path\';\n';
      if (requestBody != null) {
        var requestParams = '';

        for (int i = 0; i < paramsRequestBody.length; i++) {
          requestParams +=
              "'" + paramsRequestBody[i] + "':" + list[i].values.first + ',';
        }
        function +=
            '  var response = await http.$method(Uri.parse(url), headers:{"Authorization" : token}, body: {$requestParams});\n';
      } else {
        function +=
            '  var response = await http.$method(Uri.parse(url), headers:{"Authorization" : token},);\n';
      }
      function += '  return response;\n';
      function += '}\n';

      // Print the Dart function
      print(function);
    }
  }
}

Future<void> generateRepo(GoogleTranslator translator) async {
  // Set the URL of the Swagger JSON file
  var swaggerUrl = 'https://petstore.swagger.io/v2/swagger.json';

  // Define the base URL for the API requests
  var baseUrl = 'https://courtme.t1s.pl/api-docs';

  // Generate the Dart functions for each endpoint in the JSON schema
  for (var path in json['paths']!.keys) {
    for (var method in json['paths']![path].keys) {
      // Get the endpoint information


      var operation = json['paths']![path][method];
      var tags = operation['tags'];
      var summary = operation['description'] as String;

      var operationId = operation['operationId'];
      var requestBody = operation['requestBody'];

      var param = '';

      List<String> params = [];
      List<String> paramsRequestBody = [];

      if (operation['parameters'] != null) {
        try {
          for (Map<String, dynamic> paramter in operation['parameters']) {
            if (paramter['name'] == null) {
              break;
            }
            final name = paramter['name'];
            String type = (paramter['type'] ?? 'String');

            final convertedName = toCamelCase(name);

            param = 'required' + ' ' + type.capitalize() + ' ' + convertedName;
            params.add(param);
          }

          params.join(', ');
        } catch (e) {}
      }
      List<Map<String, dynamic>> list = [];

      if (requestBody != null) {
        LinkedHashMap<String, Map<String, Object>> hashMap;

        try {
          if (requestBody['content']['application/json']['schema']['items'] !=
              null) {
            hashMap = operation['requestBody']['content']['application/json']
                    ['schema']['items']['properties']
                as LinkedHashMap<String, Map<String, Object>>;
          } else {
            hashMap = requestBody['content']['application/json']['schema']
                ['properties'] as LinkedHashMap<String, Map<String, Object>>;
          }
          requestBody = hashMap;

          list = hashMap.entries
              .map((entry) => {'id': entry.key, ...entry.value})
              .toList();

          for (Map<String, dynamic> singleParam in list) {
            // if (singleParam['name'] == null) {
            //   break;
            // }
            final name = singleParam['id'];
            String type = (singleParam['type'] ?? 'String');

            final convertedName = toCamelCase(name);
            paramsRequestBody.add(convertedName);

            param = 'required' + ' ' + type.capitalize() + ' ' + convertedName;
            params.add(param);
          }
        } catch (e) {}
      }

      var translatedString;

      if (summary != null) {
        translatedString = await translateString(summary, translator);
      } else {
        translatedString = 'functionName';
      }
      var functionName = toCamelCase(translatedString);
      var returnType = 'Future<void>';
      var function;

      String paramsJoined = '';
      if (params.isEmpty) {
        function = '$returnType $functionName() async {\n';
      } else {
        function =
            '$returnType $functionName({${params.join(', ')}} ) async {\n';
        for (int i = 0; i < params.length; i++) {
          paramsJoined +=
              params[i].split(" ").elementAt(2) + ":" + params[i].split(" ").elementAt(2)+ ',';
        }
      }
      if (requestBody != null) {
        var requestParams = '';

        for (int i = 0; i < paramsRequestBody.length; i++) {
          requestParams +=
            paramsRequestBody[i] + ":" + list[i].values.first + ',';
        }
        function += 'final response = await  api.' +functionName+'('+paramsJoined+
            requestParams+');';
      } else {
        function += 'final response = await  api.' + functionName.toString()+'($paramsJoined);';
      }

      function +=
          "  if (response.statusCode == 200) {return;} else if (response.statusCode == 400) {return Future.error(Exception(response.body,),);} else if (response.statusCode == 404) {return Future.error(Exception(response.body,),);} else if (response.statusCode == 501) {return Future.error(Exception(response.body,),);} else {return Future.error(Exception('API error has occured with status code: {response.statusCode},),);";
      function += '}\n';

      // Print the Dart function
      print(function);
    }
  }
}

Future<String> translateString(
    String sentence, GoogleTranslator translator) async {
  var translation = await translator.translate(sentence, to: 'en');

  return translation.text;
}

String toCamelCase(String input) {
  final words = input.split(' ');
  final capitalizedWords = words.map((word) => word.capitalize());
  final firstWord = capitalizedWords.first.toLowerCase();
  final restOfWords = capitalizedWords.skip(1).join('');
  return '$firstWord$restOfWords';
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}


