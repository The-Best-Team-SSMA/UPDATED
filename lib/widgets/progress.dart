import 'package:flutter/material.dart';

class PForm extends StatefulWidget {
  final List<Widget> pages;
  final List<PTitle> title;
  PFormController controller;
  double height;
  Color activeColor, disableColor;
  PForm(
      {required this.pages,
      required this.title,
      required this.controller,
      this.activeColor = Colors.blue,
      this.disableColor = Colors.grey,
      this.height = 250});
  @override
  _PFormState createState() => _PFormState();
}

class _PFormState extends State<PForm> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _annimations;
  late List<Animation<double>> _annimationsOpavity;
  late List<bool> activeColor;
  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
        widget.pages.length,
        (index) => AnimationController(
            vsync: this,
            duration: Duration(milliseconds: 200),
            lowerBound: .05));
    _annimations = _controllers
        .map((_controller) =>
            Tween<double>(begin: 0, end: 1).animate(_controller))
        .toList();
    _annimationsOpavity = _controllers
        .map((_controller) =>
            Tween<double>(begin: 0, end: 1).animate(_controller))
        .toList();
    activeColor = List.generate(widget.pages.length, (index) => false);

    if (widget.controller != null) {
      widget.controller.addListener(() {
        controlColor(widget.controller.currentPage);
      });
    }
  }

  controlColor(int index) {
    for (var i = 0; i < activeColor.length; i++) {
      if (index == i) {
        if (!_controllers[i].isCompleted) _controllers[index].animateTo(1);
      } else {
        if (_controllers[i].isCompleted) _controllers[i].reverse();
      }
    }
    for (var i = 0; i <= index; i++) {
      activeColor[i] = true;
    }
    for (var i = index + 1; i < activeColor.length; i++) {
      activeColor[i] = false;
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _controllers.forEach((c) {
      c.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.pages.map((e) {
          int index = widget.pages.indexOf(e);
          return Stack(
            children: [
              if (index != widget.pages.length - 1)
                Container(
                  margin: EdgeInsets.only(left: 2, top: 37),
                  child: SizeTransition(
                    sizeFactor: _annimations[index],
                    child: Container(
                      margin: EdgeInsets.only(left: 13, right: 20),
                      width: 3,
                      height: widget.height,
                      color: activeColor[index + 1]
                          ? widget.activeColor.withOpacity(.9)
                          : widget.disableColor,
                    ),
                  ),
                ),
              Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controlColor(index);
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: activeColor[index]
                                ? widget.activeColor.withOpacity(.9)
                                : widget.disableColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      widget.title[index].copyWith(
                          activeColor: activeColor[index]
                              ? widget.activeColor
                              : Colors.black)
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                          child: FadeTransition(
                        opacity: _annimationsOpavity[index],
                        child: SizeTransition(
                          sizeFactor: _annimations[index],
                          child: e,
                        ),
                      ))
                    ],
                  )
                ],
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}

class PTitle extends StatelessWidget {
  String title;
  String? subTitle;
  Color activeColor;
  PTitle({required this.title, this.subTitle, this.activeColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: activeColor)),
        if (subTitle != null) Text(subTitle!),
      ],
    );
  }

  copyWith({String? title, subTitle, Color? activeColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? this.title,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: activeColor ?? this.activeColor)),
        Text(
          subTitle ?? this.subTitle ?? "",
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}

class PFormController extends ChangeNotifier {
  PFormController(this.length);
  int _page = -1;
  final int length;

  nextPage() {
    if (_page < length - 1) _page++;

    notifyListeners();
  }

  get currentPage => _page;

  set jumpToPage(int p) {
    _page = p;
    notifyListeners();
  }

  prevPage() {
    if (_page > 0) _page--;
    notifyListeners();
  }
}
