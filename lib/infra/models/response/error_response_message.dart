class ErrorResponseMessage {
  int statusCode;
  String reasonPhase;
  List<ErrorMessage> errors;

  // ErrorResponseMessage(int statusCode, string reasonPhase, List<ErrorMessage> errors)
  // {
  //     StatusCode = statusCode;
  //     ReasonPhase = reasonPhase;
  //     Errors = errors;
  // }

  // ErrorResponseMessage(int statusCode, string reasonPhase, string simpleErrorMessage)
  // {
  //     StatusCode = statusCode;
  //     ReasonPhase = reasonPhase;
  //     Errors = new List<ErrorMessage> { new ErrorMessage("Error", new string[] { simpleErrorMessage }) };
  // }

  /// <summary>
  /// Método utilizado para serializar a resposta de erro da IUGU
  /// </summary>
  /// <param name="currentErrorMessage">mensagem atual retornada da requisição</param>
  /// <param name="erroMessages">Classe que representa os erros retornados de uma request</param>
  /// <returns></returns>
  // [Obsolete("Não será mais necessário na versão 2.x, resolve a issue ref: https://github.com/iugu/iugu-net/issues/54")]
  //      static Future<ErrorResponseMessage> buildAsync(String currentErrorMessage) async
  //     {
  //         try
  //         {
  //             var jsonMessage = await Future.fromResult(JsonConvert.DeserializeObject<IuguCompleteComplexErrorResponse>(currentErrorMessage))
  //                                         .ConfigureAwait(false);

  //             var errors = jsonMessage.Message.Errors.Select(e => new ErrorMessage(e.Key, e.Value.Values<string>().ToArray())).ToList();
  //             return new ErrorResponseMessage(jsonMessage.StatusCode, jsonMessage.ReasonPhase, errors);
  //         }
  //         catch (Exception)
  //         {
  //             try
  //             {
  //                 var jsonMessage = await Future.FromResult(JsonConvert.DeserializeObject<IuguCompleteSimpleErrorResponse>(currentErrorMessage))
  //                                             .ConfigureAwait(false);

  //                 return new ErrorResponseMessage(jsonMessage.StatusCode, jsonMessage.ReasonPhase, jsonMessage.Message);
  //             }
  //             catch (Exception)
  //             {
  //                 return null;
  //             }
  //         }
  //     }
  // }
}

class ErrorMessage {
  String fieldName;
  List<String> errors;

  ErrorMessage(String fieldName, List<String> errors) {
    fieldName = fieldName;
    errors = errors;
  }
}

class IuguCompleteComplexErrorResponse {
  int statusCode;
  String reasonPhase;
  UnformattedErrorMessage message;
}

class UnformattedErrorMessage {
  Map<String, List> errors;
}

class IuguCompleteSimpleErrorResponse {
  int statusCode;
  String reasonPhase;
  String message;
}
