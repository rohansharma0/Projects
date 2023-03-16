import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double spendingAmount;
  final double spendingPerTotal;

  ChartBar(this.lable, this.spendingAmount, this.spendingPerTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraint) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Container(
            // height: constraint.maxHeight * 0.15,
            // child:
            //  FittedBox(
            //   child: Text(
            //     "\$${spendingAmount.toStringAsFixed(0)}",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.w800,

            //     ),
            //   ),
            // ),
            // ),
            SizedBox(
              height: constraint.maxHeight * 0.15,
            ),
            Container(
              height: constraint.maxHeight * 0.6,
              width: 20,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: null,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 11,
                          color: Color.fromRGBO(136, 173, 191, 0.36),
                          offset: Offset(1.0, 1.0),
                        )
                      ],
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPerTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(57, 71, 109, 1),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 13,
                            color: Color.fromRGBO(77, 92, 133, 0.50),
                            offset: Offset(0, -3.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
            Container(
              height: constraint.maxHeight * 0.13,
              child: FittedBox(
                child: Text(
                  lable,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
