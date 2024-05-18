import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_app/dummy_quote/model/dummy_model.dart';
import 'package:quote_app/dummy_quote/product/color/project_color.dart';
import 'package:quote_app/dummy_quote/product/service/project_dio.dart';
import 'package:quote_app/dummy_quote/service/dummy_service.dart';
import 'package:quote_app/dummy_quote/view_model/dummy_provider/dummy_provider.dart';

class DummyView extends StatefulWidget {
  const DummyView({super.key});

  @override
  State<DummyView> createState() => _DummyViewState();
}

class _DummyViewState extends State<DummyView> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DummyProvider>(
      create: (context) => DummyProvider(DummyService(service)),
      builder: (context, child) {
        return Scaffold(
          body: Selector<DummyProvider, bool>(
            builder: (context, value, child) {
              return value ? const Placeholder() : _listView(context);
            },
            selector: (p0, p1) => p1.isBool,
          ),
        );
      },
    );
  }

  ListView _listView(BuildContext context) {
    return ListView.builder(
        itemCount: context.watch<DummyProvider>().item.length,
        itemBuilder: (context, index) {
          return _CardDessign(model: context.watch<DummyProvider>().item[index]);
        });
  }
}

class _CardDessign extends StatelessWidget {
  const _CardDessign({
    super.key,
    required Quotes? model,
  }) : _model = model;

  final Quotes? _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _WidgetSizeAndPadding.normalPadding,
      child: Card(
        elevation: _WidgetSizeAndPadding().elevationSize,
        surfaceTintColor: ProjectColor.tealColor,
        child: ListTile(
          title: Text(_model?.quote ?? ''),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(_model?.author ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}

class _WidgetSizeAndPadding {
  static const normalPadding = EdgeInsets.all(8.0);
  final double elevationSize = 25;
}
