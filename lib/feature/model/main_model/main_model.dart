import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:wiet_test_app/feature/service/model/service_model.dart';

@immutable

/// [MainModel] is an abstract class that extends [EquatableMixin] and [ServiceModel]
abstract class MainModel with EquatableMixin, ServiceModel {}
