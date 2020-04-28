import 'dart:math';

import '../model/extension.dart';

class MockProvider {
  List<Extension> getAllExtensions() {
    final extensions = List<Extension>.generate(
      10,
      (index) => Extension(
        name: 'Flask ${index + 1}',
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum officiis, animi iusto dolor quam numquam, cupiditate molestias tenetur nisi veniam quisquam, nulla nesciunt.',
        maintainer: 'Bruno Rocha',
        stars: Random().nextInt(100),
        lastUpdate: '${Random().nextInt(30)} days ago',
        commits: Random().nextInt(100),
      ),
    );
    return extensions;
  }
}
