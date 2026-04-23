import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/authentication/viewmodels/auth_viewmodel.dart';
import '../../features/profile/viewmodels/profile_viewmodel.dart';

class RouterRefreshNotifier extends ChangeNotifier {
  late final List<ProviderSubscription> _subscriptions;

  RouterRefreshNotifier(Ref ref) {
    _subscriptions = [
      ref.listen(authViewModelProvider, (_, _) => notifyListeners()),
      ref.listen(profileViewModelProvider, (_, _) => notifyListeners()),
    ];
  }

  @override
  void dispose() {
    for (final s in _subscriptions) {s.close();}
    super.dispose();
  }
}
