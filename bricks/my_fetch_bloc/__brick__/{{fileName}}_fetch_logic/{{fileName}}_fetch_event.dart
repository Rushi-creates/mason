part of '{{fileName}}_fetch_bloc.dart';

abstract class {{blocName_u}}FetchEvent extends Equatable {
  const {{blocName_u}}FetchEvent();

  @override
  List<Object> get props => [];
}

class {{blocName_u}}_Fetch_onInit_Event extends {{blocName_u}}FetchEvent {}

class {{blocName_u}}_Fetch_onRefresh_Event extends {{blocName_u}}FetchEvent {}
