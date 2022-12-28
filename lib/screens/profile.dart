import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_ui/constants/appConstants.dart';
import 'package:pos_ui/screens/editProfile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: blueAppColor,
                  radius: 25,
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.white,
                    // backgroundColor: const Color.fromARGB(129, 152, 248, 227),
                    child: SvgPicture.asset(
                      'assets/human.svg',
                      height: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: const Color(0xFF333333).withOpacity(0.3),
                      ),
                    ),
                    const Text(
                      'Mr. Mark John',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/logout.svg',
                  height: 25,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: const Color(0xFF333333).withOpacity(0.3),
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(
            height: 36,
          ),
          ProfilePageWidgetz(
            svg: 'assets/transactions.svg',
            name: 'Transfer Funds',
          ),
          const SizedBox(
            height: 36,
          ),
          ProfilePageWidgetz(
            svg: 'assets/cc.svg',
            name: 'My Cards',
          ),
          const SizedBox(
            height: 36,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const EditProfile();
              }));
            },
            child: ProfilePageWidgetz(
              svg: 'assets/profile.svg',
              name: 'Profile',
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          ProfilePageWidgetz(
            svg: 'assets/settings.svg',
            name: 'Settings',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            decoration: BoxDecoration(
                color: tealAppColorLight,
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/headphone.svg',
                  height: 30,
                  color: tealAppColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'How Can We Help You?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: tealAppColorBg),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}

class ProfilePageWidgetz extends StatelessWidget {
  final String name;
  final String svg;
  ProfilePageWidgetz({Key? key, required this.name, required this.svg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svg,
            height: 20,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_right_rounded,
            size: 20,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
