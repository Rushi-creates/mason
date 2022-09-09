import '../../Data/Exceptions/Exceptions.dart';
import '../../Repositories/Queues/Queues_api_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

part '{{fileName}}_fetch_event.dart';
part '{{fileName}}_fetch_state.dart';

class {{blocName_u}}FetchBloc extends Bloc<{{blocName_u}}FetchEvent, {{blocName_u}}FetchState> {
  int newCounter = 0;
  List newList = [];

  {{blocName_u}}FetchBloc() : super({{blocName_u}}FetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */
    Queues_Api_Repo queues_Api_Repo = Queues_Api_Repo();

/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/* -------------------------------------------------------------------------- */

    on<{{blocName_u}}_Fetch_onInit_Event>((event, emit) async {
      try {
        emit({{blocName_u}}_Fetch_Loading_State(newList));

        //# incr counter
        newCounter++;

        //# calling api
        //TODO : select one ( fetch all or fetch prop)
        final List moreFetchedList =
            await queues_Api_Repo.fetchprop(newCounter);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        //# if nothing more is to fetch
        if (moreFetchedList.isEmpty) {
          emit({{blocName_u}}_Fetch_More_Loaded_ButEmpty_State(newList));

          //# adding more fetched to final list
        } else if (moreFetchedList.isNotEmpty) {
          newList.addAll(moreFetchedList);

          //# always send final list here
          emit({{blocName_u}}_Fetch_Loaded_State(newList));
        }

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit({{blocName_u}}_Fetch_Error_State(storeErr, newList));
      }
    });

    on<{{blocName_u}}_Fetch_onRefresh_Event>((event, emit) async {
      newCounter = 0;
      newList.clear();
    });
  }
}
