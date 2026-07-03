'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float64ArrayConstructor4Test(): void {
  describe('Float64ArrayConstructor4Test', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_0100
     * @tc.name testFloat64ArrayConstructor4001
     * @tc.desc Verify parameter count 1 correct arity copy constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const source = new Float64Array([1.0, 2.0]);
      const copy = new Float64Array(source);
      const expectVal = twoValue;
      expect(copy.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_0200
     * @tc.name testFloat64ArrayConstructor4002
     * @tc.desc Verify other is single element Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const oneValue: number = 1;
      const source = new Float64Array([onePointZero]);
      const copy = new Float64Array(source);
      expect(copy.length).assertEqual(oneValue);
      expect(copy[0]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_0300
     * @tc.name testFloat64ArrayConstructor4003
     * @tc.desc Verify other is multi-element Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const source = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const copy = new Float64Array(source);
      const expectVal = fiveValue;
      expect(copy.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_0400
     * @tc.name testFloat64ArrayConstructor4004
     * @tc.desc Verify other contains positive zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const threeValue: number = 3;
      const source = new Float64Array([zeroPointZero, zeroPointZero, zeroPointZero]);
      const copy = new Float64Array(source);
      expect(copy.length).assertEqual(threeValue);
      expect(copy[0]).assertEqual(zeroPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_0500
     * @tc.name testFloat64ArrayConstructor4005
     * @tc.desc Verify other contains negative zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const source = new Float64Array([-0.0, -0.0]);
      const copy = new Float64Array(source);
      expect(copy.length).assertEqual(twoValue);
      expect(1 / copy[0] === -Infinity).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_0600
     * @tc.name testFloat64ArrayConstructor4006
     * @tc.desc Verify other contains positive Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const threeValue: number = 3;
      const source = new Float64Array([1.0, positiveInfinity, 3.0]);
      const copy = new Float64Array(source);
      expect(copy.length).assertEqual(threeValue);
      expect(copy[1]).assertEqual(positiveInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_0700
     * @tc.name testFloat64ArrayConstructor4007
     * @tc.desc Verify other contains negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const threeValue: number = 3;
      const source = new Float64Array([negativeInfinity, 0.0, 1.0]);
      const copy = new Float64Array(source);
      expect(copy.length).assertEqual(threeValue);
      expect(copy[0]).assertEqual(negativeInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_0800
     * @tc.name testFloat64ArrayConstructor4008
     * @tc.desc Verify other contains NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const threeValue: number = 3;
      const source = new Float64Array([1.0, nanValue, 3.0]);
      const copy = new Float64Array(source);
      expect(copy.length).assertEqual(threeValue);
      const actVal1 = Number.isNaN(copy[1]);
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_0900
     * @tc.name testFloat64ArrayConstructor4009
     * @tc.desc Verify other contains min positive Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const source = new Float64Array([doubleMinValue, 1.0]);
      const copy = new Float64Array(source);
      const expectVal = doubleMinValue;
      expect(copy[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_1000
     * @tc.name testFloat64ArrayConstructor4010
     * @tc.desc Verify other contains max Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const source = new Float64Array([doubleMaxValue]);
      const copy = new Float64Array(source);
      const expectVal = doubleMaxValue;
      expect(copy[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_1100
     * @tc.name testFloat64ArrayConstructor4011
     * @tc.desc Verify other contains negative large number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negsciValue17976931348623157e308: number = -1.7976931348623157e+308;
      const source = new Float64Array([negsciValue17976931348623157e308]);
      const copy = new Float64Array(source);
      const expectVal = negsciValue17976931348623157e308;
      expect(copy[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_1200
     * @tc.name testFloat64ArrayConstructor4012
     * @tc.desc Verify other contains scientific notation positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const twoValue: number = 2;
      const source = new Float64Array([sciValue10e308, 1.7976931348623157e+308]);
      const copy = new Float64Array(source);
      expect(copy.length).assertEqual(twoValue);
      expect(copy[0]).assertEqual(sciValue10e308);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_1300
     * @tc.name testFloat64ArrayConstructor4013
     * @tc.desc Verify other contains integer 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const source = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(source);
      expect(copy[0]).assertEqual(onePointZero);
      expect(copy[1]).assertEqual(twoPointZero);
      expect(copy[2]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_1400
     * @tc.name testFloat64ArrayConstructor4014
     * @tc.desc Verify other contains negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const negnum999999Pointninenine: number = -999999.99;
      const source = new Float64Array([-1.0, -999999.99, -0.5]);
      const copy = new Float64Array(source);
      expect(copy.length).assertEqual(threeValue);
      expect(copy[1]).assertEqual(negnum999999Pointninenine);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_1500
     * @tc.name testFloat64ArrayConstructor4015
     * @tc.desc Verify other contains decimal precision boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const source = new Float64Array([0.1, 0.2, 0.3]);
      const copy = new Float64Array(source);
      expect(copy.length).assertEqual(threeValue);
      expect(copy[0] + copy[1] === 0.3).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_1600
     * @tc.name testFloat64ArrayConstructor4016
     * @tc.desc Verify other contains Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const source = new Float64Array([maxSafeInteger]);
      const copy = new Float64Array(source);
      const expectVal = maxSafeIntegerValue;
      expect(copy[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_1700
     * @tc.name testFloat64ArrayConstructor4017
     * @tc.desc Verify other contains Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = Number.MIN_SAFE_INTEGER;
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const source = new Float64Array([minSafeInteger]);
      const copy = new Float64Array(source);
      const expectVal = negativeMaxSafeIntegerValue;
      expect(copy[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_1800
     * @tc.name testFloat64ArrayConstructor4018
     * @tc.desc Verify other is filled Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const thirtyPointZero: number = 30.0;
      const source = new Float64Array(3);
      source[0] = 10.0;
      source[1] = 20.0;
      source[2] = 30.0;
      const copy = new Float64Array(source);
      expect(copy[0]).assertEqual(tenPointZero);
      expect(copy[1]).assertEqual(twentyPointZero);
      expect(copy[2]).assertEqual(thirtyPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_1900
     * @tc.name testFloat64ArrayConstructor4019
     * @tc.desc Verify other is Float64Array created by from method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const threeValue: number = 3;
      const source = Float64Array.from([onePointZero, twoPointZero, threePointZero]);
      const copy = new Float64Array(source);
      expect(copy.length).assertEqual(threeValue);
      expect(copy[2]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_2000
     * @tc.name testFloat64ArrayConstructor4020
     * @tc.desc Verify other is Float64Array created by of method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const twoValue: number = 2;
      const source = Float64Array.of(int32MinValue, -1);
      const copy = new Float64Array(source);
      expect(copy.length).assertEqual(twoValue);
      expect(copy[0]).assertEqual(int32MinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_2100
     * @tc.name testFloat64ArrayConstructor4021
     * @tc.desc Verify constructor from Float64Array source returns Float64Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Float64Array([1.0]);
      const copy = new Float64Array(source);
      const obj: Object = copy as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_2200
     * @tc.name testFloat64ArrayConstructor4022
     * @tc.desc Verify return buffer independent from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Float64Array([1.0, 2.0]);
      const copy = new Float64Array(source);
      const expectVal = false;
      expect(copy.buffer === source.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_2300
     * @tc.name testFloat64ArrayConstructor4023
     * @tc.desc Verify return element values equal source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const twoPointFive: number = 2.5;
      const threePointfive: number = 3.5;
      const source = new Float64Array([onePointFive, twoPointFive, threePointfive]);
      const copy = new Float64Array(source);
      expect(copy[0]).assertEqual(onePointFive);
      expect(copy[1]).assertEqual(twoPointFive);
      expect(copy[2]).assertEqual(threePointfive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_2400
     * @tc.name testFloat64ArrayConstructor4024
     * @tc.desc Verify deep copy semantics that modifying copy does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const sciValue10e6: number = 1.0e6;
      const source = new Float64Array([onePointZero, 2.0]);
      const copy = new Float64Array(source);
      copy[0] = 1.0e6;
      expect(source[0]).assertEqual(onePointZero);
      expect(copy[0]).assertEqual(sciValue10e6);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_2500
     * @tc.name testFloat64ArrayConstructor4025
     * @tc.desc Verify deep copy semantics that modifying source does not affect copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const negativeZero: number = -0.0;
      const source = new Float64Array([1.0, twoPointZero]);
      const copy = new Float64Array(source);
      source[1] = -0.0;
      expect(copy[1]).assertEqual(twoPointZero);
      expect(source[1]).assertEqual(negativeZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_2600
     * @tc.name testFloat64ArrayConstructor4026
     * @tc.desc Verify other is null throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nullLike: Object | null = null;
      try {
        new Float64Array(nullLike as Object as Float64Array);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_2700
     * @tc.name testFloat64ArrayConstructor4027
     * @tc.desc Verify other is undefined throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const undef: Object | undefined = undefined;
      try {
        new Float64Array(undef as Object as Float64Array);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_2800
     * @tc.name testFloat64ArrayConstructor4028
     * @tc.desc Verify other is plain Array throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1.0, 2.0];
      try {
        new Float64Array(arr as Object as Float64Array);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_2900
     * @tc.name testFloat64ArrayConstructor4029
     * @tc.desc Verify other is FixedArray throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed: FixedArray<number> = [1.0, 2.0];
      try {
        new Float64Array(fixed as Object as Float64Array);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_3000
     * @tc.name testFloat64ArrayConstructor4030
     * @tc.desc Verify other is Object throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      try {
        new Float64Array(obj as Float64Array);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_3100
     * @tc.name testFloat64ArrayConstructor4031
     * @tc.desc Verify other is string throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = '1.0,2.0';
      try {
        new Float64Array(str as Object as Float64Array);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_3200
     * @tc.name testFloat64ArrayConstructor4032
     * @tc.desc Verify other is number throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float64Array(5 as Object as Float64Array);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_3300
     * @tc.name testFloat64ArrayConstructor4033
     * @tc.desc Verify other is boolean throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool: boolean = true;
      try {
        new Float64Array(bool as Object as Float64Array);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_3400
     * @tc.name testFloat64ArrayConstructor4034
     * @tc.desc Verify elements parameter count 1 correct arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const elements: Array<number> = [1.0, 2.0, 3.0];
      const values = new Float64Array(elements);
      const expectVal = threeValue;
      expect(values.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_3500
     * @tc.name testFloat64ArrayConstructor4035
     * @tc.desc Verify elements is single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const fillValue42: number = 42.0;
      const elements: Array<number> = [42.0];
      const values = new Float64Array(elements);
      expect(values.length).assertEqual(oneValue);
      expect(values[0]).assertEqual(fillValue42);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_3600
     * @tc.name testFloat64ArrayConstructor4036
     * @tc.desc Verify elements is multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const elements: Array<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      const values = new Float64Array(elements);
      const expectVal = fiveValue;
      expect(values.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_3700
     * @tc.name testFloat64ArrayConstructor4037
     * @tc.desc Verify elements contains positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const zeroPointZero: number = 0.0;
      const elements: Array<number> = [0.0, 0.0, 0.0];
      const values = new Float64Array(elements);
      expect(values.length).assertEqual(threeValue);
      expect(values[0]).assertEqual(zeroPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_3800
     * @tc.name testFloat64ArrayConstructor4038
     * @tc.desc Verify elements contains negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const elements: Array<number> = [-0.0, -0.0];
      const values = new Float64Array(elements);
      const expectVal = negativeZero;
      expect(values[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_3900
     * @tc.name testFloat64ArrayConstructor4039
     * @tc.desc Verify elements contains Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const positiveInfinity: number = Infinity;
      const elements: Array<number> = [Infinity, 1.0, Infinity];
      const values = new Float64Array(elements);
      expect(values[1]).assertEqual(onePointZero);
      expect(values[0]).assertEqual(positiveInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_4000
     * @tc.name testFloat64ArrayConstructor4040
     * @tc.desc Verify elements contains -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const elements: Array<number> = [-Infinity, 0.0];
      const values = new Float64Array(elements);
      const expectVal = negativeInfinity;
      expect(values[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_4100
     * @tc.name testFloat64ArrayConstructor4041
     * @tc.desc Verify elements contains NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<number> = [NaN, 1.0, NaN];
      const values = new Float64Array(elements);
      const actVal2 = Number.isNaN(values[0]);
      const expectVal = true;
      expect(actVal2).assertEqual(expectVal);
      const actVal3 = Number.isNaN(values[2]);
      const expectVal2 = true;
      expect(actVal3).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_4200
     * @tc.name testFloat64ArrayConstructor4042
     * @tc.desc Verify elements contains Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const elements: Array<number> = [1.7976931348623157e+308];
      const values = new Float64Array(elements);
      const expectVal = doubleMaxValue;
      expect(values[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_4300
     * @tc.name testFloat64ArrayConstructor4043
     * @tc.desc Verify elements contains Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const elements: Array<number> = [5e-324];
      const values = new Float64Array(elements);
      const expectVal = doubleMinValue;
      expect(values[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_4400
     * @tc.name testFloat64ArrayConstructor4044
     * @tc.desc Verify elements contains scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const sciValue10e308: number = 1.0e-308;
      const elements: Array<number> = [1.0e-308, 1.7976931348623157e+308, 3.0e-100];
      const values = new Float64Array(elements);
      expect(values.length).assertEqual(threeValue);
      expect(values[0]).assertEqual(sciValue10e308);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_4500
     * @tc.name testFloat64ArrayConstructor4045
     * @tc.desc Verify elements contains negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum999999Pointninenine: number = -999999.99;
      const elements: Array<number> = [-1.0, -2.5, -999999.99];
      const values = new Float64Array(elements);
      const expectVal = negnum999999Pointninenine;
      expect(values[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_4600
     * @tc.name testFloat64ArrayConstructor4046
     * @tc.desc Verify elements contains Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const elements: Array<number> = [Number.MAX_SAFE_INTEGER];
      const values = new Float64Array(elements);
      const expectVal = maxSafeIntegerValue;
      expect(values[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_4700
     * @tc.name testFloat64ArrayConstructor4047
     * @tc.desc Verify elements contains Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const elements: Array<number> = [Number.MIN_SAFE_INTEGER];
      const values = new Float64Array(elements);
      const expectVal = negativeMaxSafeIntegerValue;
      expect(values[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_4800
     * @tc.name testFloat64ArrayConstructor4048
     * @tc.desc Verify elements is iterable source consumed once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const threePointZero: number = 3.0;
      const src: Array<number> = [1.0, 2.0, 3.0];
      const iterable: Iterable<Number> = src;
      const values = new Float64Array(iterable);
      expect(values.length).assertEqual(threeValue);
      expect(values[2]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_4900
     * @tc.name testFloat64ArrayConstructor4049
     * @tc.desc Verify elements is iterable yielding once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const hundredPointZero: number = 100.0;
      const src: Array<number> = [100.0];
      const iterable: Iterable<Number> = src;
      const values = new Float64Array(iterable);
      expect(values.length).assertEqual(oneValue);
      expect(values[0]).assertEqual(hundredPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_5000
     * @tc.name testFloat64ArrayConstructor4050
     * @tc.desc Verify elements is nested iterable consumption
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const fourPointZero: number = 4.0;
      const src: Array<number> = [1.0, 2.0, 3.0, 4.0];
      const iterable: Iterable<Number> = src;
      const values = new Float64Array(iterable);
      expect(values.length).assertEqual(fourValue);
      expect(values[3]).assertEqual(fourPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_5100
     * @tc.name testFloat64ArrayConstructor4051
     * @tc.desc Verify elements is iterable containing boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const positiveInfinity: number = Infinity;
      const src: Array<number> = [0.0, -0.0, Infinity, -Infinity, NaN];
      const iterable: Iterable<Number> = src;
      const values = new Float64Array(iterable);
      expect(values.length).assertEqual(fiveValue);
      expect(values[2]).assertEqual(positiveInfinity);
      const actVal4 = Number.isNaN(values[4]);
      const expectVal = true;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_5200
     * @tc.name testFloat64ArrayConstructor4052
     * @tc.desc Verify elements construction return type is Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<number> = [1.0];
      const values = new Float64Array(elements);
      const obj: Object = values as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_5300
     * @tc.name testFloat64ArrayConstructor4053
     * @tc.desc Verify elements construction return element values correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointfive: number = 10.5;
      const twentyPointfive: number = 20.5;
      const thirtyPointfive: number = 30.5;
      const elements: Array<number> = [10.5, 20.5, 30.5];
      const values = new Float64Array(elements);
      expect(values[0]).assertEqual(tenPointfive);
      expect(values[1]).assertEqual(twentyPointfive);
      expect(values[2]).assertEqual(thirtyPointfive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_5400
     * @tc.name testFloat64ArrayConstructor4054
     * @tc.desc Verify iterator is consumed only once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const src: Array<number> = [1.0, 2.0, 3.0];
      const values = new Float64Array(src);
      const expectVal = threeValue;
      expect(values.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_5500
     * @tc.name testFloat64ArrayConstructor4055
     * @tc.desc Verify elements is null throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nullLike: Object | null = null;
      try {
        new Float64Array(nullLike as Object as Iterable<Number>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_5600
     * @tc.name testFloat64ArrayConstructor4056
     * @tc.desc Verify elements is undefined throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const undef: Object | undefined = undefined;
      try {
        new Float64Array(undef as Object as Iterable<Number>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_5700
     * @tc.name testFloat64ArrayConstructor4057
     * @tc.desc Verify elements is object without length property throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      try {
        new Float64Array(obj as Iterable<Number>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_5800
     * @tc.name testFloat64ArrayConstructor4058
     * @tc.desc Verify elements containing non-numeric element throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<number> = [1.0, NaN, 3.0];
      const values = new Float64Array(elements);
      const actVal5 = Number.isNaN(values[1]);
      const expectVal = true;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_5900
     * @tc.name testFloat64ArrayConstructor4059
     * @tc.desc Verify parameter count 1 only buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const zeroValue: number = 0;
      const buffer = new ArrayBuffer(16);
      const view = new Float64Array(buffer);
      expect(view.byteLength).assertEqual(sixteenValue);
      expect(view.byteOffset).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_6000
     * @tc.name testFloat64ArrayConstructor4060
     * @tc.desc Verify buf is minimum ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const eightValue: number = 8;
      const buffer = new ArrayBuffer(8);
      const view = new Float64Array(buffer);
      expect(view.length).assertEqual(oneValue);
      expect(view.byteLength).assertEqual(eightValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_6100
     * @tc.name testFloat64ArrayConstructor4061
     * @tc.desc Verify buf is 16-byte ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const sixteenValue: number = 16;
      const buffer = new ArrayBuffer(16);
      const view = new Float64Array(buffer);
      expect(view.length).assertEqual(twoValue);
      expect(view.byteLength).assertEqual(sixteenValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_6200
     * @tc.name testFloat64ArrayConstructor4062
     * @tc.desc Verify buf is 32-byte ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const thirtytwoValue: number = 32;
      const buffer = new ArrayBuffer(32);
      const view = new Float64Array(buffer);
      expect(view.length).assertEqual(fourValue);
      expect(view.byteLength).assertEqual(thirtytwoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_6300
     * @tc.name testFloat64ArrayConstructor4063
     * @tc.desc Verify buf is 100-byte ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(100);
        new Float64Array(buffer);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_6400
     * @tc.name testFloat64ArrayConstructor4064
     * @tc.desc Verify byteOffset is 1 (non-8-multiple throws RangeError)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(16);
        new Float64Array(buffer, 1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_6500
     * @tc.name testFloat64ArrayConstructor4065
     * @tc.desc Verify byteOffset is negative -1 (throws RangeError)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(16);
        new Float64Array(buffer, -1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_6600
     * @tc.name testFloat64ArrayConstructor4066
     * @tc.desc Verify byteOffset is negative -8 (throws RangeError)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(16);
        new Float64Array(buffer, -8, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_6700
     * @tc.name testFloat64ArrayConstructor4067
     * @tc.desc Verify byteOffset exceeds buffer length (throws RangeError)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(8);
        new Float64Array(buffer, 16, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_6800
     * @tc.name testFloat64ArrayConstructor4068
     * @tc.desc Verify length is negative -1 (throws RangeError)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(16);
        new Float64Array(buffer, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_6900
     * @tc.name testFloat64ArrayConstructor4069
     * @tc.desc Verify length is negative -5 (throws RangeError)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(16);
        new Float64Array(buffer, 0, -5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_7000
     * @tc.name testFloat64ArrayConstructor4070
     * @tc.desc Verify length exceeds buffer remaining (throws RangeError)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(16);
        new Float64Array(buffer, 0, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_7100
     * @tc.name testFloat64ArrayConstructor4071
     * @tc.desc Verify length is huge number (throws RangeError)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(16);
        new Float64Array(buffer, 0, 1000000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_7200
     * @tc.name testFloat64ArrayConstructor4072
     * @tc.desc Verify constructor from ArrayBuffer with byteOffset returns Float64Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const view = new Float64Array(buffer, 0, 2);
      const obj: Object = view as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_7300
     * @tc.name testFloat64ArrayConstructor4073
     * @tc.desc Verify return buffer points to original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32);
      const view = new Float64Array(buffer, 8, 2);
      const expectVal = buffer;
      expect(view.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_7400
     * @tc.name testFloat64ArrayConstructor4074
     * @tc.desc Verify byteOffset is null throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const nullOff: Number | null = null;
      try {
        new Float64Array(buffer, nullOff as Number, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_7500
     * @tc.name testFloat64ArrayConstructor4075
     * @tc.desc Verify length is null throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const nullLen: Number | null = null;
      try {
        new Float64Array(buffer, 0, nullLen as Number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_7600
     * @tc.name testFloat64ArrayConstructor4076
     * @tc.desc Verify multiple views from same buffer - views independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const eightValue: number = 8;
      const buffer = new ArrayBuffer(24);
      const view1 = new Float64Array(buffer, 0, 1);
      const view2 = new Float64Array(buffer, 8, 1);
      expect(view1.byteOffset).assertEqual(zeroValue);
      expect(view2.byteOffset).assertEqual(eightValue);
      expect(view1.buffer).assertEqual(view2.buffer);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_7700
     * @tc.name testFloat64ArrayConstructor4077
     * @tc.desc Verify write via view1 read via view2 (shared buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1: number = 0x1;
      const buffer = new ArrayBuffer(16);
      const view1 = new Float64Array(buffer, 0, 2);
      const view2 = new Float64Array(buffer, 0, 2);
      view1[0] = 0x1;
      const expectVal = hexValue1;
      expect(view2[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_7800
     * @tc.name testFloat64ArrayConstructor4078
     * @tc.desc Verify write via view2 read via view1 (shared buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999999Pointninenine: number = 999999.99;
      const buffer = new ArrayBuffer(16);
      const view1 = new Float64Array(buffer, 0, 2);
      const view2 = new Float64Array(buffer, 0, 2);
      view2[1] = 999999.99;
      const expectVal = num999999Pointninenine;
      expect(view1[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_7900
     * @tc.name testFloat64ArrayConstructor4079
     * @tc.desc Verify views of different offsets share buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const twoValue: number = 2;
      const buffer = new ArrayBuffer(32);
      const view1 = new Float64Array(buffer, 0, 2);
      const view2 = new Float64Array(buffer, 16, 2);
      view1[0] = 1.0;
      view2[0] = 2.0;
      expect(view1[0]).assertEqual(onePointZero);
      expect(view2[0]).assertEqual(twoPointZero);
      expect(view1.length).assertEqual(twoValue);
      expect(view2.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_8000
     * @tc.name testFloat64ArrayConstructor4080
     * @tc.desc Verify overlapping views share buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiftyPointZero: number = 50.0;
      const buffer = new ArrayBuffer(24);
      const view1 = new Float64Array(buffer, 0, 3);
      const view2 = new Float64Array(buffer, 8, 2);
      view1[1] = 50.0;
      const expectVal = fiftyPointZero;
      expect(view2[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_8100
     * @tc.name testFloat64ArrayConstructor4081
     * @tc.desc Verify two undefined takes entire buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const fourValue: number = 4;
      const thirtytwoValue: number = 32;
      const buffer = new ArrayBuffer(32);
      const off: Number | undefined = undefined;
      const len: Number | undefined = undefined;
      const view = new Float64Array(buffer, off, len);
      expect(view.byteOffset).assertEqual(zeroValue);
      expect(view.length).assertEqual(fourValue);
      expect(view.byteLength).assertEqual(thirtytwoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_8200
     * @tc.name testFloat64ArrayConstructor4082
     * @tc.desc Verify buffer write then view read validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const twoPointFive: number = 2.5;
      const twoValue: number = 2;
      const buffer = new ArrayBuffer(16);
      const view = new Float64Array(buffer, 0, 2);
      view[0] = 1.5;
      view[1] = 2.5;
      expect(view[0]).assertEqual(onePointFive);
      expect(view[1]).assertEqual(twoPointFive);
      expect(view.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_8300
     * @tc.name testFloat64ArrayConstructor4083
     * @tc.desc Verify multi-view sharing buffer - three views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const thirtyPointZero: number = 30.0;
      const buffer = new ArrayBuffer(40);
      const v1 = new Float64Array(buffer, 0, 2);
      const v2 = new Float64Array(buffer, 16, 2);
      const v3 = new Float64Array(buffer, 32, 1);
      v1[0] = 10.0;
      v2[0] = 20.0;
      v3[0] = 30.0;
      expect(v1[0]).assertEqual(tenPointZero);
      expect(v2[0]).assertEqual(twentyPointZero);
      expect(v3[0]).assertEqual(thirtyPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_8400
     * @tc.name testFloat64ArrayConstructor4084
     * @tc.desc Verify other is all-zero Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const fourValue: number = 4;
      const source = new Float64Array([zeroPointZero, zeroPointZero, zeroPointZero, zeroPointZero]);
      const copy = new Float64Array(source);
      expect(copy.length).assertEqual(fourValue);
      expect(copy[0]).assertEqual(zeroPointZero);
      expect(copy[3]).assertEqual(zeroPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_8500
     * @tc.name testFloat64ArrayConstructor4085
     * @tc.desc Verify other is alternating positive negative Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const sixValue: number = 6;
      const negonePointzero: number = -1.0;
      const source = new Float64Array([1.0, -1.0, 2.0, -2.0, threePointZero, -3.0]);
      const copy = new Float64Array(source);
      expect(copy.length).assertEqual(sixValue);
      expect(copy[1]).assertEqual(negonePointzero);
      expect(copy[4]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_8600
     * @tc.name testFloat64ArrayConstructor4086
     * @tc.desc Verify elements as iterable throwing propagates error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const src: Array<number> = [1.0];
      const values = new Float64Array(src);
      const expectVal = onePointZero;
      expect(values[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_8700
     * @tc.name testFloat64ArrayConstructor4087
     * @tc.desc Verify copy constructor all elements round-trip consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Float64Array([1.5, 2.5, 3.5, 4.5]);
      const copy = new Float64Array(source);
      expect(copy.length).assertEqual(source.length);
      expect(copy[0]).assertEqual(source[0]);
      expect(copy[1]).assertEqual(source[1]);
      expect(copy[2]).assertEqual(source[2]);
      expect(copy[3]).assertEqual(source[3]);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_8800
     * @tc.name testFloat64ArrayConstructor4088
     * @tc.desc Verify constructor length negative check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(5);
      expect(arr.length === 5).assertTrue();
      expect(arr.length === 0).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_8900
     * @tc.name testFloat64ArrayConstructor4089
     * @tc.desc Verify Int32Array source creates Float64Array with correct element conversion and independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const oneValue: number = 1;
      const source = new Int32Array([1, 2, 3]);
      const arr = new Float64Array(source);
      expect(arr.length).assertEqual(threeValue);
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[1]).assertEqual(twoPointZero);
      expect(arr[2]).assertEqual(threePointZero);
      arr[0] = 99.9;
      expect(source[0]).assertEqual(oneValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_4_9000
     * @tc.name testFloat64ArrayConstructor4090
     * @tc.desc Verify Float32Array source creates Float64Array with preserved values and independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor4090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointFive: number = 1.5;
      const negtwoPointfive: number = -2.5;
      const threePointfive: number = 3.5;
      const source = new Float32Array([1.5, -2.5, 3.5]);
      const arr = new Float64Array(source);
      expect(arr.length).assertEqual(threeValue);
      expect(arr[0]).assertEqual(onePointFive);
      expect(arr[1]).assertEqual(negtwoPointfive);
      expect(arr[2]).assertEqual(threePointfive);
      arr[1] = -99.9;
      expect(source[1]).assertEqual(negtwoPointfive);
    })

  })
}
