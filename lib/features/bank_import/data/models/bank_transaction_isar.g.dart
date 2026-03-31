// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_transaction_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBankTransactionIsarCollection on Isar {
  IsarCollection<BankTransactionIsar> get bankTransactionIsars =>
      this.collection();
}

const BankTransactionIsarSchema = CollectionSchema(
  name: r'BankTransactionIsar',
  id: -7277686549197038392,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'bankAccountId': PropertySchema(
      id: 1,
      name: r'bankAccountId',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 2,
      name: r'category',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'formattedAmount': PropertySchema(
      id: 5,
      name: r'formattedAmount',
      type: IsarType.string,
    ),
    r'importBatchId': PropertySchema(
      id: 6,
      name: r'importBatchId',
      type: IsarType.string,
    ),
    r'isCredit': PropertySchema(
      id: 7,
      name: r'isCredit',
      type: IsarType.bool,
    ),
    r'isDebit': PropertySchema(
      id: 8,
      name: r'isDebit',
      type: IsarType.bool,
    ),
    r'isDeleted': PropertySchema(
      id: 9,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'isReconciled': PropertySchema(
      id: 10,
      name: r'isReconciled',
      type: IsarType.bool,
    ),
    r'matchedExpenseId': PropertySchema(
      id: 11,
      name: r'matchedExpenseId',
      type: IsarType.string,
    ),
    r'matchedIncomeId': PropertySchema(
      id: 12,
      name: r'matchedIncomeId',
      type: IsarType.string,
    ),
    r'merchantCategory': PropertySchema(
      id: 13,
      name: r'merchantCategory',
      type: IsarType.string,
    ),
    r'merchantName': PropertySchema(
      id: 14,
      name: r'merchantName',
      type: IsarType.string,
    ),
    r'needsReview': PropertySchema(
      id: 15,
      name: r'needsReview',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 16,
      name: r'notes',
      type: IsarType.string,
    ),
    r'reconciliationStatus': PropertySchema(
      id: 17,
      name: r'reconciliationStatus',
      type: IsarType.byte,
      enumMap: _BankTransactionIsarreconciliationStatusEnumValueMap,
    ),
    r'referenceNumber': PropertySchema(
      id: 18,
      name: r'referenceNumber',
      type: IsarType.string,
    ),
    r'transactionDate': PropertySchema(
      id: 19,
      name: r'transactionDate',
      type: IsarType.dateTime,
    ),
    r'transactionId': PropertySchema(
      id: 20,
      name: r'transactionId',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 21,
      name: r'type',
      type: IsarType.byte,
      enumMap: _BankTransactionIsartypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 22,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 23,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _bankTransactionIsarEstimateSize,
  serialize: _bankTransactionIsarSerialize,
  deserialize: _bankTransactionIsarDeserialize,
  deserializeProp: _bankTransactionIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _bankTransactionIsarGetId,
  getLinks: _bankTransactionIsarGetLinks,
  attach: _bankTransactionIsarAttach,
  version: '3.1.0+1',
);

int _bankTransactionIsarEstimateSize(
  BankTransactionIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bankAccountId.length * 3;
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.formattedAmount.length * 3;
  bytesCount += 3 + object.importBatchId.length * 3;
  {
    final value = object.matchedExpenseId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.matchedIncomeId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.merchantCategory;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.merchantName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.referenceNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.transactionId.length * 3;
  return bytesCount;
}

void _bankTransactionIsarSerialize(
  BankTransactionIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.bankAccountId);
  writer.writeString(offsets[2], object.category);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.description);
  writer.writeString(offsets[5], object.formattedAmount);
  writer.writeString(offsets[6], object.importBatchId);
  writer.writeBool(offsets[7], object.isCredit);
  writer.writeBool(offsets[8], object.isDebit);
  writer.writeBool(offsets[9], object.isDeleted);
  writer.writeBool(offsets[10], object.isReconciled);
  writer.writeString(offsets[11], object.matchedExpenseId);
  writer.writeString(offsets[12], object.matchedIncomeId);
  writer.writeString(offsets[13], object.merchantCategory);
  writer.writeString(offsets[14], object.merchantName);
  writer.writeBool(offsets[15], object.needsReview);
  writer.writeString(offsets[16], object.notes);
  writer.writeByte(offsets[17], object.reconciliationStatus.index);
  writer.writeString(offsets[18], object.referenceNumber);
  writer.writeDateTime(offsets[19], object.transactionDate);
  writer.writeString(offsets[20], object.transactionId);
  writer.writeByte(offsets[21], object.type.index);
  writer.writeDateTime(offsets[22], object.updatedAt);
  writer.writeLong(offsets[23], object.version);
}

BankTransactionIsar _bankTransactionIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BankTransactionIsar();
  object.amount = reader.readDouble(offsets[0]);
  object.bankAccountId = reader.readString(offsets[1]);
  object.category = reader.readStringOrNull(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.description = reader.readString(offsets[4]);
  object.id = id;
  object.importBatchId = reader.readString(offsets[6]);
  object.isDeleted = reader.readBool(offsets[9]);
  object.matchedExpenseId = reader.readStringOrNull(offsets[11]);
  object.matchedIncomeId = reader.readStringOrNull(offsets[12]);
  object.merchantCategory = reader.readStringOrNull(offsets[13]);
  object.merchantName = reader.readStringOrNull(offsets[14]);
  object.notes = reader.readStringOrNull(offsets[16]);
  object.reconciliationStatus =
      _BankTransactionIsarreconciliationStatusValueEnumMap[
              reader.readByteOrNull(offsets[17])] ??
          ReconciliationStatus.pending;
  object.referenceNumber = reader.readStringOrNull(offsets[18]);
  object.transactionDate = reader.readDateTime(offsets[19]);
  object.transactionId = reader.readString(offsets[20]);
  object.type = _BankTransactionIsartypeValueEnumMap[
          reader.readByteOrNull(offsets[21])] ??
      TransactionType.credit;
  object.updatedAt = reader.readDateTime(offsets[22]);
  object.version = reader.readLong(offsets[23]);
  return object;
}

P _bankTransactionIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (_BankTransactionIsarreconciliationStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ReconciliationStatus.pending) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readDateTime(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (_BankTransactionIsartypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TransactionType.credit) as P;
    case 22:
      return (reader.readDateTime(offset)) as P;
    case 23:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BankTransactionIsarreconciliationStatusEnumValueMap = {
  'pending': 0,
  'matched': 1,
  'reconciled': 2,
  'ignored': 3,
};
const _BankTransactionIsarreconciliationStatusValueEnumMap = {
  0: ReconciliationStatus.pending,
  1: ReconciliationStatus.matched,
  2: ReconciliationStatus.reconciled,
  3: ReconciliationStatus.ignored,
};
const _BankTransactionIsartypeEnumValueMap = {
  'credit': 0,
  'debit': 1,
};
const _BankTransactionIsartypeValueEnumMap = {
  0: TransactionType.credit,
  1: TransactionType.debit,
};

Id _bankTransactionIsarGetId(BankTransactionIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bankTransactionIsarGetLinks(
    BankTransactionIsar object) {
  return [];
}

void _bankTransactionIsarAttach(
    IsarCollection<dynamic> col, Id id, BankTransactionIsar object) {
  object.id = id;
}

extension BankTransactionIsarQueryWhereSort
    on QueryBuilder<BankTransactionIsar, BankTransactionIsar, QWhere> {
  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BankTransactionIsarQueryWhere
    on QueryBuilder<BankTransactionIsar, BankTransactionIsar, QWhereClause> {
  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BankTransactionIsarQueryFilter on QueryBuilder<BankTransactionIsar,
    BankTransactionIsar, QFilterCondition> {
  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      bankAccountIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankAccountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      bankAccountIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankAccountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      bankAccountIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankAccountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      bankAccountIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankAccountId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      bankAccountIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bankAccountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      bankAccountIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bankAccountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      bankAccountIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bankAccountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      bankAccountIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bankAccountId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      bankAccountIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankAccountId',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      bankAccountIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bankAccountId',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      categoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      categoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      categoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      categoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      formattedAmountEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      formattedAmountGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      formattedAmountLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      formattedAmountBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      formattedAmountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      formattedAmountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      formattedAmountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      formattedAmountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedAmount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      formattedAmountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      formattedAmountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      importBatchIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'importBatchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      importBatchIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'importBatchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      importBatchIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'importBatchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      importBatchIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'importBatchId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      importBatchIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'importBatchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      importBatchIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'importBatchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      importBatchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'importBatchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      importBatchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'importBatchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      importBatchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'importBatchId',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      importBatchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'importBatchId',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      isCreditEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCredit',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      isDebitEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDebit',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      isReconciledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReconciled',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedExpenseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'matchedExpenseId',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedExpenseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'matchedExpenseId',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedExpenseIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchedExpenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedExpenseIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchedExpenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedExpenseIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchedExpenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedExpenseIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchedExpenseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedExpenseIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'matchedExpenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedExpenseIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'matchedExpenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedExpenseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'matchedExpenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedExpenseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'matchedExpenseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedExpenseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchedExpenseId',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedExpenseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'matchedExpenseId',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedIncomeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'matchedIncomeId',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedIncomeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'matchedIncomeId',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedIncomeIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchedIncomeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedIncomeIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchedIncomeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedIncomeIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchedIncomeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedIncomeIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchedIncomeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedIncomeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'matchedIncomeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedIncomeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'matchedIncomeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedIncomeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'matchedIncomeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedIncomeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'matchedIncomeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedIncomeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchedIncomeId',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      matchedIncomeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'matchedIncomeId',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantCategoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'merchantCategory',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantCategoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'merchantCategory',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantCategoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'merchantCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantCategoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'merchantCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantCategoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'merchantCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantCategoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'merchantCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'merchantCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'merchantCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'merchantCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'merchantCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'merchantCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'merchantCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'merchantName',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'merchantName',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'merchantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'merchantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'merchantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'merchantName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'merchantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'merchantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'merchantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'merchantName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'merchantName',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      merchantNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'merchantName',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      needsReviewEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsReview',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      reconciliationStatusEqualTo(ReconciliationStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reconciliationStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      reconciliationStatusGreaterThan(
    ReconciliationStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reconciliationStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      reconciliationStatusLessThan(
    ReconciliationStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reconciliationStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      reconciliationStatusBetween(
    ReconciliationStatus lower,
    ReconciliationStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reconciliationStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      referenceNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'referenceNumber',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      referenceNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'referenceNumber',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      referenceNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      referenceNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      referenceNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      referenceNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenceNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      referenceNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referenceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      referenceNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referenceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      referenceNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referenceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      referenceNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referenceNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      referenceNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      referenceNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referenceNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      transactionDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      transactionDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      transactionDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      transactionDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      transactionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      transactionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      transactionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      transactionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      transactionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      transactionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      transactionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      transactionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      transactionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      transactionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      typeEqualTo(TransactionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      typeGreaterThan(
    TransactionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      typeLessThan(
    TransactionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      typeBetween(
    TransactionType lower,
    TransactionType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterFilterCondition>
      versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BankTransactionIsarQueryObject on QueryBuilder<BankTransactionIsar,
    BankTransactionIsar, QFilterCondition> {}

extension BankTransactionIsarQueryLinks on QueryBuilder<BankTransactionIsar,
    BankTransactionIsar, QFilterCondition> {}

extension BankTransactionIsarQuerySortBy
    on QueryBuilder<BankTransactionIsar, BankTransactionIsar, QSortBy> {
  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByBankAccountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountId', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByBankAccountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountId', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByFormattedAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedAmount', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByFormattedAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedAmount', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByImportBatchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importBatchId', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByImportBatchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importBatchId', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByIsCredit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCredit', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByIsCreditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCredit', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByIsDebit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDebit', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByIsDebitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDebit', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByIsReconciled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReconciled', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByIsReconciledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReconciled', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByMatchedExpenseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchedExpenseId', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByMatchedExpenseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchedExpenseId', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByMatchedIncomeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchedIncomeId', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByMatchedIncomeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchedIncomeId', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByMerchantCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantCategory', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByMerchantCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantCategory', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByMerchantName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantName', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByMerchantNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantName', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByNeedsReview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsReview', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByNeedsReviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsReview', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByReconciliationStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reconciliationStatus', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByReconciliationStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reconciliationStatus', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByReferenceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceNumber', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByReferenceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceNumber', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension BankTransactionIsarQuerySortThenBy
    on QueryBuilder<BankTransactionIsar, BankTransactionIsar, QSortThenBy> {
  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByBankAccountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountId', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByBankAccountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountId', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByFormattedAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedAmount', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByFormattedAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedAmount', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByImportBatchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importBatchId', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByImportBatchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importBatchId', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByIsCredit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCredit', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByIsCreditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCredit', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByIsDebit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDebit', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByIsDebitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDebit', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByIsReconciled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReconciled', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByIsReconciledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReconciled', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByMatchedExpenseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchedExpenseId', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByMatchedExpenseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchedExpenseId', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByMatchedIncomeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchedIncomeId', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByMatchedIncomeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchedIncomeId', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByMerchantCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantCategory', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByMerchantCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantCategory', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByMerchantName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantName', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByMerchantNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantName', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByNeedsReview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsReview', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByNeedsReviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsReview', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByReconciliationStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reconciliationStatus', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByReconciliationStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reconciliationStatus', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByReferenceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceNumber', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByReferenceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceNumber', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension BankTransactionIsarQueryWhereDistinct
    on QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct> {
  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByBankAccountId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankAccountId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByFormattedAmount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedAmount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByImportBatchId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'importBatchId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByIsCredit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCredit');
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByIsDebit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDebit');
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByIsReconciled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isReconciled');
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByMatchedExpenseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'matchedExpenseId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByMatchedIncomeId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'matchedIncomeId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByMerchantCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'merchantCategory',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByMerchantName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'merchantName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByNeedsReview() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsReview');
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByReconciliationStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reconciliationStatus');
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByReferenceNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenceNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionDate');
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByTransactionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<BankTransactionIsar, BankTransactionIsar, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension BankTransactionIsarQueryProperty
    on QueryBuilder<BankTransactionIsar, BankTransactionIsar, QQueryProperty> {
  QueryBuilder<BankTransactionIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BankTransactionIsar, double, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<BankTransactionIsar, String, QQueryOperations>
      bankAccountIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankAccountId');
    });
  }

  QueryBuilder<BankTransactionIsar, String?, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<BankTransactionIsar, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BankTransactionIsar, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<BankTransactionIsar, String, QQueryOperations>
      formattedAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedAmount');
    });
  }

  QueryBuilder<BankTransactionIsar, String, QQueryOperations>
      importBatchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'importBatchId');
    });
  }

  QueryBuilder<BankTransactionIsar, bool, QQueryOperations> isCreditProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCredit');
    });
  }

  QueryBuilder<BankTransactionIsar, bool, QQueryOperations> isDebitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDebit');
    });
  }

  QueryBuilder<BankTransactionIsar, bool, QQueryOperations>
      isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<BankTransactionIsar, bool, QQueryOperations>
      isReconciledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isReconciled');
    });
  }

  QueryBuilder<BankTransactionIsar, String?, QQueryOperations>
      matchedExpenseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matchedExpenseId');
    });
  }

  QueryBuilder<BankTransactionIsar, String?, QQueryOperations>
      matchedIncomeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matchedIncomeId');
    });
  }

  QueryBuilder<BankTransactionIsar, String?, QQueryOperations>
      merchantCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'merchantCategory');
    });
  }

  QueryBuilder<BankTransactionIsar, String?, QQueryOperations>
      merchantNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'merchantName');
    });
  }

  QueryBuilder<BankTransactionIsar, bool, QQueryOperations>
      needsReviewProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsReview');
    });
  }

  QueryBuilder<BankTransactionIsar, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<BankTransactionIsar, ReconciliationStatus, QQueryOperations>
      reconciliationStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reconciliationStatus');
    });
  }

  QueryBuilder<BankTransactionIsar, String?, QQueryOperations>
      referenceNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenceNumber');
    });
  }

  QueryBuilder<BankTransactionIsar, DateTime, QQueryOperations>
      transactionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionDate');
    });
  }

  QueryBuilder<BankTransactionIsar, String, QQueryOperations>
      transactionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionId');
    });
  }

  QueryBuilder<BankTransactionIsar, TransactionType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<BankTransactionIsar, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<BankTransactionIsar, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBankAccountIsarCollection on Isar {
  IsarCollection<BankAccountIsar> get bankAccountIsars => this.collection();
}

const BankAccountIsarSchema = CollectionSchema(
  name: r'BankAccountIsar',
  id: -5564706349082125943,
  properties: {
    r'accountId': PropertySchema(
      id: 0,
      name: r'accountId',
      type: IsarType.string,
    ),
    r'accountName': PropertySchema(
      id: 1,
      name: r'accountName',
      type: IsarType.string,
    ),
    r'accountNumber': PropertySchema(
      id: 2,
      name: r'accountNumber',
      type: IsarType.string,
    ),
    r'accountType': PropertySchema(
      id: 3,
      name: r'accountType',
      type: IsarType.string,
    ),
    r'bankName': PropertySchema(
      id: 4,
      name: r'bankName',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 5,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currentBalance': PropertySchema(
      id: 6,
      name: r'currentBalance',
      type: IsarType.double,
    ),
    r'isDeleted': PropertySchema(
      id: 7,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'lastSyncDate': PropertySchema(
      id: 8,
      name: r'lastSyncDate',
      type: IsarType.dateTime,
    ),
    r'maskedAccountNumber': PropertySchema(
      id: 9,
      name: r'maskedAccountNumber',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 11,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _bankAccountIsarEstimateSize,
  serialize: _bankAccountIsarSerialize,
  deserialize: _bankAccountIsarDeserialize,
  deserializeProp: _bankAccountIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _bankAccountIsarGetId,
  getLinks: _bankAccountIsarGetLinks,
  attach: _bankAccountIsarAttach,
  version: '3.1.0+1',
);

int _bankAccountIsarEstimateSize(
  BankAccountIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.accountId.length * 3;
  bytesCount += 3 + object.accountName.length * 3;
  bytesCount += 3 + object.accountNumber.length * 3;
  bytesCount += 3 + object.accountType.length * 3;
  bytesCount += 3 + object.bankName.length * 3;
  bytesCount += 3 + object.maskedAccountNumber.length * 3;
  return bytesCount;
}

void _bankAccountIsarSerialize(
  BankAccountIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accountId);
  writer.writeString(offsets[1], object.accountName);
  writer.writeString(offsets[2], object.accountNumber);
  writer.writeString(offsets[3], object.accountType);
  writer.writeString(offsets[4], object.bankName);
  writer.writeDateTime(offsets[5], object.createdAt);
  writer.writeDouble(offsets[6], object.currentBalance);
  writer.writeBool(offsets[7], object.isDeleted);
  writer.writeDateTime(offsets[8], object.lastSyncDate);
  writer.writeString(offsets[9], object.maskedAccountNumber);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeLong(offsets[11], object.version);
}

BankAccountIsar _bankAccountIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BankAccountIsar();
  object.accountId = reader.readString(offsets[0]);
  object.accountName = reader.readString(offsets[1]);
  object.accountNumber = reader.readString(offsets[2]);
  object.accountType = reader.readString(offsets[3]);
  object.bankName = reader.readString(offsets[4]);
  object.createdAt = reader.readDateTime(offsets[5]);
  object.currentBalance = reader.readDouble(offsets[6]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[7]);
  object.lastSyncDate = reader.readDateTimeOrNull(offsets[8]);
  object.updatedAt = reader.readDateTime(offsets[10]);
  object.version = reader.readLong(offsets[11]);
  return object;
}

P _bankAccountIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bankAccountIsarGetId(BankAccountIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bankAccountIsarGetLinks(BankAccountIsar object) {
  return [];
}

void _bankAccountIsarAttach(
    IsarCollection<dynamic> col, Id id, BankAccountIsar object) {
  object.id = id;
}

extension BankAccountIsarQueryWhereSort
    on QueryBuilder<BankAccountIsar, BankAccountIsar, QWhere> {
  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BankAccountIsarQueryWhere
    on QueryBuilder<BankAccountIsar, BankAccountIsar, QWhereClause> {
  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BankAccountIsarQueryFilter
    on QueryBuilder<BankAccountIsar, BankAccountIsar, QFilterCondition> {
  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountId',
        value: '',
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountId',
        value: '',
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountName',
        value: '',
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountName',
        value: '',
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountType',
        value: '',
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      accountTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountType',
        value: '',
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      bankNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      bankNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      bankNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      bankNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      bankNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      bankNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      bankNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      bankNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bankName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      bankNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      bankNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      currentBalanceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      currentBalanceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      currentBalanceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      currentBalanceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentBalance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      lastSyncDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncDate',
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      lastSyncDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncDate',
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      lastSyncDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      lastSyncDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      lastSyncDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      lastSyncDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      maskedAccountNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maskedAccountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      maskedAccountNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maskedAccountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      maskedAccountNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maskedAccountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      maskedAccountNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maskedAccountNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      maskedAccountNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'maskedAccountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      maskedAccountNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'maskedAccountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      maskedAccountNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'maskedAccountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      maskedAccountNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'maskedAccountNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      maskedAccountNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maskedAccountNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      maskedAccountNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'maskedAccountNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterFilterCondition>
      versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BankAccountIsarQueryObject
    on QueryBuilder<BankAccountIsar, BankAccountIsar, QFilterCondition> {}

extension BankAccountIsarQueryLinks
    on QueryBuilder<BankAccountIsar, BankAccountIsar, QFilterCondition> {}

extension BankAccountIsarQuerySortBy
    on QueryBuilder<BankAccountIsar, BankAccountIsar, QSortBy> {
  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByAccountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByAccountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByAccountName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByAccountNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByAccountType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountType', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByAccountTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountType', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByCurrentBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBalance', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByCurrentBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBalance', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByLastSyncDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncDate', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByLastSyncDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncDate', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByMaskedAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maskedAccountNumber', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByMaskedAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maskedAccountNumber', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension BankAccountIsarQuerySortThenBy
    on QueryBuilder<BankAccountIsar, BankAccountIsar, QSortThenBy> {
  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByAccountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByAccountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByAccountName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByAccountNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByAccountType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountType', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByAccountTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountType', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByCurrentBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBalance', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByCurrentBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBalance', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByLastSyncDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncDate', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByLastSyncDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncDate', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByMaskedAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maskedAccountNumber', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByMaskedAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maskedAccountNumber', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension BankAccountIsarQueryWhereDistinct
    on QueryBuilder<BankAccountIsar, BankAccountIsar, QDistinct> {
  QueryBuilder<BankAccountIsar, BankAccountIsar, QDistinct> distinctByAccountId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QDistinct>
      distinctByAccountName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QDistinct>
      distinctByAccountNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QDistinct>
      distinctByAccountType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QDistinct> distinctByBankName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QDistinct>
      distinctByCurrentBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentBalance');
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QDistinct>
      distinctByLastSyncDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncDate');
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QDistinct>
      distinctByMaskedAccountNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maskedAccountNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<BankAccountIsar, BankAccountIsar, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension BankAccountIsarQueryProperty
    on QueryBuilder<BankAccountIsar, BankAccountIsar, QQueryProperty> {
  QueryBuilder<BankAccountIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BankAccountIsar, String, QQueryOperations> accountIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountId');
    });
  }

  QueryBuilder<BankAccountIsar, String, QQueryOperations>
      accountNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountName');
    });
  }

  QueryBuilder<BankAccountIsar, String, QQueryOperations>
      accountNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountNumber');
    });
  }

  QueryBuilder<BankAccountIsar, String, QQueryOperations>
      accountTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountType');
    });
  }

  QueryBuilder<BankAccountIsar, String, QQueryOperations> bankNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankName');
    });
  }

  QueryBuilder<BankAccountIsar, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BankAccountIsar, double, QQueryOperations>
      currentBalanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentBalance');
    });
  }

  QueryBuilder<BankAccountIsar, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<BankAccountIsar, DateTime?, QQueryOperations>
      lastSyncDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncDate');
    });
  }

  QueryBuilder<BankAccountIsar, String, QQueryOperations>
      maskedAccountNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maskedAccountNumber');
    });
  }

  QueryBuilder<BankAccountIsar, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<BankAccountIsar, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetImportBatchIsarCollection on Isar {
  IsarCollection<ImportBatchIsar> get importBatchIsars => this.collection();
}

const ImportBatchIsarSchema = CollectionSchema(
  name: r'ImportBatchIsar',
  id: 7741685401527865982,
  properties: {
    r'bankAccountId': PropertySchema(
      id: 0,
      name: r'bankAccountId',
      type: IsarType.string,
    ),
    r'batchId': PropertySchema(
      id: 1,
      name: r'batchId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'endDate': PropertySchema(
      id: 3,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'fileName': PropertySchema(
      id: 4,
      name: r'fileName',
      type: IsarType.string,
    ),
    r'importDate': PropertySchema(
      id: 5,
      name: r'importDate',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 6,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'isFullyReconciled': PropertySchema(
      id: 7,
      name: r'isFullyReconciled',
      type: IsarType.bool,
    ),
    r'pendingTransactions': PropertySchema(
      id: 8,
      name: r'pendingTransactions',
      type: IsarType.long,
    ),
    r'reconciledTransactions': PropertySchema(
      id: 9,
      name: r'reconciledTransactions',
      type: IsarType.long,
    ),
    r'reconciliationProgress': PropertySchema(
      id: 10,
      name: r'reconciliationProgress',
      type: IsarType.double,
    ),
    r'startDate': PropertySchema(
      id: 11,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'totalTransactions': PropertySchema(
      id: 12,
      name: r'totalTransactions',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 14,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _importBatchIsarEstimateSize,
  serialize: _importBatchIsarSerialize,
  deserialize: _importBatchIsarDeserialize,
  deserializeProp: _importBatchIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _importBatchIsarGetId,
  getLinks: _importBatchIsarGetLinks,
  attach: _importBatchIsarAttach,
  version: '3.1.0+1',
);

int _importBatchIsarEstimateSize(
  ImportBatchIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bankAccountId.length * 3;
  bytesCount += 3 + object.batchId.length * 3;
  bytesCount += 3 + object.fileName.length * 3;
  return bytesCount;
}

void _importBatchIsarSerialize(
  ImportBatchIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bankAccountId);
  writer.writeString(offsets[1], object.batchId);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDateTime(offsets[3], object.endDate);
  writer.writeString(offsets[4], object.fileName);
  writer.writeDateTime(offsets[5], object.importDate);
  writer.writeBool(offsets[6], object.isDeleted);
  writer.writeBool(offsets[7], object.isFullyReconciled);
  writer.writeLong(offsets[8], object.pendingTransactions);
  writer.writeLong(offsets[9], object.reconciledTransactions);
  writer.writeDouble(offsets[10], object.reconciliationProgress);
  writer.writeDateTime(offsets[11], object.startDate);
  writer.writeLong(offsets[12], object.totalTransactions);
  writer.writeDateTime(offsets[13], object.updatedAt);
  writer.writeLong(offsets[14], object.version);
}

ImportBatchIsar _importBatchIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ImportBatchIsar();
  object.bankAccountId = reader.readString(offsets[0]);
  object.batchId = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.endDate = reader.readDateTimeOrNull(offsets[3]);
  object.fileName = reader.readString(offsets[4]);
  object.id = id;
  object.importDate = reader.readDateTime(offsets[5]);
  object.isDeleted = reader.readBool(offsets[6]);
  object.pendingTransactions = reader.readLong(offsets[8]);
  object.reconciledTransactions = reader.readLong(offsets[9]);
  object.startDate = reader.readDateTimeOrNull(offsets[11]);
  object.totalTransactions = reader.readLong(offsets[12]);
  object.updatedAt = reader.readDateTime(offsets[13]);
  object.version = reader.readLong(offsets[14]);
  return object;
}

P _importBatchIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _importBatchIsarGetId(ImportBatchIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _importBatchIsarGetLinks(ImportBatchIsar object) {
  return [];
}

void _importBatchIsarAttach(
    IsarCollection<dynamic> col, Id id, ImportBatchIsar object) {
  object.id = id;
}

extension ImportBatchIsarQueryWhereSort
    on QueryBuilder<ImportBatchIsar, ImportBatchIsar, QWhere> {
  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ImportBatchIsarQueryWhere
    on QueryBuilder<ImportBatchIsar, ImportBatchIsar, QWhereClause> {
  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ImportBatchIsarQueryFilter
    on QueryBuilder<ImportBatchIsar, ImportBatchIsar, QFilterCondition> {
  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      bankAccountIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankAccountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      bankAccountIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankAccountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      bankAccountIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankAccountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      bankAccountIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankAccountId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      bankAccountIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bankAccountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      bankAccountIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bankAccountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      bankAccountIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bankAccountId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      bankAccountIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bankAccountId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      bankAccountIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankAccountId',
        value: '',
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      bankAccountIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bankAccountId',
        value: '',
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      batchIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      batchIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'batchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      batchIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'batchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      batchIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'batchId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      batchIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'batchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      batchIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'batchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      batchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'batchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      batchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'batchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      batchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchId',
        value: '',
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      batchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'batchId',
        value: '',
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      endDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      endDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      endDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      endDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      endDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      endDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      fileNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      fileNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      fileNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      fileNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      fileNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      fileNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      fileNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      fileNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      fileNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileName',
        value: '',
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      fileNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileName',
        value: '',
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      importDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'importDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      importDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'importDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      importDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'importDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      importDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'importDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      isFullyReconciledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFullyReconciled',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      pendingTransactionsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendingTransactions',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      pendingTransactionsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pendingTransactions',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      pendingTransactionsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pendingTransactions',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      pendingTransactionsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pendingTransactions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      reconciledTransactionsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reconciledTransactions',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      reconciledTransactionsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reconciledTransactions',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      reconciledTransactionsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reconciledTransactions',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      reconciledTransactionsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reconciledTransactions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      reconciliationProgressEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reconciliationProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      reconciliationProgressGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reconciliationProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      reconciliationProgressLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reconciliationProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      reconciliationProgressBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reconciliationProgress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      startDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      startDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      startDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      startDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      totalTransactionsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalTransactions',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      totalTransactionsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalTransactions',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      totalTransactionsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalTransactions',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      totalTransactionsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalTransactions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterFilterCondition>
      versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ImportBatchIsarQueryObject
    on QueryBuilder<ImportBatchIsar, ImportBatchIsar, QFilterCondition> {}

extension ImportBatchIsarQueryLinks
    on QueryBuilder<ImportBatchIsar, ImportBatchIsar, QFilterCondition> {}

extension ImportBatchIsarQuerySortBy
    on QueryBuilder<ImportBatchIsar, ImportBatchIsar, QSortBy> {
  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByBankAccountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountId', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByBankAccountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountId', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy> sortByBatchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchId', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByBatchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchId', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByImportDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importDate', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByImportDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importDate', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByIsFullyReconciled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFullyReconciled', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByIsFullyReconciledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFullyReconciled', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByPendingTransactions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingTransactions', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByPendingTransactionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingTransactions', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByReconciledTransactions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reconciledTransactions', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByReconciledTransactionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reconciledTransactions', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByReconciliationProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reconciliationProgress', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByReconciliationProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reconciliationProgress', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByTotalTransactions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTransactions', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByTotalTransactionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTransactions', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension ImportBatchIsarQuerySortThenBy
    on QueryBuilder<ImportBatchIsar, ImportBatchIsar, QSortThenBy> {
  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByBankAccountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountId', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByBankAccountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccountId', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy> thenByBatchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchId', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByBatchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchId', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByImportDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importDate', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByImportDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importDate', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByIsFullyReconciled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFullyReconciled', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByIsFullyReconciledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFullyReconciled', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByPendingTransactions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingTransactions', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByPendingTransactionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingTransactions', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByReconciledTransactions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reconciledTransactions', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByReconciledTransactionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reconciledTransactions', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByReconciliationProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reconciliationProgress', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByReconciliationProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reconciliationProgress', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByTotalTransactions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTransactions', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByTotalTransactionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTransactions', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension ImportBatchIsarQueryWhereDistinct
    on QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct> {
  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct>
      distinctByBankAccountId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankAccountId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct> distinctByBatchId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batchId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct>
      distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct> distinctByFileName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct>
      distinctByImportDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'importDate');
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct>
      distinctByIsFullyReconciled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFullyReconciled');
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct>
      distinctByPendingTransactions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendingTransactions');
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct>
      distinctByReconciledTransactions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reconciledTransactions');
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct>
      distinctByReconciliationProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reconciliationProgress');
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct>
      distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct>
      distinctByTotalTransactions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTransactions');
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<ImportBatchIsar, ImportBatchIsar, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension ImportBatchIsarQueryProperty
    on QueryBuilder<ImportBatchIsar, ImportBatchIsar, QQueryProperty> {
  QueryBuilder<ImportBatchIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ImportBatchIsar, String, QQueryOperations>
      bankAccountIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankAccountId');
    });
  }

  QueryBuilder<ImportBatchIsar, String, QQueryOperations> batchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batchId');
    });
  }

  QueryBuilder<ImportBatchIsar, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ImportBatchIsar, DateTime?, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<ImportBatchIsar, String, QQueryOperations> fileNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileName');
    });
  }

  QueryBuilder<ImportBatchIsar, DateTime, QQueryOperations>
      importDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'importDate');
    });
  }

  QueryBuilder<ImportBatchIsar, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<ImportBatchIsar, bool, QQueryOperations>
      isFullyReconciledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFullyReconciled');
    });
  }

  QueryBuilder<ImportBatchIsar, int, QQueryOperations>
      pendingTransactionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendingTransactions');
    });
  }

  QueryBuilder<ImportBatchIsar, int, QQueryOperations>
      reconciledTransactionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reconciledTransactions');
    });
  }

  QueryBuilder<ImportBatchIsar, double, QQueryOperations>
      reconciliationProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reconciliationProgress');
    });
  }

  QueryBuilder<ImportBatchIsar, DateTime?, QQueryOperations>
      startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<ImportBatchIsar, int, QQueryOperations>
      totalTransactionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTransactions');
    });
  }

  QueryBuilder<ImportBatchIsar, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<ImportBatchIsar, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
