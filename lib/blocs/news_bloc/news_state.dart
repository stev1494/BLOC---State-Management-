import 'package:equatable/equatable.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:meta/meta.dart';

class NewsState extends Equatable {
  final bool loading;
  final List<FeedItem> news;

  NewsState({@required this.loading, this.news});

  static NewsState initialState() => NewsState(loading: false, news: []);

  NewsState copyWith({
    bool loading,
    List<FeedItem> news
  }) {
    return NewsState(loading: loading ?? this.loading, news: news ?? this.news);
  }

  // bool operator ==(o) {
  //   return o is NewsState &&
  //    o.loading == loading &&
  //    o.news.length == news.length;
  // }

  // int get hashCode => loading.hashCode^news.hashCode;

  // usando paquete equatable
  @override
  List<Object> get props => [loading, news];
}