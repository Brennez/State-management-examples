import 'package:bloc_tests/bloc_example/domain/client_entity.dart';

class ClientsRepository {
  List<ClientEntity> _clients = [];

  List<ClientEntity> loadClients() {
    _clients.addAll([
      ClientEntity(name: 'Alicia Keys', email: "alicia@gmail.com"),
      ClientEntity(name: 'Bruno Mars', email: "bruno@gmail.com"),
      ClientEntity(name: 'Morgan Freeman', email: "morgan@gmail.com"),
      ClientEntity(name: 'Neymar Junior', email: "neyney@gmail.com"),
    ]);

    return _clients;
  }

  List<ClientEntity> addClient(ClientEntity client) {
    _clients.add(client);
    return _clients;
  }

  List<ClientEntity> removeClient(ClientEntity client) {
    _clients.remove(client);
    return _clients;
  }
}
