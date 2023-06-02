import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/application/bloc/auth/signup/signup_cubit.dart';

import 'package:trad_doctors_new/application/bloc/home_bloc/home_bloc.dart';
import 'package:trad_doctors_new/application/bloc/patient_appointment_bloc/patient_appointment_bloc.dart';
import 'package:trad_doctors_new/application/bloc/services_bloc/services_bloc_bloc.dart';
import 'package:trad_doctors_new/infrustructure/repository/appointement_repository.dart';
import 'package:trad_doctors_new/infrustructure/repository/auth_repository.dart';
import 'package:trad_doctors_new/infrustructure/repository/doctor_repository.dart';
import 'package:trad_doctors_new/infrustructure/repository/service_repository.dart';
import 'package:trad_doctors_new/presentation/common/change_password.dart';
import 'package:trad_doctors_new/presentation/common/errro_screen.dart';
import 'package:trad_doctors_new/presentation/common/forget_password.dart';
import 'package:trad_doctors_new/presentation/pages/auth/screens/LandingSreen.dart';
import 'package:trad_doctors_new/presentation/pages/auth/screens/signin/signin.dart';
import 'package:trad_doctors_new/presentation/pages/auth/screens/signup/client_auth_screen.dart';
import 'package:trad_doctors_new/presentation/pages/auth/screens/signup/doctors_auth_screen.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_profile/screen/doctor_profile.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_service/screen/add_service.dart';
import 'package:trad_doctors_new/presentation/pages/home/doctor_home/screen/doctor_detail.dart';
import 'package:trad_doctors_new/presentation/pages/home/doctor_home/screen/doctor_home.dart';
import 'package:trad_doctors_new/presentation/pages/home/patient_home/screen/patient_home.dart';
import 'package:trad_doctors_new/presentation/pages/patient_profile/screen/patient_profile.dart';
import 'application/bloc/doctor_appointment_bloc/doctor_appointment_bloc.dart';
import 'domain/service_fetch_dto.dart';

final signUpBloc = SignupCubit(AuthRepository());
final serviceBloc = ServicesBloc(ServiceRepositoryImp());
final homeBloc = HomeBloc(DoctorRepositoryImp());
final serviceDetailBloc = ServicesBloc(ServiceRepositoryImp());
final patientAppointmentBloc = PatientAppointmentBloc(AppointmentImp());
final doctorAppointmentBloc = DoctorAppointmentBloc(AppointmentImp());

GoRouter router = GoRouter(
  errorBuilder: ((context, state) => ErrorScreen(
        error: state.error,
      )),
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const Initial();
      },
    ),
    GoRoute(
        path: '/doctor',
        builder: (context, state) {
          homeBloc.add(
              LoadHome(user: BlocProvider.of<LoginCubit>(context).state.user));
          serviceBloc.add(LoadServices(
              service: ServiceFetch(
                  id: BlocProvider.of<LoginCubit>(context).state.user.id,
                  token:
                      BlocProvider.of<LoginCubit>(context).state.user.token)));
          int id = BlocProvider.of<LoginCubit>(context).state.user.id;
          String token = BlocProvider.of<LoginCubit>(context).state.user.token;

          doctorAppointmentBloc
              .add(LoadDoctorAppointment(token: token, id: id));

          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: serviceBloc,
              ),
              BlocProvider.value(
                value: homeBloc,
              ),
              BlocProvider.value(
                value: doctorAppointmentBloc,
              ),
            ],
            child: const DoctorBottomBar(),
          );
        },
        routes: [
          GoRoute(
            path: 'addservice',
            builder: (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: serviceBloc,
                ),
              ],
              child: const AddServicepage(),
            ),
          ),
        ]),
    GoRoute(
        path: "/doctordetail/:index",
        builder: (context, state) {
          final int id = int.parse(state.pathParameters['index']!);
          final doctor = (homeBloc.state as HomeLoaded).doctors[id];
          String token = BlocProvider.of<LoginCubit>(context).state.user.token;

          serviceDetailBloc.add(LoadServices(
              service:
                  ServiceFetch(id: doctor.id, token: token, fetch: false)));
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: patientAppointmentBloc,
              ),
              BlocProvider.value(
                value: serviceDetailBloc,
              ),
            ],
            child: DoctorDetail(doctor: doctor),
          );
        }),
    GoRoute(
      path: '/patient',
      builder: (context, state) {
        String token = BlocProvider.of<LoginCubit>(context).state.user.token;
        int id = BlocProvider.of<LoginCubit>(context).state.user.id;

        homeBloc.add(
            LoadHome(user: BlocProvider.of<LoginCubit>(context).state.user));
        patientAppointmentBloc.add(LoadAppointment(token: token, id: id));
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: serviceDetailBloc,
            ),
            BlocProvider.value(
              value: homeBloc,
            ),
            BlocProvider.value(
              value: patientAppointmentBloc,
            ),
          ],
          child: const PatientBottomBar(),
        );
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/doctorsignup',
      builder: (context, state) => BlocProvider.value(
        value: signUpBloc,
        child: const DoctorsAuthScreen(),
      ),
    ),
    GoRoute(
      path: '/patientsignup',
      builder: (context, state) => BlocProvider.value(
        value: signUpBloc,
        child: const PatientAuthScreen(),
      ),
    ),
    GoRoute(
      path: '/doctorprofile',
      builder: (context, state) => const PatientProfile(),
    ),
    GoRoute(
      path: '/patientprofile',
      builder: (context, state) => const DoctorProfile(),
    ),
    GoRoute(
      path: '/changepassword',
      builder: (context, state) => const ChangePassowrd(),
    ),
    GoRoute(
      path: '/forgetpassword',
      builder: (context, state) => const ForgetPassword(),
    ),
  ],
);

class Initial extends StatefulWidget {
  const Initial({super.key});

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LoginCubit>(context).loadCachedUser();

    return FutureBuilder(builder: (context, snapshot) {
      return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state.status == LoginStatus.success) {
          String route = state.user.role;
          GoRouter.of(context).go("/$route");
        }
      }, builder: (context, state) {
        return const LandingPage();
      });
    });
  }
}
