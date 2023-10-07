abstract class AddPostEvents{}

// class AddPostTextChangeEvent extends AddPostEvents{
//   String id;
//   String title;
//   String body;
//   AddPostTextChangeEvent(this.id, this.title, this.body);
// }
class AddPostTextChangeIdEvent extends AddPostEvents{
  String id;
  AddPostTextChangeIdEvent(this.id);
}
class AddPostTextChangeTitleEvent extends AddPostEvents{
  String title;
  AddPostTextChangeTitleEvent(this.title);
}
class AddPostTextChangeBodyEvent extends AddPostEvents{
  String body;
  AddPostTextChangeBodyEvent(this.body);
}


class AddPostSubmitEvent extends AddPostEvents{
  String id;
  String title;
  String body;
  AddPostSubmitEvent(this.id, this.title, this.body);
}