import 'package:flutter/material.dart';
import 'package:fopers/screens/home_page.dart';
import 'package:fopers/src/auth/signIn.dart';
import 'package:fopers/theme/colors/light_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideDrawer extends StatelessWidget {
  final prefs;
  SideDrawer(this.prefs);
  var userId = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red[600],
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 300,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage("assets/images/wheelocity.png"),
                )),
              ),
            ]),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Color(0xff181A31)),
            title: RichText(
                text: TextSpan(
              text: 'Home',
              style: TextStyle(color: Color(0xff181A31), fontFamily: "Nexa"),
            )),
            onTap: () => {
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => HomePage(this.prefs)))
            },
          ),
          ListTile(
              leading: Icon(Icons.exit_to_app, color: Color(0xff181A31)),
              title: RichText(
                  text: TextSpan(
                text: 'Logout',
                style: TextStyle(color: Color(0xff181A31), fontFamily: "Nexa"),
              )),
              onTap: () => {logout(context)}),
        ],
      ),
    );
  }

  logout(BuildContext context) {
    logout() {
      if (this.prefs.getStringList("addedWeight") == null) {
        this.prefs.clear();
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => SignIn(this.prefs)));
      } else {
        if (this.prefs.getStringList("addedWeight").length > 0) {
          if (this.prefs.getInt("sentCount") != null &&
              (this.prefs.getInt("sentCount") ==
                  this.prefs.getStringList("addedWeight").length)) {
            this.prefs.clear();
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => SignIn(this.prefs)));
          } else {}
        } else {
          this.prefs.clear();
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => SignIn(this.prefs)));
        }
      }
    }
  }
}
