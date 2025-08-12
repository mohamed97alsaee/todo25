import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo25/providers/dark_mode_provider.dart';
import 'package:todo25/providers/tasks_provider.dart';
import 'package:todo25/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TasksProvider>(create: (_) => TasksProvider()),
        ChangeNotifierProvider<DarkModeProvider>(
          create: (_) => DarkModeProvider(),
        ),
      ],
      child: Consumer<DarkModeProvider>(
        builder: (context, mode, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: mode.isDark ? Colors.black : null,

              tabBarTheme: TabBarThemeData(
                labelColor: mode.isDark ? Colors.white : Colors.black,
                unselectedLabelColor: mode.isDark
                    ? Colors.white.withValues(alpha: 0.5)
                    : Colors.black.withValues(alpha: 0.5),
              ),
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),

              textTheme: GoogleFonts.almaraiTextTheme(),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
