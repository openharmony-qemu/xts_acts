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

export default function longIsLessEqualThan1Test(): void {
  describe('LongIsLessEqualThan1Test', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_0100
     * @tc.name testLongIsLessEqualThan1_001
     * @tc.desc Verify isLessEqualThan returns false comparing Long.MAX_VALUE with Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(Long.MAX_VALUE).isLessEqualThan(new Long(Long.MIN_VALUE));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_0200
     * @tc.name testLongIsLessEqualThan1_002
     * @tc.desc Verify isLessEqualThan returns true for equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(100).isLessEqualThan(new Long(0o144));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_0300
     * @tc.name testLongIsLessEqualThan1_003
     * @tc.desc Verify isLessEqualThan returns false comparing 10^10 scale negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(-9999999999).isLessEqualThan(new Long(-10000000000));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_0400
     * @tc.name testLongIsLessEqualThan1_004
     * @tc.desc Verify isLessEqualThan returns true comparing 10^10 scale negative values in reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(-10000000000).isLessEqualThan(new Long(-9999999999));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_0500
     * @tc.name testLongIsLessEqualThan1_005
     * @tc.desc Verify isLessEqualThan does not mutate Long.MAX_VALUE operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MAX_VALUE);
      const b: Long = new Long(Long.MIN_VALUE);
      const aBefore: long = a.toLong();
      a.isLessEqualThan(b);
      expect(a.toLong()).assertEqual(aBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_0600
     * @tc.name testLongIsLessEqualThan1_006
     * @tc.desc Verify isLessEqualThan does not mutate compared operand toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(500);
      const b: Long = new Long(600);
      const bStr: string = b.toString();
      a.isLessEqualThan(b);
      a.isLessEqualThan(b);
      expect(b.toString()).assertEqual(bStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_0700
     * @tc.name testLongIsLessEqualThan1_007
     * @tc.desc Verify isLessEqualThan preserves compareTo result for boundary operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MAX_VALUE);
      const b: Long = new Long(Long.MIN_VALUE);
      a.isLessEqualThan(b);
      expect(a.compareTo(b)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_0800
     * @tc.name testLongIsLessEqualThan1_008
     * @tc.desc Verify isLessEqualThan returns consistent result for repeated equal operand comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MIN_VALUE);
      const b: Long = new Long(Long.MIN_VALUE);
      const r1: boolean = a.isLessEqualThan(b);
      const r2: boolean = a.isLessEqualThan(b);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_0900
     * @tc.name testLongIsLessEqualThan1_009
     * @tc.desc Verify isLessEqualThan does not mutate equal operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: Long = new Long(1234);
      const a2: Long = new Long(1234);
      const b: Long = new Long(5678);
      a1.isLessEqualThan(b);
      a2.isLessEqualThan(b);
      expect(a1.toLong()).assertEqual(a2.toLong());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_1000
     * @tc.name testLongIsLessEqualThan1_010
     * @tc.desc Verify isLessEqualThan returns true for equal Long.MAX_VALUE operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: Long = new Long(Long.MAX_VALUE);
      const a2: Long = new Long(Long.MAX_VALUE);
      const b: Long = new Long(Long.MAX_VALUE);
      const r1: boolean = a1.isLessEqualThan(b);
      const r2: boolean = a2.isLessEqualThan(b);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_1100
     * @tc.name testLongIsLessEqualThan1_011
     * @tc.desc Verify isLessEqualThan returns true for same object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(12345);
      const b: Long = a;
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_1200
     * @tc.name testLongIsLessEqualThan1_012
     * @tc.desc Verify isLessEqualThan returns true comparing zero with one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(0b0).isLessEqualThan(new Long(0b1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_1300
     * @tc.name testLongIsLessEqualThan1_013
     * @tc.desc Verify isLessEqualThan returns false comparing one with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Long(0b1).isLessEqualThan(new Long(0b0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_1400
     * @tc.name testLongIsLessEqualThan1_014
     * @tc.desc Verify isLessEqualThan returns true for chained increasing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1: boolean = new Long(10).isLessEqualThan(new Long(15));
      const result2: boolean = new Long(15).isLessEqualThan(new Long(20));
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_1500
     * @tc.name testLongIsLessEqualThan1_015
     * @tc.desc Verify isLessEqualThan satisfies transitive relation 3<=7<=12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const transitive: boolean = new Long(3).isLessEqualThan(new Long(7)) && new Long(7).isLessEqualThan(new Long(12));
      expect(transitive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_ISLESSEQUALTHAN1_1600
     * @tc.name testLongIsLessEqualThan1_016
     * @tc.desc Verify negated isLessEqualThan returns true when left operand greater than right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongIsLessEqualThan1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = !new Long(10).isLessEqualThan(new Long(5));
      expect(result).assertTrue();
    });
  });
}
