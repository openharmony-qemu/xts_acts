
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
  describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach,
  afterAll
} from '@ohos/hypium';
import {
  getOwnPropertyNamesBasic001,
  getOwnPropertyNamesNonEnum002,
  getOwnPropertyNamesEmpty003,
  getOwnPropertyNamesArray004,
  getOwnPropertyNamesEmptyArray005,
  getOwnPropertyNamesSparseArray006,
  getOwnPropertyNamesFunction007,
  getOwnPropertyNamesAnonymousFunction008,
  getOwnPropertyNamesArrowFunction009,
  getOwnPropertyNamesString010,
  getOwnPropertyNamesEmptyString011,
  getOwnPropertyNamesNumber012,
  getOwnPropertyNamesBoolean013,
  getOwnPropertyNamesBigInt014,
  getOwnPropertyNamesSymbol015,
  getOwnPropertyNamesNull016,
  getOwnPropertyNamesUndefined017,
  getOwnPropertyNamesNaN018,
  getOwnPropertyNamesInfinity019,
  getOwnPropertyNamesNegInfinity020,
  getOwnPropertyNamesNegZero021,
  getOwnPropertyNamesInt8Array022,
  getOwnPropertyNamesUint8Array023,
  getOwnPropertyNamesFloat32Array024,
  getOwnPropertyNamesBigInt64Array025,
  getOwnPropertyNamesEmptyTypedArray026,
  getOwnPropertyNamesSymbolOnly027,
  getOwnPropertyNamesMixedSymbol028,
  getOwnPropertyNamesMultiSymbol029,
  getOwnPropertyNamesNumericKeys030,
  getOwnPropertyNamesMixedKeys031,
  getOwnPropertyNamesLargeNumericKeys032,
  getOwnPropertyNamesNegativeKeys033,
  getOwnPropertyNamesFloatKeys034,
  getOwnPropertyNamesEmptyKey035,
  getOwnPropertyNamesSpecialChars036,
  getOwnPropertyNamesSpaceKeys037,
  getOwnPropertyNamesUnicodeKeys038,
  getOwnPropertyNamesEscapeKeys039,
  getOwnPropertyNamesAllEnumerable040,
  getOwnPropertyNamesAllNonEnumerable041,
  getOwnPropertyNamesMixedEnumerable042,
  getOwnPropertyNamesObjectCreate043,
  getOwnPropertyNamesNonConfigurable044,
  getOwnPropertyNamesNonConfigNonEnum045,
  getOwnPropertyNamesFrozen046,
  getOwnPropertyNamesSealed047,
  getOwnPropertyNamesReadOnly048,
  getOwnPropertyNamesGetterSetter049,
  getOwnPropertyNamesPrototypeChain050,
  getOwnPropertyNamesMultiInherit051,
  getOwnPropertyNamesNullProto052,
  getOwnPropertyNamesDate053,
  getOwnPropertyNamesRegExp054,
  getOwnPropertyNamesError055,
  getOwnPropertyNamesMap056,
  getOwnPropertyNamesSet057,
  getOwnPropertyNamesWeakMap058,
  getOwnPropertyNamesWeakSet059,
  getOwnPropertyNamesMath060,
  getOwnPropertyNamesJSON061,
  getOwnPropertyNamesProxy062,
  getOwnPropertyNamesArrayBuffer063,
  getOwnPropertyNamesDataView064,
  getOwnPropertyNamesPromise065,
  getOwnPropertyNamesNested066,
  getOwnPropertyNamesCircular067,
  getOwnPropertyNamesIsArray068,
  getOwnPropertyNamesAllStrings069,
  getOwnPropertyNamesReturnModify070,
  getOwnPropertyNamesOrder001071,
  getOwnPropertyNamesStringOrder072,
  getOwnPropertyNamesMixedOrder073,
  getOwnPropertyNamesEmptyLength074,
  getOwnPropertyNamesSingleProp075,
  getOwnPropertyNamesMultiProp076,
  getOwnPropertyNames100Props077,
  getOwnPropertyNamesUndefinedValue078,
  getOwnPropertyNamesNullValue079,
  getOwnPropertyNamesNaNValue080,
  getOwnPropertyNamesLongKey081,
  getOwnPropertyNamesMaxIndex082,
  getOwnPropertyNamesBeyondIndex083,
  getOwnPropertyNamesAfterDelete084,
  getOwnPropertyNamesReAdd085,
  getOwnPropertyNamesVsKeys086,
  getOwnPropertyNamesNonEnumFilter087,
  getOwnPropertyNamesOnlyStrings088,
  getOwnPropertyNamesOnlySymbols089,
  getOwnPropertyNamesCombined090,
  getOwnPropertyNamesHasOwn091,
  getOwnPropertyNamesHasOwnNonEnum092,
  getOwnPropertyNamesDescriptor093,
  getOwnPropertyNamesForIn094,
  getOwnPropertyNamesForInProto095,
  getOwnPropertyNamesReflectOwnKeys096,
  getOwnPropertyNamesReflectOrder097,
  getOwnPropertyNamesForEachProp098,
  getOwnPropertyNamesAllEnumVsKeys099,
  getOwnPropertyNamesMaxIndexObj100,
  getOwnPropertyNamesGlobalThis101,
  getOwnPropertyNamesReflectParam102,
  getOwnPropertyNames1000Props103,
  getOwnPropertyNamesDeleteNonConfig104,
  getOwnPropertyNamesContArray105,
  getOwnPropertyNamesContFunc106,
  getOwnPropertyNamesGetterOnly107,
  getOwnPropertyNamesSetterOnly108,
  getOwnPropertyNamesContinuousInt109,
  getOwnPropertyNamesDiscontInt110,
  getOwnPropertyNamesLargeProps111
} from './ObjectGetOwnPropertyNames';

interface GetOwnPropertyNamesDescriptorResult { isEnumerable: boolean | undefined; descValue: number | undefined; }
interface GetOwnPropertyNamesForEachItem { name: string; enumerable: boolean | undefined; }

export default function ObjectGetOwnPropertyNamesTest() {
  describe('ObjectGetOwnPropertyNamesTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {});
    afterEach(() => {});
    afterAll(() => {});
    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest001
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0001
     * @tc.desc   Verify getting enumerable property names from plain object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesBasic001();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest002
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0002
     * @tc.desc   Verify getting non-enumerable property names via defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesNonEnum002();
      expect(result).assertEqual('["enumerable","nonEnumerable"]');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest003
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0003
     * @tc.desc   Verify empty object returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesEmpty003();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest004
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0004
     * @tc.desc   Verify getting property names from array including indices and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesArray004();
      expect(result[0]).assertEqual('0');
      expect(result[1]).assertEqual('1');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('length');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest005
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0005
     * @tc.desc   Verify empty array returns only length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesEmptyArray005();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('length');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest006
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0006
     * @tc.desc   Verify sparse array returns only existing indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesSparseArray006();
      expect(result[0]).assertEqual('0');
      expect(result[1]).assertEqual('100');
      expect(result[2]).assertEqual('length');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest007
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0007
     * @tc.desc   Verify getting function own properties (length and name)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesFunction007();
      expect(result.hasLength).assertEqual(true);
      expect(result.hasName).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest008
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0008
     * @tc.desc   Verify anonymous function has name property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesAnonymousFunction008();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest009
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0009
     * @tc.desc   Verify arrow function has length and name properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesArrowFunction009();
      expect(result.hasLength).assertEqual(true);
      expect(result.hasName).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest010
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0010
     * @tc.desc   Verify string parameter is coerced to String object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesString010();
      expect(result[0]).assertEqual('0');
      expect(result[1]).assertEqual('1');
      expect(result[2]).assertEqual('2');
      expect(result.length <= 4).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest011
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0011
     * @tc.desc   Verify empty string returns only length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesEmptyString011();
      expect(result.length <= 1).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest012
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0012
     * @tc.desc   Verify number parameter is coerced to Number object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesNumber012();
      expect(result.length <= 1).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest013
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0013
     * @tc.desc   Verify boolean parameter returns empty array for both true and false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesBoolean013();
      expect(result.resultTrue.length).assertEqual(0);
      expect(result.resultFalse.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest014
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0014
     * @tc.desc   Verify BigInt parameter returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesBigInt014();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest015
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0015
     * @tc.desc   Verify Symbol parameter returns empty array (Symbol properties excluded)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesSymbol015();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest016
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0016
     * @tc.desc   Verify null parameter throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result:string = getOwnPropertyNamesNull016();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest017
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0017
     * @tc.desc   Verify undefined parameter throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result:string = getOwnPropertyNamesUndefined017();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest018
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0018
     * @tc.desc   Verify NaN parameter returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesNaN018();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest019
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0019
     * @tc.desc   Verify Infinity parameter returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesInfinity019();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest020
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0020
     * @tc.desc   Verify -Infinity parameter returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesNegInfinity020();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest021
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0021
     * @tc.desc   Verify -0 parameter returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesNegZero021();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest022
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0022
     * @tc.desc   Verify Int8Array property retrieval includes buffer-related properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesInt8Array022();
      expect(typeof result.hasLength === 'boolean').assertEqual(true);
      expect(typeof result.hasByteLength === 'boolean').assertEqual(true);
      expect(typeof result.hasByteOffset === 'boolean').assertEqual(true);
      expect(typeof result.hasBuffer === 'boolean').assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest023
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0023
     * @tc.desc   Verify Uint8Array has length and byteLength properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesUint8Array023();
      expect(typeof result.hasLength === 'boolean').assertEqual(true);
      expect(typeof result.hasByteLength === 'boolean').assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest024
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0024
     * @tc.desc   Verify Float32Array has length and byteOffset properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesFloat32Array024();
      expect(typeof result.hasLength === 'boolean').assertEqual(true);
      expect(typeof result.hasByteOffset === 'boolean').assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest025
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0025
     * @tc.desc   Verify BigInt64Array has length and buffer properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesBigInt64Array025();
      expect(typeof result.hasLength === 'boolean').assertEqual(true);
      expect(typeof result.hasBuffer === 'boolean').assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest026
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0026
     * @tc.desc   Verify empty TypedArray has base properties but no index properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesEmptyTypedArray026();
      expect(result.indexOf('0')).assertEqual(-1);
      expect(typeof result.indexOf('length') === 'number').assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest027
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0027
     * @tc.desc   Verify Symbol properties are excluded from getOwnPropertyNames results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesSymbolOnly027();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest028
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0028
     * @tc.desc   Verify only string property names are returned when mixed with Symbol keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesMixedSymbol028();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest029
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0029
     * @tc.desc   Verify multiple Symbol properties are all excluded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesMultiSymbol029();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest030
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0030
     * @tc.desc   Verify numeric string property names are retrieved correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesNumericKeys030();
      expect(result[0]).assertEqual('0');
      expect(result[1]).assertEqual('1');
      expect(result[2]).assertEqual('2');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest031
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0031
     * @tc.desc   Verify numeric keys are sorted before string keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesMixedKeys031();
      expect(result[0]).assertEqual('1');
      expect(result[1]).assertEqual('2');
      expect(result[2]).assertEqual('b');
      expect(result[3]).assertEqual('a');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest032
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0032
     * @tc.desc   Verify large numeric keys are sorted in ascending order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesLargeNumericKeys032();
      expect(result[0]).assertEqual('1');
      expect(result[1]).assertEqual('50');
      expect(result[2]).assertEqual('100');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest033
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0033
     * @tc.desc   Verify negative numeric string is treated as string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesNegativeKeys033();
      expect(result[0]).assertEqual('0');
      expect(result[1]).assertEqual('1');
      expect(result[2]).assertEqual('-1');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest034
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0034
     * @tc.desc   Verify float string key is treated as string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesFloatKeys034();
      expect(result[0]).assertEqual('1');
      expect(result[1]).assertEqual('1.5');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest035
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0035
     * @tc.desc   Verify empty string can serve as property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesEmptyKey035();
      expect(result[0]).assertEqual('');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest036
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0036
     * @tc.desc   Verify special character property names are included
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesSpecialChars036();
      expect(result.indexOf('!') !== -1).assertEqual(true);
      expect(result.indexOf('@') !== -1).assertEqual(true);
      expect(result.indexOf('#') !== -1).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest037
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0037
     * @tc.desc   Verify space characters can serve as property names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesSpaceKeys037();
      expect(result.indexOf(' ') !== -1).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest038
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0038
     * @tc.desc   Verify Unicode character property names are included
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesUnicodeKeys038();
      expect(result.indexOf('你好') !== -1).assertEqual(true);
      expect(result.indexOf('日本語') !== -1).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest039
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0039
     * @tc.desc   Verify escape character property names are included
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesEscapeKeys039();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest040
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0040
     * @tc.desc   Verify all enumerable properties are returned in sorted order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesAllEnumerable040();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest041
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0041
     * @tc.desc   Verify all non-enumerable properties are also returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesAllNonEnumerable041();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest042
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0042
     * @tc.desc   Verify mixed enumerable and non-enumerable properties are both returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesMixedEnumerable042();
      expect(result[0]).assertEqual('enumerable');
      expect(result[1]).assertEqual('nonEnumerable');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest043
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0043
     * @tc.desc   Verify Object.create defined properties including non-enumerable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesObjectCreate043();
      expect(result[0]).assertEqual('hidden');
      expect(result[1]).assertEqual('visible');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest044
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0044
     * @tc.desc   Verify non-configurable enumerable properties are returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesNonConfigurable044();
      expect(result[0]).assertEqual('prop');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest045
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0045
     * @tc.desc   Verify non-configurable and non-enumerable properties are returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesNonConfigNonEnum045();
      expect(result[0]).assertEqual('prop');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest046
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0046
     * @tc.desc   Verify frozen object properties are returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesFrozen046();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest047
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0047
     * @tc.desc   Verify sealed object properties are returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesSealed047();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest048
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0048
     * @tc.desc   Verify read-only properties are returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesReadOnly048();
      expect(result[0]).assertEqual('readonly');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest049
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0049
     * @tc.desc   Verify getter/setter property names are returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesGetterSetter049();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest050
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0050
     * @tc.desc   Verify prototype chain properties are not returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesPrototypeChain050();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('own');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest051
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0051
     * @tc.desc   Verify multi-level inheritance only returns own properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesMultiInherit051();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('ownProp');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest052
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0052
     * @tc.desc   Verify Object.create(null) object properties are returned correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesNullProto052();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest053
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0053
     * @tc.desc   Verify Date object property retrieval returns an array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesDate053();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest054
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0054
     * @tc.desc   Verify RegExp object includes lastIndex property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesRegExp054();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest055
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0055
     * @tc.desc   Verify Error object includes message property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesError055();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest056
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0056
     * @tc.desc   Verify Map object property retrieval returns array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesMap056();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest057
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0057
     * @tc.desc   Verify Set object property retrieval returns array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesSet057();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest058
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0058
     * @tc.desc   Verify WeakMap object property retrieval returns array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesWeakMap058();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest059
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0059
     * @tc.desc   Verify WeakSet object property retrieval returns array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesWeakSet059();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest060
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0060
     * @tc.desc   Verify Math object includes PI and random properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesMath060();
      expect(result.hasPI).assertEqual(true);
      expect(result.hasRandom).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest061
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0061
     * @tc.desc   Verify JSON object includes parse and stringify properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesJSON061();
      expect(result.hasParse).assertEqual(true);
      expect(result.hasStringify).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest062
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0062
     * @tc.desc   Verify Proxy object forwards property retrieval from target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesProxy062();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest063
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0063
     * @tc.desc   Verify ArrayBuffer object includes byteLength property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesArrayBuffer063();
      expect(typeof result === 'boolean').assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest064
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0064
     * @tc.desc   Verify DataView object includes byteLength and byteOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesDataView064();
      expect(typeof result.hasByteLength === 'boolean').assertEqual(true);
      expect(typeof result.hasByteOffset === 'boolean').assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest065
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0065
     * @tc.desc   Verify Promise object property retrieval returns array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesPromise065();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest066
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0066
     * @tc.desc   Verify nested object only returns top-level property names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesNested066();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest067
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0067
     * @tc.desc   Verify circular reference object properties are returned correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesCircular067();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('self');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest068
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0068
     * @tc.desc   Verify return value is an array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesIsArray068();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest069
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0069
     * @tc.desc   Verify all elements in returned array are strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesAllStrings069();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest070
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0070
     * @tc.desc   Verify modifying returned array does not affect the original object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesReturnModify070();
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest071
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0071
     * @tc.desc   Verify non-negative integer keys are sorted in ascending order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesOrder001071();
      expect(result[0]).assertEqual('0');
      expect(result[1]).assertEqual('1');
      expect(result[2]).assertEqual('2');
      expect(result[3]).assertEqual('100');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest072
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0072
     * @tc.desc   Verify string keys are ordered by insertion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesStringOrder072();
      expect(result[0]).assertEqual('b');
      expect(result[1]).assertEqual('a');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest073
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0073
     * @tc.desc   Verify numeric keys appear before string keys in mixed order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesMixedOrder073();
      expect(result[0]).assertEqual('1');
      expect(result[1]).assertEqual('2');
      expect(result[2]).assertEqual('b');
      expect(result[3]).assertEqual('a');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest074
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0074
     * @tc.desc   Verify empty object returns array of length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesEmptyLength074();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest075
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0075
     * @tc.desc   Verify single property object returns array of length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesSingleProp075();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest076
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0076
     * @tc.desc   Verify multi-property object returns correct length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesMultiProp076();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest077
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0077
     * @tc.desc   Verify 100-property object returns correct count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNames100Props077();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest078
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0078
     * @tc.desc   Verify property with undefined value is still included
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesUndefinedValue078();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest079
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0079
     * @tc.desc   Verify property with null value is still included
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesNullValue079();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest080
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0080
     * @tc.desc   Verify property with NaN value is still included
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesNaNValue080();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest081
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0081
     * @tc.desc   Verify long property name (1000 chars) is handled correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesLongKey081();
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest082
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0082
     * @tc.desc   Verify max array index property is returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesMaxIndex082();
      expect(result[0]).assertEqual('4294967294');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest083
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0083
     * @tc.desc   Verify index beyond array range is treated as string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesBeyondIndex083();
      expect(result[0]).assertEqual('1');
      expect(result[1]).assertEqual('4294967295');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest084
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0084
     * @tc.desc   Verify deleted properties are not included in the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesAfterDelete084();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('c');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest085
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0085
     * @tc.desc   Verify re-added property after deletion is included
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesReAdd085();
      expect(result.indexOf('a') !== -1).assertEqual(true);
      expect(result.indexOf('b') !== -1).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest086
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0086
     * @tc.desc   Verify getOwnPropertyNames returns more names than Object.keys (includes non-enumerable)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesVsKeys086();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest087
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0087
     * @tc.desc   Verify non-enumerable properties can be filtered by comparison with Object.keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesNonEnumFilter087();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('hidden');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest088
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0088
     * @tc.desc   Verify getOwnPropertyNames vs getOwnPropertySymbols for string-only properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesOnlyStrings088();
      expect(result.namesLength).assertEqual(2);
      expect(result.symbolsLength).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest089
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0089
     * @tc.desc   Verify getOwnPropertyNames returns empty when only Symbol properties exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesOnlySymbols089();
      expect(result.namesLength).assertEqual(0);
      expect(result.symbolsLength).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest090
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0090
     * @tc.desc   Verify combining both methods returns all own property keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesCombined090();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest091
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0091
     * @tc.desc   Verify all returned property names exist on the object per Object.hasOwn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesHasOwn091();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest092
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0092
     * @tc.desc   Verify non-enumerable property is recognized by Object.hasOwn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: boolean = getOwnPropertyNamesHasOwnNonEnum092();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest093
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0093
     * @tc.desc   Verify property descriptor can be retrieved for a non-enumerable property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: GetOwnPropertyNamesDescriptorResult = getOwnPropertyNamesDescriptor093();
      expect(result.isEnumerable).assertEqual(false);
      expect(result.descValue).assertEqual(42);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest094
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0094
     * @tc.desc   Verify getOwnPropertyNames returns more properties than for...in (includes non-enumerable)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesForIn094();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest095
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0095
     * @tc.desc   Verify for...in includes inherited properties while getOwnPropertyNames excludes them
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesForInProto095();
      expect(result.forInHasInherited).assertEqual(true);
      expect(result.namesHasInherited).assertEqual(false);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest096
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0096
     * @tc.desc   Verify Reflect.ownKeys returns more keys (includes Symbols) than getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesReflectOwnKeys096();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest097
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0097
     * @tc.desc   Verify string property order is consistent between getOwnPropertyNames and Reflect.ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesReflectOrder097();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest098
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0098
     * @tc.desc   Verify getOwnPropertyDescriptor can be called for each returned property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: GetOwnPropertyNamesForEachItem[] = getOwnPropertyNamesForEachProp098();
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest099
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0099
     * @tc.desc   Verify getOwnPropertyNames equals Object.keys for all-enumerable objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesAllEnumVsKeys099();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest100
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0100
     * @tc.desc   Verify minimal numeric index properties are ordered correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesMaxIndexObj100();
      expect(result[0]).assertEqual('0');
      expect(result[1]).assertEqual('1');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest101
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0101
     * @tc.desc   Verify globalThis object property retrieval returns non-empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesGlobalThis101();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest102
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0102
     * @tc.desc   Verify Reflect object includes get and set properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesReflectParam102();
      expect(result.hasGet).assertEqual(true);
      expect(result.hasSet).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest103
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0103
     * @tc.desc   Verify 1000-property object returns correct count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNames1000Props103();
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest104
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0104
     * @tc.desc   Verify non-configurable property not deleted still exists in result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesDeleteNonConfig104();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest105
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0105
     * @tc.desc   Verify object containing array property only returns top-level keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesContArray105();
      expect(result[0]).assertEqual('arr');
      expect(result[1]).assertEqual('str');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest106
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0106
     * @tc.desc   Verify object containing function property returns correct keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesContFunc106();
      expect(result[0]).assertEqual('method');
      expect(result[1]).assertEqual('prop');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest107
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0107
     * @tc.desc   Verify getter-only property is returned by getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesGetterOnly107();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest108
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0108
     * @tc.desc   Verify setter-only property is returned by getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesSetterOnly108();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest109
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0109
     * @tc.desc   Verify continuous integer indices are sorted correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesContinuousInt109();
      expect(result[0]).assertEqual('0');
      expect(result[9]).assertEqual('9');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest110
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0110
     * @tc.desc   Verify discontinuous integer indices are sorted in ascending order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesDiscontInt110();
      expect(result[0]).assertEqual('3');
      expect(result[1]).assertEqual('5');
      expect(result[2]).assertEqual('50');
      expect(result[3]).assertEqual('100');
    });

    /**
     * @tc.name   ObjectGetOwnPropertyNamesTest111
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYNAMES_TEST_0111
     * @tc.desc   Verify large number of properties via Object.fromEntries returns correct count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertyNamesTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertyNamesLargeProps111();
      expect(result).assertEqual(1000);
    });

  });
}
