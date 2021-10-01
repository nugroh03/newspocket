import 'package:final_project_newspocket/models/news_model.dart';
import 'package:flutter/cupertino.dart';

class BookmarkProvider with ChangeNotifier {
  List<NewsModel?> _bookmark = [];

  List<NewsModel?> get bookmark => _bookmark;

  set bookmark(List<NewsModel?> bookmark) {
    _bookmark = bookmark;
    notifyListeners();
  }

  setBookmark(NewsModel? bookmark) {
    if (!isBookmark(bookmark!)) {
      _bookmark.add(bookmark);
      notifyListeners();
    } else {
      _bookmark.removeWhere(
          (element) => element!.publishedAt == bookmark.publishedAt);
      notifyListeners();
    }
  }

  isBookmark(NewsModel? bookmark) {
    if (_bookmark.indexWhere(
            (element) => element!.publishedAt == bookmark!.publishedAt) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
