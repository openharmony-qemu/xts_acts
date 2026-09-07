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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function longIsGreaterEqualThan1Test(): void {
  describe('LongIsGreaterEqualThan1Test', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_0100
     * @tc.name testLongIsGreaterEqualThan1_001
     * @tc.desc Verify isGreaterEqualThan returns true when left operand greater than right operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftVal: Long = new Long(42);
      let rightVal: Long = new Long(24);
      let result: boolean = leftVal.isGreaterEqualThan(rightVal);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_0200
     * @tc.name testLongIsGreaterEqualThan1_002
     * @tc.desc Verify isGreaterEqualThan returns false when left operand less than right operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftVal: Long = new Long(10);
      let rightVal: Long = new Long(20);
      let result: boolean = leftVal.isGreaterEqualThan(rightVal);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_0300
     * @tc.name testLongIsGreaterEqualThan1_003
     * @tc.desc Verify isGreaterEqualThan returns false comparing small negative with Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseLong: Long = new Long(-100);
      let otherLong: Long = new Long(9223372036854775807);
      let result: boolean = baseLong.isGreaterEqualThan(otherLong);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_0400
     * @tc.name testLongIsGreaterEqualThan1_004
     * @tc.desc Verify isGreaterEqualThan returns true comparing small negative with Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseLong: Long = new Long(-100);
      let otherLong: Long = new Long(Long.MIN_VALUE);
      let result: boolean = baseLong.isGreaterEqualThan(otherLong);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_0500
     * @tc.name testLongIsGreaterEqualThan1_005
     * @tc.desc Verify isGreaterEqualThan returns false comparing hex literal operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(0x1234).isGreaterEqualThan(new Long(0x1235));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_0600
     * @tc.name testLongIsGreaterEqualThan1_006
     * @tc.desc Verify isGreaterEqualThan does not mutate negative operand value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(-555);
      const before: long = a.toLong();
      a.isGreaterEqualThan(new Long(0));
      const after: long = a.toLong();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_0700
     * @tc.name testLongIsGreaterEqualThan1_007
     * @tc.desc Verify isGreaterEqualThan does not mutate Long.MAX_VALUE boundary operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MAX_VALUE);
      const before: long = a.toLong();
      a.isGreaterEqualThan(new Long(0));
      const after: long = a.toLong();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_0800
     * @tc.name testLongIsGreaterEqualThan1_008
     * @tc.desc Verify isGreaterEqualThan does not mutate Long.MIN_VALUE boundary operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MIN_VALUE);
      const before: long = a.toLong();
      a.isGreaterEqualThan(new Long(0));
      const after: long = a.toLong();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_0900
     * @tc.name testLongIsGreaterEqualThan1_009
     * @tc.desc Verify isGreaterEqualThan does not mutate zero operand value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const before: long = a.toLong();
      a.isGreaterEqualThan(new Long(1));
      const after: long = a.toLong();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_1000
     * @tc.name testLongIsGreaterEqualThan1_010
     * @tc.desc Verify isGreaterEqualThan does not mutate hex literal operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0xabcd);
      const before: long = a.toLong();
      a.isGreaterEqualThan(new Long(0xabcf));
      const after: long = a.toLong();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_1100
     * @tc.name testLongIsGreaterEqualThan1_011
     * @tc.desc Verify isGreaterEqualThan does not mutate large positive operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(1000000);
      const before: long = a.toLong();
      a.isGreaterEqualThan(new Long(999999));
      const after: long = a.toLong();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_1200
     * @tc.name testLongIsGreaterEqualThan1_012
     * @tc.desc Verify isGreaterEqualThan does not mutate default-constructed operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long();
      const before: long = a.toLong();
      a.isGreaterEqualThan(new Long(5));
      const after: long = a.toLong();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_1300
     * @tc.name testLongIsGreaterEqualThan1_013
     * @tc.desc Verify isGreaterEqualThan does not mutate operand after repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(300);
      const before: long = a.toLong();
      a.isGreaterEqualThan(new Long(100));
      a.isGreaterEqualThan(new Long(500));
      const after: long = a.toLong();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_1400
     * @tc.name testLongIsGreaterEqualThan1_014
     * @tc.desc Verify isGreaterEqualThan returns true comparing division result with equal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const quot: Long = new Long(100).div(new Long(4));
      const result: boolean = quot.isGreaterEqualThan(new Long(25));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_1500
     * @tc.name testLongIsGreaterEqualThan1_015
     * @tc.desc Verify compareTo and isGreaterEqualThan consistency for 200 vs 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(200);
      const b: Long = new Long(100);
      const cmpResult: int = a.compareTo(b);
      const geResult: boolean = a.isGreaterEqualThan(b);
      expect(cmpResult).assertLargerOrEqual(0);
      expect(geResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_1600
     * @tc.name testLongIsGreaterEqualThan1_016
     * @tc.desc Verify transitive isGreaterEqualThan returns true for chain 100>=50>=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(100);
      let b: Long = new Long(50);
      let c: Long = new Long(1);
      expect(a.isGreaterEqualThan(b)).assertTrue();
      expect(b.isGreaterEqualThan(c)).assertTrue();
      expect(a.isGreaterEqualThan(c)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_1700
     * @tc.name testLongIsGreaterEqualThan1_017
     * @tc.desc Verify 0.mul(100).isGreaterEqualThan(0) returns true and isGreaterEqualThan(100) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Long = new Long(0);
      let y: Long = new Long(100);
      let prod: Long = x.mul(y);
      expect(prod.isGreaterEqualThan(x)).assertTrue();
      expect(prod.isGreaterEqualThan(y)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_1800
     * @tc.name testLongIsGreaterEqualThan1_018
     * @tc.desc Verify isGreaterEqualThan returns true comparing addition result with subtraction result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Long = new Long(300);
      let y: Long = new Long(100);
      let sum: Long = x.add(y);
      let diff: Long = x.sub(y);
      expect(sum.isGreaterEqualThan(diff)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_1900
     * @tc.name testLongIsGreaterEqualThan1_019
     * @tc.desc Verify isGreaterEqualThan returns false comparing int min boundary with -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(-2147483648);
      let b: Long = new Long(-1);
      let result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATEREQUALTHAN1_2000
     * @tc.name testLongIsGreaterEqualThan1_020
     * @tc.desc Verify isGreaterEqualThan returns true comparing -1 with int min boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterEqualThan1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(-1);
      let b: Long = new Long(-2147483648);
      let result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });
  });
}
