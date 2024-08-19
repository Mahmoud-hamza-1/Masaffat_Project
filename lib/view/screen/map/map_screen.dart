import 'package:ecommerce_application/controller/map/parking_controller.dart';
import 'package:ecommerce_application/view/screen/map/parking_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import 'package:ecommerce_application/data/model/parking_model.dart';
import 'package:get/get.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(
      {super.key,
      this.parkings,
      required this.myLocation,
      required this.carId});
  final List<ParkingModel>? parkings;
  final GeoPoint myLocation;
  final int carId;
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final MapController controller;

  late PageController pageController;
  RoadInfo? roadInfo;
  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.9);
    controller = MapController.withPosition(
      initPosition: widget.myLocation,
    );
    // controller.myLocation().then(
    //       (value) => setState(() {
    //         myLocation = value;
    //       }),
    //     );
    // for (var i = 0; i < points.length; i++) {
    //   controller.addMarker(points[i],
    //       markerIcon: const MarkerIcon(
    //         icon: Icon(Icons.location_on),
    //       ));
    // }
    // controller.moveTo(points[0]);
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
      appBar: AppBar(
        centerTitle: true,
        title:
            const Padding(padding: EdgeInsets.all(16), child: Text('Address')),
      ),
      body: Column(
        children: [
          mapWidget(),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 125, minHeight: 100),
            child: PageView.builder(
              itemCount: widget.parkings?.length,
              controller: pageController,
              onPageChanged: (value) async {
                await controller.moveTo(
                    GeoPoint(
                      latitude: widget.parkings![value].latitude,
                      longitude: widget.parkings![value].longitude,
                    ),
                    animate: true);
                controller.clearAllRoads();
                roadInfo = await controller.drawRoad(
                  widget.myLocation,
                  GeoPoint(
                    latitude: widget.parkings![value].latitude,
                    longitude: widget.parkings![value].longitude,
                  ),
                  roadOption: const RoadOption(
                    roadColor: Colors.red,
                  ),
                );
                setState(() {});
              },
              itemBuilder: (context, index) {
                return GetBuilder<ParkingControllerImp>(builder: (controller) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.sizeOf(context).width,
                    child: ListTile(
                      onTap: () {
                        Get.to(() => ParkingDetailsPage(
                              parkingId: widget.parkings![index].id,
                              checkIn: controller.checkIn,
                              checkOut: controller.checkOut,
                              carId: widget.carId,
                            ));
                      },
                      title: Text('${widget.parkings?[index].name}'),
                      subtitle: Text(
                          '${widget.parkings?[index].numberSlots} parking lots'),
                      leading: const Icon(Icons.local_taxi_outlined),
                      trailing: Text(
                          '${roadInfo == null || roadInfo!.duration == null ? '?' : roadInfo!.duration! / 60 * 60} min'),
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Expanded mapWidget() {
    return Expanded(
      child: OSMFlutter(
        onMapIsReady: (p0) async {
          final point = GeoPoint(
            latitude: widget.parkings![0].latitude,
            longitude: widget.parkings![0].longitude,
          );
          await controller.moveTo(
            point,
            animate: true,
          );
          await pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
          controller.clearAllRoads();
          roadInfo = await controller.drawRoad(
            await controller.myLocation(),
            point,
            roadOption: const RoadOption(
              roadColor: Colors.red,
            ),
          );
          print('from map is ready 2');
          print(point);
          setState(() {});
        },
        // mapIsLoading: const Center(child: CircularProgressIndicator.adaptive()),
        onGeoPointClicked: (p0) async {
          print(widget.parkings![0]);
          final points = widget.parkings!.map((e) {
            print('from clicked');
            print(GeoPoint(latitude: e.latitude, longitude: e.longitude));
            return GeoPoint(latitude: e.latitude, longitude: e.longitude);
          }).toList();
          final index = points.indexOf(p0);
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut);
          controller.clearAllRoads();
          roadInfo = await controller.drawRoad(
            await controller.myLocation(),
            points[index],
            roadOption: const RoadOption(
              roadColor: Colors.red,
            ),
          );
          print(points[index]);
          setState(() {});
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
            minZoomLevel: 2,
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
            for (int i = 0; i < widget.parkings!.length; i++)
              StaticPositionGeoPoint(
                "id $i",
                MarkerIcon(
                  iconWidget: InkWell(
                    onTap: () async {
                      await pageController.animateToPage(
                        i,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Icon(
                      Icons.location_on,
                    ),
                  ),
                ),
                widget.parkings!
                    .map(
                      (e) => GeoPoint(
                        latitude: e.latitude,
                        longitude: e.longitude,
                      ),
                    )
                    .toList(),
              )
          ],
        ),
      ),
    );
  }
}

// class MapWidget extends StatelessWidget {
//   final MapController controller;
//   final PageController pageController;
//   final List<GeoPoint> points;
//   // RoadInfo? roadInfo;

//   const MapWidget(
//       {super.key,
//       required this.controller,
//       required this.pageController,
//       required this.points});

//   @override
//   Widget build(BuildContext context) {
//     return OSMFlutter(
//       onMapIsReady: (p0) async {
//         // await controller.moveTo(points[0], animate: true);
//         await pageController.animateToPage(
//           0,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.ease,
//         );
//         controller.clearAllRoads();
//         await controller.drawRoad(
//           await controller.myLocation(),
//           points[0],
//           roadOption: const RoadOption(
//             roadColor: Colors.red,
//           ),
//         );
//       },
//       // mapIsLoading: const Center(child: CircularProgressIndicator.adaptive()),
//       onGeoPointClicked: (p0) async {
//         final index = points.indexOf(p0);
//         pageController.animateToPage(index,
//             duration: const Duration(milliseconds: 400),
//             curve: Curves.easeInOut);
//         controller.clearAllRoads();
//         await controller.drawRoad(
//           await controller.myLocation(),
//           points[index],
//           roadOption: const RoadOption(
//             roadColor: Colors.red,
//           ),
//         );
//       },
//       controller: controller,
//       osmOption: OSMOption(
//         showZoomController: true,
//         userTrackingOption: const UserTrackingOption(
//           enableTracking: true,
//           unFollowUser: true,
//         ),
//         zoomOption: const ZoomOption(
//           initZoom: 15,
//           minZoomLevel: 2,
//           maxZoomLevel: 19,
//           stepZoom: 1.0,
//         ),
//         userLocationMarker: UserLocationMaker(
//           personMarker: const MarkerIcon(
//             icon: Icon(
//               Icons.location_history_rounded,
//               color: Colors.red,
//               size: 48,
//             ),
//           ),
//           directionArrowMarker: const MarkerIcon(
//             icon: Icon(
//               Icons.double_arrow,
//               size: 48,
//             ),
//           ),
//         ),
//         staticPoints: [
//           for (int i = 0; i < points.length; i++)
//             StaticPositionGeoPoint(
//                 "id $i",
//                 MarkerIcon(
//                   iconWidget: InkWell(
//                       onTap: () async {
//                         await pageController.animateToPage(i,
//                             duration: const Duration(milliseconds: 400),
//                             curve: Curves.easeInOut);
//                       },
//                       child: const Icon(Icons.location_on)),
//                 ),
//                 [points[i]])
//         ],
//       ),
//     );
//   }
// }
