// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_repeat.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ExerciseRepeat extends _ExerciseRepeat
    with RealmEntity, RealmObjectBase, RealmObject {
  ExerciseRepeat(
    String id,
    int sort,
    DateTime date,
    String workoutId,
    String exerciseId,
    String exerciseType, {
    int? weight,
    int? reps,
    double? distance,
    int? duration,
    int? stretchDuration,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'sort', sort);
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set(this, 'workoutId', workoutId);
    RealmObjectBase.set(this, 'exerciseId', exerciseId);
    RealmObjectBase.set(this, 'exerciseType', exerciseType);
    RealmObjectBase.set(this, 'weight', weight);
    RealmObjectBase.set(this, 'reps', reps);
    RealmObjectBase.set(this, 'distance', distance);
    RealmObjectBase.set(this, 'duration', duration);
    RealmObjectBase.set(this, 'stretchDuration', stretchDuration);
  }

  ExerciseRepeat._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  int get sort => RealmObjectBase.get<int>(this, 'sort') as int;
  @override
  set sort(int value) => RealmObjectBase.set(this, 'sort', value);

  @override
  DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
  @override
  set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

  @override
  String get workoutId =>
      RealmObjectBase.get<String>(this, 'workoutId') as String;
  @override
  set workoutId(String value) => RealmObjectBase.set(this, 'workoutId', value);

  @override
  String get exerciseId =>
      RealmObjectBase.get<String>(this, 'exerciseId') as String;
  @override
  set exerciseId(String value) =>
      RealmObjectBase.set(this, 'exerciseId', value);

  @override
  String get exerciseType =>
      RealmObjectBase.get<String>(this, 'exerciseType') as String;
  @override
  set exerciseType(String value) =>
      RealmObjectBase.set(this, 'exerciseType', value);

  @override
  int? get weight => RealmObjectBase.get<int>(this, 'weight') as int?;
  @override
  set weight(int? value) => RealmObjectBase.set(this, 'weight', value);

  @override
  int? get reps => RealmObjectBase.get<int>(this, 'reps') as int?;
  @override
  set reps(int? value) => RealmObjectBase.set(this, 'reps', value);

  @override
  double? get distance =>
      RealmObjectBase.get<double>(this, 'distance') as double?;
  @override
  set distance(double? value) => RealmObjectBase.set(this, 'distance', value);

  @override
  int? get duration => RealmObjectBase.get<int>(this, 'duration') as int?;
  @override
  set duration(int? value) => RealmObjectBase.set(this, 'duration', value);

  @override
  int? get stretchDuration =>
      RealmObjectBase.get<int>(this, 'stretchDuration') as int?;
  @override
  set stretchDuration(int? value) =>
      RealmObjectBase.set(this, 'stretchDuration', value);

  @override
  Stream<RealmObjectChanges<ExerciseRepeat>> get changes =>
      RealmObjectBase.getChanges<ExerciseRepeat>(this);

  @override
  Stream<RealmObjectChanges<ExerciseRepeat>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ExerciseRepeat>(this, keyPaths);

  @override
  ExerciseRepeat freeze() => RealmObjectBase.freezeObject<ExerciseRepeat>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'sort': sort.toEJson(),
      'date': date.toEJson(),
      'workoutId': workoutId.toEJson(),
      'exerciseId': exerciseId.toEJson(),
      'exerciseType': exerciseType.toEJson(),
      'weight': weight.toEJson(),
      'reps': reps.toEJson(),
      'distance': distance.toEJson(),
      'duration': duration.toEJson(),
      'stretchDuration': stretchDuration.toEJson(),
    };
  }

  static EJsonValue _toEJson(ExerciseRepeat value) => value.toEJson();
  static ExerciseRepeat _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'sort': EJsonValue sort,
        'date': EJsonValue date,
        'workoutId': EJsonValue workoutId,
        'exerciseId': EJsonValue exerciseId,
        'exerciseType': EJsonValue exerciseType,
      } =>
        ExerciseRepeat(
          fromEJson(id),
          fromEJson(sort),
          fromEJson(date),
          fromEJson(workoutId),
          fromEJson(exerciseId),
          fromEJson(exerciseType),
          weight: fromEJson(ejson['weight']),
          reps: fromEJson(ejson['reps']),
          distance: fromEJson(ejson['distance']),
          duration: fromEJson(ejson['duration']),
          stretchDuration: fromEJson(ejson['stretchDuration']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ExerciseRepeat._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, ExerciseRepeat, 'ExerciseRepeat', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('sort', RealmPropertyType.int),
      SchemaProperty('date', RealmPropertyType.timestamp),
      SchemaProperty('workoutId', RealmPropertyType.string),
      SchemaProperty('exerciseId', RealmPropertyType.string),
      SchemaProperty('exerciseType', RealmPropertyType.string),
      SchemaProperty('weight', RealmPropertyType.int, optional: true),
      SchemaProperty('reps', RealmPropertyType.int, optional: true),
      SchemaProperty('distance', RealmPropertyType.double, optional: true),
      SchemaProperty('duration', RealmPropertyType.int, optional: true),
      SchemaProperty('stretchDuration', RealmPropertyType.int, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
