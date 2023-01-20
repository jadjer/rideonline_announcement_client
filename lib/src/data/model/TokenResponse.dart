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

import '../domain/Token.dart';

class TokenResponse {
  final bool success;
  final String message;
  final Token? token;

  TokenResponse({
    required this.success,
    required this.message,
    this.token,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    final success = json['success'] as bool;
    final message = json['message'] as String;

    if (!success) return TokenResponse(success: success, message: message);

    return TokenResponse(
      success: success,
      message: message,
      token: Token.fromJson(json['payload']),
    );
  }
}
