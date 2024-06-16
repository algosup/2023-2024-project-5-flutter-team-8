import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adopte_1_candidat/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _copyAssetToLocal();
  runApp(const ProviderScope(child: MainApp()));
}

Future<void> _copyAssetToLocal() async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/data.json';
    final file = File(filePath);

    if (!await file.exists()) {
      final data = await rootBundle.loadString('lib/redundancy/data.json');
      await file.writeAsString(data);
    }
  } catch (e) {
    print('Error copying asset to local: $e');
  }
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _router = ref.watch(routeProvider);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
