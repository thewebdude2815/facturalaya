// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_ui/constants/appConstants.dart';
import 'package:pos_ui/screens/addProducts.dart';
import 'package:pos_ui/utils/productWidget.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: const Color.fromARGB(73, 130, 199, 255),
                  child: SvgPicture.asset(
                    'assets/product.svg',
                    color: blueAppColor,
                    height: 22,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Products',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const AddProducts();
                    }));
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: blueAppColor),
                    ),
                    child: Text(
                      'Add New',
                      style: TextStyle(color: blueAppColor),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: !isPortrait ? 1 : 0.81,
              crossAxisCount: !isPortrait ? 3 : 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              children: List.generate(
                20,
                (index) {
                  return const ProductWidget();
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
