import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tap_to_bpm_bloc.freezed.dart';

class TapToBpmBloc extends Bloc<TapToBpmEvent, TapToBpmState> {
  TapToBpmBloc() : super(const TapToBpmState.initial()) {
    _mapEvents();
  }

  var _tapCount = 0;
  var _isCountingDown = false;
  int? _latestBpm;
  final List<int> _bpmHistory = [];

  final _stopwatch = Stopwatch();

  void _mapEvents() {
    on<TapToBpmEvent>((event, emit) async {
      await event.whenOrNull(
        firstTap: () => _onFirstTapEvent(emit),
        nextTap: () => _onNextTapEvent(emit),
      );
    });
  }

  Future<void> _onFirstTapEvent(Emitter<TapToBpmState> emit) async {
    emit(const TapToBpmState.didFirstTap());

    _tapCount = _tapCount + 1;

    final countdownFuture = _countdown(emit);
    final tapFeedbackFuture = _tapFeedback(emit);

    _stopwatch
      ..reset()
      ..start();

    emit(const TapToBpmState.waitingNextTap());

    await tapFeedbackFuture;
    await countdownFuture;
  }

  Future<void> _onNextTapEvent(Emitter<TapToBpmState> emit) async {
    _tapCount = _tapCount + 1;

    final tapFeedbackFuture = _tapFeedback(emit);

    final bpm = (60000 / _stopwatch.elapsedMilliseconds).floor();

    final averageBpm = _calculateAverageBPM(bpm);

    emit(TapToBpmState.changedAverageBPM(bpm: averageBpm));

    _latestBpm = bpm;

    final countdownFuture = _countdown(emit);

    _stopwatch
      ..reset()
      ..start();

    emit(TapToBpmState.waitingNextTap(bpm: bpm));

    await countdownFuture;

    await tapFeedbackFuture;
  }

  int _calculateAverageBPM(int bpm) {
    // Max 30% deviation.
    final maxDeviation = bpm * 0.3;

    _bpmHistory
      ..removeWhere((x) => bpm - maxDeviation > x || bpm + maxDeviation < x)
      ..insert(0, bpm);

    while (_bpmHistory.length > 6) {
      _bpmHistory.removeLast();
    }

    final averageBpm =
        (_bpmHistory.reduce((a, b) => a + b) / _bpmHistory.length).floor();

    return averageBpm;
  }

  Future<void> _tapFeedback(Emitter<TapToBpmState> emit) async {
    // TODO: Add haptic feedback.
    emit(const TapToBpmState.startingTapFeedback());

    await Future.delayed(const Duration(milliseconds: 100));

    emit(const TapToBpmState.finishedTapFeedback());
  }

  Future<void> _countdown(Emitter<TapToBpmState> emit) async {
    final currentTapCount = _tapCount;

    const duration = Duration(seconds: 3);

    if (_isCountingDown) {
      emit(const TapToBpmState.resetedCountdown(duration: duration));
    }

    _isCountingDown = true;

    emit(const TapToBpmState.startedCountdown(duration: duration));

    await Future.delayed(duration);

    // Has not timed out?
    if (currentTapCount != _tapCount) {
      return;
    }

    _isCountingDown = false;
    _bpmHistory.clear();

    emit(const TapToBpmState.finishedCountdown());

    if (_latestBpm != null) {
      emit(TapToBpmState.success(bpm: _latestBpm!));
    } else {
      emit(const TapToBpmState.initial());
    }
  }
}

@freezed
abstract class TapToBpmState with _$TapToBpmState {
  const factory TapToBpmState.initial() = _Initial;
  const factory TapToBpmState.didFirstTap() = _DidFirstTap;
  const factory TapToBpmState.waitingNextTap({@Default(null) int? bpm}) =
      _WaitingNextTap;
  const factory TapToBpmState.startingTapFeedback() = _Feedbacking;
  const factory TapToBpmState.finishedTapFeedback() = _FinishedFeedback;
  const factory TapToBpmState.success({required int bpm}) = _Success;
  const factory TapToBpmState.startedCountdown({required Duration duration}) =
      _StartedCountdown;
  const factory TapToBpmState.finishedCountdown() = _FinishedCountdown;
  const factory TapToBpmState.resetedCountdown({required Duration duration}) =
      _ResetedCountdown;
  const factory TapToBpmState.changedAverageBPM({required int bpm}) =
      _ChangedAverageBPM;
}

@freezed
abstract class TapToBpmEvent with _$TapToBpmEvent {
  const factory TapToBpmEvent.firstTap() = _FirstTap;
  const factory TapToBpmEvent.nextTap() = _NextTap;
}
