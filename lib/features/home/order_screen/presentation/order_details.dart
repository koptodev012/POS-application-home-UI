import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_design/common/localization/cubit/change_language/change_language_cubit.dart';
import 'package:home_design/common/variables.dart';
import 'package:home_design/features/home/order_screen/presentation/footer_section.dart';
import 'package:home_design/features/home/order_screen/presentation/header_section.dart';
import 'package:home_design/features/home/order_screen/presentation/middle_section.dart';

class HomeOrderDetails extends StatefulWidget {
  const HomeOrderDetails({super.key});

  @override
  State<HomeOrderDetails> createState() => _HomeOrderDetailsState();
}

class _HomeOrderDetailsState extends State<HomeOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return Column(
          children: [
            //! Sub Container 1,

            const Expanded(flex: 2, child: OrderDetailsHeaderSection()),

            //! Sub Container 2,

            Expanded(
                flex: CommonVariables.selectedLanguage == "English" ? 7 : 6,
                child: const OrderDetailsMiddleSection()),

            //! Sub Container 3,

            Expanded(
                flex: CommonVariables.selectedLanguage == "English" ? 3 : 4,
                child: const OrderDetailsFooterSection()),
          ],
        );
      },
    );
  }
}
