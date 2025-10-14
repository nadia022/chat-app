class Message {
  static const String collectionName = "messages";
  String message;
  String email;
  Message({required this.message, required this.email});

  // json => object

  Message.fromFirestore(Map<String, dynamic>? data)
      : this(
          email: data!['email'],
          message: data['message'],
        );

  //object => json

  Map<String, dynamic> toFirestore() {
    return {'message': message, 'email': email};
  }
}
