import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:movies_books/core/login/account/my_account_page_content.dart';
import 'package:movies_books/core/login/auth/user_profile.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/presentation/tv/TV_page_content.dart';
import 'package:movies_books/presentation/book/book_page_content.dart';
import 'package:movies_books/presentation/game/game_page_content.dart';
import 'package:movies_books/presentation/movie/pages/movie_page_content.dart';
import 'package:movies_books/presentation/wishlist/wishlist_page_content.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.currentUser}) : super(key: key);

  final User currentUser;

  @override
  State<HomePage> createState() => _HomePageState();
}

var currentIndex = 0;

class _HomePageState extends State<HomePage> {
  final usersQuery = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.waterloo,
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/user.svg'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const UserProfileScreen()),
                ),
              );
            },
          ),
        ],
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return MoviePageContent();
        }
        if (currentIndex == 1) {
          return TVPageContent();
        }
        if (currentIndex == 2) {
          return WishlistPageContent();
        }
        if (currentIndex == 3) {
          return BookPageContent();
        }
        if (currentIndex == 4) {
          return GamePageContent();
        }

        return MyAccountPageContent(email: widget.currentUser.email);
      }),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        backgroundColor: Color.fromARGB(255, 68, 182, 239),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_outlined,
                color:
                    currentIndex == 0 ? AppColor.burntSienna : AppColor.cello),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.tv,
              color: currentIndex == 1 ? AppColor.burntSienna : AppColor.cello,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline_rounded,
              color: currentIndex == 2 ? AppColor.burntSienna : AppColor.cello,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_outlined,
              color: currentIndex == 3 ? AppColor.burntSienna : AppColor.cello,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.videogame_asset_outlined,
              color: currentIndex == 4 ? AppColor.burntSienna : AppColor.cello,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}


/* body: FirestoreListView<Map<String, dynamic>>(
          query: usersQuery,
          itemBuilder: (context, snapshot) {
            Map<String, dynamic> user = snapshot.data();
            return Text('User name is ${user['name']}');
          }), */