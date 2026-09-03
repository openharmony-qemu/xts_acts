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

export default function longMul1Test(): void {
  describe('LongMul1Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL1_0100
     * @tc.name testLongMul1_001
     * @tc.desc Verify mul() multiplies value by positive unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongMul1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(20);
      const b: Long = new Long(22);
      const other: Long = a.add(b);
      const value: Long = new Long(1);
      const result: Long = value.mul(other);
      expect(result.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL1_0200
     * @tc.name testLongMul1_002
     * @tc.desc Verify mul() multiplies chained positive single-digit values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongMul1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(7);
      const b: Long = new Long(8);
      const c: Long = new Long(9);
      const result: Long = a.mul(b).mul(c);
      expect(result.toString()).assertEqual('504');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL1_0300
     * @tc.name testLongMul1_003
     * @tc.desc Verify mul() multiplies chained values with alternating signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongMul1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(-3);
      const b: Long = new Long(4);
      const c: Long = new Long(-5);
      const result: Long = a.mul(b).mul(c);
      expect(result.toString()).assertEqual('60');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL1_0400
     * @tc.name testLongMul1_004
     * @tc.desc Verify mul() multiplies small positive integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongMul1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(2);
      let b: Long = new Long(3);
      let r: Long = a.mul(b);
      expect(r.equals(new Long(6))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL1_0500
     * @tc.name testLongMul1_005
     * @tc.desc Verify mul() multiplies two-digit positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongMul1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(11);
      let b: Long = new Long(13);
      let r: Long = a.mul(b);
      expect(r.toString()).assertEqual('143');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL1_0600
     * @tc.name testLongMul1_006
     * @tc.desc Verify mul() is commutative for MAX_VALUE and MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongMul1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(9223372036854775807);
      let b: Long = new Long(Long.MIN_VALUE);
      expect(a.mul(b).toString()).assertEqual(b.mul(a).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL1_0700
     * @tc.name testLongMul1_007
     * @tc.desc Verify mul() multiplies chained values with mixed signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongMul1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(-2);
      let b: Long = new Long(3);
      let c: Long = new Long(-5);
      let d: Long = new Long(7);
      let r: Long = a.mul(b).mul(c).mul(d);
      expect(r.toString()).assertEqual('210');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_MUL1_0800
     * @tc.name testLongMul1_008
     * @tc.desc Verify mul() multiplies value by negative unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongMul1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(-1);
      let b: Long = new Long(-1);
      let r: Long = a.mul(b);
      expect(r.toLong()).assertEqual(1);
    });

  });
}
