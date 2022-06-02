import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer(
      {Key? key,
      required this.route,
      required this.date,
      required this.imageUrl,
      required this.title,
      required this.id})
      : super(key: key);
  final String title;
  final String date;
  final String imageUrl;
  final int id;
  final String route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route, arguments: id);
      },
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 5,
        child: Row(children: [
          Container(
            width: MediaQuery.of(context).size.width / 3,
            margin: const EdgeInsets.only(right: 30.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                errorBuilder: (context, error, stackTrace) => Container(),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Color(0xFFBA0C2F),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      height: 1.5),
                ),
              ),
              subtitle: Container(
                child: Text(
                  date,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 15),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Wrap(
          //         children: [
          //           Text(
          //             title,
          //             overflow: TextOverflow.ellipsis,
          //             style: const TextStyle(
          //                 color: Color(0xFFBA0C2F),
          //                 fontSize: 20.0,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 15.0,
          //       ),
          //       Text(
          //         date,
          //         style: const TextStyle(color: Colors.white),
          //       )
          //     ],
          //   ),
          // )
        ]),
      ),
    );
  }
}
