import 'package:image_picker/image_picker.dart';

class Methods {
  final ImagePicker _picker1 = ImagePicker();

  Future<XFile?> pickImage() async {
    XFile? image = await _picker1.pickImage(source: ImageSource.camera);
    return image;
  }
}
