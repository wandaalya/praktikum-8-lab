import 'package:flutter/material.dart';
import 'package:pertemuan8/models/TemaProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(create: (context) => TemaProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TemaProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          // Material 3 itu merupakan material yang digunakan oleh flutter
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: value.TemaMode,
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final temaProvider = Provider.of<TemaProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Pengaturan Tema")),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Mode Gelap"),
            Switch(
              value: temaProvider.ModeGelap,
              onChanged: (value) {
                temaProvider.gantitema(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
