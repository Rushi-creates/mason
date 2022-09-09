import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Screens/COMPONENTS/myComponents.dart';

class {{blocName_u}}_fetch_belowList_widget extends StatelessWidget {
  final scrollController;
  final scrollListener;
  const {{blocName_u}}_fetch_belowList_widget({
    super.key,
    required this.scrollController,
    required this.scrollListener,
  });

  @override
  Widget build(BuildContext context) {
    return belowLastTile_STATES();
  }

  /* -------------------------------------------------------------------------- */
/*               //! display error,loading states widgets                     */
/* -------------------------------------------------------------------------- */

  belowLastTile_STATES() {
    return BlocConsumer<{{blocName_u}}FetchBloc, {{blocName_u}}FetchState>(
      listener: (context, state) {
        if (state is {{blocName_u}}_Fetch_More_Loaded_ButEmpty_State) {
          // stop scrollListener, when no more items to fetch(do not dispose)
          scrollController.removeListener(scrollListener);
        } else if (state is {{blocName_u}}_Fetch_Error_State) {
          // this is imp
          // scrollController.addListener(scrollListener);
          MyComponents.errorSnackBar(context, 'Some Network error');
        }
      },
      builder: (context, state) {
        if (state is {{blocName_u}}_Fetch_Loading_State) {
          return customLoadingWidget();
        } else if (state is {{blocName_u}}_Fetch_Error_State) {
          return connectionErrorText(context, state.error);
        } else if (state is {{blocName_u}}_Fetch_More_Loaded_ButEmpty_State) {
          return MyComponents.nothingMoreToLoad();
        }
        return MyComponents.emptyText();

        //@ if you ever want to use button instead of scroll controller
        // loadMoreButton(context);
      },
    );
  }

  connectionErrorText(context, error) {
    return Center(
      child: Row(
        children: [
          Text(
            'Connection error or \n Error: $error',
            style: TextStyle(color: Colors.red),
          ),
          tryAgainButton(context)
        ],
      ),
    );
  }

  tryAgainButton(context) {
    return TextButton(
      child: Text(
        "Try again",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
      onPressed: () {
        BlocProvider.of<{{blocName_u}}FetchBloc>(context).add({{blocName_u}}_Fetch_onInit_Event());
      },
    );
  }

  customLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          MyComponents.buildLoading(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  loadMoreButton(context) {
    return TextButton(
      child: Text(
        "Load more ",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
      onPressed: () {
        BlocProvider.of<{{blocName_u}}FetchBloc>(context).add({{blocName_u}}_Fetch_onInit_Event());
      },
    );
  }
}
