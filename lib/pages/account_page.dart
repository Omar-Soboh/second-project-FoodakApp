import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget orderVoucherCount(
    BuildContext context, {
    required String title,
    required int count,
  }) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget listTileOrderVoucher(
    context,
    {
    required leading,
    required String title,
    required trailing,
    String? subtitle,
  }) {
    return ListTile(
      onTap: (){},
      leading: Icon(
        leading,
        color: Theme.of(context).primaryColor,
        size: 26,
        ),
      title: Text(
        title,
        ),
      subtitle: (subtitle != null) ? Text(subtitle) : null,
      trailing: Icon(
        trailing,
        color: Theme.of(context).primaryColor,
        size: 26,
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: size.height * 0.34,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/person.jpg"),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            orderVoucherCount(context, title: "Order", count: 50),
            orderVoucherCount(context, title: "Voucher", count: 10),
          ],
        ),
        SizedBox(height: size.height * 0.03),
        Divider(
           thickness: 0.8,
           color: Colors.black12,
           indent: size.height * 0.01,
           endIndent: size.height * 0.01,
        ),
        listTileOrderVoucher(
          context,
          leading: Icons.shopping_cart_outlined,
          title: "Past Order",
          trailing: Icons.chevron_right,
        ),
        Divider(
           thickness: 0.8,
           color: Colors.black12,
           indent: size.height * 0.01,
           endIndent: size.height * 0.01,
        ),
        listTileOrderVoucher(
          context,
          leading: Icons.card_giftcard,
          title: "Past Voucher",
          trailing: Icons.chevron_right,
        ),
        Divider(
           thickness: 0.8,
           color: Colors.black12,
           indent: size.height * 0.01,
           endIndent: size.height * 0.01,
        ),
      ],
    );
  }
}
