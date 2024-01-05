import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EmergencyState extends StatefulWidget {
  static const String routeName = "EmergencyState";

  const EmergencyState({super.key});

  @override
  State<EmergencyState> createState() => _EmergencyStateState();
}

class _EmergencyStateState extends State<EmergencyState> {
  late GoogleMapController mapController;
  GoogleMapController? gmc;
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(30.0444, 31.2357),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;

    return Material(
        type: MaterialType.transparency,
        child: Container(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Container(
                child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffE76E13),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    padding: const EdgeInsets.all(10),
                    child: Container(
                        padding: EdgeInsets.zero,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 10,
                                  spreadRadius: 10)
                            ]),
                        width: double.infinity,
                        child: Column(children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.all(15),
                            height: height * .25,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                width: 2,
                                color: const Color(
                                    0xffE76E13), //                   <--- border width here
                              ),
                            ),
                            child: Column(
                              children: [
                                buildInfoItem(
                                    Icons.person, "Name", "yahya abdelaziz"),
                                buildInfoItem(Icons.local_fire_department_sharp,
                                    "Blood type", "yahya abdelaziz"),
                                buildInfoItem(Icons.person, "Allergies",
                                    "yahya abdelaziz"),
                                buildInfoItem(Icons.plus_one, "Medications",
                                    "yahya abdelaziz"),
                                buildInfoItem(
                                    Icons.home, "Address", "yahya abdelaziz"),
                                buildInfoItem(Icons.event_note_sharp,
                                    "Medical notes", "yahya abdelaziz"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/images/mute.png",
                                    width: 50,
                                    height: 50,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/images/noCam.png",
                                    width: 50,
                                    height: 50,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                width: 2,
                                color: const Color(
                                    0xffE76E13), //                   <--- border width here
                              ),
                            ),
                            margin: const EdgeInsets.all(12),
                            height: height * .30,
                            child: Stack(
                              children: [
                                GoogleMap(
                                  mapType: MapType.hybrid,
                                  initialCameraPosition: _initialPosition,
                                  onMapCreated: (mapController) {
                                    gmc = mapController;
                                  },
                                ),
                                Positioned(
                                  top: 20,
                                  left: 10,
                                  child: Container(
                                    height: 30,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.send, size: 18),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              "Set Location : ON",
                                              style: GoogleFonts.openSans(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.normal,
                                                  color: const Color(0xffE76E13)),
                                            )
                                          ],
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )
                        ]))))));
  }

  buildInfoItem(IconData ic, String infoType, String infoAnswer) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(ic),
        const SizedBox(
          width: 10,
        ),
        Text(
          infoType,
          style: GoogleFonts.baloo2(
            fontSize: 13,
            fontWeight: FontWeight.normal,
            color: const Color(0xffE76E13),
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        Text(
          infoAnswer,
          style: GoogleFonts.openSans(
              fontSize: 13, fontWeight: FontWeight.normal, color: Colors.black),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
