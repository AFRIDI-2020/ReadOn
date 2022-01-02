import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:read_on/controller/public_controller.dart';
import 'package:read_on/controller/user_controller.dart';
import 'package:read_on/eBook/ebook_screens/edit_profile.dart';
import 'package:read_on/eBook/ebook_widgets/custom_appbar.dart';
import 'package:read_on/public_variables/style_variable.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNoController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  TextEditingController _institutionController = TextEditingController();
  TextEditingController _classController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _guardianMobileNoController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  int _count = 0;
  bool _textFieldEnability = false;

  void _customInit(UserController userController) async {
    _count++;
    fillUserInfo(userController);
  }

  void fillUserInfo(UserController userController) {
    setState(() {
      _nameController.text =
          userController.userLoginModel.value.userInfo![0].name!;
      _emailController.text =
          userController.userLoginModel.value.userInfo![0].email!;
      _mobileNoController.text =
          userController.userLoginModel.value.userInfo![0].phone!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final PublicController publicController = Get.find();
    final UserController userController = Get.find();
    double size = publicController.size.value;
    if (_count == 0) _customInit(userController);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: AppBar().preferredSize,
            child: _pageAppBar(size, publicController)),
        body: _bodyUI(size),
      ),
    );
  }

  Widget _bodyUI(double size) => Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: size,
                height: size * .42,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -size * .62,
                      left: -size * .2,
                      child: Container(
                        width: size,
                        height: size,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffEAEAEA),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -size * .1,
                      left: size * .33,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: size * .012)),

                            /// profile image
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: size * .15,
                              backgroundImage: const NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnELq88FqJJ3fRj93adsIGYvhO-TiVlgimVQ&usqp=CAU'),
                            ),
                          ),
                          Positioned(
                            top: size * .05,
                            right: -size * .02,
                            child: Image.asset('assets/demo_badge.png',
                                height: size * .08, width: size * .08),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size * .15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size * .06),
                child: _customTextFormField(size, _nameController, 'নাম'),
              ),
              SizedBox(
                height: size * .04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size * .06),
                child: _customTextFormField(size, _emailController, 'ইমেইল'),
              ),
              SizedBox(
                height: size * .04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size * .06),
                child:
                    _customTextFormField(size, _mobileNoController, 'মোবাইল'),
              ),
              SizedBox(
                height: size * .04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size * .06),
                child: _customTextFormField(size, _birthDateController, 'জন্ম'),
              ),
              SizedBox(
                height: size * .04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size * .06),
                child: _customTextFormField(
                    size, _birthDateController, 'স্কুল/কলেজ/বিশ্ববিদ্যালয়'),
              ),
              SizedBox(
                height: size * .04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size * .06),
                child: _customTextFormField(size, _classController, 'শ্রেণি'),
              ),
              SizedBox(
                height: size * .04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size * .06),
                child: _customTextFormField(
                    size, _subjectController, 'বিভাগ/বিষয়'),
              ),
              SizedBox(
                height: size * .04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size * .06),
                child: _customTextFormField(size, _guardianMobileNoController,
                    'অভিভাবকের মোবাইল নম্বর'),
              ),
              SizedBox(
                height: size * .04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size * .06),
                child: _customTextFormField(size, _genderController, 'লিঙ্গ'),
              ),
              SizedBox(
                height: size * .15,
              ),
            ],
          ),
        ),
      );

  CustomAppBar _pageAppBar(double size, PublicController publicController) =>
      CustomAppBar(
        title: "প্রোফাইল",
        iconData: LineAwesomeIcons.arrow_left,
        action: [
          InkWell(
              onTap: () {
                Get.to(() => EditProfile());
              },
              child: const Icon(
                FontAwesomeIcons.pencilAlt,
                color: Colors.white,
              ))
        ],
        scaffoldKey: _scaffoldKey,
      );

  /// profile info field demo
  Widget _customTextFormField(
          double size, TextEditingController controller, String hintText) =>
      Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              enabled: _textFieldEnability,
              style: Style.bodyTextStyle(
                  size * .045, Colors.black, FontWeight.normal),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: size * .02, horizontal: size * .04),
                labelText: hintText,
                labelStyle: Style.bodyTextStyle(
                    size * .04, const Color(0xff7F7F7F), FontWeight.normal),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(size * .03),
                    borderSide: const BorderSide(color: Colors.black)),
              ),
            ),
          ),
        ],
      );
}
