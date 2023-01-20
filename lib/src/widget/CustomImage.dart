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

import 'dart:io';

import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageWidget;
  final double? height;
  final double? backgroundHeight;
  final double? backgroundWidth;
  final double? width;

  const CustomImage(
      {super.key,
      required this.imageWidget,
      this.height,
      this.width,
      this.backgroundHeight,
      this.backgroundWidth});

  @override
  Widget build(BuildContext context) {
    if (imageWidget.startsWith("http://") ||
        imageWidget.startsWith("https://")) {
      return Image.network(
        imageWidget,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    } else if (imageWidget.isEmpty) {
      return Container(
        height: backgroundHeight,
        width: backgroundWidth,
        color: Colors.white,
        alignment: Alignment.center,
        child: Icon(
          Icons.image,
          size: height,
          color: Colors.black,
        ),
      );
    } else {
      return Image.file(
        File(imageWidget),
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    }
  }
}
