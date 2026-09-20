
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Decimal } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function decimalOverviewPart03TestTest() {
  describe('DecimalOverviewPart03TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0010
     * @tc.name testDecimalOverviewPart03TestTest001
     * @tc.desc Verify Decimal 401 undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0020
     * @tc.name testDecimalOverviewPart03TestTest002
     * @tc.desc Verify sum rest 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.sum();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0030
     * @tc.name testDecimalOverviewPart03TestTest003
     * @tc.desc Verify min 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.min();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0040
     * @tc.name testDecimalOverviewPart03TestTest004
     * @tc.desc Verify max 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.max();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0050
     * @tc.name testDecimalOverviewPart03TestTest005
     * @tc.desc Verify hypot 0 Decimal toNumber 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.hypot();
      expect(r.toNumber()).assertEqual(0);
      expect(r.isZero()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0060
     * @tc.name testDecimalOverviewPart03TestTest006
     * @tc.desc Verify add 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(5).add(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0070
     * @tc.name testDecimalOverviewPart03TestTest007
     * @tc.desc Verify sub 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(5).sub(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0080
     * @tc.name testDecimalOverviewPart03TestTest008
     * @tc.desc Verify add 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal({ valueOf: (): number => 5 } as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0090
     * @tc.name testDecimalOverviewPart03TestTest009
     * @tc.desc Verify comparedTo 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let r: number = new Decimal(5).comparedTo(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalOverviewPart03TestTest010
     * @tc.desc Verify set 401 [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set(undefined as ESObject);
      } catch (e) {
        expect((e as Error).name.length > 0).assertTrue();
      }
      Decimal.set({ defaults: true });
    });
  
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0110
     * @tc.name testDecimalOverviewPart03TestTest011
     * @tc.desc Verify mul undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(5).mul(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0120
     * @tc.name testDecimalOverviewPart03TestTest012
     * @tc.desc Verify add undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = Decimal.add(undefined as ESObject, 1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0130
     * @tc.name testDecimalOverviewPart03TestTest013
     * @tc.desc Verify sub undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.sub(1, undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0140
     * @tc.name testDecimalOverviewPart03TestTest014
     * @tc.desc Verify greaterThan undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let r: boolean = new Decimal(5).greaterThan(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0150
     * @tc.name testDecimalOverviewPart03TestTest015
     * @tc.desc Verify equals undefined 401 equals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let r: boolean = new Decimal(5).equals(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0160
     * @tc.name testDecimalOverviewPart03TestTest016
     * @tc.desc Verify sum rest undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.sum(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0170
     * @tc.name testDecimalOverviewPart03TestTest017
     * @tc.desc Verify max rest undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.max(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0180
     * @tc.name testDecimalOverviewPart03TestTest018
     * @tc.desc Verify null 401 null undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0190
     * @tc.name testDecimalOverviewPart03TestTest019
     * @tc.desc Verify add null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(5).add(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalOverviewPart03TestTest020
     * @tc.desc Verify div null 401 null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(5).div(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0210
     * @tc.name testDecimalOverviewPart03TestTest021
     * @tc.desc Verify mod null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(5).mod(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0220
     * @tc.name testDecimalOverviewPart03TestTest022
     * @tc.desc Verify add null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = Decimal.add(null as ESObject, 5);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0230
     * @tc.name testDecimalOverviewPart03TestTest023
     * @tc.desc Verify mul null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.mul(5, null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0240
     * @tc.name testDecimalOverviewPart03TestTest024
     * @tc.desc Verify comparedTo null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let r: number = new Decimal(5).comparedTo(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0250
     * @tc.name testDecimalOverviewPart03TestTest025
     * @tc.desc Verify lessThan null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let r: boolean = new Decimal(5).lessThan(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0260
     * @tc.name testDecimalOverviewPart03TestTest026
     * @tc.desc Verify pow null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(2).pow(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0270
     * @tc.name testDecimalOverviewPart03TestTest027
     * @tc.desc Verify sum rest null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.sum(1, null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0280
     * @tc.name testDecimalOverviewPart03TestTest028
     * @tc.desc Verify min rest null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.min(null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0290
     * @tc.name testDecimalOverviewPart03TestTest029
     * @tc.desc Verify sum null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = Decimal.sum(1, null as ESObject, 3);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalOverviewPart03TestTest030
     * @tc.desc Verify sum undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = Decimal.sum(1, undefined as ESObject, 3);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0310
     * @tc.name testDecimalOverviewPart03TestTest031
     * @tc.desc Verify sum undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.sum(1, 2, undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0320
     * @tc.name testDecimalOverviewPart03TestTest032
     * @tc.desc Verify max null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = Decimal.max(3, null as ESObject, 9);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0330
     * @tc.name testDecimalOverviewPart03TestTest033
     * @tc.desc Verify min undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
      let d: Decimal = Decimal.min(3, undefined as ESObject, 9);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0340
     * @tc.name testDecimalOverviewPart03TestTest034
     * @tc.desc Verify dividedToIntegerBy undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7).dividedToIntegerBy(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0350
     * @tc.name testDecimalOverviewPart03TestTest035
     * @tc.desc Verify clamp null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(5).clamp(0, null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0360
     * @tc.name testDecimalOverviewPart03TestTest036
     * @tc.desc Verify set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 7 });
      Decimal.set({});
      let r: Decimal = new Decimal(1).div(3);
      expect(r.toString()).assertEqual('0.3333333');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0370
     * @tc.name testDecimalOverviewPart03TestTest037
     * @tc.desc Verify set precision undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 9 });
      Decimal.set({ precision: undefined });
      let r: Decimal = new Decimal(1).div(3);
      expect(r.toString()).assertEqual('0.333333333');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0380
     * @tc.name testDecimalOverviewPart03TestTest038
     * @tc.desc Verify set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: 1 });
      Decimal.set({ precision: 5 });
      let r: Decimal = new Decimal(2.5).toDecimalPlaces(0);
      expect(r.toString()).assertEqual('2');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0390
     * @tc.name testDecimalOverviewPart03TestTest039
     * @tc.desc Verify set defaults=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 2, rounding: 1 });
      Decimal.set({ defaults: true });
      let r: Decimal = new Decimal(1).div(3);
      expect(r.toString()).assertEqual('0.33333333333333333333');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalOverviewPart03TestTest040
     * @tc.desc Verify set defaults=true precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      Decimal.set({ defaults: true, precision: 3 });
      let r: Decimal = new Decimal(1).div(3);
      expect(r.toString()).assertEqual('0.333');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0410
     * @tc.name testDecimalOverviewPart03TestTest041
     * @tc.desc Verify set defaults=false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 6 });
      Decimal.set({ defaults: false, rounding: 0 });
      let r: Decimal = new Decimal(1).div(3);
      expect(r.toString()).assertEqual('0.333334');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0420
     * @tc.name testDecimalOverviewPart03TestTest042
     * @tc.desc Verify set null 401 [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set(null as ESObject);
      } catch (e) {
        expect((e as Error).name.length > 0).assertTrue();
      }
      Decimal.set({ defaults: true });
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0430
     * @tc.name testDecimalOverviewPart03TestTest043
     * @tc.desc Verify set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 4 });
      let a: string = new Decimal(1).div(3).toString();
      Decimal.set({ rounding: 1 });
      let b: string = new Decimal(2.5).toDecimalPlaces(0).toString();
      expect(a).assertEqual('0.3333');
      expect(b).assertEqual('2');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0440
     * @tc.name testDecimalOverviewPart03TestTest044
     * @tc.desc Verify string '5' number 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('5');
      let b: Decimal = new Decimal(5);
      expect(a.toString()).assertEqual('5');
      expect(b.toString()).assertEqual('5');
      expect(a === b).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0450
     * @tc.name testDecimalOverviewPart03TestTest045
     * @tc.desc Verify add string|number '5' + 3 = 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('5').add(3);
      expect(r.toString()).assertEqual('8');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0460
     * @tc.name testDecimalOverviewPart03TestTest046
     * @tc.desc Verify add Decimal|number Decimal(2) + 3 = 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(new Decimal(2)).add(3);
      expect(r.toString()).assertEqual('5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0470
     * @tc.name testDecimalOverviewPart03TestTest047
     * @tc.desc Verify sub string|Decimal '10' - Decimal(4) = 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.sub('10', new Decimal(4));
      expect(r.toString()).assertEqual('6');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0480
     * @tc.name testDecimalOverviewPart03TestTest048
     * @tc.desc Verify string|number|Decimal sum('1', 2, new Decimal(3)) = 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.sum('1', 2, new Decimal(3));
      expect(r.toString()).assertEqual('6');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0490
     * @tc.name testDecimalOverviewPart03TestTest049
     * @tc.desc Verify sum('1', 2, 3, '4') = 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.sum('1', 2, 3, '4');
      expect(r.toString()).assertEqual('10');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalOverviewPart03TestTest050
     * @tc.desc Verify Decimal('0.1')+Decimal('0.2') 0.1+0.2 0.3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('0.1').add(new Decimal('0.2'));
      let b: Decimal = new Decimal(0.1).add(0.2);
      expect(a.toString()).assertEqual('0.3');
      expect(b.toString()).assertEqual('0.3');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0510
     * @tc.name testDecimalOverviewPart03TestTest051
     * @tc.desc Verify Value 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ modulo: 10 as ESObject } as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0520
     * @tc.name testDecimalOverviewPart03TestTest052
     * @tc.desc Verify Value 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal([5] as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0530
     * @tc.name testDecimalOverviewPart03TestTest053
     * @tc.desc Verify boolean Value 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(true as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0540
     * @tc.name testDecimalOverviewPart03TestTest054
     * @tc.desc Verify Value 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: () => number = () => 5;
        let d: Decimal = new Decimal(fn as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0550
     * @tc.name testDecimalOverviewPart03TestTest055
     * @tc.desc Verify Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Decimal = new Decimal(5);
      let r: Decimal = base.add(3);
      expect(base.toString()).assertEqual('5');
      expect(r.toString()).assertEqual('8');
      expect(base === r).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0560
     * @tc.name testDecimalOverviewPart03TestTest056
     * @tc.desc Verify NaN 'NaN' isNaN true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(NaN);
      expect(d.toString()).assertEqual('NaN');
      expect(d.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0570
     * @tc.name testDecimalOverviewPart03TestTest057
     * @tc.desc Verify Infinity 'Infinity' isFinite false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Infinity);
      expect(d.toString()).assertEqual('Infinity');
      expect(d.isFinite()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0580
     * @tc.name testDecimalOverviewPart03TestTest058
     * @tc.desc Verify -Infinity '-Infinity' isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-Infinity);
      expect(d.toString()).assertEqual('-Infinity');
      expect(d.isNegative()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0590
     * @tc.name testDecimalOverviewPart03TestTest059
     * @tc.desc Verify -0 valueOf -0 isNegative true toString '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-0);
      expect(1 / d.toNumber()).assertEqual(-Infinity);
      expect(d.isNegative()).assertTrue();
      expect(d.toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalOverviewPart03TestTest060
     * @tc.desc Verify Number.MAX_VALUE toNumber
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MAX_VALUE);
      expect(d.toNumber()).assertEqual(Number.MAX_VALUE);
      expect(d.isFinite()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0610
     * @tc.name testDecimalOverviewPart03TestTest061
     * @tc.desc Verify MAX_SAFE_INTEGER toString '9007199254740991'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(d.toString()).assertEqual('9007199254740991');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0620
     * @tc.name testDecimalOverviewPart03TestTest062
     * @tc.desc Verify MIN_SAFE_INTEGER toString '-9007199254740991'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MIN_SAFE_INTEGER);
      expect(d.toString()).assertEqual('-9007199254740991');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0630
     * @tc.name testDecimalOverviewPart03TestTest063
     * @tc.desc Verify '0x10' 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0x10');
      expect(d.toString()).assertEqual('16');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0640
     * @tc.name testDecimalOverviewPart03TestTest064
     * @tc.desc Verify 1e21 toExpPos 21 '1e+21'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1e21);
      expect(d.toString()).assertEqual('1e+21');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0650
     * @tc.name testDecimalOverviewPart03TestTest065
     * @tc.desc Verify 9e15 add(1) '9000000000000001'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(9e15).add(1);
      expect(d.toString()).assertEqual('9000000000000001');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0660
     * @tc.name testDecimalOverviewPart03TestTest066
     * @tc.desc Verify Number.EPSILON
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.EPSILON);
      expect(d.toNumber()).assertEqual(Number.EPSILON);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0670
     * @tc.name testDecimalOverviewPart03TestTest067
     * @tc.desc Verify '' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0680
     * @tc.name testDecimalOverviewPart03TestTest068
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('   ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0690
     * @tc.name testDecimalOverviewPart03TestTest069
     * @tc.desc Verify 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('​');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalOverviewPart03TestTest070
     * @tc.desc Verify NUL 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\u0000');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0710
     * @tc.name testDecimalOverviewPart03TestTest071
     * @tc.desc Verify XSS 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('<img onerror=alert(1)>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0720
     * @tc.name testDecimalOverviewPart03TestTest072
     * @tc.desc Verify \uD800 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('a\uD800b');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0730
     * @tc.name testDecimalOverviewPart03TestTest073
     * @tc.desc Verify 1500 '9'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '9'.repeat(1500);
      let d: Decimal = new Decimal(s);
      expect(d.toString().startsWith('9.9999999999999999999999999999999999999')).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0740
     * @tc.name testDecimalOverviewPart03TestTest074
     * @tc.desc Verify '1e-7' toExpNeg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1e-7');
      expect(d.toString()).assertEqual('1e-7');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0750
     * @tc.name testDecimalOverviewPart03TestTest075
     * @tc.desc Verify '0.0000001' -7 '1e-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.0000001');
      expect(d.toString()).assertEqual('1e-7');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0760
     * @tc.name testDecimalOverviewPart03TestTest076
     * @tc.desc Verify '12.3400' toString '12.34'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('12.3400');
      expect(d.toString()).assertEqual('12.34');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0770
     * @tc.name testDecimalOverviewPart03TestTest077
     * @tc.desc Verify div Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1).div(0);
      expect(d.toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0780
     * @tc.name testDecimalOverviewPart03TestTest078
     * @tc.desc Verify -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-1).div(0);
      expect(d.toString()).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0790
     * @tc.name testDecimalOverviewPart03TestTest079
     * @tc.desc Verify NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-4).sqrt();
      expect(d.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalOverviewPart03TestTest080
     * @tc.desc Verify toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = new Decimal('1e400').toNumber();
      expect(n).assertEqual(Infinity);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0810
     * @tc.name testDecimalOverviewPart03TestTest081
     * @tc.desc Verify toNumber -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = new Decimal('-1e400').toNumber();
      expect(n).assertEqual(-Infinity);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0820
     * @tc.name testDecimalOverviewPart03TestTest082
     * @tc.desc Verify NaN NaN.add(1) NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(NaN).add(1);
      expect(d.isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0830
     * @tc.name testDecimalOverviewPart03TestTest083
     * @tc.desc Verify toFixed '1e+400'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal('1e400').toFixed(2);
      expect(s).assertEqual('10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000.00');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0840
     * @tc.name testDecimalOverviewPart03TestTest084
     * @tc.desc Verify set precision 0 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ precision: 0 });
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0850
     * @tc.name testDecimalOverviewPart03TestTest085
     * @tc.desc Verify set rounding 9 10200001 0-8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ rounding: 9 as ESObject } as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0860
     * @tc.name testDecimalOverviewPart03TestTest086
     * @tc.desc Verify set modulo 10 10200001 0-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.add(undefined as ESObject, undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0870
     * @tc.name testDecimalOverviewPart03TestTest087
     * @tc.desc Verify set toExpNeg 10200001 [-9e15, 0]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ toExpNeg: 1 });
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0880
     * @tc.name testDecimalOverviewPart03TestTest088
     * @tc.desc Verify set crypto true 10200061
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ crypto: true });
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200061);
      }
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0890
     * @tc.name testDecimalOverviewPart03TestTest089
     * @tc.desc Verify 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalOverviewPart03TestTest090
     * @tc.desc Verify ' 1' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(' 1');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0910
     * @tc.name testDecimalOverviewPart03TestTest091
     * @tc.desc Verify '1 ' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1 ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0920
     * @tc.name testDecimalOverviewPart03TestTest092
     * @tc.desc Verify '-+1' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('-+1');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0930
     * @tc.name testDecimalOverviewPart03TestTest093
     * @tc.desc Verify '0x' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('0x');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0940
     * @tc.name testDecimalOverviewPart03TestTest094
     * @tc.desc Verify '1e' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1e');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0950
     * @tc.name testDecimalOverviewPart03TestTest095
     * @tc.desc Verify '.' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('.');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0960
     * @tc.name testDecimalOverviewPart03TestTest096
     * @tc.desc Verify '\t' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\t');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0970
     * @tc.name testDecimalOverviewPart03TestTest097
     * @tc.desc Verify '--1' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('--1');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0980
     * @tc.name testDecimalOverviewPart03TestTest098
     * @tc.desc Verify toFixed() '1.25'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal('1.25').toFixed();
      expect(s).assertEqual('1.25');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_0990
     * @tc.name testDecimalOverviewPart03TestTest099
     * @tc.desc Verify toExponential()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal('123.45').toExponential();
      expect(s).assertEqual('1.2345e+2');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalOverviewPart03TestTest100
     * @tc.desc Verify toPrecision() '123.45'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal('123.45').toPrecision();
      expect(s).assertEqual('123.45');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_1010
     * @tc.name testDecimalOverviewPart03TestTest101
     * @tc.desc Verify toSignificantDigits() Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('123.45');
      let r: Decimal = d.toSignificantDigits();
      expect(r.toString()).assertEqual('123.45');
      expect(d === r).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_1020
     * @tc.name testDecimalOverviewPart03TestTest102
     * @tc.desc Verify toString() '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0);
      expect(d.toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_1030
     * @tc.name testDecimalOverviewPart03TestTest103
     * @tc.desc Verify valueOf()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.30000000000000004');
      expect(d.valueOf()).assertEqual('0.30000000000000004');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_1040
     * @tc.name testDecimalOverviewPart03TestTest104
     * @tc.desc Verify null undefined add(null, '1') add(undefined, '1') 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.add(null as ESObject, '1');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      try {
        Decimal.add(undefined as ESObject, '1');
        expect().assertFail();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_1050
     * @tc.name testDecimalOverviewPart03TestTest105
     * @tc.desc Verify Decimal string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(4).add('0.5');
      expect(r.toString()).assertEqual('4.5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_1060
     * @tc.name testDecimalOverviewPart03TestTest106
     * @tc.desc Verify Decimal d/e/s '12.34' d [1,2,3,4] e 1 s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('12.34');
      expect(d.d.length).assertEqual(2);
      expect(d.e).assertEqual(1);
      expect(d.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_1070
     * @tc.name testDecimalOverviewPart03TestTest107
     * @tc.desc Verify s=1 -12.34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('-12.34');
      expect(d.s).assertEqual(-1);
      expect(d.e).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_1080
     * @tc.name testDecimalOverviewPart03TestTest108
     * @tc.desc Verify e '900' e=2 d [9]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart03TestTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('900');
      expect(d.e).assertEqual(2);
      expect(d.d.length).assertEqual(1);
      expect(d.d[0]).assertEqual(900);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART03_SUPPLEMENT_TEST_1090
     * @tc.name testDecimalOverviewPart03TestTest109
     * @tc.desc Verify new Decimal(0) d [0] e 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
        it('testDecimalOverviewPart03TestTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0);
      expect(d.toString()).assertEqual('0');
      expect(d.isZero()).assertTrue();
    });
  
  });

}
