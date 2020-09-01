import 'package:dartz/dartz.dart';
import 'package:iugu/errors/failure_interface.dart';

import 'create_token_model.dart';

abstract class ICreateToken {
  Future<Either<IFailure, CreateTokenModel>> call(CreateTokenModel mode);
}

class CreateToken extends ICreateToken {
  @override
  Future<Either<IFailure, CreateTokenModel>> call(CreateTokenModel model) {
    throw UnimplementedError();
  }
}
