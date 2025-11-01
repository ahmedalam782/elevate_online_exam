import 'package:flutter/material.dart';

sealed class ForgetPasswordEvents {}

final class ObscureTextChangedEvent extends ForgetPasswordEvents {
  final String fieldKey;
  ObscureTextChangedEvent(this.fieldKey);
}

final class PageChangedEvent extends ForgetPasswordEvents {
  final int currentPage;
  PageChangedEvent(this.currentPage);
}

final class FormValidChangedEvent extends ForgetPasswordEvents {
  final GlobalKey<FormState> formKey;
  FormValidChangedEvent(this.formKey);
}

final class NextPageEvent extends ForgetPasswordEvents {}



