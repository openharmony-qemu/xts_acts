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

export default function mapSetPart02TestTest(): void {
  describe('MapSetPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_0100
     * @tc.name mapSetPart02Test001
     * @tc.desc Verify 2 (key, val) set this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const result: Map<long, int> = map.set(100, 1);
      expect(result).assertEqual(map);
      expect(map.get(100)).assertEqual(1);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_0200
     * @tc.name mapSetPart02Test002
     * @tc.desc Verify 2 set key map size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(100, 1);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_0300
     * @tc.name mapSetPart02Test003
     * @tc.desc Verify 2 set key map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(100, 1);
      map.set(100, 2);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_0400
     * @tc.name mapSetPart02Test004
     * @tc.desc Verify key long.MAX (9223372036854775807) val=int set this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const result: Map<long, int> = map.set(9223372036854775807, 42);
      expect(result).assertEqual(map);
      expect(map.get(9223372036854775807)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_0500
     * @tc.name mapSetPart02Test005
     * @tc.desc Verify key long.MIN (-9223372036854775808) val=int set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const MIN_KEY: long = -9223372036854775807 - 1;
      map.set(MIN_KEY, -42);
      expect(map.get(MIN_KEY)).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_0600
     * @tc.name mapSetPart02Test006
     * @tc.desc Verify key long (0n) val=int set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(0, 0);
      expect(map.has(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_0700
     * @tc.name mapSetPart02Test007
     * @tc.desc Verify key long (-1n) val=int set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(-1, 100);
      expect(map.has(-1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_0800
     * @tc.name mapSetPart02Test008
     * @tc.desc Verify key " " val=int set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('​', 1);
      expect(map.has('​')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_0900
     * @tc.name mapSetPart02Test009
     * @tc.desc Verify key val=string set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('​', 'zero-width');
      expect(map.get('​')).assertEqual('zero-width');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_1000
     * @tc.name mapSetPart02Test010
     * @tc.desc Verify key set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a​b', 10);
      map.set('ab', 20);
      expect(map.get('a​b')).assertEqual(10);
      expect(map.get('ab')).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_1100
     * @tc.name mapSetPart02Test011
     * @tc.desc Verify key key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('', 0);
      map.set('​', 1);
      expect(map.size).assertEqual(2);
      expect(map.get('')).assertEqual(0);
      expect(map.get('​')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_1200
     * @tc.name mapSetPart02Test012
     * @tc.desc Verify key new Date(1000) set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, int> = new Map<Date, int>();
      let d: Date = new Date(1000);
      map.set(d, 42);
      expect(map.get(d)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_1300
     * @tc.name mapSetPart02Test013
     * @tc.desc Verify Date key set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, int> = new Map<Date, int>();
      let d1: Date = new Date(2000);
      let d2: Date = new Date(2000);
      map.set(d1, 1);
      map.set(d2, 2);
      expect(map.size).assertEqual(2);
      expect(map.get(d1)).assertEqual(1);
      expect(map.get(d2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_1400
     * @tc.name mapSetPart02Test014
     * @tc.desc Verify Date key set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, int> = new Map<Date, int>();
      let d: Date = new Date(3000);
      map.set(d, 10);
      map.set(d, 20);
      expect(map.size).assertEqual(1);
      expect(map.get(d)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_1500
     * @tc.name mapSetPart02Test015
     * @tc.desc Verify val=int (MAX) long key set get 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(100, 2147483647);
      expect(map.get(100)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_1600
     * @tc.name mapSetPart02Test016
     * @tc.desc Verify val=int (MIN) long key set get (-2147483647 - 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(200, -2147483648);
      expect(map.get(200)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_1700
     * @tc.name mapSetPart02Test017
     * @tc.desc Verify val=string key set get string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('​', 'hello zero-width');
      expect(map.get('​')).assertEqual('hello zero-width');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_1800
     * @tc.name mapSetPart02Test018
     * @tc.desc Verify val=boolean(true) long key set get true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, boolean> = new Map<long, boolean>();
      map.set(50, true);
      expect(map.get(50)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_1900
     * @tc.name mapSetPart02Test019
     * @tc.desc Verify val=boolean(false) long key set get false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, boolean> = new Map<long, boolean>();
      map.set(60, false);
      expect(map.get(60)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_2000
     * @tc.name mapSetPart02Test020
     * @tc.desc Verify val=number( ) Date key set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, number> = new Map<Date, number>();
      let d: Date = new Date(1000);
      map.set(d, 3.14);
      expect(map.get(d)).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_2100
     * @tc.name mapSetPart02Test021
     * @tc.desc Verify val=Date long key set get Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, Date> = new Map<long, Date>();
      let d: Date = new Date(5000);
      map.set(10, d);
      expect(map.get(10)!).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_2200
     * @tc.name mapSetPart02Test022
     * @tc.desc Verify val=null V null key set get null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | null> = new Map<string, string | null>();
      map.set('​', null);
      expect(map.get('​')).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_2300
     * @tc.name mapSetPart02Test023
     * @tc.desc Verify set instanceof Map K=long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const result: Map<long, int> = map.set(1, 10);
      expect(result instanceof Map).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_2400
     * @tc.name mapSetPart02Test024
     * @tc.desc Verify set this map (===, K= )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      const result: Map<string, int> = map.set('​', 99);
      expect(result).assertEqual(map);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_2500
     * @tc.name mapSetPart02Test025
     * @tc.desc Verify set this map (===, K=Date)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, int> = new Map<Date, int>();
      let d: Date = new Date(2000);
      const result: Map<Date, int> = map.set(d, 99);
      expect(result).assertEqual(map);
      expect(map.get(d)).assertEqual(99);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_2600
     * @tc.name mapSetPart02Test026
     * @tc.desc Verify key this map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(5, 1);
      const result: Map<long, int> = map.set(5, 2);
      expect(result).assertEqual(map);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_2700
     * @tc.name mapSetPart02Test027
     * @tc.desc Verify set get long.MAX key 2147483647 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(9223372036854775807, 2147483647);
      expect(map.get(9223372036854775807)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_2800
     * @tc.name mapSetPart02Test028
     * @tc.desc Verify set get long.MIN key (-2147483647 - 1) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const MIN_KEY: long = -9223372036854775807 - 1;
      map.set(MIN_KEY, -2147483648);
      expect(map.get(MIN_KEY)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_2900
     * @tc.name mapSetPart02Test029
     * @tc.desc Verify set has key long key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(-1, -1);
      expect(map.has(-1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_3000
     * @tc.name mapSetPart02Test030
     * @tc.desc Verify set get K=long V=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(3, 100);
      map.set(3, 200);
      expect(map.get(3)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_3100
     * @tc.name mapSetPart02Test031
     * @tc.desc Verify set has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(7, 10);
      map.set(7, 20);
      expect(map.has(7)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_3200
     * @tc.name mapSetPart02Test032
     * @tc.desc Verify Map set key size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      expect(map.size).assertEqual(0);
      map.set(1, 1);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_3300
     * @tc.name mapSetPart02Test033
     * @tc.desc Verify Map set key size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(1, 1);
      map.set(2, 2);
      let prevSize: int = map.size;
      map.set(3, 3);
      expect(map.size).assertEqual(prevSize + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_3400
     * @tc.name mapSetPart02Test034
     * @tc.desc Verify set key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(1, 1);
      map.set(2, 2);
      let prevSize: int = map.size;
      map.set(1, 10);
      expect(map.size).assertEqual(prevSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_3500
     * @tc.name mapSetPart02Test035
     * @tc.desc Verify set 5 key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      expect(map.size).assertEqual(0);
      map.set(1, 1);
      expect(map.size).assertEqual(1);
      map.set(2, 2);
      expect(map.size).assertEqual(2);
      map.set(3, 3);
      expect(map.size).assertEqual(3);
      map.set(4, 4);
      expect(map.size).assertEqual(4);
      map.set(5, 5);
      expect(map.size).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_3600
     * @tc.name mapSetPart02Test036
     * @tc.desc Verify key set size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let prevSize: int = map.size;
      map.set('​', 2);
      expect(map.size).assertEqual(prevSize + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_3700
     * @tc.name mapSetPart02Test037
     * @tc.desc Verify Date key set size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, int> = new Map<Date, int>();
      let d: Date = new Date(1000);
      map.set(d, 1);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_3800
     * @tc.name mapSetPart02Test038
     * @tc.desc Verify set get K=long V=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(100, 42);
      expect(map.get(100)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_3900
     * @tc.name mapSetPart02Test039
     * @tc.desc Verify set size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(1, 'one');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_4000
     * @tc.name mapSetPart02Test040
     * @tc.desc Verify has K=long V=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const alias: Map<long, int> = map;
      alias.set(5, 500);
      expect(map.has(5)).assertTrue();
      expect(map.get(5)).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_4100
     * @tc.name mapSetPart02Test041
     * @tc.desc Verify set().set().set() this map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(1, 10).set(2, 20).set(3, 30);
      expect(map.size).assertEqual(3);
      expect(map.get(1)).assertEqual(10);
      expect(map.get(2)).assertEqual(20);
      expect(map.get(3)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_4200
     * @tc.name mapSetPart02Test042
     * @tc.desc Verify 5 set size=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(1, 1).set(2, 2).set(3, 3).set(4, 4).set(5, 5);
      expect(map.size).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_4300
     * @tc.name mapSetPart02Test043
     * @tc.desc Verify key key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(1, 1).set(2, 2);
      let sizeAfterFirstTwo: int = map.size;
      map.set(1, 100).set(3, 3);
      expect(map.size).assertEqual(sizeAfterFirstTwo + 1);
      expect(map.get(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_4400
     * @tc.name mapSetPart02Test044
     * @tc.desc Verify set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('​', 0).set('a', 1).set('​', 999);
      expect(map.size).assertEqual(2);
      expect(map.get('​')).assertEqual(999);
      expect(map.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_4500
     * @tc.name mapSetPart02Test045
     * @tc.desc Verify set long key long.MAX key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(1, 1).set(9223372036854775807, 111).set(2, 2);
      expect(map.size).assertEqual(3);
      expect(map.get(9223372036854775807)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_4600
     * @tc.name mapSetPart02Test046
     * @tc.desc Verify set K=long V=int == map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const chained: Map<long, int> = map.set(10, 10).set(20, 20);
      expect(chained).assertEqual(map);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_4700
     * @tc.name mapSetPart02Test047
     * @tc.desc Verify key entries key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(1, 10);
      map.set(2, 20);
      map.set(3, 30);
      map.set(1, 100);
      let iter: IterableIterator<[long, int]> = map.entries();
      let first: IteratorResult<[long, int]> = iter.next();
      expect(first.value![0]).assertEqual(1);
      expect(first.value![1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_4800
     * @tc.name mapSetPart02Test048
     * @tc.desc Verify key entries key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(1, 10);
      map.set(2, 20);
      map.set(3, 30);
      map.set(2, 200);
      let iter: IterableIterator<[long, int]> = map.entries();
      iter.next();
      let second: IteratorResult<[long, int]> = iter.next();
      expect(second.value![0]).assertEqual(2);
      expect(second.value![1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_4900
     * @tc.name mapSetPart02Test049
     * @tc.desc Verify key entries key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(1, 10);
      map.set(2, 20);
      map.set(3, 30);
      map.set(3, 300);
      let iter: IterableIterator<[long, int]> = map.entries();
      iter.next();
      iter.next();
      let third: IteratorResult<[long, int]> = iter.next();
      expect(third.value![0]).assertEqual(3);
      expect(third.value![1]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_5000
     * @tc.name mapSetPart02Test050
     * @tc.desc Verify set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(1, 10);
      map.set(2, 20);
      map.set(1, 100);
      let iter: IterableIterator<[long, int]> = map.entries();
      expect(iter.next().value![0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_5100
     * @tc.name mapSetPart02Test051
     * @tc.desc Verify set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(100, 111);
      map.set(200, 222);
      map.set(100, 999);
      expect(map.get(200)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_5200
     * @tc.name mapSetPart02Test052
     * @tc.desc Verify set clear Map set Map this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(1, 1);
      map.clear();
      const result: Map<long, int> = map.set(2, 2);
      expect(result).assertEqual(map);
      expect(map.size).assertEqual(1);
      expect(map.get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_5300
     * @tc.name mapSetPart02Test053
     * @tc.desc Verify set key value set this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('​', 10);
      const result: Map<string, int> = map.set('​', 20);
      expect(result.get('​')).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_5400
     * @tc.name mapSetPart02Test054
     * @tc.desc Verify long.MAX key get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const MAX_KEY: long = 9223372036854775807;
      map.set(MAX_KEY, 1);
      expect(map.has(MAX_KEY)).assertTrue();
      expect(map.get(MAX_KEY)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_5500
     * @tc.name mapSetPart02Test055
     * @tc.desc Verify long.MIN key get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const MIN_KEY: long = -9223372036854775807 - 1;
      map.set(MIN_KEY, -1);
      expect(map.has(MIN_KEY)).assertTrue();
      expect(map.get(MIN_KEY)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_5600
     * @tc.name mapSetPart02Test056
     * @tc.desc Verify 2147483647 value long.MAX key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const MAX_KEY: long = 9223372036854775807;
      map.set(MAX_KEY, 2147483647);
      expect(map.get(MAX_KEY)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_5700
     * @tc.name mapSetPart02Test057
     * @tc.desc Verify long.MAX key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const MAX_KEY: long = 9223372036854775807;
      map.set(MAX_KEY, 1);
      map.set(MAX_KEY, 999);
      expect(map.size).assertEqual(1);
      expect(map.get(MAX_KEY)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_5800
     * @tc.name mapSetPart02Test058
     * @tc.desc Verify long.MIN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const MIN_KEY: long = -9223372036854775807 - 1;
      map.set(MIN_KEY, -1);
      map.set(MIN_KEY, -888);
      expect(map.size).assertEqual(1);
      expect(map.get(MIN_KEY)).assertEqual(-888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_5900
     * @tc.name mapSetPart02Test059
     * @tc.desc Verify long.MIN long.MAX key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const MIN_KEY: long = -9223372036854775807 - 1;
      const MAX_KEY: long = 9223372036854775807;
      map.set(MIN_KEY, -1);
      map.set(MAX_KEY, 1);
      expect(map.size).assertEqual(2);
      expect(map.get(MIN_KEY)).assertEqual(-1);
      expect(map.get(MAX_KEY)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_6000
     * @tc.name mapSetPart02Test060
     * @tc.desc Verify key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('​', 2147483647);
      expect(map.get('​')).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_6100
     * @tc.name mapSetPart02Test061
     * @tc.desc Verify key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('​', '​');
      expect(map.get('​')).assertEqual('​');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_6200
     * @tc.name mapSetPart02Test062
     * @tc.desc Verify Date key new Date(0) 0ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, int> = new Map<Date, int>();
      let d: Date = new Date(0);
      map.set(d, 0);
      expect(map.get(d)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_6300
     * @tc.name mapSetPart02Test063
     * @tc.desc Verify Map<bigint, int> set this size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, int> = new Map<bigint, int>();
      const result: Map<bigint, int> = map.set(1n, 100);
      expect(result).assertEqual(map);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_6400
     * @tc.name mapSetPart02Test064
     * @tc.desc Verify Map<bigint, string> set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, string> = new Map<bigint, string>();
      map.set(1n, 'one');
      expect(map.get(1n)).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_6500
     * @tc.name mapSetPart02Test065
     * @tc.desc Verify Map<bigint, boolean> set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, boolean> = new Map<bigint, boolean>();
      map.set(1n, true);
      expect(map.get(1n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_6600
     * @tc.name mapSetPart02Test066
     * @tc.desc Verify Map<bigint, Date> set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, Date> = new Map<bigint, Date>();
      let d: Date = new Date(9999);
      map.set(1n, d);
      expect(map.get(1n)!).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_6700
     * @tc.name mapSetPart02Test067
     * @tc.desc Verify Map<bigint, double> set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, double> = new Map<bigint, double>();
      map.set(1n, 3.14159265);
      expect(map.get(1n)).assertEqual(3.14159265);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_6800
     * @tc.name mapSetPart02Test068
     * @tc.desc Verify Map<bigint, number> set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, number> = new Map<bigint, number>();
      map.set(1n, 2.71828);
      expect(map.get(1n)).assertEqual(2.71828);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_6900
     * @tc.name mapSetPart02Test069
     * @tc.desc Verify Map<string, int> key set this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      const result: Map<string, int> = map.set('​', 1);
      expect(result).assertEqual(map);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_7000
     * @tc.name mapSetPart02Test070
     * @tc.desc Verify Map<string, bigint> key set long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, bigint> = new Map<string, bigint>();
      map.set('​', 9223372036854775807n);
      expect(map.get('​')).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_7100
     * @tc.name mapSetPart02Test071
     * @tc.desc Verify Map<Date, int> set this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, int> = new Map<Date, int>();
      let d: Date = new Date(1000);
      const result: Map<Date, int> = map.set(d, 100);
      expect(result).assertEqual(map);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_7200
     * @tc.name mapSetPart02Test072
     * @tc.desc Verify Map<Date, string> set this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, string> = new Map<Date, string>();
      let d: Date = new Date(2000);
      map.set(d, 'date-value');
      expect(map.get(d)).assertEqual('date-value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_7300
     * @tc.name mapSetPart02Test073
     * @tc.desc Verify Map<Date, number> set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, number> = new Map<Date, number>();
      let d: Date = new Date(3000);
      map.set(d, 0.001);
      expect(map.get(d)).assertEqual(0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_7400
     * @tc.name mapSetPart02Test074
     * @tc.desc Verify Map<Date, boolean> set this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, boolean> = new Map<Date, boolean>();
      let d: Date = new Date(4000);
      map.set(d, false);
      expect(map.get(d)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_7500
     * @tc.name mapSetPart02Test075
     * @tc.desc Verify Map<boolean, int> true/false key set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 1);
      map.set(false, 0);
      expect(map.size).assertEqual(2);
      expect(map.get(true)).assertEqual(1);
      expect(map.get(false)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_7600
     * @tc.name mapSetPart02Test076
     * @tc.desc Verify Map<boolean, int> true key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 1);
      map.set(true, 999);
      expect(map.size).assertEqual(1);
      expect(map.get(true)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_7700
     * @tc.name mapSetPart02Test077
     * @tc.desc Verify Map<boolean, string> set this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>();
      map.set(true, 'yes');
      map.set(false, 'no');
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_7800
     * @tc.name mapSetPart02Test078
     * @tc.desc Verify Map<bigint, bigint> K V long set this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, bigint> = new Map<bigint, bigint>();
      const VAL: bigint = 9223372036854775807n;
      map.set(1n, VAL);
      expect(map.get(1n)).assertEqual(VAL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART02_TEST_7900
     * @tc.name mapSetPart02Test079
     * @tc.desc Verify Map<string, Date> key Date value set this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapSetPart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Date> = new Map<string, Date>();
      let d: Date = new Date(5555);
      map.set('​', d);
      expect(map.get('​')!).assertEqual(d);
    });

  });
}
