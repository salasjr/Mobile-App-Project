import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/application/bloc/home_bloc/home_bloc.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';

import '../widget/doctor_card.dart';

class DoctorView extends StatefulWidget {
  const DoctorView({super.key});

  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  @override
  Widget build(BuildContext context) {
    // final allDoctors = Provider.of<AllDoctorsProvider>(context).allDoctors;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomeLoaded) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: AppBar(
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.primaryColor,
                  ),
                ),
                title: const Text("Home"),
                elevation: 0.0,
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      await context.read<LoginCubit>().logout();
                      GoRouter.of(context).go('/');
                      // context.read<UserAuthBloc>().add(LoadAuth());
                    },
                    child: const Icon(Icons.signpost_outlined),
                  ),
                ],
              ),
            ),
            body: Column(children: [
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
                    itemCount: state.doctors.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => {
                          GoRouter.of(context).push("/doctordetail/$index"),
                        },
                        child: DoctorCard(
                            doctorid: state.doctors[index].id,
                            doctorname: state.doctors[index].fullname,
                            image:
                                '$uri/uploads/${state.doctors[index].profilePicture}',
                            rating: state.doctors[index].ratingCount == 0
                                ? 0
                                : state.doctors[index].rating /
                                    state.doctors[index].ratingCount),
                      );
                    }),
              ),
            ]),
          );
        }
        if (state is HomeLoadingFalilur) {
          return const Center(
            child: Text('Error While Loading Data. Try later'),
          );
        }
        return Column(
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
        );
      },
    );
  }
}
