import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:flutter_application_1/app/features/home/article_screen.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart';
import 'package:flutter_application_1/app/features/home/home_screen.dart';

import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_application_1/di/di.dart';

final GlobalKey<NavigatorState> _rootNavigationKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  observers: [TalkerRouteObserver(talker)],
  navigatorKey: _rootNavigationKey,
  initialLocation: '/home',
  routes: <RouteBase>[
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return NoTransitionPage<void>(
          key: state.pageKey,
          child: const HomeScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'article/:id',
          pageBuilder: (context, state) {
            final article = state.extra as Article;
            return NoTransitionPage<void>(
              key: state.pageKey,
              child: DetailsScreen(article: article),
            );
          },
        ),
      ],
    ),
  ],
);
