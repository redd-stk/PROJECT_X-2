import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_x/src/features/screens/account_details_screen/account_details.dart';

import '../../../../constants/constants.dart';
import '../../../../size_config/size_config.dart';

class my_account extends StatelessWidget {
  const my_account({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(() => AccountScreen());
      },
      child: Column(
        children: [
          Container(
            height: getScreenHeight(130),
            width: getScreenWidth(165),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 1.0,
                  image: AssetImage("assets/images/12.png")),
              color: appPrimaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Color.fromARGB(255, 101, 170, 235)),
            height: getScreenHeight(40),
            width: getScreenWidth(165),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: getScreenWidth(5)),
                  child: Text("My Account",
                      style: TextStyle(
                          fontSize: getScreenWidth(19),
                          fontWeight: FontWeight.w900,
                          color: const Color.fromARGB(200, 49, 49, 49))),
                ),
                Padding(
                  padding: EdgeInsets.only(right: getScreenWidth(2)),
                  child: Icon(
                    color: const Color.fromARGB(200, 49, 49, 49),
                    Icons.arrow_forward,
                    size: getScreenWidth(28),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
