import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_design/common/localization/cubit/change_language/change_language_cubit.dart';
import 'package:home_design/common/variables.dart';
import 'package:home_design/features/home/drawer/cubit/isCollpasedValue/is_collpased_value_cubit.dart';
import 'package:home_design/features/home/drawer/cubit/select_page_index/page_index_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:home_design/features/home/order_screen/cubit/successful_placeOrder_icon/successul_place_order_icon_cubit.dart';
import 'package:home_design/splash/presentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageIndexCubit()),
        BlocProvider(create: (context) => ChangeLanguageCubit()),
        BlocProvider(create: (context) => IsCollpasedValueCubit()),
        BlocProvider(create: (context) => SuccessulPlaceOrderIconCubit()),
      ],
      child: BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
        builder: (context, state) {
          Locale? languageName;
          if (state is ChangeLanguageSuccess) {
            languageName = state.name;
            CommonVariables.languageCode = state.name!;
            log("languagage name =$languageName, code=${languageName!.languageCode}");
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'POS UI Clone',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
            locale: languageName,
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
