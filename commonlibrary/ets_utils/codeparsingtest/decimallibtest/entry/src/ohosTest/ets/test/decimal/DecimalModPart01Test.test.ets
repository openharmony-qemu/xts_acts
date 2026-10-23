
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

export default function decimalModPart01TestTest() {
  describe('DecimalModPart01TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalModPart01TestTest001
     * @tc.desc Verify number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(10);
      expect(d.mod(3).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalModPart01TestTest002
     * @tc.desc Verify undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u = undefined;
      try {
        new Decimal(10).mod(u as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      try {
        new Decimal(10).mod(undefined as ESObject);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalModPart01TestTest003
     * @tc.desc Verify null undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: ESObject | null = null;
      const u: ESObject | undefined = undefined;
      try {
        new Decimal(10).mod(n as ESObject);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      try {
        new Decimal(10).mod(u as ESObject);
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalModPart01TestTest004
     * @tc.desc Verify Object undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, ESObject> = { n: undefined } as ESObject;
      try {
        new Decimal(10).mod(o.n as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalModPart01TestTest005
     * @tc.desc Verify 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(12).mod(4).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalModPart01TestTest006
     * @tc.desc Verify 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-12).mod(4).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalModPart01TestTest007
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-11).mod(4).toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalModPart01TestTest008
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(11).mod(-4).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalModPart01TestTest009
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-11).mod(-4).toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalModPart01TestTest010
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(3).mod(10).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalModPart01TestTest011
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-5).mod(100).toString()).assertEqual('-5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalModPart01TestTest012
     * @tc.desc Verify 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(7).mod(7).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalModPart01TestTest013
     * @tc.desc Verify 1 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(10).mod(1).toString()).assertEqual('0');
      expect(new Decimal(-10).mod(-1).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalModPart01TestTest014
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(10).mod(2.5).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalModPart01TestTest015
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(10.5).mod(3.2).toString()).assertEqual('0.9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalModPart01TestTest016
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.5).mod(3).toString()).assertEqual('0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalModPart01TestTest017
     * @tc.desc Verify 0.3 mod 0.2 Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.3).mod(0.2).toString()).assertEqual('0.1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalModPart01TestTest018
     * @tc.desc Verify 2.5 0.1 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(2.5).mod(0.1).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalModPart01TestTest019
     * @tc.desc Verify 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.5).mod(0.5).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalModPart01TestTest020
     * @tc.desc Verify number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-10.5).mod(2).toString()).assertEqual('-0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalModPart01TestTest021
     * @tc.desc Verify -0 -0 valueOf
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(-0).mod(5);
      expect(r.valueOf()).assertEqual('-0');
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalModPart01TestTest022
     * @tc.desc Verify +0 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(0).mod(5);
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalModPart01TestTest023
     * @tc.desc Verify -0 0 toString 0 isNegative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Decimal(-0).mod(5);
      const b = new Decimal(0).mod(5);
      expect(a.toString()).assertEqual(b.toString());
      expect(a.isNegative()).assertTrue();
      expect(b.isNegative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalModPart01TestTest024
     * @tc.desc Verify -0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(5).mod(-0).isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalModPart01TestTest025
     * @tc.desc Verify -0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-0).mod(-0).isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalModPart01TestTest026
     * @tc.desc Verify NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(5).mod(NaN);
      expect(r.isNaN()).assertTrue();
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalModPart01TestTest027
     * @tc.desc Verify NaN NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(NaN).mod(3).isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalModPart01TestTest028
     * @tc.desc Verify Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Infinity).mod(3).isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalModPart01TestTest029
     * @tc.desc Verify Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-Infinity).mod(3).isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalModPart01TestTest030
     * @tc.desc Verify Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(7).mod(Infinity).toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalModPart01TestTest031
     * @tc.desc Verify Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(7).mod(-Infinity).toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalModPart01TestTest032
     * @tc.desc Verify Infinity Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Infinity).mod(Infinity).isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalModPart01TestTest033
     * @tc.desc Verify Infinity Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-Infinity).mod(-Infinity).isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalModPart01TestTest034
     * @tc.desc Verify 0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(5).mod(0).isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalModPart01TestTest035
     * @tc.desc Verify 0 0 NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0).mod(0).isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalModPart01TestTest036
     * @tc.desc Verify 5 mod 0 toNumber NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(new Decimal(5).mod(0).toNumber())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalModPart01TestTest037
     * @tc.desc Verify 0x10 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(18).mod(0x10).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalModPart01TestTest038
     * @tc.desc Verify 0b101 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(13).mod(0b101).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalModPart01TestTest039
     * @tc.desc Verify 0o17 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(30).mod(0o17).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalModPart01TestTest040
     * @tc.desc Verify 0x10 mod 0b101 = 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0x10).mod(0b101).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalModPart01TestTest041
     * @tc.desc Verify 1e21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1e21).mod(7).toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalModPart01TestTest042
     * @tc.desc Verify 1e16 16 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1e16).mod(3).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalModPart01TestTest043
     * @tc.desc Verify 1.5e3 1500
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1.5e3).mod(7).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalModPart01TestTest044
     * @tc.desc Verify MAX_SAFE_INTEGER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(9007199254740991).mod(7).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalModPart01TestTest045
     * @tc.desc Verify MIN_SAFE_INTEGER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(-9007199254740991).mod(7).toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalModPart01TestTest046
     * @tc.desc Verify number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(9007199254740993).mod(7).toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalModPart01TestTest047
     * @tc.desc Verify MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Number.MIN_VALUE).mod(2);
      expect(r.toNumber()).assertEqual(Number.MIN_VALUE);
      expect(r.valueOf()).assertEqual('5e-324');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalModPart01TestTest048
     * @tc.desc Verify EPSILON 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Number.EPSILON).mod(2).equals(Number.EPSILON)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalModPart01TestTest049
     * @tc.desc Verify EPSILON MIN_VALUE 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Number.EPSILON).mod(Number.MIN_VALUE).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalModPart01TestTest050
     * @tc.desc Verify MAX_VALUE MAX_VALUE 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Number.MAX_VALUE).mod(Number.MAX_VALUE).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalModPart01TestTest051
     * @tc.desc Verify MAX_VALUE 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Number.MAX_VALUE).mod(3).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalModPart01TestTest052
     * @tc.desc Verify MAX_VALUE 1e308 number toNumber Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(Number.MAX_VALUE).mod(1e308);
      expect(r.toString()).assertEqual('7.976931348623157e+307');
      expect(r.toNumber()).assertEqual(7.976931348623157e+307);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalModPart01TestTest053
     * @tc.desc Verify 1e308 MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(1e308).mod(Number.MAX_VALUE).toNumber()).assertEqual(1e308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalModPart01TestTest054
     * @tc.desc Verify undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: ESObject | undefined = undefined;
      try {
        new Decimal(10).mod(u as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalModPart01TestTest055
     * @tc.desc Verify Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Decimal(3);
      const b = new Decimal(3).add(0);
      expect(new Decimal(10).mod(a).toString()).assertEqual(new Decimal(10).mod(b).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalModPart01TestTest056
     * @tc.desc Verify number|Decimal 2.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(7);
      expect(d.mod(2.5).toString()).assertEqual('2');
      expect(d.mod(new Decimal(2.5)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalModPart01TestTest057
     * @tc.desc Verify mod Decimal number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(10).mod(3) instanceof Decimal).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalModPart01TestTest058
     * @tc.desc Verify mod Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Decimal(10);
      const r = d.mod(3);
      expect(d.toString()).assertEqual('10');
      expect(r.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalModPart01TestTest059
     * @tc.desc Verify mod Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(10).mod(3).add(1).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalModPart01TestTest060
     * @tc.desc Verify mod
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(100).mod(7).mod(2).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalModPart01TestTest061
     * @tc.desc Verify mod toNumber number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(10).mod(3).toNumber()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalModPart01TestTest062
     * @tc.desc Verify 1e-2 0 valueOf toString '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Decimal(1).mod(1e-2);
      expect(r.toString()).assertEqual('0');
      expect(r.valueOf()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalModPart01TestTest063
     * @tc.desc Verify ''
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalModPart01TestTest064
     * @tc.desc Verify true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod(true as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalModPart01TestTest065
     * @tc.desc Verify {}
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod({} as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalModPart01TestTest066
     * @tc.desc Verify [3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10 as ESObject).mod([3] as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalModPart01TestTest067
     * @tc.desc Verify number error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod((() => 3) as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalModPart01TestTest068
     * @tc.desc Verify number error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod(new Date(0) as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalModPart01TestTest069
     * @tc.desc Verify number error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalModPart01TestTest070
     * @tc.desc Verify NaN [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(10).mod('NaN').toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_7100
     * @tc.name testDecimalModPart01TestTest071
     * @tc.desc Verify number error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('   ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_7200
     * @tc.name testDecimalModPart01TestTest072
     * @tc.desc Verify number error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('​');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_7300
     * @tc.name testDecimalModPart01TestTest073
     * @tc.desc Verify NUL
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('\u0000');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_7400
     * @tc.name testDecimalModPart01TestTest074
     * @tc.desc Verify number error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('a'.repeat(1000));
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_7500
     * @tc.name testDecimalModPart01TestTest075
     * @tc.desc Verify XSS
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('<script>alert(1)</script>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_7600
     * @tc.name testDecimalModPart01TestTest076
     * @tc.desc Verify emoji
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('👍');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_7700
     * @tc.name testDecimalModPart01TestTest077
     * @tc.desc Verify number error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('\uD800');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_7800
     * @tc.name testDecimalModPart01TestTest078
     * @tc.desc Verify '0xG'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('0xG');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_7900
     * @tc.name testDecimalModPart01TestTest079
     * @tc.desc Verify '3.2.1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('3.2.1');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_8000
     * @tc.name testDecimalModPart01TestTest080
     * @tc.desc Verify '.'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('.');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_8100
     * @tc.name testDecimalModPart01TestTest081
     * @tc.desc Verify '1,000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('1,000');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_8200
     * @tc.name testDecimalModPart01TestTest082
     * @tc.desc Verify '1_000' [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(10).mod('1_000').toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_8300
     * @tc.name testDecimalModPart01TestTest083
     * @tc.desc Verify '1\n2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('1\n2');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_8400
     * @tc.name testDecimalModPart01TestTest084
     * @tc.desc Verify 'e5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('e5');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_8500
     * @tc.name testDecimalModPart01TestTest085
     * @tc.desc Verify '1e'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('1e');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_8600
     * @tc.name testDecimalModPart01TestTest086
     * @tc.desc Verify '12a34'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('12a34');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_MOD_PART01_SUPPLEMENT_TEST_8700
     * @tc.name testDecimalModPart01TestTest087
     * @tc.desc Verify 'abc'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalModPart01TestTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal(10).mod('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });


  });

}
