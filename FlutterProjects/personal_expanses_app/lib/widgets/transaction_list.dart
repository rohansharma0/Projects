import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text("No transactions added yet!!"),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  height: 80,
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(255, 77, 77, 1),
                        Color.fromRGBO(255, 193, 100, 1)
                      ],
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color.fromRGBO(255, 75, 75, 0.23),
                        blurRadius: 10,
                        offset: Offset(4.0, 4.0),
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              blurRadius: 7,
                              offset: Offset(4.0, 4.0),
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: FittedBox(
                            child: Text(
                              '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 84, 78, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                transactions[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                DateFormat.yMMMd()
                                    .format(transactions[index].date),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              blurRadius: 7,
                              offset: Offset(4.0, 4.0),
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                            )
                          ],
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              size: 25,
                            ),
                            color: Color.fromRGBO(255, 84, 78, 1),
                            onPressed: () => deleteTx(transactions[index].id)),
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
