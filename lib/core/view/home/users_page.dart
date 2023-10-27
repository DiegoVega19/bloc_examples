import 'package:bloc_1/core/base/bloc/users/users_bloc.dart';
import 'package:bloc_1/core/base/model/users_model.dart';
import 'package:bloc_1/core/components/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late final UsersBloc usersBloc;

  @override
  void initState() {
    super.initState();
    usersBloc = context.read<UsersBloc>()..add(GetUserList());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: const UsersPageContent() ,
    );
  }
}

class UsersPageContent extends StatelessWidget {
  const UsersPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersBloc, UsersState>(listener: (context,state){
      if (state is UsersError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
    },
    child: BlocBuilder<UsersBloc, UsersState>(
      builder:(context, state) {
        if (state is UsersInitial) {
                return _buildLoading();
              } else if (state is UsersLoading) {
                return _buildLoading();
              } else if (state is UsersLoaded) {
                return MyCard(usersModel: state.usersModel, state:  state, );
              } else if (state is UsersError) {
                return Container();
              } else {
                return Container();
              }
      } ),
    );
  }
}

class MyCard extends StatelessWidget {
  final UsersModel usersModel;
  final UsersState state;
  const MyCard({super.key, required this.usersModel, required this.state});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Switch(value: false, onChanged: (bool value){
          print('xd');
        }),
        const SizedBox(height: 40,),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
          itemCount: usersModel.data!.length,  
          itemBuilder: (context, index){
            final item = usersModel.data![index];
              return Container(
                margin: const EdgeInsets.all(8),
                child: Card(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text("Nombre : ${item.firstName}"),
                        Text("Apellido : ${item.lastName}"),
                        Image.network('${item.avatar}', width: 50, height: 50,)
                      ],
                    ),
                  ),
                ),
              );
          }),
        ),
      ],
    );
  }
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());