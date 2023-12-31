import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Modal/contect_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];
  int cIndex = 0;
  int rindex=0;
  ImagePicker picker = ImagePicker();
  XFile? xFile;

  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> fk = GlobalKey<FormState>();
  bool isEdit = false;

  //Functios
  void addcontact() {
    contactList.add(ContactModel(
        email: emailController.text,
        name: nameController.text,
        number: contactController.text,
        xFile: xFile));
    emailController.clear();
    nameController.clear();
    contactController.clear();
    xFile=null;
    cIndex=0;
    notifyListeners();
  }

  void stepperContinue() {
    isEdit = true;
    if (cIndex < 3) {
      cIndex++;
    }
    notifyListeners();
  }

  void stepperCancel() {
    if (cIndex > 0) {
      cIndex--;
    }
    notifyListeners();
  }

  void stepperTapped() {
    notifyListeners();
  }

  void stepperCamera() {
    picker.pickImage(source: ImageSource.camera).then((value) {
      xFile = value;
      notifyListeners();
    });
  }

  void stepperGallery() {
    picker.pickImage(source: ImageSource.gallery).then((value) {
      xFile = value;
      notifyListeners();
    });
  }

  void deleteContact()
  {
    contactList.removeAt(rindex);
    notifyListeners();
  }

}