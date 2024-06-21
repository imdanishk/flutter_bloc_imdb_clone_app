import 'package:injectable/injectable.dart';

import '../../domain/entities/token_data.dart';
import '../../domain/repositories/token_repository.dart';
import '../local/token_storage.dart';

@Singleton(as: TokenRepository)
class TokenRepositoryImpl implements TokenRepository {
  const TokenRepositoryImpl(this._storage);

  final TokenStorage _storage;

  @override
  Future<TokenData?> getToken() async {
    return await _storage.getToken();
  }

  @override
  Future<String> getBearerToken() async {
    final token = await _storage.getToken();
    return 'Bearer ${token!.accessToken}';
  }
}
