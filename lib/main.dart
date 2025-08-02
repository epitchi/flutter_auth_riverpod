import 'package:auth_riverpod/core/api/endpoints.dart';
import 'package:auth_riverpod/features/user/repositories/auth_repository.dart';
import 'package:auth_riverpod/screens/dashboard/dashboard_screen.dart';
import 'package:auth_riverpod/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Endpoints.supabaseUrl,
    anonKey: Endpoints.supabaseAnonKey 
  );

  runApp(const ProviderScope(child: MyApp()));
}

final supabase = Supabase.instance.client;
class MyApp extends HookConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ref
          .watch(
            getIsAuthenticatedProvider,
          )
          .when(
            data: (bool isAuthenticated) =>
                isAuthenticated ? const DashboardScreen() : const LoginScreen(),
            loading: () {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            error: (error, stacktrace) => const LoginScreen(),
          ),
      routes: {
        "Home": (context) => const DashboardScreen(),
        "Login": (context) => const LoginScreen(),
      },
    );
  }
}
