import 'package:erinet_app/view/call_history_detail_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../view/agent_home_screen.dart';
import '../view/bank_details_screen.dart';
import '../view/bank_transfer_proof_screen.dart';
import '../view/connect_call_screen.dart';
import '../view/current_bidding_screen.dart';
import '../view/deactivate_account_screen.dart';
import '../view/my_notification_screen.dart';
import '../view/about_screen.dart';
import '../view/bank_transfer_screen.dart';
import '../view/call_history_screen.dart';
import '../view/my_wallet_screen.dart';
import '../view/notification_setting_screen.dart';
import '../view/profile_screen.dart';
import '../view/recent_screen.dart';
import '../view/settings_screen.dart';
import '../route_management/controller_binding.dart';
import '../utils/route_utils.dart';
import '../view/calling_screen.dart';
import '../view/chat_screen.dart';
import '../view/on_boarding_screen.dart';
import '../view/otp_screen.dart';
import '../view/start_calling_screen.dart';
import '../view/start_connecting_call_screen.dart';
import '../view/user_type_screen.dart';
import '../view/available_agents_screen.dart';
import '../view/home_screen.dart';
import '../view/login_screen.dart';
import '../view/welcome_screen.dart';
import '../view/withdraw_money.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kWelcomeScreen,
        page: () => const WelcomeScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kOnBoardingScreen,
        page: () => const OnBoardingScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kLoginScreen,
        page: () => const LoginScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kOtpScreen,
        page: () => const OtpScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kUserTypeScreen,
        page: () => const UserTypeScreen(),
        binding: ControllerBinding(),
      ),

      GetPage(
        name: kHomeScreen,
        page: () => HomeScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kAgentHomeScreen,
        page: () => AgentHomeScreen(),
        binding: ControllerBinding(),
      ),

      GetPage(
        name: kAvailableAgentsScreen,
        page: () => AvailableAgentsScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kChatScreen,
        page: () => const ChatScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kCallingScreen,
        page: () => const CallingScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kAboutScreen,
        page: () => AboutScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kProfileScreen,
        page: () => ProfileScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kCallHistoryScreen,
        page: () => CallHistoryScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kCallHistoryDetailScreen,
        page: () => CallHistoryDetailScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kMyWalletScreen,
        page: () =>  MyWalletScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kSettingsScreen,
        page: () => SettingsScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kNotificationSettingScreen,
        page: () => NotificationSettingScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kMyNotificationScreen,
        page: () => const MyNotificationScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kBankAccountDetailsScreen,
        page: () => BankDetailsScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kDeactivateAccountScreen,
        page: () => const DeactivateAccountScreen(),
        binding: ControllerBinding(),
      ),
      // GetPage(
      //   name: kBuyAirMinutesScreen,
      //   page: () => const BuyAirMinutesScreen(),
      //   binding: ControllerBinding(),
      // ),
      GetPage(
        name: kBankTransferScreen,
        page: () => const BankTransferScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kBankTransferProofScreen,
        page: () => const BankTransferProofScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kRecentScreen,
        page: () => RecentScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kCurrentBidingScreen,
        page: () => CurrentBidingScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kWithdrawMoneyScreen,
        page: () => WithdrawMoneyScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kConnectCallScreen,
        page: () =>  ConnectCallScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kStartConnectingCallScreen,
        page: () =>  StartConnectingCallScreen(),
        binding: ControllerBinding(),
      ),
      GetPage(
        name: kStartCallingScreen,
        page: () =>  StartCallingScreen(),
        binding: ControllerBinding(),
      ),
    ];
  }
}
