import 'package:flutter/cupertino.dart';
import 'package:movies_books/core/resources/app_colors.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                  width: 140,
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColor.burntSienna,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Container(
                          width: 40,
                          height: 30,
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColor.waterloo,
                              borderRadius: BorderRadius.circular(6)),
                          alignment: Alignment.center,
                          child: Text('9.0',
                              style: TextStyle(color: AppColor.cello)))
                    ],
                  ));
            }));
  }
}
