class AppExceptions implements Exception{
  final _message;
  final _prefix;
  AppExceptions([this._message,this._prefix]);

@override
  String toString(){
    return "$_prefix $_message";
  }
}
/// Exception for server to take more time
/// the max time should be 10sec for server
class FetchException extends AppExceptions{
  FetchException([String? message]):super(message="Error During Communication");
}

/// Exception for 404 not found
class BadRequestException extends AppExceptions{
  BadRequestException([String? message]):super(message="Invalid Request");
}

/// Exception for Unauthorised access
class UnauthorisedException extends AppExceptions{
  UnauthorisedException([String? message]):super(message="Unauthorised Request");
}

/// Exception for InvalidInput
class InvalidInputException extends AppExceptions{
  InvalidInputException([String? message]):super(message="Invalid Input");
}