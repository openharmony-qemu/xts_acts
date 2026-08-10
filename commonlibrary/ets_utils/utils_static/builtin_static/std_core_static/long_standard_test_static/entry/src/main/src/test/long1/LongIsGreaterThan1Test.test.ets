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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function longIsGreaterThan1Test(): void {
  describe('LongIsGreaterThan1Test', (): void => {

    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_0100
     * @tc.name testLongIsGreaterThan1_001
     * @tc.desc Verify Long.MAX_VALUE minus one ordered after Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(9223372036854775806);
      let b: Long = new Long(Long.MIN_VALUE);
      expect(a.isGreaterThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_0200
     * @tc.name testLongIsGreaterThan1_002
     * @tc.desc Verify Long.MAX_VALUE minus one ordered after its negated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(9223372036854775806);
      let b: Long = new Long(-9223372036854775807);
      expect(a.isGreaterThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_0300
     * @tc.name testLongIsGreaterThan1_003
     * @tc.desc Verify Long.MAX_VALUE ordered after Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(9223372036854775807);
      let b: Long = new Long(Long.MIN_VALUE);
      expect(a.isGreaterThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_0400
     * @tc.name testLongIsGreaterThan1_004
     * @tc.desc Verify Long.MAX_VALUE ordered after negated Long.MAX_VALUE minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(9223372036854775807);
      let b: Long = new Long(-9223372036854775807);
      expect(a.isGreaterThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_0500
     * @tc.name testLongIsGreaterThan1_005
     * @tc.desc Verify zero long value ordered before one and after minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(0);
      let b: Long = new Long(1);
      let c: Long = new Long(-1);
      expect(a.isGreaterThan(b)).assertFalse();
      expect(a.isGreaterThan(c)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_0600
     * @tc.name testLongIsGreaterThan1_006
     * @tc.desc Verify Long.MAX_VALUE minus seven not ordered after Long.MAX_VALUE minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(9223372036854775800);
      let b: Long = new Long(9223372036854775806);
      expect(a.isGreaterThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_0700
     * @tc.name testLongIsGreaterThan1_007
     * @tc.desc Verify Long.MAX_VALUE minus one ordered after Long.MAX_VALUE minus seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(9223372036854775806);
      let b: Long = new Long(9223372036854775800);
      expect(a.isGreaterThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_0800
     * @tc.name testLongIsGreaterThan1_008
     * @tc.desc Verify repeated comparison of one hundred and fifty yields consistent true result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(100);
      let b: Long = new Long(50);
      let r1: boolean = a.isGreaterThan(b);
      let r2: boolean = a.isGreaterThan(b);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_0900
     * @tc.name testLongIsGreaterThan1_009
     * @tc.desc Verify Long.MIN_VALUE not ordered after Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(Long.MIN_VALUE);
      let b: Long = new Long(9223372036854775807);
      let r1: boolean = a.isGreaterThan(b);
      let r2: boolean = a.isGreaterThan(b);
      expect(r1).assertEqual(r2);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_1000
     * @tc.name testLongIsGreaterThan1_010
     * @tc.desc Verify Long.MAX_VALUE not ordered after itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(9223372036854775807);
      let r1: boolean = a.isGreaterThan(a);
      let r2: boolean = a.isGreaterThan(a);
      expect(r1).assertEqual(r2);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_1100
     * @tc.name testLongIsGreaterThan1_011
     * @tc.desc Verify decimal value 42 ordered after zero long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(42);
      let b: Long = new Long(0);
      let r: boolean = a.isGreaterThan(b);
      let same: boolean = r === true;
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_1200
     * @tc.name testLongIsGreaterThan1_012
     * @tc.desc Verify wrapped Long.MAX_VALUE plus one not ordered after Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max: Long = new Long(9223372036854775807);
      const one: Long = new Long(1);
      const sum: Long = new Long(max.toLong() + one.toLong());
      const min: Long = new Long(Long.MIN_VALUE);
      const r: boolean = sum.isGreaterThan(min);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_1300
     * @tc.name testLongIsGreaterThan1_013
     * @tc.desc Verify one million plus two million compared equal to three million
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(1000000);
      const b: Long = new Long(2000000);
      const sum: Long = new Long(a.toLong() + b.toLong());
      const check: Long = new Long(3000000);
      const r: boolean = sum.isGreaterThan(check);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_1400
     * @tc.name testLongIsGreaterThan1_014
     * @tc.desc Verify wrapped Long.MAX_VALUE multiplied by three not ordered after itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(9223372036854775807);
      const b: Long = new Long(3);
      const product: Long = new Long(a.toLong() * b.toLong());
      const r: boolean = product.isGreaterThan(product);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_1500
     * @tc.name testLongIsGreaterThan1_015
     * @tc.desc Verify Long.MAX_VALUE not ordered after wrapped Long.MIN_VALUE minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max: Long = new Long(9223372036854775807);
      const negOverflow: Long = new Long((Long.MIN_VALUE) - 1);
      const r: boolean = max.isGreaterThan(negOverflow);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_1600
     * @tc.name testLongIsGreaterThan1_016
     * @tc.desc Verify negated Long.MAX_VALUE minus one ordered after wrapped Long.MAX_VALUE plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minPlus: Long = new Long(-9223372036854775807);
      const overflowVal: Long = new Long(9223372036854775807 + 1);
      const r: boolean = minPlus.isGreaterThan(overflowVal);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_1700
     * @tc.name testLongIsGreaterThan1_017
     * @tc.desc Verify decimal value 65536 ordered after zero long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const orig: Long = new Long(65536);
      const derived: Long = new Long(0);
      const r: boolean = orig.isGreaterThan(derived);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_1800
     * @tc.name testLongIsGreaterThan1_018
     * @tc.desc Verify one hundred minus fifty compared equal to twenty five plus twenty five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(100);
      const b: Long = new Long(50);
      const c: Long = new Long(25);
      const expr1: Long = new Long(a.toLong() - b.toLong());
      const expr2: Long = new Long(c.toLong() + c.toLong());
      const r: boolean = expr1.isGreaterThan(expr2);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_1900
     * @tc.name testLongIsGreaterThan1_019
     * @tc.desc Verify decimal value 256 ordered after its byte-truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const orig: Long = new Long(256);
      const b1: byte = orig.toByte();
      const l1: Long = new Long(b1);
      const b2: byte = l1.toByte();
      const l2: Long = new Long(b2);
      const r: boolean = orig.isGreaterThan(l2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_2000
     * @tc.name testLongIsGreaterThan1_020
     * @tc.desc Verify Long.MAX_VALUE and Long.MIN_VALUE compared to zero long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max: Long = new Long(9223372036854775807);
      const min: Long = new Long(Long.MIN_VALUE);
      const zero: Long = new Long(0);
      expect(max.isGreaterThan(min)).assertTrue();
      expect(max.isGreaterThan(zero)).assertTrue();
      expect(max.isGreaterThan(max)).assertFalse();
      expect(min.isGreaterThan(max)).assertFalse();
      expect(min.isGreaterThan(zero)).assertFalse();
      expect(min.isGreaterThan(min)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISGREATERTHAN1_2100
     * @tc.name testLongIsGreaterThan1_021
     * @tc.desc Verify seventy seven incremented ten times compared equal to eighty seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsGreaterThan1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Long = new Long(77);
      for (let i: int = 0; i < 10; i++) {
        x = new Long(x.toLong() + 1);
      }
      const check: Long = new Long(87);
      const r: boolean = x.isGreaterThan(check);
      expect(r).assertFalse();
    });

  });
}
