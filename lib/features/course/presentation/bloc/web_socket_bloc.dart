import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/services/web_socket_service.dart';

abstract class WebSocketEvent {}

class ConnectEvent extends WebSocketEvent {
  final String? url;
  ConnectEvent({this.url = 'newQuestions'});
}

class DisconnectEvent extends WebSocketEvent {}

class SendMessageEvent extends WebSocketEvent {
  final String message;
  SendMessageEvent(this.message);
}

abstract class WebSocketState {}

class WebSocketInitial extends WebSocketState {}

class WebSocketConnected extends WebSocketState {}

class WebSocketDisconnected extends WebSocketState {}

class MessageReceived extends WebSocketState {
  final String message;
  MessageReceived(this.message);
}

class WebSocketBloc extends Bloc<WebSocketEvent, WebSocketState> {
  final WebSocketDataSource socketDataSource;

  WebSocketBloc({
    required this.socketDataSource,
  }) : super(WebSocketInitial()) {
    on<ConnectEvent>((event, emit) async {
      await socketDataSource.connect(event.url!);
      emit(WebSocketConnected());
    });

    on<DisconnectEvent>((event, emit) async {
      await socketDataSource.disconnect();
      emit(WebSocketDisconnected());
    });

    on<SendMessageEvent>((event, emit) async {
      await socketDataSource.sendMessage(event.message);
    });
  }
}
