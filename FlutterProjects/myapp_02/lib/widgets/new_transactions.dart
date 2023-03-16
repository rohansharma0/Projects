import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function addTx;

  NewTransactions(this.addTx);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime _seletedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _seletedDate == null) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _seletedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _seletedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          margin: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15,
          ),
          child: Platform.isIOS
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    CupertinoTextField(
                      placeholder: 'Title',
                      controller: _titleController,
                      onSubmitted: (_) => _submitData(),
                    ),
                    CupertinoTextField(
                      placeholder: 'Amount',
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => _submitData(),
                    ),
                    Container(
                      height: 70,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              _seletedDate == null
                                  ? 'No Date Chosen'
                                  : 'Picked Date : ${DateFormat.yMMMd().format(_seletedDate)}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          CupertinoButton(
                            color: Colors.white,
                            child: Text(
                              'Choose Date',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            onPressed: _presentDatePicker,
                          )
                        ],
                      ),
                    ),
                    CupertinoButton(
                      child: Text(
                        'Add Transaction',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: _submitData,
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                      onSubmitted: (_) => _submitData(),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => _submitData(),
                    ),
                    Container(
                      height: 70,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              _seletedDate == null
                                  ? 'No Date Chosen'
                                  : 'Picked Date : ${DateFormat.yMMMd().format(_seletedDate)}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            child: Text('Choose Date'),
                            onPressed: _presentDatePicker,
                          )
                        ],
                      ),
                    ),
                    RaisedButton(
                      child: Text(
                        'Add Transaction',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).buttonColor,
                      onPressed: _submitData,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
