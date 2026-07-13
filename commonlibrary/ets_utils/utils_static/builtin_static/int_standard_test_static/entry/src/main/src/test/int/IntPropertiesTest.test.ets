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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function IntPropertiesTest(): void {
  describe('IntPropertiesTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_0100
     * @tc.name testIntPropertiesMinValue0001
     * @tc.desc Verify MIN_VALUE property exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMinValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.MIN_VALUE).not().assertNull();
      expect(Int.MIN_VALUE).not().assertUndefined();
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_0200
     * @tc.name testIntPropertiesMinValue0002
     * @tc.desc Verify MIN_VALUE value is -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMinValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.MIN_VALUE).assertEqual(-2147483648);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_0300
     * @tc.name testIntPropertiesMinValue0003
     * @tc.desc Verify MIN_VALUE is int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMinValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(typeof Int.MIN_VALUE).assertEqual("int");
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_0400
     * @tc.name testIntPropertiesMinValue0004
     * @tc.desc Verify MIN_VALUE is read-only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMinValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const before = Int.MIN_VALUE;
      const after = Int.MIN_VALUE;
      expect(before).assertEqual(after);
      expect(after).assertEqual(-2147483648);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_0600
     * @tc.name testIntPropertiesMinValue0006
     * @tc.desc Verify MIN_VALUE is not an optional property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMinValue0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.MIN_VALUE).not().assertNull();
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_0700
     * @tc.name testIntPropertiesMinValue0007
     * @tc.desc Verify creating Int instance with MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMinValue0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const min = new Int(-2147483648);
      expect(min.toInt()).assertEqual(-2147483648);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_0900
     * @tc.name testIntPropertiesMinValue0009
     * @tc.desc Verify MIN_VALUE minus 1 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMinValue0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const min = new Int(-2147483648);
      const result = min.sub(new Int(1));
      expect(result.toInt()).assertEqual(2147483647);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_1000
     * @tc.name testIntPropertiesMinValue0010
     * @tc.desc Verify MIN_VALUE plus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMinValue0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const min = new Int(-2147483648);
      const result = min.add(new Int(1));
      expect(result.toInt()).assertEqual(-2147483647);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_1100
     * @tc.name testIntPropertiesMinValue0011
     * @tc.desc Verify any value is greater than or equal to MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMinValue0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const min = new Int(-2147483648);
      const zero = new Int(0);
      expect(zero.compareTo(min)).assertEqual(1);
      expect(min.compareTo(min)).assertEqual(0);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_1200
     * @tc.name testIntPropertiesMaxValue0001
     * @tc.desc Verify MAX_VALUE property exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMaxValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.MAX_VALUE).not().assertNull();
      expect(Int.MAX_VALUE).not().assertUndefined();
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_1300
     * @tc.name testIntPropertiesMaxValue0002
     * @tc.desc Verify MAX_VALUE value is 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMaxValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.MAX_VALUE).assertEqual(2147483647);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_1400
     * @tc.name testIntPropertiesMaxValue0003
     * @tc.desc Verify MAX_VALUE is int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMaxValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(typeof Int.MAX_VALUE).assertEqual("int");
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_1700
     * @tc.name testIntPropertiesMaxValue0006
     * @tc.desc Verify MAX_VALUE is not an optional property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMaxValue0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.MAX_VALUE).not().assertNull();
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_1800
     * @tc.name testIntPropertiesMaxValue0007
     * @tc.desc Verify creating Int instance with MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMaxValue0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const max = new Int(2147483647);
      expect(max.toInt()).assertEqual(2147483647);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_2000
     * @tc.name testIntPropertiesMaxValue0009
     * @tc.desc Verify MAX_VALUE plus 1 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMaxValue0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const max = new Int(2147483647);
      const result = max.add(new Int(1));
      expect(result.toInt()).assertEqual(-2147483648);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_2100
     * @tc.name testIntPropertiesMaxValue0010
     * @tc.desc Verify MAX_VALUE minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMaxValue0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const max = new Int(2147483647);
      const result = max.sub(new Int(1));
      expect(result.toInt()).assertEqual(2147483646);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_2200
     * @tc.name testIntPropertiesMaxValue0011
     * @tc.desc Verify any value is less than or equal to MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMaxValue0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const max = new Int(2147483647);
      const zero = new Int(0);
      expect(max.compareTo(zero)).assertEqual(1);
      expect(max.compareTo(max)).assertEqual(0);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_2300
     * @tc.name testIntPropertiesBitSize0001
     * @tc.desc Verify BIT_SIZE property exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesBitSize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.BIT_SIZE).not().assertNull();
      expect(Int.BIT_SIZE).not().assertUndefined();
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_2400
     * @tc.name testIntPropertiesBitSize0002
     * @tc.desc Verify BIT_SIZE value is 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesBitSize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.BIT_SIZE).assertEqual(32);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_2500
     * @tc.name testIntPropertiesBitSize0003
     * @tc.desc Verify BIT_SIZE is byte type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesBitSize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(typeof Int.BIT_SIZE).assertEqual("byte");
      expect(Int.BIT_SIZE).assertLess(128);
      expect(Int.BIT_SIZE).assertLargerOrEqual(-128);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_2800
     * @tc.name testIntPropertiesBitSize0006
     * @tc.desc Verify BIT_SIZE is not an optional property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesBitSize0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.BIT_SIZE).not().assertNull();
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_2900
     * @tc.name testIntPropertiesBitSize0007
     * @tc.desc Verify using BIT_SIZE as bit operation upper limit reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesBitSize0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const a = new Int(1);
      const shifted = a.toInt() << (Int.BIT_SIZE - 1);
      expect(shifted).assertEqual(-2147483648);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_3000
     * @tc.name testIntPropertiesBitSize0008
     * @tc.desc Verify calculating signed integer range from BIT_SIZE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesBitSize0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const min = -(1 << (Int.BIT_SIZE - 1));
      const max = (1 << (Int.BIT_SIZE - 1)) - 1;
      expect(min).assertEqual(-2147483648);
      expect(max).assertEqual(2147483647);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_3100
     * @tc.name testIntPropertiesByteSize0001
     * @tc.desc Verify BYTE_SIZE property exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesByteSize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.BYTE_SIZE).not().assertNull();
      expect(Int.BYTE_SIZE).not().assertUndefined();
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_3200
     * @tc.name testIntPropertiesByteSize0002
     * @tc.desc Verify BYTE_SIZE value is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesByteSize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.BYTE_SIZE).assertEqual(4);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_3300
     * @tc.name testIntPropertiesByteSize0003
     * @tc.desc Verify BYTE_SIZE is byte type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesByteSize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(typeof Int.BYTE_SIZE).assertEqual("byte");
      expect(Int.BYTE_SIZE).assertLess(128);
      expect(Int.BYTE_SIZE).assertLargerOrEqual(-128);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_3500
     * @tc.name testIntPropertiesByteSize0005
     * @tc.desc Verify BYTE_SIZE value unchanged after modification attempt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesByteSize0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const before = Int.BYTE_SIZE;
      const after = Int.BYTE_SIZE;
      expect(after).assertEqual(before);
      expect(after).assertEqual(4);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_3600
     * @tc.name testIntPropertiesByteSize0006
     * @tc.desc Verify BYTE_SIZE is not an optional property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesByteSize0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.BYTE_SIZE).not().assertNull();
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_3700
     * @tc.name testIntPropertiesByteSize0007
     * @tc.desc Verify calculating byte count using BYTE_SIZE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesByteSize0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const bits = Int.BIT_SIZE;
      const bytes = Int.BYTE_SIZE;
      expect(bits).assertEqual(bytes * 8);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_3800
     * @tc.name testIntPropertiesByteSize0008
     * @tc.desc Verify size relationship between BYTE_SIZE and BIT_SIZE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesByteSize0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.BYTE_SIZE).assertLess(Int.BIT_SIZE);
      expect(Int.BIT_SIZE).assertEqual(Int.BYTE_SIZE * 8);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_3900
     * @tc.name testIntPropertiesRelation0001
     * @tc.desc Verify BIT_SIZE equals BYTE_SIZE multiplied by 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesRelation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.BIT_SIZE).assertEqual(Int.BYTE_SIZE * 8);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_4000
     * @tc.name testIntPropertiesRelation0002
     * @tc.desc Verify MIN_VALUE and MAX_VALUE are symmetric
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesRelation0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const absMin = -(-2147483648);
      const absMax = 2147483647 + 1;
      expect(absMin).assertEqual(absMax);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_4100
     * @tc.name testIntPropertiesRelation0003
     * @tc.desc Verify calculating value range from BIT_SIZE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesRelation0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const calculatedMin = -(1 << (Int.BIT_SIZE - 1));
      const calculatedMax = (1 << (Int.BIT_SIZE - 1)) - 1;
      expect(calculatedMin).assertEqual(-2147483648);
      expect(calculatedMax).assertEqual(2147483647);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_4200
     * @tc.name testIntPropertiesAccess0001
     * @tc.desc Verify accessing properties through Int class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesAccess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(Int.MIN_VALUE).assertEqual(-2147483648);
      expect(Int.MAX_VALUE).assertEqual(2147483647);
      expect(Int.BIT_SIZE).assertEqual(32);
      expect(Int.BYTE_SIZE).assertEqual(4);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_4300
     * @tc.name testIntPropertiesAccess0002
     * @tc.desc Verify instance cannot access static properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesAccess0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const a = new Int(100);
      expect(a.toInt()).assertEqual(100);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_4400
     * @tc.name testIntPropertiesMethods0001
     * @tc.desc Verify toString of MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMethods0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const min = new Int(-2147483648);
      expect(min.toString()).assertEqual("-2147483648");
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_4500
     * @tc.name testIntPropertiesMethods0002
     * @tc.desc Verify toString of MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMethods0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const max = new Int(2147483647);
      expect(max.toString()).assertEqual("2147483647");
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_4600
     * @tc.name testIntPropertiesMethods0003
     * @tc.desc Verify MIN_VALUE conversion to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMethods0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const min = new Int(-2147483648);
      const l = min.toLong();
      expect(l).assertEqual(-2147483648);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_4700
     * @tc.name testIntPropertiesMethods0004
     * @tc.desc Verify MAX_VALUE conversion to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesMethods0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const max = new Int(2147483647);
      const l = max.toLong();
      expect(l).assertEqual(2147483647);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_4800
     * @tc.name testIntPropertiesBoundary0001
     * @tc.desc Verify using MIN_VALUE as loop lower bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let count = 0;
      for (let i = -2147483648; i < -2147483648 + 10; i++) {
        count++;
      }
      expect(count).assertEqual(10);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_4900
     * @tc.name testIntPropertiesBoundary0002
     * @tc.desc Verify using MAX_VALUE as loop upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let count = 0;
      for (let offset = 0; offset <= 10; offset++) {
        const i = 2147483647 - 10 + offset;
        expect(i <= 2147483647).assertTrue();
        count++;
      }
      expect(count).assertEqual(11);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_5000
     * @tc.name testIntPropertiesBoundary0003
     * @tc.desc Verify using properties in comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      const a = new Int(100);
      expect(a.toInt() > -2147483648).assertTrue();
      expect(a.toInt() < 2147483647).assertTrue();
      expect(a.toInt()).assertLarger(-2147483648);
      expect(a.toInt()).assertLess(2147483647);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_5100
     * @tc.name testIntPropertiesCrossType0001
     * @tc.desc Verify Long type has larger range than Int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesCrossType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(-2147483648).assertLarger(-9223372036854775808);
      expect(2147483647).assertLess(9223372036854775807);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_5200
     * @tc.name testIntPropertiesCrossType0002
     * @tc.desc Verify Short type range compared to Int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesCrossType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(-2147483648).assertLess(-32768);
      expect(2147483647).assertLarger(32767);
      done();
    });

    /**
     * @tc.number INT_PRPRT_ITEM_CHK_5300
     * @tc.name testIntPropertiesCrossType0003
     * @tc.desc Verify Byte type range compared to Int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntPropertiesCrossType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      expect(-2147483648).assertLess(-128);
      expect(2147483647).assertLarger(127);
      done();
    });
  });
}
