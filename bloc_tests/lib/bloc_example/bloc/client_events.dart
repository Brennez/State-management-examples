import 'package:bloc_tests/bloc_example/domain/client_entity.dart';

abstract class ClientEvent {}

class LoadClientsEvent extends ClientEvent {}

class AddClientEvent extends ClientEvent {
  final ClientEntity client;

  AddClientEvent({
    required this.client,
  });
}

class RemoveClientEvent extends ClientEvent {
  final ClientEntity client;

  RemoveClientEvent({
    required this.client,
  });
}
