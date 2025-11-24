import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkChecker {

  Future<bool> hasConnection() async{
    try{
      return await InternetConnection().hasInternetAccess;
    }catch(_){
      return false;
    }
  }
}
