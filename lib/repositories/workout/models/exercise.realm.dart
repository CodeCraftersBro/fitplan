// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Exercise extends _Exercise
    with RealmEntity, RealmObjectBase, RealmObject {
  Exercise(
    String id,
    String name,
    String exerciseTypeId,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'exerciseTypeId', exerciseTypeId);
  }

  Exercise._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get exerciseTypeId =>
      RealmObjectBase.get<String>(this, 'exerciseTypeId') as String;
  @override
  set exerciseTypeId(String value) =>
      RealmObjectBase.set(this, 'exerciseTypeId', value);

  @override
  Stream<RealmObjectChanges<Exercise>> get changes =>
      RealmObjectBase.getChanges<Exercise>(this);

  @override
  Stream<RealmObjectChanges<Exercise>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Exercise>(this, keyPaths);

  @override
  Exercise freeze() => RealmObjectBase.freezeObject<Exercise>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'exerciseTypeId': exerciseTypeId.toEJson(),
    };
  }

  static EJsonValue _toEJson(Exercise value) => value.toEJson();
  static Exercise _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'exerciseTypeId': EJsonValue exerciseTypeId,
      } =>
        Exercise(
          fromEJson(id),
          fromEJson(name),
          fromEJson(exerciseTypeId),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Exercise._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Exercise, 'Exercise', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('exerciseTypeId', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
