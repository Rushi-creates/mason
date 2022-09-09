import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../{{blocName}}_cud_bloc.dart';

class {{blocName}}_cud_update_button extends StatelessWidget {
  final singleObj;
  final formKey;
  {{#controllers}} final {{controller}}; {{/controllers}}


  const {{blocName}}_cud_update_button(
      {super.key, required this.formKey, required this.singleObj,
    {{#controllers}} required this.{{controller}} ,{{/controllers}}

      });

  @override
  Widget build(BuildContext context) {
    return updateButton_STATES();
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  updateButton_STATES() {
    return BlocConsumer<{{blocName}}CudBloc, {{blocName}}CudState>(
      listener: (context, state) {
        if (state is {{blocName}}_update_Loaded_State) {
          MyComponents.successSnackBar(context, 'Action completed');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        //default state
        if (state is {{blocName}}CudInitial) {
          return update_Button_ui(context);
        } else if (state is {{blocName}}_update_Loading_State) {
          return customLoading();
        } else if (state is {{blocName}}_update_Error_State) {
          return errorWidget(context, state);
        }

        //! extra states
        else if (state is {{blocName}}_create_Loading_State ||
            state is {{blocName}}_Delete_Loading_state) {
          return Text('Please wait .....');
        }

        // if any other state (which is not mentioned)
        return update_Button_ui(context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ widgets                                */
/* -------------------------------------------------------------------------- */
  update_Button_ui(context) {
    return TextButton(
      child: Text(
        "Update",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
      onPressed: () async => update_FUNC(context),
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
          update_Button_ui(context),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  update_FUNC(context) {
    if (formKey.currentState!.validate()) {
      // create diff obj to update ( with id )or else , to much error

      {{blocName}} modelObjToUpdate = {{blocName}}(
          id: singleObj!.id,
          todo: todoContoller.text,
          description: descriptionController.text);

      BlocProvider.of<{{blocName}}CudBloc>(context).add(
          {{blocName}}_Update_onButtonPressed_Event(modelObjToUpdate, singleObj!.id));
    }
  }
}
