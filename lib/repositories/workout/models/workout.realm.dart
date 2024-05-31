// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Workout extends _Workout with RealmEntity, RealmObjectBase, RealmObject {
  Workout(
    String id,
    int sort,
    DateTime date,
    bool isSet,
    String exerciseIndicator,
    String exerciseId,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'sort', sort);
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set(this, 'isSet', isSet);
    RealmObjectBase.set(this, 'exerciseIndicator', exerciseIndicator);
    RealmObjectBase.set(this, 'exerciseId', exerciseId);
  }

  Workout._();

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
  bool get isSet => RealmObjectBase.get<bool>(this, 'isSet') as bool;
  @override
  set isSet(bool value) => RealmObjectBase.set(this, 'isSet', value);

  @override
  String get exerciseIndicator =>
      RealmObjectBase.get<String>(this, 'exerciseIndicator') as String;
  @override
  set exerciseIndicator(String value) =>
      RealmObjectBase.set(this, 'exerciseIndicator', value);

  @override
  String get exerciseId =>
      RealmObjectBase.get<String>(this, 'exerciseId') as String;
  @override
  set exerciseId(String value) =>
      RealmObjectBase.set(this, 'exerciseId', value);

  @override
  Stream<RealmObjectChanges<Workout>> get changes =>
      RealmObjectBase.getChanges<Workout>(this);

  @override
  Stream<RealmObjectChanges<Workout>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Workout>(this, keyPaths);

  @override
  Workout freeze() => RealmObjectBase.freezeObject<Workout>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'sort': sort.toEJson(),
      'date': date.toEJson(),
      'isSet': isSet.toEJson(),
      'exerciseIndicator': exerciseIndicator.toEJson(),
      'exerciseId': exerciseId.toEJson(),
    };
  }

  static EJsonValue _toEJson(Workout value) => value.toEJson();
  static Workout _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'sort': EJsonValue sort,
        'date': EJsonValue date,
        'isSet': EJsonValue isSet,
        'exerciseIndicator': EJsonValue exerciseIndicator,
        'exerciseId': EJsonValue exerciseId,
      } =>
        Workout(
          fromEJson(id),
          fromEJson(sort),
          fromEJson(date),
          fromEJson(isSet),
          fromEJson(exerciseIndicator),
          fromEJson(exerciseId),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Workout._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Workout, 'Workout', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('sort', RealmPropertyType.int),
      SchemaProperty('date', RealmPropertyType.timestamp),
      SchemaProperty('isSet', RealmPropertyType.bool),
      SchemaProperty('exerciseIndicator', RealmPropertyType.string),
      SchemaProperty('exerciseId', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
