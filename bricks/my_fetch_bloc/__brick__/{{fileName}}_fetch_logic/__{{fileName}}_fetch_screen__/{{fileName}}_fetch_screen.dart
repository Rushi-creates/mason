import '{{fileName}}_fetch_fetchList/{{fileName}}_fetch_belowList_widget.dart';
import '{{fileName}}_fetch_fetchList/{{fileName}}_fetch_fetchList_widget.dart';

import '../../../Features/Xoo_fetch_logic/Xoo_fetch_bloc.dart';
import '../../../Features/Joo_cud_logic/Joo_cud_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class {{blocName_u}}_Fetch_Screen extends StatefulWidget {
  const {{blocName_u}}_Fetch_Screen({Key? key}) : super(key: key);

  @override
  _{{blocName_u}}_Fetch_ScreenState createState() => _{{blocName_u}}_Fetch_ScreenState();
}

/* -------------------------------------------------------------------------- */
/*                               //! State class                              */
/* -------------------------------------------------------------------------- */

class _{{blocName_u}}_Fetch_ScreenState extends State<{{blocName_u}}_Fetch_Screen> {
  final ScrollController scrollController = ScrollController();

/* -------------------------------------------------------------------------- */
/*                            //! lifecycle methods                           */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();

    //# a scroll listner which listens always
    scrollController.addListener(scrollListener);

    //# to call first set of pages
    BlocProvider.of<{{blocName_u}}FetchBloc>(context).add({{blocName_u}}_Fetch_onInit_Event());
  }

  @override
  void dispose() {
    scrollController.dispose();
    print('scroll controller disposed');
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      print('list endedddd');
      Future.delayed(Duration(milliseconds: 100), () {
        BlocProvider.of<{{blocName_u}}FetchBloc>(context).add({{blocName_u}}_Fetch_onInit_Event());
      });
    }
  }

/* -------------------------------------------------------------------------- */
/*                              //! Build method                              */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody_STATES(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! body structure                             */
/* -------------------------------------------------------------------------- */

  myBody_STATES() {
    return BlocConsumer<JooCudBloc, JooCudState>(
      listener: (context, state) {
        if (state is Joo_create_Loaded_State ||
            state is Joo_update_Loaded_State ||
            state is Joo_Delete_Loaded_state) {
          onRefreshFunc();
        }
      },
      builder: (context, state) {
        return myBody();
      },
    );
  }

  myBody() {
    return RefreshIndicator(
      onRefresh: () async {
        print('Refreshed');
        onRefreshFunc();
      },
      child: SingleChildScrollView(
        //! note : make sure to pass controller in this list
        controller: scrollController,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // fetch list
              {{blocName_u}}_fetch_fetchList_widget(),

              // below fetch list
              {{blocName_u}}_fetch_belowList_widget(
                scrollController: scrollController,
                scrollListener: scrollListener,
              ),

              //
            ]),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                           //# Scaffold widgets                             */
/* -------------------------------------------------------------------------- */

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        'Home',
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/Home');
              },
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              )),
        )
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: IconButton(
        //       onPressed: () {
        //         onRefreshFunc()
        //       },
        //       icon: Icon(
        //         Icons.refresh,
        //         color: Colors.black,
        //       )),
        // )
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                         //# Sttic Helper functions                         */
/* -------------------------------------------------------------------------- */

  onRefreshFunc() {
    BlocProvider.of<{{blocName_u}}FetchBloc>(context).add({{blocName_u}}_Fetch_onRefresh_Event());
    BlocProvider.of<{{blocName_u}}FetchBloc>(context).add({{blocName_u}}_Fetch_onInit_Event());
    scrollController.addListener(scrollListener);
  }
}
