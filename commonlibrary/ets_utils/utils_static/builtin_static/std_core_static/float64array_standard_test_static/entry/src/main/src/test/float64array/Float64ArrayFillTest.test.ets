'use static'
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
import Utils from './../Util.test';

export default function float64ArrayFillTest(): void {
  describe('Float64ArrayFillTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0010
     * @tc.name testFloat64ArrayFill001
     * @tc.desc Verify fill with zero parameters fills all elements with default 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(3);
      arr.fill(zeroPointZero);
      const actVal1 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal1).assertEqual(expectVal);
      const actVal2 = arr.$_get(1);
      const expectVal2 = zeroPointZero;
      expect(actVal2).assertEqual(expectVal2);
      const actVal3 = arr.$_get(2);
      const expectVal3 = zeroPointZero;
      expect(actVal3).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0020
     * @tc.name testFloat64ArrayFill002
     * @tc.desc Verify fill with single parameter fills all elements with the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(3);
      arr.fill(onePointZero);
      const actVal4 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal4).assertEqual(expectVal);
      const actVal5 = arr.$_get(1);
      const expectVal2 = onePointZero;
      expect(actVal5).assertEqual(expectVal2);
      const actVal6 = arr.$_get(2);
      const expectVal3 = onePointZero;
      expect(actVal6).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0030
     * @tc.name testFloat64ArrayFill003
     * @tc.desc Verify fill with value and start fills from start to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointFive: number = 2.5;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(twoPointFive, 2);
      const actVal7 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal7).assertEqual(expectVal);
      const actVal8 = arr.$_get(1);
      const expectVal2 = zeroPointZero;
      expect(actVal8).assertEqual(expectVal2);
      const actVal9 = arr.$_get(2);
      const expectVal3 = twoPointFive;
      expect(actVal9).assertEqual(expectVal3);
      const actVal10 = arr.$_get(3);
      const expectVal4 = twoPointFive;
      expect(actVal10).assertEqual(expectVal4);
      const actVal11 = arr.$_get(4);
      const expectVal5 = twoPointFive;
      expect(actVal11).assertEqual(expectVal5);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0040
     * @tc.name testFloat64ArrayFill004
     * @tc.desc Verify fill with value start and end fills exact range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(piApprox, 1, 4);
      const actVal12 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal12).assertEqual(expectVal);
      const actVal13 = arr.$_get(1);
      const expectVal2 = piApprox;
      expect(actVal13).assertEqual(expectVal2);
      const actVal14 = arr.$_get(2);
      const expectVal3 = piApprox;
      expect(actVal14).assertEqual(expectVal3);
      const actVal15 = arr.$_get(3);
      const expectVal4 = piApprox;
      expect(actVal15).assertEqual(expectVal4);
      const actVal16 = arr.$_get(4);
      const expectVal5 = zeroPointZero;
      expect(actVal16).assertEqual(expectVal5);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0050
     * @tc.name testFloat64ArrayFill005
     * @tc.desc Verify fill with value 0.0 sets all elements to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(3);
      arr.$_set(0, onePointZero);
      arr.$_set(1, twoPointZero);
      arr.$_set(2, threePointZero);
      arr.fill(zeroPointZero);
      const actVal17 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal17).assertEqual(expectVal);
      const actVal18 = arr.$_get(1);
      const expectVal2 = zeroPointZero;
      expect(actVal18).assertEqual(expectVal2);
      const actVal19 = arr.$_get(2);
      const expectVal3 = zeroPointZero;
      expect(actVal19).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0060
     * @tc.name testFloat64ArrayFill006
     * @tc.desc Verify fill with value -0.0 sets all elements to negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const arr = new Float64Array(3);
      arr.fill(negativeZero);
      const actVal20 = arr.$_get(0);
      const expectVal = negativeZero;
      expect(actVal20).assertEqual(expectVal);
      const actVal21 = arr.$_get(1);
      const expectVal2 = negativeZero;
      expect(actVal21).assertEqual(expectVal2);
      const actVal22 = arr.$_get(2);
      const expectVal3 = negativeZero;
      expect(actVal22).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0070
     * @tc.name testFloat64ArrayFill007
     * @tc.desc Verify fill with value 5e-324 MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const arr = new Float64Array(3);
      arr.fill(doubleMinValue);
      const actVal23 = arr.$_get(0);
      const expectVal = doubleMinValue;
      expect(actVal23).assertEqual(expectVal);
      const actVal24 = arr.$_get(1);
      const expectVal2 = doubleMinValue;
      expect(actVal24).assertEqual(expectVal2);
      const actVal25 = arr.$_get(2);
      const expectVal3 = doubleMinValue;
      expect(actVal25).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0080
     * @tc.name testFloat64ArrayFill008
     * @tc.desc Verify fill with value 1.7976931348623157e+308 MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = new Float64Array(3);
      arr.fill(doubleMaxValue);
      const actVal26 = arr.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal26).assertEqual(expectVal);
      const actVal27 = arr.$_get(1);
      const expectVal2 = doubleMaxValue;
      expect(actVal27).assertEqual(expectVal2);
      const actVal28 = arr.$_get(2);
      const expectVal3 = doubleMaxValue;
      expect(actVal28).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0090
     * @tc.name testFloat64ArrayFill009
     * @tc.desc Verify fill with value Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array(3);
      arr.fill(positiveInfinity);
      const actVal29 = arr.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal29).assertEqual(expectVal);
      const actVal30 = arr.$_get(1);
      const expectVal2 = positiveInfinity;
      expect(actVal30).assertEqual(expectVal2);
      const actVal31 = arr.$_get(2);
      const expectVal3 = positiveInfinity;
      expect(actVal31).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0100
     * @tc.name testFloat64ArrayFill010
     * @tc.desc Verify fill with value -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = new Float64Array(3);
      arr.fill(negativeInfinity);
      const actVal32 = arr.$_get(0);
      const expectVal = negativeInfinity;
      expect(actVal32).assertEqual(expectVal);
      const actVal33 = arr.$_get(1);
      const expectVal2 = negativeInfinity;
      expect(actVal33).assertEqual(expectVal2);
      const actVal34 = arr.$_get(2);
      const expectVal3 = negativeInfinity;
      expect(actVal34).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0110
     * @tc.name testFloat64ArrayFill011
     * @tc.desc Verify fill with value NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array(3);
      arr.fill(nanValue);
      const actVal35 = Number.isNaN(arr.$_get(0));
      const expectVal = true;
      expect(actVal35).assertEqual(expectVal);
      const actVal36 = Number.isNaN(arr.$_get(1));
      const expectVal2 = true;
      expect(actVal36).assertEqual(expectVal2);
      const actVal37 = Number.isNaN(arr.$_get(2));
      const expectVal3 = true;
      expect(actVal37).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0120
     * @tc.name testFloat64ArrayFill012
     * @tc.desc Verify fill with negative value -999999.99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum999999Pointninenine: number = -999999.99;
      const arr = new Float64Array(3);
      arr.fill(negnum999999Pointninenine);
      const actVal38 = arr.$_get(0);
      const expectVal = negnum999999Pointninenine;
      expect(actVal38).assertEqual(expectVal);
      const actVal39 = arr.$_get(1);
      const expectVal2 = negnum999999Pointninenine;
      expect(actVal39).assertEqual(expectVal2);
      const actVal40 = arr.$_get(2);
      const expectVal3 = negnum999999Pointninenine;
      expect(actVal40).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0130
     * @tc.name testFloat64ArrayFill013
     * @tc.desc Verify fill with scientific notation 1.0e-308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const arr = new Float64Array(3);
      arr.fill(sciValue10e308);
      const actVal41 = arr.$_get(0);
      const expectVal = sciValue10e308;
      expect(actVal41).assertEqual(expectVal);
      const actVal42 = arr.$_get(1);
      const expectVal2 = sciValue10e308;
      expect(actVal42).assertEqual(expectVal2);
      const actVal43 = arr.$_get(2);
      const expectVal3 = sciValue10e308;
      expect(actVal43).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0140
     * @tc.name testFloat64ArrayFill014
     * @tc.desc Verify fill with scientific notation 1.0e+308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e+308;
      const arr = new Float64Array(3);
      arr.fill(sciValue10e308);
      const actVal44 = arr.$_get(0);
      const expectVal = sciValue10e308;
      expect(actVal44).assertEqual(expectVal);
      const actVal45 = arr.$_get(1);
      const expectVal2 = sciValue10e308;
      expect(actVal45).assertEqual(expectVal2);
      const actVal46 = arr.$_get(2);
      const expectVal3 = sciValue10e308;
      expect(actVal46).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0150
     * @tc.name testFloat64ArrayFill015
     * @tc.desc Verify fill with decimal 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array(3);
      arr.fill(pointOne);
      const actVal47 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal47).assertEqual(expectVal);
      const actVal48 = arr.$_get(1);
      const expectVal2 = pointOne;
      expect(actVal48).assertEqual(expectVal2);
      const actVal49 = arr.$_get(2);
      const expectVal3 = pointOne;
      expect(actVal49).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0160
     * @tc.name testFloat64ArrayFill016
     * @tc.desc Verify fill with decimal 0.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwo: number = 0.2;
      const arr = new Float64Array(3);
      arr.fill(pointTwo);
      const actVal50 = arr.$_get(0);
      const expectVal = pointTwo;
      expect(actVal50).assertEqual(expectVal);
      const actVal51 = arr.$_get(1);
      const expectVal2 = pointTwo;
      expect(actVal51).assertEqual(expectVal2);
      const actVal52 = arr.$_get(2);
      const expectVal3 = pointTwo;
      expect(actVal52).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0170
     * @tc.name testFloat64ArrayFill017
     * @tc.desc Verify fill with hex literal 0x10 equals 16.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const sixteenPointzero: number = 16.0;
      const arr = new Float64Array(3);
      arr.fill(hexValue10);
      const actVal53 = arr.$_get(0);
      const expectVal = sixteenPointzero;
      expect(actVal53).assertEqual(expectVal);
      const actVal54 = arr.$_get(1);
      const expectVal2 = sixteenPointzero;
      expect(actVal54).assertEqual(expectVal2);
      const actVal55 = arr.$_get(2);
      const expectVal3 = sixteenPointzero;
      expect(actVal55).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0180
     * @tc.name testFloat64ArrayFill018
     * @tc.desc Verify fill with octal literal 0o10 equals 8.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointZero: number = 8.0;
      const arr = new Float64Array(3);
      arr.fill(0o10);
      const actVal56 = arr.$_get(0);
      const expectVal = eightPointZero;
      expect(actVal56).assertEqual(expectVal);
      const actVal57 = arr.$_get(1);
      const expectVal2 = eightPointZero;
      expect(actVal57).assertEqual(expectVal2);
      const actVal58 = arr.$_get(2);
      const expectVal3 = eightPointZero;
      expect(actVal58).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0190
     * @tc.name testFloat64ArrayFill019
     * @tc.desc Verify fill with binary literal 0b1010 equals 10.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1010: number = 0b1010;
      const tenPointZero: number = 10.0;
      const arr = new Float64Array(3);
      arr.fill(binaryValue1010);
      const actVal59 = arr.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal59).assertEqual(expectVal);
      const actVal60 = arr.$_get(1);
      const expectVal2 = tenPointZero;
      expect(actVal60).assertEqual(expectVal2);
      const actVal61 = arr.$_get(2);
      const expectVal3 = tenPointZero;
      expect(actVal61).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0200
     * @tc.name testFloat64ArrayFill020
     * @tc.desc Verify fill with start=0 fills entire array from beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, 5);
      const actVal62 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal62).assertEqual(expectVal);
      const actVal63 = arr.$_get(1);
      const expectVal2 = onePointZero;
      expect(actVal63).assertEqual(expectVal2);
      const actVal64 = arr.$_get(4);
      const expectVal3 = onePointZero;
      expect(actVal64).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0210
     * @tc.name testFloat64ArrayFill021
     * @tc.desc Verify fill with start=1 skips first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 1, 5);
      const actVal65 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal65).assertEqual(expectVal);
      const actVal66 = arr.$_get(1);
      const expectVal2 = onePointZero;
      expect(actVal66).assertEqual(expectVal2);
      const actVal67 = arr.$_get(4);
      const expectVal3 = onePointZero;
      expect(actVal67).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0220
     * @tc.name testFloat64ArrayFill022
     * @tc.desc Verify fill with start=length-1 fills only last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 4, 5);
      const actVal68 = arr.$_get(3);
      const expectVal = zeroPointZero;
      expect(actVal68).assertEqual(expectVal);
      const actVal69 = arr.$_get(4);
      const expectVal2 = onePointZero;
      expect(actVal69).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0230
     * @tc.name testFloat64ArrayFill023
     * @tc.desc Verify fill with start=length fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 5, 5);
      const actVal70 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal70).assertEqual(expectVal);
      const actVal71 = arr.$_get(4);
      const expectVal2 = zeroPointZero;
      expect(actVal71).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0240
     * @tc.name testFloat64ArrayFill024
     * @tc.desc Verify fill with start=length+1 out of bounds fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 6, 5);
      const actVal72 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal72).assertEqual(expectVal);
      const actVal73 = arr.$_get(4);
      const expectVal2 = zeroPointZero;
      expect(actVal73).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0250
     * @tc.name testFloat64ArrayFill025
     * @tc.desc Verify fill with start=-1 fills only last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, -1, 5);
      const actVal74 = arr.$_get(3);
      const expectVal = zeroPointZero;
      expect(actVal74).assertEqual(expectVal);
      const actVal75 = arr.$_get(4);
      const expectVal2 = onePointZero;
      expect(actVal75).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0260
     * @tc.name testFloat64ArrayFill026
     * @tc.desc Verify fill with start=-length fills all from beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, -5, 5);
      const actVal76 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal76).assertEqual(expectVal);
      const actVal77 = arr.$_get(4);
      const expectVal2 = onePointZero;
      expect(actVal77).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0270
     * @tc.name testFloat64ArrayFill027
     * @tc.desc Verify fill with start=-length-1 clamped to 0 fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, -6, 5);
      const actVal78 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal78).assertEqual(expectVal);
      const actVal79 = arr.$_get(4);
      const expectVal2 = onePointZero;
      expect(actVal79).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0280
     * @tc.name testFloat64ArrayFill028
     * @tc.desc Verify fill with end=0 fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, 0);
      const actVal80 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal80).assertEqual(expectVal);
      const actVal81 = arr.$_get(4);
      const expectVal2 = zeroPointZero;
      expect(actVal81).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0290
     * @tc.name testFloat64ArrayFill029
     * @tc.desc Verify fill with end=1 fills only first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, 1);
      const actVal82 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal82).assertEqual(expectVal);
      const actVal83 = arr.$_get(1);
      const expectVal2 = zeroPointZero;
      expect(actVal83).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0300
     * @tc.name testFloat64ArrayFill030
     * @tc.desc Verify fill with end=length fills entire array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, 5);
      const actVal84 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal84).assertEqual(expectVal);
      const actVal85 = arr.$_get(4);
      const expectVal2 = onePointZero;
      expect(actVal85).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0310
     * @tc.name testFloat64ArrayFill031
     * @tc.desc Verify fill with end=length+1 clamped to length fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, 6);
      const actVal86 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal86).assertEqual(expectVal);
      const actVal87 = arr.$_get(4);
      const expectVal2 = onePointZero;
      expect(actVal87).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0320
     * @tc.name testFloat64ArrayFill032
     * @tc.desc Verify fill with end=-1 excludes last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, -1);
      const actVal88 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal88).assertEqual(expectVal);
      const actVal89 = arr.$_get(3);
      const expectVal2 = onePointZero;
      expect(actVal89).assertEqual(expectVal2);
      const actVal90 = arr.$_get(4);
      const expectVal3 = zeroPointZero;
      expect(actVal90).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0330
     * @tc.name testFloat64ArrayFill033
     * @tc.desc Verify fill with end=-length fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, -5);
      const actVal91 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal91).assertEqual(expectVal);
      const actVal92 = arr.$_get(4);
      const expectVal2 = zeroPointZero;
      expect(actVal92).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0340
     * @tc.name testFloat64ArrayFill034
     * @tc.desc Verify fill with end=-length-1 clamped to 0 fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, -6);
      const actVal93 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal93).assertEqual(expectVal);
      const actVal94 = arr.$_get(4);
      const expectVal2 = zeroPointZero;
      expect(actVal94).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0350
     * @tc.name testFloat64ArrayFill035
     * @tc.desc Verify fill with start=2 end=3 fills single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointfive: number = 5.5;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(fivePointfive, 2, 3);
      const actVal95 = arr.$_get(2);
      const expectVal = fivePointfive;
      expect(actVal95).assertEqual(expectVal);
      const actVal96 = arr.$_get(3);
      const expectVal2 = zeroPointZero;
      expect(actVal96).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0360
     * @tc.name testFloat64ArrayFill036
     * @tc.desc Verify fill with start=end fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 2, 2);
      const actVal97 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal97).assertEqual(expectVal);
      const actVal98 = arr.$_get(4);
      const expectVal2 = zeroPointZero;
      expect(actVal98).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0370
     * @tc.name testFloat64ArrayFill037
     * @tc.desc Verify fill with start greater than end fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 3, 2);
      const actVal99 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal99).assertEqual(expectVal);
      const actVal100 = arr.$_get(4);
      const expectVal2 = zeroPointZero;
      expect(actVal100).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0380
     * @tc.name testFloat64ArrayFill038
     * @tc.desc Verify fill returns this same array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(3);
      const result = arr.fill(onePointZero);
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0390
     * @tc.name testFloat64ArrayFill039
     * @tc.desc Verify fill return value supports chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = new Float64Array(3);
      arr.fill(onePointZero).fill(twoPointZero, 1, 3);
      const actVal101 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal101).assertEqual(expectVal);
      const actVal102 = arr.$_get(1);
      const expectVal2 = twoPointZero;
      expect(actVal102).assertEqual(expectVal2);
      const actVal103 = arr.$_get(2);
      const expectVal3 = twoPointZero;
      expect(actVal103).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0400
     * @tc.name testFloat64ArrayFill040
     * @tc.desc Verify fill does not change buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(5);
      const buf = arr.buffer;
      arr.fill(onePointZero);
      const expectVal = buf;
      expect(arr.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0410
     * @tc.name testFloat64ArrayFill041
     * @tc.desc Verify fill on single-element array all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const arr = new Float64Array(1);
      arr.fill(piApprox);
      const actVal104 = arr.$_get(0);
      const expectVal = piApprox;
      expect(actVal104).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0420
     * @tc.name testFloat64ArrayFill042
     * @tc.desc Verify fill on 100-element array affects all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num123Pointfourfivesix: number = 123.456;
      const arr = new Float64Array(100);
      arr.fill(num123Pointfourfivesix);
      const actVal105 = arr.$_get(0);
      const expectVal = num123Pointfourfivesix;
      expect(actVal105).assertEqual(expectVal);
      const actVal106 = arr.$_get(50);
      const expectVal2 = num123Pointfourfivesix;
      expect(actVal106).assertEqual(expectVal2);
      const actVal107 = arr.$_get(99);
      const expectVal3 = num123Pointfourfivesix;
      expect(actVal107).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0430
     * @tc.name testFloat64ArrayFill043
     * @tc.desc Verify fill on 100-element array middle range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(100);
      arr.fill(num999Pointzero, 25, 75);
      const actVal108 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal108).assertEqual(expectVal);
      const actVal109 = arr.$_get(24);
      const expectVal2 = zeroPointZero;
      expect(actVal109).assertEqual(expectVal2);
      const actVal110 = arr.$_get(25);
      const expectVal3 = num999Pointzero;
      expect(actVal110).assertEqual(expectVal3);
      const actVal111 = arr.$_get(74);
      const expectVal4 = num999Pointzero;
      expect(actVal111).assertEqual(expectVal4);
      const actVal112 = arr.$_get(75);
      const expectVal5 = zeroPointZero;
      expect(actVal112).assertEqual(expectVal5);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0440
     * @tc.name testFloat64ArrayFill044
     * @tc.desc Verify fill with value -1.0e+308 negative scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negsciValue10e308: number = -1.0e+308;
      const arr = new Float64Array(3);
      arr.fill(negsciValue10e308);
      const actVal113 = arr.$_get(0);
      const expectVal = negsciValue10e308;
      expect(actVal113).assertEqual(expectVal);
      const actVal114 = arr.$_get(1);
      const expectVal2 = negsciValue10e308;
      expect(actVal114).assertEqual(expectVal2);
      const actVal115 = arr.$_get(2);
      const expectVal3 = negsciValue10e308;
      expect(actVal115).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0450
     * @tc.name testFloat64ArrayFill045
     * @tc.desc Verify fill with value -1.0e-308 negative tiny scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negsciValue10e308: number = -1.0e-308;
      const arr = new Float64Array(3);
      arr.fill(negsciValue10e308);
      const actVal116 = arr.$_get(0);
      const expectVal = negsciValue10e308;
      expect(actVal116).assertEqual(expectVal);
      const actVal117 = arr.$_get(1);
      const expectVal2 = negsciValue10e308;
      expect(actVal117).assertEqual(expectVal2);
      const actVal118 = arr.$_get(2);
      const expectVal3 = negsciValue10e308;
      expect(actVal118).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0460
     * @tc.name testFloat64ArrayFill046
     * @tc.desc Verify fill with value MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const arr = new Float64Array(3);
      arr.fill(maxSafeIntegerValue);
      const actVal119 = arr.$_get(0);
      const expectVal = maxSafeIntegerValue;
      expect(actVal119).assertEqual(expectVal);
      const actVal120 = arr.$_get(1);
      const expectVal2 = maxSafeIntegerValue;
      expect(actVal120).assertEqual(expectVal2);
      const actVal121 = arr.$_get(2);
      const expectVal3 = maxSafeIntegerValue;
      expect(actVal121).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0470
     * @tc.name testFloat64ArrayFill047
     * @tc.desc Verify fill with value MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const arr = new Float64Array(3);
      arr.fill(negativeMaxSafeIntegerValue);
      const actVal122 = arr.$_get(0);
      const expectVal = negativeMaxSafeIntegerValue;
      expect(actVal122).assertEqual(expectVal);
      const actVal123 = arr.$_get(1);
      const expectVal2 = negativeMaxSafeIntegerValue;
      expect(actVal123).assertEqual(expectVal2);
      const actVal124 = arr.$_get(2);
      const expectVal3 = negativeMaxSafeIntegerValue;
      expect(actVal124).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0480
     * @tc.name testFloat64ArrayFill048
     * @tc.desc Verify fill with value 0.1+0.2 precision boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const pointTwo: number = 0.2;
      const arr = new Float64Array(3);
      arr.fill(pointOne + pointTwo);
      const actVal125 = Math.abs(arr.$_get(0) - 0.3) > 0.0;
      const expectVal = true;
      expect(actVal125).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0490
     * @tc.name testFloat64ArrayFill049
     * @tc.desc Verify fill with negative zero distinguished from positive zero via division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const negativeInfinity: number = -Infinity;
      const arr = new Float64Array(3);
      arr.fill(negativeZero);
      const actVal126 = arr.$_get(0);
      const expectVal = negativeZero;
      expect(actVal126).assertEqual(expectVal);
      const actVal127 = 1.0 / arr.$_get(0);
      const expectVal2 = negativeInfinity;
      expect(actVal127).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0500
     * @tc.name testFloat64ArrayFill050
     * @tc.desc Verify fill with consecutive calls override each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, 3);
      arr.fill(twoPointZero, 2, 5);
      const actVal128 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal128).assertEqual(expectVal);
      const actVal129 = arr.$_get(1);
      const expectVal2 = onePointZero;
      expect(actVal129).assertEqual(expectVal2);
      const actVal130 = arr.$_get(2);
      const expectVal3 = twoPointZero;
      expect(actVal130).assertEqual(expectVal3);
      const actVal131 = arr.$_get(3);
      const expectVal4 = twoPointZero;
      expect(actVal131).assertEqual(expectVal4);
      const actVal132 = arr.$_get(4);
      const expectVal5 = twoPointZero;
      expect(actVal132).assertEqual(expectVal5);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0510
     * @tc.name testFloat64ArrayFill051
     * @tc.desc Verify fill reverse consecutive calls override overlapping range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const onePointZero: number = 1.0;
      const arr = new Float64Array(5);
      arr.fill(twoPointZero, 2, 5);
      arr.fill(onePointZero, 0, 3);
      const actVal133 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal133).assertEqual(expectVal);
      const actVal134 = arr.$_get(1);
      const expectVal2 = onePointZero;
      expect(actVal134).assertEqual(expectVal2);
      const actVal135 = arr.$_get(2);
      const expectVal3 = onePointZero;
      expect(actVal135).assertEqual(expectVal3);
      const actVal136 = arr.$_get(3);
      const expectVal4 = twoPointZero;
      expect(actVal136).assertEqual(expectVal4);
      const actVal137 = arr.$_get(4);
      const expectVal5 = twoPointZero;
      expect(actVal137).assertEqual(expectVal5);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0520
     * @tc.name testFloat64ArrayFill052
     * @tc.desc Verify fill then modify single element via $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const fillValue99: number = 99.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero);
      arr.$_set(2, fillValue99);
      const actVal138 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal138).assertEqual(expectVal);
      const actVal139 = arr.$_get(2);
      const expectVal2 = fillValue99;
      expect(actVal139).assertEqual(expectVal2);
      const actVal140 = arr.$_get(4);
      const expectVal3 = onePointZero;
      expect(actVal140).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0530
     * @tc.name testFloat64ArrayFill053
     * @tc.desc Verify fill with start=-2 fills last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, -2, 5);
      const actVal141 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal141).assertEqual(expectVal);
      const actVal142 = arr.$_get(2);
      const expectVal2 = zeroPointZero;
      expect(actVal142).assertEqual(expectVal2);
      const actVal143 = arr.$_get(3);
      const expectVal3 = onePointZero;
      expect(actVal143).assertEqual(expectVal3);
      const actVal144 = arr.$_get(4);
      const expectVal4 = onePointZero;
      expect(actVal144).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0540
     * @tc.name testFloat64ArrayFill054
     * @tc.desc Verify fill with start=-3 fills last three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, -3, 5);
      const actVal145 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal145).assertEqual(expectVal);
      const actVal146 = arr.$_get(1);
      const expectVal2 = zeroPointZero;
      expect(actVal146).assertEqual(expectVal2);
      const actVal147 = arr.$_get(2);
      const expectVal3 = onePointZero;
      expect(actVal147).assertEqual(expectVal3);
      const actVal148 = arr.$_get(4);
      const expectVal4 = onePointZero;
      expect(actVal148).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0550
     * @tc.name testFloat64ArrayFill055
     * @tc.desc Verify fill with start=-4 fills last four elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, -4, 5);
      const actVal149 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal149).assertEqual(expectVal);
      const actVal150 = arr.$_get(1);
      const expectVal2 = onePointZero;
      expect(actVal150).assertEqual(expectVal2);
      const actVal151 = arr.$_get(4);
      const expectVal3 = onePointZero;
      expect(actVal151).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0560
     * @tc.name testFloat64ArrayFill056
     * @tc.desc Verify fill with start=2 fills from index 2 to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 2, 5);
      const actVal152 = arr.$_get(1);
      const expectVal = zeroPointZero;
      expect(actVal152).assertEqual(expectVal);
      const actVal153 = arr.$_get(2);
      const expectVal2 = onePointZero;
      expect(actVal153).assertEqual(expectVal2);
      const actVal154 = arr.$_get(4);
      const expectVal3 = onePointZero;
      expect(actVal154).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0570
     * @tc.name testFloat64ArrayFill057
     * @tc.desc Verify fill with start=3 fills from index 3 to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 3, 5);
      const actVal155 = arr.$_get(2);
      const expectVal = zeroPointZero;
      expect(actVal155).assertEqual(expectVal);
      const actVal156 = arr.$_get(3);
      const expectVal2 = onePointZero;
      expect(actVal156).assertEqual(expectVal2);
      const actVal157 = arr.$_get(4);
      const expectVal3 = onePointZero;
      expect(actVal157).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0580
     * @tc.name testFloat64ArrayFill058
     * @tc.desc Verify fill with end=2 fills indices 0 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, 2);
      const actVal158 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal158).assertEqual(expectVal);
      const actVal159 = arr.$_get(1);
      const expectVal2 = onePointZero;
      expect(actVal159).assertEqual(expectVal2);
      const actVal160 = arr.$_get(2);
      const expectVal3 = zeroPointZero;
      expect(actVal160).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0590
     * @tc.name testFloat64ArrayFill059
     * @tc.desc Verify fill with end=3 fills indices 0 to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, 3);
      const actVal161 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal161).assertEqual(expectVal);
      const actVal162 = arr.$_get(2);
      const expectVal2 = onePointZero;
      expect(actVal162).assertEqual(expectVal2);
      const actVal163 = arr.$_get(3);
      const expectVal3 = zeroPointZero;
      expect(actVal163).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0600
     * @tc.name testFloat64ArrayFill060
     * @tc.desc Verify fill with end=4 fills indices 0 to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, 4);
      const actVal164 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal164).assertEqual(expectVal);
      const actVal165 = arr.$_get(3);
      const expectVal2 = onePointZero;
      expect(actVal165).assertEqual(expectVal2);
      const actVal166 = arr.$_get(4);
      const expectVal3 = zeroPointZero;
      expect(actVal166).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0610
     * @tc.name testFloat64ArrayFill061
     * @tc.desc Verify fill with end=-2 fills up to third-from-last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, -2);
      const actVal167 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal167).assertEqual(expectVal);
      const actVal168 = arr.$_get(2);
      const expectVal2 = onePointZero;
      expect(actVal168).assertEqual(expectVal2);
      const actVal169 = arr.$_get(3);
      const expectVal3 = zeroPointZero;
      expect(actVal169).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0620
     * @tc.name testFloat64ArrayFill062
     * @tc.desc Verify fill with end=-3 fills indices 0 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, -3);
      const actVal170 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal170).assertEqual(expectVal);
      const actVal171 = arr.$_get(1);
      const expectVal2 = onePointZero;
      expect(actVal171).assertEqual(expectVal2);
      const actVal172 = arr.$_get(2);
      const expectVal3 = zeroPointZero;
      expect(actVal172).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0630
     * @tc.name testFloat64ArrayFill063
     * @tc.desc Verify fill with end=-4 fills only first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, -4);
      const actVal173 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal173).assertEqual(expectVal);
      const actVal174 = arr.$_get(1);
      const expectVal2 = zeroPointZero;
      expect(actVal174).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0640
     * @tc.name testFloat64ArrayFill064
     * @tc.desc Verify fill with start greater than end both negative fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, -2, -3);
      const actVal175 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal175).assertEqual(expectVal);
      const actVal176 = arr.$_get(4);
      const expectVal2 = zeroPointZero;
      expect(actVal176).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0650
     * @tc.name testFloat64ArrayFill065
     * @tc.desc Verify fill with start greater than end cross positive negative fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 3, -1);
      const actVal177 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal177).assertEqual(expectVal);
      const actVal178 = arr.$_get(4);
      const expectVal2 = zeroPointZero;
      expect(actVal178).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0660
     * @tc.name testFloat64ArrayFill066
     * @tc.desc Verify fill with start=0x1234 hex literal OOB fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0x1234, 5);
      const actVal179 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal179).assertEqual(expectVal);
      const actVal180 = arr.$_get(4);
      const expectVal2 = zeroPointZero;
      expect(actVal180).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0670
     * @tc.name testFloat64ArrayFill067
     * @tc.desc Verify fill with end=0123 octal literal clamped to length fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, 83);
      const actVal181 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal181).assertEqual(expectVal);
      const actVal182 = arr.$_get(4);
      const expectVal2 = onePointZero;
      expect(actVal182).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0680
     * @tc.name testFloat64ArrayFill068
     * @tc.desc Verify fill with start=2147483647 INT_MAX OOB fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 2147483647, 5);
      const actVal183 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal183).assertEqual(expectVal);
      const actVal184 = arr.$_get(4);
      const expectVal2 = zeroPointZero;
      expect(actVal184).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0690
     * @tc.name testFloat64ArrayFill069
     * @tc.desc Verify fill with end=0x7FFFFFFF hex INT_MAX clamped to length fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, 0x7FFFFFFF);
      const actVal185 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal185).assertEqual(expectVal);
      const actVal186 = arr.$_get(4);
      const expectVal2 = onePointZero;
      expect(actVal186).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0700
     * @tc.name testFloat64ArrayFill070
     * @tc.desc Verify fill with start=-2147483648 INT_MIN clamped to 0 fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, -2147483648, 5);
      const actVal187 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal187).assertEqual(expectVal);
      const actVal188 = arr.$_get(4);
      const expectVal2 = onePointZero;
      expect(actVal188).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0710
     * @tc.name testFloat64ArrayFill071
     * @tc.desc Verify fill with start=0b1010 binary literal OOB fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0b1010, 5);
      const actVal189 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal189).assertEqual(expectVal);
      const actVal190 = arr.$_get(4);
      const expectVal2 = zeroPointZero;
      expect(actVal190).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0720
     * @tc.name testFloat64ArrayFill072
     * @tc.desc Verify fill with start=-3 end=-1 fills middle two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, -3, -1);
      const actVal191 = arr.$_get(1);
      const expectVal = zeroPointZero;
      expect(actVal191).assertEqual(expectVal);
      const actVal192 = arr.$_get(2);
      const expectVal2 = onePointZero;
      expect(actVal192).assertEqual(expectVal2);
      const actVal193 = arr.$_get(3);
      const expectVal3 = onePointZero;
      expect(actVal193).assertEqual(expectVal3);
      const actVal194 = arr.$_get(4);
      const expectVal4 = zeroPointZero;
      expect(actVal194).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0730
     * @tc.name testFloat64ArrayFill073
     * @tc.desc Verify fill with end=2147483646 near INT_MAX clamped to length fills same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, 0, 2147483646);
      const actVal195 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal195).assertEqual(expectVal);
      const actVal196 = arr.$_get(4);
      const expectVal2 = onePointZero;
      expect(actVal196).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0740
     * @tc.name testFloat64ArrayFill074
     * @tc.desc Verify fill start=-1 resolved to 4 greater than end=2 empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(onePointZero, -1, 2);
      const actVal197 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal197).assertEqual(expectVal);
      const actVal198 = arr.$_get(1);
      const expectVal2 = zeroPointZero;
      expect(actVal198).assertEqual(expectVal2);
      const actVal199 = arr.$_get(2);
      const expectVal3 = zeroPointZero;
      expect(actVal199).assertEqual(expectVal3);
      const actVal200 = arr.$_get(3);
      const expectVal4 = zeroPointZero;
      expect(actVal200).assertEqual(expectVal4);
      const actVal201 = arr.$_get(4);
      const expectVal5 = zeroPointZero;
      expect(actVal201).assertEqual(expectVal5);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0750
     * @tc.name testFloat64ArrayFill075
     * @tc.desc Verify fill on single-element array start=0 end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const arr = new Float64Array(1);
      arr.fill(piApprox, 0, 1);
      const actVal202 = arr.$_get(0);
      const expectVal = piApprox;
      expect(actVal202).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0760
     * @tc.name testFloat64ArrayFill076
     * @tc.desc Verify fill on two-element array fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointFive: number = 2.5;
      const arr = new Float64Array(2);
      arr.fill(twoPointFive);
      const actVal203 = arr.$_get(0);
      const expectVal = twoPointFive;
      expect(actVal203).assertEqual(expectVal);
      const actVal204 = arr.$_get(1);
      const expectVal2 = twoPointFive;
      expect(actVal204).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0770
     * @tc.name testFloat64ArrayFill077
     * @tc.desc Verify fill on two-element array fills first element only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointFive: number = 2.5;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(2);
      arr.fill(twoPointFive, 0, 1);
      const actVal205 = arr.$_get(0);
      const expectVal = twoPointFive;
      expect(actVal205).assertEqual(expectVal);
      const actVal206 = arr.$_get(1);
      const expectVal2 = zeroPointZero;
      expect(actVal206).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0780
     * @tc.name testFloat64ArrayFill078
     * @tc.desc Verify fill on two-element array fills second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointFive: number = 2.5;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(2);
      arr.fill(twoPointFive, 1);
      const actVal207 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal207).assertEqual(expectVal);
      const actVal208 = arr.$_get(1);
      const expectVal2 = twoPointFive;
      expect(actVal208).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0790
     * @tc.name testFloat64ArrayFill079
     * @tc.desc Verify fill on two-element array start=-2 end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointFive: number = 2.5;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(2);
      arr.fill(twoPointFive, -2, -1);
      const actVal209 = arr.$_get(0);
      const expectVal = twoPointFive;
      expect(actVal209).assertEqual(expectVal);
      const actVal210 = arr.$_get(1);
      const expectVal2 = zeroPointZero;
      expect(actVal210).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0800
     * @tc.name testFloat64ArrayFill080
     * @tc.desc Verify fill start=0 end=2 fills first two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointeight: number = 8.8;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(eightPointeight, 0, 2);
      const actVal211 = arr.$_get(0);
      const expectVal = eightPointeight;
      expect(actVal211).assertEqual(expectVal);
      const actVal212 = arr.$_get(1);
      const expectVal2 = eightPointeight;
      expect(actVal212).assertEqual(expectVal2);
      const actVal213 = arr.$_get(2);
      const expectVal3 = zeroPointZero;
      expect(actVal213).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0810
     * @tc.name testFloat64ArrayFill081
     * @tc.desc Verify fill start=3 end=5 fills last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointeight: number = 8.8;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(eightPointeight, 3, 5);
      const actVal214 = arr.$_get(2);
      const expectVal = zeroPointZero;
      expect(actVal214).assertEqual(expectVal);
      const actVal215 = arr.$_get(3);
      const expectVal2 = eightPointeight;
      expect(actVal215).assertEqual(expectVal2);
      const actVal216 = arr.$_get(4);
      const expectVal3 = eightPointeight;
      expect(actVal216).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0820
     * @tc.name testFloat64ArrayFill082
     * @tc.desc Verify fill start=-4 end=-1 fills three middle elements via negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointeight: number = 8.8;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(eightPointeight, -4, -1);
      const actVal217 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal217).assertEqual(expectVal);
      const actVal218 = arr.$_get(1);
      const expectVal2 = eightPointeight;
      expect(actVal218).assertEqual(expectVal2);
      const actVal219 = arr.$_get(3);
      const expectVal3 = eightPointeight;
      expect(actVal219).assertEqual(expectVal3);
      const actVal220 = arr.$_get(4);
      const expectVal4 = zeroPointZero;
      expect(actVal220).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0830
     * @tc.name testFloat64ArrayFill083
     * @tc.desc Verify fill start=0 end=1 fills only first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointeight: number = 8.8;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(eightPointeight, 0, 1);
      const actVal221 = arr.$_get(0);
      const expectVal = eightPointeight;
      expect(actVal221).assertEqual(expectVal);
      const actVal222 = arr.$_get(1);
      const expectVal2 = zeroPointZero;
      expect(actVal222).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0840
     * @tc.name testFloat64ArrayFill084
     * @tc.desc Verify fill start=-5 end=-4 fills first element via negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointeight: number = 8.8;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(eightPointeight, -5, -4);
      const actVal223 = arr.$_get(0);
      const expectVal = eightPointeight;
      expect(actVal223).assertEqual(expectVal);
      const actVal224 = arr.$_get(1);
      const expectVal2 = zeroPointZero;
      expect(actVal224).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_0850
     * @tc.name testFloat64ArrayFill085
     * @tc.desc Verify fill start=1 end=5 fills all except first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointeight: number = 8.8;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(eightPointeight, 1, 5);
      const actVal225 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal225).assertEqual(expectVal);
      const actVal226 = arr.$_get(1);
      const expectVal2 = eightPointeight;
      expect(actVal226).assertEqual(expectVal2);
      const actVal227 = arr.$_get(4);
      const expectVal3 = eightPointeight;
      expect(actVal227).assertEqual(expectVal3);
    })

  })
}
