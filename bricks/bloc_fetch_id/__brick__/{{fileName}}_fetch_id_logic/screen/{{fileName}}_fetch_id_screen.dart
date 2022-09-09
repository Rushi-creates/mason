import '../../{{blocName}}_fetch_id_module/{{blocName}}_fetch_id_logic/{{blocName}}_fetch_id_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//to change class name = right click on className> Rename symbol
class {{blocName}}_FetchId_Screen extends StatefulWidget {
  const {{blocName}}_FetchId_Screen({Key? key}) : super(key: key);

  @override
  _{{blocName}}_FetchId_ScreenState createState() => _{{blocName}}_FetchId_ScreenState();
}

class _{{blocName}}_FetchId_ScreenState extends State<{{blocName}}_FetchId_Screen> {
  //# dummy id stored
  int sp_id = 1;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<{{blocName}}FetchIdBloc>(context)
        .add({{blocName}}_FetchById_onButtonPressed_Event(sp_id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: SingleChildScrollView(
        child: Column(
          children: [states_for_fetchSingleById()],
        ),
      ),
    );
  }

  states_for_fetchSingleById() {
    return BlocConsumer<{{blocName}}FetchIdBloc, {{blocName}}FetchIdState>(
      listener: (context, state) {
        if (state is {{blocName}}_FetchById_Error_State) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text('Some Network error'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is {{blocName}}_FetchById_Error_State) {
          return connectionErrorText(state.error);
        } else if (state is {{blocName}}_FetchById_Loading_State) {
          return buildLoading();
        } else if (state is {{blocName}}_FetchById_Loaded_State) {
          return buildFetchObj(state.modelObj);
        }
        return buildLoading();
      },
    );
  }

  buildFetchObj(modelObj) {
    return Center(
      child: Text(modelObj.toString()),
    );
  }

  buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  connectionErrorText(error) {
    return Center(
      child: Text(
        'Connection error or \n Error: $error',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        'Fetch by id', //give here appBar title
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
