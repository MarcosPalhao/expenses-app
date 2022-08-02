import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../components/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, contraints) {
            return Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Nenhuma transação cadastrada...',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20),
                Container(
                  height: contraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : 
        ListView(
          children: transactions.map((tr) {
            return TransactionItem(
              key: ValueKey(tr.id),
              tr: tr,
              onRemove: onRemove,
            );
          }).toList(),
        );
        // ListView.builder(
        //     itemCount: transactions.length,
        //     itemBuilder: (ctx, index) {
        //       final tr = transactions[index];
        //       return TransactionItem(tr: tr, onRemove: onRemove);
        //     },
        //   );
  }
}
