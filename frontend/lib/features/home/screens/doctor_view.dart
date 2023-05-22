import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trad_doctors/features/home/services/all_doctors_service.dart';
import 'package:trad_doctors/features/loading/loading_screen.dart';

import '../../../constants/global_variables.dart';
import '../../../providers/all_doctors_provider.dart';
import 'doctor_card.dart';

class DoctorView extends StatefulWidget {
  const DoctorView({super.key});

  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  AllDoctorsService allDoctorsService = AllDoctorsService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    allDoctorsService.getAllDoctors(context: context).then((doctors) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final allDoctors = Provider.of<AllDoctorsProvider>(context).allDoctors;
    return _isLoading
        ? const LoadingScreen()
        : Column(children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 48,
                        color: GlobalVariables.primaryColor,
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Material(
                          borderRadius: BorderRadius.circular(7),
                          elevation: 1,
                          child: TextFormField(
                            onFieldSubmitted: (value) {},
                            decoration: InputDecoration(
                              prefixIcon: InkWell(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    left: 6,
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 23,
                                  ),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(top: 10),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.black38,
                                  width: 1,
                                ),
                              ),
                              hintText: 'Search for doctors',
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: allDoctors.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return DoctorCard(
                      doctorid: allDoctors[index].id.toString(),
                      doctorname: allDoctors[index].fullname,
                      image: '$uri/uploads/${allDoctors[index].profilePicture}',
                      rating: allDoctors[index].rating.toDouble(),
                    );
                  }),
            ),
          ]);
  }
}
