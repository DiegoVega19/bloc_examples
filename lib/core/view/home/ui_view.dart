import 'package:bloc_1/core/base/bloc/ui/ui_bloc.dart';
import 'package:bloc_1/core/components/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UiView extends StatefulWidget {
  const UiView({super.key});

  @override
  State<UiView> createState() => _UiViewState();
}

class _UiViewState extends State<UiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          isHome: false,
        ),
        body: BlocBuilder<UiBloc, UiState>(
          builder: (context, state) {
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => {
                        context.read<UiBloc>().add(SetVisibilityEvent(!state.isVisible))
                      },
                      icon:  state.isVisible ? const Icon(
                        Icons.remove_red_eye,
                        size: 60,
                      ) :  const Icon(Icons.close, size: 60,)) ,
                  const SizedBox(
                    height: 50,
                  ),
                   Text('Esta visible ${state.isVisible}'),
                   const SizedBox(
                    height: 50,
                  ),
                  Switch(value: state.isSwitchVisible, onChanged: (bool value)=> {
                    context.read<UiBloc>().add(ToggleSwitchEvent(value))
                  })
                ],
              ),
            );
          }
        ));
  }
}


