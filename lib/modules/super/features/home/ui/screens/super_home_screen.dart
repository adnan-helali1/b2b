import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/search_field_home_super.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/stats_row.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/super_home_card.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/super_title_appbar.dart';
import 'package:flutter/material.dart';

class SuperHomeScreen extends StatelessWidget {
  const SuperHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManegar.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        titleSpacing: 16,
        title: SuperTitleAppbar(),

        // ⚡ Actions
        actions: [
          IconButton(
            icon: const Icon(
              Icons.dark_mode_outlined,
              color: ColorsManegar.blac,
            ),
            onPressed: () {
              // TODO: toggle theme
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () {
              // TODO: logout
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        children: [
          verticalSpace(20),
          SearchFieldHomeSuper(),
          Padding(padding: const EdgeInsets.all(16), child: StatsRow()),
        ],
      ),
    );
  }
}
