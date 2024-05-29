import 'package:bloc_tests/bloc_example/domain/client_entity.dart';

abstract class ClientStates {
  List<ClientEntity> clients;

  ClientStates({
    required this.clients,
  });
}

class ClientInitialClientState extends ClientStates {
  ClientInitialClientState({
    required List<ClientEntity> clients,
  }) : super(clients: []);
}

class ClientSuceessState extends ClientStates {
  ClientSuceessState({
    required List<ClientEntity> clients,
  }) : super(clients: clients);
}

class ClientsErrorState extends ClientStates {
  final String message;

  ClientsErrorState({
    required this.message,
  }) : super(clients: []);
}
