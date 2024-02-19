import 'package:dio/dio.dart';
import 'package:explora5k/api/authentication_api.dart';
import 'package:explora5k/api/user_api.dart';
import 'package:explora5k/helpers/http.dart';
import 'package:explora5k/helpers/http_constants.dart';
import 'package:explora5k/services/authentication_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:get/get.dart';
import '../api/courses_color_api.dart';
import '../api/pages_api.dart';
import '../services/network_status_service.dart';

abstract class DependecyInjection {
  static Future<void> initialize() async {
    final dio = Dio(BaseOptions(baseUrl: BASE_URL));
    Http http = Http(dio: dio);

    final authenticationAPI = AuthenticationAPI(http);
    GetIt.instance.registerSingleton<AuthenticationAPI>(authenticationAPI);

    Get.put<NetworkStatusService>(NetworkStatusService(), permanent: true);

    const secureStorage = FlutterSecureStorage();
    final authenticationClient =
        AuthenticationClient(secureStorage, authenticationAPI);
    GetIt.instance
        .registerSingleton<AuthenticationClient>(authenticationClient);

    final coursesColorsAPI = CoursesColorsAPI(http, authenticationClient);
    GetIt.instance.registerSingleton<CoursesColorsAPI>(coursesColorsAPI);

    final userAPI = UserAPI(http);
    GetIt.instance.registerSingleton<UserAPI>(userAPI);

    final pageAPI = PagesAPI(http, authenticationClient);
    GetIt.instance.registerSingleton<PagesAPI>(pageAPI);

    /*final localNotifications = FlutterLocalNotificationsPlugin();
    await localNotifications.initialize(InitializationSettings(
      android: const AndroidInitializationSettings('launcher_icon'),
      iOS: IOSInitializationSettings(
        requestSoundPermission: true,
        requestBadgePermission: true,
        requestAlertPermission: true,
      ),
    ));
    GetIt.instance
        .registerSingleton<FlutterLocalNotificationsPlugin>(localNotifications);*/
  }
}