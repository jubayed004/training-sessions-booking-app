import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/features/auth/active/active_otp_screen.dart';
import 'package:my_trainer/features/auth/forget/forget_password_screen.dart';
import 'package:my_trainer/features/auth/login/login_screen.dart';
import 'package:my_trainer/features/auth/otp/otp_screen.dart';
import 'package:my_trainer/features/auth/reset/reset_password_screen.dart';
import 'package:my_trainer/features/auth/sign_up/sign_up_screen.dart';
import 'package:my_trainer/features/auth/vendor_selection/vendor_selection_screen.dart';
import 'package:my_trainer/features/other/about_us_screen.dart';
import 'package:my_trainer/features/other/code_of_conduct_screen.dart';
import 'package:my_trainer/features/other/contact_screen.dart';
import 'package:my_trainer/features/other/imprint_screen.dart';
import 'package:my_trainer/features/other/privacy_policy_screen.dart';
import 'package:my_trainer/features/other/terms_and_conditions_screen.dart';
import 'package:my_trainer/features/user/bookings/booking_confirmed_screen.dart';
import 'package:my_trainer/features/user/favorite_trainer/favorite_trainer_screen.dart';
import 'package:my_trainer/features/user/inbox/inbox_screen.dart';
import 'package:my_trainer/features/user/nav/navigation_page.dart';
import 'package:my_trainer/features/user/profile/personal_information_edit_screen.dart';
import 'package:my_trainer/features/user/profile/personal_information_screen.dart';
import 'package:my_trainer/features/other/change_password_screen.dart';
import 'package:my_trainer/features/other/password_and_security_screen.dart';
import 'package:my_trainer/features/user/push_notifications/push_notification_screen.dart';
import 'package:my_trainer/features/user/trainer_details/trainer_details_screen.dart';
import 'package:my_trainer/features/welcome/welcome_screen.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter initRoute = GoRouter(
    initialLocation: RoutePath.welcomeScreen.addBasePath,
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    routes: [
      ///======================= Initial Route =======================
      GoRoute(
        name: RoutePath.welcomeScreen,
        path: RoutePath.welcomeScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const WelcomeScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.vendorSelectionScreen,
        path: RoutePath.vendorSelectionScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const VendorSelectionScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.loginScreen,
        path: RoutePath.loginScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const LoginScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.signUpScreen,
        path: RoutePath.signUpScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const SignUpScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.forgetPasswordScreen,
        path: RoutePath.forgetPasswordScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const ForgetPasswordScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.otpScreen,
        path: RoutePath.otpScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  OtpScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.resetPasswordScreen,
        path: RoutePath.resetPasswordScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ResetPasswordScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.activeOtpScreen,
        path: RoutePath.activeOtpScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ActiveOtpScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.navigationPage,
        path: RoutePath.navigationPage.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  NavigationPage(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.bookingConfirmationScreen,
        path: RoutePath.bookingConfirmationScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  BookingConfirmationScreen(),
            state: state,
          );
        },
      ),
      //=================Profile ===================
      GoRoute(
        name: RoutePath.personalInformationScreen,
        path: RoutePath.personalInformationScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  PersonalInformationScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.personalInformationEditScreen,
        path: RoutePath.personalInformationEditScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  PersonalInformationEditScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.pushNotificationScreen,
        path: RoutePath.pushNotificationScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  PushNotificationScreen(),
            state: state,
          );
        },
      ),
  //=============Setting==========
      GoRoute(
        name: RoutePath.passwordAndSecurityScreen,
        path: RoutePath.passwordAndSecurityScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  PasswordAndSecurityScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.changePasswordScreen,
        path: RoutePath.changePasswordScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ChangePasswordScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.codeOfConductScreen,
        path: RoutePath.codeOfConductScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  CodeOfConductScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.aboutUsScreen,
        path: RoutePath.aboutUsScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  AboutUsScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.contactScreen,
        path: RoutePath.contactScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ContactScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.privacyPolicyScreen,
        path: RoutePath.privacyPolicyScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  PrivacyPolicyScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.termsAndConditionsScreen,
        path: RoutePath.termsAndConditionsScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  TermsAndConditionsScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.imprintScreen,
        path: RoutePath.imprintScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ImprintScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.favoriteTrainerScreen,
        path: RoutePath.favoriteTrainerScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  FavoriteTrainerScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.trainerDetailsScreen,
        path: RoutePath.trainerDetailsScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  TrainerDetailsScreen(),
            state: state,
          );
        },
      ),
   /*   GoRoute(
        name: RoutePath.chatListScreen,
        path: RoutePath.chatListScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ChatListScreen(),
            state: state,
          );
        },
      ),*/

      /*GoRoute(
        name: RoutePath.categoryEventsScreen,
        path: RoutePath.categoryEventsScreen.addBasePath,
        pageBuilder: (context, state) {
          final extra = state.extra;
          final map = (extra is Map<String, dynamic>) ? extra : {};

          final id = map['id'] as String? ?? '';
          final title = map['title'] as String? ?? '';

          return _buildPageWithAnimation(
            child: CategoryEventsScreen(id: id, title: title),
            state: state,
          );
        },
      ),*/
    ],
  );

  static CustomTransitionPage _buildPageWithAnimation({
    required Widget child,
    required GoRouterState state,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static GoRouter get route => initRoute;
}
