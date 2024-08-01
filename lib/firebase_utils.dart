import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_todo_list/model/task.dart';

class FirebaseUtils {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter(
            fromFirestore: ((Snapshot, option) =>
                Task.fromFireStore(Snapshot.data()!)),
            toFirestore: (task, option) => task.toFireStore());
  }

  static Future<void> addTaskToFireStore(Task task) {
    var taskCollectionRef = getTasksCollection(); // collection
    var taskDocRef = taskCollectionRef.doc(); //document
    task.id = taskDocRef.id; //auto id
    return taskDocRef.set(task);
  }
}
