import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({super.key, required String title});

  @override
  State<FutureBuilderPage> createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  Future<List<String>> fetchData() async{
    await Future.delayed(const Duration(seconds: 2));
    return['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5', 'Item 6', 'Item 7', 'Item 8', 'Item 9', 'Item 10'];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Builder Example'),
      ),
      body: FutureBuilder(
        future: fetchData(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData){
            final items = snapshot.data!;
            if (items.isNotEmpty){
              return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              }
            );
            } else {
              return const Center(
              child: Text('No Data Available'),
            );
            }
            
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        }
      ),
    );
  }
}