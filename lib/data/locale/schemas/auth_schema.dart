import 'package:ez_validator/main.dart';

EzSchema loginSchema = EzSchema.shape({
  "email": EzValidator().required().email().build(),
  "paswword": EzValidator().required().matches(r'^[a-zA-Z0-9]{3,30}$').build(),
  "username": EzValidator().required().minLength(5).maxLength(15).build(),
  "birth_year": EzValidator().required().min(1999).max(2005).build()
});

EzSchema signupSchema(String password) => EzSchema.shape({
      "email": EzValidator().required().email().build(),
      "password":
          EzValidator().required().matches(r'^[a-zA-Z0-9]{3,30}$').build(),
      "passwordConfirmation": EzValidator()
          .required()
          .oneOf([password], 'Passwords do not much').build(),
      "username": EzValidator().required().minLength(5).maxLength(15).build(),
    });
