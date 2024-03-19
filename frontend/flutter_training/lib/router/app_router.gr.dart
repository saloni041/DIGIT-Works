// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    UnauthenticatedRouteWrapper.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UnauthenticatedPageWrapper(),
      );
    },
    AuthenticatedRouteWrapper.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AuthenticatedPageWrapper(),
      );
    },
    LanguageSelectionRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LanguageSelectionPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    SuccessResponseRoute.name: (routeData) {
      final args = routeData.argsAs<SuccessResponseRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SuccessResponsePage(
          key: args.key,
          header: args.header,
          subHeader: args.subHeader,
          subText: args.subText,
          subTitle: args.subTitle,
          callBack: args.callBack,
          callBackWhatsapp: args.callBackWhatsapp,
          callBackDownload: args.callBackDownload,
          callBackPrint: args.callBackPrint,
          backButton: args.backButton,
          buttonLabel: args.buttonLabel,
          isWithoutLogin: args.isWithoutLogin,
          downloadLabel: args.downloadLabel,
          printLabel: args.printLabel,
          whatsAppLabel: args.whatsAppLabel,
          backButtonLabel: args.backButtonLabel,
        ),
      );
    },
    CreateBirthRegistrationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CreateBirthRegistrationPage(),
      );
    },
    BirthRegSearchInboxRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const BirthRegSearchInboxPage(),
      );
    },
    ViewBirthCertificatesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ViewBirthCertificatesPage(),
      );
    },
    CreateIndividualRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CreateIndividualPage(),
      );
    },
    SearchIndividualRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SearchIndividualPage(),
      );
    },
    ViewIndividualRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ViewIndividualPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          UnauthenticatedRouteWrapper.name,
          path: '/',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: UnauthenticatedRouteWrapper.name,
              redirectTo: 'language_selection',
              fullMatch: true,
            ),
            RouteConfig(
              LanguageSelectionRoute.name,
              path: 'language_selection',
              parent: UnauthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: UnauthenticatedRouteWrapper.name,
            ),
          ],
        ),
        RouteConfig(
          AuthenticatedRouteWrapper.name,
          path: '/',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: AuthenticatedRouteWrapper.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              SuccessResponseRoute.name,
              path: 'success',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              CreateBirthRegistrationRoute.name,
              path: 'create-birth-certificate',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              BirthRegSearchInboxRoute.name,
              path: 'search-birth-cert',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              ViewBirthCertificatesRoute.name,
              path: 'view-birth-certs',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              CreateIndividualRoute.name,
              path: 'create-individual',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              SearchIndividualRoute.name,
              path: 'search-individual',
              parent: AuthenticatedRouteWrapper.name,
            ),
            RouteConfig(
              ViewIndividualRoute.name,
              path: 'view-individual',
              parent: AuthenticatedRouteWrapper.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [UnauthenticatedPageWrapper]
class UnauthenticatedRouteWrapper extends PageRouteInfo<void> {
  const UnauthenticatedRouteWrapper({List<PageRouteInfo>? children})
      : super(
          UnauthenticatedRouteWrapper.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'UnauthenticatedRouteWrapper';
}

/// generated route for
/// [AuthenticatedPageWrapper]
class AuthenticatedRouteWrapper extends PageRouteInfo<void> {
  const AuthenticatedRouteWrapper({List<PageRouteInfo>? children})
      : super(
          AuthenticatedRouteWrapper.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AuthenticatedRouteWrapper';
}

/// generated route for
/// [LanguageSelectionPage]
class LanguageSelectionRoute extends PageRouteInfo<void> {
  const LanguageSelectionRoute()
      : super(
          LanguageSelectionRoute.name,
          path: 'language_selection',
        );

  static const String name = 'LanguageSelectionRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [SuccessResponsePage]
class SuccessResponseRoute extends PageRouteInfo<SuccessResponseRouteArgs> {
  SuccessResponseRoute({
    Key? key,
    required String header,
    String? subHeader,
    String? subText,
    String? subTitle,
    void Function()? callBack,
    void Function()? callBackWhatsapp,
    void Function()? callBackDownload,
    void Function()? callBackPrint,
    bool? backButton,
    String? buttonLabel,
    bool isWithoutLogin = false,
    String? downloadLabel,
    String? printLabel,
    String? whatsAppLabel,
    String? backButtonLabel,
  }) : super(
          SuccessResponseRoute.name,
          path: 'success',
          args: SuccessResponseRouteArgs(
            key: key,
            header: header,
            subHeader: subHeader,
            subText: subText,
            subTitle: subTitle,
            callBack: callBack,
            callBackWhatsapp: callBackWhatsapp,
            callBackDownload: callBackDownload,
            callBackPrint: callBackPrint,
            backButton: backButton,
            buttonLabel: buttonLabel,
            isWithoutLogin: isWithoutLogin,
            downloadLabel: downloadLabel,
            printLabel: printLabel,
            whatsAppLabel: whatsAppLabel,
            backButtonLabel: backButtonLabel,
          ),
        );

  static const String name = 'SuccessResponseRoute';
}

class SuccessResponseRouteArgs {
  const SuccessResponseRouteArgs({
    this.key,
    required this.header,
    this.subHeader,
    this.subText,
    this.subTitle,
    this.callBack,
    this.callBackWhatsapp,
    this.callBackDownload,
    this.callBackPrint,
    this.backButton,
    this.buttonLabel,
    this.isWithoutLogin = false,
    this.downloadLabel,
    this.printLabel,
    this.whatsAppLabel,
    this.backButtonLabel,
  });

  final Key? key;

  final String header;

  final String? subHeader;

  final String? subText;

  final String? subTitle;

  final void Function()? callBack;

  final void Function()? callBackWhatsapp;

  final void Function()? callBackDownload;

  final void Function()? callBackPrint;

  final bool? backButton;

  final String? buttonLabel;

  final bool isWithoutLogin;

  final String? downloadLabel;

  final String? printLabel;

  final String? whatsAppLabel;

  final String? backButtonLabel;

  @override
  String toString() {
    return 'SuccessResponseRouteArgs{key: $key, header: $header, subHeader: $subHeader, subText: $subText, subTitle: $subTitle, callBack: $callBack, callBackWhatsapp: $callBackWhatsapp, callBackDownload: $callBackDownload, callBackPrint: $callBackPrint, backButton: $backButton, buttonLabel: $buttonLabel, isWithoutLogin: $isWithoutLogin, downloadLabel: $downloadLabel, printLabel: $printLabel, whatsAppLabel: $whatsAppLabel, backButtonLabel: $backButtonLabel}';
  }
}

/// generated route for
/// [CreateBirthRegistrationPage]
class CreateBirthRegistrationRoute extends PageRouteInfo<void> {
  const CreateBirthRegistrationRoute()
      : super(
          CreateBirthRegistrationRoute.name,
          path: 'create-birth-certificate',
        );

  static const String name = 'CreateBirthRegistrationRoute';
}

/// generated route for
/// [BirthRegSearchInboxPage]
class BirthRegSearchInboxRoute extends PageRouteInfo<void> {
  const BirthRegSearchInboxRoute()
      : super(
          BirthRegSearchInboxRoute.name,
          path: 'search-birth-cert',
        );

  static const String name = 'BirthRegSearchInboxRoute';
}

/// generated route for
/// [ViewBirthCertificatesPage]
class ViewBirthCertificatesRoute extends PageRouteInfo<void> {
  const ViewBirthCertificatesRoute()
      : super(
          ViewBirthCertificatesRoute.name,
          path: 'view-birth-certs',
        );

  static const String name = 'ViewBirthCertificatesRoute';
}

/// generated route for
/// [CreateIndividualPage]
class CreateIndividualRoute extends PageRouteInfo<void> {
  const CreateIndividualRoute()
      : super(
          CreateIndividualRoute.name,
          path: 'create-individual',
        );

  static const String name = 'CreateIndividualRoute';
}

/// generated route for
/// [SearchIndividualPage]
class SearchIndividualRoute extends PageRouteInfo<void> {
  const SearchIndividualRoute()
      : super(
          SearchIndividualRoute.name,
          path: 'search-individual',
        );

  static const String name = 'SearchIndividualRoute';
}

/// generated route for
/// [ViewIndividualPage]
class ViewIndividualRoute extends PageRouteInfo<void> {
  const ViewIndividualRoute()
      : super(
          ViewIndividualRoute.name,
          path: 'view-individual',
        );

  static const String name = 'ViewIndividualRoute';
}
