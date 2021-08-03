import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  Future getalluserNotification() async {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Transform.translate(
                  offset: Offset(-8, 60),
                  child: Container(
                    child: RichText(
                      text: TextSpan(
                        text: 'Terms & ',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.050,
                            color: Color(0xff1d395c)),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Condition.',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.046,
                                color: Color(0xff187b20)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                      "Term and conditions | privacy policy By using this app you undertake that you have read, understood and agree to these terms and conditions. We can update and/or change these terms at any time. By using this application you also agree that you don’t have any objection to updated and/or changed terms and conditions when you visit it under new terms and conditions in future. If you do not agree, you must refrain from using this application. sub heading: Your Account If you choose to create an account at this App, you are responsible for maintaining the confidentiality of your account name/number, password, ID and any other details and for all activities under your account. Any unauthorized use of your account or other breach of security should be reported to Kb ghar immediately. Your registration is personal to you and you may not disclose or make available your account name, ID or password to others. Any disclosure by you of your account name and password may result in termination of your registration and, where you register for fee, such termination shall be without refund and may be subject to additional charges based on unauthorized use. /nComments and Reviews You may post comments in the comment area and/or book reviews on this app so long as the content is not illegal, obscene, threatening, defamatory, invasive of privacy, infringing of intellectual property rights, or otherwise injurious to third parties or objectionable and does not consist of or contain software viruses, political campaigning, commercial solicitation etc.You also grant us a non-exclusive, perpetual, royalty-free, worldwide license to republish in any format any material (including but not limited to print and electronic format) that you submit to us. You indemnify Readings for all claims resulting from content you supply. We have the right but not the obligation to monitor and edit or remove any activity or content. We accept no liability in respect of any material submitted and published by us and are not responsible for its contents or accuracy. /n Privacy We may need to know your information including but not limited to your name, address and email address to provide you with information, reply to your queries etc. We collect this information according to our Policy. What information do we collect?We collect information from you when you register on our site, place an order, subscribe to our newsletter, respond to a survey or fill out a form. When ordering or registering on our site, as appropriate, you may be asked to enter your: name, e-mail address, mailing address, phone number or credit card information. You may, however, visit our application anonymously.What do we use your information for?Any of the information we collect from you may be used in one of the following ways:To personalize your experience Your information helps us to better respond to your individual needs.To improve our application We continually strive to improve our application offerings based on the information and feedback we receive from you.To improve customer service Your information helps us to more effectively respond to your customer service requests and support needs.To process transactions Your information, whether public or private, will not be sold, exchanged, transferred, or given to any other company for any reason whatsoever, without your consent, other than for the express purpose of delivering the purchased product or service requested."),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
