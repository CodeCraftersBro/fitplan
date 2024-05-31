// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_type.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ExerciseType extends _ExerciseType
    with RealmEntity, RealmObjectBase, RealmObject {
  ExerciseType(
    String id,
    String name,
    String icon,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'icon', icon);
  }

  ExerciseType._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get icon => RealmObjectBase.get<String>(this, 'icon') as String;
  @override
  set icon(String value) => RealmObjectBase.set(this, 'icon', value);

  @override
  Stream<RealmObjectChanges<ExerciseType>> get changes =>
      RealmObjectBase.getChanges<ExerciseType>(this);

  @override
  Stream<RealmObjectChanges<ExerciseType>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ExerciseType>(this, keyPaths);

  @override
  ExerciseType freeze() => RealmObjectBase.freezeObject<ExerciseType>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'icon': icon.toEJson(),
    };
  }

  static EJsonValue _toEJson(ExerciseType value) => value.toEJson();
  static ExerciseType _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'icon': EJsonValue icon,
      } =>
        ExerciseType(
          fromEJson(id),
          fromEJson(name),
          fromEJson(icon),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ExerciseType._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, ExerciseType, 'ExerciseType', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('icon', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
