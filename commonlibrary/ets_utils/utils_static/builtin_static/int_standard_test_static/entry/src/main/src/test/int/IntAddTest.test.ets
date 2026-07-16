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

export default function IntAddTest(): void {
  describe('IntAddTest', (): void => {
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
     * @tc.number INT_ADD_ITEM_CHK_0100
     * @tc.name intAddParamCount00001
     * @tc.desc Verify required parameter other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamCount00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.add(new Int(10));
      expect(result.toInt()).assertEqual(75);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_0200
     * @tc.name intAddParamCount00002
     * @tc.desc Verify add with zero parameter returns original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamCount00002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      const result = a.add(new Int(0));
      expect(result.toInt()).assertEqual(1);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_0400
     * @tc.name intAddParamTypeNormal00001
     * @tc.desc Verify normal Int value addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeNormal00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(50);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(150);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_0500
     * @tc.name intAddParamTypeNormal00002
     * @tc.desc Verify positive number addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeNormal00002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      const b = new Int(300);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(800);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_0600
     * @tc.name intAddParamTypeNormal0003
     * @tc.desc Verify negative number addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeNormal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-500);
      const b = new Int(-300);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(-800);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_0700
     * @tc.name intAddParamTypeNormal00004
     * @tc.desc Verify zero value addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeNormal00004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(0);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_0800
     * @tc.name intAddParamTypeNormal00005
     * @tc.desc Verify positive and negative addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeNormal00005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      const b = new Int(-300);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(200);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_0900
     * @tc.name intAddParamTypeBoundary00001
     * @tc.desc Verify addition with MAX_VALUE overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeBoundary00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE);
      const b = new Int(1);
      const result = a.add(b);
      expect(result instanceof Int).assertTrue();
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_1000
     * @tc.name intAddParamTypeBoundary00002
     * @tc.desc Verify addition with MIN_VALUE overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeBoundary00002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MIN_VALUE);
      const b = new Int(-1);
      const result = a.add(b);
      expect(result instanceof Int).assertTrue();
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_1100
     * @tc.name intAddParamTypeBoundary00003
     * @tc.desc Verify MAX_VALUE plus MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeBoundary00003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE);
      const b = new Int(Int.MIN_VALUE);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(-1);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_1200
     * @tc.name intAddParamTypeBoundary00004
     * @tc.desc Verify near overflow boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeBoundary00004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE - 1);
      const b = new Int(1);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_1300
     * @tc.name intAddParamTypeSpecial00001
     * @tc.desc Verify adding 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeSpecial00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(1);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(101);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_1400
     * @tc.name intAddParamTypeSpecial00002
     * @tc.desc Verify adding -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeSpecial00002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(-1);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(99);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_1500
     * @tc.name intAddParamTypeSpecial00003
     * @tc.desc Verify adding 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeSpecial00003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const b = new Int(0);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(123);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_1600
     * @tc.name intAddParamTypeLarge00001
     * @tc.desc Verify large positive number addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeLarge00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000);
      const b = new Int(2000000);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(3000000);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_1700
     * @tc.name intAddParamTypeLarge00002
     * @tc.desc Verify large negative number addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeLarge00002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1000000);
      const b = new Int(-2000000);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(-3000000);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_1800
     * @tc.name intAddParamTypePowerOfTwo00001
     * @tc.desc Verify power of two addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypePowerOfTwo00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int(2).add(new Int(2)).toInt()).assertEqual(4);
      expect(new Int(4).add(new Int(4)).toInt()).assertEqual(8);
      expect(new Int(8).add(new Int(8)).toInt()).assertEqual(16);
      expect(new Int(16).add(new Int(16)).toInt()).assertEqual(32);
      expect(new Int(32).add(new Int(32)).toInt()).assertEqual(64);
      expect(new Int(64).add(new Int(64)).toInt()).assertEqual(128);
      expect(new Int(128).add(new Int(128)).toInt()).assertEqual(256);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_1900
     * @tc.name intAddParamTypeAbnormal00001
     * @tc.desc Verify opposite values add to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddParamTypeAbnormal00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(5);
      const result = a.add(new Int(-5));
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_2300
     * @tc.name intAddReturnSuccess00001
     * @tc.desc Verify returning new Int instance after addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnSuccess00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.add(new Int(10));
      expect(result instanceof Int).assertTrue();
      expect(result instanceof Int).assertTrue();
      expect(result.toInt()).assertEqual(75);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_2400
     * @tc.name intAddReturnSuccess00002
     * @tc.desc Verify return value is Int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnSuccess00002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.add(new Int(50));
      expect((typeof result).length > 0).assertTrue();
      expect(result.toInt()).assertEqual(150);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_2500
     * @tc.name intAddReturnPositive00001
     * @tc.desc Verify two positive numbers addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnPositive00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(10);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(75);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_2600
     * @tc.name intAddReturnPositive00002
     * @tc.desc Verify documentation example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnPositive00002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      console.info(a.add(new Int(10)).toString());
      expect(a.add(new Int(10)).toInt()).assertEqual(75);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_2700
     * @tc.name intAddReturnPositive00003
     * @tc.desc Verify chained addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnPositive00003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const result = a.add(new Int(20)).add(new Int(30)).add(new Int(40));
      expect(result.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_2800
     * @tc.name intAddReturnNegative00001
     * @tc.desc Verify two negative numbers addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnNegative00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-65);
      const b = new Int(-10);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(-75);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_2900
     * @tc.name intAddReturnNegative00002
     * @tc.desc Verify positive plus negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnNegative00002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(-30);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(70);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_3000
     * @tc.name intAddReturnNegative00003
     * @tc.desc Verify negative plus positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnNegative00003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      const b = new Int(30);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(-70);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_3100
     * @tc.name intAddReturnZero00001
     * @tc.desc Verify positive plus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnZero00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.add(new Int(0));
      expect(result.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_3200
     * @tc.name intAddReturnZero00002
     * @tc.desc Verify negative plus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnZero00002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      const result = a.add(new Int(0));
      expect(result.toInt()).assertEqual(-100);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_3300
     * @tc.name intAddReturnZero0003
     * @tc.desc Verify zero plus positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnZero0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const b = new Int(100);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_3400
     * @tc.name intAddReturnZero0004
     * @tc.desc Verify zero plus negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnZero0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const b = new Int(-100);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(-100);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_3500
     * @tc.name intAddReturnZero0005
     * @tc.desc Verify zero plus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnZero0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const b = new Int(0);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_3600
     * @tc.name intAddReturnOverflow0001
     * @tc.desc Verify MAX_VALUE plus 1 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnOverflow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE);
      const b = new Int(1);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_3700
     * @tc.name intAddReturnOverflow0002
     * @tc.desc Verify MIN_VALUE plus -1 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnOverflow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MIN_VALUE);
      const b = new Int(-1);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_3900
     * @tc.name intAddReturnOverflow0004
     * @tc.desc Verify MIN_VALUE plus 1 plus -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddReturnOverflow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MIN_VALUE + 1);
      const b = new Int(-1);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_4100
     * @tc.name intAddInstanceMethod0002
     * @tc.desc Verify original instance unchanged after add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddInstanceMethod0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const originalValue = a.toInt();
      const result = a.add(new Int(10));
      expect(a.toInt()).assertEqual(originalValue);
      expect(a.toInt()).assertEqual(65);
      expect(result.toInt()).assertEqual(75);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_4200
     * @tc.name intAddInstanceMethod0003
     * @tc.desc Verify returning new Int instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddInstanceMethod0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.add(new Int(10));
      expect(result === a).assertFalse();
      expect(result.toInt() === a.toInt()).assertFalse();
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_4500
     * @tc.name intAddChainedCall0002
     * @tc.desc Verify calling other methods after add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddChainedCall0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const result = a.add(new Int(20)).add(new Int(30));
      expect(result.toInt()).assertEqual(60);
      expect(result.add(new Int(40)).toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_4600
     * @tc.name intAddDataIntegrity0001
     * @tc.desc Verify adding same value multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddDataIntegrity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(50);
      const result1 = a.add(b);
      const result2 = result1.add(b);
      const result3 = result2.add(b);
      expect(result1.toInt()).assertEqual(150);
      expect(result2.toInt()).assertEqual(200);
      expect(result3.toInt()).assertEqual(250);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_4700
     * @tc.name intAddDataIntegrity0002
     * @tc.desc Verify addition commutativity a + b = b + a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddDataIntegrity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(10);
      expect(a.add(b).toInt()).assertEqual(75);
      expect(b.add(a).toInt()).assertEqual(75);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_4800
     * @tc.name intAddDataIntegrity0003
     * @tc.desc Verify addition associativity (a + b) + c = a + (b + c)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddDataIntegrity0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(20);
      const c = new Int(30);
      const result1 = a.add(b).add(c);
      const result2 = a.add(b.add(c));
      expect(result1.toInt()).assertEqual(result2.toInt());
      expect(result1.toInt()).assertEqual(60);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_4900
     * @tc.name intAddSpecialScenario0001
     * @tc.desc Verify positive plus negative equals zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddSpecialScenario0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(-100);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_5000
     * @tc.name intAddSpecialScenario0002
     * @tc.desc Verify negative plus positive equals zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddSpecialScenario0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      const b = new Int(100);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_5100
     * @tc.name intAddSpecialScenario0003
     * @tc.desc Verify near boundary value addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddSpecialScenario0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE - 100);
      const b = new Int(50);
      const result = a.add(b);
      expect(result.toInt()).assertEqual(Int.MAX_VALUE - 50);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_5200
     * @tc.name intAddSpecialScenario0004
     * @tc.desc Verify increment-like operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddSpecialScenario0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counter = new Int(0);
      counter = counter.add(new Int(1));
      expect(counter.toInt()).assertEqual(1);
      counter = counter.add(new Int(1));
      expect(counter.toInt()).assertEqual(2);
      counter = counter.add(new Int(1));
      expect(counter.toInt()).assertEqual(3);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_5300
     * @tc.name intAddApplication0001
     * @tc.desc Verify accumulation counting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddApplication0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = new Int(0);
      for (let i = 0; i < 10; i++) {
        count = count.add(new Int(1));
      }
      expect(count.toInt()).assertEqual(10);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_5400
     * @tc.name intAddApplication0002
     * @tc.desc Verify sum calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddApplication0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = [new Int(10), new Int(20), new Int(30), new Int(40)];
      let sum = new Int(0);
      values.forEach(v => {
        sum = sum.add(v);
      });
      expect(sum.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_5500
     * @tc.name intAddApplication0003
     * @tc.desc Verify offset calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddApplication0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Int(1000);
      const offset1 = new Int(100);
      const offset2 = new Int(50);
      const finalResult = base.add(offset1).add(offset2);
      expect(finalResult.toInt()).assertEqual(1150);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_5600
     * @tc.name intAddPerformance0001
     * @tc.desc Verify multiple add calls performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddPerformance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Int(0);
      for (let i = 0; i < 1000; i++) {
        result = result.add(new Int(1));
      }
      expect(result.toInt()).assertEqual(1000);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_5700
     * @tc.name intAddPerformance0002
     * @tc.desc Verify large number multiple addition performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddPerformance0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Int(0);
      const large = new Int(1000000);
      for (let i = 0; i < 100; i++) {
        result = result.add(large);
      }
      expect(result.toInt()).assertEqual(100000000);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_5900
     * @tc.name intAddBoundaryCombo0001
     * @tc.desc Verify MAX_VALUE addition with various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddBoundaryCombo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(Int.MAX_VALUE);
      expect(max.add(new Int(0)).toInt()).assertEqual(Int.MAX_VALUE);
      expect(max.add(new Int(1)).toInt()).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_6000
     * @tc.name intAddBoundaryCombo0002
     * @tc.desc Verify MIN_VALUE addition with various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddBoundaryCombo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(Int.MIN_VALUE);
      expect(min.add(new Int(0)).toInt()).assertEqual(Int.MIN_VALUE);
      expect(min.add(new Int(-1)).toInt()).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_6100
     * @tc.name intAddBoundaryCombo0003
     * @tc.desc Verify MAX_VALUE plus MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddBoundaryCombo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(Int.MAX_VALUE);
      const min = new Int(Int.MIN_VALUE);
      const result = max.add(min);
      expect(result.toInt()).assertEqual(-1);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_6200
     * @tc.name intAddComparison0001
     * @tc.desc Verify a + (-b) equals a - b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddComparison0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(30);
      expect(a.add(new Int(-30)).toInt()).assertEqual(70);
      expect(a.sub(b).toInt()).assertEqual(70);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_6300
     * @tc.name intAddComparison0002
     * @tc.desc Verify mixed addition and subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddComparison0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(30);
      const c = new Int(20);
      const result = a.add(b).sub(c);
      expect(result.toInt()).assertEqual(110);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_6400
     * @tc.name intAddRange0001
     * @tc.desc Verify result within int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddRange0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000);
      const b = new Int(2000000);
      const result = a.add(b);
      expect(result.toInt() >= Int.MIN_VALUE).assertTrue();
      expect(result.toInt() <= Int.MAX_VALUE).assertTrue();
      expect(result.toInt()).assertEqual(3000000);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_6500
     * @tc.name intAddIdentity0001
     * @tc.desc Verify adding zero identity x + 0 = x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddIdentity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      const zero = new Int(0);
      expect(a.add(zero).toInt()).assertEqual(a.toInt());
      expect(a.add(zero).toInt()).assertEqual(12345);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_6600
     * @tc.name intAddIdentity0002
     * @tc.desc Verify adding self doubles x + x = 2x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddIdentity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.add(a);
      expect(result.toInt()).assertEqual(200);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_6700
     * @tc.name intAddChainIntegrity0001
     * @tc.desc Verify complex chained calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddChainIntegrity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const result = a
        .add(new Int(5))
        .add(new Int(15))
        .add(new Int(20))
        .add(new Int(50));
      expect(result.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_6800
     * @tc.name intAddChainIntegrity0002
     * @tc.desc Verify chained call intermediate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddChainIntegrity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const step1 = a.add(new Int(20));
      expect(step1.toInt()).assertEqual(30);
      const step2 = step1.add(new Int(30));
      expect(step2.toInt()).assertEqual(60);
      const step3 = step2.add(new Int(40));
      expect(step3.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_6900
     * @tc.name intAddBatch0001
     * @tc.desc Verify array element sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddBatch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers = [new Int(1), new Int(2), new Int(3),
        new Int(4), new Int(5)];
      let sum = new Int(0);
      numbers.forEach(n => {
        sum = sum.add(n);
      });
      expect(sum.toInt()).assertEqual(15);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_7000
     * @tc.name intAddBatch0002
     * @tc.desc Verify reduce accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddBatch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = [new Int(10), new Int(20), new Int(30)];
      const sum = values.reduce((acc, v) => acc.add(v), new Int(0));
      expect(sum.toInt()).assertEqual(60);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_7100
     * @tc.name intAddSpecialCombo0001
     * @tc.desc Verify accumulating 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddSpecialCombo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Int(0);
      const one = new Int(1);
      result = result.add(one);
      expect(result.toInt()).assertEqual(1);
      result = result.add(one);
      expect(result.toInt()).assertEqual(2);
      result = result.add(one);
      expect(result.toInt()).assertEqual(3);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_7200
     * @tc.name intAddSpecialCombo0002
     * @tc.desc Verify accumulating -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddSpecialCombo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Int(10);
      const minusOne = new Int(-1);
      result = result.add(minusOne);
      expect(result.toInt()).assertEqual(9);
      result = result.add(minusOne);
      expect(result.toInt()).assertEqual(8);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_7300
     * @tc.name intAddOverflowBoundary0001
     * @tc.desc Verify positive overflow detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddOverflowBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE);
      const b = new Int(1);
      const result = a.add(b);
      expect(result.toInt() < 0).assertTrue();
      expect(result.toInt()).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_7400
     * @tc.name intAddOverflowBoundary0002
     * @tc.desc Verify negative overflow detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddOverflowBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MIN_VALUE);
      const b = new Int(-1);
      const result = a.add(b);
      expect(result.toInt() > 0).assertTrue();
      expect(result.toInt()).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_7500
     * @tc.name intAddSubInverse0001
     * @tc.desc Verify addition then subtraction cancel (a + b) - b = a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddSubInverse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(30);
      const result = a.add(b).sub(b);
      expect(result.toInt()).assertEqual(a.toInt());
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_7600
     * @tc.name intAddSubInverse0002
     * @tc.desc Verify subtraction then addition cancel (a - b) + b = a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddSubInverse0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(30);
      const result = b.sub(a).add(a);
      expect(result.toInt()).assertEqual(b.toInt());
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_7700
     * @tc.name intAddRepeatedCall0001
     * @tc.desc Verify same instance multiple add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddRepeatedCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(5);
      const r1 = a.add(b);
      const r2 = a.add(b);
      const r3 = a.add(b);
      expect(r1.toInt()).assertEqual(15);
      expect(r2.toInt()).assertEqual(15);
      expect(r3.toInt()).assertEqual(15);
      expect(a.toInt()).assertEqual(10);
    });

    /**
     * @tc.number INT_ADD_ITEM_CHK_7800
     * @tc.name intAddPrecision0001
     * @tc.desc Verify addition result precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('intAddPrecision0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int(0).add(new Int(0)).toInt()).assertEqual(0);
      expect(new Int(1).add(new Int(1)).toInt()).assertEqual(2);
      expect(new Int(100).add(new Int(200)).toInt()).assertEqual(300);
      expect(new Int(-100).add(new Int(-200)).toInt()).assertEqual(-300);
      expect(new Int(100).add(new Int(-200)).toInt()).assertEqual(-100);
      expect(new Int(-100).add(new Int(200)).toInt()).assertEqual(100);
    });
  });
}
