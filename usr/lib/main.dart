import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:couldai_user_app/providers/theme_provider.dart';
import 'package:couldai_user_app/providers/chat_provider.dart';
import 'package:couldai_user_app/screens/chat_screen.dart';
import 'package:couldai_user_app/services/local_storage_service.dart';
import 'package:couldai_user_app/utils/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localStorageService = LocalStorageService();
  await localStorageService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider(localStorageService)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Flutter Chat App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme, // Default to light theme
          darkTheme: AppTheme.darkTheme, // Define dark theme
          themeMode: themeProvider.themeMode, // Use ThemeProvider to manage theme mode
          home: const ChatScreen(),
        );
      },
    );
  }
}
