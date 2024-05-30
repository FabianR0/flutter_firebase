import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    // ignore: unused_shown_name
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

// Configuración de Firebase para diferentes plataformas
FirebaseOptions get firebaseOptions {
  if (kIsWeb) {
    // Configuración de Firebase para web
    return const FirebaseOptions(
      apiKey: "AIzaSyAB44f5_OA2RRji5_A1yBUvnd-NMpfwbUI",
      authDomain: "fluter-7e363.firebaseapp.com",
      projectId: "fluter-7e363",
      storageBucket: "fluter-7e363.appspot.com",
      messagingSenderId: "682195725462",
      appId: "1:682195725462:web:a028a91408e1faed0b66b7",
      measurementId: "G-C3W30B3CD4"
      // ...
    );
  } else {
    // Configuración de Firebase para Android y iOS
    return const FirebaseOptions(
      apiKey: 'TU_API_KEY_ANDROID_IOS',
      appId: 'TU_APP_ID_ANDROID_IOS',
      messagingSenderId: 'TU_MESSAGING_SENDER_ID_ANDROID_IOS',
      projectId: 'TU_PROJECT_ID_ANDROID_IOS',
    );
  }
}