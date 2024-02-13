import 'package:flutter/material.dart';

class UserMessageBubble extends StatelessWidget {
  const UserMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Hola, soy la otra persona',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // TODO: Imagen
        _ImageBubble(),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://i.pinimg.com/originals/0c/96/49/0c9649f0a491373305b741c3be3d35cc.gif',
          width: size.width * 0.6,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Container(
                width: size.width * 0.6,
                height: 150,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: const Text('Cargando...'));
          },
        ));
  }
}