import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dashboard_bloc.dart';
import 'slider_with_info.dart';

class TrackingMeasuresCarousel extends StatefulWidget {
  const TrackingMeasuresCarousel({
    super.key,
  });

  @override
  State<TrackingMeasuresCarousel> createState() =>
      _TrackingMeasuresCarouselState();
}

class _TrackingMeasuresCarouselState extends State<TrackingMeasuresCarousel> {
  int carouselIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Column(
          children: [
            CarouselSlider(
                items: state.trackingMeasures?.map((element) {
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
                                          "${element.datePurchased}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14),
                                        ),
                                        const Divider()
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Wrap(
                                        alignment: WrapAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${element.testResultsName}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "${element.testResultsValue}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.red,
                                                    fontSize: 14),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.red
                                                      .withOpacity(.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: const Padding(
                                                  padding:  EdgeInsets
                                                      .symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 8.0),
                                                  child: Text(
                                                    "Off Track",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SliderWithInfo(
                                      max: element.maxValue,
                                      min: element.minValue,
                                      lastTestResults: element.lastTestResults,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      );
                    },
                  );
                }).toList()  ?? [],
                options: CarouselOptions(
                  height: 200,
                  // aspectRatio: 16 / 9,
                  aspectRatio: 1 / 1,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  // autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  // enlargeCenterPage: true,
                  // enlargeFactor: 0.3,
                  enlargeFactor: 0,
                  onPageChanged:
                      (int page, CarouselPageChangedReason changeReason) {
                    // debugPrint("P:${page} CNG: ${changeReason}");
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
