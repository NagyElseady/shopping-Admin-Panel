import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart_admin_panel/lib/screens/dashboard_screen.dart';

import 'lib/consts/theme_data.dart';
import 'lib/providers/product_provider.dart';
import 'lib/providers/theme_provider.dart';
import 'lib/screens/edit_upload_product_form.dart';
import 'lib/screens/inner_screens/orders/orders_screen.dart';
import 'lib/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(builder: (
        context,
        themeProvider,
        child,
      ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'shop_smart_admin_panel',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: const DashboardScreen(),
          routes: {
            OrdersScreenFree.routeName: (context) => const OrdersScreenFree(),
            SearchScreen.routeName: (context) => const SearchScreen(),
            EditOrUploadProductScreen.routeName: (context) =>
                const EditOrUploadProductScreen(),
          },
        );
      }),
    );
  }
}
