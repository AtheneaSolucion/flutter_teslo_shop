import 'package:formz/formz.dart';

// Define input validation errors
enum PriceError { empty, value, format }

// Extend FormzInput and provide the input type and error type.
class Price extends FormzInput<double, PriceError> {
  // Call super.pure to represent an unmodified form input.
  const Price.pure() : super.pure(0.0);

  //  const Email.dirty(String value) : super.dirty(value);
  const Price.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PriceError.empty) return 'El campo es requerido';
    if (displayError == PriceError.value) {
      return 'Tiene que ser mayor o igual a 0.0';
    }
    if (displayError == PriceError.format) {
      return 'Tiene formato de numerico';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PriceError? validator(double value) {
    if (value.toString().isEmpty || value.toString().trim().isEmpty) {
      return PriceError.empty;
    }
    final isDouble = double.tryParse(value.toString()) ?? -1;
    if (isDouble == -1) return PriceError.format;

    if (value < 0) return PriceError.value;

    return null;
  }
}
