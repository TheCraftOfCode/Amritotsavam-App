import 'package:amritotsavam_app/utils/data.dart';
import 'package:amritotsavam_app/widgets/contact_card.dart';
import 'package:amritotsavam_app/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:amritotsavam_app/utils/constants.dart' as constants;
import 'package:oktoast/oktoast.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _queryController = TextEditingController();

    Future<void> sendEmail() async {
      final Email email = Email(
        body: _queryController.text,
        subject: "Technical Query/Suggestions from ${_nameController.text}",
        recipients: ["amritotsavam@gmail.com"],
        isHTML: false,
      );

      FlutterEmailSender.send(email)
          .then((value) => showToast("Your query has been successfully sent"))
          .onError((error, stackTrace) =>
              showToast("Unable to send your query, please try again later!"));
    }

    return Scaffold(
      body: Container(
        decoration: constants.gradientDecoration,
        height: double.maxFinite,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 70.0, bottom: 20, left: 30),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Contact Us',
                        style: GoogleFonts.nunito(
                            fontSize: 30,
                            color: colors.primaryTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: colors.inactiveCardColor,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Technical Queries',
                                      style: GoogleFonts.nunito(
                                          fontSize: 25,
                                          color: colors.primaryTextColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        controller: _nameController,
                                        style: GoogleFonts.montserrat(
                                            color: colors.primaryTextColor),
                                        validator: (value) {
                                          if (value == "" || value == null) {
                                            return "Please enter your name";
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          label: Text('Name',
                                              style: GoogleFonts.raleway(
                                                  color:
                                                      colors.textBoxTextColor,
                                                  fontSize: 12)),
                                          filled: true,
                                          hintText: 'Enter your name',
                                          hintStyle: GoogleFonts.poppins(
                                              color: colors.primaryTextColor
                                                  .withOpacity(0.7)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          fillColor: colors.textBoxColorLight,
                                          focusColor: colors.textBoxFill,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        controller: _queryController,
                                        style: GoogleFonts.montserrat(
                                            color: colors.primaryTextColor),
                                        validator: (value) {
                                          if (value == "" || value == null) {
                                            return "Please enter your query";
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          label: Text('Query',
                                              style: GoogleFonts.raleway(
                                                  color:
                                                      colors.textBoxTextColor,
                                                  fontSize: 12)),
                                          filled: true,
                                          hintText: 'Enter your query',
                                          hintStyle: GoogleFonts.poppins(
                                              color: colors.primaryTextColor
                                                  .withOpacity(0.7)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          fillColor: colors.textBoxColorLight,
                                          focusColor: colors.textBoxFill,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        )),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            onPrimary: colors.buttonColor,
                                            primary: colors.primaryTextColor),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            sendEmail();
                                          }
                                        },
                                        child: Text(
                                          "SEND",
                                          style: GoogleFonts.nunito(
                                              color: colors.buttonColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 23, top: 30),
                    child: Text(
                      'Designed and Maintained by',
                      style: GoogleFonts.nunito(
                          fontSize: 25,
                          color: colors.primaryTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(child: contactCard(digitalContentTeam[0])),
                  Expanded(child: contactCard(digitalContentTeam[1])),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40, top: 10),
                    child: Center(
                      child: Text(
                        'Contact us for any technical queries',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            fontSize: 18,
                            color: colors.primaryTextColor.withOpacity(0.7),),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
