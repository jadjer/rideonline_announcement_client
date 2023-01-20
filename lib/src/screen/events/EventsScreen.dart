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
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../AppRouteName.dart';
import '../../data/domain/Event.dart';
import '../../service/AnnouncementService.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    final events = context.read<AnnouncementService>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
        ),
        body: FutureBuilder<List<Event>>(
          future: events.getEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final eventsData = snapshot.data!;

              List<Card> eventsCards = [];

              for (final event in eventsData) {
                eventsCards.add(Card(
                  child: Text(event.title),
                ));
              }

              return ListView(
                children: eventsCards,
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(child: Text('None'));
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return const Center(child: Text('Active'));
                case ConnectionState.done:
                  return const Center(child: Text('Done'));
              }
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.goNamed(AppRouteName.eventCreate);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _handleEventTapped(Event event) {
    context.goNamed(AppRouteName.eventDetail, params: {'eventId': event.id.toString()});
  }
}
