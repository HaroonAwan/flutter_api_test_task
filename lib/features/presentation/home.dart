import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task/features/riverpod/person_provider.dart';
import 'package:test_task/shared/loading_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final persons = ref.watch(getPersonsProvider);
    return Scaffold(
      body: switch (persons) {
        AsyncError(:final error) => ErrorWidget(error),
        AsyncData(:final value) => const Text('Data'),
        _ => const LoadingWidget(),
      },
    );
  }
}
