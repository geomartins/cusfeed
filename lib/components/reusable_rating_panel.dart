import 'package:cusfeed/app/services/rating_service.dart';
import 'package:cusfeed/components/reusable_icon_rating_box.dart';
import 'package:cusfeed/views/admin/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../config/constants.dart';
import '../views/admin/success.dart';

class ReusableRatingPanel extends StatelessWidget {
  final List<String> ratingTypes = [
    'bad',
    'good',
    'fair',
    'very_good',
    'excellent'
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> generateRatingPanel() {
      List<ReusableIconRatingBox> result = [];

      for (String ratingType in ratingTypes) {
        result.add(ReusableIconRatingBox(
          text: 'Smile',
          icon: FontAwesome.smile_o,
          color: kPrimaryColor,
          onPressed: () async {
            final data = {
              'date': '2020-07-24',
              'type': ratingType,
              'value': 1,
            };
            await RatingService()
                .insertOrUpdateRating(table: kTableName, data: data);
            print(await RatingService().fetchRatings(table: kTableName));

            Navigator.pushNamed(context, Success.id);
          },
        ));
      }
      return result;
    }

    return Wrap(
      alignment: WrapAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: generateRatingPanel(),
    );
  }
}
