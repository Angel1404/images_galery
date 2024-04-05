import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src.dart';

class BtnNavBar extends ConsumerWidget {
  const BtnNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);

    return Container(
      height: 65,
      width: double.maxFinite,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(8),
          topStart: Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(offset: Offset(0, -4), color: Colors.black12, blurRadius: 2),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(listItemsNavBar.length, (index) {
          final item = listItemsNavBar[index];
          final isItemSelected = homeState.indexSeleted == item.value;
          return InkWell(
            onTap: () {
              ref.read(homeProvider.notifier).seletedIndex = index;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: isItemSelected ? Colors.blue : Colors.black,
                  size: isItemSelected ? 25 : 15,
                ),
                const SizedBox(height: 3),
                Text(
                  item.title,
                  style: TextStyle(
                    fontWeight: isItemSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
