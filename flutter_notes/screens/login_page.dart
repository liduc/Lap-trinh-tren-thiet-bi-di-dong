import '../models/PostScreen.dart';
import '../screens/login_page.dart';
import '../screens/note_list_screen.dart';
import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const PostScreen(),
//     );
//   }
// }

void main() async {
  // Đảm bảo Flutter bindings được khởi tạo
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Notes App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // Sử dụng Material 3
          useMaterial3: true,

          // Cấu hình AppBar
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
          ),

          // Cấu hình Card
          cardTheme: CardTheme(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          // Cấu hình FloatingActionButton
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        // Tắt banner debug
        debugShowCheckedModeBanner: false,
        // Màn hình bắt đầu
        home: const Login()
    );
  }
}