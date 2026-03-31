// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_extraction_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReceiptExtractionIsarCollection on Isar {
  IsarCollection<ReceiptExtractionIsar> get receiptExtractionIsars =>
      this.collection();
}

const ReceiptExtractionIsarSchema = CollectionSchema(
  name: r'ReceiptExtractionIsar',
  id: 6511828154557932337,
  properties: {
    r'calculatedTaxAmount': PropertySchema(
      id: 0,
      name: r'calculatedTaxAmount',
      type: IsarType.double,
    ),
    r'cardLastFour': PropertySchema(
      id: 1,
      name: r'cardLastFour',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 2,
      name: r'category',
      type: IsarType.string,
    ),
    r'confidence': PropertySchema(
      id: 3,
      name: r'confidence',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currency': PropertySchema(
      id: 5,
      name: r'currency',
      type: IsarType.string,
    ),
    r'discountAmount': PropertySchema(
      id: 6,
      name: r'discountAmount',
      type: IsarType.string,
    ),
    r'documentId': PropertySchema(
      id: 7,
      name: r'documentId',
      type: IsarType.string,
    ),
    r'extractionDate': PropertySchema(
      id: 8,
      name: r'extractionDate',
      type: IsarType.dateTime,
    ),
    r'extractionId': PropertySchema(
      id: 9,
      name: r'extractionId',
      type: IsarType.string,
    ),
    r'hasErrors': PropertySchema(
      id: 10,
      name: r'hasErrors',
      type: IsarType.bool,
    ),
    r'hasItems': PropertySchema(
      id: 11,
      name: r'hasItems',
      type: IsarType.bool,
    ),
    r'hasMerchant': PropertySchema(
      id: 12,
      name: r'hasMerchant',
      type: IsarType.bool,
    ),
    r'hasValidAmount': PropertySchema(
      id: 13,
      name: r'hasValidAmount',
      type: IsarType.bool,
    ),
    r'imagePath': PropertySchema(
      id: 14,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'isCompleted': PropertySchema(
      id: 15,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'isDeleted': PropertySchema(
      id: 16,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'items': PropertySchema(
      id: 17,
      name: r'items',
      type: IsarType.objectList,
      target: r'ExtractedItem',
    ),
    r'merchantAddress': PropertySchema(
      id: 18,
      name: r'merchantAddress',
      type: IsarType.string,
    ),
    r'merchantName': PropertySchema(
      id: 19,
      name: r'merchantName',
      type: IsarType.string,
    ),
    r'metadataJson': PropertySchema(
      id: 20,
      name: r'metadataJson',
      type: IsarType.string,
    ),
    r'paymentMethod': PropertySchema(
      id: 21,
      name: r'paymentMethod',
      type: IsarType.string,
    ),
    r'purchaseDate': PropertySchema(
      id: 22,
      name: r'purchaseDate',
      type: IsarType.dateTime,
    ),
    r'purchaseTime': PropertySchema(
      id: 23,
      name: r'purchaseTime',
      type: IsarType.dateTime,
    ),
    r'rawText': PropertySchema(
      id: 24,
      name: r'rawText',
      type: IsarType.string,
    ),
    r'receiptNumber': PropertySchema(
      id: 25,
      name: r'receiptNumber',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 26,
      name: r'status',
      type: IsarType.byte,
      enumMap: _ReceiptExtractionIsarstatusEnumValueMap,
    ),
    r'subtotal': PropertySchema(
      id: 27,
      name: r'subtotal',
      type: IsarType.string,
    ),
    r'taxAmount': PropertySchema(
      id: 28,
      name: r'taxAmount',
      type: IsarType.string,
    ),
    r'tipAmount': PropertySchema(
      id: 29,
      name: r'tipAmount',
      type: IsarType.string,
    ),
    r'totalAmount': PropertySchema(
      id: 30,
      name: r'totalAmount',
      type: IsarType.double,
    ),
    r'transactionDate': PropertySchema(
      id: 31,
      name: r'transactionDate',
      type: IsarType.dateTime,
    ),
    r'updatedAt': PropertySchema(
      id: 32,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 33,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _receiptExtractionIsarEstimateSize,
  serialize: _receiptExtractionIsarSerialize,
  deserialize: _receiptExtractionIsarDeserialize,
  deserializeProp: _receiptExtractionIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ExtractedItem': ExtractedItemSchema},
  getId: _receiptExtractionIsarGetId,
  getLinks: _receiptExtractionIsarGetLinks,
  attach: _receiptExtractionIsarAttach,
  version: '3.1.0+1',
);

int _receiptExtractionIsarEstimateSize(
  ReceiptExtractionIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.cardLastFour;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.confidence;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.currency;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.discountAmount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.documentId.length * 3;
  bytesCount += 3 + object.extractionId.length * 3;
  bytesCount += 3 + object.imagePath.length * 3;
  bytesCount += 3 + object.items.length * 3;
  {
    final offsets = allOffsets[ExtractedItem]!;
    for (var i = 0; i < object.items.length; i++) {
      final value = object.items[i];
      bytesCount +=
          ExtractedItemSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.merchantAddress;
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
    final value = object.metadataJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.paymentMethod;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rawText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.receiptNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.subtotal;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taxAmount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tipAmount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _receiptExtractionIsarSerialize(
  ReceiptExtractionIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.calculatedTaxAmount);
  writer.writeString(offsets[1], object.cardLastFour);
  writer.writeString(offsets[2], object.category);
  writer.writeString(offsets[3], object.confidence);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.currency);
  writer.writeString(offsets[6], object.discountAmount);
  writer.writeString(offsets[7], object.documentId);
  writer.writeDateTime(offsets[8], object.extractionDate);
  writer.writeString(offsets[9], object.extractionId);
  writer.writeBool(offsets[10], object.hasErrors);
  writer.writeBool(offsets[11], object.hasItems);
  writer.writeBool(offsets[12], object.hasMerchant);
  writer.writeBool(offsets[13], object.hasValidAmount);
  writer.writeString(offsets[14], object.imagePath);
  writer.writeBool(offsets[15], object.isCompleted);
  writer.writeBool(offsets[16], object.isDeleted);
  writer.writeObjectList<ExtractedItem>(
    offsets[17],
    allOffsets,
    ExtractedItemSchema.serialize,
    object.items,
  );
  writer.writeString(offsets[18], object.merchantAddress);
  writer.writeString(offsets[19], object.merchantName);
  writer.writeString(offsets[20], object.metadataJson);
  writer.writeString(offsets[21], object.paymentMethod);
  writer.writeDateTime(offsets[22], object.purchaseDate);
  writer.writeDateTime(offsets[23], object.purchaseTime);
  writer.writeString(offsets[24], object.rawText);
  writer.writeString(offsets[25], object.receiptNumber);
  writer.writeByte(offsets[26], object.status.index);
  writer.writeString(offsets[27], object.subtotal);
  writer.writeString(offsets[28], object.taxAmount);
  writer.writeString(offsets[29], object.tipAmount);
  writer.writeDouble(offsets[30], object.totalAmount);
  writer.writeDateTime(offsets[31], object.transactionDate);
  writer.writeDateTime(offsets[32], object.updatedAt);
  writer.writeLong(offsets[33], object.version);
}

ReceiptExtractionIsar _receiptExtractionIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReceiptExtractionIsar();
  object.cardLastFour = reader.readStringOrNull(offsets[1]);
  object.category = reader.readStringOrNull(offsets[2]);
  object.confidence = reader.readStringOrNull(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.currency = reader.readStringOrNull(offsets[5]);
  object.discountAmount = reader.readStringOrNull(offsets[6]);
  object.documentId = reader.readString(offsets[7]);
  object.extractionDate = reader.readDateTime(offsets[8]);
  object.extractionId = reader.readString(offsets[9]);
  object.id = id;
  object.imagePath = reader.readString(offsets[14]);
  object.isDeleted = reader.readBool(offsets[16]);
  object.items = reader.readObjectList<ExtractedItem>(
        offsets[17],
        ExtractedItemSchema.deserialize,
        allOffsets,
        ExtractedItem(),
      ) ??
      [];
  object.merchantAddress = reader.readStringOrNull(offsets[18]);
  object.merchantName = reader.readStringOrNull(offsets[19]);
  object.metadataJson = reader.readStringOrNull(offsets[20]);
  object.paymentMethod = reader.readStringOrNull(offsets[21]);
  object.purchaseDate = reader.readDateTimeOrNull(offsets[22]);
  object.purchaseTime = reader.readDateTimeOrNull(offsets[23]);
  object.rawText = reader.readStringOrNull(offsets[24]);
  object.receiptNumber = reader.readStringOrNull(offsets[25]);
  object.status = _ReceiptExtractionIsarstatusValueEnumMap[
          reader.readByteOrNull(offsets[26])] ??
      ExtractionStatus.pending;
  object.subtotal = reader.readStringOrNull(offsets[27]);
  object.taxAmount = reader.readStringOrNull(offsets[28]);
  object.tipAmount = reader.readStringOrNull(offsets[29]);
  object.totalAmount = reader.readDoubleOrNull(offsets[30]);
  object.transactionDate = reader.readDateTimeOrNull(offsets[31]);
  object.updatedAt = reader.readDateTime(offsets[32]);
  object.version = reader.readLong(offsets[33]);
  return object;
}

P _receiptExtractionIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readObjectList<ExtractedItem>(
            offset,
            ExtractedItemSchema.deserialize,
            allOffsets,
            ExtractedItem(),
          ) ??
          []) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 23:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (_ReceiptExtractionIsarstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ExtractionStatus.pending) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readStringOrNull(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readDoubleOrNull(offset)) as P;
    case 31:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 32:
      return (reader.readDateTime(offset)) as P;
    case 33:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ReceiptExtractionIsarstatusEnumValueMap = {
  'pending': 0,
  'processing': 1,
  'completed': 2,
  'failed': 3,
  'needsReview': 4,
};
const _ReceiptExtractionIsarstatusValueEnumMap = {
  0: ExtractionStatus.pending,
  1: ExtractionStatus.processing,
  2: ExtractionStatus.completed,
  3: ExtractionStatus.failed,
  4: ExtractionStatus.needsReview,
};

Id _receiptExtractionIsarGetId(ReceiptExtractionIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _receiptExtractionIsarGetLinks(
    ReceiptExtractionIsar object) {
  return [];
}

void _receiptExtractionIsarAttach(
    IsarCollection<dynamic> col, Id id, ReceiptExtractionIsar object) {
  object.id = id;
}

extension ReceiptExtractionIsarQueryWhereSort
    on QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QWhere> {
  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReceiptExtractionIsarQueryWhere on QueryBuilder<ReceiptExtractionIsar,
    ReceiptExtractionIsar, QWhereClause> {
  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterWhereClause>
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterWhereClause>
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

extension ReceiptExtractionIsarQueryFilter on QueryBuilder<
    ReceiptExtractionIsar, ReceiptExtractionIsar, QFilterCondition> {
  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> calculatedTaxAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'calculatedTaxAmount',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> calculatedTaxAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'calculatedTaxAmount',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> calculatedTaxAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calculatedTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> calculatedTaxAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calculatedTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> calculatedTaxAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calculatedTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> calculatedTaxAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calculatedTaxAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> cardLastFourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cardLastFour',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> cardLastFourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cardLastFour',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> cardLastFourEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardLastFour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> cardLastFourGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardLastFour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> cardLastFourLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardLastFour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> cardLastFourBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardLastFour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> cardLastFourStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardLastFour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> cardLastFourEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardLastFour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      cardLastFourContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardLastFour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      cardLastFourMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardLastFour',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> cardLastFourIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardLastFour',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> cardLastFourIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardLastFour',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> categoryEqualTo(
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> categoryGreaterThan(
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> categoryLessThan(
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> categoryBetween(
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> categoryStartsWith(
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> categoryEndsWith(
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> confidenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'confidence',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> confidenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'confidence',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> confidenceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confidence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> confidenceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'confidence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> confidenceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'confidence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> confidenceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'confidence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> confidenceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'confidence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> confidenceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'confidence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      confidenceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'confidence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      confidenceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'confidence',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> confidenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confidence',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> confidenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'confidence',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> currencyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currency',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> currencyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currency',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> currencyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> currencyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> currencyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> currencyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> currencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> currencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      currencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      currencyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> currencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currency',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> currencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currency',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> discountAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discountAmount',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> discountAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discountAmount',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> discountAmountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> discountAmountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> discountAmountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> discountAmountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> discountAmountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'discountAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> discountAmountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'discountAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      discountAmountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'discountAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      discountAmountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'discountAmount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> discountAmountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> discountAmountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'discountAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> documentIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> documentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> documentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> documentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> documentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> documentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      documentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'documentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      documentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'documentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> documentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentId',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> documentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'documentId',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> extractionDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extractionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> extractionDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'extractionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> extractionDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'extractionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> extractionDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'extractionDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> extractionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extractionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> extractionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'extractionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> extractionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'extractionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> extractionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'extractionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> extractionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'extractionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> extractionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'extractionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      extractionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'extractionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      extractionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'extractionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> extractionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extractionId',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> extractionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'extractionId',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> hasErrorsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasErrors',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> hasItemsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasItems',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> hasMerchantEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasMerchant',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> hasValidAmountEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasValidAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> imagePathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> imagePathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> imagePathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> imagePathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> itemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> itemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> itemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> itemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> itemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'merchantAddress',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'merchantAddress',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'merchantAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'merchantAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'merchantAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'merchantAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'merchantAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'merchantAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      merchantAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'merchantAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      merchantAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'merchantAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'merchantAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'merchantAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'merchantName',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'merchantName',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantNameEqualTo(
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantNameGreaterThan(
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantNameLessThan(
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantNameBetween(
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantNameStartsWith(
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantNameEndsWith(
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      merchantNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'merchantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      merchantNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'merchantName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'merchantName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> merchantNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'merchantName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> metadataJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'metadataJson',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> metadataJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'metadataJson',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> metadataJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metadataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> metadataJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'metadataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> metadataJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'metadataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> metadataJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'metadataJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> metadataJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'metadataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> metadataJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'metadataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      metadataJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metadataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      metadataJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metadataJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> metadataJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metadataJson',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> metadataJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metadataJson',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> paymentMethodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paymentMethod',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> paymentMethodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paymentMethod',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> paymentMethodEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> paymentMethodGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> paymentMethodLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> paymentMethodBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> paymentMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> paymentMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      paymentMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      paymentMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> paymentMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> paymentMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> purchaseDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'purchaseDate',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> purchaseDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'purchaseDate',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> purchaseDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> purchaseDateGreaterThan(
    DateTime? value, {
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> purchaseDateLessThan(
    DateTime? value, {
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> purchaseDateBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> purchaseTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'purchaseTime',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> purchaseTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'purchaseTime',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> purchaseTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> purchaseTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> purchaseTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> purchaseTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> rawTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rawText',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> rawTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rawText',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> rawTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> rawTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rawText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> rawTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rawText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> rawTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rawText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> rawTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rawText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> rawTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rawText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      rawTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rawText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      rawTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rawText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> rawTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawText',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> rawTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rawText',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> receiptNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'receiptNumber',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> receiptNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'receiptNumber',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> receiptNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> receiptNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> receiptNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> receiptNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receiptNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> receiptNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> receiptNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      receiptNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      receiptNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receiptNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> receiptNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiptNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> receiptNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receiptNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> statusEqualTo(ExtractionStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> statusGreaterThan(
    ExtractionStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> statusLessThan(
    ExtractionStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> statusBetween(
    ExtractionStatus lower,
    ExtractionStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> subtotalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subtotal',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> subtotalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subtotal',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> subtotalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> subtotalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> subtotalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> subtotalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> subtotalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> subtotalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      subtotalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      subtotalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subtotal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> subtotalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtotal',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> subtotalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subtotal',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> taxAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxAmount',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> taxAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxAmount',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> taxAmountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> taxAmountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> taxAmountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> taxAmountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> taxAmountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> taxAmountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      taxAmountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      taxAmountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxAmount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> taxAmountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> taxAmountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> tipAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tipAmount',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> tipAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tipAmount',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> tipAmountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> tipAmountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> tipAmountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> tipAmountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> tipAmountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> tipAmountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      tipAmountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
          QAfterFilterCondition>
      tipAmountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipAmount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> tipAmountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> tipAmountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> totalAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalAmount',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> totalAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalAmount',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> totalAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> totalAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> totalAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> totalAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> transactionDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactionDate',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> transactionDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactionDate',
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> transactionDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> transactionDateGreaterThan(
    DateTime? value, {
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> transactionDateLessThan(
    DateTime? value, {
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> transactionDateBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
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

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
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

extension ReceiptExtractionIsarQueryObject on QueryBuilder<
    ReceiptExtractionIsar, ReceiptExtractionIsar, QFilterCondition> {
  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar,
      QAfterFilterCondition> itemsElement(FilterQuery<ExtractedItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'items');
    });
  }
}

extension ReceiptExtractionIsarQueryLinks on QueryBuilder<ReceiptExtractionIsar,
    ReceiptExtractionIsar, QFilterCondition> {}

extension ReceiptExtractionIsarQuerySortBy
    on QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QSortBy> {
  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByCalculatedTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedTaxAmount', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByCalculatedTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedTaxAmount', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByCardLastFour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardLastFour', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByCardLastFourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardLastFour', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByDocumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentId', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByDocumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentId', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByExtractionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extractionDate', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByExtractionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extractionDate', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByExtractionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extractionId', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByExtractionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extractionId', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByHasErrors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasErrors', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByHasErrorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasErrors', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByHasItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasItems', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByHasItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasItems', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByHasMerchant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMerchant', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByHasMerchantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMerchant', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByHasValidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasValidAmount', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByHasValidAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasValidAmount', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByMerchantAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantAddress', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByMerchantAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantAddress', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByMerchantName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantName', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByMerchantNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantName', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByMetadataJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metadataJson', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByMetadataJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metadataJson', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByPurchaseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseTime', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByPurchaseTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseTime', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByRawText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawText', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByRawTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawText', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByReceiptNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByReceiptNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortBySubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByTipAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipAmount', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByTipAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipAmount', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension ReceiptExtractionIsarQuerySortThenBy
    on QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QSortThenBy> {
  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByCalculatedTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedTaxAmount', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByCalculatedTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedTaxAmount', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByCardLastFour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardLastFour', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByCardLastFourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardLastFour', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByDocumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentId', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByDocumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentId', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByExtractionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extractionDate', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByExtractionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extractionDate', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByExtractionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extractionId', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByExtractionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extractionId', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByHasErrors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasErrors', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByHasErrorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasErrors', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByHasItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasItems', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByHasItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasItems', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByHasMerchant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMerchant', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByHasMerchantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasMerchant', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByHasValidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasValidAmount', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByHasValidAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasValidAmount', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByMerchantAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantAddress', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByMerchantAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantAddress', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByMerchantName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantName', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByMerchantNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merchantName', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByMetadataJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metadataJson', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByMetadataJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metadataJson', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByPurchaseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseTime', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByPurchaseTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseTime', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByRawText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawText', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByRawTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawText', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByReceiptNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByReceiptNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenBySubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByTipAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipAmount', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByTipAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipAmount', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension ReceiptExtractionIsarQueryWhereDistinct
    on QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct> {
  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByCalculatedTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calculatedTaxAmount');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByCardLastFour({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardLastFour', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByConfidence({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidence', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByCurrency({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByDiscountAmount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountAmount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByDocumentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByExtractionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'extractionDate');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByExtractionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'extractionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByHasErrors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasErrors');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByHasItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasItems');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByHasMerchant() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasMerchant');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByHasValidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasValidAmount');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByImagePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByMerchantAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'merchantAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByMerchantName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'merchantName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByMetadataJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metadataJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByPaymentMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseDate');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByPurchaseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseTime');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByRawText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rawText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByReceiptNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiptNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctBySubtotal({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subtotal', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByTaxAmount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxAmount', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByTipAmount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipAmount', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmount');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionDate');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ReceiptExtractionIsar, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension ReceiptExtractionIsarQueryProperty on QueryBuilder<
    ReceiptExtractionIsar, ReceiptExtractionIsar, QQueryProperty> {
  QueryBuilder<ReceiptExtractionIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, double?, QQueryOperations>
      calculatedTaxAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calculatedTaxAmount');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String?, QQueryOperations>
      cardLastFourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardLastFour');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String?, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String?, QQueryOperations>
      confidenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidence');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String?, QQueryOperations>
      currencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currency');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String?, QQueryOperations>
      discountAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountAmount');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String, QQueryOperations>
      documentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentId');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, DateTime, QQueryOperations>
      extractionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'extractionDate');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String, QQueryOperations>
      extractionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'extractionId');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, bool, QQueryOperations>
      hasErrorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasErrors');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, bool, QQueryOperations>
      hasItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasItems');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, bool, QQueryOperations>
      hasMerchantProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasMerchant');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, bool, QQueryOperations>
      hasValidAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasValidAmount');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String, QQueryOperations>
      imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, bool, QQueryOperations>
      isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, bool, QQueryOperations>
      isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, List<ExtractedItem>, QQueryOperations>
      itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'items');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String?, QQueryOperations>
      merchantAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'merchantAddress');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String?, QQueryOperations>
      merchantNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'merchantName');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String?, QQueryOperations>
      metadataJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metadataJson');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String?, QQueryOperations>
      paymentMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentMethod');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, DateTime?, QQueryOperations>
      purchaseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseDate');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, DateTime?, QQueryOperations>
      purchaseTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseTime');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String?, QQueryOperations>
      rawTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rawText');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String?, QQueryOperations>
      receiptNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiptNumber');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, ExtractionStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String?, QQueryOperations>
      subtotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtotal');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String?, QQueryOperations>
      taxAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxAmount');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, String?, QQueryOperations>
      tipAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipAmount');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, double?, QQueryOperations>
      totalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmount');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, DateTime?, QQueryOperations>
      transactionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionDate');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<ReceiptExtractionIsar, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ExtractedItemSchema = Schema(
  name: r'ExtractedItem',
  id: -415474760781554147,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
    ),
    r'confidence': PropertySchema(
      id: 1,
      name: r'confidence',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'discount': PropertySchema(
      id: 3,
      name: r'discount',
      type: IsarType.string,
    ),
    r'isValid': PropertySchema(
      id: 4,
      name: r'isValid',
      type: IsarType.bool,
    ),
    r'itemName': PropertySchema(
      id: 5,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 6,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'sku': PropertySchema(
      id: 7,
      name: r'sku',
      type: IsarType.string,
    ),
    r'tax': PropertySchema(
      id: 8,
      name: r'tax',
      type: IsarType.string,
    ),
    r'totalPrice': PropertySchema(
      id: 9,
      name: r'totalPrice',
      type: IsarType.double,
    ),
    r'unitPrice': PropertySchema(
      id: 10,
      name: r'unitPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _extractedItemEstimateSize,
  serialize: _extractedItemSerialize,
  deserialize: _extractedItemDeserialize,
  deserializeProp: _extractedItemDeserializeProp,
);

int _extractedItemEstimateSize(
  ExtractedItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.confidence;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.discount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.itemName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sku;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tax;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _extractedItemSerialize(
  ExtractedItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category);
  writer.writeString(offsets[1], object.confidence);
  writer.writeString(offsets[2], object.description);
  writer.writeString(offsets[3], object.discount);
  writer.writeBool(offsets[4], object.isValid);
  writer.writeString(offsets[5], object.itemName);
  writer.writeDouble(offsets[6], object.quantity);
  writer.writeString(offsets[7], object.sku);
  writer.writeString(offsets[8], object.tax);
  writer.writeDouble(offsets[9], object.totalPrice);
  writer.writeDouble(offsets[10], object.unitPrice);
}

ExtractedItem _extractedItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExtractedItem();
  object.category = reader.readStringOrNull(offsets[0]);
  object.confidence = reader.readStringOrNull(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.discount = reader.readStringOrNull(offsets[3]);
  object.itemName = reader.readStringOrNull(offsets[5]);
  object.quantity = reader.readDoubleOrNull(offsets[6]);
  object.sku = reader.readStringOrNull(offsets[7]);
  object.tax = reader.readStringOrNull(offsets[8]);
  object.totalPrice = reader.readDoubleOrNull(offsets[9]);
  object.unitPrice = reader.readDoubleOrNull(offsets[10]);
  return object;
}

P _extractedItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ExtractedItemQueryFilter
    on QueryBuilder<ExtractedItem, ExtractedItem, QFilterCondition> {
  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
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

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
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

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
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

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
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

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
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

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
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

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      confidenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'confidence',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      confidenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'confidence',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      confidenceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confidence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      confidenceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'confidence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      confidenceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'confidence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      confidenceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'confidence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      confidenceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'confidence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      confidenceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'confidence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      confidenceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'confidence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      confidenceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'confidence',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      confidenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confidence',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      confidenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'confidence',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      descriptionEqualTo(
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

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      descriptionGreaterThan(
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

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      descriptionLessThan(
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

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      descriptionBetween(
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

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
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

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
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

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      discountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discount',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      discountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discount',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      discountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      discountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      discountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      discountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      discountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'discount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      discountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'discount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      discountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'discount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      discountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'discount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      discountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discount',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      discountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'discount',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      isValidEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isValid',
        value: value,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      itemNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'itemName',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      itemNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'itemName',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      itemNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      itemNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      itemNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      itemNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      itemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      itemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      quantityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      quantityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      quantityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      quantityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      skuIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sku',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      skuIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sku',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition> skuEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      skuGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition> skuLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition> skuBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sku',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      skuStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition> skuEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition> skuContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition> skuMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sku',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      skuIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sku',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      skuIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sku',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      taxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tax',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      taxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tax',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition> taxEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      taxGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition> taxLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition> taxBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      taxStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition> taxEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition> taxContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition> taxMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tax',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      taxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tax',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      taxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tax',
        value: '',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      totalPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalPrice',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      totalPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalPrice',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      totalPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      totalPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      totalPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      totalPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      unitPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitPrice',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      unitPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitPrice',
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      unitPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      unitPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      unitPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExtractedItem, ExtractedItem, QAfterFilterCondition>
      unitPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ExtractedItemQueryObject
    on QueryBuilder<ExtractedItem, ExtractedItem, QFilterCondition> {}
