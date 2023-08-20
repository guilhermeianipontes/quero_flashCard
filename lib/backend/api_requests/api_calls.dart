import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class RequestNewCardCall {
  static Future<ApiCallResponse> call({
    String? apiKey =
        'Bearer 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',
    String? prompt = '',
    String? pergunta = '',
    String? resposta = '',
  }) {
    final body = '''
{
  "model": "gpt-3.5-turbo",
  "messages": [
    {
      "role": "system",
      "content": "Você é um especialista em identificar a temática e criar novas perguntas dentro do tema identificado. Você receberá como input uma pergunta e uma resposta, e você irá criar uma nova pergunta com o mesmo tema. Pergunta e resposta devem ser objetivas e devem ter aproximadamente o mesmo número de caracteres das perguntas e respostas originais. Utilize '/' entre a pergunta e a resposta."},
    {
      "role": "user",
      "content": "${pergunta},${resposta}"
    }
  ],
  "max_tokens": 100,
  "temperature": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RequestNewCard',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic mensagem(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message''',
      );
  static dynamic perguntaResposta(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.content''',
      );
}

class TesteapiCall {
  static Future<ApiCallResponse> call({
    String? prompt = ' ',
  }) {
    final body = '''
{
  "model": "gpt-3.5-turbo",
  "messages": [
    {
      "role": "system",
      "content": "You are a helpful assistant."
    },
    {
      "role": "user",
      "content": "${prompt}"
    }
  ],
  "max_tokens": 256,
  "temperature": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'testeapi',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
