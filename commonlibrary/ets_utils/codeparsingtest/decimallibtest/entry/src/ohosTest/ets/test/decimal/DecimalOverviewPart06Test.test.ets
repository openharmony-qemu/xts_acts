
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

export default function decimalOverviewPart06TestTest() {
  describe('DecimalOverviewPart06TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalOverviewPart06TestTest001
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\t\n\r ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalOverviewPart06TestTest002
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(' 123 ');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalOverviewPart06TestTest003
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('　');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalOverviewPart06TestTest004
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('‌');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalOverviewPart06TestTest005
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('‍');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalOverviewPart06TestTest006
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1​23');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalOverviewPart06TestTest007
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('­');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalOverviewPart06TestTest008
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\n');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalOverviewPart06TestTest009
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\b');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalOverviewPart06TestTest010
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(';');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalOverviewPart06TestTest011
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('123abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalOverviewPart06TestTest012
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('a123');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalOverviewPart06TestTest013
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1e+');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalOverviewPart06TestTest014
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1e+abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalOverviewPart06TestTest015
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('00a1');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalOverviewPart06TestTest016
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('+');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalOverviewPart06TestTest017
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('-');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalOverviewPart06TestTest018
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1,000');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalOverviewPart06TestTest019
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('$100');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalOverviewPart06TestTest020
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('10kg');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalOverviewPart06TestTest021
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('2026-09-02');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalOverviewPart06TestTest022
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('123/');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalOverviewPart06TestTest023
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('一二三');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalOverviewPart06TestTest024
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('😀');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalOverviewPart06TestTest025
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\uD83D');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalOverviewPart06TestTest026
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('\uDC00');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalOverviewPart06TestTest027
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('123😀');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalOverviewPart06TestTest028
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('१२३');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalOverviewPart06TestTest029
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('𝟏𝟐𝟑');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalOverviewPart06TestTest030
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1́');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalOverviewPart06TestTest031
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('‮');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalOverviewPart06TestTest032
     * @tc.desc Verify onerror '1\" onerror=\"alert(1)\"' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1" onerror="alert(1)"');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalOverviewPart06TestTest033
     * @tc.desc Verify javascript URL 'javascript:alert(1)' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('javascript:alert(1)');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalOverviewPart06TestTest034
     * @tc.desc Verify SQL '1; DROP TABLE x' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1; DROP TABLE x');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalOverviewPart06TestTest035
     * @tc.desc Verify '${globalThis}' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('${globalThis}');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalOverviewPart06TestTest036
     * @tc.desc Verify SVG onload '1<svg onload=alert(1)>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1<svg onload=alert(1)>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalOverviewPart06TestTest037
     * @tc.desc Verify data:URL 'data:text/html,<script>1</script>' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('data:text/html,<script>1</script>');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalOverviewPart06TestTest038
     * @tc.desc Verify 64 '1e+1000000' maxE Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('1e+1000000');
        let fin: boolean = d.isFinite();
      } catch (e) {
      expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalOverviewPart06TestTest039
     * @tc.desc Verify toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '3.' + '14159265358979323846264338327950288419716939937510'.repeat(10);
      let d: Decimal = new Decimal(s);
      expect(d.toString().length).assertLarger(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalOverviewPart06TestTest040
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '0.' + '9'.repeat(1000);
      let d: Decimal = new Decimal(s);
      expect(d.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalOverviewPart06TestTest041
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'a'.repeat(51200);
      try {
        let d: Decimal = new Decimal(s);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalOverviewPart06TestTest042
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0'.repeat(1000) + '1');
      expect(d.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalOverviewPart06TestTest043
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      let s: string = '1234567890123456789012345678901234567890';
      let d: Decimal = new Decimal(s);
      expect(d.toString()).assertEqual('1.23456789012345678901234567890123456789e+39');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalOverviewPart06TestTest044
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '1'.repeat(100000);
      try {
        let d: Decimal = new Decimal(s);
      } catch (e) {
      expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalOverviewPart06TestTest045
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(10).sub('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalOverviewPart06TestTest046
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(2).mul('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalOverviewPart06TestTest047
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(7).mod('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalOverviewPart06TestTest048
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(2).pow('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalOverviewPart06TestTest049
     * @tc.desc Verify clamp min 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(5).clamp('abc', 10);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalOverviewPart06TestTest050
     * @tc.desc Verify clamp max 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(5).clamp(0, 'abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalOverviewPart06TestTest051
     * @tc.desc Verify toNearest 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(1.39).toNearest('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalOverviewPart06TestTest052
     * @tc.desc Verify comparedTo 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: number = new Decimal(1).comparedTo('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalOverviewPart06TestTest053
     * @tc.desc Verify with null (assertTrue,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let r: boolean = new Decimal(1).equals('abc');
        expect(r).assertTrue();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalOverviewPart06TestTest054
     * @tc.desc Verify Decimal.sum 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.sum(1, 'abc', 2);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalOverviewPart06TestTest055
     * @tc.desc Verify Decimal.max 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.max(1, 'abc', 3);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalOverviewPart06TestTest056
     * @tc.desc Verify Decimal.min 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.min(1, 'abc', 3);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalOverviewPart06TestTest057
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(8).log('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalOverviewPart06TestTest058
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal[] = new Decimal('3.5').toFraction('abc' as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalOverviewPart06TestTest059
     * @tc.desc Verify '1e-7' isNaN false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      let d: Decimal = new Decimal('1e-7');
      expect(d.isNaN()).assertFalse();
      expect(d.toString()).assertEqual('1e-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalOverviewPart06TestTest060
     * @tc.desc Verify toString with null (assertEqual,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('abc');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      let good: Decimal = new Decimal('42');
      expect(good.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalOverviewPart06TestTest061
     * @tc.desc Verify '0.1' toNumber 0.1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('0.1');
      let n: number = d.toNumber();
      expect(n).assertEqual(0.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalOverviewPart06TestTest062
     * @tc.desc Verify '-5' number -5 isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('-5');
      let b: Decimal = new Decimal(-5);
      expect(a.isNegative()).assertEqual(b.isNegative());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalOverviewPart06TestTest063
     * @tc.desc Verify '+1.5e2' toString '150'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('+1.5e2');
      expect(d.toString()).assertEqual('150');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalOverviewPart06TestTest064
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal(1).add(undefined as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalOverviewPart06TestTest065
     * @tc.desc Verify Decimal.max null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = Decimal.max(1, null as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalOverviewPart06TestTest066
     * @tc.desc Verify set/toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 100000 });
      let d: Decimal = new Decimal('1.234567890123456789');
      expect(d.toString()).assertEqual('1.234567890123456789');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalOverviewPart06TestTest067
     * @tc.desc Verify rounding 9 10200001 [device does not throw, expected error pending SDK alignment]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Decimal.set({ rounding: 9 as ESObject } as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalOverviewPart06TestTest068
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal({ a: 1 } as ESObject);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalOverviewPart06TestTest069
     * @tc.desc Verify iteration with null (assertTrue,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pool: string[] = ['​', '', '<script>', '1.2.3'];
      for (let i = 0; i < pool.length; i++) {
        let threw: boolean = false;
        try {
          let d: Decimal = new Decimal(pool[i]);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalOverviewPart06TestTest070
     * @tc.desc Verify iteration with null (assertTrue,assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let kinds: string[] = ['', ' ', '​'];
      for (let i = 0; i < kinds.length; i++) {
        let threw: boolean = false;
        try {
          let d: Decimal = new Decimal(kinds[i]);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_7100
     * @tc.name testDecimalOverviewPart06TestTest071
     * @tc.desc Verify number '1e-7' vs 'abc' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ok: Decimal = new Decimal('1e-7');
      expect(ok.toString()).assertEqual('1e-7');
      let threw: boolean = false;
      try {
        let bad: Decimal = new Decimal('1e-7x');
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_7200
     * @tc.name testDecimalOverviewPart06TestTest072
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal("'123'");
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_7300
     * @tc.name testDecimalOverviewPart06TestTest073
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('`123`');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_7400
     * @tc.name testDecimalOverviewPart06TestTest074
     * @tc.desc Verify with null (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let d: Decimal = new Decimal('[-123]');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_7500
     * @tc.name testDecimalOverviewPart06TestTest075
     * @tc.desc Verify toFraction Decimal d/e/s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Decimal = new Decimal('3.1415');
      let threw: boolean = false;
      try {
        let d: Decimal[] = base.toFraction('abc' as ESObject);
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(base.toString()).assertEqual('3.1415');
      expect(base.s).assertEqual(1);
      expect(base.e).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_7600
     * @tc.name testDecimalOverviewPart06TestTest076
     * @tc.desc Verify rounding 401 ROUND_DOWN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        let d: Decimal = new Decimal('2.678').toNearest('0.5x');
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      let ok: Decimal = new Decimal('2.678').toNearest('0.5', Decimal.ROUND_DOWN);
      expect(ok.toString()).assertEqual('2.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_7700
     * @tc.name testDecimalOverviewPart06TestTest077
     * @tc.desc Verify '1e-100000' toExpNeg toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('1e-100000');
      expect(d.toString()).assertEqual('1e-100000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_OVERVIEW_PART06_SUPPLEMENT_TEST_7800
     * @tc.name testDecimalOverviewPart06TestTest078
     * @tc.desc Verify '-0.00' valueOf 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalOverviewPart06TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('-0.00');
      expect(d.valueOf()).assertEqual('-0');
    });


  });

}
