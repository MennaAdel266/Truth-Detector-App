abstract class LayoutStates{}

class LayoutInitialState extends LayoutStates{}

class LayoutLoadingState extends LayoutStates{}

class LayoutGetUserSuccessState extends LayoutStates{}

class LayoutGetUserErrorState extends LayoutStates
{
  final String error;

  LayoutGetUserErrorState(this.error);
}

class LayoutGetGalleryImageSuccessState extends LayoutStates{}

class LayoutGetGalleryImageErrorState extends LayoutStates{}

class LayoutUpdateUserDataSuccessState extends LayoutStates{}

class LayoutUpdateUserDataErrorState extends LayoutStates{}