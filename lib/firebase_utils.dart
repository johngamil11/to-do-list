import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUtils {
  static void addTaskToFireStore() {
    FirebaseFirestore.instance.collection('tasks');
  }
}
