import '../model/extension.dart';
import '../provider/mock_provider.dart';

class ExtensionRepository {
  final MockProvider provider;

  ExtensionRepository({this.provider});

  List<Extension> getAllExtensions() {
    return provider.getAllExtensions();
  }
}
