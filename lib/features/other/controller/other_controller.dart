import 'package:get/get.dart';
import 'package:my_trainer/core/di/injection.dart';
import 'package:my_trainer/core/service/datasource/local/local_service.dart';
import 'package:my_trainer/core/service/datasource/remote/api_client.dart';
import 'package:my_trainer/features/other/model/terms_conditions_model.dart';
import 'package:my_trainer/utils/enum/app_enum.dart';

class OtherController extends GetxController{
  final ApiClient apiClient = sl<ApiClient>();
  final LocalService localService = sl<LocalService>();


  /// ============================= GET Terms Condition =====================================
  final Rx<TermsConditionsModel> termsConditionsData = TermsConditionsModel().obs;
  final Rx<ApiStatus> termsLoading = ApiStatus.completed.obs;
  void termsLoadingMethod(ApiStatus status) => termsLoading.value = status;
/*
  Future<void> getTermsCondition() async {
    termsLoadingMethod(ApiStatus.loading);
    var response = await apiClient.get(url: ApiUrl.termsConditions(),showResult: true);
    if (response.statusCode == 200) {
      termsConditionsData.value = TermsConditionsModel.fromJson(response.body);
      termsLoadingMethod(ApiStatus.completed);
    } else {
      if (response.statusCode == 503) {
        termsLoadingMethod(ApiStatus.internetError);
      } else if (response.statusCode == 404) {
        termsLoadingMethod(ApiStatus.noDataFound);
      } else {
        termsLoadingMethod(ApiStatus.error);
      }
    }
  }*/
  /// ============================= GET Privacy Policy =====================================
  final Rx<TermsConditionsModel> privacyConditionsData = TermsConditionsModel().obs;
  final Rx<ApiStatus> privacyLoading = ApiStatus.completed.obs;
  void privacyLoadingMethod(ApiStatus status) => privacyLoading.value = status;

/*  Future<void> getPrivacyPolicy() async {
    privacyLoadingMethod(ApiStatus.loading);
    var response = await apiClient.get(url: ApiUrl.privacyPolicy(),showResult: true);
    if (response.statusCode == 200) {
      privacyConditionsData.value = TermsConditionsModel.fromJson(response.body);
      privacyLoadingMethod(ApiStatus.completed);
    } else {
      if (response.statusCode == 503) {
        privacyLoadingMethod(ApiStatus.internetError);
      } else if (response.statusCode == 404) {
        privacyLoadingMethod(ApiStatus.noDataFound);
      } else {
        privacyLoadingMethod(ApiStatus.error);
      }
    }
  }*/

/*  /// ============================= GET Contact Number =====================================
  final Rx<String> contactNumber = "".obs;
  final Rx<ApiStatus> contactLoading = ApiStatus.completed.obs;
  void contactLoadingMethod(ApiStatus status) => contactLoading.value = status;

  Future<void> getContactNumber() async {
    contactLoadingMethod(ApiStatus.loading);
    var response = await apiClient.get(url: ApiUrl.contactNumber(),showResult: true);
    if (response.statusCode == 200) {
      final model = ContactNumberModel.fromJson(response.body);
      contactNumber.value = model.data?.contact??"";
      contactLoadingMethod(Status.completed);
    } else {
      if (response.statusCode == 503) {
        contactLoadingMethod(Status.internetError);
      } else if (response.statusCode == 404) {
        contactLoadingMethod(Status.noDataFound);
      } else {
        contactLoadingMethod(Status.error);
      }
    }
  }*/

  /// ============================= Patch Change Password =====================================
  final RxBool changePasswordLoading = false.obs;
  void changePasswordLoadingMethod(bool loading) => changePasswordLoading.value = loading;

  /*Future<void> changePassword({required Map<String, String> body}) async {
    changePasswordLoadingMethod(true);
    var response = await apiClient.patch(url: ApiUrl.changePassword(),body: body,showResult: true);
    if (response.statusCode == 200) {
      changePasswordLoadingMethod(false);
      toastMessage(message: "successful".tr);
      AppRouter.route.pop();
    } else {
      toastMessage(message: response.body['message'].toString());
      changePasswordLoadingMethod(false);
    }
  }*/

/*  /// ============================= Ticker Send =====================================
  final RxBool submitLoading = false.obs;
  void submitMethod(bool status) => submitLoading.value = status;

  void submitTicket({required Map<String, String> body, required TextEditingController description}) async {
    try{
      submitMethod(true);
      var response = await apiClient.post(body: body,url: ApiUrl.ticket(),showResult: true);

      if (response.statusCode == 200) {
        submitMethod(false);
        toastMessage(message: "successful".tr);
        description.clear();
        AppRouter.route.pop();
      } else {
        submitMethod(false);
        toastMessage(message: response.body?['message'].toString()??"something want wrong".tr);
      }
    }catch (err){
      submitMethod(false);
    }
  }*/
  /// ============================= Ticker Send =====================================
  final RxBool deleteLoading = false.obs;
  void deleteMethod(bool status) => deleteLoading.value = status;

/*  void deleteAccount({required String password}) async {
    try{
      deleteMethod(true);
      final roll = await dbHelper.getUserRole();
      final email = await dbHelper.getUserEmail();
      if(roll == "USER"){
        var response = await apiClient.delete(body: {
          "email": email,
          "password": password,
        },url: ApiUrl.deleteUser(),showResult: true);

        if (response.statusCode == 200) {
          deleteMethod(false);
          toastMessage(message: "successful".tr);
          await dbHelper.logOut();
        } else {
          deleteMethod(false);
          toastMessage(message: response.body?['message'].toString()??"something want wrong".tr);
        }
      }else if(roll == "PARTNER"){
        var response = await apiClient.delete(body: {
          "email": email,
          "password": password,
        },url: ApiUrl.deletePartner(),showResult: true);

        if (response.statusCode == 200) {
          deleteMethod(false);
          toastMessage(message: "successful".tr);
          await dbHelper.logOut();
        } else {
          deleteMethod(false);
          toastMessage(message: response.body?['message'].toString()??"something want wrong".tr);
        }
      }else{
        await dbHelper.logOut();
      }
    }catch (err){
      deleteMethod(false);
    }
  }*/
}