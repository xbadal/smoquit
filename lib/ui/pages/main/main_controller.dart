import 'package:get/get.dart';
import 'package:smoquit/ui/shared/base_controller.dart';

class MainController extends BaseController{
  RxInt pageIndex = 0.obs;

  onPageIndexChanged(int index){
    pageIndex.value = index;
  }



}