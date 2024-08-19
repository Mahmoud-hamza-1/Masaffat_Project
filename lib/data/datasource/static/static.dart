import 'package:ecommerce_application/core/constant/imageconstant.dart';
import 'package:ecommerce_application/data/model/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: 'Park your car',
      body:
          'Park your car in the nearest place to your \n work and leave it in safe hands ',
      image: AppImageAsset.onBoardingImageOne),
  OnBoardingModel(
      title: 'Book parking for your car  ',
      body:
          'Book parking for your car while you are sitting at home \n and we will provide you with services ',
      image: AppImageAsset.onBoardingImageTwo),
  OnBoardingModel(
      title: 'Explore our parking lots',
      body:
          'Explore our parking lots with map navigation \nservices and find the nearest parking',
      image: AppImageAsset.onBoardingImageThree),
];
