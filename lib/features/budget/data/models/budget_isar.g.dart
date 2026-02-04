// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBudgetIsarCollection on Isar {
  IsarCollection<BudgetIsar> get budgetIsars => this.collection();
}

const BudgetIsarSchema = CollectionSchema(
  name: r'BudgetIsar',
  id: 5646041003862359881,
  properties: {
    r'budgetId': PropertySchema(
      id: 0,
      name: r'budgetId',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 1,
      name: r'category',
      type: IsarType.string,
    ),
    r'groupId': PropertySchema(
      id: 2,
      name: r'groupId',
      type: IsarType.string,
    ),
    r'limit': PropertySchema(
      id: 3,
      name: r'limit',
      type: IsarType.double,
    ),
    r'month': PropertySchema(
      id: 4,
      name: r'month',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _budgetIsarEstimateSize,
  serialize: _budgetIsarSerialize,
  deserialize: _budgetIsarDeserialize,
  deserializeProp: _budgetIsarDeserializeProp,
  idName: r'id',
  indexes: {
    r'budgetId': IndexSchema(
      id: 1954233043883219522,
      name: r'budgetId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'budgetId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _budgetIsarGetId,
  getLinks: _budgetIsarGetLinks,
  attach: _budgetIsarAttach,
  version: '3.1.0+1',
);

int _budgetIsarEstimateSize(
  BudgetIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.budgetId.length * 3;
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.groupId.length * 3;
  return bytesCount;
}

void _budgetIsarSerialize(
  BudgetIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.budgetId);
  writer.writeString(offsets[1], object.category);
  writer.writeString(offsets[2], object.groupId);
  writer.writeDouble(offsets[3], object.limit);
  writer.writeDateTime(offsets[4], object.month);
}

BudgetIsar _budgetIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BudgetIsar();
  object.budgetId = reader.readString(offsets[0]);
  object.category = reader.readString(offsets[1]);
  object.groupId = reader.readString(offsets[2]);
  object.id = id;
  object.limit = reader.readDouble(offsets[3]);
  object.month = reader.readDateTime(offsets[4]);
  return object;
}

P _budgetIsarDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _budgetIsarGetId(BudgetIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _budgetIsarGetLinks(BudgetIsar object) {
  return [];
}

void _budgetIsarAttach(IsarCollection<dynamic> col, Id id, BudgetIsar object) {
  object.id = id;
}

extension BudgetIsarByIndex on IsarCollection<BudgetIsar> {
  Future<BudgetIsar?> getByBudgetId(String budgetId) {
    return getByIndex(r'budgetId', [budgetId]);
  }

  BudgetIsar? getByBudgetIdSync(String budgetId) {
    return getByIndexSync(r'budgetId', [budgetId]);
  }

  Future<bool> deleteByBudgetId(String budgetId) {
    return deleteByIndex(r'budgetId', [budgetId]);
  }

  bool deleteByBudgetIdSync(String budgetId) {
    return deleteByIndexSync(r'budgetId', [budgetId]);
  }

  Future<List<BudgetIsar?>> getAllByBudgetId(List<String> budgetIdValues) {
    final values = budgetIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'budgetId', values);
  }

  List<BudgetIsar?> getAllByBudgetIdSync(List<String> budgetIdValues) {
    final values = budgetIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'budgetId', values);
  }

  Future<int> deleteAllByBudgetId(List<String> budgetIdValues) {
    final values = budgetIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'budgetId', values);
  }

  int deleteAllByBudgetIdSync(List<String> budgetIdValues) {
    final values = budgetIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'budgetId', values);
  }

  Future<Id> putByBudgetId(BudgetIsar object) {
    return putByIndex(r'budgetId', object);
  }

  Id putByBudgetIdSync(BudgetIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'budgetId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByBudgetId(List<BudgetIsar> objects) {
    return putAllByIndex(r'budgetId', objects);
  }

  List<Id> putAllByBudgetIdSync(List<BudgetIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'budgetId', objects, saveLinks: saveLinks);
  }
}

extension BudgetIsarQueryWhereSort
    on QueryBuilder<BudgetIsar, BudgetIsar, QWhere> {
  QueryBuilder<BudgetIsar, BudgetIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BudgetIsarQueryWhere
    on QueryBuilder<BudgetIsar, BudgetIsar, QWhereClause> {
  QueryBuilder<BudgetIsar, BudgetIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterWhereClause> idBetween(
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

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterWhereClause> budgetIdEqualTo(
      String budgetId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'budgetId',
        value: [budgetId],
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterWhereClause> budgetIdNotEqualTo(
      String budgetId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'budgetId',
              lower: [],
              upper: [budgetId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'budgetId',
              lower: [budgetId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'budgetId',
              lower: [budgetId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'budgetId',
              lower: [],
              upper: [budgetId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BudgetIsarQueryFilter
    on QueryBuilder<BudgetIsar, BudgetIsar, QFilterCondition> {
  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> budgetIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'budgetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition>
      budgetIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'budgetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> budgetIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'budgetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> budgetIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'budgetId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition>
      budgetIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'budgetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> budgetIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'budgetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> budgetIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'budgetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> budgetIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'budgetId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition>
      budgetIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'budgetId',
        value: '',
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition>
      budgetIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'budgetId',
        value: '',
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> categoryEqualTo(
    String value, {
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

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition>
      categoryGreaterThan(
    String value, {
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

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> categoryLessThan(
    String value, {
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

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> categoryBetween(
    String lower,
    String upper, {
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

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition>
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

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> categoryEndsWith(
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

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> categoryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> categoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> groupIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition>
      groupIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> groupIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> groupIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> groupIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> groupIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> groupIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> groupIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> groupIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupId',
        value: '',
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition>
      groupIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupId',
        value: '',
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> limitEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'limit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> limitGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'limit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> limitLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'limit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> limitBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'limit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> monthEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> monthGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> monthLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterFilterCondition> monthBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'month',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BudgetIsarQueryObject
    on QueryBuilder<BudgetIsar, BudgetIsar, QFilterCondition> {}

extension BudgetIsarQueryLinks
    on QueryBuilder<BudgetIsar, BudgetIsar, QFilterCondition> {}

extension BudgetIsarQuerySortBy
    on QueryBuilder<BudgetIsar, BudgetIsar, QSortBy> {
  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> sortByBudgetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budgetId', Sort.asc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> sortByBudgetIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budgetId', Sort.desc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> sortByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> sortByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> sortByLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.asc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> sortByLimitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.desc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> sortByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> sortByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }
}

extension BudgetIsarQuerySortThenBy
    on QueryBuilder<BudgetIsar, BudgetIsar, QSortThenBy> {
  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> thenByBudgetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budgetId', Sort.asc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> thenByBudgetIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budgetId', Sort.desc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> thenByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> thenByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> thenByLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.asc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> thenByLimitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.desc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> thenByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QAfterSortBy> thenByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }
}

extension BudgetIsarQueryWhereDistinct
    on QueryBuilder<BudgetIsar, BudgetIsar, QDistinct> {
  QueryBuilder<BudgetIsar, BudgetIsar, QDistinct> distinctByBudgetId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'budgetId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QDistinct> distinctByGroupId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QDistinct> distinctByLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'limit');
    });
  }

  QueryBuilder<BudgetIsar, BudgetIsar, QDistinct> distinctByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'month');
    });
  }
}

extension BudgetIsarQueryProperty
    on QueryBuilder<BudgetIsar, BudgetIsar, QQueryProperty> {
  QueryBuilder<BudgetIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BudgetIsar, String, QQueryOperations> budgetIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'budgetId');
    });
  }

  QueryBuilder<BudgetIsar, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<BudgetIsar, String, QQueryOperations> groupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupId');
    });
  }

  QueryBuilder<BudgetIsar, double, QQueryOperations> limitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'limit');
    });
  }

  QueryBuilder<BudgetIsar, DateTime, QQueryOperations> monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'month');
    });
  }
}
