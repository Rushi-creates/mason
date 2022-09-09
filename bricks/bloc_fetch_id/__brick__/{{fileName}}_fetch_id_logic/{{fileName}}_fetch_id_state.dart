part of '{{blocName}}_fetch_id_bloc.dart';

abstract class {{blocName}}FetchIdState extends Equatable {
  const {{blocName}}FetchIdState();

  @override
  List<Object> get props => [];
}

class {{blocName}}FetchIdInitial extends {{blocName}}FetchIdState {}

class {{blocName}}_FetchById_Loading_State extends {{blocName}}FetchIdState {}

class {{blocName}}_FetchById_Loaded_State extends {{blocName}}FetchIdState {
  final modelObj;
  {{blocName}}_FetchById_Loaded_State(this.modelObj);
}

class {{blocName}}_FetchById_Error_State extends {{blocName}}FetchIdState {
  final error;
  {{blocName}}_FetchById_Error_State(this.error);
}
