import 'package:get_it/get_it.dart';
import '../../core/middleware/sidebar_middleware.dart';

/// dependency injection class

class GetItFiles {
  static final GetIt _getIt = GetIt.instance;

  /// get an GetIt instance
  static GetIt getItInstance() => _getIt;

  /// initialize the injected classes
  static void setUp() {
    _getIt.registerLazySingleton(() => SidebarMiddleware());
  }
}
