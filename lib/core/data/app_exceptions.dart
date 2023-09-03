



class AppException implements Exception{

  final _message;
  final _prefix;

  AppException([this._prefix ,this._message]);

  String toString(){
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? message]): super(message, "Error During Communication");

}

class BadRequestException extends AppException{
  BadRequestException([String? message]): super(message, "Invalid request");

}

class UnauthorizedtException extends AppException{
  UnauthorizedtException([String? message]): super(message, "Unauthorizedt request");

}

class InvalidInputException extends AppException{
  InvalidInputException([String? message]): super(message, "Invalid input");

}
