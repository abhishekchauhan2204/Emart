import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/consts/profile%20list.dart';
import 'package:emart/views/Auth_screen/login_screen.dart';
import 'package:emart/views/profile%20screen/editbuttonprofile.dart';
import 'package:emart/widgets_common/bg_widgets.dart';

class profile extends StatefulWidget {
  final void Function(int) updateIndex; // Callback function to update index
  const profile({Key? key, required this.updateIndex}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final String imga = "assets/images/a.png";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: bgwidget(
            child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              child: Column(children: [
                //Edit icon widget
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                      height: 40,
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width,
                      child: IconButton(
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => editbuttonprofile(),));},
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 20,
                          ))),
                ),
                // row of user profile
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    child: Row(children: [
                      GestureDetector(
                        onTap: () {
                          // Handle zooming of the profile picture here
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ZoomedProfilePicture(imagePath: imga),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage(imga),
                          radius: 38,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              profilelist.length,
                              (index) => Text(
                                    profilelist[index],
                                    style: index == 0
                                        ? tb25()
                                        : TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                  ))),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => signin(),
                                    ));
                              },
                              icon: Icon(Icons.logout)),
                        ),
                      )
                    ]),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                // cart button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: GridView.builder(
                      itemCount: 3,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 70,
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "00",
                                  style: tb25(),
                                ),
                                Text(profilesection[index])
                              ]),
                        );
                      },
                    ),
                  ),
                ),
                //
                SizedBox(
                  height: 30,
                ),
                // list
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            height: MediaQuery.of(context).size.height / 16,
                            child: Row(
                              children: [
                                Image.asset(
                                  height: 25,
                                  profileicon[index],
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  profilelisticon[index],
                                  style: tb25(),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: 3),
                  ),
                )
              ]),
            ),
          ),
        )));
  }
}

class ZoomedProfilePicture extends StatelessWidget {
  final String imagePath;

  ZoomedProfilePicture({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color for zoomed image
      body: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pop(); // Pop the route to go back when tapping outside the image
        },
        child: Center(
          child: Hero(
            tag: 'profile_picture', // Unique tag for Hero animation
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain, // Ensure the image fits inside the screen
            ),
          ),
        ),
      ),
    );
  }
}
