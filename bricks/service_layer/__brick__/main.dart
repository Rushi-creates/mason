// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_layer/service_layer/services/SharedPreferences_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  // final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // //@ CUBITS
        // BlocProvider(
        //   create: (context) => DiffProfileBloc(),
        // ),

        // //@ BLOCS
        // BlocProvider(
        //   create: (context) => SplashRolesBloc(),
        // ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // onGenerateRoute: _appRouter.onGenerateRoute, //dont pass brackets here

          home: SplashScreen()),
    );
  }

  // @override
  // void dispose() {
  //   _appRouter.dispose();
  //   super.dispose();
  // }
}
