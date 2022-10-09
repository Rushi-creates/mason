import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue_fbstream/Image_picker_stub/image_picker_logic/image_picker_bloc.dart';

//to change class name = right click on className> Rename symbol
class PickSingleImage_Screen extends StatefulWidget {
  const PickSingleImage_Screen({Key? key}) : super(key: key);

  @override
  _PickSingleImage_ScreenState createState() => _PickSingleImage_ScreenState();
}

class _PickSingleImage_ScreenState extends State<PickSingleImage_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Colors.white70,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody(),
    );
  }

  myBody() {
    return SafeArea(
        child: Container(
      child: Center(child: pickImageCard()),
    ));
  }

  pickImageCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text(
                  "Pick Image",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
                onPressed: () {
                  pickOption_Dialog();
                },
              ),
              displaImage()
            ],
          ),
        ),
      ),
    );
  }

  displaImage() {
    return BlocBuilder<ImagePickerBloc, ImagePickerState>(
      builder: (context, state) {
        if (state is SingleGalleryImage_noImagePicked_state) {
          return Text('No image was picked');
        } else if (state is SingleGalleryImage_pickingError_state) {
          return Text('Error : couldn\'t pick image');
        } else if (state is SingleGalleryImage_picked_state) {
          return Card(
            child: Image.file(state.pickedImage, width: 60, height: 60),
          );
        } else if (state is SingleCameraImage_noImagePicked_state) {
          return Text('No image was captured');
        } else if (state is SingleCameraImage_pickingError_state) {
          return Text('Error : couldn\'t capture image');
        } else if (state is SingleCameraImage_picked_state) {
          return Card(
            child: Image.file(state.capturedImage, width: 60, height: 60),
          );
        }
        return Text('No image selected');
      },
    );
  }

  pickOption_Dialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Select one option:'),
            children: [
              SimpleDialogOption(
                child: Text('Select from gallery'),
                onPressed: () {
                  BlocProvider.of<ImagePickerBloc>(context)
                      .add(PickGallery_SingleImage_Event());
                  Navigator.pop(context);
                },
              ),
              Divider(),

              //
              SimpleDialogOption(
                child: Text('Capture with Camera'),
                onPressed: () {
                  Navigator.pop(context);

                  BlocProvider.of<ImagePickerBloc>(context)
                      .add(CaptureCamera_singleImage_Event());
                },
              ),
              Divider(),

              //
              SimpleDialogOption(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      //leading: IconButton(
      //  icon: Icon(
      //   Icons.arrow_back,
      //   color: Colors.black,
      //   ),
      //   onPressed: (){
      //       Navigator.pop(context);
      //   }
      // ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        'Home', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      //actions: [

      //  Padding(
      //    padding: const EdgeInsets.all(8.0),
      //   child: IconButton(
      //       onPressed: null,
      //       icon: Icon(
      //         Icons.search,
      //         color: Colors.black,
      //       )), )
      // ],
    );
  }
}
