import 'package:bloc/bloc.dart';
import 'package:bloc_tests/bloc_example/bloc/client_events.dart';
import 'package:bloc_tests/bloc_example/bloc/client_states.dart';
import 'package:bloc_tests/bloc_example/repository/clients_repository.dart';

class ClientBloc extends Bloc<ClientEvent, ClientStates> {
  final _repository = ClientsRepository();

  ClientBloc() : super(ClientInitialClientState(clients: [])) {
    on<LoadClientsEvent>((event, emit) async {
      await Future.delayed(Duration(seconds: 2));
      emit(
        ClientSuceessState(clients: _repository.loadClients()),
      );
    });

    on<AddClientEvent>((event, emit) => emit(ClientSuceessState(
          clients: _repository.addClient(event.client),
        )));

    on<RemoveClientEvent>((event, emit) {
      try {
        emit(ClientSuceessState(
            clients: _repository.removeClient(event.client)));
      } catch (e) {
        emit(ClientsErrorState(message: "Um erro inesperado aconteceu :/"));
      }
    });
  }
}
