import 'package:cats_facts/blocs/cat_info/cat_info_bloc.dart';
import 'package:cats_facts/repositories/cat_repository.dart';
import 'package:cats_facts/ui/cat_fact_history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CatInfoPage extends StatelessWidget {
  const CatInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatInfoBloc>(
      create: (context) =>
          CatInfoBloc(catRepository: context.read<CatRepository>())
            ..add(FetchCatInfoEvent()),
      child: const CatInfoView(),
    );
  }
}

class CatInfoView extends StatelessWidget {
  const CatInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cat Facts')),
      body: BlocBuilder<CatInfoBloc, CatInfoState>(
        builder: (context, state) {
          switch (state.status) {
            case CatInfoStatus.initial:
              return const Center(
                  child: Text('Press the button to get a cat fact!'));
            case CatInfoStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case CatInfoStatus.failure:
              return const Center(child: Text('Something went wrong!'));
            case CatInfoStatus.success:
              return Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                            margin: const EdgeInsets.all(16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16)),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(26)),
                              child: Image.network(
                                '${state.catInfo.imageUrl!}?t=${DateTime.now().millisecond}',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Center(
                                        child: Text(
                                            'Something went wrong while loading the image!')),
                              ),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                state.catInfo.description,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            Text(
                                '${DateFormat.yMMMMd(locale.toString()).format(DateTime.now())} '
                                '${DateFormat.Hm(locale.toString()).format(DateTime.now())}')
                          ],
                        ),
                      ),
                    ]),
              );
          }
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
                onPressed: () {
                  BlocProvider.of<CatInfoBloc>(context)
                      .add(FetchCatInfoEvent());
                },
                child: const Text('Another fact!')),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CatFactHistoryPage()));
                },
                child: const Text('Fact history'))
          ],
        ),
      ),
    );
  }
}
