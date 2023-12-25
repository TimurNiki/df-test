// ignore_for_file: unnecessary_nullable_for_final_variable_declarations, non_constant_identifier_names, unused_local_variable, type_annotate_public_apis
import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:first_project/exceptions/user_registered_exception.dart';
import 'package:first_project/source/user_service.dart';

Future<Response> onRequest(RequestContext context) {
  return switch (context.request.method) {
    HttpMethod.post => _register(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed)),
  };
}

Future<Response> _register(RequestContext context) async {
  try {
    final body = await context.request.json() as Map<String, dynamic>;

    final username = body['userName'] as String?;
    final password = body['password'] as String?;
    final fullName = body['fullName'] as String?;

    if (username == null || password == null || fullName == null) {
      return Response(
        statusCode: HttpStatus.badRequest,
        body: 'username, password and fullName required!',
      );
    }

    await context.read<UserService>().register(
          fullName: fullName,
          username: username,
          password: password,
        );

    return Response(statusCode: HttpStatus.created);
  } on UserRException catch (e) {
    return Response(
      statusCode: HttpStatus.conflict,
      body: e.message,
    );
  } catch (e, s) {
    return Response(
      statusCode: HttpStatus.internalServerError,
      body: '$e => $s',
    );
  }
}
