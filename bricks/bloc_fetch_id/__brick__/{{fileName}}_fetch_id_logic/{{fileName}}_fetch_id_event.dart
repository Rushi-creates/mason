part of '{{blocName}}_fetch_id_bloc.dart';

abstract class {{blocName}}FetchIdEvent extends Equatable {
  const {{blocName}}FetchIdEvent();

  @override
  List<Object> get props => [];
}

class {{blocName}}_FetchById_onButtonPressed_Event extends {{blocName}}FetchIdEvent {
  final id;

  {{blocName}}_FetchById_onButtonPressed_Event(this.id);
}
