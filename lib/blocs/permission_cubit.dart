import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

part 'permission_cubit.freezed.dart';

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit(this._permission) : super(const PermissionState.initial()) {
    _updateDisclaimer();

    _updatePermissionStatus();

    _handler
        .onDeniedCallback(() {
          emit(const PermissionState.denied());
        })
        .onPermanentlyDeniedCallback(() {
          emit(const PermissionState.permanentlyDenied());
        })
        .onLimitedCallback(() {
          emit(const PermissionState.permanentlyDenied());
        })
        .onGrantedCallback(() {
          emit(const PermissionState.granted());
        })
        .onProvisionalCallback(() {
          emit(const PermissionState.granted());
        })
        .onRestrictedCallback(() {
          emit(const PermissionState.granted());
        });
  }

  final Permission _permission;

  permission_handler.Permission get _handler => _permission.when(
    microphone: () => permission_handler.Permission.microphone,
    // Add more permissions if needed.
  );

  void _updateDisclaimer() {
    emit(PermissionState.disclaimer(permission: _permission));
  }

  Future<void> _updatePermissionStatus() async {
    if (await _handler.isPermanentlyDenied || await _handler.isRestricted) {
      emit(const PermissionState.permanentlyDenied());
      return;
    }

    if (await _handler.isDenied) {
      emit(const PermissionState.denied());
      return;
    }

    final isGranted =
        (await _handler.isGranted) ||
        (await _handler.isLimited) ||
        (await _handler.isProvisional);

    if (isGranted) {
      emit(const PermissionState.granted());
      return;
    }

    emit(const PermissionState.unknown());
  }

  Future<void> requestPermission() async {
    emit(const PermissionState.requesting());

    await _handler.request();

    await Future.delayed(const Duration(seconds: 1));

    emit(const PermissionState.finishedRequesting());
  }

  Future<void> openAppSettings() async {
    emit(const PermissionState.requesting());

    await Future.delayed(const Duration(seconds: 1));

    await permission_handler.openAppSettings();

    emit(const PermissionState.finishedRequesting());

    await _updatePermissionStatus();
  }
}

@freezed
abstract class PermissionState with _$PermissionState {
  const factory PermissionState.initial() = _Initial;
  const factory PermissionState.disclaimer({required Permission permission}) =
      _Disclaimer;
  const factory PermissionState.unknown() = _Unknown;
  const factory PermissionState.denied() = _Denied;
  const factory PermissionState.permanentlyDenied() = _PermanentlyDenied;
  const factory PermissionState.requesting() = _Requesting;
  const factory PermissionState.finishedRequesting() = _FinishedRequesting;
  const factory PermissionState.granted() = _Granted;
}

@freezed
abstract class Permission with _$Permission {
  factory Permission.microphone() = _MicrophonePermission;
  // Add more permissions if needed.
}
