import 'package:flutter/material.dart';
import 'package:flutter_drawer/components/drawer_item.dart';
import 'package:flutter_drawer/components/dummy_avatar.dart';
import 'package:flutter_drawer/env.dart';
import 'package:flutter_drawer/modules/home_screen/home_screen_controller.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: controller.openDrawer,
          ),
          title: const Text("Home Screen"),
        ),
        key: controller.scaffoldKey,
        drawer: _buildDrawer(context),
        body: Center(
          child: Text(
            "Flutter Drawer",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue.withOpacity(0.8),
                Colors.red,
              ],
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Profile picture, username & phone number
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile picture
                    // todo: update dynamically
                    const DummyAvatar(
                      name: "Faiz",
                      radius: 35.0,
                    ),
                    const SizedBox(width: 15.0),
                    // User name & phone number
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // todo: update dynamically
                        // Username
                        Text("Faiz",
                            style: Theme.of(context).textTheme.headline6),
                        const SizedBox(height: 3.0),
                        // todo: update dynamically
                        // Phone Number
                        Text("+92 000 0000000",
                            style: Theme.of(context).textTheme.caption),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                // Rating bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GFRating(
                      onChanged: (v) {},
                      size: GFSize.SMALL,
                      // todo: update dynamically
                      value: 3.3,
                      color: Colors.yellow,
                      borderColor: Colors.grey,
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      // todo: update dynamically
                      "4.3",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Profile link
          DrawerItem(
            onTap: () {
              // todo: navigate to specific screen
            },
            leading: Icons.person_rounded,
            title: "Profile",
          ),
          // Link 2
          DrawerItem(
            onTap: () {
              // todo: navigate to specific screen
            },
            leading: Icons.call,
            title: "Screen 2",
          ),
          // Link 3
          DrawerItem(
            onTap: () {
              // todo: navigate to specific screen
            },
            leading: Icons.run_circle_outlined,
            title: "Screen 3",
          ),

          // Custtomer support link
          DrawerItem(
              onTap: () async {
                // Open whatsapp
                const url = "whatsapp://send?phone=$phnNumber";
                await canLaunch(url)
                    ? await launch(url)
                    : GFToast.showToast("Please Install Whatsapp", context);
              },
              leading: Icons.support_agent_rounded,
              title: "Customer Support"),
          // Share link
          DrawerItem(
            // todo: Implement application link
            onTap: () => Share.share("Testing"),
            leading: Icons.share_rounded,
            title: 'Share',
          ),
        ],
      ),
    );
  }
}
