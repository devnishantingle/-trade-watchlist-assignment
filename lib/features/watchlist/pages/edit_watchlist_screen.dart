import 'package:assgnment/app/theme/app_colors.dart';
import 'package:assgnment/core/widgets/app_loader.dart';
import 'package:assgnment/features/watchlist/bloc/watchlist_bloc.dart';
import 'package:assgnment/features/watchlist/bloc/watchlist_event.dart';
import 'package:assgnment/features/watchlist/bloc/watchlist_state.dart';
import 'package:assgnment/features/watchlist/widgets/editable_stock_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditWatchlistScreen extends StatelessWidget {
  const EditWatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Back',
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Edit Watchlist 1',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<WatchlistBloc, WatchlistState>(
          builder: (context, state) {
            if (state.isLoading && state.stocks.isEmpty) {
              return const AppLoader();
            }

            return Column(
              children: [
                const _WatchlistNameField(),
                Expanded(
                  child: ReorderableListView.builder(
                    padding: const EdgeInsets.only(top: 8),
                    buildDefaultDragHandles: false,
                    proxyDecorator: (child, index, animation) {
                      return AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          final elevation = Tween<double>(
                            begin: 0,
                            end: 8,
                          ).evaluate(animation);
                          return Material(
                            elevation: elevation,
                            color: Colors.white,
                            shadowColor: Colors.black26,
                            child: child,
                          );
                        },
                        child: child,
                      );
                    },
                    itemCount: state.stocks.length,
                    onReorder: (oldIndex, newIndex) {
                      context.read<WatchlistBloc>().add(
                        ReorderStocks(oldIndex: oldIndex, newIndex: newIndex),
                      );
                    },
                    itemBuilder: (context, index) {
                      return EditableStockTile(
                        key: ValueKey(state.stocks[index].symbol),
                        stock: state.stocks[index],
                        index: index,
                        onDelete: () {
                          context.read<WatchlistBloc>().add(DeleteStock(index));
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.text,
                            side: const BorderSide(color: AppColors.border),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {},
                          child: const Text('Edit other watchlists'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.text,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            context.read<WatchlistBloc>().add(
                              const SaveWatchlist(),
                            );
                            context.pop();
                          },
                          child: const Text('Save Watchlist'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _WatchlistNameField extends StatelessWidget {
  const _WatchlistNameField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          children: [
            Expanded(
              child: Text(
                'Watchlist 1',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(Icons.edit_outlined, color: AppColors.mutedText, size: 20),
          ],
        ),
      ),
    );
  }
}
