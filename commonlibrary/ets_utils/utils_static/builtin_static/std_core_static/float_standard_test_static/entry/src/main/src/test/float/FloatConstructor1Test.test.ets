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
import Utils from './../Util.test';

export default function FloatConstructor1Test(): void {
  describe('FloatConstructor1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_0100
     * @tc.name testConstructor1001
     * @tc.desc Verify no-argument constructor creates Float instance successfully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      let toFloatResult: float = value.toFloat();
      expect(toFloatResult).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_0200
     * @tc.name testConstructor1002
     * @tc.desc Verify new Float().toFloat() returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      let isDefaultFloat: boolean = value.toFloat() === 0.0f;
      expect(isDefaultFloat).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_0300
     * @tc.name testConstructor1003
     * @tc.desc Verify new Float().toDouble() returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      let isDefaultDouble: boolean = value.toDouble() === 0.0;
      expect(isDefaultDouble).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_0400
     * @tc.name testConstructor1004
     * @tc.desc Verify new Float().toInt() returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      let isDefaultInt: boolean = value.toInt() === 0;
      expect(isDefaultInt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_0500
     * @tc.name testConstructor1005
     * @tc.desc Verify no-argument constructor creates Float with initial value 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      let isZeroString: boolean = value.toString() === '0';
      expect(isZeroString).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_0600
     * @tc.name testConstructor1006
     * @tc.desc Verify new Float().isInteger() returns true (0 is integer)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      expect(value.isInteger()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_0700
     * @tc.name testConstructor1007
     * @tc.desc Verify new Float().isSafeInteger() returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_0800
     * @tc.name testConstructor1008
     * @tc.desc Verify Float instance implements Comparable interface
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      let cmp: Float = new Float();
      let isEqual: boolean = value.compareTo(cmp) === 0;
      expect(isEqual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_0900
     * @tc.name testConstructor1009
     * @tc.desc Verify instance value equals 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      const zero = new Float(0.0f);
      let isEqualToZero: boolean = value.compareTo(zero) === 0;
      expect(isEqualToZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_1000
     * @tc.name testConstructor1010
     * @tc.desc Verify positive zero and negative zero are equal in Float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      const negZero = new Float(-0.0f);
      let equalsResult: boolean = value.equals(negZero);
      expect(equalsResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_1100
     * @tc.name testConstructor1011
     * @tc.desc Verify no-argument constructor instance is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_1200
     * @tc.name testConstructor1012
     * @tc.desc Verify no-argument constructor instance is not infinite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_1300
     * @tc.name testConstructor1013
     * @tc.desc Verify multiple instances created by no-argument constructor have same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Float();
      const v2 = new Float();
      const v3 = new Float();
      let isSameString: boolean = v1.toString() === v2.toString();
      expect(isSameString).assertTrue();
      let isSameString2: boolean = v2.toString() === v3.toString();
      expect(isSameString2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_1400
     * @tc.name testConstructor1014
     * @tc.desc Verify instance can call compareTo() method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      const other = new Float();
      const result = value.compareTo(other);
      let isEqual: boolean = result === 0;
      expect(isEqual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_1500
     * @tc.name testConstructor1015
     * @tc.desc Verify 1.0f divided by new Float().toFloat() returns +Infinity (proves +0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      let isPositiveInfinity: boolean = 1.0f / value.toFloat() === Float.POSITIVE_INFINITY;
      expect(isPositiveInfinity).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_1600
     * @tc.name testConstructor1016
     * @tc.desc Verify each new Float() call creates independent instances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Float();
      const v2 = new Float();
      let isV1Default: boolean = v1.toFloat() === 0.0f;
      expect(isV1Default).assertTrue();
      let isV2Default: boolean = v2.toFloat() === 0.0f;
      expect(isV2Default).assertTrue();
      let equalsResult2: boolean = v1.equals(v2);
      expect(equalsResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_1700
     * @tc.name testConstructor1017
     * @tc.desc Verify new Float().equals(new Float(0.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      const zero = new Float(0.0f);
      let equalsResult3: boolean = value.equals(zero);
      expect(equalsResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_1800
     * @tc.name testConstructor1018
     * @tc.desc Verify new Float() default value can be used in arithmetic (0.0f + 5.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Float();
      const result: Float = value.add(new Float(5.0f));
      let isResultFive: boolean = result.toString() === '5';
      expect(isResultFive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTRUCTOR_1_1900
     * @tc.name testConstructor1019
     * @tc.desc Verify no memory leak when repeatedly creating many instances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstructor1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 1000; i++) {
        const value = new Float();
        let toFloatResult3: float = value.toFloat();
        expect(toFloatResult3).assertEqual(0.0f);
      }
    });
  });
}
