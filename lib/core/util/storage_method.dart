import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethos{
  final FirebaseStorage _storage=FirebaseStorage.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;

  Future<String> uplodImageStorage(Uint8List file) async{
    Reference ref= _storage.ref().child("userImages").child(const Uuid().v1()); 
    UploadTask uploadTask= ref.putData(file);
    TaskSnapshot snap=await uploadTask;
    String downloadUrl=await snap.ref.getDownloadURL();
    return downloadUrl;
  }

}