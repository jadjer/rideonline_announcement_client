// Copyright 2023 Pavel Suprunov
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../AuthRepository.dart';
import '../../domain/Phone.dart';
import '../../domain/Token.dart';
import '../../domain/Username.dart';
import '../../model/AuthResponse.dart';
import '../../model/ChangePasswordRequest.dart';
import '../../model/ChangePasswordResponse.dart';
import '../../model/ExistResponse.dart';
import '../../model/LoginRequest.dart';
import '../../model/PhoneTokenResponse.dart';
import '../../model/RegisterRequest.dart';
import '../../model/TokenResponse.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _baseUrl = 'auth.ride2online.jadjer.by';

  late Client _client;

  AuthRepositoryImpl(Client client) {
    _client = client;
  }

  @override
  Future<PhoneTokenResponse> getVerificationCode(Phone request) async {
    final url = Uri.https(_baseUrl, 'get_verification_code');

    final response = await _client.post(url, body: jsonEncode(request.toJson()));
    final responseJson = jsonDecode(response.body);

    return PhoneTokenResponse.fromJson(responseJson);
  }

  @override
  Future<AuthResponse> login(LoginRequest request) async {
    final url = Uri.https(_baseUrl, 'login');

    final response = await _client.post(url, body: jsonEncode(request.toJson()));
    final responseJson = jsonDecode(response.body);

    return AuthResponse.fromJson(responseJson);
  }

  @override
  Future<AuthResponse> register(RegisterRequest request) async {
    final url = Uri.https(_baseUrl, 'register');

    final response = await _client.post(url, body: jsonEncode(request.toJson()));
    final responseJson = jsonDecode(response.body);

    return AuthResponse.fromJson(responseJson);
  }

  @override
  Future<TokenResponse> getToken(LoginRequest request) async {
    final url = Uri.https(_baseUrl, 'token/get');

    final response = await _client.post(url, body: jsonEncode(request.toJson()));
    final responseJson = jsonDecode(response.body);

    return TokenResponse.fromJson(responseJson);
  }

  @override
  Future<TokenResponse> refreshToken(Token request) async {
    final url = Uri.https(_baseUrl, 'token/refresh');

    final response = await _client.post(url, body: jsonEncode(request.toJson()));
    final responseJson = jsonDecode(response.body);

    return TokenResponse.fromJson(responseJson);
  }

  @override
  Future<ExistResponse> existPhone(Phone request) async {
    final url = Uri.https(_baseUrl, 'exist/phone');

    final response = await _client.post(url, body: jsonEncode(request.toJson()));
    final responseJson = jsonDecode(response.body);

    return ExistResponse.fromJson(responseJson);
  }

  @override
  Future<ExistResponse> existUsername(Username request) async {
    final url = Uri.https(_baseUrl, 'exist/username');

    final response = await _client.post(url, body: jsonEncode(request.toJson()));
    final responseJson = jsonDecode(response.body);

    return ExistResponse.fromJson(responseJson);
  }

  @override
  Future<ChangePasswordResponse> changePassword(ChangePasswordRequest request) async {
    final url = Uri.https(_baseUrl, 'change_password');

    final response = await _client.post(url, body: jsonEncode(request.toJson()));
    final responseJson = jsonDecode(response.body);

    return ChangePasswordResponse.fromJson(responseJson);
  }
}
