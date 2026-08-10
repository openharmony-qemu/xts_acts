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

export default function longDiv1Test(): void {
  describe('LongDiv1Test', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_0100
     * @tc.name testLongDiv1_001
     * @tc.desc Verify negative divided by negative truncates toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(-10);
      let result: Long = a.div(new Long(-3));
      expect(result.toLong()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_0200
     * @tc.name testLongDiv1_002
     * @tc.desc Verify positive divided by negative truncates toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(10);
      let result: Long = a.div(new Long(-3));
      expect(result.toLong()).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_0300
     * @tc.name testLongDiv1_003
     * @tc.desc Verify div does not mutate original Long.MAX_VALUE and returns correct quotient
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = Long.MAX_VALUE;
      const before: long = a.toLong();
      const result: Long = a.div(1024);
      expect(a.toLong()).assertEqual(before);
      expect(result.toLong()).assertEqual(9007199254740991);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_0400
     * @tc.name testLongDiv1_004
     * @tc.desc Verify div does not mutate original Long value 120 and returns correct quotient 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = 120;
      const before: long = a.toLong();
      const result: Long = a.div(6);
      expect(a.toLong()).assertEqual(before);
      expect(result.toLong()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_0500
     * @tc.name testLongDiv1_005
     * @tc.desc Verify div does not mutate original negative Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = -360;
      const before: long = a.toLong();
      const result: Long = a.div(24);
      expect(a.toLong()).assertEqual(before);
      expect(result.toLong()).assertEqual(-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_0600
     * @tc.name testLongDiv1_006
     * @tc.desc Verify zero divided by positive value returns zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = 0;
      const result: Long = a.div(256);
      expect(result.toLong()).assertEqual(a.toLong());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_0700
     * @tc.name testLongDiv1_007
     * @tc.desc Verify div does not mutate original Long value 256 and returns correct quotient -16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = 256;
      const before: long = a.toLong();
      const result: Long = a.div(-16);
      expect(a.toLong()).assertEqual(before);
      expect(result.toLong()).assertEqual(-16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_0800
     * @tc.name testLongDiv1_008
     * @tc.desc Verify Long value divided by itself returns one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = 144;
      const before: long = a.toLong();
      const result: Long = a.div(144);
      expect(a.toLong()).assertEqual(before);
      expect(result.toLong()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_0900
     * @tc.name testLongDiv1_009
     * @tc.desc Verify repeated div calls return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = 120;
      const r1: Long = a.div(6);
      const r2: Long = a.div(6);
      expect(r1.toLong()).assertEqual(r2.toLong());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_1000
     * @tc.name testLongDiv1_010
     * @tc.desc Verify positive Long values divide evenly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(120).div(new Long(6));
      const v = result.toLong();
      expect(v).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_1100
     * @tc.name testLongDiv1_011
     * @tc.desc Verify positive division returns the expected quotient
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(120).div(new Long(6));
      expect(result.equals(20)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_1200
     * @tc.name testLongDiv1_012
     * @tc.desc Verify chained division 720/6/5 compared equal to 24 via compareTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(720).div(new Long(6)).div(5);
      expect(result.compareTo(24)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_1300
     * @tc.name testLongDiv1_013
     * @tc.desc Verify chained division 4096/2/2/2 equals 512
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(4096).div(new Long(2)).div(2).div(2);
      expect(result.compareTo(512)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_1400
     * @tc.name testLongDiv1_014
     * @tc.desc Verify chained division 720/6/5 equals 24 via equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(720).div(new Long(6)).div(5);
      expect(result.equals(24)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_1500
     * @tc.name testLongDiv1_015
     * @tc.desc Verify chained division (-720)/6/(-5) equals 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = (-720).div(6).div(-5);
      expect(result.compareTo(24)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_1600
     * @tc.name testLongDiv1_016
     * @tc.desc Verify chained division of large values 10000000000/100/100 equals 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(10000000000).div(new Long(100)).div(100);
      expect(result.compareTo(1000000)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_1700
     * @tc.name testLongDiv1_017
     * @tc.desc Verify different division orders produce equivalent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Long = new Long(120).div(new Long(6));
      const r2: Long = new Long(120).div(new Long(3)).div(2);
      expect(r1.compareTo(r2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_1800
     * @tc.name testLongDiv1_018
     * @tc.desc Verify hex literal operands divide correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = (0xff).div(0xf);
      expect(result.compareTo(0x11)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_1900
     * @tc.name testLongDiv1_019
     * @tc.desc Verify division with negative operand truncates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Long = new Long(-(-1));
        const b: Long = new Long(-1);
        const result: Long = a.div(b);
        expect(result.toString()).assertEqual('-1');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_2000
     * @tc.name testLongDiv1_020
     * @tc.desc Verify div does not mutate original Long value via toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Long = new Long(2147483647);
        const b: Long = new Long(2);
        const before: int = a.toInt();
        const result: Long = a.div(b);
        expect(a.toInt()).assertEqual(before);
        const q: long = result.toLong();
        expect(q).assertEqual(1073741823);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_2100
     * @tc.name testLongDiv1_021
     * @tc.desc Verify minimum long value divided by large divisor truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const a: Long = new Long(Long.MIN_VALUE);
        const b: Long = new Long(999999);
        const result: Long = a.div(b);
        expect(result.toString()).assertEqual('-9223381260236');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_2200
     * @tc.name testLongDiv1_022
     * @tc.desc Verify division by zero throws an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = 100;
      try {
        const result: Long = a.div(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArithmeticError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_2300
     * @tc.name testLongDiv1_023
     * @tc.desc Verify Long.MIN_VALUE divided by zero throws an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = Long.MIN_VALUE;
      try {
        const result: Long = a.div(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArithmeticError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_DIV1_2400
     * @tc.name testLongDiv1_024
     * @tc.desc Verify Long.MIN_VALUE divided by -1 overflows and wraps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongDiv1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = Long.MIN_VALUE;
      const result: Long = a.div(-1);
      const q: long = result.toLong();
      expect(q).assertEqual(Long.MIN_VALUE);
    });
  });
}
