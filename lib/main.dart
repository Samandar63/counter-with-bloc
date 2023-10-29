import 'package:counter_app_bloc/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      title: "Counter App",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appRouter.onGenerateRoute,           
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
