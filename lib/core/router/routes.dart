import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/features/auth/active/active_otp_screen.dart';
import 'package:my_trainer/features/auth/certification_and_organic/certification_and_organic_screen.dart';
import 'package:my_trainer/features/auth/expertise_and_specialization/expertise_and_specialization_screen.dart';
import 'package:my_trainer/features/auth/forget/forget_password_screen.dart';
import 'package:my_trainer/features/auth/login/login_screen.dart';
import 'package:my_trainer/features/auth/otp/otp_screen.dart';
import 'package:my_trainer/features/auth/reset/reset_password_screen.dart';
import 'package:my_trainer/features/auth/sign_up/sign_up_screen.dart';
import 'package:my_trainer/features/auth/trainer_sign_up/trainer_sign_up_screen.dart';
import 'package:my_trainer/features/auth/training_location/training_location_screen.dart';
import 'package:my_trainer/features/auth/vendor_selection/vendor_selection_screen.dart';
import 'package:my_trainer/features/auth/verify_identity/verify_identity_screen.dart';
import 'package:my_trainer/features/auth/verify_identity/verifyed_screen.dart';
import 'package:my_trainer/features/other/about_us_screen.dart';
import 'package:my_trainer/features/other/code_of_conduct_screen.dart';
import 'package:my_trainer/features/other/contact_screen.dart';
import 'package:my_trainer/features/other/imprint_screen.dart';
import 'package:my_trainer/features/other/privacy_policy_screen.dart';
import 'package:my_trainer/features/other/terms_and_conditions_screen.dart';
import 'package:my_trainer/features/trainers/connected__account/connected_account_screen.dart';
import 'package:my_trainer/features/trainers/earnings/earnings_screen.dart';
import 'package:my_trainer/features/trainers/my_availability/my_availiability_screen.dart';
import 'package:my_trainer/features/trainers/package_and_price/package_and_price_screen.dart';
import 'package:my_trainer/features/trainers/trainer_information/trainer_information_screen.dart';
import 'package:my_trainer/features/trainers/trainer_nav/trainer_nav_screen.dart';
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
      //==================== Trainer Sign Up ================
      GoRoute(
        name: RoutePath.trainerSignUpScreen,
        path: RoutePath.trainerSignUpScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const TrainerSignUpScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.expertiseAndSpecializationScreen,
        path: RoutePath.expertiseAndSpecializationScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const ExpertiseAndSpecializationScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.trainingLocationScreen,
        path: RoutePath.trainingLocationScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const TrainingLocationScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.certificationAndOrganicScreen,
        path: RoutePath.certificationAndOrganicScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const CertificationAndOrganicScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.verifyIdentityScreen,
        path: RoutePath.verifyIdentityScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const VerifyIdentityScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.verifyedScreen,
        path: RoutePath.verifyedScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const VerifyedScreen(),
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
      GoRoute(
        name: RoutePath.trainerNavScreen,
        path: RoutePath.trainerNavScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  TrainerNavScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.trainerInformationScreen,
        path: RoutePath.trainerInformationScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  TrainerInformationScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.packageAndPriceScreen,
        path: RoutePath.packageAndPriceScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  PackageAndPriceScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.myAvailiabilityScreen,
        path: RoutePath.myAvailiabilityScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  MyAvailiabilityScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.connectedAccountScreen,
        path: RoutePath.connectedAccountScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  ConnectedAccountScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.earningsScreen,
        path: RoutePath.earningsScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child:  EarningsScreen(),
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
