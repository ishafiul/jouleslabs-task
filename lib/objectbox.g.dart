// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'data/models/todo.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 4813632958979311862),
      name: 'Todo',
      lastPropertyId: const IdUid(9, 1712831958522478118),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5926186921836635226),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 8777968950176829649),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2089041237049417648),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 5807225197715931671),
            name: 'dateTime',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 2859392096223088599),
            name: 'reminderTime',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 3888913781959853536),
            name: 'status',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 3027303131425958772),
            name: 'date',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 8085806708554002856),
            name: 'isAlarm',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 1712831958522478118),
            name: 'isOverlayNow',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 4813632958979311862),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Todo: EntityDefinition<Todo>(
        model: _entities[0],
        toOneRelations: (Todo object) => [],
        toManyRelations: (Todo object) => {},
        getId: (Todo object) => object.id,
        setId: (Todo object, int id) {
          object.id = id;
        },
        objectToFB: (Todo object, fb.Builder fbb) {
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description!);
          final titleOffset = fbb.writeString(object.title);
          final dateTimeOffset = fbb.writeString(object.dateTime);
          final statusOffset = fbb.writeString(object.status);
          final dateOffset = fbb.writeString(object.date);
          fbb.startTable(10);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, descriptionOffset);
          fbb.addOffset(2, titleOffset);
          fbb.addOffset(3, dateTimeOffset);
          fbb.addInt64(4, object.reminderTime);
          fbb.addOffset(5, statusOffset);
          fbb.addOffset(6, dateOffset);
          fbb.addBool(7, object.isAlarm);
          fbb.addBool(8, object.isOverlayNow);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Todo(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              isAlarm: const fb.BoolReader()
                  .vTableGetNullable(buffer, rootOffset, 18),
              isOverlayNow: const fb.BoolReader()
                  .vTableGetNullable(buffer, rootOffset, 20),
              description: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              dateTime: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              date: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, ''),
              status: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''),
              reminderTime:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0),
              title: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Todo] entity fields to define ObjectBox queries.
class Todo_ {
  /// see [Todo.id]
  static final id = QueryIntegerProperty<Todo>(_entities[0].properties[0]);

  /// see [Todo.description]
  static final description =
      QueryStringProperty<Todo>(_entities[0].properties[1]);

  /// see [Todo.title]
  static final title = QueryStringProperty<Todo>(_entities[0].properties[2]);

  /// see [Todo.dateTime]
  static final dateTime = QueryStringProperty<Todo>(_entities[0].properties[3]);

  /// see [Todo.reminderTime]
  static final reminderTime =
      QueryIntegerProperty<Todo>(_entities[0].properties[4]);

  /// see [Todo.status]
  static final status = QueryStringProperty<Todo>(_entities[0].properties[5]);

  /// see [Todo.date]
  static final date = QueryStringProperty<Todo>(_entities[0].properties[6]);

  /// see [Todo.isAlarm]
  static final isAlarm = QueryBooleanProperty<Todo>(_entities[0].properties[7]);

  /// see [Todo.isOverlayNow]
  static final isOverlayNow =
      QueryBooleanProperty<Todo>(_entities[0].properties[8]);
}
