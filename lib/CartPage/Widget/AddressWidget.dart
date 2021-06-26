import 'package:flutter/material.dart';
import 'package:post_storage/core/Widget/InputText.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({this.address});

  final TextEditingController address;

  @override
  _AddressWidgetState createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        border: Border.all(
          color: Color(0xffF3F6F8),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        child: Row(
          children: [
            Icon(
              Icons.check,
              color: widget.address.text == "" ? Colors.grey : Colors.green,
            ),
            SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () async {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => SingleChildScrollView(
                    child: Container(
                      height: 440,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Image.asset("assets/images/Icon.png"),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "العنوان التوصيل",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              fontFamily: "Changa",
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "الرجاء ادخال العنوان وأقرب نقطة دالة",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Changa",
                            ),
                          ),
                          Text(
                            "حتي يتم التوصيل",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Changa",
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 23,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 35,
                              right: 35,
                            ),
                            child: InputText(
                              hint: "أدخل العنوان",
                              label: "العنوان",
                              have: false,
                              suffixIcon: Icons.location_on_sharp,
                              controller: widget.address,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Container(
                              height: 44,
                              width: 305,
                              decoration: BoxDecoration(
                                color: Color(0xffB4DCFE),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Center(
                                child: Text(
                                  "تطبيق",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    fontFamily: "Changa",
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                width: 56,
                height: 24,
                decoration: BoxDecoration(
                  color: Color(0xffB4DCFE),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Center(
                  child: Text(
                    widget.address.text == "" ? "اضافة" : "تغير",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: "Changa",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.address.text,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: "Changa",
                    ),
                  ),
                  Text(
                    "1-3 ايام",
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Changa",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(Icons.shopping_cart),
          ],
        ),
      ),
    );
  }
}
