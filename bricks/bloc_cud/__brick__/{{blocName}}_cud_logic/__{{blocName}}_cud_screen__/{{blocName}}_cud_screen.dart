import 'package:flutter/material.dart';
import '../../../../../old/new_cud/{{blocName}}_cud_form/{{blocName}}_cud_delete_button.dart';
import '../../../../../old/new_cud/{{blocName}}_cud_form/{{blocName}}_cud_form_widget.dart';

/* -------------------------------------------------------------------------- */
/*                               //@ Stateful                                 */
/* -------------------------------------------------------------------------- */

class {{blocName}}_cud_screen extends StatefulWidget {
  final singleObj;

  {{blocName}}_cud_screen({this.singleObj});
  {{blocName}}_cud_screen.named(this.singleObj);

  @override
  _{{blocName}}_cud_screenState createState() => _{{blocName}}_cud_screenState();
}

/* -------------------------------------------------------------------------- */
/*                               //@ State class                              */
/* -------------------------------------------------------------------------- */

class _{{blocName}}_cud_screenState extends State<{{blocName}}_cud_screen> {
  //* Declaration
  final formKey1 = GlobalKey<FormState>();

/* -------------------------------------------------------------------------- */
/*                             //@ Controllers                                */
/* -------------------------------------------------------------------------- */

  // create controllers here

  {{#controllers}} TextEditingController {{controller}} = TextEditingController();{{/controllers}}
  
  

/* -------------------------------------------------------------------------- */
/*                           //! Life cycle methods                           */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
    if (widget.singleObj == null) {
      //pass all the controllers here
      {{#controllers}} {{controller}}.text ; {{/controllers}}


    } else {
      // assign controller to model props
      // desController.text = widget.singleObj!.propName;
      /(make sure model propName is proper)
      {{#controllers}} {{controller}}.text = widget.singleObj!.{{controller}}; {{/controllers}}
    }
  }

/* -------------------------------------------------------------------------- */
/*                            //!  Build                                      */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: myHeader(),
        body: myBody());
  }

/* -------------------------------------------------------------------------- */
/*                              //@ Widgets here                              */
/* -------------------------------------------------------------------------- */

  myBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          {{blocName}}_cud_form_widget(
            singleObj: widget.singleObj,
            formKey: formKey1,
            {{#controllers}} {{controller}}: {{controller}} ,{{/controllers}}
            
            ),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                  // appbar                                 */
/* -------------------------------------------------------------------------- */

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
        },
      ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        widget.singleObj != null ? "Update" : "Create", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      actions: [
        //! Delete button
        widget.singleObj != null
            ? {{blocName}}_cud_delete_button(
                singleObj: widget.singleObj,
                // {{#controllers}} {{controller}}: {{controller}} ,{{/controllers}}

              )
            : Text('')
      ],
    );
  }
}
