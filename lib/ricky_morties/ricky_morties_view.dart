import 'package:flutter/material.dart';
import 'ricky_morties_view_model.dart';

class RickyMortiesView extends RickyMortiesViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child:const Icon(Icons.replay_outlined),onPressed: () {
        fetchAllData();
      }),
      appBar: AppBar(title: Text('Flutter - Dio - Api'),),
      body: ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
            backgroundImage:NetworkImage(models[index].image ?? ''),            ),
            title: Text(models[index].name ?? ''),
            subtitle: Text(models[index].status ?? ''),
          );
        },
      ),
    );
  }
}
