import 'package:bloc/bloc.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {

  final client = HnpwaClient();


  // NewsBloc( ) : super(NewsState(loading: true, news: []));
  // NewsState get initialState => NewsState.initialState();

  // Nueva forma 
  NewsBloc() : super(NewsState.initialState()) {
    add(LoadEvent());
  }
  
  

  @override
  Stream<NewsState> mapEventToState(NewsEvents event) async* {
    if(event is LoadEvent){
      print('load');
      yield this.state.copyWith(loading:true);
      final feed = await client.news();
      // await Future.delayed(Duration(seconds: 2));
      print('loading - false');
      // Forma óptima de modificar el estado del bloc
      // utilizamos el estado actual, y en base al estado actual obtenemos una copia del estado pero con ciertas modificación y esta copia se convertirá en el nuevo estado del bloc
      yield this.state.copyWith(loading:false, news: feed.items);
      // yield NewsState(loading: false, news: []);
    }else if(event is DeleteEvent){
      print("delete ${event.position}");
      final newList = List<FeedItem>.from(this.state.news);
      newList.removeAt(event.position);
      yield this.state.copyWith(news: newList);
    }
  }

}