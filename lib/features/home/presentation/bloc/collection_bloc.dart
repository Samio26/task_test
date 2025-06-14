import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tesstt_task/features/home/domain/entities/bottle.dart';
import 'package:tesstt_task/features/home/domain/usecases/get_collection_usecase.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
    final GetCollectionsUsecase getCollectionsUsecase;

  CollectionBloc( {required this.getCollectionsUsecase}) : super(CollectionInitial()) {
  on<GetCollectionsEvent>(_getCollections);
  }


  void _getCollections(
    GetCollectionsEvent event,
    Emitter<CollectionState> emit
  )async{
    emit(LoadingCollectionState());

    final result=await getCollectionsUsecase();

    result.when(
      success: (bottles)=>emit(CollectionLoadedState(bottles: bottles)), 
      failure: (error)=>emit(ErrorCollectionState()));

  }
}
