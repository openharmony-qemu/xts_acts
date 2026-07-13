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
  describe, it, expect, TestType, Size, Level, beforeAll, afterEach, beforeEach,
  afterAll
} from '@ohos/hypium';
import {
  getOwnPropertySymbolsSingle001,
  getOwnPropertySymbolsSymbolFor002,
  getOwnPropertySymbolsMultiple003,
  getOwnPropertySymbolsMany004,
  getOwnPropertySymbolsMixedStrings005,
  getOwnPropertySymbolsMixedNumbers006,
  getOwnPropertySymbolsPlainObject007,
  getOwnPropertySymbolsNull008,
  getOwnPropertySymbolsUndefined009,
  getOwnPropertySymbolsNumber010,
  getOwnPropertySymbolsNaN011,
  getOwnPropertySymbolsInfinity012,
  getOwnPropertySymbolsString013,
  getOwnPropertySymbolsEmptyString014,
  getOwnPropertySymbolsTrue015,
  getOwnPropertySymbolsFalse016,
  getOwnPropertySymbolsArray017,
  getOwnPropertySymbolsFunction018,
  getOwnPropertySymbolsDate019,
  getOwnPropertySymbolsRegExp020,
  getOwnPropertySymbolsInt8Array021,
  getOwnPropertySymbolsFloat32Array022,
  getOwnPropertySymbolsNoDesc023,
  getOwnPropertySymbolsWithDesc024,
  getOwnPropertySymbolsSameDesc025,
  getOwnPropertySymbolsGlobal026,
  getOwnPropertySymbolsGlobalSame027,
  getOwnPropertySymbolsGlobalAndNormal028,
  getOwnPropertySymbolsIterator029,
  getOwnPropertySymbolsToStringTag030,
  getOwnPropertySymbolsToPrimitive031,
  getOwnPropertySymbolsMultiWellKnown032,
  getOwnPropertySymbolsEnumerable033,
  getOwnPropertySymbolsNonEnumerable034,
  getOwnPropertySymbolsMixedEnum035,
  getOwnPropertySymbolsConfigurable036,
  getOwnPropertySymbolsNonConfigurable037,
  getOwnPropertySymbolsDeleteNonConfig038,
  getOwnPropertySymbolsWritable039,
  getOwnPropertySymbolsNonWritable040,
  getOwnPropertySymbolsGetter041,
  getOwnPropertySymbolsSetter042,
  getOwnPropertySymbolsGetterSetter043,
  getOwnPropertySymbolsFrozen044,
  getOwnPropertySymbolsFreezeAddNew045,
  getOwnPropertySymbolsFrozenMulti046,
  getOwnPropertySymbolsSealed047,
  getOwnPropertySymbolsSealAddNew048,
  getOwnPropertySymbolsSealDelete049,
  getOwnPropertySymbolsSealModify050,
  getOwnPropertySymbolsNonExtensible051,
  getOwnPropertySymbolsNonExtAddNew052,
  getOwnPropertySymbolsNonExtDelete053,
  getOwnPropertySymbolsEmptyObj054,
  getOwnPropertySymbolsNullProto055,
  getOwnPropertySymbolsNoSymbols056,
  getOwnPropertySymbols100057,
  getOwnPropertySymbolsUndefinedVal058,
  getOwnPropertySymbolsNullVal059,
  getOwnPropertySymbolsNaNVal060,
  getOwnPropertySymbolsProtoChain061,
  getOwnPropertySymbolsMultiInherit062,
  getOwnPropertySymbolsNullProto063,
  getOwnPropertySymbolsCreateWithProto064,
  getOwnPropertySymbolsCreateWithProps065,
  getOwnPropertySymbolsSetProto066,
  getOwnPropertySymbolsIsArray067,
  getOwnPropertySymbolsEmptyArray068,
  getOwnPropertySymbolsAllSymbols069,
  getOwnPropertySymbolsNewArray070,
  getOwnPropertySymbolsModifyArray071,
  getOwnPropertySymbolsOrder072,
  getOwnPropertySymbolsMap073,
  getOwnPropertySymbolsKeyFor074,
  getOwnPropertySymbolsDynamic075,
  getOwnPropertySymbolsWithNames076,
  getOwnPropertySymbolsNotInNames077,
  getOwnPropertySymbolsReflect078,
  getOwnPropertySymbolsReflectCompare079,
  getOwnPropertySymbolsDescriptor080,
  getOwnPropertySymbolsKeys081,
  getOwnPropertySymbolsValues082,
  getOwnPropertySymbolsAssign083,
  getOwnPropertySymbolsForIn084,
  getOwnPropertySymbolsJSON085,
  getOwnPropertySymbolsFromEntries086,
  getOwnPropertySymbolsNullErr087,
  getOwnPropertySymbolsUndefinedErr088,
  getOwnPropertySymbolsNoArg089,
  getOwnPropertySymbolsNumberAuto090,
  getOwnPropertySymbolsStringAuto091,
  getOwnPropertySymbolsBoolAuto092,
  getOwnPropertySymbolsBigInt093,
  getOwnPropertySymbolsSymbolParam094,
  getOwnPropertySymbolsMultiError095,
  getOwnPropertySymbolsProxy096,
  getOwnPropertySymbolsRevocableProxy097,
  getOwnPropertySymbolsClassStatic098,
  getOwnPropertySymbolsIndex099,
  getOwnPropertySymbolsLongDesc100,
  getOwnPropertySymbolsHasInstance101,
  getOwnPropertySymbolsIsConcatSpreadable102,
  getOwnPropertySymbolsMatch103,
  getOwnPropertySymbolsReplace104,
  getOwnPropertySymbolsSearch105,
  getOwnPropertySymbolsSplit106,
  getOwnPropertySymbolsUnscopables107,
  getOwnPropertySymbolsSpecies108,
  getOwnPropertySymbols1000Props109,
  getOwnPropertySymbolsProtoModify110,
  getOwnPropertySymbolsClassInherit111,
  getOwnPropertySymbolsAssignOnlyEnum112,
  getOwnPropertySymbolsGetterOnly113,
  getOwnPropertySymbolsSetterOnly114,
  getOwnPropertySymbolsDataAndAccessor115,
  getOwnPropertySymbolsNonExtModify116,
  getOwnPropertySymbolsFrozenVsSealed117,
  getOwnPropertySymbolsProtoChainPollution118,
  getOwnPropertySymbolsSpecialDesc119,
  getOwnPropertySymbolsBigInt64Array120
} from './ObjectGetOwnPropertySymbols';

export default function ObjectGetOwnPropertySymbolsTest() {
  describe('ObjectGetOwnPropertySymbolsTest', () => {

    beforeAll(() => {});
    beforeEach(async () => {});
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest001
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0001
     * @tc.desc   Verify getting a single Symbol property from object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSingle001();
      expect(result.length).assertEqual(1);
      expect(result.firstIsSame).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest002
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0002
     * @tc.desc   Verify getting Symbol.for global Symbol property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSymbolFor002();
      expect(result.length).assertEqual(1);
      expect(result.firstIsSame).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest003
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0003
     * @tc.desc   Verify getting multiple Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsMultiple003();
      expect(result.length).assertEqual(2);
      expect(result.hasSym1).assertEqual(true);
      expect(result.hasSym2).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest004
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0004
     * @tc.desc   Verify getting 100 Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsMany004();
      expect(result.length).assertEqual(100);
      expect(result.allFound).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest005
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0005
     * @tc.desc   Verify only Symbol properties are returned, string properties filtered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsMixedStrings005();
      expect(result.length).assertEqual(1);
      expect(result.hasSym).assertEqual(true);
      expect(result.hasString).assertEqual(false);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest006
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0006
     * @tc.desc   Verify Symbol property with numeric string keys coexisting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsMixedNumbers006();
      expect(result.length).assertEqual(1);
      expect(result.firstIsSame).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest007
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0007
     * @tc.desc   Verify plain object with Symbol property returns correct count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsPlainObject007();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest008
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0008
     * @tc.desc   Verify null parameter throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result:string = getOwnPropertySymbolsNull008();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest009
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0009
     * @tc.desc   Verify undefined parameter throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result:string = getOwnPropertySymbolsUndefined009();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest010
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0010
     * @tc.desc   Verify number parameter auto-converts to Number object, returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNumber010();
      expect(result.isArray).assertEqual(true);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest011
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0011
     * @tc.desc   Verify NaN parameter returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNaN011();
      expect(result.isArray).assertEqual(true);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest012
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0012
     * @tc.desc   Verify Infinity and -Infinity parameters return empty arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsInfinity012();
      expect(result.posLength).assertEqual(0);
      expect(result.negLength).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest013
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0013
     * @tc.desc   Verify string parameter auto-converts to String object, returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsString013();
      expect(result.isArray).assertEqual(true);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest014
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0014
     * @tc.desc   Verify empty string parameter returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsEmptyString014();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest015
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0015
     * @tc.desc   Verify true parameter returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsTrue015();
      expect(result.isArray).assertEqual(true);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest016
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0016
     * @tc.desc   Verify false parameter returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsFalse016();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest017
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0017
     * @tc.desc   Verify array with Symbol property returns Symbol keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsArray017();
      expect(result.length).assertEqual(1);
      expect(result.hasSym).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest018
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0018
     * @tc.desc   Verify function with Symbol property returns Symbol keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsFunction018();
      expect(result.length).assertEqual(1);
      expect(result.hasSym).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest019
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0019
     * @tc.desc   Verify Date object with Symbol property returns Symbol keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsDate019();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest020
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0020
     * @tc.desc   Verify RegExp object with Symbol property returns Symbol keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsRegExp020();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest021
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0021
     * @tc.desc   Verify Int8Array with Symbol property returns Symbol keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsInt8Array021();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest022
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0022
     * @tc.desc   Verify Float32Array with Symbol property returns Symbol keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsFloat32Array022();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest023
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0023
     * @tc.desc   Verify Symbol without description can be retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNoDesc023();
      expect(result.length).assertEqual(1);
      expect(result.firstIsSame).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest024
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0024
     * @tc.desc   Verify Symbol with description can be retrieved with correct description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsWithDesc024();
      expect(result.length).assertEqual(1);
      expect(result.desc).assertEqual('description');
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest025
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0025
     * @tc.desc   Verify Symbols with same description are distinct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSameDesc025();
      expect(result.length).assertEqual(2);
      expect(result.sym1AndSym2NotEqual).assertEqual(true);
      expect(result.hasSym1).assertEqual(true);
      expect(result.hasSym2).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest026
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0026
     * @tc.desc   Verify Symbol.for global Symbol keyFor works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsGlobal026();
      expect(result.length).assertEqual(1);
      expect(result.firstIsSame).assertEqual(true);
      expect(result.keyFor).assertEqual('globalKey');
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest027
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0027
     * @tc.desc   Verify Symbol.for with same key returns same Symbol (duplicate key)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsGlobalSame027();
      expect(result.length).assertEqual(1);
      expect(result.sameSymbol).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest028
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0028
     * @tc.desc   Verify Symbol.for and regular Symbol coexist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsGlobalAndNormal028();
      expect(result.length).assertEqual(2);
      expect(result.hasSym1).assertEqual(true);
      expect(result.hasSym2).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest029
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0029
     * @tc.desc   Verify Symbol.iterator well-known Symbol is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsIterator029();
      expect(result.length).assertEqual(1);
      expect(result.isIterator).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest030
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0030
     * @tc.desc   Verify Symbol.toStringTag well-known Symbol is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsToStringTag030();
      expect(result.length).assertEqual(1);
      expect(result.isToStringTag).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest031
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0031
     * @tc.desc   Verify Symbol.toPrimitive well-known Symbol is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsToPrimitive031();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest032
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0032
     * @tc.desc   Verify multiple well-known Symbols are all retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsMultiWellKnown032();
      expect(result.length).assertEqual(3);
      expect(result.hasIterator).assertEqual(true);
      expect(result.hasToStringTag).assertEqual(true);
      expect(result.hasToPrimitive).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest033
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0033
     * @tc.desc   Verify enumerable Symbol property is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsEnumerable033();
      expect(result.length).assertEqual(1);
      expect(result.firstIsSame).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest034
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0034
     * @tc.desc   Verify non-enumerable Symbol property is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNonEnumerable034();
      expect(result.length).assertEqual(1);
      expect(result.firstIsSame).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest035
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0035
     * @tc.desc   Verify mixed enumerable and non-enumerable Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsMixedEnum035();
      expect(result.length).assertEqual(2);
      expect(result.hasSym1).assertEqual(true);
      expect(result.hasSym2).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest036
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0036
     * @tc.desc   Verify configurable Symbol property is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsConfigurable036();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest037
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0037
     * @tc.desc   Verify non-configurable Symbol property is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNonConfigurable037();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest038
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0038
     * @tc.desc   Verify non-configurable Symbol property cannot be deleted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsDeleteNonConfig038();
      expect(result.beforeLength).assertEqual(1);
      expect(result.deleteResult).assertEqual(false);
      expect(result.afterLength).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest039
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0039
     * @tc.desc   Verify writable Symbol property value can be changed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsWritable039();
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest040
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0040
     * @tc.desc   Verify non-writable Symbol property value cannot be changed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNonWritable040();
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest041
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0041
     * @tc.desc   Verify getter-only Symbol property is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsGetter041();
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest042
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0042
     * @tc.desc   Verify setter Symbol property is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSetter042();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest043
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0043
     * @tc.desc   Verify getter+setter Symbol property is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsGetterSetter043();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest044
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0044
     * @tc.desc   Verify frozen object Symbol properties are still retrievable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsFrozen044();
      expect(result.length).assertEqual(1);
      expect(result.firstIsSame).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest045
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0045
     * @tc.desc   Verify frozen object cannot add new Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsFreezeAddNew045();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest046
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0046
     * @tc.desc   Verify frozen object with multiple Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsFrozenMulti046();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest047
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0047
     * @tc.desc   Verify sealed object Symbol properties are retrievable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSealed047();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest048
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0048
     * @tc.desc   Verify sealed object cannot add new Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSealAddNew048();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest049
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0049
     * @tc.desc   Verify sealed object Symbol properties cannot be deleted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSealDelete049();
      expect(result.canDelete).assertEqual(false);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest050
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0050
     * @tc.desc   Verify sealed object Symbol property values can be modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSealModify050();
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest051
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0051
     * @tc.desc   Verify non-extensible object Symbol properties are retrievable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNonExtensible051();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest052
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0052
     * @tc.desc   Verify non-extensible object cannot add new Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNonExtAddNew052();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest053
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0053
     * @tc.desc   Verify non-extensible object Symbol properties can be deleted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNonExtDelete053();
      expect(result.canDelete).assertEqual(true);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest054
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0054
     * @tc.desc   Verify empty object returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsEmptyObj054();
      expect(result.isArray).assertEqual(true);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest055
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0055
     * @tc.desc   Verify Object.create(null) returns empty array for no Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNullProto055();
      expect(result.isArray).assertEqual(true);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest056
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0056
     * @tc.desc   Verify object with only string properties returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNoSymbols056();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest057
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0057
     * @tc.desc   Verify 100 Symbol properties are all retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbols100057();
      expect(result.length).assertEqual(100);
      expect(result.allFound).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest058
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0058
     * @tc.desc   Verify Symbol property with undefined value is still returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsUndefinedVal058();
      expect(result.length).assertEqual(1);
      expect(result.firstIsSame).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest059
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0059
     * @tc.desc   Verify Symbol property with null value is still returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNullVal059();
      expect(result.length).assertEqual(1);
      expect(result.firstIsSame).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest060
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0060
     * @tc.desc   Verify Symbol property with NaN value is still returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNaNVal060();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest061
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0061
     * @tc.desc   Verify prototype chain Symbol properties are not returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsProtoChain061();
      expect(result.length).assertEqual(1);
      expect(result.hasChild).assertEqual(true);
      expect(result.hasParent).assertEqual(false);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest062
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0062
     * @tc.desc   Verify multi-level inheritance only returns own Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsMultiInherit062();
      expect(result.length).assertEqual(1);
      expect(result.hasChild).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest063
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0063
     * @tc.desc   Verify Object.create(null) with Symbol returns correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNullProto063();
      expect(result.length).assertEqual(1);
      expect(result.protoNull).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest064
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0064
     * @tc.desc   Verify Object.create with prototype only returns own Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsCreateWithProto064();
      expect(result.length).assertEqual(1);
      expect(result.hasObj).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest065
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0065
     * @tc.desc   Verify Object.create with second parameter defining Symbol property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsCreateWithProps065();
      expect(result.length).assertEqual(1);
      expect(result.firstIsSame).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest066
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0066
     * @tc.desc   Verify setPrototypeOf does not include new prototype's Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSetProto066();
      expect(result.length).assertEqual(1);
      expect(result.hasSym1).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest067
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0067
     * @tc.desc   Verify return value is an array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsIsArray067();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest068
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0068
     * @tc.desc   Verify object with no Symbol properties returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsEmptyArray068();
      expect(result.isArray).assertEqual(true);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest069
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0069
     * @tc.desc   Verify all elements in returned array are of type Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsAllSymbols069();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest070
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0070
     * @tc.desc   Verify each call returns a new array instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNewArray070();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest071
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0071
     * @tc.desc   Verify modifying returned array does not affect original object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsModifyArray071();
      expect(result.originalLength).assertEqual(1);
      expect(result.afterModify).assertEqual(2);
      expect(result.originalUnchanged).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest072
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0072
     * @tc.desc   Verify returned array preserves insertion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsOrder072();
      expect(result.first).assertEqual(true);
      expect(result.second).assertEqual(true);
      expect(result.third).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest073
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0073
     * @tc.desc   Verify array map method can extract Symbol descriptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsMap073();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest074
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0074
     * @tc.desc   Verify Symbol.keyFor works on returned global Symbols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsKeyFor074();
      expect(result.key0).assertEqual('global1');
      expect(result.key1).assertEqual(undefined);
      expect(result.key2).assertEqual('global2');
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest075
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0075
     * @tc.desc   Verify dynamic Symbol property changes are reflected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsDynamic075();
      expect(result.len1).assertEqual(1);
      expect(result.len2).assertEqual(2);
      expect(result.len3).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest076
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0076
     * @tc.desc   Verify combined getOwnPropertySymbols and getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsWithNames076();
      expect(result.symLength).assertEqual(1);
      expect(result.namesLength).assertEqual(1);
      expect(result.symFirst).assertEqual(true);
      expect(result.namesHasString).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest077
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0077
     * @tc.desc   Verify getOwnPropertySymbols does not return string keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNotInNames077();
      expect(result.symHasA).assertEqual(false);
      expect(result.namesHasSym).assertEqual(false);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest078
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0078
     * @tc.desc   Verify Reflect.ownKeys includes both Symbol and string keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsReflect078();
      expect(result.ownKeysLength).assertEqual(2);
      expect(result.hasSym).assertEqual(true);
      expect(result.hasStr).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest079
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0079
     * @tc.desc   Verify Reflect.ownKeys total equals symbols plus strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsReflectCompare079();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest080
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0080
     * @tc.desc   Verify getOwnPropertyDescriptor for a Symbol property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsDescriptor080();
      expect(typeof result.isWritable === 'boolean').assertEqual(true);
      expect(typeof result.isEnumerable === 'boolean').assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest081
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0081
     * @tc.desc   Verify Object.keys does not include Symbol keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsKeys081();
      expect(result.keysLength).assertEqual(1);
      expect(result.symLength).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest082
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0082
     * @tc.desc   Verify Object.values does not include Symbol property values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsValues082();
      expect(result.valuesLength).assertEqual(1);
      expect(result.hasStrValue).assertEqual(true);
      expect(result.hasSymValue).assertEqual(false);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest083
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0083
     * @tc.desc   Verify Object.assign copies enumerable Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsAssign083();
      expect(result.length).assertEqual(1);
      expect(result.hasSym).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest084
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0084
     * @tc.desc   Verify for...in does not iterate Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsForIn084();
      expect(result.forInLength).assertEqual(1);
      expect(result.hasStr).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest085
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0085
     * @tc.desc   Verify JSON.stringify ignores Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsJSON085();
      expect(result.parsedSymUndefined).assertEqual(true);
      expect(result.parsedStr).assertEqual('strValue');
      expect(result.parsedSymsLength).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest086
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0086
     * @tc.desc   Verify Object.fromEntries can create Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsFromEntries086();
      expect(result.length).assertEqual(1);
      expect(result.hasSym).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest087
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0087
     * @tc.desc   Verify null parameter throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result:string = getOwnPropertySymbolsNullErr087();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest088
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0088
     * @tc.desc   Verify undefined parameter throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result:string = getOwnPropertySymbolsUndefinedErr088();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest089
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0089
     * @tc.desc   Verify no argument call throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result:string = getOwnPropertySymbolsNoArg089();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest090
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0090
     * @tc.desc   Verify number parameter auto-converts to Number object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNumberAuto090();
      expect(result.isArray).assertEqual(true);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest091
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0091
     * @tc.desc   Verify string parameter auto-converts to String object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsStringAuto091();
      expect(result.isArray).assertEqual(true);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest092
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0092
     * @tc.desc   Verify boolean parameters return empty arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsBoolAuto092();
      expect(result.r1Len).assertEqual(0);
      expect(result.r2Len).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest093
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0093
     * @tc.desc   Verify BigInt parameter auto-converts to BigInt object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsBigInt093();
      expect(result.isArray).assertEqual(true);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest094
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0094
     * @tc.desc   Verify Symbol as parameter auto-converts to Symbol object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSymbolParam094();
      expect(result.isArray).assertEqual(true);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest095
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0095
     * @tc.desc   Verify multiple error handling works for null, undefined, void 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsMultiError095();
      expect(result[0]).assertEqual('error');
      expect(result[1]).assertEqual('error');
      expect(result[2]).assertEqual('error');
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest096
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0096
     * @tc.desc   Verify Proxy object with Symbol property returns correct count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsProxy096();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest097
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0097
     * @tc.desc   Verify revoked proxy throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsRevocableProxy097();
      expect(result.result1Length).assertEqual(1);
      expect(result.throws).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest098
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0098
     * @tc.desc   Verify class static Symbol property is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsClassStatic098();
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest099
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0099
     * @tc.desc   Verify index access to returned array including out-of-bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsIndex099();
      expect(result.idx0).assertEqual(true);
      expect(result.idx1).assertEqual(true);
      expect(result.idxNeg1).assertEqual(true);
      expect(result.idx100).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest100
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0100
     * @tc.desc   Verify long Symbol description (10000 chars) is retrieved correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsLongDesc100();
      expect(result).assertEqual(10000);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest101
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0101
     * @tc.desc   Verify Symbol.hasInstance well-known Symbol is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsHasInstance101();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest102
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0102
     * @tc.desc   Verify Symbol.isConcatSpreadable well-known Symbol is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsIsConcatSpreadable102();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest103
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0103
     * @tc.desc   Verify Symbol.match well-known Symbol is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsMatch103();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest104
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0104
     * @tc.desc   Verify Symbol.replace well-known Symbol is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsReplace104();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest105
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0105
     * @tc.desc   Verify Symbol.search well-known Symbol is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSearch105();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest106
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0106
     * @tc.desc   Verify Symbol.split well-known Symbol is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSplit106();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest107
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0107
     * @tc.desc   Verify Symbol.unscopables well-known Symbol is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsUnscopables107();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest108
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0108
     * @tc.desc   Verify Symbol.species static well-known Symbol is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSpecies108();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest109
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0109
     * @tc.desc   Verify 1000 Symbol properties are all retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbols1000Props109();
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest110
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0110
     * @tc.desc   Verify __proto__ modification does not affect own Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsProtoModify110();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest111
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0111
     * @tc.desc   Verify ES6 class inheritance returns all own Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsClassInherit111();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest112
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0112
     * @tc.desc   Verify Object.assign copies only enumerable Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsAssignOnlyEnum112();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest113
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0113
     * @tc.desc   Verify getter-only Symbol property is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsGetterOnly113();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest114
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0114
     * @tc.desc   Verify setter-only Symbol property is retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSetterOnly114();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest115
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0115
     * @tc.desc   Verify data and accessor Symbol properties are both retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsDataAndAccessor115();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest116
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0116
     * @tc.desc   Verify non-extensible object Symbol value can be modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsNonExtModify116();
      expect(result.length).assertEqual(1);
      expect(result.value).assertEqual('newValue');
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest117
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0117
     * @tc.desc   Verify frozen and sealed objects both retain Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsFrozenVsSealed117();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest118
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0118
     * @tc.desc   Verify prototype chain pollution does not affect own Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsProtoChainPollution118();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest119
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0119
     * @tc.desc   Verify Symbol with special character descriptions are retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsSpecialDesc119();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   ObjectGetOwnPropertySymbolsTest120
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETOWNPROPERTYSYMBOLS_TEST_0120
     * @tc.desc   Verify BigInt64Array with Symbol property returns correct Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetOwnPropertySymbolsTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getOwnPropertySymbolsBigInt64Array120();
      expect(result).assertEqual(true);
    });

  });
}
