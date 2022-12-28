import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_ui/constants/appConstants.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.arrow_back_ios)),
                    )),
                    const SizedBox(
                      width: 12,
                    ),
                    const Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            'Add Products',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )),
                    Expanded(child: Container())
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: blueAppColorBg),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/clip.svg',
                              height: 40,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Upload Image',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('images/vase.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(16),
                          // border: Border.all(color: blueAppColorBg),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              TextFieldWidget(
                svgIcon: 'assets/barcode.svg',
                hintText: 'Enter Product Code',
              ),
              TextFieldWidget(
                svgIcon: 'assets/product2.svg',
                hintText: 'Enter Product Name',
              ),
              TextFieldWidget(
                svgIcon: 'assets/price.svg',
                hintText: 'Price',
              ),

              // IGV Type
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(50, 198, 253, 248),
                        spreadRadius: 1,
                        blurRadius: 24)
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/percent.svg',
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Expanded(
                          child: Text(
                            'IGV Type',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    iconSize: 14,
                    iconEnabledColor: Colors.grey,
                    iconDisabledColor: Colors.grey,
                    buttonHeight: 60,
                    buttonWidth: double.infinity,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      color: Colors.white,
                    ),
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 200,
                    dropdownWidth: double.infinity,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: tealAppColor,
                    ),
                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    offset: const Offset(-20, 0),
                  ),
                ),
              ),
              Row(
                children: [
                  // Currency Dropdown
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(50, 198, 253, 248),
                              spreadRadius: 1,
                              blurRadius: 24)
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/currency.svg',
                                color: Colors.grey,
                                width: 25,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Expanded(
                                child: Text(
                                  'Currency',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
                          },
                          iconSize: 14,
                          iconEnabledColor: Colors.grey,
                          iconDisabledColor: Colors.grey,
                          buttonHeight: 60,
                          buttonWidth: double.infinity,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            color: Colors.white,
                          ),
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownWidth: double.infinity,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: tealAppColor,
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(-20, 0),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(width: 10),
                  // Category Dropdown
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(50, 198, 253, 248),
                              spreadRadius: 1,
                              blurRadius: 24)
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/category.svg',
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Expanded(
                                child: Text(
                                  'Category',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
                          },
                          iconSize: 14,
                          iconEnabledColor: Colors.grey,
                          iconDisabledColor: Colors.grey,
                          buttonHeight: 60,
                          buttonWidth: double.infinity,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            color: Colors.white,
                          ),
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownWidth: double.infinity,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: tealAppColor,
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(-20, 0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      svgIcon: 'assets/profit.svg',
                      hintText: 'Profit Max',
                    ),
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      svgIcon: 'assets/loss.svg',
                      hintText: 'Profit Min',
                    ),
                  ),
                ],
              ),
              // Unit Of Measurement
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(50, 198, 253, 248),
                        spreadRadius: 1,
                        blurRadius: 24)
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/measure.svg',
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Expanded(
                          child: Text(
                            'Unit Of Measurement',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    iconSize: 14,
                    iconEnabledColor: Colors.grey,
                    iconDisabledColor: Colors.grey,
                    buttonHeight: 60,
                    buttonWidth: double.infinity,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      color: Colors.white,
                    ),
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 200,
                    dropdownWidth: double.infinity,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: tealAppColor,
                    ),
                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    offset: const Offset(-20, 0),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      svgIcon: 'assets/price.svg',
                      hintText: 'Sale Price(IGV)',
                    ),
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      svgIcon: 'assets/price.svg',
                      hintText: 'Sale Price(No IGV)',
                    ),
                  ),
                ],
              ),
              TextFieldWidget(
                svgIcon: 'assets/price.svg',
                hintText: 'Minimum Sale Price',
              ),
              TextFieldWidget(
                svgIcon: 'assets/stock.svg',
                hintText: 'Minimum Stock',
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            boxShadow: const [],
            color: tealAppColor,
            borderRadius: BorderRadius.circular(20)),
        height: 60,
        child: const Center(
            child: Text(
          'Add Product',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  String hintText;
  String svgIcon;
  TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.svgIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(50, 198, 253, 248),
              spreadRadius: 1,
              blurRadius: 24)
        ],
      ),
      child: TextField(
        autocorrect: true,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SvgPicture.asset(
              svgIcon,
              color: Colors.grey,
              height: 25,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(maxHeight: 30),
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.transparent, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.transparent, width: 2),
          ),
        ),
      ),
    );
  }
}
