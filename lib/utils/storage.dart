import 'dart:async';
import 'dart:io';

mixin StateStorage {
  FutureOr<bool> exists();

  FutureOr<void> createState();

  FutureOr<String> loadState();

  FutureOr<void> saveState(String encodedState);
}

/// An example state-storage
class FileStateStorage with StateStorage {
  File? _stateFile;

  FileStateStorage({required String username, String stateFolder = ''}) {
    _stateFile = File('$stateFolder/state_$username.json');
  }

  @override
  Future<void> createState() async => _stateFile!.create(recursive: true);

  @override
  Future<String> loadState() async => _stateFile!.readAsString();

  @override
  Future<void> saveState(String encodedState) async =>
      _stateFile!.writeAsString(encodedState);

  @override
  Future<bool> exists() async => _stateFile!.exists();
}
