import 'package:flutter/material.dart';

void explainpage(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'TIP',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          content: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.0)),
            child: Image.asset('lib/explain/sen1.png'),
          ),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          actions: <Widget>[
            Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'TIP',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          content: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white, width: 2.0)),
                            child: Image.asset('lib/explain/sen2.png'),
                          ),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          actions: <Widget>[
                            Container(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            'TIP',
                                            textAlign: TextAlign.center,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          content: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2.0)),
                                            child: Image.asset(
                                                'lib/explain/sen3.png'),
                                          ),
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Colors.white,
                                                  width: 2.0),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          actions: <Widget>[
                                            Container(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Close'),
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: Text('NEXT'),
                              ),
                            )
                          ],
                        );
                      });
                },
                child: Text('NEXT'),
              ),
            )
          ],
        );
      });
}
