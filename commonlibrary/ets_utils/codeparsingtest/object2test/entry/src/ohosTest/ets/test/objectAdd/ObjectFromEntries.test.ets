/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '@ohos/hypium';
import {
  fromEntriesBasic,
  fromEntriesMapToObj,
  fromEntriesArrayToObj,
  fromEntriesReverseOfEntries,
  fromEntriesMapEntryValues,
  fromEntriesEmptyArray,
  fromEntriesEmptyMap,
  fromEntriesStandard2DArray,
  fromEntriesArrayWithExtraElements,
  fromEntriesArrayWithSingleElement,
  fromEntriesPlainMap,
  fromEntriesMapWithSymbolKeys,
  fromEntriesSetAsIterable,
  fromEntriesCustomIterator,
  fromEntriesGeneratorIterator,
  fromEntriesTypedArrayAsEntries,
  fromEntriesStringKeys,
  fromEntriesEmptyStringKey,
  fromEntriesSpecialCharKeys,
  fromEntriesUnicodeKeys,
  fromEntriesNumericStringKeys,
  fromEntriesSymbolKey,
  fromEntriesSymbolForKey,
  fromEntriesMixedSymbolStringKeys,
  fromEntriesIntegerKeys,
  fromEntriesFloatKeys,
  fromEntriesSpecialNumericKeys,
  fromEntriesBooleanKeys,
  fromEntriesNullKey,
  fromEntriesUndefinedKey,
  fromEntriesObjectKey,
  fromEntriesFunctionKey,
  fromEntriesStringValues,
  fromEntriesNumberValues,
  fromEntriesBooleanValues,
  fromEntriesNullValue,
  fromEntriesUndefinedValue,
  fromEntriesBigIntValues,
  fromEntriesLargeBigIntValues,
  fromEntriesSymbolValue,
  fromEntriesObjectValue,
  fromEntriesNestedObjectValue,
  fromEntriesObjectWithSymbolKeyValue,
  fromEntriesObjectWithFunctionValue,
  fromEntriesFrozenObjectValue,
  fromEntriesSealedObjectValue,
  fromEntriesNonExtensibleObjectValue,
  fromEntriesArrayValue,
  fromEntriesArrayWithSpecialValues,
  fromEntriesTypedArrayValues,
  fromEntriesMapAsValue,
  fromEntriesSetAsValue,
  fromEntriesDateAsValue,
  fromEntriesRegExpAsValue,
  fromEntriesArrayBufferAsValue,
  fromEntriesDataViewAsValue,
  fromEntriesPromiseAsValue,
  fromEntriesFunctionAsValue,
  fromEntriesArrayEntries,
  fromEntriesArrayKeysError,
  fromEntriesMapEntries,
  fromEntriesMapDirect,
  fromEntriesSetEntries,
  fromEntriesSetDirect,
  fromEntriesCustomSymbolIterator,
  fromEntriesClassIterator,
  fromEntriesIteratorWithReturn,
  fromEntriesGenerator,
  fromEntriesGeneratorWithParams,
  fromEntriesAsyncGeneratorError,
  fromEntriesStringAsIterable,
  fromEntriesArgsObject,
  fromEntriesTypedArrayEntriesMethod,
  fromEntriesMatchAllIterator,
  fromEntriesEmptyIterableArray,
  fromEntriesEmptyMapBoundary,
  fromEntriesEmptySet,
  fromEntriesEmptyStringKeyValue,
  fromEntriesLargeNumberOfEntries,
  fromEntriesSingleEntry,
  fromEntriesReservedWordKeys,
  fromEntriesProtoKey,
  fromEntriesConstructorKey,
  fromEntriesHasOwnPropertyKey,
  fromEntriesToStringKey,
  fromEntriesSameKeyOverride,
  fromEntriesDifferentTypesSameStringKey,
  fromEntriesSymbolKeyDoesNotOverrideStringKey,
  fromEntriesMaxValue,
  fromEntriesMinValue,
  fromEntriesLongStringKey,
  fromEntriesLongStringValue,
  fromEntriesNaNKey,
  fromEntriesInfinityKey,
  fromEntriesNegativeZeroKey,
  fromEntriesUndefinedElement,
  fromEntriesNullElement,
  fromEntriesSingleElementEntry,
  fromEntriesEmptyArrayEntry,
  fromEntriesDeepNestedValue,
  fromEntriesNonIterable,
  fromEntriesNullThrows,
  fromEntriesUndefinedThrows,
  fromEntriesPlainObjectThrows,
  fromEntriesBooleanThrows,
  fromEntriesNoArgThrows,
  fromEntriesNonObjectEntriesThrows,
  fromEntriesNullEntryThrows,
  fromEntriesUndefinedEntryThrows,
  fromEntriesOnlyKeyEntry,
  fromEntriesArrayLikeEntry,
  fromEntriesObjectAsKey,
  fromEntriesFunctionAsKeyType,
  fromEntriesIteratorThrowsError,
  fromEntriesIteratorReturnsInvalidValue,
  fromEntriesIteratorNoNextMethod,
  fromEntriesCallApplyThis,
  fromEntriesBindThis,
  fromEntriesAsConstructorThrows,
  fromEntriesCircularRefValue,
  fromEntriesProxyIterable,
  fromEntriesRevokedProxyThrows,
  fromEntriesProtoKeyProtoChain,
  fromEntriesInheritedObjectValue,
  fromEntriesDefaultDescriptor,
  fromEntriesModifyDescriptorAfterCreation,
  fromEntriesSymbolKeyEnumerable,
  fromEntriesFreezeAfterCreation,
  fromEntriesSealAfterCreation,
  fromEntriesPreventExtensionsAfterCreation,
  fromEntriesReferenceTypeValue,
  fromEntriesArrayRefValue,
  fromEntriesClassInstanceProp,
  fromEntriesSpreadComparison,
  fromEntriesJSONSerialization,
  fromEntriesSymbolKeyNotInJSON,
  fromEntriesUndefinedValueNotInJSON,
  fromEntriesKeyIterationOrder,
  fromEntriesForInOrder,
  fromEntriesLargeDataMemory,
  fromEntriesReleaseReferenceMemory,
  fromEntriesVsAssign,
  fromEntriesVsNewObject,
  fromEntriesVsJSONParse,
  fromEntriesFullRoundTrip,
  fromEntriesFilterAndRebuild,
  fromEntriesMapValuesAndRebuild,
  fromEntriesMapKeysAndRebuild,
  fromEntriesSortAndRebuild,
  fromEntriesFromKeysAndValues,
  fromEntriesModifiedValuesRebuild,
  fromEntriesMapToObject,
  fromEntriesObjectToMap,
  fromEntriesMapFilterAndConvert,
  fromEntriesSetToObject,
  fromEntriesSetDedupAndConvert,
  fromEntriesArrayFromEntries,
  fromEntriesArrayFromMapped,
  fromEntriesThenAssign,
  fromEntriesAssignThenFromEntries,
  fromEntriesThenDefineProp,
  fromEntriesNonEnumerableProp,
  fromEntriesFrozenEntries,
  fromEntriesSealedEntries,
  fromEntriesJSONRoundTrip,
  fromEntriesJSONParseThenRebuild,
  fromEntriesWithMap,
  fromEntriesWithFilter,
  fromEntriesWithReduce,
  fromEntriesWithForEach,
  fromEntriesWithSort,
  fromEntriesWithProto,
  fromEntriesWithNullProto,
  fromEntriesAllPropertyNames,
  fromEntriesOwnPropertyNames
} from './ObjectFromEntries';

export default function ObjectFromEntriesTest() {
  describe('ObjectFromEntriesTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {});
    afterEach(() => {});
    afterAll(() => {});
    /**
     * @tc.name   ObjectFromEntriesTest001
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0001
     * @tc.desc   Verify basic key-value pair array to object conversion
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesBasic();
      expect(r.name).assertEqual('张三');
      expect(r.age).assertEqual(25);
    });

    /**
     * @tc.name   ObjectFromEntriesTest002
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0002
     * @tc.desc   Verify Map to object conversion
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesMapToObj();
      expect(r.foo).assertEqual('bar');
      expect(r.baz).assertEqual(42);
    });

    /**
     * @tc.name   ObjectFromEntriesTest003
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0003
     * @tc.desc   Verify 2D array to object conversion
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesArrayToObj();
      expect(r.k0).assertEqual('a');
      expect(r.k1).assertEqual('b');
      expect(r.k2).assertEqual('c');
    });

    /**
     * @tc.name   ObjectFromEntriesTest004
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0004
     * @tc.desc   Verify reverse conversion from Object.entries
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesReverseOfEntries();
      expect(r.a).assertEqual(1);
      expect(r.b).assertEqual(2);
      expect(r.c).assertEqual(3);
    });

    /**
     * @tc.name   ObjectFromEntriesTest005
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0005
     * @tc.desc   Verify map entry values through entries chain
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesMapEntryValues();
      expect(r.a).assertEqual(2);
      expect(r.b).assertEqual(4);
      expect(r.c).assertEqual(6);
    });

    /**
     * @tc.name   ObjectFromEntriesTest006
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0006
     * @tc.desc   Verify empty array converts to empty object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesEmptyArray();
      expect(r.keys).assertEqual(0);
      expect(r.isEmpty).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest007
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0007
     * @tc.desc   Verify empty Map converts to empty object
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesEmptyMap();
      expect(r.keys).assertEqual(0);
      expect(r.isEmpty).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest008
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0008
     * @tc.desc   Verify standard 2D array as parameter
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesStandard2DArray();
      expect(r.key1).assertEqual('value1');
      expect(r.key2).assertEqual('value2');
    });

    /**
     * @tc.name   ObjectFromEntriesTest009
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0009
     * @tc.desc   Verify array with more than 2 elements uses first two
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesArrayWithExtraElements();
      expect(r.value).assertEqual('value');
      expect(r.keyCount).assertEqual(1);
    });

    /**
     * @tc.name   ObjectFromEntriesTest010
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0010
     * @tc.desc   Verify array with single element sets value to undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesArrayWithSingleElement();
      expect(r.value).assertEqual(undefined);
      expect(r.hasKey).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest011
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0011
     * @tc.desc   Verify plain Map object as parameter
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesPlainMap();
      expect(r.a).assertEqual(1);
      expect(r.b).assertEqual(2);
    });

    /**
     * @tc.name   ObjectFromEntriesTest012
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0012
     * @tc.desc   Verify Map with Symbol keys conversion
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesMapWithSymbolKeys();
      expect(r.normal).assertEqual(123);
      expect(r.symVal).assertEqual('value');
    });

    /**
     * @tc.name   ObjectFromEntriesTest013
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0013
     * @tc.desc   Verify Set as iterable conversion
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesSetAsIterable();
      expect(r.a).assertEqual(1);
      expect(r.b).assertEqual(2);
    });

    /**
     * @tc.name   ObjectFromEntriesTest014
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0014
     * @tc.desc   Verify custom iterable object with Symbol.iterator
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesCustomIterator();
      expect(r.x).assertEqual(10);
      expect(r.y).assertEqual(20);
    });

    /**
     * @tc.name   ObjectFromEntriesTest015
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0015
     * @tc.desc   Verify Generator function returned iterator
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesGeneratorIterator();
      expect(r.a).assertEqual(1);
      expect(r.b).assertEqual(2);
    });

    /**
     * @tc.name   ObjectFromEntriesTest016
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0016
     * @tc.desc   Verify TypedArray as entries source
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesTypedArrayAsEntries();
      expect(r.k0).assertEqual(72);
      expect(r.k1).assertEqual(101);
      expect(r.k4).assertEqual(111);
    });

    /**
     * @tc.name   ObjectFromEntriesTest017
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0017
     * @tc.desc   Verify plain string keys
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesStringKeys();
      expect(r.name).assertEqual('张三');
      expect(r.age).assertEqual('25');
    });

    /**
     * @tc.name   ObjectFromEntriesTest018
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0018
     * @tc.desc   Verify empty string as property key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesEmptyStringKey();
      expect(r.val).assertEqual('empty');
      expect(r.hasKey).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest019
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0019
     * @tc.desc   Verify special character keys (dash, dot, space, quote)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesSpecialCharKeys();
      expect(r.dash).assertEqual(1);
      expect(r.dot).assertEqual(2);
      expect(r.space).assertEqual(3);
    });

    /**
     * @tc.name   ObjectFromEntriesTest020
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0020
     * @tc.desc   Verify Chinese and Unicode character keys
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesUnicodeKeys();
      expect(r.name).assertEqual('张三');
      expect(r.emoji).assertEqual('celebration');
      expect(r.jp).assertEqual('Japanese');
    });

    /**
     * @tc.name   ObjectFromEntriesTest021
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0021
     * @tc.desc   Verify numeric string keys
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesNumericStringKeys();
      expect(r.strKey).assertEqual('zero');
      expect(r.numKey).assertEqual('zero');
    });

    /**
     * @tc.name   ObjectFromEntriesTest022
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0022
     * @tc.desc   Verify Symbol as property key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesSymbolKey();
      expect(r.val).assertEqual('symbol-value');
      expect(r.isSymbol).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest023
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0023
     * @tc.desc   Verify Symbol.for created global Symbol key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesSymbolForKey().val).assertEqual('global-symbol-value');
    });

    /**
     * @tc.name   ObjectFromEntriesTest024
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0024
     * @tc.desc   Verify Symbol and string keys mixed
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesMixedSymbolStringKeys();
      expect(r.stringVal).assertEqual('value1');
      expect(r.sym1Val).assertEqual('value2');
      expect(r.sym2Val).assertEqual('value3');
    });

    /**
     * @tc.name   ObjectFromEntriesTest025
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0025
     * @tc.desc   Verify integer keys auto-convert to string
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesIntegerKeys();
      expect(r.strAccess).assertEqual('zero');
      expect(r.numAccess).assertEqual('zero');
    });

    /**
     * @tc.name   ObjectFromEntriesTest026
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0026
     * @tc.desc   Verify float keys auto-convert to string
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesFloatKeys();
      expect(r.pi).assertEqual('pi');
      expect(r.half).assertEqual('half');
    });

    /**
     * @tc.name   ObjectFromEntriesTest027
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0027
     * @tc.desc   Verify NaN, Infinity as keys
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesSpecialNumericKeys();
      expect(r.nan).assertEqual('not-a-number');
      expect(r.inf).assertEqual('positive-infinity');
      expect(r.negInf).assertEqual('negative-infinity');
    });

    /**
     * @tc.name   ObjectFromEntriesTest028
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0028
     * @tc.desc   Verify boolean values as keys
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesBooleanKeys();
      expect(r.trueVal).assertEqual('yes');
      expect(r.falseVal).assertEqual('no');
    });

    /**
     * @tc.name   ObjectFromEntriesTest029
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0029
     * @tc.desc   Verify null as key converts to string "null"
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesNullKey().val).assertEqual('null-value');
    });

    /**
     * @tc.name   ObjectFromEntriesTest030
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0030
     * @tc.desc   Verify undefined as key converts to string "undefined"
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesUndefinedKey().val).assertEqual('undefined-value');
    });

    /**
     * @tc.name   ObjectFromEntriesTest031
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0031
     * @tc.desc   Verify object as key converts to string "[object Object]"
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesObjectKey().val).assertEqual('object-key-value');
    });

    

    /**
     * @tc.name   ObjectFromEntriesTest032
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0032
     * @tc.desc   Verify function as key converts to string
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesFunctionKey();
      expect(r.hasStringKey).assertEqual(true);
      expect(r.val).assertEqual('function-value');
    });

    /**
     * @tc.name   ObjectFromEntriesTest033
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0033
     * @tc.desc   Verify string values as property values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesStringValues();
      expect(r.normal).assertEqual('hello');
      expect(r.empty).assertEqual('');
      expect(r.emoji).assertEqual('🎉🎊🎁');
    });

    /**
     * @tc.name   ObjectFromEntriesTest034
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0034
     * @tc.desc   Verify number values as property values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesNumberValues();
      expect(r.integer).assertEqual(42);
      expect(r.zero).assertEqual(0);
      expect(r.isNan).assertEqual(true);
      expect(r.isMaxVal).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest035
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0035
     * @tc.desc   Verify boolean values as property values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesBooleanValues();
      expect(r.trueVal).assertEqual(true);
      expect(r.falseVal).assertEqual(false);
    });

    /**
     * @tc.name   ObjectFromEntriesTest036
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0036
     * @tc.desc   Verify null as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesNullValue();
      expect(r.val).assertEqual(null);
      expect(r.hasKey).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest037
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0037
     * @tc.desc   Verify undefined as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesUndefinedValue();
      expect(r.val).assertEqual(undefined);
      expect(r.hasKey).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest038
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0038
     * @tc.desc   Verify BigInt values as property values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesBigIntValues();
      expect(r.bigint).assertEqual(9007199254740991n);
      expect(r.type).assertEqual('bigint');
    });

    /**
     * @tc.name   ObjectFromEntriesTest039
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0039
     * @tc.desc   Verify large BigInt values beyond Number safe range
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesLargeBigIntValues();
      expect(r.maxBigint).assertEqual(18446744073709551615n);
      expect(r.negBigint).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.name   ObjectFromEntriesTest040
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0040
     * @tc.desc   Verify Symbol as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesSymbolValue();
      expect(r.equals).assertEqual(true);
      expect(r.type).assertEqual('symbol');
    });

    /**
     * @tc.name   ObjectFromEntriesTest041
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0041
     * @tc.desc   Verify plain object as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesObjectValue();
      expect(r.a).assertEqual(1);
      expect(r.b).assertEqual(2);
      expect(r.isEmpty).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest042
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0042
     * @tc.desc   Verify deeply nested object as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesNestedObjectValue().value).assertEqual('deep');
    });

    /**
     * @tc.name   ObjectFromEntriesTest043
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0043
     * @tc.desc   Verify object with Symbol keys as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesObjectWithSymbolKeyValue();
      expect(r.symProp).assertEqual('symbol-prop');
      expect(r.normalProp).assertEqual('normal-prop');
    });

    /**
     * @tc.name   ObjectFromEntriesTest044
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0044
     * @tc.desc   Verify object with function properties as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesObjectWithFunctionValue();
      expect(r.methodResult).assertEqual('hello');
      expect(r.propVal).assertEqual(123);
    });

    /**
     * @tc.name   ObjectFromEntriesTest045
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0045
     * @tc.desc   Verify frozen object as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesFrozenObjectValue().isFrozen).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest046
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0046
     * @tc.desc   Verify sealed object as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesSealedObjectValue().isSealed).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest047
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0047
     * @tc.desc   Verify non-extensible object as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesNonExtensibleObjectValue().isExtensible).assertEqual(false);
    });

    /**
     * @tc.name   ObjectFromEntriesTest048
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0048
     * @tc.desc   Verify arrays as property values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesArrayValue();
      expect(r.len).assertEqual(5);
      expect(r.first).assertEqual(1);
      expect(r.emptyLen).assertEqual(0);
      expect(r.mixedLen).assertEqual(4);
    });

    /**
     * @tc.name   ObjectFromEntriesTest049
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0049
     * @tc.desc   Verify array with special values as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesArrayWithSpecialValues();
      expect(r.hasNull).assertEqual(true);
      expect(r.hasUndef).assertEqual(true);
      expect(r.hasNaN).assertEqual(true);
      expect(r.hasInf).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest050
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0050
     * @tc.desc   Verify various TypedArrays as property values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesTypedArrayValues();
      expect(r.int8_0).assertEqual(-128);
      expect(r.uint8_2).assertEqual(255);
      expect(r.int16_0).assertEqual(-32768);
      expect(r.float32_0).assertEqual(3.14);
    });

    /**
     * @tc.name   ObjectFromEntriesTest051
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0051
     * @tc.desc   Verify Map as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesMapAsValue();
      expect(r.getK1).assertEqual('v1');
      expect(r.hasK2).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest052
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0052
     * @tc.desc   Verify Set as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesSetAsValue();
      expect(r.has1).assertEqual(true);
      expect(r.size).assertEqual(3);
    });

    /**
     * @tc.name   ObjectFromEntriesTest053
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0053
     * @tc.desc   Verify Date as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesDateAsValue().isDate).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest054
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0054
     * @tc.desc   Verify RegExp as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesRegExpAsValue();
      expect(r.testResult).assertEqual(true);
      expect(r.hasIgnoreCase).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest055
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0055
     * @tc.desc   Verify ArrayBuffer as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesArrayBufferAsValue().byteLen).assertEqual(16);
    });

    /**
     * @tc.name   ObjectFromEntriesTest056
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0056
     * @tc.desc   Verify DataView as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesDataViewAsValue().byteLen).assertEqual(16);
    });

    /**
     * @tc.name   ObjectFromEntriesTest057
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0057
     * @tc.desc   Verify Promise as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesPromiseAsValue().isPromise).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest058
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0058
     * @tc.desc   Verify function as property value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesFunctionAsValue();
      expect(r.funcResult).assertEqual('hello');
      expect(r.arrowResult).assertEqual('world');
    });

    /**
     * @tc.name   ObjectFromEntriesTest059
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0059
     * @tc.desc   Verify Array.entries() iterator conversion
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesArrayEntries();
      expect(r.k0).assertEqual('a');
      expect(r.k1).assertEqual('b');
      expect(r.k2).assertEqual('c');
    });

    /**
     * @tc.name   ObjectFromEntriesTest060
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0060
     * @tc.desc   Verify Array.keys() iterator produces error
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesArrayKeysError().hasError).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest061
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0061
     * @tc.desc   Verify Map.entries() method iterator
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesMapEntries();
      expect(r.a).assertEqual(1);
      expect(r.b).assertEqual(2);
    });

    /**
     * @tc.name   ObjectFromEntriesTest062
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0062
     * @tc.desc   Verify direct Map object pass-through
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesMapDirect();
      expect(r.x).assertEqual(10);
      expect(r.y).assertEqual(20);
    });

    /**
     * @tc.name   ObjectFromEntriesTest063
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0063
     * @tc.desc   Verify Set.entries() method (key-value same)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesSetEntries();
      expect(r.a).assertEqual('a');
      expect(r.b).assertEqual('b');
      expect(r.c).assertEqual('c');
    });

    /**
     * @tc.name   ObjectFromEntriesTest064
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0064
     * @tc.desc   Verify direct Set object conversion
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesSetDirect();
      expect(r.key1).assertEqual('value1');
      expect(r.key2).assertEqual('value2');
    });

    /**
     * @tc.name   ObjectFromEntriesTest065
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0065
     * @tc.desc   Verify custom Symbol.iterator implementation
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesCustomSymbolIterator();
      expect(r.one).assertEqual(1);
      expect(r.two).assertEqual(2);
      expect(r.three).assertEqual(3);
    });

    /**
     * @tc.name   ObjectFromEntriesTest066
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0066
     * @tc.desc   Verify class-based iterator implementation
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesClassIterator();
      expect(r.a).assertEqual(1);
      expect(r.b).assertEqual(2);
    });

    /**
     * @tc.name   ObjectFromEntriesTest067
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0067
     * @tc.desc   Verify iterator with return method for early termination
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesIteratorWithReturn();
      expect(r.key0).assertEqual(0);
      expect(r.key1).assertEqual(1);
      expect(r.key2).assertEqual(2);
    });

    /**
     * @tc.name   ObjectFromEntriesTest068
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0068
     * @tc.desc   Verify plain Generator function iterator
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesGenerator();
      expect(r.first).assertEqual(1);
      expect(r.second).assertEqual(2);
      expect(r.third).assertEqual(3);
    });

    /**
     * @tc.name   ObjectFromEntriesTest069
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0069
     * @tc.desc   Verify Generator function with parameters
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesGeneratorWithParams();
      expect(r.item0).assertEqual('value0');
      expect(r.item4).assertEqual('value4');
      expect(r.keyCount).assertEqual(5);
    });

    /**
     * @tc.name   ObjectFromEntriesTest070
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0070
     * @tc.desc   Verify async Generator not applicable
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesAsyncGeneratorError().hasError).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest071
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0071
     * @tc.desc   Verify string as iterable object behavior
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fromEntriesStringAsIterable().hasError).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest072
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0072
     * @tc.desc   Verify arguments object iteration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesArgsObject();
      expect(r.k0).assertEqual('a');
      expect(r.k1).assertEqual('b');
      expect(r.k2).assertEqual('c');
    });

    /**
     * @tc.name   ObjectFromEntriesTest073
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0073
     * @tc.desc   Verify TypedArray.entries() method
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesTypedArrayEntriesMethod();
      expect(r.k0).assertEqual(72);
      expect(r.k1).assertEqual(101);
      expect(r.k4).assertEqual(111);
    });

    /**
     * @tc.name   ObjectFromEntriesTest074
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0074
     * @tc.desc   Verify String.matchAll() iterator conversion
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesMatchAllIterator();
      expect(r.k0).assertEqual('test1');
      expect(r.k1).assertEqual('test2');
      expect(r.k2).assertEqual('test3');
    });

    /**
     * @tc.name   ObjectFromEntriesTest075
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0075
     * @tc.desc   Verify empty iterable array input
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesEmptyIterableArray();
      expect(r.keyCount).assertEqual(0);
      expect(r.isEmpty).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest076
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0076
     * @tc.desc   Verify empty Map input
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesEmptyMapBoundary();
      expect(r.keyCount).assertEqual(0);
      expect(r.isEmpty).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest077
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0077
     * @tc.desc   Verify empty Set input
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesEmptySet();
      expect(r.keyCount).assertEqual(0);
      expect(r.isEmpty).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest078
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0078
     * @tc.desc   Verify empty string as both key and value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesEmptyStringKeyValue();
      expect(r.val).assertEqual('');
      expect(r.hasKey).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFromEntriesTest079
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0079
     * @tc.desc   Verify large number of key-value pairs
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesLargeNumberOfEntries();
      expect(r.key0).assertEqual(0);
      expect(r.key9999).assertEqual(9999);
      expect(r.keyCount).assertEqual(10000);
    });

    /**
     * @tc.name   ObjectFromEntriesTest080
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0080
     * @tc.desc   Verify single key-value pair conversion
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ObjectFromEntriesTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = fromEntriesSingleEntry();
      expect(r.val).assertEqual('one');
      expect(r.keyCount).assertEqual(1);
    });

    /**
     * @tc.name   ObjectFromEntriesTest081
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTFROMENTRIES_TEST_0081
     * @tc.desc   Verify JavaScript reserved words as property keys
     * @tc.size   MediumTest
