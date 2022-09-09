import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'myComponents.dart';
import '{{blocName_u}}_fetch_fetchList/{{blocName_u}}_fetch_listTile_widget.dart';

class {{blocName_u}}_fetch_fetchList_widget extends StatelessWidget {
  const {{blocName_u}}_fetch_fetchList_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return fetchListStates();
  }

  /* -------------------------------------------------------------------------- */
/*                           //! fetch list states                            */
/* -------------------------------------------------------------------------- */

  fetchListStates() {
    return BlocBuilder<{{blocName_u}}FetchBloc, {{blocName_u}}FetchState>(builder: (context, state) {
      if (state is {{blocName_u}}_Fetch_Loaded_State) {
        return buildFetchList(state.modelObjList);
      } else if (state is {{blocName_u}}_Fetch_More_Loaded_ButEmpty_State) {
        return buildFetchList(state.prevList);
      } else if (state is {{blocName_u}}_Fetch_Loading_State) {
        return buildFetchList(state.prevList);
      } else if (state is {{blocName_u}}_Fetch_Error_State) {
        return buildFetchList(state.prevList);
      }

      return buildFetchList([]);
    });
  }

/* -------------------------------------------------------------------------- */
/*                 //! if loaded then build fetchList                         */
/* -------------------------------------------------------------------------- */

  buildFetchList(List listArg) {
    return listArg.isEmpty
        ? MyComponents.showFetchListEmptyMsg()
        : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: listArg.length,
            itemBuilder: (context, i) {
              return {{blocName_u}}_fetch_listTile_widget(singleObj: listArg[i]);
            },
          );
  }
}
