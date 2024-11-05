class EditNewsAction {
  final int index;
  final String? newDescription;
  EditNewsAction(this.index, this.newDescription);
}

class AddNewsAction {
  final String title;
  final String description;

  AddNewsAction(this.title, this.description);
}
