import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truth_detector_app/Modules/loading_screen.dart';
import 'package:truth_detector_app/Modules/methods_screen.dart';
import 'package:truth_detector_app/Modules/sidebar_menu.dart';
import 'package:truth_detector_app/Shared/Components/colors.dart';
import 'package:truth_detector_app/Shared/Components/components.dart';
import 'package:truth_detector_app/Shared/app_localizations.dart';
import 'package:truth_detector_app/Shared/end_points.dart';
import 'package:http/http.dart' as http;


class CameraScreen extends StatefulWidget {
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File cameraImage;
  var picker = ImagePicker();
  final url = "http://192.168.1.7:5000/predict-image";

  Future<void> getCameraImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (PickedFile != null) {
        cameraImage = File(pickedFile.path);
        print(pickedFile.path);
      } else {
        print( AppLocalizations.of(context).translate("no-image"),);
      }
    });
  }

  uploadCameraImage() async {
    final request = http.MultipartRequest("POST",Uri.parse(url));
    final header = {"Content_type": "multipart/form-data"};
    request.files.add(http.MultipartFile(
      'img',
      cameraImage.readAsBytes().asStream(),
      cameraImage.lengthSync(),
      filename:cameraImage.path.split('/').last ,
    ));
    request.headers.addAll(header);
    final myRequest= await request.send();
    http.Response res= await http.Response.fromStream(myRequest);

    if(myRequest.statusCode == 200){
      final resjson= jsonDecode(res.body);
      print("respinse here:  $resjson");

      data=resjson['label'];
      saveReviewImage= resjson['review'];
      saveLabelImage = resjson['label'];

    }else{
      print("Error ${myRequest.statusCode}");
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorConsts.grey,
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConsts.purple,
        title: Text(
          AppLocalizations.of(context).translate("camera"),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'segoepr',
            color: ColorConsts.grey,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 55,
                color: ColorConsts.purple,
              ),
            ),
            SizedBox(
              height: screenHeight*0.09,
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: 320,
                  height: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorConsts.purple),
                  ),
                  child: cameraImage == null
                      ? Padding(
                    padding: const EdgeInsets.only(
                        top: 130, left: 80),
                    child: Text(
                      AppLocalizations.of(context).translate("no-image"),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'segoepr',
                        color: ColorConsts.darkPurpleWithOpacity,
                      ),
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(
                      cameraImage,
                      height: 300,
                      width: 350,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    getCameraImage();
                  },
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    color: ColorConsts.darkPurpleWithOpacity,
                    size: 24,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight*0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 58,
                  child: OutlinedButton(
                    child: Text(
                      AppLocalizations.of(context).translate("back"),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'segoepr',
                        color:ColorConsts.darkPurple,
                      ),
                    ),
                    onPressed: () {
                      navigateTo(context, MethodsScreen());
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: ColorConsts.purple),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth*0.04,
                ),
                Container(
                  width: 150,
                  height: 58,
                  child: MaterialButton(
                    child: Text(
                      AppLocalizations.of(context).translate("verify-photo"),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'segoepr',
                        color: ColorConsts.grey,
                      ),
                    ),
                    onPressed: ()
                    {
                      uploadCameraImage();
                      navigateTo(context, LoadingScreen());
                    },
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:ColorConsts.purple,
                  ),
                ),
              ],
            ),
            Image(
              image: AssetImage('assets/images/footer.png'),
              fit: BoxFit.cover,
              width: 360,
              height:199,
            ),
          ],
        ),
      ),
    );
  }
}