import 'package:get_it/get_it.dart';
import '../../core/middleware/sidebar_middleware.dart';

class GetItFiles {
  static final GetIt _getIt = GetIt.instance;
  static GetIt getItInstance() => _getIt;
  static void setUp() {
    _getIt.registerLazySingleton(() => SidebarMiddleware());
  }
}
