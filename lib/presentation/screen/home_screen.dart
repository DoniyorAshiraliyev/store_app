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

      ),
      body: SafeArea(
        child: Stack(
          children: [
            /// Category
            SizedBox(
              height: 50,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      Category category = Category.fromJson(categories[index]);
                      return CategoryItem(
                        onTap: () {
                          if (state is HomeSuccessProductState) {
                            if (category.id == state.category) return;
                          }
                          if (category.id == "all") {
                            context.read<HomeBloc>().add(HomeGetAllProduct());
                            return;
                          }
                          context.read<HomeBloc>().add(
                              HomeGetProductWithCategory(category: category.id));
                        },
                        category: category,
                        selectedId: "selectedCategoryId",
                      );
                    },
                  );
                },
              ),
            ),

            BlocBuilder<HomeBloc, HomeState>(
              bloc: context.read<HomeBloc>(),
              builder: (context, state) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: GridView.builder(
                        // padding: const EdgeInsets.all(10.0),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // crossAxisSpacing: 10,
                          childAspectRatio: 2 / 3.3,
                        ),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return GestureDetector(
                            onTap: () => {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => DetailsScreen(product: product),
                                ),
                              )
                            },
                            child: CustomProductWidget(
                              color: Colors.primaries[index%17],
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
          ],
        ),
      ),
    );

  }
}
