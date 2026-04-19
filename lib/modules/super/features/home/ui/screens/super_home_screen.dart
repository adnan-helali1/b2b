import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/widgets/b2b_app_bar.dart';
import 'package:b2b/core/widgets/app_stats_row.dart';
import 'package:b2b/modules/super/features/home/ui/screens/super_home_screen_section2.dart';
import 'package:b2b/modules/super/features/home/ui/screens/super_Categries_grid.dart';
import 'package:b2b/core/widgets/app_search_filed.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/super_fast_section.dart';
import 'package:b2b/modules/super/features/home/ui/widgets/texts_home_super.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:b2b/b2b_app.dart';
import 'package:b2b/core/helpers/constans.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SuperHomeScreen extends StatelessWidget {
  const SuperHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: B2bAppBar(
        title: 'متجر الأسرة',
        subtitle: 'سوبر ماركت',
        icon: Icons.shopping_cart_outlined,
      ),
      body: FutureBuilder(
        future: Supabase.instance.client.from('products').select(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          debugPrint('Data: ${snapshot.error}');
          final products = snapshot.data as List;

          if (products.isEmpty) {
            return const Center(child: Text('No Data'));
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(products[index]['name'].toString()),
                subtitle: Text(products[index]['price'].toString()),
              );
            },
          );
        },
      ),
    );
  }
}
