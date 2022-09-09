import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Screens/COMPONENTS/myComponents.dart';
import '../../../../../../../../{{blocName}}_cud_module/{{blocName}}_cud_logic/{{blocName}}_cud_bloc.dart';
import '{{blocName}}_cud_save_button.dart';
import '{{blocName}}_cud_update_button.dart';

class {{blocName}}_cud_form_widget extends StatelessWidget {
  final singleObj;
  final formKey;
  {{#controllers}} final {{controller}}; {{/controllers}}

  const {{blocName}}_cud_form_widget({
    super.key,
    required this.singleObj,
    required this.formKey,
    {{#controllers}} required this.{{controller}} ,{{/controllers}}
    
  });

  @override
  Widget build(BuildContext context) {
    return formWidget(context);
  }

/* -------------------------------------------------------------------------- */
/*                            //@ Form widget                                 */
/* -------------------------------------------------------------------------- */

  formWidget(context) {
    var dimVar = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                all_textFormFields(context),
                singleObj == null
                    ? {{blocName}}_cud_save_button(
                        formKey: formKey,
                        singleObj: singleObj,
                        {{#controllers}} {{controller}}: {{controller}} ,{{/controllers}}

                      )
                    : {{blocName}}_cud_update_button(
                        formKey: formKey,
                        singleObj: singleObj,
                        {{#controllers}} {{controller}}: {{controller}} ,{{/controllers}}

                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  all_textFormFields(context) {
    var dimVar = MediaQuery.of(context).size;
    return 

     Column(
      mainAxisSize: MainAxisSize.max,
      children: [

        {{#controllers}}
        TextFormField(
          controller: {{controller}},
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '{{controller}} required'; //if empty give error msg here
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Enter {{controller}}", //hint text here
          ),
        ),
        SizedBox(
          height: dimVar.height * 0.04,
        ),

         {{/controllers}}
      ],
    );
   
  }
}
