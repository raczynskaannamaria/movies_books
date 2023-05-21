import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: GoogleFonts.arimo(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Text(
                'See all',
                style: GoogleFonts.arimo(fontSize: 15),
              ),
            ],
          )),
    );
  }
}
