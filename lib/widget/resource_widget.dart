import 'package:api_bloc_flutter/Model/resource_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/api_bloc.dart';
import '../bloc/api_event.dart';
import '../bloc/api_state.dart';

class ResourceWidget extends StatelessWidget {
  const ResourceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors Information'),
      ),
      body: BlocProvider<ApiBloc>(
        create: (context) => ApiBloc()..add(ResourceEvent()),
        child: BlocBuilder<ApiBloc, ApiState>(builder: ((context, state) {
          if (state is ErrorState) {
            return Text(state.message);
          } else if (state is ResourcesLoadedState) {
            return buildResourceInfoWidget(state.resourceData);
          }
          return const Center(child: CircularProgressIndicator());
        })),
      ),
    );
  }

  buildResourceInfoWidget(List<ResourceModel> resourceData) {
    const TextStyle _nameStyle =
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    const TextStyle _textStyle = TextStyle(fontSize: 16);
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: resourceData.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Text(
                  "Name: ${resourceData[index].name}",
                  style: _nameStyle,
                ),
                Text(
                  "Color code: ${resourceData[index].color}",
                  style: _textStyle,
                ),
                Text(
                  "Id: ${resourceData[index].id.toString()}",
                  style: _textStyle,
                ),
                Text(
                  "Year: ${resourceData[index].year.toString()}",
                  style: _textStyle,
                ),
                Text(
                  "Pantone Value: ${resourceData[index].pantoneValue}",
                  style: _textStyle,
                )
              ],
            ),
          );
        });
  }
}
