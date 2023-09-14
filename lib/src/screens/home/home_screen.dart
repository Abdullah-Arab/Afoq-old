import 'package:Afoq/src/blocs/auth/auth_cubit.dart';
import 'package:Afoq/src/constants/paddings.dart';
import 'package:Afoq/src/constants/themes.dart';
import 'package:Afoq/src/screens/auth/auth_screen.dart';
import 'package:Afoq/src/screens/components/error_widget.dart';
import 'package:Afoq/src/screens/components/loading_widget.dart';
import 'package:Afoq/src/screens/landing/landing_screen.dart';
import 'package:Afoq/src/services/service_locator/locator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> _pages = const [
    LandingScreen(),
    Text("Profiel"),
  ];
  int _currentIndex = 0;
  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
    _scaffoldKey.currentState!.closeDrawer();
  }

  String? statusId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: locator<AuthCubit>(),
      builder: (context, state) {
        return state.maybeMap(
          authenticated: (state) {
            return Scaffold(
              key: _scaffoldKey,
              body: Container(
                  decoration: const BoxDecoration(
                    gradient: primaryGradient,
                  ),
                  child: _pages[_currentIndex]),
            );
          },
          error: (value) {
            return Scaffold(
              body: Center(
                child: CustomErrorWidget(
                  message: value.message,
                  onRetry: () {
                    locator<AuthCubit>().getAuth();
                  },
                ),
              ),
            );
          },
          unauthenticated: (value) {
            return const AuthScreen();
          },
          orElse: () {
            return const Scaffold(
              body: LoadingWidget(),
            );
          },
        );
      },
    );
  }
}
