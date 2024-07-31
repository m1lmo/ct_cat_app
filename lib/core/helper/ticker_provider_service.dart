import 'package:flutter/scheduler.dart';

/// TickerProviderService is a class that provides a ticker for the animation.
class TickerProviderService implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

/// tickerProviderService is an instance of TickerProviderService for global
/// created for CNotify class.
final TickerProviderService tickerProviderService = TickerProviderService();
