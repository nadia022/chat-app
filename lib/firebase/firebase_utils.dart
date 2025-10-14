import 'package:chat_app/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUtils {
  static CollectionReference<Message> getCollections() {
    return FirebaseFirestore.instance
        .collection(Message.collectionName)
        .withConverter<Message>(
            fromFirestore: (snapshot, options) =>
                Message.fromFirestore(snapshot.data()),
            toFirestore: (message, _) => message.toFirestore());
  }

  static Future<void> addMessage(Message message) {
    return getCollections().add(message);
  }

  static Stream<QuerySnapshot<Message>> getMessage() {
    var querySnapshot = getCollections().snapshots();
    return querySnapshot;
  }
}
