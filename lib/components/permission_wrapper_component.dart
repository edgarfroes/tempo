import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempo/blocs/permission_cubit.dart';

class PermissionWrapperComponent extends StatelessWidget {
  const PermissionWrapperComponent({
    super.key,
    required this.permission,
    required this.grantedBuilder,
  });

  final Permission permission;
  final Widget Function(BuildContext context) grantedBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PermissionCubit(permission),
      child: BlocBuilder<PermissionCubit, PermissionState>(
        buildWhen: (previous, current) {
          return current.maybeMap(
            granted: (_) => true,
            disclaimer: (_) => true,
            orElse: () => false,
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            granted: () => grantedBuilder(context),
            initial: () => const Center(child: CircularProgressIndicator()),
            orElse: PermissionScreen.new,
          );
        },
      ),
    );
  }
}

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<PermissionCubit, PermissionState>(
        buildWhen: (previous, current) {
          return current.maybeMap(disclaimer: (_) => true, orElse: () => false);
        },
        builder: (context, state) {
          return state.maybeMap(
            disclaimer:
                (data) => Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'We need your permission',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      data.permission.when(
                        microphone:
                            () =>
                                'To listen to your instrument, we need your microphone permission.',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 48),
                      child: Center(
                        child: BlocBuilder<PermissionCubit, PermissionState>(
                          buildWhen: (previous, current) {
                            return current.maybeWhen(
                              denied: () => true,
                              permanentlyDenied: () => true,
                              requesting: () => true,
                              finishedRequesting: () => true,
                              orElse: () => false,
                            );
                          },
                          builder: (context, state) {
                            return state.maybeWhen(
                              requesting: _LoadingButton.new,
                              orElse: () {
                                final cubit = context.read<PermissionCubit>();

                                return ElevatedButton(
                                  onPressed: state.whenOrNull(
                                    denied: () => cubit.requestPermission,
                                    permanentlyDenied:
                                        () => cubit.openAppSettings,
                                  ),
                                  child: BlocBuilder<
                                    PermissionCubit,
                                    PermissionState
                                  >(
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        requesting:
                                            () => const Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox.square(
                                                  dimension: 15,
                                                  child:
                                                      CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                      ),
                                                ),
                                                SizedBox(width: 10),
                                                Text('Requesting'),
                                              ],
                                            ),
                                        orElse:
                                            () => const Text(
                                              'Request permission',
                                            ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

class _LoadingButton extends StatelessWidget {
  const _LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
      onPressed: null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: 15,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: 10),
          Text('Requesting'),
        ],
      ),
    );
  }
}
