abstract class AddPostState {}

class AddPostInitState extends AddPostState {}

class AddPostLoadingState extends AddPostState {}
class NoInternetState extends AddPostState {}
class AddPostSubmittedState extends AddPostState {}

class AddPostLoadedState extends AddPostState {
  String message;

  AddPostLoadedState(this.message);
}

class AddPostInValidState extends AddPostState {
  String invalidMessage;
  AddPostInValidState(this.invalidMessage);
}

class AddPostValidState extends AddPostState {
  AddPostValidState();
}

class AddPostErrorIdState extends AddPostState {
  String error;
  AddPostErrorIdState(this.error);
}

class AddPostErrorTitleState extends AddPostState {
  String error;
  AddPostErrorTitleState(this.error);
}
class AddPostErrorBodyState extends AddPostState {
  String error;
  AddPostErrorBodyState(this.error);
}

class AddPostErrorState extends AddPostState {
  String error;
  AddPostErrorState(this.error);
}
