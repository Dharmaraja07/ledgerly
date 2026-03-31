// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInvestmentIsarCollection on Isar {
  IsarCollection<InvestmentIsar> get investmentIsars => this.collection();
}

const InvestmentIsarSchema = CollectionSchema(
  name: r'InvestmentIsar',
  id: 4433859909654667787,
  properties: {
    r'annualizedReturn': PropertySchema(
      id: 0,
      name: r'annualizedReturn',
      type: IsarType.double,
    ),
    r'averageCostPerShare': PropertySchema(
      id: 1,
      name: r'averageCostPerShare',
      type: IsarType.double,
    ),
    r'broker': PropertySchema(
      id: 2,
      name: r'broker',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currentPricePerShare': PropertySchema(
      id: 4,
      name: r'currentPricePerShare',
      type: IsarType.double,
    ),
    r'currentValue': PropertySchema(
      id: 5,
      name: r'currentValue',
      type: IsarType.double,
    ),
    r'dividendYield': PropertySchema(
      id: 6,
      name: r'dividendYield',
      type: IsarType.double,
    ),
    r'expenseRatio': PropertySchema(
      id: 7,
      name: r'expenseRatio',
      type: IsarType.double,
    ),
    r'investmentId': PropertySchema(
      id: 8,
      name: r'investmentId',
      type: IsarType.string,
    ),
    r'isDeleted': PropertySchema(
      id: 9,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'isLoss': PropertySchema(
      id: 10,
      name: r'isLoss',
      type: IsarType.bool,
    ),
    r'isProfitable': PropertySchema(
      id: 11,
      name: r'isProfitable',
      type: IsarType.bool,
    ),
    r'lastUpdated': PropertySchema(
      id: 12,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 13,
      name: r'name',
      type: IsarType.string,
    ),
    r'portfolioId': PropertySchema(
      id: 14,
      name: r'portfolioId',
      type: IsarType.string,
    ),
    r'purchaseDate': PropertySchema(
      id: 15,
      name: r'purchaseDate',
      type: IsarType.dateTime,
    ),
    r'region': PropertySchema(
      id: 16,
      name: r'region',
      type: IsarType.string,
    ),
    r'sector': PropertySchema(
      id: 17,
      name: r'sector',
      type: IsarType.string,
    ),
    r'sharesOwned': PropertySchema(
      id: 18,
      name: r'sharesOwned',
      type: IsarType.double,
    ),
    r'symbol': PropertySchema(
      id: 19,
      name: r'symbol',
      type: IsarType.string,
    ),
    r'totalCost': PropertySchema(
      id: 20,
      name: r'totalCost',
      type: IsarType.double,
    ),
    r'type': PropertySchema(
      id: 21,
      name: r'type',
      type: IsarType.byte,
      enumMap: _InvestmentIsartypeEnumValueMap,
    ),
    r'unrealizedGainLoss': PropertySchema(
      id: 22,
      name: r'unrealizedGainLoss',
      type: IsarType.double,
    ),
    r'unrealizedGainLossPercentage': PropertySchema(
      id: 23,
      name: r'unrealizedGainLossPercentage',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 24,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 25,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _investmentIsarEstimateSize,
  serialize: _investmentIsarSerialize,
  deserialize: _investmentIsarDeserialize,
  deserializeProp: _investmentIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _investmentIsarGetId,
  getLinks: _investmentIsarGetLinks,
  attach: _investmentIsarAttach,
  version: '3.1.0+1',
);

int _investmentIsarEstimateSize(
  InvestmentIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.broker;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.investmentId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.portfolioId.length * 3;
  {
    final value = object.region;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sector;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.symbol.length * 3;
  return bytesCount;
}

void _investmentIsarSerialize(
  InvestmentIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.annualizedReturn);
  writer.writeDouble(offsets[1], object.averageCostPerShare);
  writer.writeString(offsets[2], object.broker);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDouble(offsets[4], object.currentPricePerShare);
  writer.writeDouble(offsets[5], object.currentValue);
  writer.writeDouble(offsets[6], object.dividendYield);
  writer.writeDouble(offsets[7], object.expenseRatio);
  writer.writeString(offsets[8], object.investmentId);
  writer.writeBool(offsets[9], object.isDeleted);
  writer.writeBool(offsets[10], object.isLoss);
  writer.writeBool(offsets[11], object.isProfitable);
  writer.writeDateTime(offsets[12], object.lastUpdated);
  writer.writeString(offsets[13], object.name);
  writer.writeString(offsets[14], object.portfolioId);
  writer.writeDateTime(offsets[15], object.purchaseDate);
  writer.writeString(offsets[16], object.region);
  writer.writeString(offsets[17], object.sector);
  writer.writeDouble(offsets[18], object.sharesOwned);
  writer.writeString(offsets[19], object.symbol);
  writer.writeDouble(offsets[20], object.totalCost);
  writer.writeByte(offsets[21], object.type.index);
  writer.writeDouble(offsets[22], object.unrealizedGainLoss);
  writer.writeDouble(offsets[23], object.unrealizedGainLossPercentage);
  writer.writeDateTime(offsets[24], object.updatedAt);
  writer.writeLong(offsets[25], object.version);
}

InvestmentIsar _investmentIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InvestmentIsar();
  object.averageCostPerShare = reader.readDouble(offsets[1]);
  object.broker = reader.readStringOrNull(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.currentPricePerShare = reader.readDouble(offsets[4]);
  object.dividendYield = reader.readDoubleOrNull(offsets[6]);
  object.expenseRatio = reader.readDoubleOrNull(offsets[7]);
  object.id = id;
  object.investmentId = reader.readString(offsets[8]);
  object.isDeleted = reader.readBool(offsets[9]);
  object.lastUpdated = reader.readDateTimeOrNull(offsets[12]);
  object.name = reader.readString(offsets[13]);
  object.portfolioId = reader.readString(offsets[14]);
  object.purchaseDate = reader.readDateTime(offsets[15]);
  object.region = reader.readStringOrNull(offsets[16]);
  object.sector = reader.readStringOrNull(offsets[17]);
  object.sharesOwned = reader.readDouble(offsets[18]);
  object.symbol = reader.readString(offsets[19]);
  object.type =
      _InvestmentIsartypeValueEnumMap[reader.readByteOrNull(offsets[21])] ??
          InvestmentType.stock;
  object.updatedAt = reader.readDateTime(offsets[24]);
  object.version = reader.readLong(offsets[25]);
  return object;
}

P _investmentIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDateTime(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    case 21:
      return (_InvestmentIsartypeValueEnumMap[reader.readByteOrNull(offset)] ??
          InvestmentType.stock) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    case 23:
      return (reader.readDouble(offset)) as P;
    case 24:
      return (reader.readDateTime(offset)) as P;
    case 25:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _InvestmentIsartypeEnumValueMap = {
  'stock': 0,
  'bond': 1,
  'etf': 2,
  'mutualFund': 3,
  'reit': 4,
  'crypto': 5,
  'commodity': 6,
  'option': 7,
  'other': 8,
};
const _InvestmentIsartypeValueEnumMap = {
  0: InvestmentType.stock,
  1: InvestmentType.bond,
  2: InvestmentType.etf,
  3: InvestmentType.mutualFund,
  4: InvestmentType.reit,
  5: InvestmentType.crypto,
  6: InvestmentType.commodity,
  7: InvestmentType.option,
  8: InvestmentType.other,
};

Id _investmentIsarGetId(InvestmentIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _investmentIsarGetLinks(InvestmentIsar object) {
  return [];
}

void _investmentIsarAttach(
    IsarCollection<dynamic> col, Id id, InvestmentIsar object) {
  object.id = id;
}

extension InvestmentIsarQueryWhereSort
    on QueryBuilder<InvestmentIsar, InvestmentIsar, QWhere> {
  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InvestmentIsarQueryWhere
    on QueryBuilder<InvestmentIsar, InvestmentIsar, QWhereClause> {
  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterWhereClause> idBetween(
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

extension InvestmentIsarQueryFilter
    on QueryBuilder<InvestmentIsar, InvestmentIsar, QFilterCondition> {
  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      annualizedReturnEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'annualizedReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      annualizedReturnGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'annualizedReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      annualizedReturnLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'annualizedReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      annualizedReturnBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'annualizedReturn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      averageCostPerShareEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageCostPerShare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      averageCostPerShareGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageCostPerShare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      averageCostPerShareLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageCostPerShare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      averageCostPerShareBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageCostPerShare',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      brokerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'broker',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      brokerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'broker',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      brokerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'broker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      brokerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'broker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      brokerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'broker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      brokerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'broker',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      brokerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'broker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      brokerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'broker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      brokerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'broker',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      brokerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'broker',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      brokerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'broker',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      brokerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'broker',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      currentPricePerShareEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentPricePerShare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      currentPricePerShareGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentPricePerShare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      currentPricePerShareLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentPricePerShare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      currentPricePerShareBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentPricePerShare',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      currentValueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      currentValueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      currentValueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      currentValueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      dividendYieldIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dividendYield',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      dividendYieldIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dividendYield',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      dividendYieldEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dividendYield',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      dividendYieldGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dividendYield',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      dividendYieldLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dividendYield',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      dividendYieldBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dividendYield',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      expenseRatioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseRatio',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      expenseRatioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseRatio',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      expenseRatioEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      expenseRatioGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      expenseRatioLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      expenseRatioBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseRatio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      investmentIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'investmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      investmentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'investmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      investmentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'investmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      investmentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'investmentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      investmentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'investmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      investmentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'investmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      investmentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'investmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      investmentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'investmentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      investmentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'investmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      investmentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'investmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      isLossEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLoss',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      isProfitableEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isProfitable',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      lastUpdatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      lastUpdatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      lastUpdatedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      lastUpdatedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      lastUpdatedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      portfolioIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portfolioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      portfolioIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portfolioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      portfolioIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portfolioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      portfolioIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portfolioId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      portfolioIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'portfolioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      portfolioIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'portfolioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      portfolioIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'portfolioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      portfolioIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'portfolioId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      portfolioIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portfolioId',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      portfolioIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'portfolioId',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      purchaseDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      purchaseDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      purchaseDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      purchaseDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      regionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'region',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      regionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'region',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      regionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      regionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      regionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      regionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'region',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      regionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      regionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      regionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      regionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'region',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      regionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'region',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      regionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'region',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sectorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sector',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sectorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sector',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sectorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sectorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sectorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sectorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sector',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sectorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sectorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sectorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sectorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sector',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sectorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sectorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sharesOwnedEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sharesOwned',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sharesOwnedGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sharesOwned',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sharesOwnedLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sharesOwned',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      sharesOwnedBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sharesOwned',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      symbolEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      symbolGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      symbolLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      symbolBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'symbol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      symbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      symbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      symbolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      symbolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'symbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      symbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      symbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      totalCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      totalCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      totalCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      totalCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      typeEqualTo(InvestmentType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      typeGreaterThan(
    InvestmentType value, {
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      typeLessThan(
    InvestmentType value, {
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      typeBetween(
    InvestmentType lower,
    InvestmentType upper, {
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      unrealizedGainLossEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unrealizedGainLoss',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      unrealizedGainLossGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unrealizedGainLoss',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      unrealizedGainLossLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unrealizedGainLoss',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      unrealizedGainLossBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unrealizedGainLoss',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      unrealizedGainLossPercentageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unrealizedGainLossPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      unrealizedGainLossPercentageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unrealizedGainLossPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      unrealizedGainLossPercentageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unrealizedGainLossPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      unrealizedGainLossPercentageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unrealizedGainLossPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
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

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterFilterCondition>
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

extension InvestmentIsarQueryObject
    on QueryBuilder<InvestmentIsar, InvestmentIsar, QFilterCondition> {}

extension InvestmentIsarQueryLinks
    on QueryBuilder<InvestmentIsar, InvestmentIsar, QFilterCondition> {}

extension InvestmentIsarQuerySortBy
    on QueryBuilder<InvestmentIsar, InvestmentIsar, QSortBy> {
  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByAnnualizedReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualizedReturn', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByAnnualizedReturnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualizedReturn', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByAverageCostPerShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCostPerShare', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByAverageCostPerShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCostPerShare', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> sortByBroker() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'broker', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByBrokerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'broker', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByCurrentPricePerShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPricePerShare', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByCurrentPricePerShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPricePerShare', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByCurrentValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentValue', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByCurrentValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentValue', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByDividendYield() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dividendYield', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByDividendYieldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dividendYield', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByExpenseRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseRatio', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByExpenseRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseRatio', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByInvestmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'investmentId', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByInvestmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'investmentId', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> sortByIsLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLoss', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByIsLossDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLoss', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByIsProfitable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isProfitable', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByIsProfitableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isProfitable', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByPortfolioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portfolioId', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByPortfolioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portfolioId', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> sortByRegion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByRegionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> sortBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortBySharesOwned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharesOwned', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortBySharesOwnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharesOwned', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> sortBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> sortByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByTotalCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByUnrealizedGainLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unrealizedGainLoss', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByUnrealizedGainLossDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unrealizedGainLoss', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByUnrealizedGainLossPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unrealizedGainLossPercentage', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByUnrealizedGainLossPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unrealizedGainLossPercentage', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension InvestmentIsarQuerySortThenBy
    on QueryBuilder<InvestmentIsar, InvestmentIsar, QSortThenBy> {
  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByAnnualizedReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualizedReturn', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByAnnualizedReturnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualizedReturn', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByAverageCostPerShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCostPerShare', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByAverageCostPerShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCostPerShare', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenByBroker() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'broker', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByBrokerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'broker', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByCurrentPricePerShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPricePerShare', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByCurrentPricePerShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPricePerShare', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByCurrentValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentValue', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByCurrentValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentValue', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByDividendYield() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dividendYield', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByDividendYieldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dividendYield', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByExpenseRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseRatio', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByExpenseRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseRatio', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByInvestmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'investmentId', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByInvestmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'investmentId', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenByIsLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLoss', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByIsLossDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLoss', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByIsProfitable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isProfitable', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByIsProfitableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isProfitable', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByPortfolioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portfolioId', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByPortfolioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portfolioId', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenByRegion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByRegionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenBySharesOwned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharesOwned', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenBySharesOwnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharesOwned', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByTotalCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByUnrealizedGainLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unrealizedGainLoss', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByUnrealizedGainLossDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unrealizedGainLoss', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByUnrealizedGainLossPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unrealizedGainLossPercentage', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByUnrealizedGainLossPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unrealizedGainLossPercentage', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension InvestmentIsarQueryWhereDistinct
    on QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct> {
  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByAnnualizedReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'annualizedReturn');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByAverageCostPerShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageCostPerShare');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct> distinctByBroker(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'broker', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByCurrentPricePerShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentPricePerShare');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByCurrentValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentValue');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByDividendYield() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dividendYield');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByExpenseRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenseRatio');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByInvestmentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'investmentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct> distinctByIsLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLoss');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByIsProfitable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isProfitable');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct> distinctByPortfolioId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'portfolioId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseDate');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct> distinctByRegion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'region', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct> distinctBySector(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sector', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctBySharesOwned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sharesOwned');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct> distinctBySymbol(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'symbol', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCost');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByUnrealizedGainLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unrealizedGainLoss');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByUnrealizedGainLossPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unrealizedGainLossPercentage');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentIsar, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension InvestmentIsarQueryProperty
    on QueryBuilder<InvestmentIsar, InvestmentIsar, QQueryProperty> {
  QueryBuilder<InvestmentIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InvestmentIsar, double, QQueryOperations>
      annualizedReturnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'annualizedReturn');
    });
  }

  QueryBuilder<InvestmentIsar, double, QQueryOperations>
      averageCostPerShareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageCostPerShare');
    });
  }

  QueryBuilder<InvestmentIsar, String?, QQueryOperations> brokerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'broker');
    });
  }

  QueryBuilder<InvestmentIsar, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<InvestmentIsar, double, QQueryOperations>
      currentPricePerShareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentPricePerShare');
    });
  }

  QueryBuilder<InvestmentIsar, double, QQueryOperations>
      currentValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentValue');
    });
  }

  QueryBuilder<InvestmentIsar, double?, QQueryOperations>
      dividendYieldProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dividendYield');
    });
  }

  QueryBuilder<InvestmentIsar, double?, QQueryOperations>
      expenseRatioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenseRatio');
    });
  }

  QueryBuilder<InvestmentIsar, String, QQueryOperations>
      investmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'investmentId');
    });
  }

  QueryBuilder<InvestmentIsar, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<InvestmentIsar, bool, QQueryOperations> isLossProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLoss');
    });
  }

  QueryBuilder<InvestmentIsar, bool, QQueryOperations> isProfitableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isProfitable');
    });
  }

  QueryBuilder<InvestmentIsar, DateTime?, QQueryOperations>
      lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<InvestmentIsar, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<InvestmentIsar, String, QQueryOperations> portfolioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portfolioId');
    });
  }

  QueryBuilder<InvestmentIsar, DateTime, QQueryOperations>
      purchaseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseDate');
    });
  }

  QueryBuilder<InvestmentIsar, String?, QQueryOperations> regionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'region');
    });
  }

  QueryBuilder<InvestmentIsar, String?, QQueryOperations> sectorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sector');
    });
  }

  QueryBuilder<InvestmentIsar, double, QQueryOperations> sharesOwnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sharesOwned');
    });
  }

  QueryBuilder<InvestmentIsar, String, QQueryOperations> symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'symbol');
    });
  }

  QueryBuilder<InvestmentIsar, double, QQueryOperations> totalCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCost');
    });
  }

  QueryBuilder<InvestmentIsar, InvestmentType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<InvestmentIsar, double, QQueryOperations>
      unrealizedGainLossProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unrealizedGainLoss');
    });
  }

  QueryBuilder<InvestmentIsar, double, QQueryOperations>
      unrealizedGainLossPercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unrealizedGainLossPercentage');
    });
  }

  QueryBuilder<InvestmentIsar, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<InvestmentIsar, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInvestmentPortfolioIsarCollection on Isar {
  IsarCollection<InvestmentPortfolioIsar> get investmentPortfolioIsars =>
      this.collection();
}

const InvestmentPortfolioIsarSchema = CollectionSchema(
  name: r'InvestmentPortfolioIsar',
  id: 7993405083210822528,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'dividendYield': PropertySchema(
      id: 2,
      name: r'dividendYield',
      type: IsarType.double,
    ),
    r'expenseRatio': PropertySchema(
      id: 3,
      name: r'expenseRatio',
      type: IsarType.double,
    ),
    r'isDeleted': PropertySchema(
      id: 4,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'portfolioId': PropertySchema(
      id: 6,
      name: r'portfolioId',
      type: IsarType.string,
    ),
    r'totalCost': PropertySchema(
      id: 7,
      name: r'totalCost',
      type: IsarType.double,
    ),
    r'totalGainLoss': PropertySchema(
      id: 8,
      name: r'totalGainLoss',
      type: IsarType.double,
    ),
    r'totalGainLossPercentage': PropertySchema(
      id: 9,
      name: r'totalGainLossPercentage',
      type: IsarType.double,
    ),
    r'totalValue': PropertySchema(
      id: 10,
      name: r'totalValue',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 12,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _investmentPortfolioIsarEstimateSize,
  serialize: _investmentPortfolioIsarSerialize,
  deserialize: _investmentPortfolioIsarDeserialize,
  deserializeProp: _investmentPortfolioIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _investmentPortfolioIsarGetId,
  getLinks: _investmentPortfolioIsarGetLinks,
  attach: _investmentPortfolioIsarAttach,
  version: '3.1.0+1',
);

int _investmentPortfolioIsarEstimateSize(
  InvestmentPortfolioIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.portfolioId.length * 3;
  return bytesCount;
}

void _investmentPortfolioIsarSerialize(
  InvestmentPortfolioIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.description);
  writer.writeDouble(offsets[2], object.dividendYield);
  writer.writeDouble(offsets[3], object.expenseRatio);
  writer.writeBool(offsets[4], object.isDeleted);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.portfolioId);
  writer.writeDouble(offsets[7], object.totalCost);
  writer.writeDouble(offsets[8], object.totalGainLoss);
  writer.writeDouble(offsets[9], object.totalGainLossPercentage);
  writer.writeDouble(offsets[10], object.totalValue);
  writer.writeDateTime(offsets[11], object.updatedAt);
  writer.writeLong(offsets[12], object.version);
}

InvestmentPortfolioIsar _investmentPortfolioIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InvestmentPortfolioIsar();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.portfolioId = reader.readString(offsets[6]);
  object.totalCost = reader.readDouble(offsets[7]);
  object.totalValue = reader.readDouble(offsets[10]);
  object.updatedAt = reader.readDateTime(offsets[11]);
  object.version = reader.readLong(offsets[12]);
  return object;
}

P _investmentPortfolioIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _investmentPortfolioIsarGetId(InvestmentPortfolioIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _investmentPortfolioIsarGetLinks(
    InvestmentPortfolioIsar object) {
  return [];
}

void _investmentPortfolioIsarAttach(
    IsarCollection<dynamic> col, Id id, InvestmentPortfolioIsar object) {
  object.id = id;
}

extension InvestmentPortfolioIsarQueryWhereSort
    on QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QWhere> {
  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InvestmentPortfolioIsarQueryWhere on QueryBuilder<
    InvestmentPortfolioIsar, InvestmentPortfolioIsar, QWhereClause> {
  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterWhereClause> idBetween(
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

extension InvestmentPortfolioIsarQueryFilter on QueryBuilder<
    InvestmentPortfolioIsar, InvestmentPortfolioIsar, QFilterCondition> {
  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> descriptionEqualTo(
    String? value, {
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> descriptionLessThan(
    String? value, {
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
          QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
          QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> dividendYieldEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dividendYield',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> dividendYieldGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dividendYield',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> dividendYieldLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dividendYield',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> dividendYieldBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dividendYield',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> expenseRatioEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> expenseRatioGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> expenseRatioLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> expenseRatioBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseRatio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> portfolioIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portfolioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> portfolioIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portfolioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> portfolioIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portfolioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> portfolioIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portfolioId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> portfolioIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'portfolioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> portfolioIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'portfolioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
          QAfterFilterCondition>
      portfolioIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'portfolioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
          QAfterFilterCondition>
      portfolioIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'portfolioId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> portfolioIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portfolioId',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> portfolioIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'portfolioId',
        value: '',
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalGainLossEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalGainLoss',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalGainLossGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalGainLoss',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalGainLossLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalGainLoss',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalGainLossBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalGainLoss',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalGainLossPercentageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalGainLossPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalGainLossPercentageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalGainLossPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalGainLossPercentageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalGainLossPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalGainLossPercentageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalGainLossPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalValueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalValueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalValueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> totalValueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> versionGreaterThan(
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> versionLessThan(
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

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar,
      QAfterFilterCondition> versionBetween(
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

extension InvestmentPortfolioIsarQueryObject on QueryBuilder<
    InvestmentPortfolioIsar, InvestmentPortfolioIsar, QFilterCondition> {}

extension InvestmentPortfolioIsarQueryLinks on QueryBuilder<
    InvestmentPortfolioIsar, InvestmentPortfolioIsar, QFilterCondition> {}

extension InvestmentPortfolioIsarQuerySortBy
    on QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QSortBy> {
  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByDividendYield() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dividendYield', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByDividendYieldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dividendYield', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByExpenseRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseRatio', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByExpenseRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseRatio', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByPortfolioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portfolioId', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByPortfolioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portfolioId', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByTotalCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByTotalGainLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGainLoss', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByTotalGainLossDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGainLoss', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByTotalGainLossPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGainLossPercentage', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByTotalGainLossPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGainLossPercentage', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByTotalValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalValue', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByTotalValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalValue', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension InvestmentPortfolioIsarQuerySortThenBy on QueryBuilder<
    InvestmentPortfolioIsar, InvestmentPortfolioIsar, QSortThenBy> {
  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByDividendYield() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dividendYield', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByDividendYieldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dividendYield', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByExpenseRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseRatio', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByExpenseRatioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseRatio', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByPortfolioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portfolioId', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByPortfolioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portfolioId', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByTotalCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByTotalGainLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGainLoss', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByTotalGainLossDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGainLoss', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByTotalGainLossPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGainLossPercentage', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByTotalGainLossPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalGainLossPercentage', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByTotalValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalValue', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByTotalValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalValue', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension InvestmentPortfolioIsarQueryWhereDistinct on QueryBuilder<
    InvestmentPortfolioIsar, InvestmentPortfolioIsar, QDistinct> {
  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QDistinct>
      distinctByDividendYield() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dividendYield');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QDistinct>
      distinctByExpenseRatio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenseRatio');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QDistinct>
      distinctByPortfolioId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'portfolioId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QDistinct>
      distinctByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCost');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QDistinct>
      distinctByTotalGainLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalGainLoss');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QDistinct>
      distinctByTotalGainLossPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalGainLossPercentage');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QDistinct>
      distinctByTotalValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalValue');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, InvestmentPortfolioIsar, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension InvestmentPortfolioIsarQueryProperty on QueryBuilder<
    InvestmentPortfolioIsar, InvestmentPortfolioIsar, QQueryProperty> {
  QueryBuilder<InvestmentPortfolioIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, double, QQueryOperations>
      dividendYieldProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dividendYield');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, double, QQueryOperations>
      expenseRatioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenseRatio');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, bool, QQueryOperations>
      isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, String, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, String, QQueryOperations>
      portfolioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portfolioId');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, double, QQueryOperations>
      totalCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCost');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, double, QQueryOperations>
      totalGainLossProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalGainLoss');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, double, QQueryOperations>
      totalGainLossPercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalGainLossPercentage');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, double, QQueryOperations>
      totalValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalValue');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<InvestmentPortfolioIsar, int, QQueryOperations>
      versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
