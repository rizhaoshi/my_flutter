import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'others/CustomLocalizations.dart';
import 'others/CustomTheme_A.dart';
import 'package:get/get.dart';

// import 'package:my_flutter_a/basic_a/Hello_A.dart';
// import 'basic_a/Hello_A.dart';
// import 'basic_a/Text_A.dart';
// import 'layout_a/Container_A.dart';
// import 'layout_a/Column_Row_A.dart';
// import 'layout_a/Flex_A.dart';
// import 'layout_a/Wrap_A.dart';
// import 'layout_a/Stack_A.dart';
// import 'layout_a/Card_A.dart';
// import 'button_a/Button_A.dart';
// import 'image_a/Image_A.dart';
// import 'list_a/SingleChildScrollView_A.dart';
// import 'list_a/ListView_A.dart';
// import 'list_a/GridView_A.dart';
// import 'list_a/GridView_B.dart';
// import 'others/Cupertino_A.dart';
// import 'third_party/Dio_A.dart';
// import 'third_party/Flutter_Swiper_A.dart';
// import 'third_party/Shared_Preferences_A.dart';
// import 'state_a/StatefulWidget_A.dart';
// import 'state_a/DataTable_A.dart';
// import 'state_a/InheritedWidget_A.dart';
// import 'state_a/Lifecycle_A.dart';
// import 'state_a/Provider.dart';
// import 'navigation_a/Anonymous_A.dart';
// import 'navigation_a/NamedRoute_A.dart';
// import 'navigation_a/OnGenerateRoute_A.dart';
// import 'navigation_a/Arguments_A.dart';
// import 'navigation_a/Drawer_A.dart';
// import 'navigation_a/BottomNavigatorBar_A.dart';
// import 'navigation_a/Tab_A.dart';
// import 'form_a/Switch_A.dart';
// import 'form_a/Checkbox_A.dart';
// import 'form_a/Radio_A.dart';
// import 'form_a/TextField.dart';
// import 'form_a/Calendar_A.dart';
// import 'form_a/Form_A.dart';
// import 'form_a/Form_B.dart';
// import 'others/Animation_A.dart';
// import 'others/StaggerAnimation_A.dart';
// import 'others/HeroAnimation_A.dart';
// import 'others/TextI18n_A.dart';
// import 'others/Theme_A.dart';
// import 'getx/SnackBar_A.dart';
// import 'getx/Dialog_A.dart';
// import 'getx/BottomSheet_A.dart';
// import 'getx/Navigation_A.dart';
// import 'getx/Navigation_B.dart';
// import 'getx/ObxCount_A.dart';
import 'network/Dio_HttpUtil_A.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "MyFlutter",
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.yellow,
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary, height: 50, splashColor: Colors.green),
        textTheme: TextTheme(
            subtitle1: TextStyle(
          fontSize: 30,
          color: Colors.green,
        )),
        iconTheme: IconThemeData(
          color: Colors.pink[100],
          size: 40,
        ),
        cardTheme: CardTheme(color: Colors.brown[100], shape: Border.all(width: 2, color: Colors.red), elevation: 20),
      ),
      //适配终端的主题风格
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),

      // darkTheme: CustomTheme.darkTheme,
      // theme: CustomTheme.lightTheme,

      // initialRoute: '/',
      // getPages: [
      //   GetPage(name: "/", page: () => Home()),
      //   GetPage(name: '/product', page: () => Product()),
      //   GetPage(name: '/producta', page: () => ProductA()),
      //   GetPage(
      //       name: '/productDetail',
      //       page: () => ProductDetail(),
      //       transition: Transition.rightToLeft),
      // ],
      home: DioHome(),
      // // 声明命名路由
      // routes: {
      //   'home': (context) => Home(),
      //   'product': (context) => Product(),
      //   'productDetail': (context) => ProductDetail(),
      // },
      // initialRoute: 'home',
      // onUnknownRoute: (RouteSettings setting) =>
      //     MaterialPageRoute(builder: (context) => UnknowPage()),
      // onGenerateRoute: (RouteSettings setting) {
      //   print('当前路径: ' + setting.name.toString());
      //   if (setting.name == '/') {
      //     return MaterialPageRoute(builder: (context) => Home());
      //   }
      //   if (setting.name == '/product') {
      //     return MaterialPageRoute(builder: (context) => Product());
      //   }
      //   //匹配 /product/:id
      //   var uri = Uri.parse(setting.name.toString());
      //   print(uri.pathSegments);
      //   if (uri.pathSegments.length == 2 &&
      //       uri.pathSegments.first == "product") {
      //     var id = uri.pathSegments[1];
      //     return MaterialPageRoute(builder: (context) => ProductDetail(id: id));
      //   }
      //
      //   return MaterialPageRoute(builder: (context) => UnknowPage());
      // },
      debugShowCheckedModeBanner: false,
      //国际化
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        CustomLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), //美国英语
        const Locale('zh', 'CN'), //简体中文
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        print('deviceLocale:$locale');
        print('languageCode: ${locale!.languageCode}');
        print('countryCode: ${locale.countryCode}');
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode && supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
