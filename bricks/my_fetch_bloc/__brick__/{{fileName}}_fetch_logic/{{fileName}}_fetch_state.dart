part of '{{fileName}}_fetch_bloc.dart';

abstract class {{blocName_u}}FetchState extends Equatable {
  const {{blocName_u}}FetchState();

  @override
  List<Object> get props => [];
}

class {{blocName_u}}FetchInitial extends {{blocName_u}}FetchState {}

class {{blocName_u}}_Fetch_Loading_State extends {{blocName_u}}FetchState {
  final prevList;
  {{blocName_u}}_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

class {{blocName_u}}_Fetch_Loaded_State extends {{blocName_u}}FetchState {
  final modelObjList;
  {{blocName_u}}_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class {{blocName_u}}_Fetch_Error_State extends {{blocName_u}}FetchState {
  final error;
  final prevList;

  {{blocName_u}}_Fetch_Error_State(this.error, this.prevList);

  @override
  List<Object> get props => [error, prevList];
}

class {{blocName_u}}_Fetch_More_Loaded_ButEmpty_State extends {{blocName_u}}FetchState {
  final prevList;
  {{blocName_u}}_Fetch_More_Loaded_ButEmpty_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}
