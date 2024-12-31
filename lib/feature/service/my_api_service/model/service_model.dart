/// ServiceModel is a mixin class that is used to convert
/// the model to json and get the key of the model.
mixin ServiceModel {
  String get key;
  Map<String, dynamic> toJson();
}
