import 'dart:ui';
import 'package:MyApp/core/menu_icons_icons.dart';
import 'package:MyApp/models/categoryItem.dart';
import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';

class CategoryList extends StatefulWidget {
  final List<CategoryItem> items;

  CategoryList({Key key, this.items}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    List<CategoryItem> items = widget.items;

    return ImplicitlyAnimatedReorderableList<CategoryItem>(
      items: items,
      areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
      onReorderFinished: (item, from, to, newItems) {
        setState(() {
          items
            ..clear()
            ..addAll(newItems);
        });
      },
      itemBuilder: (context, itemAnimation, item, index) {
        return Reorderable(
          key: ValueKey(item),
          builder: (context, dragAnimation, inDrag) {
            final t = dragAnimation.value;
            final elevation = lerpDouble(0, 8, t);

            return SizeFadeTransition(
              sizeFraction: 0.7,
              curve: Curves.easeInOut,
              animation: itemAnimation,
              child: Material(
                color: Colors.white,
                elevation: elevation,
                type: MaterialType.canvas,
                child: ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconShadowWidget(
                          Icon(
                            MenuIcons.minus_sign_inside_a_black_circle,
                            color: Colors.redAccent.shade700,
                            size: 23,
                          ),
                          shadowColor: Colors.black38),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black12),
                        child: Icon(IconData(int.parse(item.icon), fontFamily: 'ExpenseIncome'),
                            color: Colors.black87, size: 20,),
                      )
                    ],
                  ),
                  title: Text(item.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  trailing: Handle(
                    delay: const Duration(milliseconds: 100),
                    child: Icon(
                      MenuIcons.list,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
