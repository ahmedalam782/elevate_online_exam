import 'package:elevate_online_exam/features/explore/data/models/subjects_model/subjects_model.dart';

import '../../data/models/subjects_model/subject.dart';

import 'package:equatable/equatable.dart';

class SubjectEntities extends Equatable {
  final String name;
  final String icon;
  final String id;

  const SubjectEntities({required this.name, required this.icon, required this.id});

  SubjectEntities copyWith({String? name, String? icon, String? id}) {
    return SubjectEntities(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      id: id ?? this.id,
    );
  }

  SubjectsModel toModel() {
    return SubjectsModel(
      subjects: [Subject(name: name, icon: icon, id: id)],
    );
  }

  @override
  List<Object?> get props => [name, icon, id];
}
