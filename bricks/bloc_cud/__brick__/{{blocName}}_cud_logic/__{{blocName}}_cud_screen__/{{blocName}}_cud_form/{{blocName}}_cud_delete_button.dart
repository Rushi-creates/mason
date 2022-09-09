import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../{{blocName}}_cud_bloc.dart';

class {{blocName}}_cud_delete_button extends StatelessWidget {
  final singleObj;
  // {{#controllers}} final {{controller}} ;{{/controllers}}


  const {{blocName}}_cud_delete_button({super.key, required this.singleObj,
    // {{#controllers}} required this.{{controller}} ,{{/controllers}}

  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: deleteButton_STATES(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  deleteButton_STATES() {
    return BlocConsumer<{{blocName}}CudBloc, {{blocName}}CudState>(
      listener: (context, state) {
        if (state is {{blocName}}_Delete_Loaded_state) {
          MyComponents.successSnackBar(context, 'Action completed');
          Navigator.pop(context);
        } else if (state is {{blocName}}_Delete_Error_State) {
          MyComponents.errorSnackBar(
            context,
            "Some error!, couldn't complete action \n Error: ${state.error}",
          );
        }
      },
      builder: (context, state) {
        //default state
        if (state is {{blocName}}CudInitial) {
          return deleteButton_Ui(context);
        } else if (state is {{blocName}}_Delete_Loading_state) {
          return MyComponents.buildLoading();
        } else if (state is {{blocName}}_Delete_Error_State) {
          return deleteButton_Ui(context);
        }

        //! extra states
        else if (state is {{blocName}}_create_Loading_State ||
            state is {{blocName}}_update_Loading_State) {
          return Text('Please wait..');
        }

        // if any other state (which is not mentioned)
        return deleteButton_Ui(context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ widgets                                */
/* -------------------------------------------------------------------------- */

  deleteButton_Ui(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
      child: TextButton(
        child: Row(
          children: [
            Text(
              "DELETE",
              style: TextStyle(
                color: Colors.red[300],
                fontSize: 12,
              ),
            ),
            Icon(
              Icons.delete,
              color: Colors.red[300],
            )
          ],
        ),
        onPressed: () => deleteButton_FUNC(context),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Static widgets                             */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  deleteButton_FUNC(context) {
    //# Delete bloc, ( pass widget.single.id as ID )
    BlocProvider.of<{{blocName}}CudBloc>(context)
        .add({{blocName}}_Delete_onButtonPressed_Event(singleObj!.id));
  }
}
