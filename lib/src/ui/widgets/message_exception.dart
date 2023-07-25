import 'package:animalkingdom_admin_app/src/interactor/errors/animal_exception.dart';
import 'package:animalkingdom_admin_app/src/interactor/utils/messages.dart';
import 'package:animalkingdom_admin_app/src/interactor/utils/routes.dart';
import 'package:flutter/material.dart';

class MessageException extends StatelessWidget {
  final AnimalException? exception;
  final Function() action;
  final String route;

  const MessageException({
    super.key,
    this.exception,
    required this.action,
    this.route = routeHome,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(

          title: const Text('Opa, algo deu errado!'),
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
          content: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 24, 8, 24),
              child: Text(exception?.message ?? unknownError),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: action,
                  child: const Text('Tentar novamente'),
                ),
                TextButton(
                  onPressed: () => Navigator.popAndPushNamed(context, route),
                  child: const Text('Continuar'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
