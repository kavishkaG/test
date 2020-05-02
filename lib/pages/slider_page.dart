import 'package:flutter/material.dart';
import 'package:carousel_widget/carousel_widget.dart';
import 'package:mymcqapp/pages/login_page.dart';

class SliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeData();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Carousel(
          listViews: [
            Fragment(
              child: getScreen(0, context),
            ),
            Fragment(
              child: getScreen(1, context),
            ),
            Fragment(
              child: getScreen(2, context),
            )
          ],
        ));
  }

  Widget getScreen(index, BuildContext context) {
    void _goToLogin() {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }

    print(titles.elementAt(index));
    return ListView(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Image.asset(
            imagenames.elementAt(index),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Text(
            titles.elementAt(index),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.05),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.17,
          child: Text(
            description.elementAt(index),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            height: MediaQuery.of(context).size.height * 0.08,
            child: MaterialButton(
                height: MediaQuery.of(context).size.height * 0.1,
                minWidth: MediaQuery.of(context).size.width * 0.75,
                color: Colors.lightBlue,
                splashColor: Colors.lightBlue,
                textColor: Colors.white,
                child: Text("Get Started",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                    )),
                onPressed: () {
                  _goToLogin();
                }))
      ],
    );
  }

  List<String> titles = List();
  List<String> description = List();
  List<String> imagenames = List();

  void initializeData() {
    titles.add("Title of First Screen");
    description.add(
        "If in your case you want entirely different screens in carousel than write separate function to design separate screen with different components and layout");
    imagenames.add("assets/slider/book.jpg");

    titles.add("Title of Second Screen");
    description.add(
        "If in your case you want entirely different screens in carousel than write separate function to design separate screen with different components and layout");
    imagenames.add("assets/slider/read.jpg");

    titles.add("Title of Third Screen");
    description.add(
        "If in your case you want entirely different screens in carousel than write separate function to design separate screen with different components and layout");
    imagenames.add("assets/slider/teacher.jpg");
  }
}
