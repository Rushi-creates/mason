import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '{{blocName}}_fetch_id_event.dart';
part '{{blocName}}_fetch_id_state.dart';

class {{blocName}}FetchIdBloc extends Bloc<{{blocName}}FetchIdEvent, {{blocName}}FetchIdState> {
  {{blocName}}FetchIdBloc() : super({{blocName}}FetchIdInitial()) {
    /* -------------------------------------------------------------------------- */
/*                             //@ repo class objs                            */
/* -------------------------------------------------------------------------- */
    {{blocName}}_Api_Repo {{blocName}}_Api_Repo = {{blocName}}_Api_Repo();
    // {{blocName}}_Gs_Repo {{blocName}}_Gs_Repo = {{blocName}}_Gs_Repo();

/* -------------------------------------------------------------------------- */
/*                           //@ fetch single by id                           */
/* -------------------------------------------------------------------------- */
    on<{{blocName}}_FetchById_onButtonPressed_Event>((event, emit) async {
      try {
        emit({{blocName}}_FetchById_Loading_State());

        //# from api repo class
        final response = await {{blocName}}_Api_Repo.fetchById(event.id);

        //# from GS repo class  ( uncomment if using gs )
        // final response = await {{blocName}}_Gs_Repo.fetchById_{{blocName}}(event.id);
        emit({{blocName}}_FetchById_Loaded_State(response));

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit({{blocName}}_FetchById_Error_State(storeErr));
      }
    });
  }
}
