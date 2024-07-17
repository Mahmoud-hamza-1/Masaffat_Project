import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final controller = MapController.withUserPosition(
      trackUserLocation: const UserTrackingOption(
    enableTracking: true,
    unFollowUser: false,
  ));

  late PageController pageCont;

  @override
  void initState() {
    pageCont = PageController(viewportFraction: 0.9);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Card(
      //     child: Padding(padding: EdgeInsets.all(16), child: Text('Address')),
      //   ),
      // ),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            MapWidget(
              controller: controller,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 60,
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: const Border(),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.canPop(context);
                        },
                      ),
                      const Expanded(
                        child: Center(child: Text('Address')),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              height: 160,
              width: MediaQuery.sizeOf(context).width,
              bottom: 0,
              left: 0,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('object ---------------------------------');
                    },
                    child: GestureDetector(
                      // onTapDown: (details) {
                      //   if (details.globalPosition.dx > 0) {
                      //     // Slide to the next page
                      //     pageCont.animateToPage(
                      //       pageCont.page!.toInt() + 1,
                      //       duration: const Duration(milliseconds: 500),
                      //       curve: Curves.ease,
                      //     );
                      //   } else {
                      //     // Slide to the previous page
                      //     pageCont.animateToPage(
                      //       pageCont.page!.toInt() - 1,
                      //       duration: const Duration(milliseconds: 500),
                      //       curve: Curves.ease,
                      //     );
                      //   }
                      // },
                      onPanUpdate: (details) {
                        if (details.delta.dx < 0) {
                          // Slide to the next page
                          pageCont.animateToPage(
                            pageCont.page!.toInt() + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        } else {
                          // Slide to the previous page
                          pageCont.animateToPage(
                            pageCont.page!.toInt() - 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: PageView.builder(
                        itemCount: 4,
                        controller: pageCont,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(8),
                            color: Colors.amber,
                            height: 160,
                            width: MediaQuery.sizeOf(context).width,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: TextField(
//     onSubmitted: (value) async {
//       List<SearchInfo> suggestions = await addressSuggestion(value);
//       for (var element in suggestions) {
//         controller.addMarker(GeoPoint(
//             latitude: element.point!.latitude,
//             longitude: element.point!.longitude));
//         print(element.address);
//       }
//     },
//     decoration: const InputDecoration(
//         label: Text('address'),
//         filled: true,
//         border: OutlineInputBorder()),
//   ),
// ),

class MapWidget extends StatelessWidget {
  const MapWidget({super.key, required this.controller});
  final MapController controller;
  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      mapIsLoading: const Center(child: CircularProgressIndicator.adaptive()),
      onGeoPointClicked: (p0) async {
        print(p0.latitude);
        print(p0.longitude);
      },
      controller: controller,
      osmOption: OSMOption(
        showZoomController: true,
        userTrackingOption: const UserTrackingOption(
          enableTracking: true,
          unFollowUser: true,
        ),
        zoomOption: const ZoomOption(
          initZoom: 15,
          minZoomLevel: 3,
          maxZoomLevel: 19,
          stepZoom: 1.0,
        ),
        userLocationMarker: UserLocationMaker(
          personMarker: const MarkerIcon(
            icon: Icon(
              Icons.location_history_rounded,
              color: Colors.red,
              size: 48,
            ),
          ),
          directionArrowMarker: const MarkerIcon(
            icon: Icon(
              Icons.double_arrow,
              size: 48,
            ),
          ),
        ),
        staticPoints: [
          // StaticPositionGeoPoint(
          //     "id1 ",
          //     MarkerIcon(
          //       iconWidget: IconButton(
          //           onPressed: () {
          //             print('object');
          //           },
          //           icon: const Icon(Icons.mark_as_unread)),
          //     ),
          //     [
          //       GeoPoint(
          //         latitude: 45,
          //         longitude: 5,
          //       ),
          //       GeoPoint(
          //         latitude: 50,
          //         longitude: 15,
          //       ),
          //       GeoPoint(
          //         latitude: 55,
          //         longitude: 15,
          //       ),
          //       GeoPoint(
          //         latitude: 45,
          //         longitude: 10,
          //       ),
          //     ])
        ],
      ),
    );
  }
}
