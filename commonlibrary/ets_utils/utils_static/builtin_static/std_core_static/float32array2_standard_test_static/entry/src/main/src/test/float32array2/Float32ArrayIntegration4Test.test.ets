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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArrayIntegration4Test(): void {
  describe('Float32ArrayIntegration4Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_0100
     * @tc.name testFloat32ArrayIntegrationFour001
     * @tc.desc Verify $_set stores 0.2 using the nearest float32 representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      arr.$_set(0, 0.2);
      const element001 = arr.$_get(0);
      expect(element001).assertEqual(0.20000000298023224);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_0200
     * @tc.name testFloat32ArrayIntegrationFour002
     * @tc.desc Verify $_set stores 0.3 using the nearest float32 representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      arr.$_set(0, 0.3);
      const element002 = arr.$_get(0);
      expect(element002).assertEqual(0.30000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_0300
     * @tc.name testFloat32ArrayIntegrationFour003
     * @tc.desc Verify $_set stores 1.1 as 1.100000023841858 after float32 rounding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      arr.$_set(0, 1.1);
      const element003 = arr.$_get(0);
      expect(element003).assertEqual(1.100000023841858);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_0400
     * @tc.name testFloat32ArrayIntegrationFour004
     * @tc.desc Verify $_set stores 1.0000001 and rounds up past half an ULP to 1.0000001192092896
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      arr.$_set(0, 1.0000001);
      const element004 = arr.$_get(0);
      expect(element004).assertEqual(1.0000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_0500
     * @tc.name testFloat32ArrayIntegrationFour005
     * @tc.desc Verify $_set stores 1.00000001 and rounds to 1.0 because it is below half an ULP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      arr.$_set(0, 1.00000001);
      const element005 = arr.$_get(0);
      expect(element005).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_0600
     * @tc.name testFloat32ArrayIntegrationFour006
     * @tc.desc Verify $_set stores 16777218(2^24+2) exactly because the ULP is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      arr.$_set(0, 16777218);
      const element006 = arr.$_get(0);
      expect(element006).assertEqual(16777218);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_0700
     * @tc.name testFloat32ArrayIntegrationFour007
     * @tc.desc Verify $_set stores 16777215(2^24-1) exactly within the float32 integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      arr.$_set(0, 16777215);
      const element007 = arr.$_get(0);
      expect(element007).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_0800
     * @tc.name testFloat32ArrayIntegrationFour008
     * @tc.desc Verify $_set stores MAX*1.001 and overflows beyond the upper bound to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      arr.$_set(0, 3.4028234663852886e+38 * 1.001);
      const element008 = arr.$_get(0);
      expect(element008).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_0900
     * @tc.name testFloat32ArrayIntegrationFour009
     * @tc.desc Verify with(index,value) returns a new array where 16777217 is rounded to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      const r = arr.with(0, 16777217);
      const element009 = r.$_get(0);
      expect(element009).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_1000
     * @tc.name testFloat32ArrayIntegrationFour010
     * @tc.desc Verify fill(value) stores 16777217 and rounds every element to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(16777217);
      const element010 = arr.$_get(2);
      expect(element010).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_1100
     * @tc.name testFloat32ArrayIntegrationFour011
     * @tc.desc Verify fill(value) stores 1.0e40 and overflows every element to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.fill(1.0e40);
      const element011 = arr.$_get(0);
      expect(element011).assertEqual(Number.POSITIVE_INFINITY);
      const element011Part2 = arr.$_get(1);
      expect(element011Part2).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_1200
     * @tc.name testFloat32ArrayIntegrationFour012
     * @tc.desc Verify set(source) copies 16777217 from the source and rounds the target value to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([16777217]);
      const dst = new Float32Array(1);
      dst.set(src);
      const element012 = dst.$_get(0);
      expect(element012).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_1300
     * @tc.name testFloat32ArrayIntegrationFour013
     * @tc.desc Verify copyWithin copies the rounded representation of 0.1 into another slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1, 0, 0]);
      arr.copyWithin(1, 0, 1);
      const element013 = arr.$_get(1);
      expect(element013).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_1400
     * @tc.name testFloat32ArrayIntegrationFour014
     * @tc.desc Verify the constructor copies 16777217 from FixedArray<number> and rounds it to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217, 1]);
      const element014 = arr.$_get(0);
      expect(element014).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_1500
     * @tc.name testFloat32ArrayIntegrationFour015
     * @tc.desc Verify Float32Array.of stores 1.0e40 and overflows it to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e40);
      const element015 = arr.$_get(0);
      expect(element015).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_1600
     * @tc.name testFloat32ArrayIntegrationFour016
     * @tc.desc Verify Float32Array.from copies 0.1 from an array and stores the float32 representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([0.1]);
      const element016 = arr.$_get(0);
      expect(element016).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_1700
     * @tc.name testFloat32ArrayIntegrationFour017
     * @tc.desc Verify $_set stores -1.0e3 exactly as -1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      arr.$_set(0, -1.0e3);
      const element017 = arr.$_get(0);
      expect(element017).assertEqual(-1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_1800
     * @tc.name testFloat32ArrayIntegrationFour018
     * @tc.desc Verify $_set stores int upper boundary 2147483647 and rounds it to 2147483648 because the ULP is 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      arr.$_set(0, 2147483647);
      const element018 = arr.$_get(0);
      expect(element018).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_1900
     * @tc.name testFloat32ArrayIntegrationFour019
     * @tc.desc Verify $_set stores int lower boundary -2147483648(2^31) exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      arr.$_set(0, -2147483648);
      const element019 = arr.$_get(0);
      expect(element019).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_2000
     * @tc.name testFloat32ArrayIntegrationFour020
     * @tc.desc Verify includes(NaN) matches NaN and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, Number.NaN, 3]);
      const predicateResult020 = arr.includes(Number.NaN);
      expect(predicateResult020).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_2100
     * @tc.name testFloat32ArrayIntegrationFour021
     * @tc.desc Verify indexOf(NaN) uses strict equality and always returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, Number.NaN, 3]);
      const indexValue021 = arr.indexOf(Number.NaN);
      expect(indexValue021).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_2200
     * @tc.name testFloat32ArrayIntegrationFour022
     * @tc.desc Verify lastIndexOf(NaN) uses strict equality and always returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, Number.NaN, 3]);
      const lastIndexValue022 = arr.lastIndexOf(Number.NaN);
      expect(lastIndexValue022).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_2300
     * @tc.name testFloat32ArrayIntegrationFour023
     * @tc.desc Verify find with strict NaN comparison does not match and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, Number.NaN, 3]);
      const r = arr.find((v: number, index: int, array: Float32Array) => {
        return v === Number.NaN;
      });
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_2400
     * @tc.name testFloat32ArrayIntegrationFour024
     * @tc.desc Verify findIndex with strict NaN comparison does not match and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, Number.NaN, 3]);
      const r = arr.findIndex((v: number, index: int, array: Float32Array) => {
        return v === Number.NaN;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_2500
     * @tc.name testFloat32ArrayIntegrationFour025
     * @tc.desc Verify findLast with strict NaN comparison has no match and throws Error per SDK behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, Number.NaN, 3]);
      try {
        arr.findLast((v: number, index: int, array: Float32Array) => {
          return v === Number.NaN;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_2600
     * @tc.name testFloat32ArrayIntegrationFour026
     * @tc.desc Verify findLastIndex with strict NaN comparison does not match and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, Number.NaN, 3]);
      const r = arr.findLastIndex((v: number, index: int, array: Float32Array) => {
        return v === Number.NaN;
      });
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_2700
     * @tc.name testFloat32ArrayIntegrationFour027
     * @tc.desc Verify some detects NaN with v !== v and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, Number.NaN, 3]);
      const r = arr.some((v: number, index: int, array: Float32Array) => {
        return v !== v;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_2800
     * @tc.name testFloat32ArrayIntegrationFour028
     * @tc.desc Verify every checks v === v and returns false when NaN is encountered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, Number.NaN, 3]);
      const r = arr.every((v: number, index: int, array: Float32Array) => {
        return !isNaN(v);
      });
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_2900
     * @tc.name testFloat32ArrayIntegrationFour029
     * @tc.desc Verify toString includes the NaN segment for a NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, Number.NaN, 3]);
      const observedValue029 = arr.toString();
      expect(observedValue029).assertEqual('1,NaN,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_3000
     * @tc.name testFloat32ArrayIntegrationFour030
     * @tc.desc Verify toString returns Infinity for a single +Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.POSITIVE_INFINITY]);
      const observedValue030 = arr.toString();
      expect(observedValue030).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_3100
     * @tc.name testFloat32ArrayIntegrationFour031
     * @tc.desc Verify toString returns -Infinity for a single -Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Number.POSITIVE_INFINITY]);
      const observedValue031 = arr.toString();
      expect(observedValue031).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_3200
     * @tc.name testFloat32ArrayIntegrationFour032
     * @tc.desc Verify join combines elements with a separator and emits 1-NaN-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, Number.NaN, 3]);
      const joinedValue032 = arr.join('-');
      expect(joinedValue032).assertEqual('1-NaN-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_3300
     * @tc.name testFloat32ArrayIntegrationFour033
     * @tc.desc Verify includes(+Infinity) matches exactly and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, Number.POSITIVE_INFINITY, 3]);
      const predicateResult033 = arr.includes(Number.POSITIVE_INFINITY);
      expect(predicateResult033).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_3400
     * @tc.name testFloat32ArrayIntegrationFour034
     * @tc.desc Verify includes(-Infinity) matches exactly and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, -Number.POSITIVE_INFINITY, 3]);
      const predicateResult034 = arr.includes(-Number.POSITIVE_INFINITY);
      expect(predicateResult034).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_3500
     * @tc.name testFloat32ArrayIntegrationFour035
     * @tc.desc Verify default sort moves NaN to the end at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3, Number.NaN, 1]);
      arr.sort();
      const element035 = arr.$_get(2);
      expect(element035).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_3600
     * @tc.name testFloat32ArrayIntegrationFour036
     * @tc.desc Verify default sort treats +Infinity as the largest value and moves it to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, Number.POSITIVE_INFINITY, 3]);
      arr.sort();
      const element036 = arr.$_get(2);
      expect(element036).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_3700
     * @tc.name testFloat32ArrayIntegrationFour037
     * @tc.desc Verify default sort treats -Infinity as the smallest value and moves it to the beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, -Number.POSITIVE_INFINITY, 3]);
      arr.sort();
      const element037 = arr.$_get(0);
      expect(element037).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FOUR_3800
     * @tc.name testFloat32ArrayIntegrationFour038
     * @tc.desc Verify $_set stores +0 and 1/value confirms +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      arr.$_set(0, 0);
      const element038 = 1 / arr.$_get(0);
      expect(element038).assertEqual(Number.POSITIVE_INFINITY);
    });

  });
}
