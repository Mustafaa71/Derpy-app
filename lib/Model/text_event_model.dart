import 'package:flutter/material.dart';

class TextEventModel {
  final TextEditingController titile;
  final TextEditingController note;
  final TextEditingController location;
  final TextEditingController category;
  final TextEditingController numberOfMembers;
  final TextEditingController totalPrice;

  TextEventModel({
    required this.titile,
    required this.note,
    required this.location,
    required this.category,
    required this.numberOfMembers,
    required this.totalPrice,
  });
}
