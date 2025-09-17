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
    context, {
    required leading,
    required String title,
    required trailing,
    String? subtitle,
  }) {
    final size = MediaQuery.of(context).size;
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return ListTile(
      onTap: () {},
      leading: Icon(
        leading,
        color: Theme.of(context).primaryColor,
        size: (isLandscape)?size.height * 0.08:size.height * 0.033,
      ),
      title: Text(title),
      subtitle: (subtitle != null) ? Text(subtitle) : null,
      trailing: Icon(
        trailing,
        color: Theme.of(context).primaryColor,
        size: (isLandscape)?size.height * 0.08:size.height * 0.033,
      ),
    );
  }

  Widget personPhoto({required height, required width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/person.jpg"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return SingleChildScrollView(
      child: Column(
        children: [
          if (!isLandscape) ...[
            personPhoto(height: size.height * 0.34, width: size.height * 0.28),
            SizedBox(height: size.height * 0.001),
            Text(
              "Omar Soboh",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                orderVoucherCount(context, title: "Order", count: 50),
                orderVoucherCount(context, title: "Voucher", count: 10),
              ],
            ),
          ],
          if (isLandscape) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Omar Soboh",
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: size.height * 0.08),
                    Row(
                      children: [
                        orderVoucherCount(context, title: "Order", count: 50),
                        SizedBox(width: size.height * 0.15),
                        orderVoucherCount(context, title: "Voucher", count: 10),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    personPhoto(
                      height: size.height * 0.50,
                      width: size.width * 0.24,
                    ),
                  ],
                ),
              ],
            ),
          ],
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
      ),
    );
  }
}
