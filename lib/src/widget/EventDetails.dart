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

import 'package:flutter/material.dart';

import '../data/domain/Event.dart';

class EventDetails extends StatelessWidget {
  final Event event;

  const EventDetails({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(event.text),
      ],
    );
  }
}
