part of '{{blocName}}_cud_bloc.dart';

abstract class {{blocName}}CudState extends Equatable {
  const {{blocName}}CudState();

  @override
  List<Object> get props => [];
}

class {{blocName}}CudInitial extends {{blocName}}CudState {}

//! create

class {{blocName}}_create_Loading_State extends {{blocName}}CudState {}

class {{blocName}}_create_Loaded_State extends {{blocName}}CudState {}

class {{blocName}}_create_Error_State extends {{blocName}}CudState {
  final error;
  {{blocName}}_create_Error_State(this.error);
}

//! update

class {{blocName}}_update_Loading_State extends {{blocName}}CudState {}

class {{blocName}}_update_Loaded_State extends {{blocName}}CudState {}

class {{blocName}}_update_Error_State extends {{blocName}}CudState {
  final error;
  {{blocName}}_update_Error_State(this.error);
}

//! delete
class {{blocName}}_Delete_Loading_state extends {{blocName}}CudState {} //loading

class {{blocName}}_Delete_Loaded_state extends {{blocName}}CudState {} //loaded

class {{blocName}}_Delete_Error_State extends {{blocName}}CudState {
  final error;
  {{blocName}}_Delete_Error_State(this.error);
}
