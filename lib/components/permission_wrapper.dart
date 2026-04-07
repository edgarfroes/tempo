import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempo/blocs/permission_cubit.dart';
import 'package:tempo/screens/permission_screen.dart';

class PermissionWrapper extends StatelessWidget {
  const PermissionWrapper({
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
