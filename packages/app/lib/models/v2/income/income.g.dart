// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class V2IncomeCollectionReference
    implements
        V2IncomeQuery,
        FirestoreCollectionReference<V2IncomeQuerySnapshot> {
  factory V2IncomeCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$V2IncomeCollectionReference;

  static V2Income fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$V2IncomeFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    V2Income value,
    SetOptions? options,
  ) {
    return _$V2IncomeToJson(value);
  }

  @override
  V2IncomeDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<V2IncomeDocumentReference> add(V2Income value);
}

class _$V2IncomeCollectionReference extends _$V2IncomeQuery
    implements V2IncomeCollectionReference {
  factory _$V2IncomeCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$V2IncomeCollectionReference._(
      firestore.collection('v2Income').withConverter(
            fromFirestore: V2IncomeCollectionReference.fromFirestore,
            toFirestore: V2IncomeCollectionReference.toFirestore,
          ),
    );
  }

  _$V2IncomeCollectionReference._(
    CollectionReference<V2Income> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<V2Income> get reference =>
      super.reference as CollectionReference<V2Income>;

  @override
  V2IncomeDocumentReference doc([String? id]) {
    return V2IncomeDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<V2IncomeDocumentReference> add(V2Income value) {
    return reference.add(value).then((ref) => V2IncomeDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$V2IncomeCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class V2IncomeDocumentReference
    extends FirestoreDocumentReference<V2IncomeDocumentSnapshot> {
  factory V2IncomeDocumentReference(DocumentReference<V2Income> reference) =
      _$V2IncomeDocumentReference;

  DocumentReference<V2Income> get reference;

  /// A reference to the [V2IncomeCollectionReference] containing this document.
  V2IncomeCollectionReference get parent {
    return _$V2IncomeCollectionReference(reference.firestore);
  }

  late final IncomeCollectionReference incomes = _$IncomeCollectionReference(
    reference,
  );

  @override
  Stream<V2IncomeDocumentSnapshot> snapshots();

  @override
  Future<V2IncomeDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> set(V2Income value);
}

class _$V2IncomeDocumentReference
    extends FirestoreDocumentReference<V2IncomeDocumentSnapshot>
    implements V2IncomeDocumentReference {
  _$V2IncomeDocumentReference(this.reference);

  @override
  final DocumentReference<V2Income> reference;

  /// A reference to the [V2IncomeCollectionReference] containing this document.
  V2IncomeCollectionReference get parent {
    return _$V2IncomeCollectionReference(reference.firestore);
  }

  late final IncomeCollectionReference incomes = _$IncomeCollectionReference(
    reference,
  );

  @override
  Stream<V2IncomeDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return V2IncomeDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<V2IncomeDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return V2IncomeDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> set(V2Income value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is V2IncomeDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class V2IncomeDocumentSnapshot extends FirestoreDocumentSnapshot {
  V2IncomeDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<V2Income> snapshot;

  @override
  V2IncomeDocumentReference get reference {
    return V2IncomeDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final V2Income? data;
}

abstract class V2IncomeQuery implements QueryReference<V2IncomeQuerySnapshot> {
  @override
  V2IncomeQuery limit(int limit);

  @override
  V2IncomeQuery limitToLast(int limit);
}

class _$V2IncomeQuery extends QueryReference<V2IncomeQuerySnapshot>
    implements V2IncomeQuery {
  _$V2IncomeQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<V2Income> reference;

  V2IncomeQuerySnapshot _decodeSnapshot(
    QuerySnapshot<V2Income> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return V2IncomeQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<V2IncomeDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: V2IncomeDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return V2IncomeQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<V2IncomeQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<V2IncomeQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  V2IncomeQuery limit(int limit) {
    return _$V2IncomeQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  V2IncomeQuery limitToLast(int limit) {
    return _$V2IncomeQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$V2IncomeQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class V2IncomeQuerySnapshot
    extends FirestoreQuerySnapshot<V2IncomeQueryDocumentSnapshot> {
  V2IncomeQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<V2Income> snapshot;

  @override
  final List<V2IncomeQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<V2IncomeDocumentSnapshot>> docChanges;
}

class V2IncomeQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements V2IncomeDocumentSnapshot {
  V2IncomeQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<V2Income> snapshot;

  @override
  V2IncomeDocumentReference get reference {
    return V2IncomeDocumentReference(snapshot.reference);
  }

  @override
  final V2Income data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class IncomeCollectionReference
    implements IncomeQuery, FirestoreCollectionReference<IncomeQuerySnapshot> {
  factory IncomeCollectionReference(
    DocumentReference<V2Income> parent,
  ) = _$IncomeCollectionReference;

  static Income fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Income.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Income value,
    SetOptions? options,
  ) {
    return _$IncomeToJson(value);
  }

  /// A reference to the containing [V2IncomeDocumentReference] if this is a subcollection.
  V2IncomeDocumentReference get parent;

  @override
  IncomeDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<IncomeDocumentReference> add(Income value);
}

class _$IncomeCollectionReference extends _$IncomeQuery
    implements IncomeCollectionReference {
  factory _$IncomeCollectionReference(
    DocumentReference<V2Income> parent,
  ) {
    return _$IncomeCollectionReference._(
      V2IncomeDocumentReference(parent),
      parent.collection('incomes').withConverter(
            fromFirestore: IncomeCollectionReference.fromFirestore,
            toFirestore: IncomeCollectionReference.toFirestore,
          ),
    );
  }

  _$IncomeCollectionReference._(
    this.parent,
    CollectionReference<Income> reference,
  ) : super(reference, reference);

  @override
  final V2IncomeDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Income> get reference =>
      super.reference as CollectionReference<Income>;

  @override
  IncomeDocumentReference doc([String? id]) {
    return IncomeDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<IncomeDocumentReference> add(Income value) {
    return reference.add(value).then((ref) => IncomeDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$IncomeCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class IncomeDocumentReference
    extends FirestoreDocumentReference<IncomeDocumentSnapshot> {
  factory IncomeDocumentReference(DocumentReference<Income> reference) =
      _$IncomeDocumentReference;

  DocumentReference<Income> get reference;

  /// A reference to the [IncomeCollectionReference] containing this document.
  IncomeCollectionReference get parent {
    return _$IncomeCollectionReference(
      reference.parent.parent!.withConverter<V2Income>(
        fromFirestore: V2IncomeCollectionReference.fromFirestore,
        toFirestore: V2IncomeCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<IncomeDocumentSnapshot> snapshots();

  @override
  Future<IncomeDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String incomeId,
    String name,
    int price,
    String incomeCategoryId,
    String? earnedAt,
    bool? isDeleted,
  });

  Future<void> set(Income value);
}

class _$IncomeDocumentReference
    extends FirestoreDocumentReference<IncomeDocumentSnapshot>
    implements IncomeDocumentReference {
  _$IncomeDocumentReference(this.reference);

  @override
  final DocumentReference<Income> reference;

  /// A reference to the [IncomeCollectionReference] containing this document.
  IncomeCollectionReference get parent {
    return _$IncomeCollectionReference(
      reference.parent.parent!.withConverter<V2Income>(
        fromFirestore: V2IncomeCollectionReference.fromFirestore,
        toFirestore: V2IncomeCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<IncomeDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return IncomeDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<IncomeDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return IncomeDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? incomeId = _sentinel,
    Object? name = _sentinel,
    Object? price = _sentinel,
    Object? incomeCategoryId = _sentinel,
    Object? earnedAt = _sentinel,
    Object? isDeleted = _sentinel,
  }) async {
    final json = {
      if (incomeId != _sentinel) "incomeId": incomeId as String,
      if (name != _sentinel) "name": name as String,
      if (price != _sentinel) "price": price as int,
      if (incomeCategoryId != _sentinel)
        "incomeCategoryId": incomeCategoryId as String,
      if (earnedAt != _sentinel) "earnedAt": earnedAt as String?,
      if (isDeleted != _sentinel) "isDeleted": isDeleted as bool?,
    };

    return reference.update(json);
  }

  Future<void> set(Income value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is IncomeDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class IncomeDocumentSnapshot extends FirestoreDocumentSnapshot {
  IncomeDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Income> snapshot;

  @override
  IncomeDocumentReference get reference {
    return IncomeDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Income? data;
}

abstract class IncomeQuery implements QueryReference<IncomeQuerySnapshot> {
  @override
  IncomeQuery limit(int limit);

  @override
  IncomeQuery limitToLast(int limit);

  IncomeQuery whereIncomeId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  IncomeQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  IncomeQuery wherePrice({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  IncomeQuery whereIncomeCategoryId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  IncomeQuery whereEarnedAt({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  IncomeQuery whereIsDeleted({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  });

  IncomeQuery orderByIncomeId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    IncomeDocumentSnapshot? startAtDocument,
    IncomeDocumentSnapshot? endAtDocument,
    IncomeDocumentSnapshot? endBeforeDocument,
    IncomeDocumentSnapshot? startAfterDocument,
  });

  IncomeQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    IncomeDocumentSnapshot? startAtDocument,
    IncomeDocumentSnapshot? endAtDocument,
    IncomeDocumentSnapshot? endBeforeDocument,
    IncomeDocumentSnapshot? startAfterDocument,
  });

  IncomeQuery orderByPrice({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    IncomeDocumentSnapshot? startAtDocument,
    IncomeDocumentSnapshot? endAtDocument,
    IncomeDocumentSnapshot? endBeforeDocument,
    IncomeDocumentSnapshot? startAfterDocument,
  });

  IncomeQuery orderByIncomeCategoryId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    IncomeDocumentSnapshot? startAtDocument,
    IncomeDocumentSnapshot? endAtDocument,
    IncomeDocumentSnapshot? endBeforeDocument,
    IncomeDocumentSnapshot? startAfterDocument,
  });

  IncomeQuery orderByEarnedAt({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    IncomeDocumentSnapshot? startAtDocument,
    IncomeDocumentSnapshot? endAtDocument,
    IncomeDocumentSnapshot? endBeforeDocument,
    IncomeDocumentSnapshot? startAfterDocument,
  });

  IncomeQuery orderByIsDeleted({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    IncomeDocumentSnapshot? startAtDocument,
    IncomeDocumentSnapshot? endAtDocument,
    IncomeDocumentSnapshot? endBeforeDocument,
    IncomeDocumentSnapshot? startAfterDocument,
  });
}

class _$IncomeQuery extends QueryReference<IncomeQuerySnapshot>
    implements IncomeQuery {
  _$IncomeQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Income> reference;

  IncomeQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Income> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return IncomeQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<IncomeDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: IncomeDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return IncomeQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<IncomeQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<IncomeQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  IncomeQuery limit(int limit) {
    return _$IncomeQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  IncomeQuery limitToLast(int limit) {
    return _$IncomeQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  IncomeQuery whereIncomeId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$IncomeQuery(
      reference.where(
        'incomeId',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  IncomeQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$IncomeQuery(
      reference.where(
        'name',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  IncomeQuery wherePrice({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$IncomeQuery(
      reference.where(
        'price',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  IncomeQuery whereIncomeCategoryId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$IncomeQuery(
      reference.where(
        'incomeCategoryId',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  IncomeQuery whereEarnedAt({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$IncomeQuery(
      reference.where(
        'earnedAt',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  IncomeQuery whereIsDeleted({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  }) {
    return _$IncomeQuery(
      reference.where(
        'isDeleted',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  IncomeQuery orderByIncomeId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IncomeDocumentSnapshot? startAtDocument,
    IncomeDocumentSnapshot? endAtDocument,
    IncomeDocumentSnapshot? endBeforeDocument,
    IncomeDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('incomeId', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$IncomeQuery(query, _collection);
  }

  IncomeQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IncomeDocumentSnapshot? startAtDocument,
    IncomeDocumentSnapshot? endAtDocument,
    IncomeDocumentSnapshot? endBeforeDocument,
    IncomeDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$IncomeQuery(query, _collection);
  }

  IncomeQuery orderByPrice({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IncomeDocumentSnapshot? startAtDocument,
    IncomeDocumentSnapshot? endAtDocument,
    IncomeDocumentSnapshot? endBeforeDocument,
    IncomeDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('price', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$IncomeQuery(query, _collection);
  }

  IncomeQuery orderByIncomeCategoryId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IncomeDocumentSnapshot? startAtDocument,
    IncomeDocumentSnapshot? endAtDocument,
    IncomeDocumentSnapshot? endBeforeDocument,
    IncomeDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('incomeCategoryId', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$IncomeQuery(query, _collection);
  }

  IncomeQuery orderByEarnedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IncomeDocumentSnapshot? startAtDocument,
    IncomeDocumentSnapshot? endAtDocument,
    IncomeDocumentSnapshot? endBeforeDocument,
    IncomeDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('earnedAt', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$IncomeQuery(query, _collection);
  }

  IncomeQuery orderByIsDeleted({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IncomeDocumentSnapshot? startAtDocument,
    IncomeDocumentSnapshot? endAtDocument,
    IncomeDocumentSnapshot? endBeforeDocument,
    IncomeDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isDeleted', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$IncomeQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$IncomeQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class IncomeQuerySnapshot
    extends FirestoreQuerySnapshot<IncomeQueryDocumentSnapshot> {
  IncomeQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Income> snapshot;

  @override
  final List<IncomeQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<IncomeDocumentSnapshot>> docChanges;
}

class IncomeQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements IncomeDocumentSnapshot {
  IncomeQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Income> snapshot;

  @override
  IncomeDocumentReference get reference {
    return IncomeDocumentReference(snapshot.reference);
  }

  @override
  final Income data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2Income _$V2IncomeFromJson(Map<String, dynamic> json) => V2Income();

Map<String, dynamic> _$V2IncomeToJson(V2Income instance) => <String, dynamic>{};

Income _$IncomeFromJson(Map<String, dynamic> json) => Income(
      incomeId: json['incomeId'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      incomeCategoryId: json['incomeCategoryId'] as String,
      earnedAt: const AutoDateTimeIso8601StringConverter()
          .fromJson(json['earnedAt'] as String),
      createdAt: const AutoTimestampConverter().fromJson(json['createdAt']),
      updatedAt: const AutoTimestampConverter().fromJson(json['updatedAt']),
      isDeleted: const DefaultFalseConverter().fromJson(json['isDeleted']),
    );

Map<String, dynamic> _$IncomeToJson(Income instance) => <String, dynamic>{
      'incomeId': instance.incomeId,
      'name': instance.name,
      'price': instance.price,
      'incomeCategoryId': instance.incomeCategoryId,
      'earnedAt':
          const AutoDateTimeIso8601StringConverter().toJson(instance.earnedAt),
      'createdAt': const AutoTimestampConverter().toJson(instance.createdAt),
      'updatedAt': const AutoTimestampConverter().toJson(instance.updatedAt),
      'isDeleted': const DefaultFalseConverter().toJson(instance.isDeleted),
    };
