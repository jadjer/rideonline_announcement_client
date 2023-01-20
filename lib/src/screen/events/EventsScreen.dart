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

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../AppRouteName.dart';
import '../../data/domain/Event.dart';
import '../../service/EventsService.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    final events = context.read<EventsService>();
    final eventsStream = events.getEventsStream();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
        ),
        body: StreamBuilder<Event>(
          stream: eventsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.error.toString());
            }

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('None');
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                return const Text('Active');
              case ConnectionState.done:
                return const Text('Done');
            }
          },
        ),
      ),
    );

    // return SafeArea(
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Events'),
    //     ),
    //     body: FutureBuilder<List<Event>>(
    //       future: futureEvents,
    //       initialData: const [],
    //       builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
    //         if (snapshot.hasError) return Text(snapshot.error.toString());
    //         if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
    //
    //         return RefreshIndicator(
    //           onRefresh: () {
    //             return Future(() => setState(() {}));
    //           },
    //           child: EventList(events: snapshot.data!, onTap: _handleEventTapped),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }

  void _handleEventTapped(Event event) {
    context.goNamed(AppRouteName.eventDetail, params: {'eventId': event.id.toString()});
  }
}
