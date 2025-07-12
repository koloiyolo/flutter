List<List> toListOfLists (List list) {
  List<List> dummy =[];
  for(var element in list) {
    dummy.add(element.toList());
  }
  return dummy;
}