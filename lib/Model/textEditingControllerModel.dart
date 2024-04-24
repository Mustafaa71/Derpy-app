import 'package:flutter/material.dart';

class TextEditingControllerModel {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController locationController;

  TextEditingControllerModel({
    required this.titleController,
    required this.descriptionController,
    required this.locationController,
  });
}
