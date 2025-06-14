part of 'collection_bloc.dart';

sealed class CollectionState extends Equatable {
  const CollectionState();
  
  @override
  List<Object> get props => [];
}

final class CollectionInitial extends CollectionState {}

class LoadingCollectionState extends CollectionState {}

class CollectionLoadedState extends CollectionState {
  final List<Bottle> bottles;

  CollectionLoadedState({required this.bottles});

  @override
  List<Object> get props => [bottles];
}

class ErrorCollectionState extends CollectionState {


}