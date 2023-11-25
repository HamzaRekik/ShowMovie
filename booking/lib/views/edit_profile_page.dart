import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  final Map<String, dynamic> userData;
  const EditProfilePage({Key? key, required this.userData}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController consultationPriceController = TextEditingController();

  File? _pickedImage;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  Future<String> _uploadImage() async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      String milliseconds = DateTime.now().millisecondsSinceEpoch.toString();
      String imagePath = 'image/$milliseconds.png';

      await storage.ref(imagePath).putFile(_pickedImage!);

      String downloadURL = await storage.ref(imagePath).getDownloadURL();
      return downloadURL;
    } catch (error) {
      print('Error uploading image: $error');
      return '';
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  Future<void> saveProfile() async {
    try {
      FirebaseFirestore _firestore = FirebaseFirestore.instance;

      String userId = widget.userData['uid'];
      String userDocumentPath = 'users/$userId';

      if (_pickedImage != null) {
        String imageURL = await _uploadImage();
        widget.userData['image'] = imageURL;
      }

      if (_formKey.currentState!.validate()) {
        Map<String, dynamic> updatedData = {
          'username': nameController.text,
          'image': widget.userData['image'],
        };

        if (nameController.text.isNotEmpty) {
          await _firestore.doc(userDocumentPath).update(updatedData);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Please fill all the fields!',
                style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
              ),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 2),
            ),
          );
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xFF4163CD),
            content: Text(
              'Profile updated successfully!',
              style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
            ),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );

        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, '/profile');
      }
    } catch (error) {
      print('Error updating profile: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userData['username'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Color(0xFF4163CD),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 70,
                    backgroundImage: widget.userData['image'] != null
                        ? NetworkImage(
                            widget.userData['image'],
                          ) as ImageProvider
                        : NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        enabled: isEditing,
                        errorText: _validateName(nameController.text)),
                    validator: _validateName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: isEditing ? _pickImage : null,
                    child: Text('Pick Image'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF4163CD),
                      onPrimary: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEditing = !isEditing;
                        if (!isEditing) {
                          saveProfile();
                        }
                      });
                    },
                    child: Text(isEditing ? 'Save' : 'Edit Profile'),
                    style: ElevatedButton.styleFrom(
                      primary: isEditing ? Colors.green : Color(0xFF4163CD),
                      onPrimary: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
