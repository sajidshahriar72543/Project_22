class PlacePredictions {
  // ignore: non_constant_identifier_names
  String secondary_text, main_text, place_id;

  // ignore: non_constant_identifier_names
  PlacePredictions({this.secondary_text, this.main_text, this.place_id});

  PlacePredictions.fromJson(Map<String, dynamic> json) {
    place_id = json['structured_formatting']['place_id'];
    main_text = json['structured_formatting']['main_text'];
    secondary_text = json['structured_formatting']['secondary_text'];
  }
}
