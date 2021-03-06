import 'package:auto_size_text/auto_size_text.dart';
import 'package:broken_plural_ar/core/models/WordModel.dart';
import 'package:broken_plural_ar/core/provider/SearchPageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:broken_plural_ar/core/data/RouteName.dart' as routes;

class WordCard extends StatelessWidget {
  const WordCard({@required this.wordModel});
  final WordModel wordModel;

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<SearchPageProvider>(context);

    return Card(
      child: InkWell(
        onTap: () {
          _provider.navigateTo(routes.WordDetailPage, argument: wordModel);
        },
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      textArea('vocalized', wordModel.vocalized),
                      textArea('unvocalized', wordModel.unvocalized),
                      textArea('wordtype', wordModel.wordtype),
                      textArea('root', wordModel.root),
                    ],
                  ),
                  Column(
                    children: [
                      textArea('wazn', wordModel.wazn),
                      textArea('category', wordModel.category),
                      textArea('gender', wordModel.gender),
                      textArea('broken_plural', wordModel.brokenPlural),
                    ],
                  ),
                ],
              ),
              Container(
                child: Text("click to load more"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container textArea(String title, String data) {
    if (data == null) {
      data = ' ';
    }
    return Container(
      child: Row(
        children: [
          Container(
            width: 50,
            height: 20,
            child: AutoSizeText(title),
          ),
          Container(
            width: 50,
            height: 20,
            child: AutoSizeText(data),
          ),
        ],
      ),
    );
  }
}
