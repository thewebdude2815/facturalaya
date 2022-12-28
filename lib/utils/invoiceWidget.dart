import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_ui/constants/appConstants.dart';
import 'package:pos_ui/screens/addProducts.dart';

class InvoiceWidget extends StatefulWidget {
  const InvoiceWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<InvoiceWidget> createState() => _InvoiceWidgetState();
}

class _InvoiceWidgetState extends State<InvoiceWidget> {
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
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: tealAppColorLight.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1)
          ]),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'F001-126',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text('TECSOLUTIONS AQP EIRL'),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '13-12-2022 / 15:48 PM',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              const Spacer(),
              const Text(
                'S/ 122,9',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Divider(
            color: blueAppColorLight,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/status.svg',
                      color: tealAppColorBg.withOpacity(0.3),
                      height: 15,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Paid',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/createInvoice.svg',
                      color: tealAppColorBg.withOpacity(0.3),
                      height: 15,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        showTicketSheet(context);
                      },
                      child: const Text(
                        'Create ticket',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showTicketSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.8,
          maxChildSize: 0.8,
          minChildSize: 0.15,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              height: 300.0,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: const [
                          Text(
                            "Create Ticket",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                'assets/user.svg',
                                height: 22,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Expanded(
                                child: Text(
                                  'Type Ident. Doc.',
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
                    TextFieldWidget(
                      svgIcon: 'assets/pencil.svg',
                      hintText: 'Identity Document No.',
                    ),
                    TextFieldWidget(
                      svgIcon: 'assets/card.svg',
                      hintText: 'Customer Name',
                    ),
                    TextFieldWidget(
                      svgIcon: 'assets/home.svg',
                      hintText: 'Location',
                    ),
                    TextFieldWidget(
                      svgIcon: 'assets/globe.svg',
                      hintText: 'Ubigeo',
                    ),
                    TextFieldWidget(
                      svgIcon: 'assets/call.svg',
                      hintText: 'Cell phone number',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          boxShadow: const [],
                          color: tealAppColor,
                          borderRadius: BorderRadius.circular(20)),
                      height: 60,
                      child: const Center(
                          child: Text(
                        'Add Ticket',
                        style: TextStyle(color: Colors.white),
                      )),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
