// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_category.dart';

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
abstract class V2IncomeCategoryCollectionReference
    implements
        V2IncomeCategoryQuery,
        FirestoreCollectionReference<V2IncomeCategoryQuerySnapshot> {
  factory V2IncomeCategoryCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$V2IncomeCategoryCollectionReference;

  static V2IncomeCategory fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$V2IncomeCategoryFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    V2IncomeCategory value,
    SetOptions? options,
  ) {
    return _$V2IncomeCategoryToJson(value);
  }

  @override
  V2IncomeCategoryDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<V2IncomeCategoryDocumentReference> add(V2IncomeCategory value);
}

class _$V2IncomeCategoryCollectionReference extends _$V2IncomeCategoryQuery
    implements V2IncomeCategoryCollectionReference {
  factory _$V2IncomeCategoryCollectionReference(
      [FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$V2IncomeCategoryCollectionReference._(
      firestore.collection('v2IncomeCategory').withConverter(
            fromFirestore: V2IncomeCategoryCollectionReference.fromFirestore,
            toFirestore: V2IncomeCategoryCollectionReference.toFirestore,
          ),
    );
  }

  _$V2IncomeCategoryCollectionReference._(
    CollectionReference<V2IncomeCategory> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<V2IncomeCategory> get reference =>
      super.reference as CollectionReference<V2IncomeCategory>;

  @override
  V2IncomeCategoryDocumentReference doc([String? id]) {
    return V2IncomeCategoryDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<V2IncomeCategoryDocumentReference> add(V2IncomeCategory value) {
    return reference
        .add(value)
        .then((ref) => V2IncomeCategoryDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$V2IncomeCategoryCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class V2IncomeCategoryDocumentReference
    extends FirestoreDocumentReference<V2IncomeCategoryDocumentSnapshot> {
  factory V2IncomeCategoryDocumentReference(
          DocumentReference<V2IncomeCategory> reference) =
      _$V2IncomeCategoryDocumentReference;

  DocumentReference<V2IncomeCategory> get reference;

  /// A reference to the [V2IncomeCategoryCollectionReference] containing this document.
  V2IncomeCategoryCollectionReference get parent {
    return _$V2IncomeCategoryCollectionReference(reference.firestore);
  }

  late final IncomeCategoryCollectionReference incomeCategories =
      _$IncomeCategoryCollectionReference(
    reference,
  );

  @override
  Stream<V2IncomeCategoryDocumentSnapshot> snapshots();

  @override
  Future<V2IncomeCategoryDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> set(V2IncomeCategory value);
}

class _$V2IncomeCategoryDocumentReference
    extends FirestoreDocumentReference<V2IncomeCategoryDocumentSnapshot>
    implements V2IncomeCategoryDocumentReference {
  _$V2IncomeCategoryDocumentReference(this.reference);

  @override
  final DocumentReference<V2IncomeCategory> reference;

  /// A reference to the [V2IncomeCategoryCollectionReference] containing this document.
  V2IncomeCategoryCollectionReference get parent {
    return _$V2IncomeCategoryCollectionReference(reference.firestore);
  }

  late final IncomeCategoryCollectionReference incomeCategories =
      _$IncomeCategoryCollectionReference(
    reference,
  );

  @override
  Stream<V2IncomeCategoryDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return V2IncomeCategoryDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<V2IncomeCategoryDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return V2IncomeCategoryDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> set(V2IncomeCategory value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is V2IncomeCategoryDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class V2IncomeCategoryDocumentSnapshot extends FirestoreDocumentSnapshot {
  V2IncomeCategoryDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<V2IncomeCategory> snapshot;

  @override
  V2IncomeCategoryDocumentReference get reference {
    return V2IncomeCategoryDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final V2IncomeCategory? data;
}

abstract class V2IncomeCategoryQuery
    implements QueryReference<V2IncomeCategoryQuerySnapshot> {
  @override
  V2IncomeCategoryQuery limit(int limit);

  @override
  V2IncomeCategoryQuery limitToLast(int limit);
}

class _$V2IncomeCategoryQuery
    extends QueryReference<V2IncomeCategoryQuerySnapshot>
    implements V2IncomeCategoryQuery {
  _$V2IncomeCategoryQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<V2IncomeCategory> reference;

  V2IncomeCategoryQuerySnapshot _decodeSnapshot(
    QuerySnapshot<V2IncomeCategory> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return V2IncomeCategoryQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<V2IncomeCategoryDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: V2IncomeCategoryDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return V2IncomeCategoryQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<V2IncomeCategoryQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<V2IncomeCategoryQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  V2IncomeCategoryQuery limit(int limit) {
    return _$V2IncomeCategoryQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  V2IncomeCategoryQuery limitToLast(int limit) {
    return _$V2IncomeCategoryQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$V2IncomeCategoryQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class V2IncomeCategoryQuerySnapshot
    extends FirestoreQuerySnapshot<V2IncomeCategoryQueryDocumentSnapshot> {
  V2IncomeCategoryQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<V2IncomeCategory> snapshot;

  @override
  final List<V2IncomeCategoryQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<V2IncomeCategoryDocumentSnapshot>>
      docChanges;
}

class V2IncomeCategoryQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot
    implements V2IncomeCategoryDocumentSnapshot {
  V2IncomeCategoryQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<V2IncomeCategory> snapshot;

  @override
  V2IncomeCategoryDocumentReference get reference {
    return V2IncomeCategoryDocumentReference(snapshot.reference);
  }

  @override
  final V2IncomeCategory data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class IncomeCategoryCollectionReference
    implements
        IncomeCategoryQuery,
        FirestoreCollectionReference<IncomeCategoryQuerySnapshot> {
  factory IncomeCategoryCollectionReference(
    DocumentReference<V2IncomeCategory> parent,
  ) = _$IncomeCategoryCollectionReference;

  static IncomeCategory fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return IncomeCategory.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    IncomeCategory value,
    SetOptions? options,
  ) {
    return _$IncomeCategoryToJson(value);
  }

  /// A reference to the containing [V2IncomeCategoryDocumentReference] if this is a subcollection.
  V2IncomeCategoryDocumentReference get parent;

  @override
  IncomeCategoryDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<IncomeCategoryDocumentReference> add(IncomeCategory value);
}

class _$IncomeCategoryCollectionReference extends _$IncomeCategoryQuery
    implements IncomeCategoryCollectionReference {
  factory _$IncomeCategoryCollectionReference(
    DocumentReference<V2IncomeCategory> parent,
  ) {
    return _$IncomeCategoryCollectionReference._(
      V2IncomeCategoryDocumentReference(parent),
      parent.collection('incomeCategories').withConverter(
            fromFirestore: IncomeCategoryCollectionReference.fromFirestore,
            toFirestore: IncomeCategoryCollectionReference.toFirestore,
          ),
    );
  }

  _$IncomeCategoryCollectionReference._(
    this.parent,
    CollectionReference<IncomeCategory> reference,
  ) : super(reference, reference);

  @override
  final V2IncomeCategoryDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<IncomeCategory> get reference =>
      super.reference as CollectionReference<IncomeCategory>;

  @override
  IncomeCategoryDocumentReference doc([String? id]) {
    return IncomeCategoryDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<IncomeCategoryDocumentReference> add(IncomeCategory value) {
    return reference
        .add(value)
        .then((ref) => IncomeCategoryDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$IncomeCategoryCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class IncomeCategoryDocumentReference
    extends FirestoreDocumentReference<IncomeCategoryDocumentSnapshot> {
  factory IncomeCategoryDocumentReference(
          DocumentReference<IncomeCategory> reference) =
      _$IncomeCategoryDocumentReference;

  DocumentReference<IncomeCategory> get reference;

  /// A reference to the [IncomeCategoryCollectionReference] containing this document.
  IncomeCategoryCollectionReference get parent {
    return _$IncomeCategoryCollectionReference(
      reference.parent.parent!.withConverter<V2IncomeCategory>(
        fromFirestore: V2IncomeCategoryCollectionReference.fromFirestore,
        toFirestore: V2IncomeCategoryCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<IncomeCategoryDocumentSnapshot> snapshots();

  @override
  Future<IncomeCategoryDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String incomeCategoryId,
    String name,
    int budget,
    bool? isDeleted,
    int? order,
    String? iconName,
  });

  Future<void> set(IncomeCategory value);
}

class _$IncomeCategoryDocumentReference
    extends FirestoreDocumentReference<IncomeCategoryDocumentSnapshot>
    implements IncomeCategoryDocumentReference {
  _$IncomeCategoryDocumentReference(this.reference);

  @override
  final DocumentReference<IncomeCategory> reference;

  /// A reference to the [IncomeCategoryCollectionReference] containing this document.
  IncomeCategoryCollectionReference get parent {
    return _$IncomeCategoryCollectionReference(
      reference.parent.parent!.withConverter<V2IncomeCategory>(
        fromFirestore: V2IncomeCategoryCollectionReference.fromFirestore,
        toFirestore: V2IncomeCategoryCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<IncomeCategoryDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return IncomeCategoryDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<IncomeCategoryDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return IncomeCategoryDocumentSnapshot._(
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
    Object? incomeCategoryId = _sentinel,
    Object? name = _sentinel,
    Object? budget = _sentinel,
    Object? isDeleted = _sentinel,
    Object? order = _sentinel,
    Object? iconName = _sentinel,
  }) async {
    final json = {
      if (incomeCategoryId != _sentinel)
        "incomeCategoryId": incomeCategoryId as String,
      if (name != _sentinel) "name": name as String,
      if (budget != _sentinel) "budget": budget as int,
      if (isDeleted != _sentinel) "isDeleted": isDeleted as bool?,
      if (order != _sentinel) "order": order as int?,
      if (iconName != _sentinel) "iconName": iconName as String?,
    };

    return reference.update(json);
  }

  Future<void> set(IncomeCategory value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is IncomeCategoryDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class IncomeCategoryDocumentSnapshot extends FirestoreDocumentSnapshot {
  IncomeCategoryDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<IncomeCategory> snapshot;

  @override
  IncomeCategoryDocumentReference get reference {
    return IncomeCategoryDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final IncomeCategory? data;
}

abstract class IncomeCategoryQuery
    implements QueryReference<IncomeCategoryQuerySnapshot> {
  @override
  IncomeCategoryQuery limit(int limit);

  @override
  IncomeCategoryQuery limitToLast(int limit);

  IncomeCategoryQuery whereIncomeCategoryId({
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
  IncomeCategoryQuery whereName({
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
  IncomeCategoryQuery whereBudget({
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
  IncomeCategoryQuery whereIsDeleted({
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
  IncomeCategoryQuery whereOrder({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });
  IncomeCategoryQuery whereIconName({
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

  IncomeCategoryQuery orderByIncomeCategoryId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    IncomeCategoryDocumentSnapshot? startAtDocument,
    IncomeCategoryDocumentSnapshot? endAtDocument,
    IncomeCategoryDocumentSnapshot? endBeforeDocument,
    IncomeCategoryDocumentSnapshot? startAfterDocument,
  });

  IncomeCategoryQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    IncomeCategoryDocumentSnapshot? startAtDocument,
    IncomeCategoryDocumentSnapshot? endAtDocument,
    IncomeCategoryDocumentSnapshot? endBeforeDocument,
    IncomeCategoryDocumentSnapshot? startAfterDocument,
  });

  IncomeCategoryQuery orderByBudget({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    IncomeCategoryDocumentSnapshot? startAtDocument,
    IncomeCategoryDocumentSnapshot? endAtDocument,
    IncomeCategoryDocumentSnapshot? endBeforeDocument,
    IncomeCategoryDocumentSnapshot? startAfterDocument,
  });

  IncomeCategoryQuery orderByIsDeleted({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    IncomeCategoryDocumentSnapshot? startAtDocument,
    IncomeCategoryDocumentSnapshot? endAtDocument,
    IncomeCategoryDocumentSnapshot? endBeforeDocument,
    IncomeCategoryDocumentSnapshot? startAfterDocument,
  });

  IncomeCategoryQuery orderByOrder({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    IncomeCategoryDocumentSnapshot? startAtDocument,
    IncomeCategoryDocumentSnapshot? endAtDocument,
    IncomeCategoryDocumentSnapshot? endBeforeDocument,
    IncomeCategoryDocumentSnapshot? startAfterDocument,
  });

  IncomeCategoryQuery orderByIconName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    IncomeCategoryDocumentSnapshot? startAtDocument,
    IncomeCategoryDocumentSnapshot? endAtDocument,
    IncomeCategoryDocumentSnapshot? endBeforeDocument,
    IncomeCategoryDocumentSnapshot? startAfterDocument,
  });
}

class _$IncomeCategoryQuery extends QueryReference<IncomeCategoryQuerySnapshot>
    implements IncomeCategoryQuery {
  _$IncomeCategoryQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<IncomeCategory> reference;

  IncomeCategoryQuerySnapshot _decodeSnapshot(
    QuerySnapshot<IncomeCategory> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return IncomeCategoryQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<IncomeCategoryDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: IncomeCategoryDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return IncomeCategoryQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<IncomeCategoryQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<IncomeCategoryQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  IncomeCategoryQuery limit(int limit) {
    return _$IncomeCategoryQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  IncomeCategoryQuery limitToLast(int limit) {
    return _$IncomeCategoryQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  IncomeCategoryQuery whereIncomeCategoryId({
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
    return _$IncomeCategoryQuery(
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

  IncomeCategoryQuery whereName({
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
    return _$IncomeCategoryQuery(
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

  IncomeCategoryQuery whereBudget({
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
    return _$IncomeCategoryQuery(
      reference.where(
        'budget',
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

  IncomeCategoryQuery whereIsDeleted({
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
    return _$IncomeCategoryQuery(
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

  IncomeCategoryQuery whereOrder({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$IncomeCategoryQuery(
      reference.where(
        'order',
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

  IncomeCategoryQuery whereIconName({
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
    return _$IncomeCategoryQuery(
      reference.where(
        'iconName',
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

  IncomeCategoryQuery orderByIncomeCategoryId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IncomeCategoryDocumentSnapshot? startAtDocument,
    IncomeCategoryDocumentSnapshot? endAtDocument,
    IncomeCategoryDocumentSnapshot? endBeforeDocument,
    IncomeCategoryDocumentSnapshot? startAfterDocument,
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

    return _$IncomeCategoryQuery(query, _collection);
  }

  IncomeCategoryQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IncomeCategoryDocumentSnapshot? startAtDocument,
    IncomeCategoryDocumentSnapshot? endAtDocument,
    IncomeCategoryDocumentSnapshot? endBeforeDocument,
    IncomeCategoryDocumentSnapshot? startAfterDocument,
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

    return _$IncomeCategoryQuery(query, _collection);
  }

  IncomeCategoryQuery orderByBudget({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IncomeCategoryDocumentSnapshot? startAtDocument,
    IncomeCategoryDocumentSnapshot? endAtDocument,
    IncomeCategoryDocumentSnapshot? endBeforeDocument,
    IncomeCategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('budget', descending: false);

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

    return _$IncomeCategoryQuery(query, _collection);
  }

  IncomeCategoryQuery orderByIsDeleted({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IncomeCategoryDocumentSnapshot? startAtDocument,
    IncomeCategoryDocumentSnapshot? endAtDocument,
    IncomeCategoryDocumentSnapshot? endBeforeDocument,
    IncomeCategoryDocumentSnapshot? startAfterDocument,
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

    return _$IncomeCategoryQuery(query, _collection);
  }

  IncomeCategoryQuery orderByOrder({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IncomeCategoryDocumentSnapshot? startAtDocument,
    IncomeCategoryDocumentSnapshot? endAtDocument,
    IncomeCategoryDocumentSnapshot? endBeforeDocument,
    IncomeCategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('order', descending: false);

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

    return _$IncomeCategoryQuery(query, _collection);
  }

  IncomeCategoryQuery orderByIconName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    IncomeCategoryDocumentSnapshot? startAtDocument,
    IncomeCategoryDocumentSnapshot? endAtDocument,
    IncomeCategoryDocumentSnapshot? endBeforeDocument,
    IncomeCategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('iconName', descending: false);

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

    return _$IncomeCategoryQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$IncomeCategoryQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class IncomeCategoryQuerySnapshot
    extends FirestoreQuerySnapshot<IncomeCategoryQueryDocumentSnapshot> {
  IncomeCategoryQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<IncomeCategory> snapshot;

  @override
  final List<IncomeCategoryQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<IncomeCategoryDocumentSnapshot>>
      docChanges;
}

class IncomeCategoryQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements IncomeCategoryDocumentSnapshot {
  IncomeCategoryQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<IncomeCategory> snapshot;

  @override
  IncomeCategoryDocumentReference get reference {
    return IncomeCategoryDocumentReference(snapshot.reference);
  }

  @override
  final IncomeCategory data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2IncomeCategory _$V2IncomeCategoryFromJson(Map<String, dynamic> json) =>
    V2IncomeCategory();

Map<String, dynamic> _$V2IncomeCategoryToJson(V2IncomeCategory instance) =>
    <String, dynamic>{};

IncomeCategory _$IncomeCategoryFromJson(Map<String, dynamic> json) =>
    IncomeCategory(
      incomeCategoryId: json['incomeCategoryId'] as String,
      createdAt: const AutoTimestampConverter().fromJson(json['createdAt']),
      updatedAt: const AutoTimestampConverter().fromJson(json['updatedAt']),
      name: json['name'] as String,
      budget: json['budget'] as int,
      isDeleted: const DefaultFalseConverter().fromJson(json['isDeleted']),
      order:
          const AutoSecondsSinceEpochConverter().fromJson(json['order'] as int),
      iconName: json['iconName'] as String?,
    );

Map<String, dynamic> _$IncomeCategoryToJson(IncomeCategory instance) =>
    <String, dynamic>{
      'incomeCategoryId': instance.incomeCategoryId,
      'createdAt': const AutoTimestampConverter().toJson(instance.createdAt),
      'updatedAt': const AutoTimestampConverter().toJson(instance.updatedAt),
      'name': instance.name,
      'budget': instance.budget,
      'isDeleted': const DefaultFalseConverter().toJson(instance.isDeleted),
      'order': const AutoSecondsSinceEpochConverter().toJson(instance.order),
      'iconName': instance.iconName,
    };
