import 'package:mobile_app_flutter/models/preview-item.dart';

abstract class PlaylistEvent {
  PreviewItem value;
  
  PlaylistEvent(this.value);
}

class AddEvent extends PlaylistEvent {
  AddEvent(PreviewItem value) : super(value);
}

class RemoveEvent extends PlaylistEvent {
  RemoveEvent(PreviewItem value) : super(value);
}