
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-dynamic';
import { Decimal } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function decimalOverviewPart07TestTest() {
  describe('DecimalOverviewPart07TestTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0010
     * @tc.name testDecimalOverviewPart07TestTest001
     * @tc.desc Verify sum() 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.sum();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0020
     * @tc.name testDecimalOverviewPart07TestTest002
     * @tc.desc Verify sum(1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.sum(1).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0030
     * @tc.name testDecimalOverviewPart07TestTest003
     * @tc.desc Verify sum(1,2,3)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.sum(1, 2, 3).toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0040
     * @tc.name testDecimalOverviewPart07TestTest004
     * @tc.desc Verify max() 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.max();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0050
     * @tc.name testDecimalOverviewPart07TestTest005
     * @tc.desc Verify min() 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.min();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0060
     * @tc.name testDecimalOverviewPart07TestTest006
     * @tc.desc Verify hypot() 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.hypot().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0070
     * @tc.name testDecimalOverviewPart07TestTest007
     * @tc.desc Verify hypot(3,4)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.hypot(3, 4).toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0080
     * @tc.name testDecimalOverviewPart07TestTest008
     * @tc.desc Verify add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.add(1, 1).toString()).assertEqual('2');
      expect(Decimal.sum(1, 2, 3).toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0090
     * @tc.name testDecimalOverviewPart07TestTest009
     * @tc.desc Verify +Infinity Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Infinity);
      expect(d.toString()).assertEqual('Infinity');
      expect(d.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalOverviewPart07TestTest010
     * @tc.desc Verify -0 valueOf
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-0);
      expect(d.isNegative()).assertTrue();
      expect(1 / Number(d.valueOf())).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0110
     * @tc.name testDecimalOverviewPart07TestTest011
     * @tc.desc Verify Number.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MAX_VALUE);
      expect(d.toString()).assertEqual('1.7976931348623157e+308');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0120
     * @tc.name testDecimalOverviewPart07TestTest012
     * @tc.desc Verify Number.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MIN_VALUE);
      expect(d.toString()).assertEqual('5e-324');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0130
     * @tc.name testDecimalOverviewPart07TestTest013
     * @tc.desc Verify Number.EPSILON
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.EPSILON);
      expect(d.toString()).assertEqual('2.220446049250313e-16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0140
     * @tc.name testDecimalOverviewPart07TestTest014
     * @tc.desc Verify Number.MAX_SAFE_INTEGER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(d.toString()).assertEqual('9007199254740991');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0150
     * @tc.name testDecimalOverviewPart07TestTest015
     * @tc.desc Verify Number.MIN_SAFE_INTEGER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MIN_SAFE_INTEGER);
      expect(d.toString()).assertEqual('-9007199254740991');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0160
     * @tc.name testDecimalOverviewPart07TestTest016
     * @tc.desc Verify 0.1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0.1);
      expect(d.toString()).assertEqual('0.1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0170
     * @tc.name testDecimalOverviewPart07TestTest017
     * @tc.desc Verify 1e-7 toExpNeg -7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1e-7);
      expect(d.toString()).assertEqual('1e-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0180
     * @tc.name testDecimalOverviewPart07TestTest018
     * @tc.desc Verify 1e-6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1e-6);
      expect(d.toString()).assertEqual('0.000001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0190
     * @tc.name testDecimalOverviewPart07TestTest019
     * @tc.desc Verify 0x10 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0x10);
      expect(d.toString()).assertEqual('16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalOverviewPart07TestTest020
     * @tc.desc Verify 1e21 toExpPos 21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1e21);
      expect(d.toString()).assertEqual('1e+21');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0210
     * @tc.name testDecimalOverviewPart07TestTest021
     * @tc.desc Verify -123.456
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-123.456);
      expect(d.toString()).assertEqual('-123.456');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0220
     * @tc.name testDecimalOverviewPart07TestTest022
     * @tc.desc Verify 9e15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(9e15);
      expect(d.toString()).assertEqual('9000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0230
     * @tc.name testDecimalOverviewPart07TestTest023
     * @tc.desc Verify 9000000000000001 JS
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(9000000000000001);
      expect(d.toString()).assertEqual('9000000000000001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0240
     * @tc.name testDecimalOverviewPart07TestTest024
     * @tc.desc Verify 0.1 + 0.2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.add(0.1, 0.2).toString()).assertEqual('0.3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0250
     * @tc.name testDecimalOverviewPart07TestTest025
     * @tc.desc Verify MAX_VALUE toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(Number.MAX_VALUE).mul(Number.MAX_VALUE);
      expect(d.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0260
     * @tc.name testDecimalOverviewPart07TestTest026
     * @tc.desc Verify '123'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('123');
      expect(d.toString()).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0270
     * @tc.name testDecimalOverviewPart07TestTest027
     * @tc.desc Verify '123.456e2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('123.456e2');
      expect(d.toString()).assertEqual('12345.6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0280
     * @tc.name testDecimalOverviewPart07TestTest028
     * @tc.desc Verify '0.0000001' toExpNeg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('0.0000001');
      expect(d.toString()).assertEqual('1e-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0290
     * @tc.name testDecimalOverviewPart07TestTest029
     * @tc.desc Verify '1.2e+3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('1.2e+3');
      expect(d.toString()).assertEqual('1200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalOverviewPart07TestTest030
     * @tc.desc Verify NUL ' ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('\u0000');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0310
     * @tc.name testDecimalOverviewPart07TestTest031
     * @tc.desc Verify - ' '
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('١٢٣');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0320
     * @tc.name testDecimalOverviewPart07TestTest032
     * @tc.desc Verify ' '
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('１２３');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0330
     * @tc.name testDecimalOverviewPart07TestTest033
     * @tc.desc Verify '1\n2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('1\n2');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0340
     * @tc.name testDecimalOverviewPart07TestTest034
     * @tc.desc Verify 60
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = '123456789012345678901234567890123456789012345678901234567890';
      const d = new Decimal(s);
      expect(d.toString()).assertEqual('1.2345678901234567890123456789012345678901234567890123456789e+59');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0350
     * @tc.name testDecimalOverviewPart07TestTest035
     * @tc.desc Verify 'x'.repeat(10000)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bad = 'x'.repeat(10000);
      try {
        new Decimal(bad);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0360
     * @tc.name testDecimalOverviewPart07TestTest036
     * @tc.desc Verify XSS
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('"><script>alert(1)</script>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0370
     * @tc.name testDecimalOverviewPart07TestTest037
     * @tc.desc Verify '5e-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('5e-7');
      expect(d.toString()).assertEqual('5e-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0380
     * @tc.name testDecimalOverviewPart07TestTest038
     * @tc.desc Verify '-1.5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('-1.5');
      expect(d.toString()).assertEqual('-1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0390
     * @tc.name testDecimalOverviewPart07TestTest039
     * @tc.desc Verify ' 123 ' trim
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const d = new Decimal(' 123 ');
        expect(d.toString()).assertEqual('123');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalOverviewPart07TestTest040
     * @tc.desc Verify '\uD800'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('\uD800');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0410
     * @tc.name testDecimalOverviewPart07TestTest041
     * @tc.desc Verify toFixed() dp 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(123.456);
      expect(d.toFixed()).assertEqual('123.456');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0420
     * @tc.name testDecimalOverviewPart07TestTest042
     * @tc.desc Verify toPrecision() sd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(123.45);
      expect(d.toPrecision()).assertEqual('123.45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0430
     * @tc.name testDecimalOverviewPart07TestTest043
     * @tc.desc Verify Decimal.set({})
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({});
      const d = new Decimal(123.456);
      expect(d.toString()).assertEqual('123.456');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0440
     * @tc.name testDecimalOverviewPart07TestTest044
     * @tc.desc Verify add null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.add(null as ESObject, 1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0450
     * @tc.name testDecimalOverviewPart07TestTest045
     * @tc.desc Verify add undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
         Decimal.add(1, undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0460
     * @tc.name testDecimalOverviewPart07TestTest046
     * @tc.desc Verify number|string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(5).toString()).assertEqual('5');
      expect(new Decimal('5').toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0470
     * @tc.name testDecimalOverviewPart07TestTest047
     * @tc.desc Verify number|string|Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Decimal(7);
      expect(new Decimal(7).toString()).assertEqual('7');
      expect(new Decimal('7').toString()).assertEqual('7');
      expect(new Decimal(base).toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0480
     * @tc.name testDecimalOverviewPart07TestTest048
     * @tc.desc Verify Object 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: object = { v: 5 } as ESObject;
      try {
         new Decimal(obj as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0490
     * @tc.name testDecimalOverviewPart07TestTest049
     * @tc.desc Verify Map 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(new Map<string, number>() as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalOverviewPart07TestTest050
     * @tc.desc Verify object input 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit: boolean = false;
      try {
        new Decimal({ v: 4 } as ESObject).toFixed(2 as ESObject);
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();


    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0510
     * @tc.name testDecimalOverviewPart07TestTest051
     * @tc.desc Verify RegExp 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
         new Decimal(new RegExp('\\d+') as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0520
     * @tc.name testDecimalOverviewPart07TestTest052
     * @tc.desc Verify Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Decimal('5');
      const b = new Decimal('5');
      expect(a.comparedTo(b)).assertEqual(0);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0530
     * @tc.name testDecimalOverviewPart07TestTest053
     * @tc.desc Verify number+string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.add(1, '2').toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0540
     * @tc.name testDecimalOverviewPart07TestTest054
     * @tc.desc Verify string+number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.add('1', 2).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0550
     * @tc.name testDecimalOverviewPart07TestTest055
     * @tc.desc Verify Decimal+string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.add(new Decimal(1), '2').toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0560
     * @tc.name testDecimalOverviewPart07TestTest056
     * @tc.desc Verify number+Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.add(1, new Decimal('2')).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0570
     * @tc.name testDecimalOverviewPart07TestTest057
     * @tc.desc Verify Decimal+Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.add(new Decimal('1'), new Decimal('2')).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0580
     * @tc.name testDecimalOverviewPart07TestTest058
     * @tc.desc Verify number|string|Decimal|undefined undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1).toString()).assertEqual('1');
      expect(new Decimal('1').toString()).assertEqual('1');
      expect(new Decimal(new Decimal(1)).toString()).assertEqual('1');
      try {
        new Decimal(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0590
     * @tc.name testDecimalOverviewPart07TestTest059
     * @tc.desc Verify null boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      try {
        new Decimal(false as ESObject);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalOverviewPart07TestTest060
     * @tc.desc Verify toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('123.45');
      expect(d.toString()).assertEqual('123.45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0610
     * @tc.name testDecimalOverviewPart07TestTest061
     * @tc.desc Verify toNumber number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('123.45');
      expect(d.toNumber()).assertEqual(123.45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0620
     * @tc.name testDecimalOverviewPart07TestTest062
     * @tc.desc Verify d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('12345');
      expect(Array.isArray(d.d)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0630
     * @tc.name testDecimalOverviewPart07TestTest063
     * @tc.desc Verify e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('12345');
      expect(d.e).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0640
     * @tc.name testDecimalOverviewPart07TestTest064
     * @tc.desc Verify s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('-12345');
      expect(d.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0650
     * @tc.name testDecimalOverviewPart07TestTest065
     * @tc.desc Verify valueOf number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('123.45');
      expect(d.valueOf()).assertEqual('123.45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0660
     * @tc.name testDecimalOverviewPart07TestTest066
     * @tc.desc Verify Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(5).add(3).mul(2);
      expect(r.toNumber()).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0670
     * @tc.name testDecimalOverviewPart07TestTest067
     * @tc.desc Verify toFixed(2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(123.456);
      expect(d.toFixed(2)).assertEqual('123.46');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0680
     * @tc.name testDecimalOverviewPart07TestTest068
     * @tc.desc Verify toPrecision(5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(123.456);
      expect(d.toPrecision(5)).assertEqual('123.46');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0690
     * @tc.name testDecimalOverviewPart07TestTest069
     * @tc.desc Verify isInteger
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(5).isInteger()).assertTrue();
      expect(new Decimal(5.5).isInteger()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalOverviewPart07TestTest070
     * @tc.desc Verify isFinite
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(5).isFinite()).assertTrue();
      expect(new Decimal(Infinity).isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0710
     * @tc.name testDecimalOverviewPart07TestTest071
     * @tc.desc Verify isNegative isPositive
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-5).isNegative()).assertTrue();
      expect(new Decimal(-5).isPositive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0720
     * @tc.name testDecimalOverviewPart07TestTest072
     * @tc.desc Verify eq/lt/gt
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(5).equals(5)).assertTrue();
      expect(new Decimal(5).lessThan(6)).assertTrue();
      expect(new Decimal(5).greaterThan(4)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0730
     * @tc.name testDecimalOverviewPart07TestTest073
     * @tc.desc Verify sqrt NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-4);
      expect(d.sqrt().isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0740
     * @tc.name testDecimalOverviewPart07TestTest074
     * @tc.desc Verify toFixed(101) 10200001 [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1.5);
      try {
        d.toFixed(101 as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0750
     * @tc.name testDecimalOverviewPart07TestTest075
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
         new Decimal([[1], [2]] as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0760
     * @tc.name testDecimalOverviewPart07TestTest076
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: object = {} as ESObject;
      try {
         new Decimal(empty as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0770
     * @tc.name testDecimalOverviewPart07TestTest077
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn = (): number => { return 1; };
      try {
         new Decimal(fn as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0780
     * @tc.name testDecimalOverviewPart07TestTest078
     * @tc.desc Verify XSS
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('<img src=x onerror=alert(1)>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0790
     * @tc.name testDecimalOverviewPart07TestTest079
     * @tc.desc Verify '1e'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('1e');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalOverviewPart07TestTest080
     * @tc.desc Verify 1/3 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(1).div(3);
      expect(d.toString()).assertEqual('0.33333333333333333333');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0810
     * @tc.name testDecimalOverviewPart07TestTest081
     * @tc.desc Verify toFixed(0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(123.456);
      expect(d.toFixed(0)).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0820
     * @tc.name testDecimalOverviewPart07TestTest082
     * @tc.desc Verify toPrecision(3)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(12345);
      expect(d.toPrecision(3)).assertEqual('1.23e+4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0830
     * @tc.name testDecimalOverviewPart07TestTest083
     * @tc.desc Verify 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('1e-999999');
      expect(d.toString()).assertEqual('1e-999999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0840
     * @tc.name testDecimalOverviewPart07TestTest084
     * @tc.desc Verify toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('9e999').mul('9e999');
      expect(d.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0850
     * @tc.name testDecimalOverviewPart07TestTest085
     * @tc.desc Verify set rounding 0 toFixed
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 0 });
      const d = new Decimal(1.55);
      expect(d.toFixed(1)).assertEqual('1.6');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0860
     * @tc.name testDecimalOverviewPart07TestTest086
     * @tc.desc Verify 0.1 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(0.1).mul(10);
      expect(d.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0870
     * @tc.name testDecimalOverviewPart07TestTest087
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(-1).div(3);
      expect(d.toString()).assertEqual('-0.33333333333333333333');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0880
     * @tc.name testDecimalOverviewPart07TestTest088
     * @tc.desc Verify string values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal('99999999999999999999999999').add(1);
      expect(d.toString()).assertEqual('1e+26');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0890
     * @tc.name testDecimalOverviewPart07TestTest089
     * @tc.desc Verify set precision 3 half-up
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 3 });
      const d = new Decimal(2).div(3);
      expect(d.toString()).assertEqual('0.667');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalOverviewPart07TestTest090
     * @tc.desc Verify set toExpPos toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 5 });
      const d = new Decimal(123456);
      expect(d.toString()).assertEqual('1.23456e+5');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0910
     * @tc.name testDecimalOverviewPart07TestTest091
     * @tc.desc Verify toExpNeg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      const d = new Decimal('0.00001');
      expect(d.toString()).assertEqual('0.00001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0920
     * @tc.name testDecimalOverviewPart07TestTest092
     * @tc.desc Verify set toExpNeg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ toExpNeg: 5 });
        const d = new Decimal('0.00001');
        expect(d.toString()).assertEqual('0.00001');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0930
     * @tc.name testDecimalOverviewPart07TestTest093
     * @tc.desc Verify includeZeros
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      const d = new Decimal('1.500');
      expect(d.toString()).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0940
     * @tc.name testDecimalOverviewPart07TestTest094
     * @tc.desc Verify set includeZeros
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ includeZeros: true } as ESObject);
      const d = new Decimal('1.500');
      expect(d.toString()).assertEqual('1.5');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0950
     * @tc.name testDecimalOverviewPart07TestTest095
     * @tc.desc Verify set rounding 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 1 });
      const d = new Decimal(2).div(3);
      expect(d.toString()).assertEqual('0.66666666666666666666');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0960
     * @tc.name testDecimalOverviewPart07TestTest096
     * @tc.desc Verify number string sub
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.sub(5, '2').toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0970
     * @tc.name testDecimalOverviewPart07TestTest097
     * @tc.desc Verify Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(6).mul('2').toString()).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0980
     * @tc.name testDecimalOverviewPart07TestTest098
     * @tc.desc Verify MAX_SAFE_INTEGER number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toString()).assertEqual(new Decimal('9007199254740991').toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_0990
     * @tc.name testDecimalOverviewPart07TestTest099
     * @tc.desc Verify '0.1' '0.10' Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Decimal('0.1');
      const b = new Decimal('0.10');
      expect(a.comparedTo(b)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART07_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalOverviewPart07TestTest100
     * @tc.desc Verify Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart07TestTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Decimal('42');
      const n = new Decimal(42);
      expect(s.equals(n)).assertTrue();
    });


  });

}
