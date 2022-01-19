// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

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
abstract class V2ExpenseCollectionReference
    implements
        V2ExpenseQuery,
        FirestoreCollectionReference<V2ExpenseQuerySnapshot> {
  factory V2ExpenseCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$V2ExpenseCollectionReference;

  static V2Expense fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$V2ExpenseFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    V2Expense value,
    SetOptions? options,
  ) {
    return _$V2ExpenseToJson(value);
  }

  @override
  V2ExpenseDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<V2ExpenseDocumentReference> add(V2Expense value);
}

class _$V2ExpenseCollectionReference extends _$V2ExpenseQuery
    implements V2ExpenseCollectionReference {
  factory _$V2ExpenseCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$V2ExpenseCollectionReference._(
      firestore.collection('v2Expense').withConverter(
            fromFirestore: V2ExpenseCollectionReference.fromFirestore,
            toFirestore: V2ExpenseCollectionReference.toFirestore,
          ),
    );
  }

  _$V2ExpenseCollectionReference._(
    CollectionReference<V2Expense> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<V2Expense> get reference =>
      super.reference as CollectionReference<V2Expense>;

  @override
  V2ExpenseDocumentReference doc([String? id]) {
    return V2ExpenseDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<V2ExpenseDocumentReference> add(V2Expense value) {
    return reference.add(value).then((ref) => V2ExpenseDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$V2ExpenseCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class V2ExpenseDocumentReference
    extends FirestoreDocumentReference<V2ExpenseDocumentSnapshot> {
  factory V2ExpenseDocumentReference(DocumentReference<V2Expense> reference) =
      _$V2ExpenseDocumentReference;

  DocumentReference<V2Expense> get reference;

  /// A reference to the [V2ExpenseCollectionReference] containing this document.
  V2ExpenseCollectionReference get parent {
    return _$V2ExpenseCollectionReference(reference.firestore);
  }

  late final ExpenseCollectionReference expenses = _$ExpenseCollectionReference(
    reference,
  );

  @override
  Stream<V2ExpenseDocumentSnapshot> snapshots();

  @override
  Future<V2ExpenseDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> set(V2Expense value);
}

class _$V2ExpenseDocumentReference
    extends FirestoreDocumentReference<V2ExpenseDocumentSnapshot>
    implements V2ExpenseDocumentReference {
  _$V2ExpenseDocumentReference(this.reference);

  @override
  final DocumentReference<V2Expense> reference;

  /// A reference to the [V2ExpenseCollectionReference] containing this document.
  V2ExpenseCollectionReference get parent {
    return _$V2ExpenseCollectionReference(reference.firestore);
  }

  late final ExpenseCollectionReference expenses = _$ExpenseCollectionReference(
    reference,
  );

  @override
  Stream<V2ExpenseDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return V2ExpenseDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<V2ExpenseDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return V2ExpenseDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> set(V2Expense value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is V2ExpenseDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class V2ExpenseDocumentSnapshot extends FirestoreDocumentSnapshot {
  V2ExpenseDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<V2Expense> snapshot;

  @override
  V2ExpenseDocumentReference get reference {
    return V2ExpenseDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final V2Expense? data;
}

abstract class V2ExpenseQuery
    implements QueryReference<V2ExpenseQuerySnapshot> {
  @override
  V2ExpenseQuery limit(int limit);

  @override
  V2ExpenseQuery limitToLast(int limit);
}

class _$V2ExpenseQuery extends QueryReference<V2ExpenseQuerySnapshot>
    implements V2ExpenseQuery {
  _$V2ExpenseQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<V2Expense> reference;

  V2ExpenseQuerySnapshot _decodeSnapshot(
    QuerySnapshot<V2Expense> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return V2ExpenseQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<V2ExpenseDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: V2ExpenseDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return V2ExpenseQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<V2ExpenseQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<V2ExpenseQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  V2ExpenseQuery limit(int limit) {
    return _$V2ExpenseQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  V2ExpenseQuery limitToLast(int limit) {
    return _$V2ExpenseQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$V2ExpenseQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class V2ExpenseQuerySnapshot
    extends FirestoreQuerySnapshot<V2ExpenseQueryDocumentSnapshot> {
  V2ExpenseQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<V2Expense> snapshot;

  @override
  final List<V2ExpenseQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<V2ExpenseDocumentSnapshot>> docChanges;
}

class V2ExpenseQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements V2ExpenseDocumentSnapshot {
  V2ExpenseQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<V2Expense> snapshot;

  @override
  V2ExpenseDocumentReference get reference {
    return V2ExpenseDocumentReference(snapshot.reference);
  }

  @override
  final V2Expense data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ExpenseCollectionReference
    implements
        ExpenseQuery,
        FirestoreCollectionReference<ExpenseQuerySnapshot> {
  factory ExpenseCollectionReference(
    DocumentReference<V2Expense> parent,
  ) = _$ExpenseCollectionReference;

  static Expense fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Expense.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Expense value,
    SetOptions? options,
  ) {
    return _$ExpenseToJson(value);
  }

  /// A reference to the containing [V2ExpenseDocumentReference] if this is a subcollection.
  V2ExpenseDocumentReference get parent;

  @override
  ExpenseDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ExpenseDocumentReference> add(Expense value);
}

class _$ExpenseCollectionReference extends _$ExpenseQuery
    implements ExpenseCollectionReference {
  factory _$ExpenseCollectionReference(
    DocumentReference<V2Expense> parent,
  ) {
    return _$ExpenseCollectionReference._(
      V2ExpenseDocumentReference(parent),
      parent.collection('expenses').withConverter(
            fromFirestore: ExpenseCollectionReference.fromFirestore,
            toFirestore: ExpenseCollectionReference.toFirestore,
          ),
    );
  }

  _$ExpenseCollectionReference._(
    this.parent,
    CollectionReference<Expense> reference,
  ) : super(reference, reference);

  @override
  final V2ExpenseDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Expense> get reference =>
      super.reference as CollectionReference<Expense>;

  @override
  ExpenseDocumentReference doc([String? id]) {
    return ExpenseDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ExpenseDocumentReference> add(Expense value) {
    return reference.add(value).then((ref) => ExpenseDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ExpenseCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ExpenseDocumentReference
    extends FirestoreDocumentReference<ExpenseDocumentSnapshot> {
  factory ExpenseDocumentReference(DocumentReference<Expense> reference) =
      _$ExpenseDocumentReference;

  DocumentReference<Expense> get reference;

  /// A reference to the [ExpenseCollectionReference] containing this document.
  ExpenseCollectionReference get parent {
    return _$ExpenseCollectionReference(
      reference.parent.parent!.withConverter<V2Expense>(
        fromFirestore: V2ExpenseCollectionReference.fromFirestore,
        toFirestore: V2ExpenseCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ExpenseDocumentSnapshot> snapshots();

  @override
  Future<ExpenseDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String expenseId,
    String name,
    int price,
    String expenseCategoryId,
    String? paidAt,
    String? createdAt,
    String? updatedAt,
    bool? isDeleted,
    int? satisfaction,
  });

  Future<void> set(Expense value);
}

class _$ExpenseDocumentReference
    extends FirestoreDocumentReference<ExpenseDocumentSnapshot>
    implements ExpenseDocumentReference {
  _$ExpenseDocumentReference(this.reference);

  @override
  final DocumentReference<Expense> reference;

  /// A reference to the [ExpenseCollectionReference] containing this document.
  ExpenseCollectionReference get parent {
    return _$ExpenseCollectionReference(
      reference.parent.parent!.withConverter<V2Expense>(
        fromFirestore: V2ExpenseCollectionReference.fromFirestore,
        toFirestore: V2ExpenseCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ExpenseDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return ExpenseDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<ExpenseDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return ExpenseDocumentSnapshot._(
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
    Object? expenseId = _sentinel,
    Object? name = _sentinel,
    Object? price = _sentinel,
    Object? expenseCategoryId = _sentinel,
    Object? paidAt = _sentinel,
    Object? createdAt = _sentinel,
    Object? updatedAt = _sentinel,
    Object? isDeleted = _sentinel,
    Object? satisfaction = _sentinel,
  }) async {
    final json = {
      if (expenseId != _sentinel) "expenseId": expenseId as String,
      if (name != _sentinel) "name": name as String,
      if (price != _sentinel) "price": price as int,
      if (expenseCategoryId != _sentinel)
        "expenseCategoryId": expenseCategoryId as String,
      if (paidAt != _sentinel) "paidAt": paidAt as String?,
      if (createdAt != _sentinel) "createdAt": createdAt as String?,
      if (updatedAt != _sentinel) "updatedAt": updatedAt as String?,
      if (isDeleted != _sentinel) "isDeleted": isDeleted as bool?,
      if (satisfaction != _sentinel) "satisfaction": satisfaction as int?,
    };

    return reference.update(json);
  }

  Future<void> set(Expense value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpenseDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class ExpenseDocumentSnapshot extends FirestoreDocumentSnapshot {
  ExpenseDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Expense> snapshot;

  @override
  ExpenseDocumentReference get reference {
    return ExpenseDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Expense? data;
}

abstract class ExpenseQuery implements QueryReference<ExpenseQuerySnapshot> {
  @override
  ExpenseQuery limit(int limit);

  @override
  ExpenseQuery limitToLast(int limit);

  ExpenseQuery whereExpenseId({
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
  ExpenseQuery whereName({
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
  ExpenseQuery wherePrice({
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
  ExpenseQuery whereExpenseCategoryId({
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
  ExpenseQuery wherePaidAt({
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
  ExpenseQuery whereCreatedAt({
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
  ExpenseQuery whereUpdatedAt({
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
  ExpenseQuery whereIsDeleted({
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
  ExpenseQuery whereSatisfaction({
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

  ExpenseQuery orderByExpenseId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByPrice({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByExpenseCategoryId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByPaidAt({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByCreatedAt({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByUpdatedAt({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderByIsDeleted({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });

  ExpenseQuery orderBySatisfaction({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  });
}

class _$ExpenseQuery extends QueryReference<ExpenseQuerySnapshot>
    implements ExpenseQuery {
  _$ExpenseQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Expense> reference;

  ExpenseQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Expense> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return ExpenseQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<ExpenseDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: ExpenseDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return ExpenseQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<ExpenseQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<ExpenseQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  ExpenseQuery limit(int limit) {
    return _$ExpenseQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  ExpenseQuery limitToLast(int limit) {
    return _$ExpenseQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  ExpenseQuery whereExpenseId({
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
    return _$ExpenseQuery(
      reference.where(
        'expenseId',
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

  ExpenseQuery whereName({
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
    return _$ExpenseQuery(
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

  ExpenseQuery wherePrice({
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
    return _$ExpenseQuery(
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

  ExpenseQuery whereExpenseCategoryId({
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
    return _$ExpenseQuery(
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

  ExpenseQuery wherePaidAt({
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
    return _$ExpenseQuery(
      reference.where(
        'paidAt',
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

  ExpenseQuery whereCreatedAt({
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
    return _$ExpenseQuery(
      reference.where(
        'createdAt',
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

  ExpenseQuery whereUpdatedAt({
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
    return _$ExpenseQuery(
      reference.where(
        'updatedAt',
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

  ExpenseQuery whereIsDeleted({
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
    return _$ExpenseQuery(
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

  ExpenseQuery whereSatisfaction({
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
    return _$ExpenseQuery(
      reference.where(
        'satisfaction',
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

  ExpenseQuery orderByExpenseId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('expenseId', descending: false);

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

    return _$ExpenseQuery(query, _collection);
  }

  ExpenseQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
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

    return _$ExpenseQuery(query, _collection);
  }

  ExpenseQuery orderByPrice({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
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

    return _$ExpenseQuery(query, _collection);
  }

  ExpenseQuery orderByExpenseCategoryId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
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

    return _$ExpenseQuery(query, _collection);
  }

  ExpenseQuery orderByPaidAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('paidAt', descending: false);

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

    return _$ExpenseQuery(query, _collection);
  }

  ExpenseQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('createdAt', descending: false);

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

    return _$ExpenseQuery(query, _collection);
  }

  ExpenseQuery orderByUpdatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('updatedAt', descending: false);

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

    return _$ExpenseQuery(query, _collection);
  }

  ExpenseQuery orderByIsDeleted({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
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

    return _$ExpenseQuery(query, _collection);
  }

  ExpenseQuery orderBySatisfaction({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ExpenseDocumentSnapshot? startAtDocument,
    ExpenseDocumentSnapshot? endAtDocument,
    ExpenseDocumentSnapshot? endBeforeDocument,
    ExpenseDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('satisfaction', descending: false);

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

    return _$ExpenseQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$ExpenseQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ExpenseQuerySnapshot
    extends FirestoreQuerySnapshot<ExpenseQueryDocumentSnapshot> {
  ExpenseQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Expense> snapshot;

  @override
  final List<ExpenseQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ExpenseDocumentSnapshot>> docChanges;
}

class ExpenseQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements ExpenseDocumentSnapshot {
  ExpenseQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Expense> snapshot;

  @override
  ExpenseDocumentReference get reference {
    return ExpenseDocumentReference(snapshot.reference);
  }

  @override
  final Expense data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V2Expense _$V2ExpenseFromJson(Map<String, dynamic> json) => V2Expense();

Map<String, dynamic> _$V2ExpenseToJson(V2Expense instance) =>
    <String, dynamic>{};

Expense _$ExpenseFromJson(Map<String, dynamic> json) => Expense(
      expenseId: json['expenseId'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      expenseCategoryId: json['expenseCategoryId'] as String,
      paidAt:
          const AutoTimestampIso8601StringConverter().fromJson(json['paidAt']),
      createdAt: const AutoTimestampIso8601StringConverter()
          .fromJson(json['createdAt']),
      updatedAt: const AutoTimestampIso8601StringConverter()
          .fromJson(json['updatedAt']),
      isDeleted: json['isDeleted'] as bool? ?? false,
      satisfaction: json['satisfaction'] as int? ?? 3,
    );

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
      'expenseId': instance.expenseId,
      'name': instance.name,
      'price': instance.price,
      'expenseCategoryId': instance.expenseCategoryId,
      'paidAt':
          const AutoTimestampIso8601StringConverter().toJson(instance.paidAt),
      'createdAt': const AutoTimestampIso8601StringConverter()
          .toJson(instance.createdAt),
      'updatedAt': const AutoTimestampIso8601StringConverter()
          .toJson(instance.updatedAt),
      'isDeleted': instance.isDeleted,
      'satisfaction': instance.satisfaction,
    };
