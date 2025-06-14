import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesstt_task/features/home/presentation/bloc/collection_bloc.dart';
import 'package:tesstt_task/features/home/presentation/widgets/collection_widget.dart';

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<CollectionBloc>().add(GetCollectionsEvent());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: BlocBuilder<CollectionBloc, CollectionState>(
            builder: (context, state) {
          if (state is LoadingCollectionState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CollectionLoadedState) {
            return GridView.builder(
              itemCount: state.bottles.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return CollectionItemCard(
                  bottle: state.bottles[index],
                );
              },
            );
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }
}
