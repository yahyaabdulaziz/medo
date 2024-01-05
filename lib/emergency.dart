import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmergencyTab extends StatelessWidget {
  static const String routeName = "EmergencyTab";

  const EmergencyTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;

    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 18,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: const Color(0xffF7A947),
                  borderRadius: BorderRadius.circular(40)),
              child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ),
            Container(
              height: height * .31,
              decoration: BoxDecoration(
                  color: const Color(0xffE76E13),
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Emergency Information",
                        style: GoogleFonts.baloo2(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      ),
                      GestureDetector(
                        child: const Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 12, bottom: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        buildInfoItem(Icons.person, "Name", "yahya abdelaziz"),
                        buildInfoItem(Icons.local_fire_department_sharp,
                            "Blood type", "yahya abdelaziz"),
                        buildInfoItem(
                            Icons.person, "Allergies", "yahya abdelaziz"),
                        buildInfoItem(
                            Icons.plus_one, "Medications", "yahya abdelaziz"),
                        buildInfoItem(Icons.home, "Address", "yahya abdelaziz"),
                        buildInfoItem(Icons.event_note_sharp, "Medical notes",
                            "yahya abdelaziz"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              height: height * .40,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  width: 2,
                  color: const Color(
                      0xffE76E13), //                   <--- border width here
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.call,
                                color: Color(0xffE76E13),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Emergency Contact",
                                style: GoogleFonts.baloo2(
                                    fontSize: 14,
                                    color: const Color(0xffE76E13),
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * .10,
                        ),
                        GestureDetector(
                          child: Text(
                            "Edit",
                            style: GoogleFonts.baloo2(
                                fontSize: 11,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(12),
                      child: const Divider(
                        thickness: 2,
                        color: Color(0xffE76E13),
                      ),
                    ),
                    Column(
                      children: [
                        buildEmerContactRow("assets/images/person.png",
                            "yahya abdelaziz", "father", "0122222222"),
                        const SizedBox(
                          height: 10,
                        ),
                        buildEmerContactRow("assets/images/person.png",
                            "Eslam Ahmed", "son", "0122243522"),
                        const SizedBox(
                          height: 10,
                        ),
                        buildEmerContactRow("assets/images/person.png",
                            "Asmaa sherif", "Brother", "0112322222"),
                        const SizedBox(
                          height: 10,
                        ),
                        buildEmerContactRow("assets/images/person.png",
                            "Mahmoud elkholy", "Grand", "0129082222"),
                        const SizedBox(
                          height: 10,
                        ),
                        buildEmerContactRow("assets/images/person.png",
                            "Eslam Ahmed", "son", "0122243522"),
                        const SizedBox(
                          height: 10,
                        ),
                        buildEmerContactRow("assets/images/person.png",
                            "Asmaa sherif", "Brother", "0112322222"),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
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

  buildEmerContactRow(
      String imgPath, String name, String relation, String phoneNum) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(imgPath),
                height: 20,
                width: 20,
              ),
              Text(
                name,
                style: GoogleFonts.baloo2(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xffE76E13),
                ),
              ),
              Text(
                "($relation)",
                style: GoogleFonts.baloo2(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xffE76E13),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.call, color: Colors.black),
              Text(
                phoneNum,
                style: GoogleFonts.openSans(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              )
            ],
          ),
        ),
      ],
    );
  }
}
