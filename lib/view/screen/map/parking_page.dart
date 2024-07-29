import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';

class ParkingPage extends StatefulWidget {
  const ParkingPage({super.key});

  @override
  State<ParkingPage> createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> {
  bool isVis = true;
  var isLoading = false;
  var isResult = false;
  Timer? _debounce;
  List<SearchInfo>? searchInfo;
  final searchController = TextEditingController();
  final node = FocusNode();
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hourly Parking'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Navigate to airport parking
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 1))),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.airplanemode_active),
                              Text('Airport'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Navigate to hourly parking
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(
                                      color: Colors.teal, width: 3))),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.access_time),
                              Text('Hourly'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Navigate to monthly parking
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 1))),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today),
                              Text('Monthly'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Navigate to event parking
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 1))),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star),
                              Text('Events'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
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
                        TextField(
                          controller: searchController,
                          onChanged: (value) {
                            if (_debounce?.isActive ?? false)
                              _debounce?.cancel();
                            _debounce = Timer(const Duration(milliseconds: 500),
                                () async {
                              setState(() {
                                isLoading = true;
                              });
                              searchInfo = await addressSuggestion(value,
                                  limitInformation: 15);
                              setState(() {
                                isLoading = false;
                              });
                            });
                          },
                          focusNode: node,
                          // onTapOutside: (event) {
                          //   node.unfocus();
                          //   setState(() {
                          //     isVis = true;
                          //   });
                          // },
                          onTap: () async {
                            // GeoPoint? p = await showSimplePickerLocation(
                            //   context: context,
                            //   isDismissible: true,
                            //   title: "Title dialog",
                            //   textConfirmPicker: "pick",
                            // );
                            setState(() {
                              isVis = false;
                            });

                            return;
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const SearchDialog();
                              },
                            );
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(26)),
                                borderSide:
                                    BorderSide(color: Colors.grey[400]!)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(24)),
                                borderSide:
                                    BorderSide(color: Colors.grey[400]!)),
                            hintText: 'Search by City, Address, Zone...',
                            prefixIcon: const Icon(Icons.search),
                            border: InputBorder.none,
                          ),
                        ),
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
                              ? Column(
                                  children: [
                                    if (isLoading) ...[
                                      const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      ),
                                    ] else if (searchInfo != null &&
                                        (searchController.text
                                            .trim()
                                            .isNotEmpty)) ...[
                                      if (searchInfo!.isEmpty) ...[
                                        const Center(
                                            child: Text(
                                          'no data available',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ))
                                      ] else ...[
                                        ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              maxHeight: 300),
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: searchInfo!.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                onTap: () {},
                                                leading: Container(
                                                    height: 45,
                                                    width: 45,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                    ),
                                                    child: const Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      size: 30,
                                                      weight: 2,
                                                    )),
                                                title: Text(
                                                    '${searchInfo?[index].address?.name}'),
                                                subtitle: Text(
                                                  '${searchInfo?[index].address?.country ?? ''} ${searchInfo?[index].address?.city ?? ''}',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade600,
                                                      fontSize: 13),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ] else ...[
                                      const SizedBox(height: 20),
                                      const Text(
                                        'Recent Searches',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      ListView.builder(
                                        itemCount: 1,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            ListTile(
                                          leading: const Icon(Icons
                                              .replay_circle_filled_outlined),
                                          title:
                                              const Text('دمشق ,جامع الايمان'),
                                          onTap: () async {
                                            searchController.text = 'ds';
                                            setState(() {
                                              isLoading = true;
                                            });
                                            searchInfo =
                                                await addressSuggestion('ds',
                                                    limitInformation: 20);
                                            setState(() {
                                              isLoading = false;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ],
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  navigator?.pushNamed('/map');
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
            ],
          ),
        ),
      ),
    );
  }
}

class SearchDialog extends StatefulWidget {
  const SearchDialog({super.key});

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  var isLoading = false;
  var isResult = false;
  Timer? _debounce;
  List<SearchInfo>? searchInfo;
  final searchController = TextEditingController();

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Dialog(
          insetPadding: const EdgeInsets.fromLTRB(40, 70, 40, 40),
          insetAnimationDuration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: searchController,
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) _debounce?.cancel();
                    _debounce =
                        Timer(const Duration(milliseconds: 500), () async {
                      setState(() {
                        isLoading = true;
                      });
                      searchInfo =
                          await addressSuggestion(value, limitInformation: 20);

                      setState(() {
                        isLoading = false;
                      });
                    });
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(26)),
                        borderSide: BorderSide(color: Colors.grey[400]!)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24)),
                        borderSide: BorderSide(color: Colors.grey[400]!)),
                    hintText: 'Search by City, Address, Zone...',
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
                if (isLoading) ...[
                  const SizedBox(height: 50),
                  const Center(child: CircularProgressIndicator()),
                ] else if (searchInfo != null &&
                    (searchController.text.trim().isNotEmpty)) ...[
                  if (searchInfo!.isEmpty) ...[
                    const SizedBox(height: 50),
                    const Center(
                        child: Text(
                      'no data available',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ))
                  ] else ...[
                    Expanded(
                      child: ListView.builder(
                        itemCount: searchInfo!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
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
                                )),
                            title: Text('${searchInfo?[index].address?.name}'),
                            subtitle: Text(
                              '${searchInfo?[index].address?.country ?? ''} ${searchInfo?[index].address?.city ?? ''}',
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 13),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ] else ...[
                  const SizedBox(height: 20),
                  const Text(
                    'Recent Searches',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.replay_circle_filled_outlined),
                      title: const Text('دمشق ,جامع الايمان'),
                      onTap: () async {
                        searchController.text = 'ds';
                        setState(() {
                          isLoading = true;
                        });
                        searchInfo =
                            await addressSuggestion('ds', limitInformation: 20);
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
                  ),
                ],
              ],
            ),
          )),
    );
  }
}
