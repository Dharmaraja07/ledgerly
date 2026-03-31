// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDebtIsarCollection on Isar {
  IsarCollection<DebtIsar> get debtIsars => this.collection();
}

const DebtIsarSchema = CollectionSchema(
  name: r'DebtIsar',
  id: 2222075939011463175,
  properties: {
    r'accountNumber': PropertySchema(
      id: 0,
      name: r'accountNumber',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'creditorName': PropertySchema(
      id: 2,
      name: r'creditorName',
      type: IsarType.string,
    ),
    r'currentBalance': PropertySchema(
      id: 3,
      name: r'currentBalance',
      type: IsarType.double,
    ),
    r'debtId': PropertySchema(
      id: 4,
      name: r'debtId',
      type: IsarType.string,
    ),
    r'estimatedPayoffDate': PropertySchema(
      id: 5,
      name: r'estimatedPayoffDate',
      type: IsarType.dateTime,
    ),
    r'initialAmount': PropertySchema(
      id: 6,
      name: r'initialAmount',
      type: IsarType.double,
    ),
    r'interestRate': PropertySchema(
      id: 7,
      name: r'interestRate',
      type: IsarType.double,
    ),
    r'isDeleted': PropertySchema(
      id: 8,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'minimumPayment': PropertySchema(
      id: 9,
      name: r'minimumPayment',
      type: IsarType.double,
    ),
    r'monthsRemaining': PropertySchema(
      id: 10,
      name: r'monthsRemaining',
      type: IsarType.long,
    ),
    r'progressPercentage': PropertySchema(
      id: 11,
      name: r'progressPercentage',
      type: IsarType.double,
    ),
    r'startDate': PropertySchema(
      id: 12,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'strategy': PropertySchema(
      id: 13,
      name: r'strategy',
      type: IsarType.byte,
      enumMap: _DebtIsarstrategyEnumValueMap,
    ),
    r'targetPayoffDate': PropertySchema(
      id: 14,
      name: r'targetPayoffDate',
      type: IsarType.dateTime,
    ),
    r'title': PropertySchema(
      id: 15,
      name: r'title',
      type: IsarType.string,
    ),
    r'totalInterestPaid': PropertySchema(
      id: 16,
      name: r'totalInterestPaid',
      type: IsarType.double,
    ),
    r'totalPaid': PropertySchema(
      id: 17,
      name: r'totalPaid',
      type: IsarType.double,
    ),
    r'type': PropertySchema(
      id: 18,
      name: r'type',
      type: IsarType.byte,
      enumMap: _DebtIsartypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 19,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 20,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _debtIsarEstimateSize,
  serialize: _debtIsarSerialize,
  deserialize: _debtIsarDeserialize,
  deserializeProp: _debtIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _debtIsarGetId,
  getLinks: _debtIsarGetLinks,
  attach: _debtIsarAttach,
  version: '3.1.0+1',
);

int _debtIsarEstimateSize(
  DebtIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.accountNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.creditorName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.debtId.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _debtIsarSerialize(
  DebtIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accountNumber);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.creditorName);
  writer.writeDouble(offsets[3], object.currentBalance);
  writer.writeString(offsets[4], object.debtId);
  writer.writeDateTime(offsets[5], object.estimatedPayoffDate);
  writer.writeDouble(offsets[6], object.initialAmount);
  writer.writeDouble(offsets[7], object.interestRate);
  writer.writeBool(offsets[8], object.isDeleted);
  writer.writeDouble(offsets[9], object.minimumPayment);
  writer.writeLong(offsets[10], object.monthsRemaining);
  writer.writeDouble(offsets[11], object.progressPercentage);
  writer.writeDateTime(offsets[12], object.startDate);
  writer.writeByte(offsets[13], object.strategy.index);
  writer.writeDateTime(offsets[14], object.targetPayoffDate);
  writer.writeString(offsets[15], object.title);
  writer.writeDouble(offsets[16], object.totalInterestPaid);
  writer.writeDouble(offsets[17], object.totalPaid);
  writer.writeByte(offsets[18], object.type.index);
  writer.writeDateTime(offsets[19], object.updatedAt);
  writer.writeLong(offsets[20], object.version);
}

DebtIsar _debtIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DebtIsar();
  object.accountNumber = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.creditorName = reader.readStringOrNull(offsets[2]);
  object.currentBalance = reader.readDouble(offsets[3]);
  object.debtId = reader.readString(offsets[4]);
  object.id = id;
  object.initialAmount = reader.readDouble(offsets[6]);
  object.interestRate = reader.readDouble(offsets[7]);
  object.isDeleted = reader.readBool(offsets[8]);
  object.minimumPayment = reader.readDouble(offsets[9]);
  object.startDate = reader.readDateTime(offsets[12]);
  object.strategy =
      _DebtIsarstrategyValueEnumMap[reader.readByteOrNull(offsets[13])] ??
          DebtPayoffStrategy.snowball;
  object.targetPayoffDate = reader.readDateTimeOrNull(offsets[14]);
  object.title = reader.readString(offsets[15]);
  object.type = _DebtIsartypeValueEnumMap[reader.readByteOrNull(offsets[18])] ??
      DebtType.creditCard;
  object.updatedAt = reader.readDateTime(offsets[19]);
  object.version = reader.readLong(offsets[20]);
  return object;
}

P _debtIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (_DebtIsarstrategyValueEnumMap[reader.readByteOrNull(offset)] ??
          DebtPayoffStrategy.snowball) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDouble(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    case 18:
      return (_DebtIsartypeValueEnumMap[reader.readByteOrNull(offset)] ??
          DebtType.creditCard) as P;
    case 19:
      return (reader.readDateTime(offset)) as P;
    case 20:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DebtIsarstrategyEnumValueMap = {
  'snowball': 0,
  'avalanche': 1,
  'custom': 2,
};
const _DebtIsarstrategyValueEnumMap = {
  0: DebtPayoffStrategy.snowball,
  1: DebtPayoffStrategy.avalanche,
  2: DebtPayoffStrategy.custom,
};
const _DebtIsartypeEnumValueMap = {
  'creditCard': 0,
  'studentLoan': 1,
  'mortgage': 2,
  'autoLoan': 3,
  'personalLoan': 4,
  'medical': 5,
  'other': 6,
};
const _DebtIsartypeValueEnumMap = {
  0: DebtType.creditCard,
  1: DebtType.studentLoan,
  2: DebtType.mortgage,
  3: DebtType.autoLoan,
  4: DebtType.personalLoan,
  5: DebtType.medical,
  6: DebtType.other,
};

Id _debtIsarGetId(DebtIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _debtIsarGetLinks(DebtIsar object) {
  return [];
}

void _debtIsarAttach(IsarCollection<dynamic> col, Id id, DebtIsar object) {
  object.id = id;
}

extension DebtIsarQueryWhereSort on QueryBuilder<DebtIsar, DebtIsar, QWhere> {
  QueryBuilder<DebtIsar, DebtIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DebtIsarQueryWhere on QueryBuilder<DebtIsar, DebtIsar, QWhereClause> {
  QueryBuilder<DebtIsar, DebtIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterWhereClause> idBetween(
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

extension DebtIsarQueryFilter
    on QueryBuilder<DebtIsar, DebtIsar, QFilterCondition> {
  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      accountNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accountNumber',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      accountNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accountNumber',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> accountNumberEqualTo(
    String? value, {
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      accountNumberGreaterThan(
    String? value, {
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> accountNumberLessThan(
    String? value, {
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> accountNumberBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> accountNumberEndsWith(
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> accountNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> accountNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      accountNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      accountNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> creditorNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'creditorName',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      creditorNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'creditorName',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> creditorNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creditorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      creditorNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creditorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> creditorNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creditorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> creditorNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creditorName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      creditorNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'creditorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> creditorNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'creditorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> creditorNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'creditorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> creditorNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'creditorName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      creditorNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creditorName',
        value: '',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      creditorNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'creditorName',
        value: '',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> currentBalanceEqualTo(
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> currentBalanceBetween(
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> debtIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'debtId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> debtIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'debtId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> debtIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'debtId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> debtIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'debtId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> debtIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'debtId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> debtIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'debtId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> debtIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'debtId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> debtIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'debtId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> debtIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'debtId',
        value: '',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> debtIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'debtId',
        value: '',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      estimatedPayoffDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estimatedPayoffDate',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      estimatedPayoffDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estimatedPayoffDate',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      estimatedPayoffDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedPayoffDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      estimatedPayoffDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedPayoffDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      estimatedPayoffDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedPayoffDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      estimatedPayoffDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedPayoffDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> initialAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'initialAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      initialAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'initialAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> initialAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'initialAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> initialAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'initialAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> interestRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interestRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      interestRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interestRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> interestRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interestRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> interestRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interestRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> isDeletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> minimumPaymentEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minimumPayment',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      minimumPaymentGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minimumPayment',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      minimumPaymentLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minimumPayment',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> minimumPaymentBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minimumPayment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      monthsRemainingEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthsRemaining',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      monthsRemainingGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthsRemaining',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      monthsRemainingLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthsRemaining',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      monthsRemainingBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthsRemaining',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      progressPercentageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progressPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      progressPercentageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progressPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      progressPercentageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progressPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      progressPercentageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progressPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> startDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> startDateGreaterThan(
    DateTime value, {
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> startDateLessThan(
    DateTime value, {
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> startDateBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> strategyEqualTo(
      DebtPayoffStrategy value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'strategy',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> strategyGreaterThan(
    DebtPayoffStrategy value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'strategy',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> strategyLessThan(
    DebtPayoffStrategy value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'strategy',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> strategyBetween(
    DebtPayoffStrategy lower,
    DebtPayoffStrategy upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'strategy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      targetPayoffDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'targetPayoffDate',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      targetPayoffDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'targetPayoffDate',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      targetPayoffDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetPayoffDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      targetPayoffDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetPayoffDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      targetPayoffDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetPayoffDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      targetPayoffDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetPayoffDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      totalInterestPaidEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalInterestPaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      totalInterestPaidGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalInterestPaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      totalInterestPaidLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalInterestPaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition>
      totalInterestPaidBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalInterestPaid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> totalPaidEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> totalPaidGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> totalPaidLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPaid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> totalPaidBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPaid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> typeEqualTo(
      DebtType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> typeGreaterThan(
    DebtType value, {
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> typeLessThan(
    DebtType value, {
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> typeBetween(
    DebtType lower,
    DebtType upper, {
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> versionEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> versionGreaterThan(
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> versionLessThan(
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

  QueryBuilder<DebtIsar, DebtIsar, QAfterFilterCondition> versionBetween(
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

extension DebtIsarQueryObject
    on QueryBuilder<DebtIsar, DebtIsar, QFilterCondition> {}

extension DebtIsarQueryLinks
    on QueryBuilder<DebtIsar, DebtIsar, QFilterCondition> {}

extension DebtIsarQuerySortBy on QueryBuilder<DebtIsar, DebtIsar, QSortBy> {
  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByCreditorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditorName', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByCreditorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditorName', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByCurrentBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBalance', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByCurrentBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBalance', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByDebtId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'debtId', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByDebtIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'debtId', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByEstimatedPayoffDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPayoffDate', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy>
      sortByEstimatedPayoffDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPayoffDate', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByInitialAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialAmount', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByInitialAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialAmount', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByInterestRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByInterestRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByMinimumPayment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumPayment', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByMinimumPaymentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumPayment', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByMonthsRemaining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthsRemaining', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByMonthsRemainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthsRemaining', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByProgressPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressPercentage', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy>
      sortByProgressPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressPercentage', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByStrategy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strategy', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByStrategyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strategy', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByTargetPayoffDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPayoffDate', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByTargetPayoffDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPayoffDate', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByTotalInterestPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInterestPaid', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByTotalInterestPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInterestPaid', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByTotalPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPaid', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByTotalPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPaid', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension DebtIsarQuerySortThenBy
    on QueryBuilder<DebtIsar, DebtIsar, QSortThenBy> {
  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByCreditorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditorName', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByCreditorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditorName', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByCurrentBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBalance', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByCurrentBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBalance', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByDebtId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'debtId', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByDebtIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'debtId', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByEstimatedPayoffDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPayoffDate', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy>
      thenByEstimatedPayoffDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedPayoffDate', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByInitialAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialAmount', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByInitialAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialAmount', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByInterestRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByInterestRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByMinimumPayment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumPayment', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByMinimumPaymentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumPayment', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByMonthsRemaining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthsRemaining', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByMonthsRemainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthsRemaining', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByProgressPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressPercentage', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy>
      thenByProgressPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressPercentage', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByStrategy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strategy', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByStrategyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strategy', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByTargetPayoffDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPayoffDate', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByTargetPayoffDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPayoffDate', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByTotalInterestPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInterestPaid', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByTotalInterestPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInterestPaid', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByTotalPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPaid', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByTotalPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPaid', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension DebtIsarQueryWhereDistinct
    on QueryBuilder<DebtIsar, DebtIsar, QDistinct> {
  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByAccountNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByCreditorName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creditorName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByCurrentBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentBalance');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByDebtId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'debtId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByEstimatedPayoffDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedPayoffDate');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByInitialAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'initialAmount');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByInterestRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interestRate');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByMinimumPayment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minimumPayment');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByMonthsRemaining() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthsRemaining');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByProgressPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progressPercentage');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByStrategy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'strategy');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByTargetPayoffDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetPayoffDate');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByTotalInterestPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalInterestPaid');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByTotalPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPaid');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<DebtIsar, DebtIsar, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension DebtIsarQueryProperty
    on QueryBuilder<DebtIsar, DebtIsar, QQueryProperty> {
  QueryBuilder<DebtIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DebtIsar, String?, QQueryOperations> accountNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountNumber');
    });
  }

  QueryBuilder<DebtIsar, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DebtIsar, String?, QQueryOperations> creditorNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creditorName');
    });
  }

  QueryBuilder<DebtIsar, double, QQueryOperations> currentBalanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentBalance');
    });
  }

  QueryBuilder<DebtIsar, String, QQueryOperations> debtIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'debtId');
    });
  }

  QueryBuilder<DebtIsar, DateTime?, QQueryOperations>
      estimatedPayoffDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedPayoffDate');
    });
  }

  QueryBuilder<DebtIsar, double, QQueryOperations> initialAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'initialAmount');
    });
  }

  QueryBuilder<DebtIsar, double, QQueryOperations> interestRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interestRate');
    });
  }

  QueryBuilder<DebtIsar, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<DebtIsar, double, QQueryOperations> minimumPaymentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minimumPayment');
    });
  }

  QueryBuilder<DebtIsar, int, QQueryOperations> monthsRemainingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthsRemaining');
    });
  }

  QueryBuilder<DebtIsar, double, QQueryOperations>
      progressPercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progressPercentage');
    });
  }

  QueryBuilder<DebtIsar, DateTime, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<DebtIsar, DebtPayoffStrategy, QQueryOperations>
      strategyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'strategy');
    });
  }

  QueryBuilder<DebtIsar, DateTime?, QQueryOperations>
      targetPayoffDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetPayoffDate');
    });
  }

  QueryBuilder<DebtIsar, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<DebtIsar, double, QQueryOperations> totalInterestPaidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalInterestPaid');
    });
  }

  QueryBuilder<DebtIsar, double, QQueryOperations> totalPaidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPaid');
    });
  }

  QueryBuilder<DebtIsar, DebtType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<DebtIsar, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<DebtIsar, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
