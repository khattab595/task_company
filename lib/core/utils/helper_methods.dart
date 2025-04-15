import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
 import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

 import '../../src/product/data/models/product_dto.dart';
import '../../src/main_index.dart';

class HelperMethods {



static Future<void> addProductToList(ProductDto product) async {
  final box = Hive.box<List>('productsList');
  List<ProductDto> currentList = box.get('products', defaultValue: [])!.cast<ProductDto>();

  currentList.add(product);
  await box.put('products', currentList);
}

static  List<ProductDto> getProductList() {
    final box = Hive.box<List>('productsList');
    return box.get('products', defaultValue: [])!.cast<ProductDto>();
  }

  static Future<void> removeProductFromList(int productId) async {
    final box = Hive.box<List>('productsList');
    List<ProductDto> currentList = box.get('products', defaultValue: [])!.cast<ProductDto>();

    currentList.removeWhere((item) => item.id == productId);
    await box.put('products', currentList);
  }


  static Future<File> getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    return File(pickedFile!.path);
  }

  static showErrorToast(String msg,
      {Color? color, ToastGravity? gravity}) async {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity ?? ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showSuccessToast(String msg,
      {Color? color, ToastGravity? gravity}) async {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity ?? ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future<void> launchCallPhone(String phoneNumber) async {
    Uri telephoneUrl = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(telephoneUrl)) {
      await launchUrl(telephoneUrl);
    } else {
      showErrorToast('حدث خطأ أثناء الاتصال بالرقم');
    }
  }







  static String formatDate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final String formatter = DateFormat('yyyy-MM-dd').format(dateTime);
    return formatter;
  }

  static setLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', language);
  }

  static Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('language') ?? Platform.localeName;
  }


static Future<void> saveToken(String token) async {
  final box = Hive.box('auth');
  await box.put('token', token);
}
  static String? getToken() {
    final box = Hive.box('auth');
    return box.get('token');
  }














  static Future<bool> isFirstTime() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
      print('isFirstTime $isFirstTime');
      return isFirstTime;
    } on Exception catch (e) {
      print('e $e');
      return false;
    }
  }

  static Future<void> setFirstTime() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isFirstTime', false);
    } on Exception catch (e) {
      print('e $e');
    }
  }


}
