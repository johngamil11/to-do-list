import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_todo_list/model/task.dart';

class FirebaseUtils {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(
            fromFirestore: ((snapshot, option) =>
                Task.fromFireStore(snapshot.data()!)),
            toFirestore: (tasks, option) => tasks.toFireStore());
  }

  static Future<void> addTaskToFireStore(Task task) {
    var taskCollectionRef = getTasksCollection(); // collection
    DocumentReference<Task> taskDocRef = taskCollectionRef.doc(); //document
    task.id = taskDocRef.id; //auto id
    return taskDocRef.set(task);
  }
}
