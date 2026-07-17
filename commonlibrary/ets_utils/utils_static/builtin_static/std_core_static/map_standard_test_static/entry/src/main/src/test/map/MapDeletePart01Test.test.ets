'use static'


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

export default function mapDeleteTestTest(): void {
  describe('MapDeleteTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_0100
     * @tc.name mapDeleteTest001
     * @tc.desc Verify 1 delete K=int key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(100, 200);
      const result: boolean = m.delete(100);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_0200
     * @tc.name mapDeleteTest002
     * @tc.desc Verify 1 delete K=int key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(100, 200);
      const result: boolean = m.delete(999);
      expect(result).assertFalse();
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_0300
     * @tc.name mapDeleteTest003
     * @tc.desc Verify 1 delete K=string key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('alpha', 10);
      const result: boolean = m.delete('alpha');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_0400
     * @tc.name mapDeleteTest004
     * @tc.desc Verify 1 delete K=double key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(3.14, 42);
      const result: boolean = m.delete(3.14);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_0500
     * @tc.name mapDeleteTest005
     * @tc.desc Verify 1 delete K=Array<int> true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const m: Map<int[], int> = new Map<int[], int>();
      m.set(arr, 100);
      const result: boolean = m.delete(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_0600
     * @tc.name mapDeleteTest006
     * @tc.desc Verify delete key=2147483647 true size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(2147483647, 100);
      const oldSize: int = m.size;
      const result: boolean = m.delete(2147483647);
      expect(result).assertTrue();
      expect(m.size).assertEqual(oldSize - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_0700
     * @tc.name mapDeleteTest007
     * @tc.desc Verify delete key=2147483647 has key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(2147483647, 100);
      m.delete(2147483647);
      expect(m.has(2147483647)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_0800
     * @tc.name mapDeleteTest008
     * @tc.desc Verify delete key=2147483647 get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(2147483647, 100);
      m.delete(2147483647);
      expect(m.get(2147483647)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_0900
     * @tc.name mapDeleteTest009
     * @tc.desc Verify delete key=2147483647 false size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(1, 10);
      const oldSize: int = m.size;
      const result: boolean = m.delete(2147483647);
      expect(result).assertFalse();
      expect(m.size).assertEqual(oldSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_1000
     * @tc.name mapDeleteTest010
     * @tc.desc Verify key=2147483647 delete false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(2147483647, 100);
      m.delete(2147483647);
      const result: boolean = m.delete(2147483647);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_1100
     * @tc.name mapDeleteTest011
     * @tc.desc Verify delete key=(-2147483647 - 1) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(-2147483648, 200);
      const result: boolean = m.delete(-2147483648);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_1200
     * @tc.name mapDeleteTest012
     * @tc.desc Verify delete key=(-2147483647 - 1) has key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(-2147483648, 200);
      m.delete(-2147483648);
      expect(m.has(-2147483648)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_1300
     * @tc.name mapDeleteTest013
     * @tc.desc Verify delete key=(-2147483647 - 1) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(50, 60);
      const result: boolean = m.delete(-2147483648);
      expect(result).assertFalse();
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_1400
     * @tc.name mapDeleteTest014
     * @tc.desc Verify key=(-2147483647 - 1) delete false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(-2147483648, 300);
      m.delete(-2147483648);
      const result: boolean = m.delete(-2147483648);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_1500
     * @tc.name mapDeleteTest015
     * @tc.desc Verify delete key=0 true get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(0, 999);
      const result: boolean = m.delete(0);
      expect(result).assertTrue();
      expect(m.get(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_1600
     * @tc.name mapDeleteTest016
     * @tc.desc Verify delete key=0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(7, 77);
      const result: boolean = m.delete(0);
      expect(result).assertFalse();
      expect(m.has(7)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_1700
     * @tc.name mapDeleteTest017
     * @tc.desc Verify delete key=0 has(0) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(0, 500);
      m.delete(0);
      expect(m.has(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_1800
     * @tc.name mapDeleteTest018
     * @tc.desc Verify delete key=1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(1, 1000);
      const result: boolean = m.delete(1);
      expect(result).assertTrue();
      expect(m.has(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_1900
     * @tc.name mapDeleteTest019
     * @tc.desc Verify delete key=1 false key=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(2, 2000);
      const result: boolean = m.delete(1);
      expect(result).assertFalse();
      expect(m.get(2)).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_2000
     * @tc.name mapDeleteTest020
     * @tc.desc Verify delete key=-1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(-1, -100);
      const result: boolean = m.delete(-1);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_2100
     * @tc.name mapDeleteTest021
     * @tc.desc Verify delete key=-1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(5, 50);
      const result: boolean = m.delete(-1);
      expect(result).assertFalse();
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_2200
     * @tc.name mapDeleteTest022
     * @tc.desc Verify delete key=2147483647 map key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(2147483647, 100);
      m.set(42, 420);
      m.delete(2147483647);
      const iter: IterableIterator<int> = m.keys();
      const k: IteratorResult<int> = iter.next();
      expect(k.value!).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_2300
     * @tc.name mapDeleteTest023
     * @tc.desc Verify 2147483647 (-2147483647 - 1) map 2147483647 (-2147483647 - 1) get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(2147483647, 777);
      m.set(-2147483648, 888);
      m.delete(2147483647);
      expect(m.get(-2147483648)).assertEqual(888);
      expect(m.has(2147483647)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_2400
     * @tc.name mapDeleteTest024
     * @tc.desc Verify delete key=NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(Number.NaN, 100);
      const result: boolean = m.delete(Number.NaN);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_2500
     * @tc.name mapDeleteTest025
     * @tc.desc Verify delete key=NaN false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(1.0, 10);
      const result: boolean = m.delete(Number.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_2600
     * @tc.name mapDeleteTest026
     * @tc.desc Verify delete key=Infinity true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(Number.POSITIVE_INFINITY, 200);
      const result: boolean = m.delete(Number.POSITIVE_INFINITY);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_2700
     * @tc.name mapDeleteTest027
     * @tc.desc Verify delete key=Infinity has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(Number.POSITIVE_INFINITY, 300);
      m.delete(Number.POSITIVE_INFINITY);
      expect(m.has(Number.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_2800
     * @tc.name mapDeleteTest028
     * @tc.desc Verify delete key=Infinity false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(2.5, 25);
      const result: boolean = m.delete(Number.POSITIVE_INFINITY);
      expect(result).assertFalse();
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_2900
     * @tc.name mapDeleteTest029
     * @tc.desc Verify delete key=-Infinity true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(-Number.POSITIVE_INFINITY, 400);
      const result: boolean = m.delete(-Number.POSITIVE_INFINITY);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_3000
     * @tc.name mapDeleteTest030
     * @tc.desc Verify delete key=-Infinity false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(99.9, 999);
      const result: boolean = m.delete(-Number.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_3100
     * @tc.name mapDeleteTest031
     * @tc.desc Verify delete key=Number.EPSILON true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(Number.EPSILON, 500);
      const result: boolean = m.delete(Number.EPSILON);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_3200
     * @tc.name mapDeleteTest032
     * @tc.desc Verify delete key=Number.EPSILON false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(0.1, 1);
      const result: boolean = m.delete(Number.EPSILON);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_3300
     * @tc.name mapDeleteTest033
     * @tc.desc Verify delete key=0.0 double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(0.0, 600);
      const result: boolean = m.delete(0.0);
      expect(result).assertTrue();
      expect(m.has(0.0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_3400
     * @tc.name mapDeleteTest034
     * @tc.desc Verify -0.0 key 0.0 delete IEEE 754 -0===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(-0.0, 700);
      const result: boolean = m.delete(0.0);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_3500
     * @tc.name mapDeleteTest035
     * @tc.desc Verify delete double 3.14159 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(3.14159, 800);
      const result: boolean = m.delete(3.14159);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_3600
     * @tc.name mapDeleteTest036
     * @tc.desc Verify delete double false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(2.71828, 271);
      const result: boolean = m.delete(1.41421);
      expect(result).assertFalse();
      expect(m.get(2.71828)).assertEqual(271);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_3700
     * @tc.name mapDeleteTest037
     * @tc.desc Verify delete key=double 1e100 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(1e100, 900);
      const result: boolean = m.delete(1e100);
      expect(result).assertTrue();
    });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_3800
     * @tc.name mapDeleteTest038
     * @tc.desc Verify delete Unicode emoji true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('😀', 10);
      const result: boolean = m.delete('😀');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_3900
     * @tc.name mapDeleteTest039
     * @tc.desc Verify delete Unicode emoji false size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('alpha', 1);
      const oldSize: int = m.size;
      const result: boolean = m.delete('😀');
      expect(result).assertFalse();
      expect(m.size).assertEqual(oldSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_4000
     * @tc.name mapDeleteTest040
     * @tc.desc Verify delete emoji has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('😀', 20);
      m.delete('😀');
      expect(m.has('😀')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_4100
     * @tc.name mapDeleteTest041
     * @tc.desc Verify delete emoji get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('😀', 30);
      m.delete('😀');
      expect(m.get('😀')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_4200
     * @tc.name mapDeleteTest042
     * @tc.desc Verify emoji delete false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('😀', 40);
      m.delete('😀');
      const result: boolean = m.delete('😀');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_4300
     * @tc.name mapDeleteTest043
     * @tc.desc Verify delete "" true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('', 50);
      const result: boolean = m.delete('');
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_4400
     * @tc.name mapDeleteTest044
     * @tc.desc Verify delete "" false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('x', 60);
      const result: boolean = m.delete('');
      expect(result).assertFalse();
      expect(m.has('x')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_4500
     * @tc.name mapDeleteTest045
     * @tc.desc Verify delete ASCII true size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('hello', 70);
      const oldSize: int = m.size;
      const result: boolean = m.delete('hello');
      expect(result).assertTrue();
      expect(m.size).assertEqual(oldSize - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_4600
     * @tc.name mapDeleteTest046
     * @tc.desc Verify delete false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('foo', 80);
      const result: boolean = m.delete('bar');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_4700
     * @tc.name mapDeleteTest047
     * @tc.desc Verify delete size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('only', 90);
      m.delete('only');
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_4800
     * @tc.name mapDeleteTest048
     * @tc.desc Verify delete set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('key', 100);
      m.delete('key');
      m.set('key', 200);
      expect(m.get('key')).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_4900
     * @tc.name mapDeleteTest049
     * @tc.desc Verify arr1 key arr1 delete true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: int[] = [1, 2, 3];
      const m: Map<int[], int> = new Map<int[], int>();
      m.set(arr1, 500);
      const result: boolean = m.delete(arr1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_5000
     * @tc.name mapDeleteTest050
     * @tc.desc Verify arr1 arr2 delete false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: int[] = [1, 2, 3];
      const arr2: int[] = [1, 2, 3];
      const m: Map<int[], int> = new Map<int[], int>();
      m.set(arr1, 600);
      const result: boolean = m.delete(arr2);
      expect(result).assertFalse();
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_5100
     * @tc.name mapDeleteTest051
     * @tc.desc Verify delete arr1 has(arr1) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrKey: int[] = [10, 20, 30];
      const m: Map<int[], int> = new Map<int[], int>();
      m.set(arrKey, 700);
      m.delete(arrKey);
      expect(m.has(arrKey)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_5200
     * @tc.name mapDeleteTest052
     * @tc.desc Verify delete arr1 get(arr1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrKey: int[] = [4, 5, 6];
      const m: Map<int[], int> = new Map<int[], int>();
      m.set(arrKey, 800);
      m.delete(arrKey);
      expect(m.get(arrKey)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_5300
     * @tc.name mapDeleteTest053
     * @tc.desc Verify delete false size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const existingArr: int[] = [7, 8, 9];
      const nonExistingArr: int[] = [0, 0, 0];
      const m: Map<int[], int> = new Map<int[], int>();
      m.set(existingArr, 900);
      const oldSize: int = m.size;
      const result: boolean = m.delete(nonExistingArr);
      expect(result).assertFalse();
      expect(m.size).assertEqual(oldSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_5400
     * @tc.name mapDeleteTest054
     * @tc.desc Verify delete set , int>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrOld: int[] = [1, 1, 1];
      const arrNew: int[] = [1, 1, 1];
      const m: Map<int[], int> = new Map<int[], int>();
      m.set(arrOld, 1000);
      m.delete(arrOld);
      m.set(arrNew, 2000);
      expect(m.get(arrNew)).assertEqual(2000);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_5500
     * @tc.name mapDeleteTest055
     * @tc.desc Verify delete , int>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrKey: int[] = [5, 5, 5];
      const m: Map<int[], int> = new Map<int[], int>();
      m.set(arrKey, 111);
      m.set(arrKey, 222);
      const strArr: int[] = [6, 6, 6];
      m.set(strArr, 333);
      m.delete(arrKey);
      expect(m.get(strArr)).assertEqual(333);
      expect(m.has(arrKey)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_5600
     * @tc.name mapDeleteTest056
     * @tc.desc Verify Map size=0 delete key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      const result: boolean = m.delete(42);
      expect(result).assertFalse();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_5700
     * @tc.name mapDeleteTest057
     * @tc.desc Verify size=1 Map delete key true size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('single', 1);
      const result: boolean = m.delete('single');
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_5800
     * @tc.name mapDeleteTest058
     * @tc.desc Verify size=1 Map delete key false size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('only', 99);
      const result: boolean = m.delete('absent');
      expect(result).assertFalse();
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_5900
     * @tc.name mapDeleteTest059
     * @tc.desc Verify Map delete key true size=N-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      for (let i: int = 0; i < 100; i++) {
        m.set(i, i * 10);
      }
      const oldSize: int = m.size;
      const result: boolean = m.delete(50);
      expect(result).assertTrue();
      expect(m.size).assertEqual(oldSize - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_6000
     * @tc.name mapDeleteTest060
     * @tc.desc Verify Map delete key false size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      for (let i: int = 0; i < 100; i++) {
        m.set(i, i * 10);
      }
      const oldSize: int = m.size;
      const result: boolean = m.delete(999);
      expect(result).assertFalse();
      expect(m.size).assertEqual(oldSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_6100
     * @tc.name mapDeleteTest061
     * @tc.desc Verify insert 2147483647 delete insert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(2147483647, 111);
      m.delete(2147483647);
      m.set(2147483647, 222);
      expect(m.get(2147483647)).assertEqual(222);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_6200
     * @tc.name mapDeleteTest062
     * @tc.desc Verify insert (-2147483647 - 1) delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(-2147483648, 333);
      const result: boolean = m.delete(-2147483648);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_6300
     * @tc.name mapDeleteTest063
     * @tc.desc Verify map delete 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(1, 10);
      m.set(2147483647, 20);
      m.set(2, 30);
      m.delete(2147483647);
      const iter: IterableIterator<int> = m.keys();
      expect(iter.next().value!).assertEqual(1);
      expect(iter.next().value!).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_6400
     * @tc.name mapDeleteTest064
     * @tc.desc Verify delete (-2147483647 - 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(-2147483648, 100);
      m.set(-2147483647, 200);
      m.set(-1, 300);
      m.delete(-2147483648);
      expect(m.get(-2147483647)).assertEqual(200);
      expect(m.get(-1)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_6500
     * @tc.name mapDeleteTest065
     * @tc.desc Verify delete NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(Number.NaN, 444);
      m.set(1.5, 555);
      m.set(2.5, 666);
      m.delete(Number.NaN);
      expect(m.get(1.5)).assertEqual(555);
      expect(m.get(2.5)).assertEqual(666);
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_6600
     * @tc.name mapDeleteTest066
     * @tc.desc Verify NaN IEEE 754 NaN!==NaN Map delete size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(Number.NaN, 100);
      m.set(Number.NaN, 200);
      expect(m.size).assertEqual(1);
      m.delete(Number.NaN);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_6700
     * @tc.name mapDeleteTest067
     * @tc.desc Verify delete Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(Number.POSITIVE_INFINITY, 777);
      m.set(1e308, 888);
      m.delete(Number.POSITIVE_INFINITY);
      expect(m.has(Number.POSITIVE_INFINITY)).assertFalse();
      expect(m.get(1e308)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_6800
     * @tc.name mapDeleteTest068
     * @tc.desc Verify delete -Infinity +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(Number.POSITIVE_INFINITY, 100);
      m.set(-Number.POSITIVE_INFINITY, 200);
      m.delete(-Number.POSITIVE_INFINITY);
      expect(m.has(Number.POSITIVE_INFINITY)).assertTrue();
      expect(m.has(-Number.POSITIVE_INFINITY)).assertFalse();
      expect(m.get(Number.POSITIVE_INFINITY)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_6900
     * @tc.name mapDeleteTest069
     * @tc.desc Verify delete Number.EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(Number.EPSILON, 111);
      m.set(Number.EPSILON * 2, 222);
      m.delete(Number.EPSILON);
      expect(m.has(Number.EPSILON)).assertFalse();
      expect(m.get(Number.EPSILON * 2)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_7000
     * @tc.name mapDeleteTest070
     * @tc.desc Verify 0xFFFFFFFF number insert delete 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      const keyVal: number = 0xFFFFFFFF;
      m.set(keyVal, 999);
      const result: boolean = m.delete(0xFFFFFFFF);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_7100
     * @tc.name mapDeleteTest071
     * @tc.desc Verify 0xFFFFFFFF number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(0xFFFFFFFF, 100);
      m.set(0xFFFFFFFE, 200);
      m.set(0x100000000, 300);
      m.delete(0xFFFFFFFF);
      expect(m.has(0xFFFFFFFF)).assertFalse();
      expect(m.get(0xFFFFFFFE)).assertEqual(200);
      expect(m.get(0x100000000)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_7200
     * @tc.name mapDeleteTest072
     * @tc.desc Verify 2147483647 (-2147483647 - 1) map delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(2147483647, 10);
      m.set(-2147483648, 20);
      m.delete(2147483647);
      expect(m.has(2147483647)).assertFalse();
      expect(m.has(-2147483648)).assertTrue();
      m.delete(-2147483648);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_7300
     * @tc.name mapDeleteTest073
     * @tc.desc Verify insert delete 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(2147483647, 1);
      m.delete(2147483647);
      m.set(2147483647, 2);
      m.delete(2147483647);
      m.set(2147483647, 3);
      expect(m.get(2147483647)).assertEqual(3);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_7400
     * @tc.name mapDeleteTest074
     * @tc.desc Verify delete 0 map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(0, 100);
      for (let i: int = 1; i < 50; i++) {
        m.set(i, i * 10);
      }
      m.delete(0);
      expect(m.has(0)).assertFalse();
      expect(m.size).assertEqual(49);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_7500
     * @tc.name mapDeleteTest075
     * @tc.desc Verify double 1e308 insert delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(1e308, 555);
      const result: boolean = m.delete(1e308);
      expect(result).assertTrue();
      expect(m.has(1e308)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_7600
     * @tc.name mapDeleteTest076
     * @tc.desc Verify NaN Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(Number.NaN, 1);
      m.set(Number.POSITIVE_INFINITY, 2);
      m.delete(Number.NaN);
      expect(m.has(Number.NaN)).assertFalse();
      expect(m.get(Number.POSITIVE_INFINITY)).assertEqual(2);
      m.delete(Number.POSITIVE_INFINITY);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_7700
     * @tc.name mapDeleteTest077
     * @tc.desc Verify delete 0.0 -0.0 has IEEE 754 -0===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapDeleteTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(-0.0, 777);
      m.set(Number.POSITIVE_INFINITY, 888);
      m.delete(-0.0);
      expect(m.has(0.0)).assertFalse();
      expect(m.has(-0.0)).assertFalse();
    });

  });
}
