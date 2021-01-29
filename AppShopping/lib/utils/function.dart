import 'package:AppShopping/core/core_service.dart';

String getLinkImageOnline(String linkImage){
  return linkImage.contains(CoreUrlImage)? linkImage : CoreUrlImage + linkImage;
}

