// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../model/favorite_model.dart';
// import '../services/firebase_service.dart';
//
// class FavoriteRepository{
//   CollectionReference<FavoriteModel> favoriteRef = FirebaseService.db.collection("favorites")
//       .withConverter<FavoriteModel>(
//     fromFirestore: (snapshot, _) {
//       return FavoriteModel.fromFirebaseSnapshot(snapshot);
//     },
//     toFirestore: (model, _) => model.toJson(),
//   );
//
//   get name => null;
//
//   Future<List<QueryDocumentSnapshot<FavoriteModel>>> getFavorites(String productId, String userId) async {
//     try {
//       var data = await favoriteRef.where("user_id", isEqualTo: userId).where("name", isEqualTo: name).get();
//       var favorites = data.docs;
//       return favorites;
//     } catch (err) {
//       print(err);
//       rethrow;
//     }
//   }
//
//   Future<List<QueryDocumentSnapshot<FavoriteModel>>> getFavoritesUser(String userId) async {
//     try {
//       var data = await favoriteRef.where("user_id", isEqualTo: userId).get();
//       var favorites = data.docs;
//       return favorites;
//     } catch (err) {
//       print(err);
//       rethrow;
//     }
//   }
//
//   Future<bool> favorite(FavoriteModel? isFavorite, String productId, String userId)  async{
//     try {
//       if(isFavorite==null){
//         await favoriteRef.add(FavoriteModel(userId: userId, name: name));
//       }else{
//         await favoriteRef.doc(isFavorite.id).delete();
//       }
//       return true;
//     } catch (err) {
//       rethrow;
//     }
//   }
//
// }