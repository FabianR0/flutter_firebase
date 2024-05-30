// import 'dart:math';
// import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// import 'providers.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/login_screen.dart';

import 'firebase_options.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions); // Inicializar Firebase
  final FirebaseFirestore db = FirebaseFirestore.instance; // hacemos conexion con la base
  // ignore: unused_local_variable
  final CollectionReference users = db.collection('product');// de datos de firebase metodo get
  // final DocumentSnapshot snapshot = await users.doc('Id').get();
  // final Map<String, dynamic> userFields ={ 
  //   'username':'newUser',
  // } ;
  // await users.doc('newUser').set(userFields);
  // log(userFields['user']);
// log(userFields.toString() as num);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/product/:id',
          builder: (context, state) => ProductDetailScreen(
            productId: state.pathParameters['id']!,
          ),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Mi Sitio Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      routerConfig: router,
    );
  }
}
//https://medium.com/@gauravswarankar/flutter-firebase-series-crud-operations-with-firebase-e4eb3b09475f