import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../{{blocName}}_cud_bloc.dart';

class {{blocName}}_cud_save_button extends StatelessWidget {
  final singleObj;
  final formKey;
  {{#controllers}} final {{controller}} ;{{/controllers}}

  const {{blocName}}_cud_save_button(
      {super.key, required this.formKey, required this.singleObj,
    {{#controllers}} required this.{{controller}} ,{{/controllers}}

      });

  @override
  Widget build(BuildContext context) {
    return saveButton_STATES();
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  saveButton_STATES() {
    return BlocConsumer<{{blocName}}CudBloc, {{blocName}}CudState>(
      listener: (context, state) {
        if (state is {{blocName}}_create_Loaded_State) {
          MyComponents.successSnackBar(context, 'Action completed');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        //default state
        if (state is {{blocName}}CudInitial) {
          return save_Button_ui(context);
        } else if (state is {{blocName}}_create_Loading_State) {
          return customLoading();
        } else if (state is {{blocName}}_create_Error_State) {
          return errorWidget(context, state);
        }

        //! extra states
        else if (state is {{blocName}}_update_Loading_State ||
            state is {{blocName}}_Delete_Loading_state) {
          return Text('Please wait .....');
        }

        // if any other state (which is not mentioned)
        return save_Button_ui(context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ Widgets                                */
/* -------------------------------------------------------------------------- */

  save_Button_ui(context) {
    return TextButton(
      child: Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
      onPressed: () async => save_FUNC(context),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Static widgets                             */
/* -------------------------------------------------------------------------- */

  customLoading() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.center,

        children: [
          MyComponents.buildLoading(),
          Text('Please wait ...'),
        ],
      ),
    );
  }

  errorWidget(context, state) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error : ${state.error}'),
          save_Button_ui(context),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  save_FUNC(context) {
    if (formKey.currentState!.validate()) {
      // make model obj here to add
      {{blocName}} modelObjToAdd = {{blocName}}(
          todo: todoContoller.text, description: descriptionController.text);

      //
      BlocProvider.of<{{blocName}}CudBloc>(context)
          .add({{blocName}}_create_onButtonPressed_Event(modelObjToAdd));
    }
  }
}
