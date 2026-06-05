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
  getPrototypeOfBasic001,
  getPrototypeOfNullProto002,
  getPrototypeOfObjectProto003,
  getPrototypeOfReturnType004,
  getPrototypeOfProtoProperty005,
  getPrototypeOfConstructor006,
  getPrototypeOfString007,
  getPrototypeOfNumber008,
  getPrototypeOfBoolean009,
  getPrototypeOfSymbol010,
  getPrototypeOfBigInt011,
  getPrototypeOfNull012,
  getPrototypeOfUndefined013,
  getPrototypeOfObjectLiteral014,
  getPrototypeOfConstructorObj015,
  getPrototypeOfArray016,
  getPrototypeOfArrayConstructor017,
  getPrototypeOfFuncDecl018,
  getPrototypeOfFuncExpr019,
  getPrototypeOfArrow020,
  getPrototypeOfDate021,
  getPrototypeOfRegExp022,
  getPrototypeOfError023,
  getPrototypeOfMap024,
  getPrototypeOfSet025,
  getPrototypeOfWeakMap026,
  getPrototypeOfWeakSet027,
  getPrototypeOfPromise028,
  getPrototypeOfInt8Array029,
  getPrototypeOfUint8Array030,
  getPrototypeOfUint8Clamped031,
  getPrototypeOfInt16Array032,
  getPrototypeOfUint16Array033,
  getPrototypeOfInt32Array034,
  getPrototypeOfUint32Array035,
  getPrototypeOfFloat32Arr036,
  getPrototypeOfFloat64Arr037,
  getPrototypeOfBigInt64Arr038,
  getPrototypeOfBigUint64Arr039,
  getPrototypeOfArrayBuffer040,
  getPrototypeOfDataView041,
  getPrototypeOfTwoLayer042,
  getPrototypeOfThreeLayer043,
  getPrototypeOfObjectProtoNull044,
  getPrototypeOfChainToNull045,
  getPrototypeOfClassInherit046,
  getPrototypeOfMultiClass047,
  getPrototypeOfZero048,
  getPrototypeOfNegZero049,
  getPrototypeOfNaN050,
  getPrototypeOfInfinity051,
  getPrototypeOfNegInfinity052,
  getPrototypeOfMaxValue053,
  getPrototypeOfMinValue054,
  getPrototypeOfMaxSafeInt055,
  getPrototypeOfMinSafeInt056,
  getPrototypeOfEmptyString057,
  getPrototypeOfSpecialStr058,
  getPrototypeOfUnicodeStr059,
  getPrototypeOfLongStr060,
  getPrototypeOfNoArg061,
  getPrototypeOfNullMsg062,
  getPrototypeOfSetProto063,
  getPrototypeOfSetNull064,
  getPrototypeOfCreateProto065,
  getPrototypeOfIsProto066,
  getPrototypeOfReflect067,
  getPrototypeOfReflectNull068,
  getPrototypeOfProtoConsistency069,
  getPrototypeOfConstructorProto070,
  getPrototypeOfFrozen071,
  getPrototypeOfSealed072,
  getPrototypeOfNonExtensible073,
  getPrototypeOfProxy074,
  getPrototypeOfProxyTrap075,
  getPrototypeOfProxyTrapNull076,
  getPrototypeOfObjectProtoProto077,
  getPrototypeOfFuncProtoProto078,
  getPrototypeOfArrayProtoProto079,
  getPrototypeOfStringProtoProto080,
  getPrototypeOfNumberProtoProto081,
  getPrototypeOfBooleanProtoProto082,
  getPrototypeOfSymbolProtoProto083,
  getPrototypeOfBigIntProtoProto084,
  getPrototypeOfDateProtoProto085,
  getPrototypeOfRegExpProtoProto086,
  getPrototypeOfErrorProtoProto087,
  getPrototypeOfMapProtoProto088,
  getPrototypeOfSetProtoProto089,
  getPrototypeOfPromiseProtoProto090,
  getPrototypeOfObjectConstructor091,
  getPrototypeOfFunctionConstructor092,
  getPrototypeOfArrayConstructor093,
  getPrototypeOfSymbolConstructor094,
  getPrototypeOfBigIntConstructor095,
  getPrototypeOfTypeErrorProto096,
  getPrototypeOfRangeErrorProto097,
  getPrototypeOfSyntaxErrorProto098,
  getPrototypeOfRefErrorProto099,
  getPrototypeOfURIErrorProto100,
  getPrototypeOfProxyTrapNonObj101,
  getPrototypeOfFrozenModifyProto102,
  getPrototypeOfGlobalThis103,
  getPrototypeOfJSON104,
  getPrototypeOfChainDepth106,
  getPrototypeOfNoCycle107,
  getPrototypeOfChainToNull108,
  getPrototypeOfNullProtoProp109,
  getPrototypeOfSetProtoToNull110
} from './ObjectGetPrototypeOf';

interface GetPrototypeOfClassInheritResult { childProto: boolean; childProtoProto: boolean; }
interface GetPrototypeOfMultiClassResult { cProto: boolean; cProtoProto: boolean; bProtoProto: boolean; }
interface GetPrototypeOfIsProtoResult { protoMatch: boolean; isProto: boolean; }

export default function ObjectGetPrototypeOfTests() {
  describe('ObjectGetPrototypeOfTests', () => {

    beforeAll(() => {});
    beforeEach(async () => {});
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name   ObjectGetPrototypeOfTest001
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0001
     * @tc.desc   Verify getting prototype of an object created with Object.create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: boolean = getPrototypeOfBasic001();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest002
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0002
     * @tc.desc   Verify Object.create(null) returns null prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: object | null = getPrototypeOfNullProto002();
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest003
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0003
     * @tc.desc   Verify object literal's prototype is Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfObjectProto003();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest004
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0004
     * @tc.desc   Verify return value is object or null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfReturnType004();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest005
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0005
     * @tc.desc   Verify return value matches __proto__ property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfProtoProperty005();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest006
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0006
     * @tc.desc   Verify prototype equals constructor's prototype property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfConstructor006();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest007
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0007
     * @tc.desc   Verify string parameter coerces to String.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfString007();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest008
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0008
     * @tc.desc   Verify number parameter coerces to Number.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfNumber008();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest009
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0009
     * @tc.desc   Verify boolean parameter coerces to Boolean.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfBoolean009();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest010
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0010
     * @tc.desc   Verify Symbol parameter coerces to Symbol.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfSymbol010();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest011
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0011
     * @tc.desc   Verify BigInt parameter coerces to BigInt.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfBigInt011();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest012
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0012
     * @tc.desc   Verify null parameter throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result:string = getPrototypeOfNull012();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest013
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0013
     * @tc.desc   Verify undefined parameter throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result:string = getPrototypeOfUndefined013();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest014
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0014
     * @tc.desc   Verify object literal resolves to Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfObjectLiteral014();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest015
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0015
     * @tc.desc   Verify constructor-created object returns constructor.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfConstructorObj015();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest016
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0016
     * @tc.desc   Verify array literal returns Array.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfArray016();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest017
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0017
     * @tc.desc   Verify Array constructor returns Array.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfArrayConstructor017();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest018
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0018
     * @tc.desc   Verify function declaration returns Function.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfFuncDecl018();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest019
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0019
     * @tc.desc   Verify function expression returns Function.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfFuncExpr019();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest020
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0020
     * @tc.desc   Verify arrow function returns Function.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfArrow020();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest021
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0021
     * @tc.desc   Verify Date object returns Date.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfDate021();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest022
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0022
     * @tc.desc   Verify RegExp object returns RegExp.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfRegExp022();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest023
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0023
     * @tc.desc   Verify Error object returns Error.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfError023();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest024
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0024
     * @tc.desc   Verify Map object returns Map.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfMap024();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest025
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0025
     * @tc.desc   Verify Set object returns Set.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfSet025();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest026
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0026
     * @tc.desc   Verify WeakMap object returns WeakMap.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfWeakMap026();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest027
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0027
     * @tc.desc   Verify WeakSet object returns WeakSet.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfWeakSet027();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest028
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0028
     * @tc.desc   Verify Promise object returns Promise.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfPromise028();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest029
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0029
     * @tc.desc   Verify Int8Array returns Int8Array.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfInt8Array029();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest030
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0030
     * @tc.desc   Verify Uint8Array returns Uint8Array.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfUint8Array030();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest031
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0031
     * @tc.desc   Verify Uint8ClampedArray returns Uint8ClampedArray.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfUint8Clamped031();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest032
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0032
     * @tc.desc   Verify Int16Array returns Int16Array.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfInt16Array032();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest033
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0033
     * @tc.desc   Verify Uint16Array returns Uint16Array.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfUint16Array033();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest034
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0034
     * @tc.desc   Verify Int32Array returns Int32Array.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfInt32Array034();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest035
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0035
     * @tc.desc   Verify Uint32Array returns Uint32Array.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfUint32Array035();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest036
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0036
     * @tc.desc   Verify Float32Array returns Float32Array.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfFloat32Arr036();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest037
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0037
     * @tc.desc   Verify Float64Array returns Float64Array.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfFloat64Arr037();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest038
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0038
     * @tc.desc   Verify BigInt64Array returns BigInt64Array.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfBigInt64Arr038();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest039
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0039
     * @tc.desc   Verify BigUint64Array returns BigUint64Array.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfBigUint64Arr039();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest040
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0040
     * @tc.desc   Verify ArrayBuffer returns ArrayBuffer.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfArrayBuffer040();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest041
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0041
     * @tc.desc   Verify DataView returns DataView.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfDataView041();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest042
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0042
     * @tc.desc   Verify two-layer prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfTwoLayer042();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest043
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0043
     * @tc.desc   Verify three-layer prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfThreeLayer043();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest044
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0044
     * @tc.desc   Verify Object.prototype's prototype is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfObjectProtoNull044();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest045
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0045
     * @tc.desc   Verify prototype chain traversal ends at Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfChainToNull045();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest046
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0046
     * @tc.desc   Verify ES6 class inheritance prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfClassInherit046();
      expect(result.childProto).assertEqual(true);
      expect(result.childProtoProto).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest047
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0047
     * @tc.desc   Verify multi-level ES6 class inheritance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfMultiClass047();
      expect(result.cProto).assertEqual(true);
      expect(result.cProtoProto).assertEqual(true);
      expect(result.bProtoProto).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest048
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0048
     * @tc.desc   Verify +0 coerces to Number.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfZero048();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest049
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0049
     * @tc.desc   Verify -0 coerces to Number.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfNegZero049();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest050
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0050
     * @tc.desc   Verify NaN coerces to Number.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfNaN050();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest051
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0051
     * @tc.desc   Verify Infinity coerces to Number.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfInfinity051();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest052
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0052
     * @tc.desc   Verify -Infinity coerces to Number.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfNegInfinity052();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest053
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0053
     * @tc.desc   Verify Number.MAX_VALUE resolves to Number.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfMaxValue053();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest054
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0054
     * @tc.desc   Verify Number.MIN_VALUE resolves to Number.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfMinValue054();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest055
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0055
     * @tc.desc   Verify Number.MAX_SAFE_INTEGER resolves to Number.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfMaxSafeInt055();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest056
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0056
     * @tc.desc   Verify Number.MIN_SAFE_INTEGER resolves to Number.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfMinSafeInt056();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest057
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0057
     * @tc.desc   Verify empty string resolves to String.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfEmptyString057();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest058
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0058
     * @tc.desc   Verify special char string resolves to String.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfSpecialStr058();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest059
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0059
     * @tc.desc   Verify unicode string resolves to String.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfUnicodeStr059();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest060
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0060
     * @tc.desc   Verify long string resolves to String.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfLongStr060();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest061
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0061
     * @tc.desc   Verify no argument call throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result:string = getPrototypeOfNoArg061();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest062
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0062
     * @tc.desc   Verify null parameter error has correct name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: string | boolean = getPrototypeOfNullMsg062();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest063
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0063
     * @tc.desc   Verify setPrototypeOf then getPrototypeOf returns new prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: boolean = getPrototypeOfSetProto063();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest064
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0064
     * @tc.desc   Verify setPrototypeOf to null then getPrototypeOf returns null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: object | null = getPrototypeOfSetNull064();
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest065
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0065
     * @tc.desc   Verify Object.create specified prototype is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfCreateProto065();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest066
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0066
     * @tc.desc   Verify consistency with isPrototypeOf method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfIsProto066();
      expect(result.protoMatch).assertEqual(true);
      expect(result.isProto).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest067
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0067
     * @tc.desc   Verify Object.getPrototypeOf equals Reflect.getPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfReflect067();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest068
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0068
     * @tc.desc   Verify Reflect.getPrototypeOf returns null for null-prototype object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfReflectNull068();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest069
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0069
     * @tc.desc   Verify consistency with __proto__ property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfProtoConsistency069();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest070
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0070
     * @tc.desc   Verify getPrototypeOf matches constructor.prototype relationship
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfConstructorProto070();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest071
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0071
     * @tc.desc   Verify frozen object prototype is still accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfFrozen071();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest072
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0072
     * @tc.desc   Verify sealed object prototype is still accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfSealed072();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest073
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0073
     * @tc.desc   Verify non-extensible object prototype is still accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfNonExtensible073();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest074
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0074
     * @tc.desc   Verify Proxy object returns target's prototype by default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfProxy074();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest075
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0075
     * @tc.desc   Verify Proxy custom getPrototypeOf trap returns custom prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: boolean = getPrototypeOfProxyTrap075();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest076
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0076
     * @tc.desc   Verify Proxy getPrototypeOf trap can return null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: object | null = getPrototypeOfProxyTrapNull076();
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest077
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0077
     * @tc.desc   Verify Object.prototype's prototype is null (prototype chain root)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: object | null = getPrototypeOfObjectProtoProto077();
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest078
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0078
     * @tc.desc   Verify Function.prototype resolves to Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfFuncProtoProto078();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest079
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0079
     * @tc.desc   Verify Array.prototype resolves to Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfArrayProtoProto079();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest080
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0080
     * @tc.desc   Verify String.prototype resolves to Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfStringProtoProto080();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest081
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0081
     * @tc.desc   Verify Number.prototype resolves to Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfNumberProtoProto081();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest082
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0082
     * @tc.desc   Verify Boolean.prototype resolves to Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfBooleanProtoProto082();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest083
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0083
     * @tc.desc   Verify Symbol.prototype resolves to Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfSymbolProtoProto083();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest084
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0084
     * @tc.desc   Verify BigInt.prototype resolves to Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfBigIntProtoProto084();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest085
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0085
     * @tc.desc   Verify Date.prototype resolves to Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfDateProtoProto085();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest086
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0086
     * @tc.desc   Verify RegExp.prototype resolves to Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfRegExpProtoProto086();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest087
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0087
     * @tc.desc   Verify Error.prototype resolves to Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfErrorProtoProto087();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest088
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0088
     * @tc.desc   Verify Map.prototype resolves to Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfMapProtoProto088();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest089
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0089
     * @tc.desc   Verify Set.prototype resolves to Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfSetProtoProto089();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest090
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0090
     * @tc.desc   Verify Promise.prototype resolves to Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfPromiseProtoProto090();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest091
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0091
     * @tc.desc   Verify Object constructor resolves to Function.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfObjectConstructor091();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest092
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0092
     * @tc.desc   Verify Function constructor resolves to Function.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfFunctionConstructor092();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest093
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0093
     * @tc.desc   Verify Array constructor resolves to Function.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfArrayConstructor093();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest094
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0094
     * @tc.desc   Verify Symbol constructor resolves to Function.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfSymbolConstructor094();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest095
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0095
     * @tc.desc   Verify BigInt constructor resolves to Function.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfBigIntConstructor095();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest096
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0096
     * @tc.desc   Verify TypeError.prototype resolves to Error.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfTypeErrorProto096();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest097
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0097
     * @tc.desc   Verify RangeError.prototype resolves to Error.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfRangeErrorProto097();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest098
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0098
     * @tc.desc   Verify SyntaxError.prototype resolves to Error.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfSyntaxErrorProto098();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest099
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0099
     * @tc.desc   Verify ReferenceError.prototype resolves to Error.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfRefErrorProto099();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest100
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0100
     * @tc.desc   Verify URIError.prototype resolves to Error.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfURIErrorProto100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest101
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0101
     * @tc.desc   Verify Proxy getPrototypeOf trap returning non-object throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result:string = getPrototypeOfProxyTrapNonObj101();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest102
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0102
     * @tc.desc   Verify frozen object cannot modify prototype, getPrototypeOf returns original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfFrozenModifyProto102();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest103
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0103
     * @tc.desc   Verify globalThis prototype is an object (non-null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfGlobalThis103();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest104
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0104
     * @tc.desc   Verify JSON object prototype is Object.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfJSON104();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   ObjectGetPrototypeOfTest105
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0105
     * @tc.desc   Verify prototype chain depth calculation returns correct depth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfChainDepth106();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest106
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0106
     * @tc.desc   Verify prototype chain has no cycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfNoCycle107();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest107
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0107
     * @tc.desc   Verify prototype chain ends at Object.prototype with null prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfChainToNull108();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest108
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0108
     * @tc.desc   Verify null prototype object getPrototypeOf is null and __proto__ is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result = getPrototypeOfNullProtoProp109();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ObjectGetPrototypeOfTest109
     * @tc.number SUB_COMMONLIBRARY_OBJECTTEST_OBJECTGETPROTOTYPEOF_TEST_0109
     * @tc.desc   Verify setPrototypeOf to null then getPrototypeOf returns null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectGetPrototypeOfTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: object | null = getPrototypeOfSetProtoToNull110();
      expect(result).assertEqual(null);
    });

  });
}
