import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    'Follow Us',
                    style: TextStyle(fontSize: 28),
                  ),
                  Row(
                    children: [
                      Icon(Icons.language),
                      TextButton(
                        child: Text(
                          'Facebook @efood',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.public),
                      TextButton(
                        child: Text(
                          'Instagram @efood',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 28),
                  ),
                  Row(
                    children: [
                      Icon(Icons.mail),
                      TextButton(
                        child: Text(
                          ' efood@gmail.com  ',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () =>
                            launchUrl(Uri.parse('mailto:efood@gmail.com')),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.call),
                      TextButton(
                        child: Text(
                          ' +380500122355 ',
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () =>
                            launchUrl(Uri.parse('tel:+380500122355')),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
