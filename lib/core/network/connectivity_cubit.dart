import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../sync/sync_manager.dart';

class ConnectivityCubit extends Cubit<void> {
  final SyncManager syncManager;

  ConnectivityCubit(this.syncManager) : super(null) {
    Connectivity().onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        syncManager.sync();
      }
    });
  }
}
