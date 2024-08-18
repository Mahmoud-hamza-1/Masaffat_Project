import 'package:ecommerce_application/controller/map/parking_controller.dart';
import 'package:ecommerce_application/data/model/parking_model.dart';
import 'package:ecommerce_application/view/screen/map/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart' as intl;

class ParkingPage extends StatefulWidget {
  const ParkingPage({super.key});

  @override
  State<ParkingPage> createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> {
  bool isVis = true;
  var isLoading = false;
  var isResult = false;
  List<SearchInfo>? searchInfo;
  final searchController = TextEditingController();
  final node = FocusNode();
  final List<String>? recentSearchPlaces = null;
  bool isGLoading = false;
  final pageController = PageController();
  var indexCheck = 0;
  DateTime checkIn = DateTime.now();
  DateTime checkOut = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ParkingControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hourly Parking'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<ParkingControllerImp>(
              init: ParkingControllerImp(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     checkInButton(),
                    //     const SizedBox(
                    //       width: 15,
                    //     ),
                    //     checkOutButton(),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 250,
                    //   child: PageView(
                    //     controller: pageController,
                    //     onPageChanged: (index) {
                    //       setState(() {
                    //         indexCheck = index;
                    //       });
                    //     },
                    //     children: [
                    //       CupertinoTimerPicker(
                    //         mode: CupertinoTimerPickerMode.hm,
                    //         initialTimerDuration: checkIn,
                    //         onTimerDurationChanged: (duration) {
                    //           setState(() {
                    //             checkIn = duration;
                    //           });
                    //         },
                    //       ),
                    //       CupertinoTimerPicker(
                    //         mode: CupertinoTimerPickerMode.hm,
                    //         initialTimerDuration: checkOut,
                    //         onTimerDurationChanged: (duration) {
                    //           setState(() {
                    //             checkOut = duration;
                    //           });
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    TapRegion(
                      onTapOutside: (event) {
                        setState(() {
                          isVis = true;
                        });
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Where to?',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 16),
                              searchField(controller),
                              const SizedBox(height: 16),
                              AnimatedSwitcher(
                                switchInCurve: Curves.easeInOut,
                                switchOutCurve: Curves.easeInOut,
                                transitionBuilder: (child, animation) =>
                                    SizeTransition(
                                  sizeFactor: animation,
                                  child: child,
                                ),
                                duration: const Duration(milliseconds: 400),
                                child: !isVis
                                    ? searchInformation(controller)
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () async {
                        bool serviceEnabled;
                        LocationPermission permission;
                        serviceEnabled =
                            await Geolocator.isLocationServiceEnabled();
                        if (!serviceEnabled) {
                          permission = await Geolocator.checkPermission();
                          if (permission == LocationPermission.denied) {
                            permission = await Geolocator.requestPermission();
                            if (permission == LocationPermission.denied) {
                              // Permissions are denied, next time you could try
                              // requesting permissions again (this is also where
                              // Android's shouldShowRequestPermissionRationale
                              // returned true. According to Android guidelines
                              // your App should show an explanatory UI now.
                              return Get.defaultDialog(
                                title: 'error',
                                middleText: 'Location permissions are denied',
                              );
                            }
                            if (permission ==
                                LocationPermission.deniedForever) {
                              // Permissions are denied forever, handle appropriately.
                              return Get.defaultDialog(
                                title: 'error',
                                middleText:
                                    'Location permissions are permanently denied, we cannot request permissions.',
                              );
                            }
                          }
                          // Location services are not enabled don't continue
                          // accessing the position and request users of the
                          // App to enable the location services.
                          // return Get.defaultDialog(
                          //   title: 'error',
                          //   middleText: 'Location services are disabled.',
                          // );
                        }

                        // When we reach here, permissions are granted and we can
                        // continue accessing the position of the device.
                        setState(() {
                          indexCheck = 0;
                        });
                        await showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                                builder: (context, setState) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 320,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                spreadRadius: 1,
                                                blurStyle: BlurStyle.inner,
                                              ),
                                            ]),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                checkInButton(),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                checkOutButton(),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 200,
                                              child: PageView(
                                                controller: pageController,
                                                onPageChanged: (index) {
                                                  setState(() {
                                                    indexCheck = index;
                                                  });
                                                },
                                                children: [
                                                  datePicker(true),
                                                  datePicker(false),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      FilledButton(
                                          style: FilledButton.styleFrom(
                                              backgroundColor: Colors.black),
                                          onPressed: () async {
                                            if (checkIn.compareTo(checkOut) >=
                                                0) {
                                              await Get.defaultDialog(
                                                  title: "alert",
                                                  middleText:
                                                      "select valid time");
                                              return;
                                            }
                                            controller.updateCheckIn(
                                                checkIn, checkOut);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('التالي'))
                                    ],
                                  ),
                                ),
                              );
                            });
                          },
                        );
                        setState(() {
                          isGLoading = true;
                        });
                        final loc = await Geolocator.getCurrentPosition();
                        final myLoc = GeoPoint(
                            latitude: loc.latitude, longitude: loc.longitude);
                        final parkings =
                            await controller.searchByCoordinates(myLoc);
                        setState(() {
                          isGLoading = false;
                        });
                        if (parkings == null) {
                          // await Get.defaultDialog(
                          //     title: "alert",
                          //     middleText: "no parking for this place");
                        } else {
                          navigator?.push(MaterialPageRoute(
                            builder: (context) {
                              return MapScreen(
                                parkings: parkings,
                                myLocation: myLoc,
                              );
                            },
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        iconColor: Colors.red[600],
                        padding: const EdgeInsets.all(16),
                      ),
                      icon: const Icon(Icons.my_location),
                      label: const Text(
                        'Search Nearby Parking',
                        style: TextStyle(color: Colors.black54, fontSize: 17),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (isGLoading) const LoadingWidget(),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Directionality datePicker(final bool isCheckIn) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: CupertinoDatePicker(
        initialDateTime: isCheckIn ? checkIn : checkOut,
        onDateTimeChanged: (date) {
          setState(() {
            isCheckIn ? checkIn = date : checkOut = date;
          });
        },
      ),
    );
  }

  Column searchInformation(ParkingControllerImp controller) {
    return Column(
      children: [
        if (isLoading) ...[
          const Padding(
            padding: EdgeInsets.all(5),
            child: LoadingWidget(),
          ),
        ] else if (searchInfo != null &&
            (searchController.text.trim().isNotEmpty)) ...[
          if (searchInfo!.isEmpty) ...[
            const Center(
                child: Text(
              'no data available',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ))
          ] else ...[
            searchInfoList(controller),
          ],
        ] else ...[
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Recent Searches',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          controller.recentSearchParking.isEmpty //
              ? const Text('no search found')
              : ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 300,
                  ),
                  child: ListView.builder(
                    itemCount: controller.recentSearchParking.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.replay_circle_filled_outlined),
                      title: Text(controller.recentSearchParking[index]),
                      trailing: IconButton(
                          onPressed: () {
                            controller.deleteSearchParking(index);
                          },
                          icon: const Icon(Icons.highlight_remove_rounded)),
                      onTap: () async {
                        searchController.text =
                            controller.recentSearchParking[index];
                        setState(() {
                          isLoading = true;
                        });
                        searchInfo = await addressSuggestion(
                            controller.recentSearchParking[index],
                            limitInformation: 20);
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
                  ),
                ),
        ],
      ],
    );
  }

  ConstrainedBox searchInfoList(ParkingControllerImp controller) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 300),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: searchInfo!.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () async {
              setState(() {
                indexCheck = 0;
              });
              FocusManager.instance.primaryFocus?.unfocus();
              if (searchInfo == null || searchInfo![index].point == null) {
                await Get.defaultDialog(
                    title: "error", middleText: "can't select this place");
                return;
              }
              await showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(builder: (context, setState) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 320,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      spreadRadius: 1,
                                      blurStyle: BlurStyle.inner,
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      checkInButton(),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      checkOutButton(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: PageView(
                                      controller: pageController,
                                      onPageChanged: (index) {
                                        setState(() {
                                          indexCheck = index;
                                        });
                                      },
                                      children: [
                                        datePicker(true),
                                        datePicker(false),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            FilledButton(
                                style: FilledButton.styleFrom(
                                    backgroundColor: Colors.black),
                                onPressed: () async {
                                  if (checkIn.compareTo(checkOut) >= 0) {
                                    await Get.defaultDialog(
                                        title: "alert",
                                        middleText: "select valid time");
                                    return;
                                  }
                                  controller.updateCheckIn(checkIn, checkOut);
                                  Navigator.pop(context);
                                },
                                child: const Text('التالي'))
                          ],
                        ),
                      ),
                    );
                  });
                },
              );
              // return;
              setState(() {
                isGLoading = true;
              });
              final res = await Future.wait([
                Geolocator.getCurrentPosition(),
                controller.searchByCoordinates(searchInfo![index].point!)
              ]);

              setState(() {
                isGLoading = false;
              });
              if (res[1] == null) {
                await Get.defaultDialog(
                    title: "alert", middleText: "no parking for this place");
              } else {
                navigator?.push(MaterialPageRoute(
                  builder: (context) {
                    return MapScreen(
                      parkings: res[1] as List<ParkingModel>?,
                      myLocation: GeoPoint(
                          latitude: (res[0] as Position).latitude,
                          longitude: (res[0] as Position).longitude),
                    );
                  },
                ));
              }
            },
            leading: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Icon(
                Icons.location_on_outlined,
                size: 30,
                weight: 2,
              ),
            ),
            title: Text('${searchInfo?[index].address?.name}'),
            subtitle: Text(
              '${searchInfo?[index].address?.country ?? ''} ${searchInfo?[index].address?.city ?? ''}',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 13,
              ),
            ),
          );
        },
      ),
    );
  }

  FilledButton checkOutButton() {
    return FilledButton(
      onPressed: () {
        pageController.animateToPage(1,
            curve: Curves.bounceInOut,
            duration: const Duration(milliseconds: 300));
        setState(() {});
      },
      style: FilledButton.styleFrom(
        backgroundColor: indexCheck == 1 ? Colors.red[600] : Colors.transparent,
        foregroundColor: indexCheck == 1 ? null : Colors.black,
        side: indexCheck == 0 ? const BorderSide() : null,
      ),
      child: const Text('CheckOut'),
    );
  }

  FilledButton checkInButton() {
    return FilledButton(
      onPressed: () {
        pageController.animateToPage(0,
            curve: Curves.bounceInOut,
            duration: const Duration(milliseconds: 300));
        setState(() {});
      },
      style: FilledButton.styleFrom(
          backgroundColor:
              indexCheck == 0 ? Colors.red[600] : Colors.transparent,
          foregroundColor: indexCheck == 0 ? null : Colors.black,
          side: indexCheck == 1 ? const BorderSide() : null),
      child: const Text('CheckIn'),
    );
  }

  TextField searchField(ParkingControllerImp controller) {
    return TextField(
      controller: searchController,
      onEditingComplete: () async {
        node.unfocus();
        if (searchController.text.trim().length < 2) {
          return;
        }
        setState(() {
          isLoading = true;
        });
        controller.addSearchParking(searchController.text);
        searchInfo = await addressSuggestion(searchController.text,
            limitInformation: 25);
        for (var element in searchInfo!) {
          print(element.point);
          print(element.address);
        }
        setState(() {
          isLoading = false;
        });
      },
      focusNode: node,
      onTap: () async {
        setState(() {
          isVis = false;
        });
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(26),
          ),
          borderSide: BorderSide(
            color: Colors.grey[400]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(
            color: Colors.grey[400]!,
          ),
        ),
        hintText: 'Search by City, Address, Zone...',
        prefixIcon: const Icon(Icons.search),
        border: InputBorder.none,
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class TimeFromWidget extends StatelessWidget {
  const TimeFromWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParkingControllerImp>(
      builder: (controller) {
        return TextButton(
          onPressed: () {
            DatePickerBdaya.showTimePicker(
              context,
              showTitleActions: true,
              showSecondsColumn: false,
              onConfirm: (date) {
                final res = intl.DateFormat.Hm().format(date);
                print('confirm $res');
              },
              currentTime: DateTime.now(),
              locale: LocaleType.ar,
            );
          },
          child: const Text(
            'show date time picker (Chinese)',
            style: TextStyle(color: Colors.blue),
          ),
        );
      },
    );
  }
}
