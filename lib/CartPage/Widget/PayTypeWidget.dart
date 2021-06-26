import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayTypeWidget extends StatefulWidget {
  PayTypeWidget({this.payType});

  int payType;

  @override
  _PayTypeWidgetState createState() => _PayTypeWidgetState();
}

class _PayTypeWidgetState extends State<PayTypeWidget> {
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
              color: widget.payType == 0 ? Colors.grey : Colors.green,
            ),
            SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter set /*You can rename this!*/)=> SingleChildScrollView(
                        child: Container(
                          height: 516,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Image.asset("assets/images/Icon2.png"),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                "وسيلة الدفع",
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
                                "الرجاء اختر وسيلة الدفع المناسبة لك",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Changa",
                                ),
                              ),
                              Text(
                                "لاتمام طلبك",
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
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      set(() {
                                        widget.payType = 1;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 35,
                                        left: 35,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.check_circle_outline,color: widget.payType == 1 ? Colors.green : Colors.grey,),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "نقدي عند الاستلام",
                                                  style: TextStyle(
                                                    fontFamily: "Changa",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textDirection: TextDirection.rtl,
                                                ),
                                                Text(
                                                  "سيتم تسليم المبلغ نقذي لمنذوب التوصيل",
                                                  style: TextStyle(
                                                    fontFamily: "Changa",
                                                    fontSize: 12,
                                                  ),
                                                  textDirection: TextDirection.rtl,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(Icons.credit_card,),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 1,
                                    width: MediaQuery.of(context).size.width,
                                    color: Color(0xff8F92A1),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      set(() {
                                        widget.payType = 2;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 35,
                                        left: 35,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.check_circle_outline,color: widget.payType == 2 ? Colors.green : Colors.grey,),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "بطاقة مصرفية",
                                                  style: TextStyle(
                                                    fontFamily: "Changa",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textDirection: TextDirection.rtl,
                                                ),
                                                Text(
                                                  "أملك بطاقة مصرفية و اود الدفع بيها",
                                                  style: TextStyle(
                                                    fontFamily: "Changa",
                                                    fontSize: 12,
                                                  ),
                                                  textDirection: TextDirection.rtl,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(Icons.credit_card,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
                    widget.payType == 0 ? "اضافة" : "تغير",
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
                    "وسيلة الدفع",
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: "Changa",
                    ),
                  ),
                  Text(
                    "نقدي عند الاستلام",
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
