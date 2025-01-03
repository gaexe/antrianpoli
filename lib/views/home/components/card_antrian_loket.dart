import 'package:flutter/material.dart';

Widget cardAntrianLoket(
  BuildContext context,
  String header,
  String body,
  String footer,
) {
  return Padding(
    padding: const EdgeInsets.all(9),
    child: Card(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width / 5,
          height: MediaQuery.sizeOf(context).height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height / 42),
              Text(
                header,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height / 42),
              const Divider(height: 12, thickness: 1),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: -5.0,
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: Text(
                  body,
                  style: const TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    height: 2,
                    color: Colors.blue
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(height: 12, thickness: 1),
              SizedBox(height: MediaQuery.sizeOf(context).height / 42),
              Text(
                footer,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height / 42),
            ],
          ),
        ),
      ),
    ),
  );
}
