import 'package:bloc_1/core/components/appbar/appbar.dart';
import 'package:bloc_1/core/components/button/button.dart';
import 'package:bloc_1/core/components/text/custom_text.dart';
import 'package:bloc_1/core/constants/app/string_constants.dart';
import 'package:bloc_1/core/view/grocery/home/home.dart';
import 'package:bloc_1/core/view/home/counter_view.dart';
import 'package:bloc_1/core/view/home/ui_view.dart';
import 'package:bloc_1/core/view/home/users_page.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isHome: true),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const CustomText(StringConstants.homePage),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                    buttonText: 'Go To Counter Example',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CounterView(),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: CustomButton(
                    buttonText: 'Go to fetch Users Example',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UsersPage(),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                    buttonText: 'Go to UI Users Example',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UiView(),
                        ),
                      );
                    }),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                    buttonText: 'Go to Grocery Example',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
