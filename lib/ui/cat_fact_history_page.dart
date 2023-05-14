import 'package:cats_facts/blocs/fact_history/fact_history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CatFactHistoryPage extends StatelessWidget {
  const CatFactHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FactHistoryBloc>(
      create: (context) => FactHistoryBloc(),
      child: const CatFactHistoryView(),
    );
  }
}

class CatFactHistoryView extends StatelessWidget {
  const CatFactHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Cat Facts History')),
        body: BlocBuilder<FactHistoryBloc, FactHistoryState>(
            bloc: FactHistoryBloc()..add(const FetchFactHistoryEvent()),
            builder: (context, state) {
              switch (state.status) {
                case FactHistoryStatus.initial:
                  return const Center(
                    child: Text('Press the button to get a cat fact!'),
                  );
                case FactHistoryStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case FactHistoryStatus.failure:
                  return const Center(
                    child: Text('Something went wrong!'),
                  );
                case FactHistoryStatus.success:
                  final listLength = state.factHistory.length;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final factHistory = state.factHistory[index];
                      return Card(
                        elevation: 0,
                        child: ListTile(
                          title: Text(
                            factHistory.description,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            '${DateFormat.yMMMMd(locale.toString()).format(factHistory.createdAt)} '
                            '${DateFormat.Hm(locale.toString()).format(factHistory.createdAt)}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: listLength,
                  );
              }
            }));
  }
}
