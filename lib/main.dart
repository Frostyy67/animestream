import 'dart:async';
import 'dart:io';

import 'package:animestream/core/anime/providers/animeonsen.dart';
import 'package:animestream/core/app/logging.dart';
import 'package:animestream/core/app/runtimeDatas.dart';
import 'package:animestream/core/data/settings.dart';
import 'package:animestream/core/data/theme.dart';
import 'package:animestream/ui/models/notification.dart';
import 'package:animestream/ui/models/snackBar.dart';
import 'package:animestream/ui/pages/mainNav.dart';
import 'package:animestream/ui/theme/themeProvider.dart';
import 'package:animestream/ui/theme/themes.dart';
import 'package:animestream/ui/theme/types.dart';
import 'package:app_links/app_links.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    final Directory dir = await getApplicationDocumentsDirectory();

    await Hive.initFlutter(dir.path);

    await loadAndAssignSettings();

    AnimeOnsen().checkAndUpdateToken();

    NotificationService().init();

    await dotenv.load(fileName: ".env");

    runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const AnimeStream(),
      ),
    );
  } catch (err) {
    debugPrint(err.toString());
    Logger().writeLog(err.toString());
    print("[CRASH] logged the error to logs folder");
  }
}

Future<void> loadAndAssignSettings() async {
  await Settings().getSettings().then((settings) => {
        currentUserSettings = settings,
        print("[STARTUP] Loaded user settings"),
      });

  //load and apply theme
  await getTheme().then((themeId) {
    if (themeId > availableThemes.length) {
      print("[STARTUP] Failed to apply theme with ID $themeId, Applying default theme");
      showToast("Failed to apply theme. Using default theme");
      setTheme(01);
      themeId = 01;
    }

    final darkMode = currentUserSettings!.darkMode!;

    final theme = availableThemes.where((theme) => theme.id == themeId).toList()[0];
    if (darkMode) {
      appTheme = theme.theme;
      appTheme.backgroundColor =
          (currentUserSettings!.amoledBackground ?? false) ? Colors.black : darkModeValues.backgroundColor;
    } else {
      appTheme = AnimeStreamTheme(
        accentColor: theme.theme.accentColor,
        textMainColor: lightModeValues.textMainColor,
        textSubColor: lightModeValues.textSubColor,
        backgroundColor: lightModeValues.backgroundColor,
        backgroundSubColor: lightModeValues.backgroundSubColor,
        modalSheetBackgroundColor: lightModeValues.modalSheetBackgroundColor,
      );
    }

    print("[STARTUP] Loaded theme of ID $themeId");
  });
}

class AnimeStream extends StatefulWidget {
  const AnimeStream({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  State<AnimeStream> createState() => _AnimeStreamState();
}

class _AnimeStreamState extends State<AnimeStream> {
  StreamSubscription<Uri>? _sub;
  late AppLinks _appLinks;

  @override
  void initState() {
    listenDeepLinkCall();

    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
    );

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(0.002), systemNavigationBarColor: Colors.black.withOpacity(0.002)));

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top]);

    super.initState();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  void listenDeepLinkCall() {
    _appLinks = AppLinks();
    _sub = _appLinks.uriLinkStream.listen((uri) {
      if (uri.scheme == "animestream") {
        print("Invoked DeepLink uri: ${uri.toString()}");
        String host = uri.host;
        switch (host) {
          case "info":
            {
              final id = int.tryParse(uri.queryParameters['id'] ?? "nothing");
              if (id != null)
                //need to do smth T-T
                break;
            }
          default:
            print("BAD-INTENT-PATH");
        }
      }
    });
  }

  Widget? deepLinkRequestedNavigationPage = null;

  // This widget is the root of *my* application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightScheme, darkScheme) {
        late AnimeStreamTheme scheme;

        //just checks for dark mode and sets the appTheme variable with suitable theme
        if (currentUserSettings?.darkMode ?? true) {
          scheme = AnimeStreamTheme(
            accentColor: darkScheme?.primary ?? appTheme.accentColor,
            backgroundColor: (currentUserSettings?.amoledBackground ?? false)
                ? Colors.black
                : darkScheme?.surface ?? appTheme.backgroundColor,
            backgroundSubColor: darkScheme?.secondaryContainer ?? appTheme.backgroundSubColor,
            textMainColor: darkScheme?.onSurface ?? appTheme.textMainColor,
            textSubColor: darkScheme?.onSurfaceVariant ?? appTheme.textSubColor,
            modalSheetBackgroundColor: darkScheme?.surface ?? appTheme.modalSheetBackgroundColor,
          );
        } else {
          scheme = AnimeStreamTheme(
            accentColor: lightScheme?.primary ?? appTheme.accentColor,
            backgroundColor: lightScheme?.surface ?? appTheme.accentColor,
            backgroundSubColor: lightScheme?.secondaryContainer ?? appTheme.backgroundSubColor,
            textMainColor: lightScheme?.onSurface ?? appTheme.textMainColor,
            textSubColor: lightScheme?.onSurfaceVariant ?? appTheme.textSubColor,
            modalSheetBackgroundColor: lightScheme?.surface ?? appTheme.modalSheetBackgroundColor,
          );
        }

        if (currentUserSettings?.materialTheme ?? false) {
          appTheme = scheme;
          // print("[THEME] Applying Material You Theme");
        }

        final themeProvider = Provider.of<ThemeProvider>(context);

        //set status bar icon brightness (some devices do this automatically, some dont!
        //so here it is for all of em!)
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarIconBrightness: themeProvider.isDark ? Brightness.light : Brightness.dark,
            statusBarColor: Colors.black.withOpacity(0.002),
            systemNavigationBarColor: Colors.black.withOpacity(0.002),
          ),
        );

        return MaterialApp(
          title: 'Animestream',
          theme: ThemeData(
            useMaterial3: true,
            brightness: themeProvider.isDark ? Brightness.dark : Brightness.light,
            textTheme:
                Theme.of(context).textTheme.apply(bodyColor: themeProvider.theme.textMainColor, fontFamily: "NotoSans"),
            scaffoldBackgroundColor: themeProvider.theme.backgroundColor,
            bottomSheetTheme: BottomSheetThemeData(backgroundColor: themeProvider.theme.modalSheetBackgroundColor),
            colorScheme: ColorScheme.fromSeed(
              brightness: themeProvider.isDark ? Brightness.dark : Brightness.light,
              seedColor:
                  (currentUserSettings?.materialTheme ?? false) ? scheme.accentColor : themeProvider.theme.accentColor,
            ),
          ),
          home: deepLinkRequestedNavigationPage ?? MainNavigator(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
