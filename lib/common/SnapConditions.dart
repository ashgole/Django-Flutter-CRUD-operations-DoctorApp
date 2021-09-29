import 'package:flutter/material.dart';

Widget snapWaiting(context) {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget snapError() {
  return Center(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: Image.asset('assets/images/down.png').image,
                  ),
                )),
            Text(
              'check your internet econnection or server is down',
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
    ),
  );
}

Widget snapNoData(context) {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 100 * 50,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: Image.asset('assets/images/empty.png').image,
                ),
              )),
          Text(
            'Empty',
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    ),
  );
}

Widget snapNoConnection(context) {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 100 * 50,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: Image.asset('assets/images/no_internet.png').image,
                ),
              )),
          Text(
            'No Internet',
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    ),
  );
}
