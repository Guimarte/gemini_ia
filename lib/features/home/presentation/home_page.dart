import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_click/features/home/bloc/home_bloc.dart';
import 'package:gemini_click/features/home/bloc/home_event.dart';
import 'package:gemini_click/features/home/bloc/home_state.dart';
import 'package:gemini_click/features/home/mixin/home_mixin.dart';

class HomePage extends StatelessWidget with HomeMixin {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I.A com GEMINI"),
        centerTitle: true,
        actions: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeRequestLoaded) {
                return IconButton(
                  onPressed: () {
                    request.clear();
                    context.read<HomeBloc>().add(HomeSetInitialEvent());
                  },
                  icon: Icon(Icons.clear),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is HomeRequestLoaded) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        children: [
                          Text(
                            state.response ?? "",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "Faça sua pesquisa com GEMINI I.A",
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: TextFormField(
                      controller: request,
                      minLines: 1,
                      maxLines: 5,
                      cursorColor: clickCollor,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Digite algo...',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffa528ff)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: clickCollor, width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: clickCollor,
                      ),
                      onPressed: () {
                        context.read<HomeBloc>().add(
                          HomeEventRequest(answer: request.value.text),
                        );
                      },
                      child: Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
