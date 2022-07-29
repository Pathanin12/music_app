import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class shimmer extends StatefulWidget {
  const shimmer({Key? key}) : super(key: key);

  @override
  State<shimmer> createState() => _shimmerState();
}

class _shimmerState extends State<shimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFC246DAB),
      height: MediaQuery.of(context).size.height * 1,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
        child: Shimmer.fromColors(

          baseColor: Colors.grey,
          highlightColor: Colors.white,
          enabled: true,
          child: ListView.builder(
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 250,
                        height: 10.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: 250,
                        height: 10.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: 40.0,
                        height: 15.0,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
            itemCount: 6,
          ),
        ),
      ),
    );
  }
}
