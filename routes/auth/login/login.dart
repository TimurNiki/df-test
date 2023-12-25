import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:first_project/exceptions/user_does_not_exist.dart';
import 'package:first_project/source/user_service.dart';

Future<Response> onRequest(RequestContext context) {
  return switch (context.request.method) {
    HttpMethod.post => _login(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed)),
  };
}

Future<Response> _login(RequestContext context) async {
  try {
    final body = await context.request.json() as Map<String, dynamic>;

    final username = body['username'] as String?;
    final password = body['password'] as String?;

    if (username == null || password == null) {
      return Response(statusCode: HttpStatus.badRequest);
    }
    final authService = context.read<UserService>();

    final user = await authService.login(
      username: username,
      password: password,
    );

    return Response.json(body: user.toJson());
  } on UserDoesNotExistException catch (e) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: e.message,
    );
  } catch (e, s) {
    return Response(
      statusCode: HttpStatus.internalServerError,
      body: '$e => $s',
    );
  }
}
