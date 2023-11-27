import 'package:flutter/material.dart';
import 'package:booking/models/movie.dart';
import 'package:booking/services/films_services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditPostPage extends StatefulWidget {
  final Movie movie;

  EditPostPage({required this.movie});

  @override
  _EditPostPageState createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _rateController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  final _clService = FilmService();
  XFile? _pickedImage; // Store the picked image file

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current movie details
    _titleController.text = widget.movie.title;
    _descriptionController.text = widget.movie.description;
    _rateController.text = widget.movie.rate.toString();
    _dateController.text = widget.movie.date;
    _pickedImage =
        widget.movie.image.isNotEmpty ? XFile(widget.movie.image) : null;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _rateController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _pickedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Film'),
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
                // Update movie details with new values
                widget.movie.title = _titleController.text;
                widget.movie.description = _descriptionController.text;
                widget.movie.rate =
                    double.tryParse(_rateController.text) ?? 0.0;
                widget.movie.date = _dateController.text;
                if (_pickedImage != null) {
                  widget.movie.image = _pickedImage!.path;
                }

                // Update movie in your service or database
                _clService.modifierClasse(widget.movie).then((success) {
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Color(0xFF4163CD),
                          content: Text(
                            'Movie updated successfully',
                            style: TextStyle(
                                fontFamily: 'Poppins', color: Colors.white),
                          ),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 2),
                        ),
                      );
               
                    Navigator.pushReplacementNamed(
                        context, '/'); // Return to previous page
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Failed to update the movie.'),
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
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
