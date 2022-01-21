// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category.dart';

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
abstract class V2ExpenseCategoryCollectionReference
    implements
        V2ExpenseCategoryQuery,
        FirestoreCollectionReference<V2ExpenseCategoryQuerySnapshot> {
  factory V2ExpenseCategoryCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$V2ExpenseCategoryCollectionReference;

  static V2ExpenseCategory fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$V2ExpenseCategoryFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    V2ExpenseCategory value,
    SetOptions? options,
  ) {
    return _$V2ExpenseCategoryToJson(value);
  }

  @override
  V2ExpenseCategoryDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<V2ExpenseCategoryDocumentReference> add(V2ExpenseCategory value);
}

class _$V2ExpenseCategoryCollectionReference extends _$V2ExpenseCategoryQuery
    implements V2ExpenseCategoryCollectionReference {
  factory _$V2ExpenseCategoryCollectionReference(
      [FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$V2ExpenseCategoryCollectionReference._(
      firestore.collection('v2ExpenseCategory').withConverter(
            fromFirestore: V2ExpenseCategoryCollectionReference.fromFirestore,
            toFirestore: V2ExpenseCategoryCollectionReference.toFirestore,
          ),
    );
  }

  _$V2ExpenseCategoryCollectionReference._(
    CollectionReference<V2ExpenseCategory> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<V2ExpenseCategory> get reference =>
      super.reference as CollectionReference<V2ExpenseCategory>;

  @override
  V2ExpenseCategoryDocumentReference doc([String? id]) {
    return V2ExpenseCategoryDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<V2ExpenseCategoryDocumentReference> add(V2ExpenseCategory value) {
    return reference
        .add(value)
        .then((ref) => V2ExpenseCategoryDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$V2ExpenseCategoryCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class V2ExpenseCategoryDocumentReference
    extends FirestoreDocumentReference<V2ExpenseCategoryDocumentSnapshot> {
  factory V2ExpenseCategoryDocumentReference(
          DocumentReference<V2ExpenseCategory> reference) =
      _$V2ExpenseCategoryDocumentReference;

  DocumentReference<V2ExpenseCategory> get reference;

  /// A reference to the [V2ExpenseCategoryCollectionReference] containing this document.
  V2ExpenseCategoryCollectionReference get parent {
    return _$V2ExpenseCategoryCollectionReference(reference.firestore);
  }

  late final ExpenseCategoryCollectionReference expenseCategories =
      _$ExpenseCategoryCollectionReference(
    reference,
  );

  @override
  Stream<V2ExpenseCategoryDocumentSnapshot> snapshots();

  @override
  Future<V2ExpenseCategoryDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> set(V2ExpenseCategory value);
}

class _$V2ExpenseCategoryDocumentReference
    extends FirestoreDocumentReference<V2ExpenseCategoryDocumentSnapshot>
    implements V2ExpenseCategoryDocumentReference {
  _$V2ExpenseCategoryDocumentReference(this.reference);

  @override
  final DocumentReference<V2ExpenseCategory> reference;

  /// A reference to the [V2ExpenseCategoryCollectionReference] containing this document.
  V2ExpenseCategoryCollectionReference get parent {
    return _$V2ExpenseCategoryCollectionReference(reference.firestore);
  }

  late final ExpenseCategoryCollectionReference expenseCategories =
      _$ExpenseCategoryCollectionReference(
    reference,
  );

  @override
  Stream<V2ExpenseCategoryDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return V2ExpenseCategoryDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<V2ExpenseCategoryDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return V2ExpenseCategoryDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> set(V2ExpenseCategory value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is V2ExpenseCategoryDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class V2ExpenseCategoryDocumentSnapshot extends FirestoreDocumentSnapshot {
  V2ExpenseCategoryDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<V2ExpenseCategory> snapshot;

  @override
  V2ExpenseCategoryDocumentReference get reference {
    return V2ExpenseCategoryDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final V2ExpenseCategory? data;
}

abstract class V2ExpenseCategoryQuery
    implements QueryReference<V2ExpenseCategoryQuerySnapshot> {
  @override
  V2ExpenseCategoryQuery limit(int limit);

  @override
  V2ExpenseCategoryQuery limitToLast(int limit);
}

class _$V2ExpenseCategoryQuery
    extends QueryReference<V2ExpenseCategoryQuerySnapshot>
    implements V2ExpenseCategoryQuery {
  _$V2ExpenseCategoryQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<V2ExpenseCategory> reference;

  V2ExpenseCategoryQuerySnapshot _decodeSnapshot(
    QuerySnapshot<V2ExpenseCategory> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return V2ExpenseCategoryQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<V2ExpenseCategoryDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: V2ExpenseCategoryDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return V2ExpenseCategoryQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<V2ExpenseCategoryQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<V2ExpenseCategoryQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  V2ExpenseCategoryQuery limit(int limit) {
    return _$V2ExpenseCategoryQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  V2ExpenseCategoryQuery limitToLast(int limit) {
    return _$V2ExpenseCategoryQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$V2ExpenseCategoryQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class V2ExpenseCategoryQuerySnapshot
    extends FirestoreQuerySnapshot<V2ExpenseCategoryQueryDocumentSnapshot> {
  V2ExpenseCategoryQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<V2ExpenseCategory> snapshot;

  @override
  final List<V2ExpenseCategoryQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<V2ExpenseCategoryDocumentSnapshot>>
      docChanges;
}

class V2ExpenseCategoryQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot
    implements V2ExpenseCategoryDocumentSnapshot {
  V2ExpenseCategoryQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<V2ExpenseCategory> snapshot;

  @override
  V2ExpenseCategoryDocumentReference get reference {
    return V2ExpenseCategoryDocumentReference(snapshot.reference);
  }

  @override
  final V2ExpenseCategory data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ExpenseCategoryCollectionReference
    implements
        ExpenseCategoryQuery,
        FirestoreCollectionReference<ExpenseCategoryQuerySnapshot> {
  factory ExpenseCategoryCollectionReference(
    DocumentReference<V2ExpenseCategory> parent,
  ) = _$ExpenseCategoryCollectionReference;

  static ExpenseCategory fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return ExpenseCategory.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    ExpenseCategory value,
    SetOptions? options,
  ) {
    return _$ExpenseCategoryToJson(value);
  }

  /// A reference to the containing [V2ExpenseCategoryDocumentReference] if this is a subcollection.
  V2ExpenseCategoryDocumentReference get parent;

  @override
  ExpenseCategoryDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ExpenseCategoryDocumentReference> add(ExpenseCategory value);
}

class _$ExpenseCategoryCollectionReference extends _$ExpenseCategoryQuery
    implements ExpenseCategoryCollectionReference {
  factory _$ExpenseCategoryCollectionReference(
    DocumentReference<V2ExpenseCategory> parent,
  ) {
    return _$ExpenseCategoryCollectionReference._(
      V2ExpenseCategoryDocumentReference(parent),
      parent.collection('expenseCategories').withConverter(
            fromFirestore: ExpenseCategoryCollectionReference.fromFirestore,
            toFirestore: ExpenseCategoryCollectionReference.toFirestore,
          ),
    );
  }

  _$ExpenseCategoryCollectionReference._(
    this.parent,
    CollectionReference<ExpenseCategory> reference,
  ) : super(reference, reference);

  @override
  final V2ExpenseCategoryDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<ExpenseCategory> get reference =>
      super.reference as CollectionReference<ExpenseCategory>;

  @override
  ExpenseCategoryDocumentReference doc([String? id]) {
    return ExpenseCategoryDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ExpenseCategoryDocumentReference> add(ExpenseCategory value) {
    return reference
        .add(value)
        .then((ref) => ExpenseCategoryDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ExpenseCategoryCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ExpenseCategoryDocumentReference
    extends FirestoreDocumentReference<ExpenseCategoryDocumentSnapshot> {
  factory ExpenseCategoryDocumentReference(
          DocumentReference<ExpenseCategory> reference) =
      _$ExpenseCategoryDocumentReference;

  DocumentReference<ExpenseCategory> get reference;

  /// A reference to the [ExpenseCategoryCollectionReference] containing this document.
  ExpenseCategoryCollectionReference get parent {
    return _$ExpenseCategoryCollectionReference(
      reference.parent.parent!.withConverter<V2ExpenseCategory>(
        fromFirestore: V2ExpenseCategoryCollectionReference.fromFirestore,
        toFirestore: V2ExpenseCategoryCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ExpenseCategoryDocumentSnapshot> snapshots();

  @override
  Future<ExpenseCategoryDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String expenseCategoryId,
    String name,
    int budget,
    bool? isDeleted,
    int? order,
    String? iconName,
  });

  Future<void> set(ExpenseCategory value);
}

class _$ExpenseCategoryDocumentReference
    extends FirestoreDocumentReference<ExpenseCategoryDocumentSnapshot>
    implements ExpenseCategoryDocumentReference {
  _$ExpenseCategoryDocumentReference(this.reference);

  @override
  final DocumentReference<ExpenseCategory> reference;

  /// A reference to the [ExpenseCategoryCollectionReference] containing this document.
  ExpenseCategoryCollectionReference get parent {
    return _$ExpenseCategoryCollectionReference(
      reference.parent.parent!.withConverter<V2ExpenseCategory>(
        fromFirestore: V2ExpenseCategoryCollectionReference.fromFirestore,
        toFirestore: V2ExpenseCategoryCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ExpenseCategoryDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return ExpenseCategoryDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<ExpenseCategoryDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return ExpenseCategoryDocumentSnapshot._(
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
    Object? expenseCategoryId = _sentinel,
    Object? name = _sentinel,
    Object? budget = _sentinel,
    Object? isDeleted = _sentinel,
    Object? order = _sentinel,
    Object? iconName = _sentinel,
  }) async {
    final json = {
      if (expenseCategoryId != _sentinel)
        "expenseCategoryId": expenseCategoryId as String,
      if (name != _sentinel) "name": name as String,
      if (budget != _sentinel) "budget": budget as int,
      if (isDeleted != _sentinel) "isDeleted": isDeleted as bool?,
      if (order != _sentinel) "order": order as int?,
      if (iconName != _sentinel) "iconName": iconName as String?,
    };

    return reference.update(json);
  }

  Future<void> set(ExpenseCategory value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpenseCategoryDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class ExpenseCategoryDocumentSnapshot extends FirestoreDocumentSnapshot {
  ExpenseCategoryDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<ExpenseCategory> snapshot;

  @override
  ExpenseCategoryDocumentReference get reference {
    return ExpenseCategoryDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final ExpenseCategory? data;
}

abstract class ExpenseCategoryQuery
    implements QueryReference<ExpenseCategoryQuerySnapshot> {
  @override
  ExpenseCategoryQuery limit(int limit);

  @override
  ExpenseCategoryQuery limitToLast(int limit);

  ExpenseCategoryQuery whereExpenseCategoryId({
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
  ExpenseCategoryQuery whereName({
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
  ExpenseCategoryQuery whereBudget({
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
  ExpenseCategoryQuery whereIsDeleted({
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
  ExpenseCategoryQuery whereOrder({
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
  ExpenseCategoryQuery whereIconName({
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

  ExpenseCategoryQuery orderByExpenseCategoryId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExpenseCategoryDocumentSnapshot? startAtDocument,
    ExpenseCategoryDocumentSnapshot? endAtDocument,
    ExpenseCategoryDocumentSnapshot? endBeforeDocument,
    ExpenseCategoryDocumentSnapshot? startAfterDocument,
  });

  ExpenseCategoryQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExpenseCategoryDocumentSnapshot? startAtDocument,
    ExpenseCategoryDocumentSnapshot? endAtDocument,
    ExpenseCategoryDocumentSnapshot? endBeforeDocument,
    ExpenseCategoryDocumentSnapshot? startAfterDocument,
  });

  ExpenseCategoryQuery orderByBudget({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    ExpenseCategoryDocumentSnapshot? startAtDocument,
    ExpenseCategoryDocumentSnapshot? endAtDocument,
    ExpenseCategoryDocumentSnapshot? endBeforeDocument,
    ExpenseCategoryDocumentSnapshot? startAfterDocument,
  });

  ExpenseCategoryQuery orderByIsDeleted({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    ExpenseCategoryDocumentSnapshot? startAtDocument,
    ExpenseCategoryDocumentSnapshot? endAtDocument,
    ExpenseCategoryDocumentSnapshot? endBeforeDocument,
    ExpenseCategoryDocumentSnapshot? startAfterDocument,
  });

  ExpenseCategoryQuery orderByOrder({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    ExpenseCategoryDocumentSnapshot? startAtDocument,
    ExpenseCategoryDocumentSnapshot? endAtDocument,
    ExpenseCategoryDocumentSnapshot? endBeforeDocument,
    ExpenseCategoryDocumentSnapshot? startAfterDocument,
  });

  ExpenseCategoryQuery orderByIconName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ExpenseCategoryDocumentSnapshot? startAtDocument,
    ExpenseCategoryDocumentSnapshot? endAtDocument,
    ExpenseCategoryDocumentSnapshot? endBeforeDocument,
    ExpenseCategoryDocumentSnapshot? startAfterDocument,
  });
}

class _$ExpenseCategoryQuery
    extends QueryReference<ExpenseCategoryQuerySnapshot>
    implements ExpenseCategoryQuery {
  _$ExpenseCategoryQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<ExpenseCategory> reference;

  ExpenseCategoryQuerySnapshot _decodeSnapshot(
    QuerySnapshot<ExpenseCategory> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return ExpenseCategoryQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<ExpenseCategoryDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: ExpenseCategoryDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return ExpenseCategoryQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<ExpenseCategoryQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<ExpenseCategoryQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  ExpenseCategoryQuery limit(int limit) {
    return _$ExpenseCategoryQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  ExpenseCategoryQuery limitToLast(int limit) {
    return _$ExpenseCategoryQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  ExpenseCategoryQuery whereExpenseCategoryId({
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
    return _$ExpenseCategoryQuery(
      reference.where(
        'expenseCategoryId',
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

  ExpenseCategoryQuery whereName({
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
    return _$ExpenseCategoryQuery(
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

  ExpenseCategoryQuery whereBudget({
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
    return _$ExpenseCategoryQuery(
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

  ExpenseCategoryQuery whereIsDeleted({
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
    return _$ExpenseCategoryQuery(
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

  ExpenseCategoryQuery whereOrder({
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
    return _$ExpenseCategoryQuery(
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

  ExpenseCategoryQuery whereIconName({
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
    return _$ExpenseCategoryQuery(
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

  ExpenseCategoryQuery orderByExpenseCategoryId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseCategoryDocumentSnapshot? startAtDocument,
    ExpenseCategoryDocumentSnapshot? endAtDocument,
    ExpenseCategoryDocumentSnapshot? endBeforeDocument,
    ExpenseCategoryDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('expenseCategoryId', descending: false);

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

    return _$ExpenseCategoryQuery(query, _collection);
  }

  ExpenseCategoryQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseCategoryDocumentSnapshot? startAtDocument,
    ExpenseCategoryDocumentSnapshot? endAtDocument,
    ExpenseCategoryDocumentSnapshot? endBeforeDocument,
    ExpenseCategoryDocumentSnapshot? startAfterDocument,
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

    return _$ExpenseCategoryQuery(query, _collection);
  }

  ExpenseCategoryQuery orderByBudget({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseCategoryDocumentSnapshot? startAtDocument,
    ExpenseCategoryDocumentSnapshot? endAtDocument,
    ExpenseCategoryDocumentSnapshot? endBeforeDocument,
    ExpenseCategoryDocumentSnapshot? startAfterDocument,
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

    return _$ExpenseCategoryQuery(query, _collection);
  }

  ExpenseCategoryQuery orderByIsDeleted({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseCategoryDocumentSnapshot? startAtDocument,
    ExpenseCategoryDocumentSnapshot? endAtDocument,
    ExpenseCategoryDocumentSnapshot? endBeforeDocument,
    ExpenseCategoryDocumentSnapshot? startAfterDocument,
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

    return _$ExpenseCategoryQuery(query, _collection);
  }

  ExpenseCategoryQuery orderByOrder({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseCategoryDocumentSnapshot? startAtDocument,
    ExpenseCategoryDocumentSnapshot? endAtDocument,
    ExpenseCategoryDocumentSnapshot? endBeforeDocument,
    ExpenseCategoryDocumentSnapshot? startAfterDocument,
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

    return _$ExpenseCategoryQuery(query, _collection);
  }

  ExpenseCategoryQuery orderByIconName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseCategoryDocumentSnapshot? startAtDocument,
    ExpenseCategoryDocumentSnapshot? endAtDocument,
    ExpenseCategoryDocumentSnapshot? endBeforeDocument,
    ExpenseCategoryDocumentSnapshot? startAfterDocument,
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

    return _$ExpenseCategoryQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$ExpenseCategoryQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ExpenseCategoryQuerySnapshot
    extends FirestoreQuerySnapshot<ExpenseCategoryQueryDocumentSnapshot> {
  ExpenseCategoryQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<ExpenseCategory> snapshot;

  @override
  final List<ExpenseCategoryQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ExpenseCategoryDocumentSnapshot>>
      docChanges;
}

class ExpenseCategoryQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot
    implements ExpenseCategoryDocumentSnapshot {
  ExpenseCategoryQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<ExpenseCategory> snapshot;

  @override
  ExpenseCategoryDocumentReference get reference {
    return ExpenseCategoryDocumentReference(snapshot.reference);
  }

  @override
  final ExpenseCategory data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2ExpenseCategory _$V2ExpenseCategoryFromJson(Map<String, dynamic> json) =>
    V2ExpenseCategory();

Map<String, dynamic> _$V2ExpenseCategoryToJson(V2ExpenseCategory instance) =>
    <String, dynamic>{};

ExpenseCategory _$ExpenseCategoryFromJson(Map<String, dynamic> json) =>
    ExpenseCategory(
      expenseCategoryId: json['expenseCategoryId'] as String,
      createdAt: const AutoTimestampConverter().fromJson(json['createdAt']),
      updatedAt: const AutoTimestampConverter().fromJson(json['updatedAt']),
      name: json['name'] as String,
      budget: json['budget'] as int,
      isDeleted: const DefaultFalseConverter().fromJson(json['isDeleted']),
      order:
          const AutoSecondsSinceEpochConverter().fromJson(json['order'] as int),
      iconName: json['iconName'] as String?,
    );

Map<String, dynamic> _$ExpenseCategoryToJson(ExpenseCategory instance) =>
    <String, dynamic>{
      'expenseCategoryId': instance.expenseCategoryId,
      'createdAt': const AutoTimestampConverter().toJson(instance.createdAt),
      'updatedAt': const AutoTimestampConverter().toJson(instance.updatedAt),
      'name': instance.name,
      'budget': instance.budget,
      'isDeleted': const DefaultFalseConverter().toJson(instance.isDeleted),
      'order': const AutoSecondsSinceEpochConverter().toJson(instance.order),
      'iconName': instance.iconName,
    };
