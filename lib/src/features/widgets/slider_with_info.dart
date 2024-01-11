import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dashboard_bloc.dart';


class SliderWithInfo extends StatefulWidget {
  final int? min;
  final int? max;
  final String? lastTestResults;

  const SliderWithInfo({this.min, this.max, this.lastTestResults});
  @override
  _SliderWithInfoState createState() => _SliderWithInfoState();
}

class _SliderWithInfoState extends State<SliderWithInfo> {
  double _sliderValue = 0.5;
  final List<Color> _colors = [
    Color.fromARGB(255, 255, 0, 0),
    Color(0xff22C55E),
    Color.fromARGB(255, 255, 0, 127),
  ];

  sliderWidth() => ((MediaQuery.of(context).size.width * .8) - (26));
  double _colorSliderPosition = 0.0;
  _colorChangeHandler(double position) {
    //handle out of bounds positions
    if (position > sliderWidth() - 20.0) {
      position = (sliderWidth() - 30.0);
    }
    if (position < 0) {
      position = 0;
    }
    debugPrint("New pos: $position");
    setState(() {
      _colorSliderPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double sliderWidth = (MediaQuery.of(context).size.width * .8 - 26);
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  width: sliderWidth(),
                  height: 30,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Center(
                          child: Container(
                            width: sliderWidth(),
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 4,
                                  width: sliderWidth() * .2,
                                  color: _colors[0],
                                ),
                                Container(
                                  height: 4,
                                  width: sliderWidth() * .6,
                                  color: _colors[1],
                                ),
                                Container(
                                  height: 4,
                                  width: sliderWidth() * .2,
                                  color: _colors[2],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: _colorSliderPosition,
                        right: 0.0,
                        // bottom: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onHorizontalDragStart: (DragStartDetails details) {
                              _colorChangeHandler(details.localPosition.dx);
                            },
                            onHorizontalDragUpdate:
                                (DragUpdateDetails details) {
                              _colorChangeHandler(details.localPosition.dx);
                            },
                            onTapDown: (TapDownDetails details) {
                              _colorChangeHandler(details.localPosition.dx);
                            },
                            //This outside padding makes it much easier to grab the   slider because the gesture detector has
                            // the extra padding to recognize gestures inside of
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const SizedBox(
                                      // width: 20,
                                      height: 1,
                                    ),
                                    Card(
                                      elevation: 2.0,
                                      // margin: const EdgeInsets.only(bottom: 30.0),
                                      // color: Colors.amber,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const SizedBox(
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: sliderWidth(),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: sliderWidth() * .2),
                    child: Text(
                      "${widget.min ?? '200'}",
                      style:
                         const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: sliderWidth() * .2),
                    child:  Text(
                      "${widget.max ?? '1100'}",
                      style:
                        const  TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            Text(
              "Last test result: ${widget.lastTestResults}",
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            ),
            // CupertinoSlider(
            //   activeColor: Colors.red,
            //   value: _sliderValue,
            //   onChanged: (value) {
            //     setState(() {
            //       _sliderValue = value;
            //     });
            //   },
            // ),
          ],
        );
      },
    );
  }
}
