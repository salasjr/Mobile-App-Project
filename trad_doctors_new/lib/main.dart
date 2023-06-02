import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/infrustructure/repository/user_repository.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';
import 'package:trad_doctors_new/routes.dart';
import 'bloc_observer.dart';
import 'package:trad_doctors_new/infrustructure/repository/auth_repository.dart';
import 'package:trad_doctors_new/infrustructure/repository/doctor_repository.dart';
import 'package:trad_doctors_new/infrustructure/repository/service_repository.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final authRepository = AuthRepository();
      runApp(App(authRepository: authRepository));
    },
    blocObserver: AppBlocObserver(),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(key: key);

  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _authRepository,
        ),
        RepositoryProvider<DoctorRepositoryInterface>(
          create: (_) => DoctorRepositoryImp(),
          lazy: false,
        ),
        RepositoryProvider<ServiceRepositoryInterface>(
          create: (_) => ServiceRepositoryImp(),
          lazy: false,
        ),
        RepositoryProvider<UserRepositoryInterface>(
          create: (_) => UserRepositoryImp(),
          lazy: false,
        )
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AuthRepository()),
      child: MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        title: "Trad-Doctors",
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.primaryColor),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
