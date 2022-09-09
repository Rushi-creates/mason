part of '{{blocName}}_cud_bloc.dart';

abstract class {{blocName}}CudEvent extends Equatable {
  const {{blocName}}CudEvent();

  @override
  List<Object> get props => [];
}

//! create

class {{blocName}}_create_onButtonPressed_Event extends {{blocName}}CudEvent {
  final modelObjToAdd;
  {{blocName}}_create_onButtonPressed_Event(this.modelObjToAdd);
}

//!  update
class {{blocName}}_Update_onButtonPressed_Event extends {{blocName}}CudEvent {
  final modelObjToAdd;
  final modelObj_id;
  {{blocName}}_Update_onButtonPressed_Event(this.modelObjToAdd, this.modelObj_id);
}

//!  delete
class {{blocName}}_Delete_onButtonPressed_Event extends {{blocName}}CudEvent {
  final modelObj_id;
  {{blocName}}_Delete_onButtonPressed_Event(this.modelObj_id);
}
