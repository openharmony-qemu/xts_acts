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

export default function LongCompareToTest(): void {
  describe('LongCompareToTest', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const CT_NEG_100: long = -100;
    const CT_NEG_10: long = -10;
    const CT_NEG_5: long = -5;
    const CT_NEG_1: int = -1;
    const CT_0: int = 0;
    const CT_1: int = 1;
    const CT_3: long = 3;
    const CT_5: long = 5;
    const CT_42: long = 42;
    const CT_100: long = 100;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_0100
     * @tc.name testLongCompareTo001
     * @tc.desc Verify compareTo returns -1 when comparing a smaller Long with a larger Long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(CT_3);
      const right = new Long(CT_5);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(CT_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_0200
     * @tc.name testLongCompareTo002
     * @tc.desc Verify compareTo returns 0 when both Long instances are zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(CT_0);
      const right = new Long(CT_0);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(CT_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_0300
     * @tc.name testLongCompareTo003
     * @tc.desc Verify compareTo returns -1 when comparing a more negative Long with a less negative Long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(CT_NEG_10);
      const right = new Long(CT_NEG_5);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(CT_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_0400
     * @tc.name testLongCompareTo004
     * @tc.desc Verify compareTo returns -1 when comparing a negative Long with zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(CT_NEG_1);
      const right = new Long(CT_0);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(CT_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_0500
     * @tc.name testLongCompareTo005
     * @tc.desc Verify compareTo returns 1 when comparing a positive Long with a negative Long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(CT_1);
      const right = new Long(CT_NEG_1);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(CT_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_0600
     * @tc.name testLongCompareTo006
     * @tc.desc Verify compareTo returns 1 when comparing a less negative Long with a more negative Long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(CT_NEG_5);
      const right = new Long(CT_NEG_10);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(CT_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_0700
     * @tc.name testLongCompareTo007
     * @tc.desc Verify compareTo returns 0 when two positive Long instances have the same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(CT_5);
      const right = new Long(CT_5);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(CT_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_0800
     * @tc.name testLongCompareTo008
     * @tc.desc Verify compareTo returns 0 when two negative Long instances have the same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(CT_NEG_5);
      const right = new Long(CT_NEG_5);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(CT_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_0900
     * @tc.name testLongCompareTo009
     * @tc.desc Verify compareTo returns 0 when comparing a Long instance with itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(CT_42);
      const result: int = value.compareTo(value);
      expect(result).assertEqual(CT_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_1000
     * @tc.name testLongCompareTo010
     * @tc.desc Verify compareTo returns 1 when comparing a positive Long with zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(CT_1);
      const right = new Long(CT_0);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(CT_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_1100
     * @tc.name testLongCompareTo011
     * @tc.desc Verify compareTo return value is always one of -1, 0, or 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Long[] =
        [new Long(CT_NEG_100), new Long(CT_NEG_1), new Long(CT_0), new Long(CT_1), new Long(CT_100)];
      for (let i: int = 0; i < values.length; i++) {
        for (let j: int = 0; j < values.length; j++) {
          const result: int = values[i].compareTo(values[j]);
          expect(result === -1 || result === 0 || result === 1).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_1200
     * @tc.name testLongCompareTo012
     * @tc.desc Verify compareTo returns 1 when comparing larger Long with smaller Long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(CT_5);
      const result: int = value.compareTo(new Long(CT_3));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_1300
     * @tc.name testLongCompareTo013
     * @tc.desc Verify compareTo returns -1 for MIN_VALUE vs MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(Long.MIN_VALUE);
      const right = new Long(Long.MAX_VALUE);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(CT_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_1400
     * @tc.name testLongCompareTo014
     * @tc.desc Verify compareTo returns 0 for MAX_VALUE vs MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(Long.MAX_VALUE);
      const right = new Long(Long.MAX_VALUE);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(CT_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_1500
     * @tc.name testLongCompareTo015
     * @tc.desc Verify compareTo returns 0 for MIN_VALUE vs MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Long(Long.MIN_VALUE);
      const right = new Long(Long.MIN_VALUE);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(CT_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_1600
     * @tc.name testLongCompareTo016
     * @tc.desc Verify compareTo transitivity: if a>b and b>c then a>c (5 > 0 > -5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(CT_5);
      const b: Long = new Long(CT_0);
      const c: Long = new Long(CT_NEG_5);
      expect(a.compareTo(b)).assertEqual(CT_1);
      expect(b.compareTo(c)).assertEqual(CT_1);
      expect(a.compareTo(c)).assertEqual(CT_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_1700
     * @tc.name testLongCompareTo017
     * @tc.desc Verify compareTo reflexivity: a.compareTo(a) == 0 for various values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: Long = new Long(CT_NEG_100);
      const v2: Long = new Long(CT_0);
      const v3: Long = new Long(CT_42);
      const v4: Long = new Long(CT_100);
      expect(v1.compareTo(v1)).assertEqual(CT_0);
      expect(v2.compareTo(v2)).assertEqual(CT_0);
      expect(v3.compareTo(v3)).assertEqual(CT_0);
      expect(v4.compareTo(v4)).assertEqual(CT_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_1800
     * @tc.name testLongCompareTo018
     * @tc.desc Verify equals consistency: a.equals(b) iff a.compareTo(b) == 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(CT_5);
      const b: Long = new Long(CT_5);
      const c: Long = new Long(CT_3);
      expect(a.equals(b)).assertTrue();
      expect(a.compareTo(b)).assertEqual(CT_0);
      expect(a.equals(c)).assertFalse();
      expect(a.compareTo(c) !== 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_1900
     * @tc.name testLongCompareTo019
     * @tc.desc Verify compareTo with long literal cast as constructor input: new Long(100 as long).compareTo(new Long(99 as long)) === 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(100 as long);
      const right: Long = new Long(99 as long);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(CT_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_2000
     * @tc.name testLongCompareTo020
     * @tc.desc Verify long primitive comparison and Long.compareTo direction stay consistent for the same pair
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lp: long = CT_100;
      const rp: long = CT_3;
      const primitiveGreater: boolean = lp > rp;
      const boxedResult: int = new Long(lp).compareTo(new Long(rp));
      expect(primitiveGreater).assertTrue();
      expect(boxedResult).assertEqual(CT_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_COMPARE_TO_2100
     * @tc.name testLongCompareTo021
     * @tc.desc Verify compareTo with long boundary literals (MAX_VALUE as long, MIN_VALUE as long) directly boxed into Long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCompareTo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Long = new Long(Long.MAX_VALUE as long);
      const right: Long = new Long(Long.MIN_VALUE as long);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(CT_1);
    });
  });
}
