import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/domain/models/product.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF9F9F9),
        title: Text(
          'Order',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF2F2D2C),
            fontSize: 18,
            fontFamily: 'Sora',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: IconButton(
            icon: const Icon(CupertinoIcons.chevron_left),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.heart,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.only(
                      top: 4, left: 5, right: 6, bottom: 4),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Color(0xFFEFEFEF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFFC67C4E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Deliver',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Pick Up',
                                style: TextStyle(
                                  color: Color(0xFF2E2D2C),
                                  fontSize: 16,
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Delivery Address',
                style: TextStyle(
                  color: Color(0xFF2F2D2C),
                  fontSize: 16,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              Text(
                'Jl. Kpg Sutoyo',
                style: TextStyle(
                  color: Color(0xFF303336),
                  fontSize: 14,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              Text(
                'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
                style: TextStyle(
                  color: Color(0xFF7F7F7F),
                  fontSize: 12,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              Text(
                'Payment Summary',
                style: TextStyle(
                  color: Color(0xFF2E2D2C),
                  fontSize: 16,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                      color: Color(0xFF2E2D2C),
                      fontSize: 14,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  Text(
                    '\$ 4.53',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF2E2D2C),
                      fontSize: 14,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Fee',
                    style: TextStyle(
                      color: Color(0xFF2E2D2C),
                      fontSize: 14,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  Text(
                    '\$ 4.53',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF2E2D2C),
                      fontSize: 14,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Payment',
                    style: TextStyle(
                      color: Color(0xFF2E2D2C),
                      fontSize: 14,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  Text(
                    '\$ 4.53',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF2E2D2C),
                      fontSize: 14,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            // color: Color(0xFFC67C4E),
            borderRadius: BorderRadius.circular(16),
          ),
          height: 100,
          child: Column(
            children: [
              Icon(Icons.more_horiz),
              Container(
                width: 315,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFC67C4E),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'Order',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
