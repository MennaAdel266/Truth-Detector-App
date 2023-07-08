import 'package:truth_detector_app/Models/add_news_model.dart';

abstract class AddTextStates {}

class AddTextInitialState extends AddTextStates{}

class AddTextLoadingState extends AddTextStates{}

class AddTextSuccessState extends AddTextStates
{
  final AddNewsModel newsModel;

  AddTextSuccessState(this.newsModel);

}

class AddTextErrorState extends AddTextStates
{
  final String error;

  AddTextErrorState(this.error);
}

class GetNewsLoadingState extends AddTextStates{}

class GetNewsSuccessState extends AddTextStates
{}

class GetNewsErrorState extends AddTextStates
{
  final String error;

  GetNewsErrorState(this.error);
}
