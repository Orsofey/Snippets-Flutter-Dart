// Импорт модулей
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';

// Настройка класса скролла
class CustomScrollbarWidget extends StatefulWidget {
  final BoxScrollView Function(ScrollController controller) builder;

  const CustomScrollbarWidget({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  State<CustomScrollbarWidget> createState() => _CustomScrollbarWidgetState();
}

// Класс скролла
class _CustomScrollbarWidgetState extends State<CustomScrollbarWidget> {
  late ScrollController controller;

  // Состояние класса + контроллер
  @override
  void initState() {
    super.initState();

    controller = ScrollController();
  }

  // Контроль за расположением скролла
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  // Основные свойства скролла и ссылка на более детальные параметры
  Widget build(BuildContext context) {
    return DraggableScrollbar(
      controller: controller,
      backgroundColor: Color(0xFFBDBDBD),
      heightScrollThumb: 200,
      child: widget.builder(controller),
      scrollThumbBuilder: scrollThumbBuilder,
    );
  }

  // Более детальные свойства скролла
  Widget scrollThumbBuilder(
      Color backgroundColor,
      Animation<double> thumbAnimation,
      Animation<double> labeAnimation,
      double height, {
        Text? labelText,
        BoxConstraints? labelConstraints,
      }) =>
      FadeTransition(
          opacity: thumbAnimation,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor,
            ),
            height: height,
            width: 12,
          )
      );
}


