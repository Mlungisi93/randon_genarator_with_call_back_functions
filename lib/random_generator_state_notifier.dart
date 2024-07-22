import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "random_generator_state_notifier.freezed.dart";

@freezed
class RandomizerState with _$RandomizerState {
  const RandomizerState._();
  const factory RandomizerState({
    @Default(0) int min,
    @Default(0) int max,
    int? generatedNumber,
  }) = _RandomizerState;
}

class RandomGeneratorStateNotifier extends StateNotifier<RandomizerState> {
  RandomGeneratorStateNotifier() : super(const RandomizerState());

  final _randomGenerator = Random();

  void generateRandomNumber() {
    //immutable data class, you replace it with a copy of previous state, never update it in place
    //state notifier has a state field in this case RandomizerState
    state = state.copyWith(
        generatedNumber:
            state.min + _randomGenerator.nextInt((state.max - state.min) + 1));
  }

  void setMin(int value) {
    state = state.copyWith(min: value);
  }

  void setMax(int value) {
    state = state.copyWith(max: value);
  }
}
