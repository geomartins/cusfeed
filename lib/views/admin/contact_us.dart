import 'package:cusfeed/config/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/reusable_contact_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  static const String id = '/contact_us';

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Future<void> _makePhoneCall() async {
    if (await canLaunch(kDeveloperTelephone)) {
      await launch(kDeveloperTelephone);
    } else {
      throw 'Could not launch $kDeveloperTelephone';
    }
  }

  Future<void> _createEmail() async {
    const email =
        'mailto:$kDeveloperEmail?subject=$kAppName contact message &body=Enter Message Here';

    if (await canLaunch(email)) {
      await launch(email);
    } else {
      throw 'Could not Email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/contact.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
          minimum: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 10.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'How can we help you ??',
                    style: Theme.of(context).textTheme.title.copyWith(
                          fontSize: 17.0,
                          fontFamily: kFontFamily,
                          fontWeight: FontWeight.w500,
//                          color: Colors.black.withOpacity(0.8),
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ReusableContactCard(
                    icon: Icons.phone,
                    text: 'Chat with us',
                    onPressed: () => _makePhoneCall(),
                  ),
                  ReusableContactCard(
                    icon: Icons.mail,
                    text: 'Email Us',
                    onPressed: () => _createEmail(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
