import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truth_detector_app/Models/user_model.dart';
import 'package:truth_detector_app/Modules/Signup_Screen/Cubit/states.dart';


class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(SignupInitialState());

  static SignupCubit get(context) => BlocProvider.of(context);

  void userSignup({
    @required String name,
    @required String email,
    @required String phone,
    @required String password,
  }) {
    emit(SignupLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email.toString(),
      password: password.toString(),
    )
        .then((value) {
      print(value.user.email);
      print(value.user.uid);
      userCreate(
        uId: value.user.uid,
        phone: phone,
        name: name,
        email: email,
      );
    }).catchError((error) {
      print(error);
      emit(SignupErrorState(error.toString()));
    });
  }

  void userCreate({
    @required String name,
    @required String email,
    @required String phone,
    @required String uId,
    @required String galleryImage,
  }) {
    UserModel model = UserModel(
      email: email,
      name: name,
      phone: phone,
      uId: uId,
      galleryImage: galleryImage,
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value)
    {
      emit(CreateUserSuccessState());
    }).catchError((error)
    {
      print(error);
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined :Icons.visibility_off_outlined ;

    emit(SignupChangePasswordState());
  }

}