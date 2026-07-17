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

export default function Float64ArrayConstructor1Test(): void {
  describe('Float64ArrayConstructor1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_0100
     * @tc.name testFloat64ArrayConstructor1001
     * @tc.desc Verify overload 5 constructor with FixedArray parameter creates array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const numbers: FixedArray<number> = [1.0, 2.0, 3.0];
      const values = new Float64Array(numbers);
      const expectVal = threeValue;
      expect(values.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_0200
     * @tc.name testFloat64ArrayConstructor1002
     * @tc.desc Verify overload 9 constructor with ArrayBuffer and int offset creates view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const buffer = new ArrayBuffer(16);
      const view = new Float64Array(buffer, 0);
      const expectVal = twoValue;
      expect(view.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_0300
     * @tc.name testFloat64ArrayConstructor1003
     * @tc.desc Verify overload 13 constructor with single ArrayBuffer parameter creates view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const buffer = new ArrayBuffer(16);
      const view = new Float64Array(buffer);
      const expectVal = sixteenValue;
      expect(view.byteLength).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_0400
     * @tc.name testFloat64ArrayConstructor1004
     * @tc.desc Verify overload 1 no-arg constructor returns Float64Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Float64Array();
      const obj: Object = empty as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_0500
     * @tc.name testFloat64ArrayConstructor1005
     * @tc.desc Verify overload 1 no-arg constructor buffer exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Float64Array();
      const bufObj: Object = empty.buffer as Object;
      let isAB: boolean = false;
      if (bufObj instanceof ArrayBuffer) {
        isAB = true;
      }
      const expectVal = true;
      expect(isAB).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_0600
     * @tc.name testFloat64ArrayConstructor1006
     * @tc.desc Verify overload 1 no-arg constructor creates independent instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array();
      const b = new Float64Array();
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_0700
     * @tc.name testFloat64ArrayConstructor1007
     * @tc.desc Verify overload 1 no-arg constructor buffer is independent ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array();
      const b = new Float64Array();
      expect(a.buffer).not().assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_0800
     * @tc.name testFloat64ArrayConstructor1008
     * @tc.desc Verify overload 5 FixedArray three elements deep copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const numbers: FixedArray<number> = [1.0, 2.0, 3.0];
      const values = new Float64Array(numbers);
      expect(values[0]).assertEqual(onePointZero);
      expect(values[1]).assertEqual(twoPointZero);
      expect(values[2]).assertEqual(threePointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_0900
     * @tc.name testFloat64ArrayConstructor1009
     * @tc.desc Verify overload 5 FixedArray original unchanged after deep copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const numbers: FixedArray<number> = [1.0, 2.0, 3.0];
      const values = new Float64Array(numbers);
      const expectVal = onePointZero;
      expect(numbers[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_1000
     * @tc.name testFloat64ArrayConstructor1010
     * @tc.desc Verify overload 5 FixedArray single element construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const fillValue42: number = 42.0;
      const numbers: FixedArray<number> = [42.0];
      const values = new Float64Array(numbers);
      expect(values.length).assertEqual(oneValue);
      const actVal1 = values.$_get(0);
      const expectVal = fillValue42;
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_1100
     * @tc.name testFloat64ArrayConstructor1011
     * @tc.desc Verify overload 5 FixedArray containing negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const negtwoPointzero: number = -2.0;
      const numbers: FixedArray<number> = [-1.0, -2.0, -3.0];
      const values = new Float64Array(numbers);
      expect(values[0]).assertEqual(negonePointzero);
      expect(values[1]).assertEqual(negtwoPointzero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_1200
     * @tc.name testFloat64ArrayConstructor1012
     * @tc.desc Verify overload 5 FixedArray containing zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const threeValue: number = 3;
      const numbers: FixedArray<number> = [0.0, 0.0, 0.0];
      const values = new Float64Array(numbers);
      expect(values[0]).assertEqual(zeroPointZero);
      expect(values.length).assertEqual(threeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_1300
     * @tc.name testFloat64ArrayConstructor1013
     * @tc.desc Verify overload 5 FixedArray containing min positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const numbers: FixedArray<number> = [5e-324, 1e-323];
      const values = new Float64Array(numbers);
      const expectVal = doubleMinValue;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_1400
     * @tc.name testFloat64ArrayConstructor1014
     * @tc.desc Verify overload 5 FixedArray containing Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const numbers: FixedArray<number> = [1.7976931348623157e+308];
      const values = new Float64Array(numbers);
      const expectVal = doubleMaxValue;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_1500
     * @tc.name testFloat64ArrayConstructor1015
     * @tc.desc Verify overload 5 FixedArray containing positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const numbers: FixedArray<number> = [0.0];
      const values = new Float64Array(numbers);
      const expectVal = zeroPointZero;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_1600
     * @tc.name testFloat64ArrayConstructor1016
     * @tc.desc Verify overload 5 FixedArray containing negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const numbers: FixedArray<number> = [-0.0];
      const values = new Float64Array(numbers);
      const expectVal = negativeZero;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_1700
     * @tc.name testFloat64ArrayConstructor1017
     * @tc.desc Verify overload 5 FixedArray containing Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const numbers: FixedArray<number> = [Infinity];
      const values = new Float64Array(numbers);
      const expectVal = positiveInfinity;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_1800
     * @tc.name testFloat64ArrayConstructor1018
     * @tc.desc Verify overload 5 FixedArray containing negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const numbers: FixedArray<number> = [-Infinity];
      const values = new Float64Array(numbers);
      const expectVal = negativeInfinity;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_1900
     * @tc.name testFloat64ArrayConstructor1019
     * @tc.desc Verify overload 5 FixedArray containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: FixedArray<number> = [NaN];
      const values = new Float64Array(numbers);
      const actVal2 = Number.isNaN(values[0]);
      const expectVal = true;
      expect(actVal2).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_2000
     * @tc.name testFloat64ArrayConstructor1020
     * @tc.desc Verify overload 5 FixedArray containing mixed special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const numbers: FixedArray<number> = [0.0, Infinity, -Infinity, NaN, -0.0];
      const values = new Float64Array(numbers);
      expect(values.length).assertEqual(fiveValue);
      expect(values[1]).assertEqual(positiveInfinity);
      expect(values[2]).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_2100
     * @tc.name testFloat64ArrayConstructor1021
     * @tc.desc Verify overload 5 FixedArray int elements implicit conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const numbers: FixedArray<int> = [1, 2, 3];
      const values = new Float64Array(numbers);
      expect(values[0]).assertEqual(onePointZero);
      expect(values[1]).assertEqual(twoPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_2200
     * @tc.name testFloat64ArrayConstructor1022
     * @tc.desc Verify overload 5 FixedArray long array construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const eightPointZero: number = 8.0;
      const numbers: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0];
      const values = new Float64Array(numbers);
      expect(values.length).assertEqual(eightValue);
      expect(values[7]).assertEqual(eightPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_2300
     * @tc.name testFloat64ArrayConstructor1023
     * @tc.desc Verify overload 5 FixedArray scientific notation literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const sciValue10e3082: number = 1.0e+308;
      const numbers: FixedArray<number> = [1.0e-308, 1.0e+308, 2.5e-100];
      const values = new Float64Array(numbers);
      expect(values[0]).assertEqual(sciValue10e308);
      expect(values[1]).assertEqual(sciValue10e3082);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_2400
     * @tc.name testFloat64ArrayConstructor1024
     * @tc.desc Verify overload 5 FixedArray decimal precision boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number = 0.1 + 0.2;
      const numbers: FixedArray<number> = [src];
      const values = new Float64Array(numbers);
      expect(values[0]).assertEqual(0.30000000000000004);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_2500
     * @tc.name testFloat64ArrayConstructor1025
     * @tc.desc Verify overload 5 FixedArray modifying copy does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const numbers: FixedArray<number> = [1.0, 2.0, 3.0];
      const values = new Float64Array(numbers);
      values[0] = 999.0;
      const expectVal = onePointZero;
      expect(numbers[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_2600
     * @tc.name testFloat64ArrayConstructor1026
     * @tc.desc Verify overload 5 FixedArray modifying original does not affect copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const numbers: FixedArray<number> = [1.0, 2.0, 3.0];
      const values = new Float64Array(numbers);
      const expectVal = onePointZero;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_2700
     * @tc.name testFloat64ArrayConstructor1027
     * @tc.desc Verify overload 9 ArrayBuffer with 8 offset int creates view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const eightValue: number = 8;
      const buffer = new ArrayBuffer(24);
      const view = new Float64Array(buffer, 8);
      expect(view.length).assertEqual(twoValue);
      expect(view.byteOffset).assertEqual(eightValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_2800
     * @tc.name testFloat64ArrayConstructor1028
     * @tc.desc Verify overload 9 ArrayBuffer with 16 offset int creates view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const buffer = new ArrayBuffer(24);
      const view = new Float64Array(buffer, 16);
      const expectVal = oneValue;
      expect(view.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_2900
     * @tc.name testFloat64ArrayConstructor1029
     * @tc.desc Verify overload 9 offset 7 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(16);
        new Float64Array(buffer, 7);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_3000
     * @tc.name testFloat64ArrayConstructor1030
     * @tc.desc Verify overload 9 offset beyond buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(8);
        new Float64Array(buffer, 16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_3100
     * @tc.name testFloat64ArrayConstructor1031
     * @tc.desc Verify overload 9 view shares buffer with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const view = new Float64Array(buffer, 0);
      const expectVal = buffer;
      expect(view.buffer).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_3200
     * @tc.name testFloat64ArrayConstructor1032
     * @tc.desc Verify overload 9 writing to view affects original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const buffer = new ArrayBuffer(16);
      const view = new Float64Array(buffer, 0);
      view[0] = 1.0;
      const checkView = new Float64Array(buffer, 0);
      const expectVal = onePointZero;
      expect(checkView[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_3300
     * @tc.name testFloat64ArrayConstructor1033
     * @tc.desc Verify overload 9 multiple views share buffer with mutual visibility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const buffer = new ArrayBuffer(16);
      const view1 = new Float64Array(buffer, 0);
      const view2 = new Float64Array(buffer, 0);
      view1[0] = 3.14;
      const expectVal = piApprox;
      expect(view2[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_3400
     * @tc.name testFloat64ArrayConstructor1034
     * @tc.desc Verify overload 9 different offset views share buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointsevenone: number = 2.71;
      const buffer = new ArrayBuffer(24);
      const view1 = new Float64Array(buffer, 0);
      const view2 = new Float64Array(buffer, 8);
      view1[1] = 2.71;
      const expectVal = twoPointsevenone;
      expect(view2[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_3500
     * @tc.name testFloat64ArrayConstructor1035
     * @tc.desc Verify overload 9 offset 0x10 hex offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const twoValue: number = 2;
      const buffer = new ArrayBuffer(32);
      const view = new Float64Array(buffer, 0x10);
      expect(view.byteOffset).assertEqual(sixteenValue);
      expect(view.length).assertEqual(twoValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_3600
     * @tc.name testFloat64ArrayConstructor1036
     * @tc.desc Verify overload 9 offset 0o20 octal offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const buffer = new ArrayBuffer(32);
      const view = new Float64Array(buffer, 0o20);
      const expectVal = sixteenValue;
      expect(view.byteOffset).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_3700
     * @tc.name testFloat64ArrayConstructor1037
     * @tc.desc Verify overload 9 offset 0b1000 binary offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const buffer = new ArrayBuffer(32);
      const view = new Float64Array(buffer, 0b1000);
      const expectVal = eightValue;
      expect(view.byteOffset).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_3800
     * @tc.name testFloat64ArrayConstructor1038
     * @tc.desc Verify overload 13 ArrayBuffer single parameter creates full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const twoValue: number = 2;
      const buffer = new ArrayBuffer(16);
      const view = new Float64Array(buffer);
      expect(view.byteLength).assertEqual(sixteenValue);
      expect(view.length).assertEqual(twoValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_3900
     * @tc.name testFloat64ArrayConstructor1039
     * @tc.desc Verify overload 13 ArrayLike number array construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointZero: number = 1.0;
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      expect(values.length).assertEqual(threeValue);
      expect(values[0]).assertEqual(onePointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_4000
     * @tc.name testFloat64ArrayConstructor1040
     * @tc.desc Verify overload 13 ArrayLike single element construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const fillValue42: number = 42.0;
      const src: Array<number> = [42.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      expect(values.length).assertEqual(oneValue);
      const actVal3 = values.$_get(0);
      const expectVal = fillValue42;
      expect(actVal3).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_4100
     * @tc.name testFloat64ArrayConstructor1041
     * @tc.desc Verify overload 13 ArrayLike with special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const src: Array<number> = [Infinity, -Infinity, NaN];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      expect(values[0]).assertEqual(positiveInfinity);
      expect(values[1]).assertEqual(negativeInfinity);
      const actVal4 = Number.isNaN(values[2]);
      const expectVal = true;
      expect(actVal4).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_4200
     * @tc.name testFloat64ArrayConstructor1042
     * @tc.desc Verify overload 13 ArrayLike with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const src: Array<number> = [-1.0, -2.0, -3.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      const expectVal = negonePointzero;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_4300
     * @tc.name testFloat64ArrayConstructor1043
     * @tc.desc Verify overload 13 ArrayLike with zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const src: Array<number> = [0.0, -0.0, 0.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      const expectVal = zeroPointZero;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_4400
     * @tc.name testFloat64ArrayConstructor1044
     * @tc.desc Verify overload 13 ArrayLike with max and min values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const doubleMinValue: number = 5e-324;
      const src: Array<number> = [1.7976931348623157e+308, 5e-324];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      expect(values[0]).assertEqual(doubleMaxValue);
      expect(values[1]).assertEqual(doubleMinValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_4500
     * @tc.name testFloat64ArrayConstructor1045
     * @tc.desc Verify overload 13 ArrayLike deep copy independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      values[0] = 999.0;
      const expectVal = onePointZero;
      expect(src[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_4600
     * @tc.name testFloat64ArrayConstructor1046
     * @tc.desc Verify overload 13 ArrayLike long array construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenValue: number = 10;
      const tenPointZero: number = 10.0;
      const src: Array<number> = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      expect(values.length).assertEqual(tenValue);
      expect(values[9]).assertEqual(tenPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_4700
     * @tc.name testFloat64ArrayConstructor1047
     * @tc.desc Verify overload 13 ArrayLike scientific notation construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const src: Array<number> = [1.0e-308, 1.0e+308, 2.5e-100];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      const expectVal = sciValue10e308;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_4800
     * @tc.name testFloat64ArrayConstructor1048
     * @tc.desc Verify overload 13 ArrayLike decimal precision boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 0.1 + 0.2;
      const src: Array<number> = [v];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      expect(values[0]).assertEqual(0.30000000000000004);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_4900
     * @tc.name testFloat64ArrayConstructor1049
     * @tc.desc Verify overload 13 ArrayLike with integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const fivePointZero: number = 5.0;
      const src: Array<number> = [1, 2, 3, 4, 5];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      expect(values[0]).assertEqual(onePointZero);
      expect(values[4]).assertEqual(fivePointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_5000
     * @tc.name testFloat64ArrayConstructor1050
     * @tc.desc Verify overload 13 ArrayLike with mixed positive and negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum999999Pointninenine: number = -999999.99;
      const num999999Pointninenine: number = 999999.99;
      const src: Array<number> = [-999999.99, 0.0, 999999.99];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      expect(values[0]).assertEqual(negnum999999Pointninenine);
      expect(values[2]).assertEqual(num999999Pointninenine);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_5100
     * @tc.name testFloat64ArrayConstructor1051
     * @tc.desc Verify overload 13 ArrayBuffer shares original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const view = new Float64Array(buffer);
      const expectVal = buffer;
      expect(view.buffer).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_5200
     * @tc.name testFloat64ArrayConstructor1052
     * @tc.desc Verify overload 13 ArrayBuffer view write affects original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const buffer = new ArrayBuffer(16);
      const view = new Float64Array(buffer);
      view[0] = 3.14;
      const check = new Float64Array(buffer);
      const expectVal = piApprox;
      expect(check[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_5300
     * @tc.name testFloat64ArrayConstructor1053
     * @tc.desc Verify overload 13 ArrayLike modifying copy does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      values[1] = 999.0;
      const expectVal = twoPointZero;
      expect(src[1]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_5400
     * @tc.name testFloat64ArrayConstructor1054
     * @tc.desc Verify overload 13 ArrayLike modifying source does not affect copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      const expectVal = onePointZero;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_5500
     * @tc.name testFloat64ArrayConstructor1055
     * @tc.desc Verify overload 13 ArrayLike with null throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nullLike: Object | null = null;
      try {
        new Float64Array(nullLike as Object as ArrayLike<Number>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_5600
     * @tc.name testFloat64ArrayConstructor1056
     * @tc.desc Verify overload 13 ArrayLike with undefined throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const undef: Object | undefined = undefined;
      try {
        new Float64Array(undef as Object as ArrayLike<Number>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_5700
     * @tc.name testFloat64ArrayConstructor1057
     * @tc.desc Verify overload 9 multi-view write parent read child sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num123Pointfourfivesix: number = 123.456;
      const buffer = new ArrayBuffer(24);
      const parent = new Float64Array(buffer, 0);
      const child = new Float64Array(buffer, 8);
      parent[1] = 123.456;
      const expectVal = num123Pointfourfivesix;
      expect(child[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_5800
     * @tc.name testFloat64ArrayConstructor1058
     * @tc.desc Verify overload 9 multi-view write child read parent sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum888Pointeighteight: number = -888.88;
      const buffer = new ArrayBuffer(24);
      const parent = new Float64Array(buffer, 0);
      const child = new Float64Array(buffer, 8);
      child[0] = -888.88;
      const expectVal = negnum888Pointeighteight;
      expect(parent[1]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_5900
     * @tc.name testFloat64ArrayConstructor1059
     * @tc.desc Verify overload 9 three views interactive modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const buffer = new ArrayBuffer(32);
      const v1 = new Float64Array(buffer, 0);
      const v2 = new Float64Array(buffer, 8);
      const v3 = new Float64Array(buffer, 16);
      v1[0] = 1.0;
      v2[0] = 2.0;
      v3[0] = 3.0;
      expect(v1[1]).assertEqual(twoPointZero);
      expect(v2[1]).assertEqual(threePointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_6000
     * @tc.name testFloat64ArrayConstructor1060
     * @tc.desc Verify overload 5 FixedArray containing 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num2147483647Pointzero: number = 2147483647.0;
      const numbers: FixedArray<number> = [2147483647.0];
      const values = new Float64Array(numbers);
      const expectVal = num2147483647Pointzero;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_6100
     * @tc.name testFloat64ArrayConstructor1061
     * @tc.desc Verify overload 5 FixedArray containing -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483648Pointzero: number = -2147483648.0;
      const numbers: FixedArray<number> = [-2147483648.0];
      const values = new Float64Array(numbers);
      const expectVal = negnum2147483648Pointzero;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_6200
     * @tc.name testFloat64ArrayConstructor1062
     * @tc.desc Verify overload 5 FixedArray containing Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const numbers: FixedArray<number> = [9007199254740991.0];
      const values = new Float64Array(numbers);
      const expectVal = maxSafeIntegerValue;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_6300
     * @tc.name testFloat64ArrayConstructor1063
     * @tc.desc Verify overload 5 FixedArray containing Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const numbers: FixedArray<number> = [-9007199254740991.0];
      const values = new Float64Array(numbers);
      const expectVal = negativeMaxSafeIntegerValue;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_6400
     * @tc.name testFloat64ArrayConstructor1064
     * @tc.desc Verify overload 13 ArrayLike containing 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num2147483647Pointzero: number = 2147483647.0;
      const src: Array<number> = [2147483647.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      const expectVal = num2147483647Pointzero;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_6500
     * @tc.name testFloat64ArrayConstructor1065
     * @tc.desc Verify overload 13 ArrayLike containing -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483648Pointzero: number = -2147483648.0;
      const src: Array<number> = [-2147483648.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      const expectVal = negnum2147483648Pointzero;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_6600
     * @tc.name testFloat64ArrayConstructor1066
     * @tc.desc Verify overload 13 ArrayLike containing 9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const src: Array<number> = [9007199254740991.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      const expectVal = maxSafeIntegerValue;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_6700
     * @tc.name testFloat64ArrayConstructor1067
     * @tc.desc Verify overload 9 offset 24 alignment success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourValue: number = 24;
      const twoValue: number = 2;
      const buffer = new ArrayBuffer(40);
      const view = new Float64Array(buffer, 24);
      expect(view.byteOffset).assertEqual(twentyfourValue);
      expect(view.length).assertEqual(twoValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_6800
     * @tc.name testFloat64ArrayConstructor1068
     * @tc.desc Verify overload 9 negative offset -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(16);
        new Float64Array(buffer, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_6900
     * @tc.name testFloat64ArrayConstructor1069
     * @tc.desc Verify overload 13 ArrayLike containing overflow value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const src: Array<number> = [Infinity];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      const expectVal = positiveInfinity;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_7000
     * @tc.name testFloat64ArrayConstructor1070
     * @tc.desc Verify overload 5 FixedArray constructor return type is Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: FixedArray<number> = [1.0];
      const values = new Float64Array(numbers);
      const obj: Object = values as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_7100
     * @tc.name testFloat64ArrayConstructor1071
     * @tc.desc Verify overload 9 ArrayBuffer constructor return type is Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const view = new Float64Array(buffer, 0);
      const obj: Object = view as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_7200
     * @tc.name testFloat64ArrayConstructor1072
     * @tc.desc Verify overload 13 ArrayLike constructor return type is Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      const obj: Object = values as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_7300
     * @tc.name testFloat64ArrayConstructor1073
     * @tc.desc Verify overload 13 ArrayBuffer constructor returns view with isView true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const view = new Float64Array(buffer);
      const obj: Object = view as Object;
      let isF64: boolean = false;
      if (obj instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_7400
     * @tc.name testFloat64ArrayConstructor1074
     * @tc.desc Verify overload 9 byteOffset plus byteLength exceeds buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(16);
        new Float64Array(buffer, 8, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_7500
     * @tc.name testFloat64ArrayConstructor1075
     * @tc.desc Verify overload 5 FixedArray Number generic construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointZero: number = 1.0;
      const numbers: FixedArray<Number> = [1.0, 2.0, 3.0];
      const values = new Float64Array(numbers);
      expect(values.length).assertEqual(threeValue);
      expect(values[0]).assertEqual(onePointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_7600
     * @tc.name testFloat64ArrayConstructor1076
     * @tc.desc Verify overload 9 ArrayBuffer offset Number.MAX_SAFE_INTEGER throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(16);
        new Float64Array(buffer, 9007199254740991);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_7700
     * @tc.name testFloat64ArrayConstructor1077
     * @tc.desc Verify overload 9 ArrayBuffer offset Number.MIN_SAFE_INTEGER throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(16);
        new Float64Array(buffer, -9007199254740991);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_7800
     * @tc.name testFloat64ArrayConstructor1078
     * @tc.desc Verify overload 13 ArrayLike with undefined element becomes NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, NaN, 3.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      const actVal5 = Number.isNaN(values[1]);
      const expectVal = true;
      expect(actVal5).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_7900
     * @tc.name testFloat64ArrayConstructor1079
     * @tc.desc Verify overload 13 ArrayLike containing zero element copies value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const src: Array<number> = [1.0, 0.0, 3.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      const expectVal = zeroPointZero;
      expect(values[1]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_8000
     * @tc.name testFloat64ArrayConstructor1080
     * @tc.desc Verify overload 13 ArrayLike preserves NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const src: Array<number> = [1.0, NaN, 3.0];
      const arrayLike: ArrayLike<Number> = src;
      const values = new Float64Array(arrayLike);
      const expectVal = threeValue;
      expect(values.length).assertEqual(expectVal);
      const actVal = Number.isNaN(values[1]);
      expect(actVal).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_8100
     * @tc.name testFloat64ArrayConstructor1081
     * @tc.desc Verify overload 13 ArrayLike shared buffer write visibility across views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointfourone: number = 1.41;
      const ninePointninenine: number = 9.99;
      const buffer = new ArrayBuffer(24);
      const parent = new Float64Array(buffer, 0);
      const child = new Float64Array(buffer, 8);
      parent[1] = 1.41;
      expect(child[0]).assertEqual(onePointfourone);
      child[0] = 9.99;
      expect(parent[1]).assertEqual(ninePointninenine);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_8200
     * @tc.name testFloat64ArrayConstructor1082
     * @tc.desc Verify constructor length 3 initializes first element to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(3);
      expect(arr[0]).assertEqual(0.0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_8300
     * @tc.name testFloat64ArrayConstructor1083
     * @tc.desc Verify constructor with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num255Value: number = 255;
      const arr = new Float64Array(0xFF);
      const expectVal = num255Value;
      expect(arr.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_8400
     * @tc.name testFloat64ArrayConstructor1084
     * @tc.desc Verify constructor with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num255Value: number = 255;
      const arr = new Float64Array(0b11111111);
      const expectVal = num255Value;
      expect(arr.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CONSTRUCTOR_1_8500
     * @tc.name testFloat64ArrayConstructor1085
     * @tc.desc Verify constructor with Infinity as length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayConstructor1085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float64Array(Double.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

  })
}
