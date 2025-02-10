// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ExerciseTypesTable extends ExerciseTypes
    with TableInfo<$ExerciseTypesTable, ExerciseType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, icon, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_types';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseType(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
    );
  }

  @override
  $ExerciseTypesTable createAlias(String alias) {
    return $ExerciseTypesTable(attachedDatabase, alias);
  }
}

class ExerciseType extends DataClass implements Insertable<ExerciseType> {
  final String id;
  final String name;
  final String? icon;
  final String category;
  const ExerciseType(
      {required this.id,
      required this.name,
      this.icon,
      required this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    map['category'] = Variable<String>(category);
    return map;
  }

  ExerciseTypesCompanion toCompanion(bool nullToAbsent) {
    return ExerciseTypesCompanion(
      id: Value(id),
      name: Value(name),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      category: Value(category),
    );
  }

  factory ExerciseType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseType(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<String?>(json['icon']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<String?>(icon),
      'category': serializer.toJson<String>(category),
    };
  }

  ExerciseType copyWith(
          {String? id,
          String? name,
          Value<String?> icon = const Value.absent(),
          String? category}) =>
      ExerciseType(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon.present ? icon.value : this.icon,
        category: category ?? this.category,
      );
  ExerciseType copyWithCompanion(ExerciseTypesCompanion data) {
    return ExerciseType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseType(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, icon, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseType &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.category == this.category);
}

class ExerciseTypesCompanion extends UpdateCompanion<ExerciseType> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> icon;
  final Value<String> category;
  final Value<int> rowid;
  const ExerciseTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.category = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExerciseTypesCompanion.insert({
    required String id,
    required String name,
    this.icon = const Value.absent(),
    required String category,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        category = Value(category);
  static Insertable<ExerciseType> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? icon,
    Expression<String>? category,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (category != null) 'category': category,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExerciseTypesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? icon,
      Value<String>? category,
      Value<int>? rowid}) {
    return ExerciseTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      category: category ?? this.category,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('category: $category, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _exerciseTypeIdMeta =
      const VerificationMeta('exerciseTypeId');
  @override
  late final GeneratedColumn<String> exerciseTypeId = GeneratedColumn<String>(
      'exercise_type_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercise_types (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, name, exerciseTypeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<Exercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('exercise_type_id')) {
      context.handle(
          _exerciseTypeIdMeta,
          exerciseTypeId.isAcceptableOrUnknown(
              data['exercise_type_id']!, _exerciseTypeIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseTypeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      exerciseTypeId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}exercise_type_id'])!,
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final String id;
  final String name;
  final String exerciseTypeId;
  const Exercise(
      {required this.id, required this.name, required this.exerciseTypeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['exercise_type_id'] = Variable<String>(exerciseTypeId);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      name: Value(name),
      exerciseTypeId: Value(exerciseTypeId),
    );
  }

  factory Exercise.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      exerciseTypeId: serializer.fromJson<String>(json['exerciseTypeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'exerciseTypeId': serializer.toJson<String>(exerciseTypeId),
    };
  }

  Exercise copyWith({String? id, String? name, String? exerciseTypeId}) =>
      Exercise(
        id: id ?? this.id,
        name: name ?? this.name,
        exerciseTypeId: exerciseTypeId ?? this.exerciseTypeId,
      );
  Exercise copyWithCompanion(ExercisesCompanion data) {
    return Exercise(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      exerciseTypeId: data.exerciseTypeId.present
          ? data.exerciseTypeId.value
          : this.exerciseTypeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('exerciseTypeId: $exerciseTypeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, exerciseTypeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == this.id &&
          other.name == this.name &&
          other.exerciseTypeId == this.exerciseTypeId);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> exerciseTypeId;
  final Value<int> rowid;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.exerciseTypeId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisesCompanion.insert({
    required String id,
    required String name,
    required String exerciseTypeId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        exerciseTypeId = Value(exerciseTypeId);
  static Insertable<Exercise> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? exerciseTypeId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (exerciseTypeId != null) 'exercise_type_id': exerciseTypeId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? exerciseTypeId,
      Value<int>? rowid}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      exerciseTypeId: exerciseTypeId ?? this.exerciseTypeId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (exerciseTypeId.present) {
      map['exercise_type_id'] = Variable<String>(exerciseTypeId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('exerciseTypeId: $exerciseTypeId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutsTable extends Workouts with TableInfo<$WorkoutsTable, Workout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
      'sort', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isSetMeta = const VerificationMeta('isSet');
  @override
  late final GeneratedColumn<bool> isSet = GeneratedColumn<bool>(
      'is_set', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_set" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _setIdMeta = const VerificationMeta('setId');
  @override
  late final GeneratedColumn<int> setId = GeneratedColumn<int>(
      'set_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _exerciseIndicatorMeta =
      const VerificationMeta('exerciseIndicator');
  @override
  late final GeneratedColumn<String> exerciseIndicator =
      GeneratedColumn<String>('exercise_indicator', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercises (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, sort, date, isSet, setId, exerciseIndicator, exerciseId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workouts';
  @override
  VerificationContext validateIntegrity(Insertable<Workout> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sort')) {
      context.handle(
          _sortMeta, sort.isAcceptableOrUnknown(data['sort']!, _sortMeta));
    } else if (isInserting) {
      context.missing(_sortMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('is_set')) {
      context.handle(
          _isSetMeta, isSet.isAcceptableOrUnknown(data['is_set']!, _isSetMeta));
    }
    if (data.containsKey('set_id')) {
      context.handle(
          _setIdMeta, setId.isAcceptableOrUnknown(data['set_id']!, _setIdMeta));
    } else if (isInserting) {
      context.missing(_setIdMeta);
    }
    if (data.containsKey('exercise_indicator')) {
      context.handle(
          _exerciseIndicatorMeta,
          exerciseIndicator.isAcceptableOrUnknown(
              data['exercise_indicator']!, _exerciseIndicatorMeta));
    } else if (isInserting) {
      context.missing(_exerciseIndicatorMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Workout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Workout(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sort: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      isSet: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_set'])!,
      setId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}set_id'])!,
      exerciseIndicator: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}exercise_indicator'])!,
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_id'])!,
    );
  }

  @override
  $WorkoutsTable createAlias(String alias) {
    return $WorkoutsTable(attachedDatabase, alias);
  }
}

class Workout extends DataClass implements Insertable<Workout> {
  final String id;
  final int sort;
  final DateTime date;
  final bool isSet;
  final int setId;
  final String exerciseIndicator;
  final String exerciseId;
  const Workout(
      {required this.id,
      required this.sort,
      required this.date,
      required this.isSet,
      required this.setId,
      required this.exerciseIndicator,
      required this.exerciseId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['sort'] = Variable<int>(sort);
    map['date'] = Variable<DateTime>(date);
    map['is_set'] = Variable<bool>(isSet);
    map['set_id'] = Variable<int>(setId);
    map['exercise_indicator'] = Variable<String>(exerciseIndicator);
    map['exercise_id'] = Variable<String>(exerciseId);
    return map;
  }

  WorkoutsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutsCompanion(
      id: Value(id),
      sort: Value(sort),
      date: Value(date),
      isSet: Value(isSet),
      setId: Value(setId),
      exerciseIndicator: Value(exerciseIndicator),
      exerciseId: Value(exerciseId),
    );
  }

  factory Workout.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Workout(
      id: serializer.fromJson<String>(json['id']),
      sort: serializer.fromJson<int>(json['sort']),
      date: serializer.fromJson<DateTime>(json['date']),
      isSet: serializer.fromJson<bool>(json['isSet']),
      setId: serializer.fromJson<int>(json['setId']),
      exerciseIndicator: serializer.fromJson<String>(json['exerciseIndicator']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sort': serializer.toJson<int>(sort),
      'date': serializer.toJson<DateTime>(date),
      'isSet': serializer.toJson<bool>(isSet),
      'setId': serializer.toJson<int>(setId),
      'exerciseIndicator': serializer.toJson<String>(exerciseIndicator),
      'exerciseId': serializer.toJson<String>(exerciseId),
    };
  }

  Workout copyWith(
          {String? id,
          int? sort,
          DateTime? date,
          bool? isSet,
          int? setId,
          String? exerciseIndicator,
          String? exerciseId}) =>
      Workout(
        id: id ?? this.id,
        sort: sort ?? this.sort,
        date: date ?? this.date,
        isSet: isSet ?? this.isSet,
        setId: setId ?? this.setId,
        exerciseIndicator: exerciseIndicator ?? this.exerciseIndicator,
        exerciseId: exerciseId ?? this.exerciseId,
      );
  Workout copyWithCompanion(WorkoutsCompanion data) {
    return Workout(
      id: data.id.present ? data.id.value : this.id,
      sort: data.sort.present ? data.sort.value : this.sort,
      date: data.date.present ? data.date.value : this.date,
      isSet: data.isSet.present ? data.isSet.value : this.isSet,
      setId: data.setId.present ? data.setId.value : this.setId,
      exerciseIndicator: data.exerciseIndicator.present
          ? data.exerciseIndicator.value
          : this.exerciseIndicator,
      exerciseId:
          data.exerciseId.present ? data.exerciseId.value : this.exerciseId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Workout(')
          ..write('id: $id, ')
          ..write('sort: $sort, ')
          ..write('date: $date, ')
          ..write('isSet: $isSet, ')
          ..write('setId: $setId, ')
          ..write('exerciseIndicator: $exerciseIndicator, ')
          ..write('exerciseId: $exerciseId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, sort, date, isSet, setId, exerciseIndicator, exerciseId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Workout &&
          other.id == this.id &&
          other.sort == this.sort &&
          other.date == this.date &&
          other.isSet == this.isSet &&
          other.setId == this.setId &&
          other.exerciseIndicator == this.exerciseIndicator &&
          other.exerciseId == this.exerciseId);
}

class WorkoutsCompanion extends UpdateCompanion<Workout> {
  final Value<String> id;
  final Value<int> sort;
  final Value<DateTime> date;
  final Value<bool> isSet;
  final Value<int> setId;
  final Value<String> exerciseIndicator;
  final Value<String> exerciseId;
  final Value<int> rowid;
  const WorkoutsCompanion({
    this.id = const Value.absent(),
    this.sort = const Value.absent(),
    this.date = const Value.absent(),
    this.isSet = const Value.absent(),
    this.setId = const Value.absent(),
    this.exerciseIndicator = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutsCompanion.insert({
    required String id,
    required int sort,
    required DateTime date,
    this.isSet = const Value.absent(),
    required int setId,
    required String exerciseIndicator,
    required String exerciseId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        sort = Value(sort),
        date = Value(date),
        setId = Value(setId),
        exerciseIndicator = Value(exerciseIndicator),
        exerciseId = Value(exerciseId);
  static Insertable<Workout> custom({
    Expression<String>? id,
    Expression<int>? sort,
    Expression<DateTime>? date,
    Expression<bool>? isSet,
    Expression<int>? setId,
    Expression<String>? exerciseIndicator,
    Expression<String>? exerciseId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sort != null) 'sort': sort,
      if (date != null) 'date': date,
      if (isSet != null) 'is_set': isSet,
      if (setId != null) 'set_id': setId,
      if (exerciseIndicator != null) 'exercise_indicator': exerciseIndicator,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutsCompanion copyWith(
      {Value<String>? id,
      Value<int>? sort,
      Value<DateTime>? date,
      Value<bool>? isSet,
      Value<int>? setId,
      Value<String>? exerciseIndicator,
      Value<String>? exerciseId,
      Value<int>? rowid}) {
    return WorkoutsCompanion(
      id: id ?? this.id,
      sort: sort ?? this.sort,
      date: date ?? this.date,
      isSet: isSet ?? this.isSet,
      setId: setId ?? this.setId,
      exerciseIndicator: exerciseIndicator ?? this.exerciseIndicator,
      exerciseId: exerciseId ?? this.exerciseId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (isSet.present) {
      map['is_set'] = Variable<bool>(isSet.value);
    }
    if (setId.present) {
      map['set_id'] = Variable<int>(setId.value);
    }
    if (exerciseIndicator.present) {
      map['exercise_indicator'] = Variable<String>(exerciseIndicator.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('sort: $sort, ')
          ..write('date: $date, ')
          ..write('isSet: $isSet, ')
          ..write('setId: $setId, ')
          ..write('exerciseIndicator: $exerciseIndicator, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExerciseRepeatsTable extends ExerciseRepeats
    with TableInfo<$ExerciseRepeatsTable, ExerciseRepeat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseRepeatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
      'sort', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<String> workoutId = GeneratedColumn<String>(
      'workout_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES workouts (id)'));
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exercises (id)'));
  static const VerificationMeta _exerciseTypeMeta =
      const VerificationMeta('exerciseType');
  @override
  late final GeneratedColumn<String> exerciseType = GeneratedColumn<String>(
      'exercise_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int> weight = GeneratedColumn<int>(
      'weight', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
      'reps', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _distanceMeta =
      const VerificationMeta('distance');
  @override
  late final GeneratedColumn<double> distance = GeneratedColumn<double>(
      'distance', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _stretchDurationMeta =
      const VerificationMeta('stretchDuration');
  @override
  late final GeneratedColumn<int> stretchDuration = GeneratedColumn<int>(
      'stretch_duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sort,
        date,
        workoutId,
        exerciseId,
        exerciseType,
        weight,
        reps,
        distance,
        duration,
        stretchDuration
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_repeats';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseRepeat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sort')) {
      context.handle(
          _sortMeta, sort.isAcceptableOrUnknown(data['sort']!, _sortMeta));
    } else if (isInserting) {
      context.missing(_sortMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
    } else if (isInserting) {
      context.missing(_workoutIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('exercise_type')) {
      context.handle(
          _exerciseTypeMeta,
          exerciseType.isAcceptableOrUnknown(
              data['exercise_type']!, _exerciseTypeMeta));
    } else if (isInserting) {
      context.missing(_exerciseTypeMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('reps')) {
      context.handle(
          _repsMeta, reps.isAcceptableOrUnknown(data['reps']!, _repsMeta));
    }
    if (data.containsKey('distance')) {
      context.handle(_distanceMeta,
          distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta));
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    }
    if (data.containsKey('stretch_duration')) {
      context.handle(
          _stretchDurationMeta,
          stretchDuration.isAcceptableOrUnknown(
              data['stretch_duration']!, _stretchDurationMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ExerciseRepeat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseRepeat(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sort: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_id'])!,
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_id'])!,
      exerciseType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_type'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}weight']),
      reps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reps']),
      distance: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}distance']),
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration']),
      stretchDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stretch_duration']),
    );
  }

  @override
  $ExerciseRepeatsTable createAlias(String alias) {
    return $ExerciseRepeatsTable(attachedDatabase, alias);
  }
}

class ExerciseRepeat extends DataClass implements Insertable<ExerciseRepeat> {
  final String id;
  final int sort;
  final DateTime date;
  final String workoutId;
  final String exerciseId;
  final String exerciseType;
  final int? weight;
  final int? reps;
  final double? distance;
  final int? duration;
  final int? stretchDuration;
  const ExerciseRepeat(
      {required this.id,
      required this.sort,
      required this.date,
      required this.workoutId,
      required this.exerciseId,
      required this.exerciseType,
      this.weight,
      this.reps,
      this.distance,
      this.duration,
      this.stretchDuration});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['sort'] = Variable<int>(sort);
    map['date'] = Variable<DateTime>(date);
    map['workout_id'] = Variable<String>(workoutId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['exercise_type'] = Variable<String>(exerciseType);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<int>(weight);
    }
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<int>(reps);
    }
    if (!nullToAbsent || distance != null) {
      map['distance'] = Variable<double>(distance);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || stretchDuration != null) {
      map['stretch_duration'] = Variable<int>(stretchDuration);
    }
    return map;
  }

  ExerciseRepeatsCompanion toCompanion(bool nullToAbsent) {
    return ExerciseRepeatsCompanion(
      id: Value(id),
      sort: Value(sort),
      date: Value(date),
      workoutId: Value(workoutId),
      exerciseId: Value(exerciseId),
      exerciseType: Value(exerciseType),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      distance: distance == null && nullToAbsent
          ? const Value.absent()
          : Value(distance),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      stretchDuration: stretchDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(stretchDuration),
    );
  }

  factory ExerciseRepeat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseRepeat(
      id: serializer.fromJson<String>(json['id']),
      sort: serializer.fromJson<int>(json['sort']),
      date: serializer.fromJson<DateTime>(json['date']),
      workoutId: serializer.fromJson<String>(json['workoutId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      exerciseType: serializer.fromJson<String>(json['exerciseType']),
      weight: serializer.fromJson<int?>(json['weight']),
      reps: serializer.fromJson<int?>(json['reps']),
      distance: serializer.fromJson<double?>(json['distance']),
      duration: serializer.fromJson<int?>(json['duration']),
      stretchDuration: serializer.fromJson<int?>(json['stretchDuration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sort': serializer.toJson<int>(sort),
      'date': serializer.toJson<DateTime>(date),
      'workoutId': serializer.toJson<String>(workoutId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'exerciseType': serializer.toJson<String>(exerciseType),
      'weight': serializer.toJson<int?>(weight),
      'reps': serializer.toJson<int?>(reps),
      'distance': serializer.toJson<double?>(distance),
      'duration': serializer.toJson<int?>(duration),
      'stretchDuration': serializer.toJson<int?>(stretchDuration),
    };
  }

  ExerciseRepeat copyWith(
          {String? id,
          int? sort,
          DateTime? date,
          String? workoutId,
          String? exerciseId,
          String? exerciseType,
          Value<int?> weight = const Value.absent(),
          Value<int?> reps = const Value.absent(),
          Value<double?> distance = const Value.absent(),
          Value<int?> duration = const Value.absent(),
          Value<int?> stretchDuration = const Value.absent()}) =>
      ExerciseRepeat(
        id: id ?? this.id,
        sort: sort ?? this.sort,
        date: date ?? this.date,
        workoutId: workoutId ?? this.workoutId,
        exerciseId: exerciseId ?? this.exerciseId,
        exerciseType: exerciseType ?? this.exerciseType,
        weight: weight.present ? weight.value : this.weight,
        reps: reps.present ? reps.value : this.reps,
        distance: distance.present ? distance.value : this.distance,
        duration: duration.present ? duration.value : this.duration,
        stretchDuration: stretchDuration.present
            ? stretchDuration.value
            : this.stretchDuration,
      );
  ExerciseRepeat copyWithCompanion(ExerciseRepeatsCompanion data) {
    return ExerciseRepeat(
      id: data.id.present ? data.id.value : this.id,
      sort: data.sort.present ? data.sort.value : this.sort,
      date: data.date.present ? data.date.value : this.date,
      workoutId: data.workoutId.present ? data.workoutId.value : this.workoutId,
      exerciseId:
          data.exerciseId.present ? data.exerciseId.value : this.exerciseId,
      exerciseType: data.exerciseType.present
          ? data.exerciseType.value
          : this.exerciseType,
      weight: data.weight.present ? data.weight.value : this.weight,
      reps: data.reps.present ? data.reps.value : this.reps,
      distance: data.distance.present ? data.distance.value : this.distance,
      duration: data.duration.present ? data.duration.value : this.duration,
      stretchDuration: data.stretchDuration.present
          ? data.stretchDuration.value
          : this.stretchDuration,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseRepeat(')
          ..write('id: $id, ')
          ..write('sort: $sort, ')
          ..write('date: $date, ')
          ..write('workoutId: $workoutId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseType: $exerciseType, ')
          ..write('weight: $weight, ')
          ..write('reps: $reps, ')
          ..write('distance: $distance, ')
          ..write('duration: $duration, ')
          ..write('stretchDuration: $stretchDuration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sort, date, workoutId, exerciseId,
      exerciseType, weight, reps, distance, duration, stretchDuration);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseRepeat &&
          other.id == this.id &&
          other.sort == this.sort &&
          other.date == this.date &&
          other.workoutId == this.workoutId &&
          other.exerciseId == this.exerciseId &&
          other.exerciseType == this.exerciseType &&
          other.weight == this.weight &&
          other.reps == this.reps &&
          other.distance == this.distance &&
          other.duration == this.duration &&
          other.stretchDuration == this.stretchDuration);
}

class ExerciseRepeatsCompanion extends UpdateCompanion<ExerciseRepeat> {
  final Value<String> id;
  final Value<int> sort;
  final Value<DateTime> date;
  final Value<String> workoutId;
  final Value<String> exerciseId;
  final Value<String> exerciseType;
  final Value<int?> weight;
  final Value<int?> reps;
  final Value<double?> distance;
  final Value<int?> duration;
  final Value<int?> stretchDuration;
  final Value<int> rowid;
  const ExerciseRepeatsCompanion({
    this.id = const Value.absent(),
    this.sort = const Value.absent(),
    this.date = const Value.absent(),
    this.workoutId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.exerciseType = const Value.absent(),
    this.weight = const Value.absent(),
    this.reps = const Value.absent(),
    this.distance = const Value.absent(),
    this.duration = const Value.absent(),
    this.stretchDuration = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExerciseRepeatsCompanion.insert({
    required String id,
    required int sort,
    required DateTime date,
    required String workoutId,
    required String exerciseId,
    required String exerciseType,
    this.weight = const Value.absent(),
    this.reps = const Value.absent(),
    this.distance = const Value.absent(),
    this.duration = const Value.absent(),
    this.stretchDuration = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        sort = Value(sort),
        date = Value(date),
        workoutId = Value(workoutId),
        exerciseId = Value(exerciseId),
        exerciseType = Value(exerciseType);
  static Insertable<ExerciseRepeat> custom({
    Expression<String>? id,
    Expression<int>? sort,
    Expression<DateTime>? date,
    Expression<String>? workoutId,
    Expression<String>? exerciseId,
    Expression<String>? exerciseType,
    Expression<int>? weight,
    Expression<int>? reps,
    Expression<double>? distance,
    Expression<int>? duration,
    Expression<int>? stretchDuration,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sort != null) 'sort': sort,
      if (date != null) 'date': date,
      if (workoutId != null) 'workout_id': workoutId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (exerciseType != null) 'exercise_type': exerciseType,
      if (weight != null) 'weight': weight,
      if (reps != null) 'reps': reps,
      if (distance != null) 'distance': distance,
      if (duration != null) 'duration': duration,
      if (stretchDuration != null) 'stretch_duration': stretchDuration,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExerciseRepeatsCompanion copyWith(
      {Value<String>? id,
      Value<int>? sort,
      Value<DateTime>? date,
      Value<String>? workoutId,
      Value<String>? exerciseId,
      Value<String>? exerciseType,
      Value<int?>? weight,
      Value<int?>? reps,
      Value<double?>? distance,
      Value<int?>? duration,
      Value<int?>? stretchDuration,
      Value<int>? rowid}) {
    return ExerciseRepeatsCompanion(
      id: id ?? this.id,
      sort: sort ?? this.sort,
      date: date ?? this.date,
      workoutId: workoutId ?? this.workoutId,
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseType: exerciseType ?? this.exerciseType,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      stretchDuration: stretchDuration ?? this.stretchDuration,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<String>(workoutId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (exerciseType.present) {
      map['exercise_type'] = Variable<String>(exerciseType.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (distance.present) {
      map['distance'] = Variable<double>(distance.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (stretchDuration.present) {
      map['stretch_duration'] = Variable<int>(stretchDuration.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseRepeatsCompanion(')
          ..write('id: $id, ')
          ..write('sort: $sort, ')
          ..write('date: $date, ')
          ..write('workoutId: $workoutId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseType: $exerciseType, ')
          ..write('weight: $weight, ')
          ..write('reps: $reps, ')
          ..write('distance: $distance, ')
          ..write('duration: $duration, ')
          ..write('stretchDuration: $stretchDuration, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ExerciseTypesTable exerciseTypes = $ExerciseTypesTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $WorkoutsTable workouts = $WorkoutsTable(this);
  late final $ExerciseRepeatsTable exerciseRepeats =
      $ExerciseRepeatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [exerciseTypes, exercises, workouts, exerciseRepeats];
}

typedef $$ExerciseTypesTableCreateCompanionBuilder = ExerciseTypesCompanion
    Function({
  required String id,
  required String name,
  Value<String?> icon,
  required String category,
  Value<int> rowid,
});
typedef $$ExerciseTypesTableUpdateCompanionBuilder = ExerciseTypesCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> icon,
  Value<String> category,
  Value<int> rowid,
});

final class $$ExerciseTypesTableReferences
    extends BaseReferences<_$AppDatabase, $ExerciseTypesTable, ExerciseType> {
  $$ExerciseTypesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ExercisesTable, List<Exercise>>
      _exercisesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.exercises,
              aliasName: $_aliasNameGenerator(
                  db.exerciseTypes.id, db.exercises.exerciseTypeId));

  $$ExercisesTableProcessedTableManager get exercisesRefs {
    final manager = $$ExercisesTableTableManager($_db, $_db.exercises).filter(
        (f) => f.exerciseTypeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_exercisesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ExerciseTypesTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseTypesTable> {
  $$ExerciseTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  Expression<bool> exercisesRefs(
      Expression<bool> Function($$ExercisesTableFilterComposer f) f) {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.exerciseTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableFilterComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExerciseTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseTypesTable> {
  $$ExerciseTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));
}

class $$ExerciseTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseTypesTable> {
  $$ExerciseTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  Expression<T> exercisesRefs<T extends Object>(
      Expression<T> Function($$ExercisesTableAnnotationComposer a) f) {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.exerciseTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableAnnotationComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExerciseTypesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExerciseTypesTable,
    ExerciseType,
    $$ExerciseTypesTableFilterComposer,
    $$ExerciseTypesTableOrderingComposer,
    $$ExerciseTypesTableAnnotationComposer,
    $$ExerciseTypesTableCreateCompanionBuilder,
    $$ExerciseTypesTableUpdateCompanionBuilder,
    (ExerciseType, $$ExerciseTypesTableReferences),
    ExerciseType,
    PrefetchHooks Function({bool exercisesRefs})> {
  $$ExerciseTypesTableTableManager(_$AppDatabase db, $ExerciseTypesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExerciseTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> icon = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExerciseTypesCompanion(
            id: id,
            name: name,
            icon: icon,
            category: category,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> icon = const Value.absent(),
            required String category,
            Value<int> rowid = const Value.absent(),
          }) =>
              ExerciseTypesCompanion.insert(
            id: id,
            name: name,
            icon: icon,
            category: category,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExerciseTypesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({exercisesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (exercisesRefs) db.exercises],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (exercisesRefs)
                    await $_getPrefetchedData<ExerciseType, $ExerciseTypesTable,
                            Exercise>(
                        currentTable: table,
                        referencedTable: $$ExerciseTypesTableReferences
                            ._exercisesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ExerciseTypesTableReferences(db, table, p0)
                                .exercisesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.exerciseTypeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ExerciseTypesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExerciseTypesTable,
    ExerciseType,
    $$ExerciseTypesTableFilterComposer,
    $$ExerciseTypesTableOrderingComposer,
    $$ExerciseTypesTableAnnotationComposer,
    $$ExerciseTypesTableCreateCompanionBuilder,
    $$ExerciseTypesTableUpdateCompanionBuilder,
    (ExerciseType, $$ExerciseTypesTableReferences),
    ExerciseType,
    PrefetchHooks Function({bool exercisesRefs})>;
typedef $$ExercisesTableCreateCompanionBuilder = ExercisesCompanion Function({
  required String id,
  required String name,
  required String exerciseTypeId,
  Value<int> rowid,
});
typedef $$ExercisesTableUpdateCompanionBuilder = ExercisesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> exerciseTypeId,
  Value<int> rowid,
});

final class $$ExercisesTableReferences
    extends BaseReferences<_$AppDatabase, $ExercisesTable, Exercise> {
  $$ExercisesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ExerciseTypesTable _exerciseTypeIdTable(_$AppDatabase db) =>
      db.exerciseTypes.createAlias($_aliasNameGenerator(
          db.exercises.exerciseTypeId, db.exerciseTypes.id));

  $$ExerciseTypesTableProcessedTableManager get exerciseTypeId {
    final $_column = $_itemColumn<String>('exercise_type_id')!;

    final manager = $$ExerciseTypesTableTableManager($_db, $_db.exerciseTypes)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$WorkoutsTable, List<Workout>> _workoutsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.workouts,
          aliasName:
              $_aliasNameGenerator(db.exercises.id, db.workouts.exerciseId));

  $$WorkoutsTableProcessedTableManager get workoutsRefs {
    final manager = $$WorkoutsTableTableManager($_db, $_db.workouts)
        .filter((f) => f.exerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_workoutsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ExerciseRepeatsTable, List<ExerciseRepeat>>
      _exerciseRepeatsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.exerciseRepeats,
              aliasName: $_aliasNameGenerator(
                  db.exercises.id, db.exerciseRepeats.exerciseId));

  $$ExerciseRepeatsTableProcessedTableManager get exerciseRepeatsRefs {
    final manager = $$ExerciseRepeatsTableTableManager(
            $_db, $_db.exerciseRepeats)
        .filter((f) => f.exerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_exerciseRepeatsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  $$ExerciseTypesTableFilterComposer get exerciseTypeId {
    final $$ExerciseTypesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseTypeId,
        referencedTable: $db.exerciseTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExerciseTypesTableFilterComposer(
              $db: $db,
              $table: $db.exerciseTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> workoutsRefs(
      Expression<bool> Function($$WorkoutsTableFilterComposer f) f) {
    final $$WorkoutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.workouts,
        getReferencedColumn: (t) => t.exerciseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsTableFilterComposer(
              $db: $db,
              $table: $db.workouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> exerciseRepeatsRefs(
      Expression<bool> Function($$ExerciseRepeatsTableFilterComposer f) f) {
    final $$ExerciseRepeatsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exerciseRepeats,
        getReferencedColumn: (t) => t.exerciseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExerciseRepeatsTableFilterComposer(
              $db: $db,
              $table: $db.exerciseRepeats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  $$ExerciseTypesTableOrderingComposer get exerciseTypeId {
    final $$ExerciseTypesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseTypeId,
        referencedTable: $db.exerciseTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExerciseTypesTableOrderingComposer(
              $db: $db,
              $table: $db.exerciseTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$ExerciseTypesTableAnnotationComposer get exerciseTypeId {
    final $$ExerciseTypesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseTypeId,
        referencedTable: $db.exerciseTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExerciseTypesTableAnnotationComposer(
              $db: $db,
              $table: $db.exerciseTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> workoutsRefs<T extends Object>(
      Expression<T> Function($$WorkoutsTableAnnotationComposer a) f) {
    final $$WorkoutsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.workouts,
        getReferencedColumn: (t) => t.exerciseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsTableAnnotationComposer(
              $db: $db,
              $table: $db.workouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> exerciseRepeatsRefs<T extends Object>(
      Expression<T> Function($$ExerciseRepeatsTableAnnotationComposer a) f) {
    final $$ExerciseRepeatsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exerciseRepeats,
        getReferencedColumn: (t) => t.exerciseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExerciseRepeatsTableAnnotationComposer(
              $db: $db,
              $table: $db.exerciseRepeats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExercisesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExercisesTable,
    Exercise,
    $$ExercisesTableFilterComposer,
    $$ExercisesTableOrderingComposer,
    $$ExercisesTableAnnotationComposer,
    $$ExercisesTableCreateCompanionBuilder,
    $$ExercisesTableUpdateCompanionBuilder,
    (Exercise, $$ExercisesTableReferences),
    Exercise,
    PrefetchHooks Function(
        {bool exerciseTypeId, bool workoutsRefs, bool exerciseRepeatsRefs})> {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> exerciseTypeId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExercisesCompanion(
            id: id,
            name: name,
            exerciseTypeId: exerciseTypeId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String exerciseTypeId,
            Value<int> rowid = const Value.absent(),
          }) =>
              ExercisesCompanion.insert(
            id: id,
            name: name,
            exerciseTypeId: exerciseTypeId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExercisesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {exerciseTypeId = false,
              workoutsRefs = false,
              exerciseRepeatsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (workoutsRefs) db.workouts,
                if (exerciseRepeatsRefs) db.exerciseRepeats
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (exerciseTypeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.exerciseTypeId,
                    referencedTable:
                        $$ExercisesTableReferences._exerciseTypeIdTable(db),
                    referencedColumn:
                        $$ExercisesTableReferences._exerciseTypeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (workoutsRefs)
                    await $_getPrefetchedData<Exercise, $ExercisesTable,
                            Workout>(
                        currentTable: table,
                        referencedTable:
                            $$ExercisesTableReferences._workoutsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ExercisesTableReferences(db, table, p0)
                                .workoutsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.exerciseId == item.id),
                        typedResults: items),
                  if (exerciseRepeatsRefs)
                    await $_getPrefetchedData<Exercise, $ExercisesTable,
                            ExerciseRepeat>(
                        currentTable: table,
                        referencedTable: $$ExercisesTableReferences
                            ._exerciseRepeatsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ExercisesTableReferences(db, table, p0)
                                .exerciseRepeatsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.exerciseId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ExercisesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExercisesTable,
    Exercise,
    $$ExercisesTableFilterComposer,
    $$ExercisesTableOrderingComposer,
    $$ExercisesTableAnnotationComposer,
    $$ExercisesTableCreateCompanionBuilder,
    $$ExercisesTableUpdateCompanionBuilder,
    (Exercise, $$ExercisesTableReferences),
    Exercise,
    PrefetchHooks Function(
        {bool exerciseTypeId, bool workoutsRefs, bool exerciseRepeatsRefs})>;
typedef $$WorkoutsTableCreateCompanionBuilder = WorkoutsCompanion Function({
  required String id,
  required int sort,
  required DateTime date,
  Value<bool> isSet,
  required int setId,
  required String exerciseIndicator,
  required String exerciseId,
  Value<int> rowid,
});
typedef $$WorkoutsTableUpdateCompanionBuilder = WorkoutsCompanion Function({
  Value<String> id,
  Value<int> sort,
  Value<DateTime> date,
  Value<bool> isSet,
  Value<int> setId,
  Value<String> exerciseIndicator,
  Value<String> exerciseId,
  Value<int> rowid,
});

final class $$WorkoutsTableReferences
    extends BaseReferences<_$AppDatabase, $WorkoutsTable, Workout> {
  $$WorkoutsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias(
          $_aliasNameGenerator(db.workouts.exerciseId, db.exercises.id));

  $$ExercisesTableProcessedTableManager get exerciseId {
    final $_column = $_itemColumn<String>('exercise_id')!;

    final manager = $$ExercisesTableTableManager($_db, $_db.exercises)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ExerciseRepeatsTable, List<ExerciseRepeat>>
      _exerciseRepeatsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.exerciseRepeats,
              aliasName: $_aliasNameGenerator(
                  db.workouts.id, db.exerciseRepeats.workoutId));

  $$ExerciseRepeatsTableProcessedTableManager get exerciseRepeatsRefs {
    final manager = $$ExerciseRepeatsTableTableManager(
            $_db, $_db.exerciseRepeats)
        .filter((f) => f.workoutId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_exerciseRepeatsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WorkoutsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sort => $composableBuilder(
      column: $table.sort, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSet => $composableBuilder(
      column: $table.isSet, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get setId => $composableBuilder(
      column: $table.setId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exerciseIndicator => $composableBuilder(
      column: $table.exerciseIndicator,
      builder: (column) => ColumnFilters(column));

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableFilterComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> exerciseRepeatsRefs(
      Expression<bool> Function($$ExerciseRepeatsTableFilterComposer f) f) {
    final $$ExerciseRepeatsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exerciseRepeats,
        getReferencedColumn: (t) => t.workoutId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExerciseRepeatsTableFilterComposer(
              $db: $db,
              $table: $db.exerciseRepeats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WorkoutsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sort => $composableBuilder(
      column: $table.sort, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSet => $composableBuilder(
      column: $table.isSet, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get setId => $composableBuilder(
      column: $table.setId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exerciseIndicator => $composableBuilder(
      column: $table.exerciseIndicator,
      builder: (column) => ColumnOrderings(column));

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableOrderingComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkoutsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sort =>
      $composableBuilder(column: $table.sort, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get isSet =>
      $composableBuilder(column: $table.isSet, builder: (column) => column);

  GeneratedColumn<int> get setId =>
      $composableBuilder(column: $table.setId, builder: (column) => column);

  GeneratedColumn<String> get exerciseIndicator => $composableBuilder(
      column: $table.exerciseIndicator, builder: (column) => column);

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableAnnotationComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> exerciseRepeatsRefs<T extends Object>(
      Expression<T> Function($$ExerciseRepeatsTableAnnotationComposer a) f) {
    final $$ExerciseRepeatsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.exerciseRepeats,
        getReferencedColumn: (t) => t.workoutId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExerciseRepeatsTableAnnotationComposer(
              $db: $db,
              $table: $db.exerciseRepeats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WorkoutsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutsTable,
    Workout,
    $$WorkoutsTableFilterComposer,
    $$WorkoutsTableOrderingComposer,
    $$WorkoutsTableAnnotationComposer,
    $$WorkoutsTableCreateCompanionBuilder,
    $$WorkoutsTableUpdateCompanionBuilder,
    (Workout, $$WorkoutsTableReferences),
    Workout,
    PrefetchHooks Function({bool exerciseId, bool exerciseRepeatsRefs})> {
  $$WorkoutsTableTableManager(_$AppDatabase db, $WorkoutsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<int> sort = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<bool> isSet = const Value.absent(),
            Value<int> setId = const Value.absent(),
            Value<String> exerciseIndicator = const Value.absent(),
            Value<String> exerciseId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutsCompanion(
            id: id,
            sort: sort,
            date: date,
            isSet: isSet,
            setId: setId,
            exerciseIndicator: exerciseIndicator,
            exerciseId: exerciseId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required int sort,
            required DateTime date,
            Value<bool> isSet = const Value.absent(),
            required int setId,
            required String exerciseIndicator,
            required String exerciseId,
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutsCompanion.insert(
            id: id,
            sort: sort,
            date: date,
            isSet: isSet,
            setId: setId,
            exerciseIndicator: exerciseIndicator,
            exerciseId: exerciseId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$WorkoutsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {exerciseId = false, exerciseRepeatsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (exerciseRepeatsRefs) db.exerciseRepeats
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (exerciseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.exerciseId,
                    referencedTable:
                        $$WorkoutsTableReferences._exerciseIdTable(db),
                    referencedColumn:
                        $$WorkoutsTableReferences._exerciseIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (exerciseRepeatsRefs)
                    await $_getPrefetchedData<Workout, $WorkoutsTable,
                            ExerciseRepeat>(
                        currentTable: table,
                        referencedTable: $$WorkoutsTableReferences
                            ._exerciseRepeatsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkoutsTableReferences(db, table, p0)
                                .exerciseRepeatsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workoutId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$WorkoutsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkoutsTable,
    Workout,
    $$WorkoutsTableFilterComposer,
    $$WorkoutsTableOrderingComposer,
    $$WorkoutsTableAnnotationComposer,
    $$WorkoutsTableCreateCompanionBuilder,
    $$WorkoutsTableUpdateCompanionBuilder,
    (Workout, $$WorkoutsTableReferences),
    Workout,
    PrefetchHooks Function({bool exerciseId, bool exerciseRepeatsRefs})>;
typedef $$ExerciseRepeatsTableCreateCompanionBuilder = ExerciseRepeatsCompanion
    Function({
  required String id,
  required int sort,
  required DateTime date,
  required String workoutId,
  required String exerciseId,
  required String exerciseType,
  Value<int?> weight,
  Value<int?> reps,
  Value<double?> distance,
  Value<int?> duration,
  Value<int?> stretchDuration,
  Value<int> rowid,
});
typedef $$ExerciseRepeatsTableUpdateCompanionBuilder = ExerciseRepeatsCompanion
    Function({
  Value<String> id,
  Value<int> sort,
  Value<DateTime> date,
  Value<String> workoutId,
  Value<String> exerciseId,
  Value<String> exerciseType,
  Value<int?> weight,
  Value<int?> reps,
  Value<double?> distance,
  Value<int?> duration,
  Value<int?> stretchDuration,
  Value<int> rowid,
});

final class $$ExerciseRepeatsTableReferences extends BaseReferences<
    _$AppDatabase, $ExerciseRepeatsTable, ExerciseRepeat> {
  $$ExerciseRepeatsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkoutsTable _workoutIdTable(_$AppDatabase db) =>
      db.workouts.createAlias(
          $_aliasNameGenerator(db.exerciseRepeats.workoutId, db.workouts.id));

  $$WorkoutsTableProcessedTableManager get workoutId {
    final $_column = $_itemColumn<String>('workout_id')!;

    final manager = $$WorkoutsTableTableManager($_db, $_db.workouts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workoutIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias(
          $_aliasNameGenerator(db.exerciseRepeats.exerciseId, db.exercises.id));

  $$ExercisesTableProcessedTableManager get exerciseId {
    final $_column = $_itemColumn<String>('exercise_id')!;

    final manager = $$ExercisesTableTableManager($_db, $_db.exercises)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ExerciseRepeatsTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseRepeatsTable> {
  $$ExerciseRepeatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sort => $composableBuilder(
      column: $table.sort, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exerciseType => $composableBuilder(
      column: $table.exerciseType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reps => $composableBuilder(
      column: $table.reps, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get distance => $composableBuilder(
      column: $table.distance, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get stretchDuration => $composableBuilder(
      column: $table.stretchDuration,
      builder: (column) => ColumnFilters(column));

  $$WorkoutsTableFilterComposer get workoutId {
    final $$WorkoutsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.workouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsTableFilterComposer(
              $db: $db,
              $table: $db.workouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableFilterComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExerciseRepeatsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseRepeatsTable> {
  $$ExerciseRepeatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sort => $composableBuilder(
      column: $table.sort, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exerciseType => $composableBuilder(
      column: $table.exerciseType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reps => $composableBuilder(
      column: $table.reps, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get distance => $composableBuilder(
      column: $table.distance, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get stretchDuration => $composableBuilder(
      column: $table.stretchDuration,
      builder: (column) => ColumnOrderings(column));

  $$WorkoutsTableOrderingComposer get workoutId {
    final $$WorkoutsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.workouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsTableOrderingComposer(
              $db: $db,
              $table: $db.workouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableOrderingComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExerciseRepeatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseRepeatsTable> {
  $$ExerciseRepeatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sort =>
      $composableBuilder(column: $table.sort, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get exerciseType => $composableBuilder(
      column: $table.exerciseType, builder: (column) => column);

  GeneratedColumn<int> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<double> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<int> get stretchDuration => $composableBuilder(
      column: $table.stretchDuration, builder: (column) => column);

  $$WorkoutsTableAnnotationComposer get workoutId {
    final $$WorkoutsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $db.workouts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkoutsTableAnnotationComposer(
              $db: $db,
              $table: $db.workouts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exerciseId,
        referencedTable: $db.exercises,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExercisesTableAnnotationComposer(
              $db: $db,
              $table: $db.exercises,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExerciseRepeatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExerciseRepeatsTable,
    ExerciseRepeat,
    $$ExerciseRepeatsTableFilterComposer,
    $$ExerciseRepeatsTableOrderingComposer,
    $$ExerciseRepeatsTableAnnotationComposer,
    $$ExerciseRepeatsTableCreateCompanionBuilder,
    $$ExerciseRepeatsTableUpdateCompanionBuilder,
    (ExerciseRepeat, $$ExerciseRepeatsTableReferences),
    ExerciseRepeat,
    PrefetchHooks Function({bool workoutId, bool exerciseId})> {
  $$ExerciseRepeatsTableTableManager(
      _$AppDatabase db, $ExerciseRepeatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseRepeatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseRepeatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExerciseRepeatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<int> sort = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> workoutId = const Value.absent(),
            Value<String> exerciseId = const Value.absent(),
            Value<String> exerciseType = const Value.absent(),
            Value<int?> weight = const Value.absent(),
            Value<int?> reps = const Value.absent(),
            Value<double?> distance = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<int?> stretchDuration = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExerciseRepeatsCompanion(
            id: id,
            sort: sort,
            date: date,
            workoutId: workoutId,
            exerciseId: exerciseId,
            exerciseType: exerciseType,
            weight: weight,
            reps: reps,
            distance: distance,
            duration: duration,
            stretchDuration: stretchDuration,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required int sort,
            required DateTime date,
            required String workoutId,
            required String exerciseId,
            required String exerciseType,
            Value<int?> weight = const Value.absent(),
            Value<int?> reps = const Value.absent(),
            Value<double?> distance = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<int?> stretchDuration = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExerciseRepeatsCompanion.insert(
            id: id,
            sort: sort,
            date: date,
            workoutId: workoutId,
            exerciseId: exerciseId,
            exerciseType: exerciseType,
            weight: weight,
            reps: reps,
            distance: distance,
            duration: duration,
            stretchDuration: stretchDuration,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExerciseRepeatsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workoutId = false, exerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workoutId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workoutId,
                    referencedTable:
                        $$ExerciseRepeatsTableReferences._workoutIdTable(db),
                    referencedColumn:
                        $$ExerciseRepeatsTableReferences._workoutIdTable(db).id,
                  ) as T;
                }
                if (exerciseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.exerciseId,
                    referencedTable:
                        $$ExerciseRepeatsTableReferences._exerciseIdTable(db),
                    referencedColumn: $$ExerciseRepeatsTableReferences
                        ._exerciseIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ExerciseRepeatsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExerciseRepeatsTable,
    ExerciseRepeat,
    $$ExerciseRepeatsTableFilterComposer,
    $$ExerciseRepeatsTableOrderingComposer,
    $$ExerciseRepeatsTableAnnotationComposer,
    $$ExerciseRepeatsTableCreateCompanionBuilder,
    $$ExerciseRepeatsTableUpdateCompanionBuilder,
    (ExerciseRepeat, $$ExerciseRepeatsTableReferences),
    ExerciseRepeat,
    PrefetchHooks Function({bool workoutId, bool exerciseId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ExerciseTypesTableTableManager get exerciseTypes =>
      $$ExerciseTypesTableTableManager(_db, _db.exerciseTypes);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
  $$WorkoutsTableTableManager get workouts =>
      $$WorkoutsTableTableManager(_db, _db.workouts);
  $$ExerciseRepeatsTableTableManager get exerciseRepeats =>
      $$ExerciseRepeatsTableTableManager(_db, _db.exerciseRepeats);
}
