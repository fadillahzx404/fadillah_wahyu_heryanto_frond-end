import 'package:flutter/material.dart';

class ItemCardDetails extends StatefulWidget {
  final String? titleItem;
  final String? amountItem;

  const ItemCardDetails({super.key, this.titleItem, this.amountItem});

  @override
  State<ItemCardDetails> createState() => _ItemCardDetailsState();
}

class _ItemCardDetailsState extends State<ItemCardDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.titleItem}",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                "${widget.amountItem}",
                style: TextStyle(color: Color(0xff68778D)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
