import 'dart:io';
import 'package:booking/models/movie.dart';
import 'package:booking/services/films_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddFilmPage extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  const AddFilmPage(
      {super.key, required this.toggleTheme, required this.isDarkMode});
  @override
  _AddFilmPageState createState() => _AddFilmPageState();
}

class _AddFilmPageState extends State<AddFilmPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _rateController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  XFile? _pickedImage; // Store the picked image file
  String _imageController = ''; // Controller to manage the image URL
  final _clService = FilmService();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _rateController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _pickedImage = pickedImage;
      _imageController = pickedImage?.path ??
          ''; // Update the image controller with the picked image path
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Film'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _rateController,
              decoration: InputDecoration(labelText: 'Rate'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 16.0),
            if (_pickedImage != null) Image.file(File(_pickedImage!.path)),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Récupérer les valeurs des contrôleurs
                String title = _titleController.text;
                String description = _descriptionController.text;
                double rate = double.tryParse(_rateController.text) ?? 0.0;
                String date = _dateController.text;

                if (title.isNotEmpty &&
                    description.isNotEmpty &&
                    rate > 0 &&
                    date.isNotEmpty &&
                    _pickedImage!.path.isNotEmpty) {
                  // Créer une nouvelle instance de la classe Classes
                  Movie nouvelleClasse = Movie(
                    image: _pickedImage!.path,
                    title: title,
                    description: description,
                    rate: rate,
                    date: date,
                  );

                  // Appeler la méthode pour ajouter la classe (par exemple, depuis le service de gestion de la base de données)
                  _clService.ajouterClasse(nouvelleClasse).then((success) {
                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Color(0xFF4163CD),
                          content: Text(
                            'Movie added successfully',
                            style: TextStyle(
                                fontFamily: 'Poppins', color: Colors.white),
                          ),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 2),
                        ),
                      );

                      Navigator.pushReplacementNamed(context, '/');
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Erreur'),
                            content: const Text('erreur de lajout cette film.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  });

                  // Vous devez appeler votre méthode de service (ci-dessus) pour ajouter la classe
                  // Actuellement, le code est commenté car il suppose que vous avez une méthode 'ajouterClasse' dans votre service.
                } else {
                  // Afficher un message d'erreur ou empêcher l'ajout si les champs sont vides ou incorrects
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Erreur'),
                        content: const Text(
                            'Veuillez remplir tous les champs correctement.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Add Film'),
            ),
          ],
        ),
      ),
    );
  }
}
