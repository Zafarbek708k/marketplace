import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "app_route_name.dart";

@immutable
class AppRouter {
  factory AppRouter() => _router;

  const AppRouter._internal();

  static const AppRouter _router = AppRouter._internal();

  static final GoRouter router = GoRouter(
    initialLocation: AppRouteName.homePage,
    debugLogDiagnostics: true,
      routes: <RouteBase> [
        GoRoute(
          name: "HomePage",
          path: AppRouteName.homePage,
          builder: (BuildContext context, GoRouterState state) {
            return Placeholder();
          },
        ),
      ]
  );
}

// @immutable
// final class BlockedRouter {
//   factory BlockedRouter() => _router;
//
//   const BlockedRouter._internal();
//
//   static const BlockedRouter _router = BlockedRouter._internal();
//
//   static final GoRouter router = GoRouter(
//     initialLocation: AppRouteName.blockedPage,
//     debugLogDiagnostics: true,
//     routes: <RouteBase>[
//       GoRoute(
//         name: "BlockedPage",
//         path: AppRouteName.blockedPage,
//         builder: (BuildContext context, GoRouterState state) {
//           return const Scaffold(
//             body: Center(
//               child: Text("App is permanently blocked !!!"),
//             ),
//           );
//         },
//       ),
//     ],
//   );
// }
