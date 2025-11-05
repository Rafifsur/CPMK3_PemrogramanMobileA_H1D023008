import 'package:get/get.dart';

import '../modules/home/home_page.dart';
import '../modules/about/about_page.dart';
import '../modules/contact/contact_page.dart';
import '../modules/widget_basic/widget_basic_page.dart';
import '../modules/state_management/state_management_page.dart';
import '../modules/routing_navigation/routing_navigation_page.dart';
import '../modules/about_getx/about_getx_page.dart';

class AppPages {
  static const home = '/home';
  static const about = '/about';
  static const contact = '/contact';
  static const widgetBasic = '/widget-basic';
  static const stateManagement = '/state-management';
  static const routingNavigation = '/routing-navigation';
  static const aboutGetX = '/about-getx';

  static final pages = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: about, page: () => const AboutPage()),
    GetPage(name: contact, page: () => const ContactPage()),
    GetPage(name: widgetBasic, page: () => const WidgetBasicPage()),
    GetPage(name: stateManagement, page: () => const StateManagementPage()),
    GetPage(name: routingNavigation, page: () => const RoutingNavigationPage()),
    GetPage(name: aboutGetX, page: () => const AboutGetXPage()),
  ];
}
