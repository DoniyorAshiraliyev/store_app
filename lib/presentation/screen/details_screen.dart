import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store_app/domain/models/product.dart';
import 'package:store_app/presentation/screen/order_screen.dart';

class DetailsScreen extends StatefulWidget {
  final ProductModel product;

  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final ProductModel product = widget.product;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        title: const Text(
          'Detail',
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(30)),
            child:
              CachedNetworkImage(imageUrl: product.image,height: size.height * .3,)
            // Image(
            //   image: NetworkImage(
            //     widget.product.image,
            //   ),
            //   height: size.height * .3,
            // ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        product.title,
                        style: const TextStyle(
                          color: Color(0xFF2E2D2C),
                          fontSize: 20,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const Gap(5),
                      Text(
                        product.category.toUpperCase(),
                        style: const TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 12,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '4.8 ',
                                  style: TextStyle(
                                    color: Color(0xFF2F2D2C),
                                    fontSize: 16,
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '(230)',
                                  style: TextStyle(
                                    color: Color(0xFF7F7F7F),
                                    fontSize: 12,
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      const Text(
                        'Description',
                        style: TextStyle(
                          color: Color(0xFF2E2D2C),
                          fontSize: 16,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const Gap(15),
                      SizedBox(
                        width: 360,
                        child: Text(
                          product.description,
                          maxLines: 3,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => OrderScreen(
                product: product,
              ),
            ),
          ),
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 14,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      Text(
                        "\$ ${widget.product.price}",
                        style: const TextStyle(
                          color: Color(0xFFC67C4E),
                          fontSize: 18,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: size.width * .5,
                    height: 55,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFC67C4E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Buy Now',
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
        ),
      ),
    );
  }
}
