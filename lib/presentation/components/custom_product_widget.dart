import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store_app/domain/models/product.dart';

class CustomProductWidget extends StatelessWidget {
  final ProductModel product;
  final Color color;

  const CustomProductWidget(
      {Key? key, required this.product, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAlias,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: CachedNetworkImage(
              height: 120,
              imageUrl: product.image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator.adaptive(
                    value: downloadProgress.progress,
                    strokeWidth: 1,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        maxLines: 2,
                        style: TextStyle(
                          color: Color(0xFF2F2D2C),
                          fontSize: 16,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      Text(
                        product.category.toUpperCase(),
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 12,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '\$ ${product.price}',
                        style: TextStyle(
                          color: Color(0xFF2F4B4E),
                          fontSize: 18,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 35,
                        width: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffc67c4e),
                        ),
                        child: Text(
                          "+",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
