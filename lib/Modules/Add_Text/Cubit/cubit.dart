import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truth_detector_app/Models/add_news_model.dart';
import 'package:truth_detector_app/Modules/Add_Text/Cubit/states.dart';
import 'package:truth_detector_app/Shared/Network/remote/dio_helper.dart';
import 'package:truth_detector_app/Shared/end_points.dart';


class AddTextCubit extends Cubit<AddTextStates> {
  AddTextCubit() : super(AddTextInitialState());

  static AddTextCubit get(context) => BlocProvider.of(context);

  AddNewsModel newsModel;

  void addNews({
    @required String text,
    String link,
  })
  {
    emit(AddTextLoadingState());
    DioHelper.postData(
      url: 'http://172.20.10.5:5000/predict',
      data:{
        'text':text,
        'link':link,
      },
    ).then((value) {
      print(value.data);
      newsModel = AddNewsModel.fromJson(value.data);
      print(newsModel.review);
      print(newsModel.label);
       saveReview = newsModel.review;
       saveLabel = newsModel.label;
      emit(AddTextSuccessState(newsModel));
    }).catchError((error){
      print(error.toString());
      emit(AddTextErrorState(error.toString()));
    });
  }


}