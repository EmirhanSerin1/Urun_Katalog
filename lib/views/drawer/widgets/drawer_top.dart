import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


//Example User

class DrawerTop extends StatelessWidget {
  const DrawerTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            
              image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              "https://images.pexels.com/photos/3921000/pexels-photo-3921000.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            ),
          )),
          accountName: Text("Bessie Webb"),
          accountEmail: Text("bessie.webb@example.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              "https://randomuser.me/api/portraits/women/40.jpg",
            ),
          ),
        ),
      ],
    );
  }
}
