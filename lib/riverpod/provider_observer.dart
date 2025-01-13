import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    print('didAddProvider | provider: $provider, value: $value');
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    print('didDisposeProvider | provider: $provider');
    super.didDisposeProvider(provider, container);
  }

  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    print('didUpdateProvider | provider: $provider, prev: $previousValue, new: $newValue');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}
