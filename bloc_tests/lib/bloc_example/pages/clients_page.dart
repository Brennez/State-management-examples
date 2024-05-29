import 'package:bloc_tests/bloc_example/bloc/client_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/client_bloc.dart';
import '../bloc/client_events.dart';
import '../domain/client_entity.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  final clientBloc = ClientBloc();

  @override
  void initState() {
    super.initState();
    clientBloc.add(LoadClientsEvent());
  }

  @override
  void dispose() {
    super.dispose();
    clientBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              clientBloc.add(
                AddClientEvent(
                  client: ClientEntity(
                    name: 'Novo Cliente',
                    email: 'email@gmail.com',
                  ),
                ),
              );
            },
          ),
          // Open the drawer
        ],
      ),
      body: BlocBuilder<ClientBloc, ClientStates>(
        bloc: clientBloc,
        builder: (context, state) {
          if (state is ClientsErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is ClientInitialClientState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ClientSuceessState) {
            final clientsList = state.clients;
            return ListView.builder(
              itemCount: clientsList.length,
              itemBuilder: (context, index) {
                final client = clientsList[index];

                return ListTile(
                  title: Text(client.name),
                  subtitle: Text(client.email),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => clientBloc.add(
                      RemoveClientEvent(client: client),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
