import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '{{blocName}}_cud_event.dart';
part '{{blocName}}_cud_state.dart';

class {{blocName}}CudBloc extends Bloc<{{blocName}}CudEvent, {{blocName}}CudState> {
  {{blocName}}CudBloc() : super({{blocName}}CudInitial()) {
/* -------------------------------------------------------------------------- */
/*                         //@  Dependency injection                          */
/* -------------------------------------------------------------------------- */
    {{blocName}}_Api_Repo {{blocName}}_api_repo = {{blocName}}_Api_Repo();

/* -------------------------------------------------------------------------- */
/*                                 //@ create                                 */
/* -------------------------------------------------------------------------- */
    on<{{blocName}}_create_onButtonPressed_Event>((event, emit) async {
      emit({{blocName}}_create_Loading_State());

      try {
        //# from api repo
        var response = await {{blocName}}_api_repo.create(event.modelObjToAdd);

        // //# from repo (NOTE:  if using GS, dont store response in var)
        // await voo_create_Gs_repo.create_voo(event.modelObjToAdd);

        emit({{blocName}}_create_Loaded_State());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit({{blocName}}_create_Error_State(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                                 //@ update                                 */
/* -------------------------------------------------------------------------- */
    on<{{blocName}}_Update_onButtonPressed_Event>((event, emit) async {
      emit({{blocName}}_update_Loading_State());

      try {
        //# from api repo
        var response =
            await {{blocName}}_api_repo.update(event.modelObjToAdd, event.modelObj_id);

        //# from GS repo (NOTE:  if using GS, dont store response in var)
        // await hoo_update_Gs_repo.update_hoo(
        //     modelObj: event.modelObjToAdd, modelObj_id: event.modelObj_id);

        emit({{blocName}}_update_Loaded_State());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit({{blocName}}_update_Error_State(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                                 //@ delete                                 */
/* -------------------------------------------------------------------------- */
    on<{{blocName}}_Delete_onButtonPressed_Event>((event, emit) async {
      emit({{blocName}}_Delete_Loading_state());

      try {
        //# from api repo
        //! note : api returns string response to delete
        // dont use this stringResponse for logic, just use this to print
        var StringReponse = await {{blocName}}_api_repo.delete(event.modelObj_id);

        //# from Gs repo (NOTE:  if using GS, dont store response in var)
        // await poo_delete_api_repo.delete_poo(event.modelObj_id);

        emit({{blocName}}_Delete_Loaded_state());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit({{blocName}}_Delete_Error_State(storeErr));
      }
    });
  }
}
