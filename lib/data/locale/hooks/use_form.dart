import 'package:ez_validator/main.dart';

class UseForm {
  EzSchema? schemaResolver;

  UseForm({this.schemaResolver});

  Map<String, dynamic> _form = {};

  bool get hasError => result.hasError;
  bool get hasNoError => !hasError;
  Map<String, dynamic> get ref => _form;
  Map<String, dynamic> get data => result.form;
  Map<String, dynamic> get errors => result.errors;

  UseFormResult result = UseFormResult(
    errors: {},
    form: {},
    hasError: false,
  );

  void setDefaultValues(Map<String, dynamic> defaultValues) {
    _form = defaultValues;
    result = UseFormResult(
      errors: {},
      form: _form,
      hasError: false,
    );
  }

  void setLateSchema(EzSchema schema) {
    schemaResolver = schema;
  }

  void register(String name, dynamic value) {
    _form[name] = value;
  }

  void reset() {
    _form = {};
    result = UseFormResult(
      errors: {},
      form: {},
      hasError: false,
    );
  }

  void handleSumbit() {
    result = UseFormResult(
      hasError: (schemaResolver != null &&
          schemaResolver!.validateSync(_form).isNotEmpty),
      errors: schemaResolver == null ? {} : schemaResolver!.validateSync(_form),
      form: _form,
    );
  }
}

class UseFormResult {
  final bool hasError;
  final Map<String, String> errors;
  final Map<String, dynamic> form;

  UseFormResult({
    required this.hasError,
    required this.errors,
    required this.form,
  });

  @override
  String toString() {
    return "$hasError\n$errors\n$form";
  }
}
