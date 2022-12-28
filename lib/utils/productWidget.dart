import 'package:flutter/material.dart';
import 'package:pos_ui/constants/appConstants.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 230,
        child: Stack(
          children: [
            Column(children: [
              Container(
                height: 60,
                color: Colors.transparent,
              ),
              Container(
                height: 160,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(111, 198, 253, 248),
                        spreadRadius: 1,
                        blurRadius: 12)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Text(
                      'Ceramic Vases',
                      style: TextStyle(
                          color: blueAppColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rustic Home Decor',
                      style: TextStyle(
                        color: const Color(0xFF333333).withOpacity(0.3),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'S/',
                          style: TextStyle(
                              color: const Color(0xFF333333).withOpacity(0.3),
                              fontSize: 16),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '12,12',
                          style: TextStyle(
                              color: blueAppColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]),
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width * 0.1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'images/vase.jpg',
                  height: 120,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ));
  }
}
