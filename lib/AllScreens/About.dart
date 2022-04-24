import 'package:flutter/material.dart';

// ignore: must_be_immutable
class About extends StatelessWidget {
  static const String idScreen = "about";
  // TextEditingController emailTextEditingController = TextEditingController();
  // TextEditingController passwordTextEditingController = TextEditingController();
  // FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 220,
                ),
                Image(
                  image: AssetImage("images/a.png"),
                  width: 100.0,
                  height: 100.0,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  "About",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins-Regular"),
                  textAlign: TextAlign.center,
                ),
                Text("""
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).""",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins-Regular"),
                        textAlign: TextAlign.center,),
                // Padding(
                //   padding: EdgeInsets.all(20),
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         height: 1,
                //       ),
                //       TextField(
                //         controller: emailTextEditingController,
                //         keyboardType: TextInputType.emailAddress,
                //         decoration: InputDecoration(
                //           labelText: "Email",
                //           labelStyle: TextStyle(
                //             fontSize: 14,
                //           ),
                //           hintStyle: TextStyle(
                //             color: Colors.grey,
                //             fontSize: 10,
                //           ),
                //         ),
                //         style: TextStyle(
                //           fontSize: 14,
                //         ),
                //       ),
                //       SizedBox(
                //         height: 1,
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       // ignore: deprecated_member_use
                //       RaisedButton(
                //         color: Colors.blue,
                //         textColor: Colors.white,
                //         child: Container(
                //           height: 50,
                //           child: Center(
                //             child: Text(
                //               "Send Request",
                //               style: TextStyle(
                //                   fontSize: 20, fontFamily: "Poppins-Regular"),
                //             ),
                //           ),
                //         ),
                //         shape: new RoundedRectangleBorder(
                //           borderRadius: new BorderRadius.circular(24),
                //         ),
                //         onPressed: () {
                //           if (!emailTextEditingController.text.contains("@")) {
                //             displayToastMessage("Invalid Email", context);
                //           } else {
                //             auth.sendPasswordResetEmail(
                //                 email: emailTextEditingController.text);
                //             displayToastMessage("Email has been sent", context);
                //             print(emailTextEditingController.text);
                //             Navigator.pushNamedAndRemoveUntil(context,
                //                 LoginScreen.idScreen, (route) => false);
                //           }
                //         },
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
