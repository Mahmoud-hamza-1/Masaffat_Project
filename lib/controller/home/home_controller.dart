import 'package:ecommerce_application/data/datasource/remote/home/home_data.dart';
import 'package:ecommerce_application/data/model/home_model.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  Future<List<AdvertModel>?> getAds();
}

class HomeControllerImp extends HomeController {
  List<AdvertModel> ads = const [];
  final homeData = const HomeData();

  @override
  Future<void> onInit() async {
    await getAds();
    super.onInit();
  }

  @override
  Future<List<AdvertModel>?> getAds() async {
    ads = await homeData.getAds() ?? const [];
    print(ads);
    update();
    return ads;
  }
}
