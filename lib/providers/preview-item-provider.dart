import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:mobile_app_flutter/models/preview-item.dart';

class PreviewItemProvider extends ChangeNotifier {
  final List<PreviewItem> _likedItems = [];
  final List<PreviewItem> _dislikedItems = [];

  UnmodifiableListView<PreviewItem> get likedItems => UnmodifiableListView(_likedItems);
  UnmodifiableListView<PreviewItem> get dislikedItems => UnmodifiableListView(_dislikedItems);

  int get totalLikes => _likedItems.length;
  int get totalLDislikes => _dislikedItems.length;

  void dislike(PreviewItem item) {
    _dislikedItems.add(item);
    notifyListeners();
  }

  void like(PreviewItem item) {
    _likedItems.add(item);
    notifyListeners();
  }
}