import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:truth_detector_app/Control/Components/components.dart';
import 'package:truth_detector_app/Control/Components/constants.dart';
import 'package:truth_detector_app/Control/app_localizations.dart';
import 'package:truth_detector_app/Views/Add_Text/Cubit/cubit.dart';
import 'package:truth_detector_app/Views/Add_Text/Cubit/states.dart';
import 'package:truth_detector_app/Views/Add_Text/fact_screen.dart';
import 'package:truth_detector_app/Views/Add_Text/fake_screen.dart';
import 'package:truth_detector_app/Views/methods_screen.dart';
import 'package:truth_detector_app/Views/sidebar_menu.dart';

class AddText extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var textNewsController=TextEditingController();
  var linkNewsController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;

    return BlocProvider(
      create:(BuildContext context) => AddTextCubit(),
      child: BlocConsumer<AddTextCubit,AddTextStates>(
        listener: (context,state) {},
        builder: (context,state)
        {
          return Scaffold(
            backgroundColor: ColorConsts.grey,
            drawer: NavDrawer(),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: ColorConsts.purple,
              title: Text(
                AppLocalizations.of(context).translate("add-text"),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'segoepr',
                  color: ColorConsts.grey,
                ),
              ),
              centerTitle: true,
            ),
            body:SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    ClipPath(
                      clipper: WaveClipperTwo(),
                      child: Container(
                        height: 55,
                        color: ColorConsts.purple,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16,left: 16),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: screenHeight*0.2,
                                  ),
                                  TextFormField(
                                    maxLines: null,
                                    onChanged: (value){},
                                    validator:(String value)
                                    {
                                      if(value.isEmpty){
                                        return AppLocalizations.of(context).translate("enter-news");
                                      }
                                    },
                                    controller: textNewsController,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                        fontFamily: 'segoepr',
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: ColorConsts.darkPurpleWithOpacity,
                                      ),
                                      border: OutlineInputBorder(),
                                      labelText: AppLocalizations.of(context).translate("news"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight*0.162,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 58,
                                        child: OutlinedButton(
                                          child:Text(
                                            AppLocalizations.of(context).translate("back"),
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'segoepr',
                                              color: ColorConsts.darkPurple,
                                            ),
                                          ),
                                          onPressed: ()
                                          {
                                            navigateTo(context, MethodsScreen());
                                          },
                                          style: OutlinedButton.styleFrom(side: BorderSide(color: ColorConsts.purple),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth*0.05,
                                      ),
                                      Container(
                                        width: 150,
                                        height: 58,
                                        child: ConditionalBuilder(
                                          condition: state is! AddTextLoadingState,
                                          builder: (context) => MaterialButton(
                                            child:Text(
                                              AppLocalizations.of(context).translate("verify-news"),
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'segoepr',
                                                color: ColorConsts.grey,
                                              ),
                                            ),
                                            onPressed: ()
                                            {
                                              if(formKey.currentState.validate()){
                                                AddTextCubit.get(context).addNews(
                                                  text:textNewsController.text,
                                                  link: linkNewsController.text,
                                                );
                                              }
                                              if(state is AddTextSuccessState){
                                                if(state.newsModel.label =='fake' || state.newsModel.label=='mostly-false'){
                                                  navigateTo(context, FakeScreen());
                                                }else{
                                                  navigateTo(context, FactScreen());
                                                }
                                              }
                                            },
                                          ),
                                          fallback: (context) => Center(child: CircularProgressIndicator()),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: ColorConsts.purple,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHeight*0.008,
                            ),
                            Image(
                              image: AssetImage('assets/images/footer.png'),
                              fit: BoxFit.cover,
                              width: 360,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}