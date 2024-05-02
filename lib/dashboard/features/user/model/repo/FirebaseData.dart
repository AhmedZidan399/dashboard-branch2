import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard2/dashboard/features/user/model/UserModel.dart';
import 'package:dashboard2/dashboard/features/user/model/repo/SuperClass.dart';

class FirebaseData extends SuperClass {
  static FirebaseData? _firebaseObject;

  FirebaseData._init();
  static FirebaseData get instance {
    _firebaseObject ??= FirebaseData._init();

    return _firebaseObject!;
  }

  Future<List<UserModel>> fetch() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((QuerySnapshot querysnapshot) {
      return querysnapshot.docs
          .map((e) => UserModel.fromMap({

                'name': (e.data() as Map).containsKey('name')?e['name']:"xxxxxx",
                'age': (e.data() as Map).containsKey('age')?e['age']:"xxxxxx",
                'grade': (e.data() as Map).containsKey('grade')?e['grade']:"xxxxxx",
                'id': e.reference.id,
              }))
          .toList();
    });
  }

  @override
  Future<void> deleteData({required int id}) async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.doc(id.toString()).delete();
    throw UnimplementedError();
  }

  @override
  Future<void> insertData(
      {required int id,
      required String name,
      required String grade,
      required int age}) async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users
        .add({
          'name': name,
          'age': age,
          'grade': grade,
        })
        .then((value) => print('new user added'))
        .catchError((error) => print("failed to add new user:$error"));

    throw UnimplementedError();
  }
}
