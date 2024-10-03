import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();

  Future<String> pickImage(ImageSource source) async {
    final XFile? image = await imagePicker.pickImage(source: source);

    if (image != null) {
      // print(image.path);
      return image.path;
    } else {
      // print("no image found");
      return "";
    }
  }
}
