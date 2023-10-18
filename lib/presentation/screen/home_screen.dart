import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/domain/models/category.dart';
import 'package:store_app/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:store_app/presentation/components/category_item_widget.dart';
import 'package:store_app/presentation/components/custom_product_widget.dart';
import 'package:store_app/presentation/screen/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Sora',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -0.24,
              ),
            ),
            Text(
              'Bilzen,Tanjungbalai',
              style: TextStyle(
                color: Color(0xFFDDDDDD),
                fontSize: 14,
                fontFamily: 'Sora',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            /// Category
            Column(
              children: [
                // Container(
                //   width: 315,
                //   height: 52,
                //   clipBehavior: Clip.antiAlias,
                //   decoration: ShapeDecoration(
                //     color: Color(0xFF313131),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(15),
                //     ),
                //   ),
                //   child: Stack(
                //     children: [
                //
                //
                //       Align(
                //         alignment: Alignment.center,
                //         child: Text(
                //           'Search coffee',
                //           style: TextStyle(
                //             color: Color(0xFF979797),
                //             fontSize: 14,
                //             fontFamily: 'Sora',
                //             fontWeight: FontWeight.w400,
                //             height: 0,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         width: 44,
                //         height: 44,
                //         padding: const EdgeInsets.all(12),
                //         clipBehavior: Clip.antiAlias,
                //         decoration: ShapeDecoration(
                //           color: Color(0xFFC67C4E),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(12),
                //           ),
                //         ),
                //         child: Icon(Icons.sort)
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            width: 44,
                            height: 44,
                            padding: const EdgeInsets.all(12),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFC67C4E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Icon(Icons.sort)
                          ),
                        ),
                        prefixIcon: const Padding(
                            padding: EdgeInsets.only(
                                top: 15, bottom: 15, left: 15, right: 15),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        filled: true,
                        fillColor: const Color(0xFF313131),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        hintText: "Search coffees"),
                    obscureText: false,
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          Category category =
                              Category.fromJson(categories[index]);
                          return CategoryItem(
                            onTap: () {
                              if (state is HomeSuccessProductState) {
                                if (category.id == state.category) return;
                              }
                              if (category.id == "all") {
                                context
                                    .read<HomeBloc>()
                                    .add(HomeGetAllProduct());
                                return;
                              }
                              context.read<HomeBloc>().add(
                                  HomeGetProductWithCategory(
                                      category: category.id));
                            },
                            category: category,
                            selectedId: "selectedCategoryId",
                          );
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    bloc: context.read<HomeBloc>(),
                    builder: (context, state) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: GridView.builder(
                              // padding: const EdgeInsets.all(10.0),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                // crossAxisSpacing: 10,
                                childAspectRatio: 2 / 2.5,
                              ),
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                final product = state.products[index];
                                return GestureDetector(
                                  onTap: () => {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            DetailsScreen(product: product),
                                      ),
                                    )
                                  },
                                  child: CustomProductWidget(
                                    color: Colors.primaries[index % 17],
                                    product: product,
                                  ),
                                );
                              },
                            ),
                          ),
                          if (state is HomeLoadingState)
                            Center(
                              child: CircularProgressIndicator(),
                            )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
