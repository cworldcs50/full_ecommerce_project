import 'dart:io';
import 'dart:developer';

Future<bool> checkInternetConnection() async {
  try {
    List<InternetAddress> result = await InternetAddress.lookup("google.com");

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (e) {
    log("false: ${e.message}");
    return false;
  } catch (e) {
    log("false: ${e.toString()}");
    return false;
  }
}
