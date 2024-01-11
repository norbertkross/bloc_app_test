import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/dashboard_bloc.dart';

class MedicationsCarousel extends StatefulWidget {
  const MedicationsCarousel({
    super.key,
  });

  @override
  State<MedicationsCarousel> createState() => _MedicationsCarouselState();
}

class _MedicationsCarouselState extends State<MedicationsCarousel> {
  int carouselIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Column(
          children: [
            CarouselSlider(
                items: state.activeMedications?.map((element) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 2.0),
                        child: Card(
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          shadowColor: Colors.black.withOpacity(.3),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${element.medicationName}",
                                          style:const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          "${element.dosage}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 15,
                                              color: Theme.of(context)
                                                  .disabledColor),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 35.0,
                                          width: 35.0,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: element.morning ==true? Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(.08):null),
                                          child: Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: SvgPicture.asset(
                                                "assets/sunrise.svg"),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                        Container(
                                          height: 35.0,
                                          width: 35.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                             color: element.afternoon ==true?  Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(.08): null
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                                "assets/sun.svg"),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                        Container(
                                          height: 35.0,
                                          width: 35.0,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: element.evening ==true?  Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(.08): null),
                                          child: Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: SvgPicture.asset(
                                                "assets/moon.svg"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      );
                    },
                  );
                }).toList() ?? [],
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 1 / 1,
                  viewportFraction: 0.6,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlayInterval:const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeFactor: 0,
                  onPageChanged:
                      (int page, CarouselPageChangedReason changeReason) {                    
                    setState(() {
                      carouselIndex = page - 1;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int k = 0; k < 5; k++) ...[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                          color: carouselIndex == k
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor.withOpacity(.2),
                          shape: BoxShape.circle),
                    ),
                  ),
                ],
              ],
            ),
          ],
        );
      },
    );
  }
}
