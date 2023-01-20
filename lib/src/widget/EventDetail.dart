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
import 'CustomIconButton.dart';
import 'CustomImage.dart';
import 'CustomText.dart';

class EventDetail extends StatelessWidget {
  final Event event;

  const EventDetail({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(18.5),
      child: Container(
        width: 250.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.5),
        ),
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.5),
              child: Stack(
                children: [
                  Center(
                    child: CustomImage(
                      imageWidget: event.picture,
                      height: 180,
                      width: 230,
                    ),
                  ),
                  const Positioned(
                    right: 10.0,
                    top: 10.0,
                    child: CustomIconButton(
                      // icon: exploreItem.isInFavorite == "true"
                      //     ? Icons.favorite : Icons.favorite_border,
                      icon: Icons.favorite,
                      iconColor: Colors.white,
                      backGroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
              ),
              child: CustomText(
                text: event.title,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
              ),
              child: CustomText(
                text: event.text,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                textColor: Colors.black45,
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(top: 10.0,),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(right: 10.0,),
            //         child: CustomTextWidget(
            //           text: "\$${exploreItem.itemPrice}",
            //           fontSize: 18.0,
            //           fontWeight: FontWeight.bold,
            //           textColor: ColorConstant.kBlackColor,
            //         ),
            //       ),
            //       const Spacer(),
            //       CustomIconButton(
            //         radius: 30.0,
            //         icon: Icons.add,
            //         iconColor: ColorConstant.kWhiteColor,
            //         backGroundColor: ColorConstant.kBlackColor,
            //         onButtonPressed: onAddButton,
            //         buttonSize: 28.0,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
