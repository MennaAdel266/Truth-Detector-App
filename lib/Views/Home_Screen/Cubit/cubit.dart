import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truth_detector_app/Control/end_points.dart';
import 'package:truth_detector_app/Models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:truth_detector_app/Views/Home_Screen/Cubit/states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  UserModel userModel;

  void getUserData() {
    emit(LayoutLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel = UserModel.fromJson(value.data());
      emit(LayoutGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutGetUserErrorState(error.toString()));
    });
  }

  File galleryImage;
  var picker = ImagePicker();
  Future<void> getGalleryImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      galleryImage = File(pickedFile.path);
      emit(LayoutGetGalleryImageSuccessState());
    } else {
      print('No Image Selected!');
      emit(LayoutGetGalleryImageErrorState());
    }
  }


  String profileImageUrl = '';
  void uploadProfileImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(galleryImage.path).pathSegments.last}')
        .putFile(galleryImage)
        .then((value)
    {
      value.ref.getDownloadURL().then((value)
      {
        print(value);
        profileImageUrl = value;
      }).catchError((error){
        print(error);
      });
    })
        .catchError((error)
    {
      print(error);
    });
  }

  void updateUserImages({
  @required String name,
  @required String phone,
  @required String address,
  @required String comment,
  @required String message,
})
  {
    if(galleryImage !=null){
      uploadProfileImage();
    }else{
      updateUserData(
        address: address,
        name: name,
        phone: phone,
        comment: comment,
        message: message,
      );
    }
  }

  void updateUserData(
      {
        @required String name,
        @required String phone,
        @required String address,
        @required String comment,
        @required String message,
      })
  {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      address: address,
      email: userModel.email,
      comment: comment,
      message: message,
      galleryImage: userModel.galleryImage,
      uId: userModel.uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value)
    {
      print(userModel.name);
      saveName = userModel.name;
      getUserData();
      emit(LayoutUpdateUserDataSuccessState());
    })
        .catchError((error)
    {
      print(error);
      emit(LayoutUpdateUserDataErrorState());
    });
  }

  void updateUserName(
      {
        @required String name,
      })
  {
    UserModel model = UserModel(
      name: name,
      phone: userModel.phone,
      address: userModel.address,
      email: userModel.email,
      comment: userModel.comment,
      message: userModel.message,
      galleryImage: userModel.galleryImage,
      uId: userModel.uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value)
    {
      print(userModel.name);
      saveName = userModel.name;
      getUserData();
      emit(LayoutUpdateUserDataSuccessState());
    })
        .catchError((error)
    {
      print(error);
      emit(LayoutUpdateUserDataErrorState());
    });
  }


  void uploadUserMessage(
      {
        @required String name,
        @required String email,
        @required String phone,
        @required String message,
      })
  {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      email: email,
      message: message,
      address: userModel.address,
      comment: userModel.comment,
      galleryImage: userModel.galleryImage,
      uId: userModel.uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value)
    {
      print(userModel.name);
      getUserData();
      emit(LayoutUpdateUserDataSuccessState());
    })
        .catchError((error)
    {
      print(error);
      emit(LayoutUpdateUserDataErrorState());
    });
  }

  void uploadUserComment(
      {
        @required String comment,
      })
  {
    UserModel model = UserModel(
      comment: comment,
      name: userModel.name,
      phone: userModel.phone,
      email: userModel.email,
      message: userModel.message,
      address: userModel.address,
      galleryImage: userModel.galleryImage,
      uId: userModel.uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value)
    {
      print(userModel.name);
      getUserData();
      emit(LayoutUpdateUserDataSuccessState());
    })
        .catchError((error)
    {
      print(error);
      emit(LayoutUpdateUserDataErrorState());
    });
  }

}
