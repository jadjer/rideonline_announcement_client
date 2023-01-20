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

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final Color? backGroundColor;
  final VoidCallback? onButtonPressed;
  final double? buttonSize;
  final double? elevation;
  final double radius;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.iconColor,
    this.backGroundColor,
    this.onButtonPressed,
    this.buttonSize = 20.0,
    this.radius = 20.0,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      elevation: elevation ?? 0.0,
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onButtonPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: backGroundColor,
          ),
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: buttonSize,
          ),
        ),
      ),
    );
  }
}
