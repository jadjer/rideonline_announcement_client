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

import 'package:announcement/src/AppRouteName.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../data/domain/Event.dart';
import '../../service/AnnouncementService.dart';
import '../../widget/EventDetails.dart';
import '../../widget/PointOnMap.dart';

class EventDetailsScreen extends StatelessWidget {
  final int eventId;

  const EventDetailsScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final events = context.read<AnnouncementService>();
    final futureEvent = events.getEventById(eventId);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                context.goNamed(
                  AppRouteName.eventEdit,
                  params: {'eventId': eventId.toString()},
                );
              },
            ),
          ],
        ),
        body: FutureBuilder<Event?>(
          future: futureEvent,
          builder: (BuildContext context, AsyncSnapshot<Event?> snapshot) {
            if (snapshot.hasError) {
              final error = snapshot.error;

              return Center(
                child: Text(error.toString()),
              );
            }

            if (snapshot.hasData) {
              final event = snapshot.data!;

              return SlidingUpPanel(
                backdropEnabled: true,
                defaultPanelState: PanelState.OPEN,
                minHeight: 80,
                panel: EventDetails(event: event),
                body: const PointOnMap(
                  latitude: 55.171356,
                  longitude: 30.261677,
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
