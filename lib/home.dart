import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class YourApp extends StatefulWidget {
  const YourApp({super.key});

  @override
  State<YourApp> createState() => _YourAppState();
}

class _YourAppState extends State<YourApp> {
  TextEditingController titleController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  XFile? imageFile;
  ImagePicker picker = ImagePicker();
  FirebaseFirestore instance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Enter the title",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: quantityController,
                decoration: const InputDecoration(
                  hintText: "Enter the quantity",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  20,
                )),
                minWidth: size.width,
                height: size.height * 0.07,
                onPressed: () async {
                  imageFile =
                      await picker.pickImage(source: ImageSource.camera);
                  setState(() {});
                  if (imageFile == null) {
                    print("Null");
                  } else {
                    instance.collection("data").doc("doc").set({"name": "Kul"});
                  }
                },
                child: const Icon(
                  Icons.image,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  20,
                )),
                minWidth: size.width,
                height: size.height * 0.07,
                onPressed: () {
                  print("Button pressed");
                  instance.collection("data").doc().set({
                    "name": "kul",
                    "age": 233,
                  }).then((value) {
                    print('Done with uploading data');
                  }).onError((error, stackTrace) {
                    print("An error occured");
                  });
                },
                child: const Icon(
                  Icons.upload,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
