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

export default function mapOverviewPart02TestTest(): void {
  describe('MapOverviewPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_0100
     * @tc.name mapOverviewPart02Test001
     * @tc.desc Verify Map\<string, int\> instanceof Map true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      expect(m instanceof Map).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_0200
     * @tc.name mapOverviewPart02Test002
     * @tc.desc Verify Map\<string, int\> not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      expect(m).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_0300
     * @tc.name mapOverviewPart02Test003
     * @tc.desc Verify Map\<string, int\> typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      expect(typeof m).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_0400
     * @tc.name mapOverviewPart02Test004
     * @tc.desc Verify K boolean Map\<boolean, string\> not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, string> = new Map<boolean, string>();
      expect(m).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_0500
     * @tc.name mapOverviewPart02Test005
     * @tc.desc Verify Map\<string, int\> size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_0600
     * @tc.name mapOverviewPart02Test006
     * @tc.desc Verify size=1 entries Map\<string, int\> size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_0700
     * @tc.name mapOverviewPart02Test007
     * @tc.desc Verify (-2147483647 - 1) key Map\<int, string\> size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>([[-2147483648, 'v']]);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_0800
     * @tc.name mapOverviewPart02Test008
     * @tc.desc Verify short.MIN key Map\<short, string\> size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, string> = new Map<short, string>([[-32768, 'v']]);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_0900
     * @tc.name mapOverviewPart02Test009
     * @tc.desc Verify double -Infinity key Map\<double, string\> size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>([[Number.NEGATIVE_INFINITY, 'v']]);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_1000
     * @tc.name mapOverviewPart02Test010
     * @tc.desc Verify key Map\<string, int\> size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['​', 1]]);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_1100
     * @tc.name mapOverviewPart02Test011
     * @tc.desc Verify size number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      expect(typeof m.size).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_1200
     * @tc.name mapOverviewPart02Test012
     * @tc.desc Verify size K=short V=string == 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, string> = new Map<short, string>([[-32768, 'a']]);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_1300
     * @tc.name mapOverviewPart02Test013
     * @tc.desc Verify set == m
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      const r: Map<string, int> = m.set('a', 1);
      expect(r).assertEqual(m);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_1400
     * @tc.name mapOverviewPart02Test014
     * @tc.desc Verify set.set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      const r: Map<string, int> = m.set('a', 1).set('b', 2);
      expect(r).assertEqual(m);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_1500
     * @tc.name mapOverviewPart02Test015
     * @tc.desc Verify set.set.set size 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1).set('b', 2).set('c', 3);
      expect(m.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_1600
     * @tc.name mapOverviewPart02Test016
     * @tc.desc Verify set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      const r: Map<string, int> = m.set('a', 2);
      expect(r).assertEqual(m);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_1700
     * @tc.name mapOverviewPart02Test017
     * @tc.desc Verify set key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('a', 2);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_1800
     * @tc.name mapOverviewPart02Test018
     * @tc.desc Verify set get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1).set('b', 2).set('c', 3);
      expect(m.get('a')).assertEqual(1);
      expect(m.get('b')).assertEqual(2);
      expect(m.get('c')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_1900
     * @tc.name mapOverviewPart02Test019
     * @tc.desc Verify (-2147483647 - 1) key set this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      const r: Map<int, string> = m.set(-2147483648, 'v');
      expect(r).assertEqual(m);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_2000
     * @tc.name mapOverviewPart02Test020
     * @tc.desc Verify key set this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      const r: Map<string, int> = m.set('​', 1);
      expect(r).assertEqual(m);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_2100
     * @tc.name mapOverviewPart02Test021
     * @tc.desc Verify get key value int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      expect(m.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_2200
     * @tc.name mapOverviewPart02Test022
     * @tc.desc Verify get key not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      expect(m.get('a')).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_2300
     * @tc.name mapOverviewPart02Test023
     * @tc.desc Verify get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let v: int | undefined = m.get('absent');
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_2400
     * @tc.name mapOverviewPart02Test024
     * @tc.desc Verify get key=(-2147483647 - 1) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(-2147483648, 'minVal');
      expect(m.get(-2147483648)).assertEqual('minVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_2500
     * @tc.name mapOverviewPart02Test025
     * @tc.desc Verify get key=short.MIN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, string> = new Map<short, string>();
      m.set(-32768, 'minShort');
      expect(m.get(-32768)).assertEqual('minShort');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_2600
     * @tc.name mapOverviewPart02Test026
     * @tc.desc Verify get key=double -Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>();
      m.set(Number.NEGATIVE_INFINITY, 'negInf');
      expect(m.get(Number.NEGATIVE_INFINITY)).assertEqual('negInf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_2700
     * @tc.name mapOverviewPart02Test027
     * @tc.desc Verify get key= value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('​', 42);
      expect(m.get('​')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_2800
     * @tc.name mapOverviewPart02Test028
     * @tc.desc Verify get (-2147483647 - 1) key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      let v: string | undefined = m.get(-2147483648);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_2900
     * @tc.name mapOverviewPart02Test029
     * @tc.desc Verify get short.MIN key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, string> = new Map<short, string>();
      let v: string | undefined = m.get(-32768);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_3000
     * @tc.name mapOverviewPart02Test030
     * @tc.desc Verify get Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let s: int = m.size;
      m.get('absent');
      expect(m.size).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_3100
     * @tc.name mapOverviewPart02Test031
     * @tc.desc Verify get(key, def) key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 10);
      expect(m.get('a', 99)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_3200
     * @tc.name mapOverviewPart02Test032
     * @tc.desc Verify get(key, def) key def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      expect(m.get('absent', 99)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_3300
     * @tc.name mapOverviewPart02Test033
     * @tc.desc Verify get(key, def) key V V|undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let v: int = m.get('absent', 0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_3400
     * @tc.name mapOverviewPart02Test034
     * @tc.desc Verify get(key, def) key def (-2147483647 - 1) (-2147483647 - 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      let v: int = m.get(42, -2147483648);
      expect(v).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_3500
     * @tc.name mapOverviewPart02Test035
     * @tc.desc Verify get(key, def) key= value def
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('​', 5);
      expect(m.get('​', 99)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_3600
     * @tc.name mapOverviewPart02Test036
     * @tc.desc Verify has key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      expect(m.has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_3700
     * @tc.name mapOverviewPart02Test037
     * @tc.desc Verify has key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      expect(m.has('absent')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_3800
     * @tc.name mapOverviewPart02Test038
     * @tc.desc Verify has key=(-2147483647 - 1) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(-2147483648, 'v');
      expect(m.has(-2147483648)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_3900
     * @tc.name mapOverviewPart02Test039
     * @tc.desc Verify has int key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      expect(m.has(-2147483648)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_4000
     * @tc.name mapOverviewPart02Test040
     * @tc.desc Verify has key= true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('​', 1);
      expect(m.has('​')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_4100
     * @tc.name mapOverviewPart02Test041
     * @tc.desc Verify has key= false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      expect(m.has('​')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_4200
     * @tc.name mapOverviewPart02Test042
     * @tc.desc Verify has key=short.MIN true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, string> = new Map<short, string>();
      m.set(-32768, 'v');
      expect(m.has(-32768)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_4300
     * @tc.name mapOverviewPart02Test043
     * @tc.desc Verify has key boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let r: boolean = m.has('a');
      expect(typeof r).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_4400
     * @tc.name mapOverviewPart02Test044
     * @tc.desc Verify has Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let s: int = m.size;
      m.has('absent');
      expect(m.size).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_4500
     * @tc.name mapOverviewPart02Test045
     * @tc.desc Verify delete key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      expect(m.delete('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_4600
     * @tc.name mapOverviewPart02Test046
     * @tc.desc Verify delete key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      expect(m.delete('absent')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_4700
     * @tc.name mapOverviewPart02Test047
     * @tc.desc Verify delete key=(-2147483647 - 1) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(-2147483648, 'v');
      expect(m.delete(-2147483648)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_4800
     * @tc.name mapOverviewPart02Test048
     * @tc.desc Verify delete key=short.MIN false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, string> = new Map<short, string>();
      expect(m.delete(-32768)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_4900
     * @tc.name mapOverviewPart02Test049
     * @tc.desc Verify delete key= true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('​', 1);
      expect(m.delete('​')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_5000
     * @tc.name mapOverviewPart02Test050
     * @tc.desc Verify delete key size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      let s: int = m.size;
      m.delete('a');
      expect(m.size).assertEqual(s - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_5100
     * @tc.name mapOverviewPart02Test051
     * @tc.desc Verify delete key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      let s: int = m.size;
      m.delete('absent');
      expect(m.size).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_5200
     * @tc.name mapOverviewPart02Test052
     * @tc.desc Verify delete key key get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.delete('a');
      expect(m.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_5300
     * @tc.name mapOverviewPart02Test053
     * @tc.desc Verify clear size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_5400
     * @tc.name mapOverviewPart02Test054
     * @tc.desc Verify clear has key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.clear();
      expect(m.has('a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_5500
     * @tc.name mapOverviewPart02Test055
     * @tc.desc Verify clear Map not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      m.clear();
      expect(m).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_5600
     * @tc.name mapOverviewPart02Test056
     * @tc.desc Verify clear get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.clear();
      let v: int | undefined = m.get('a');
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_5700
     * @tc.name mapOverviewPart02Test057
     * @tc.desc Verify forEach Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      let s: int = m.size;
      m.forEach((value: int, key: string): void => {});
      expect(m.size).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_5800
     * @tc.name mapOverviewPart02Test058
     * @tc.desc Verify forEach size=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let count: int = 0;
      m.forEach((value: int, key: string): void => { count++; });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_5900
     * @tc.name mapOverviewPart02Test059
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let count: int = 0;
      m.forEach((value: int, key: string): void => { count++; });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_6000
     * @tc.name mapOverviewPart02Test060
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let accessed: boolean = false;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        if (map === m) { accessed = true; }
      });
      expect(accessed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_6100
     * @tc.name mapOverviewPart02Test061
     * @tc.desc Verify values() not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<int> = m.values();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_6200
     * @tc.name mapOverviewPart02Test062
     * @tc.desc Verify keys().next() not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<string> = m.keys();
      let result: IteratorResult<string> = iter.next();
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_6300
     * @tc.name mapOverviewPart02Test063
     * @tc.desc Verify values().next() not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<int> = m.values();
      let result: IteratorResult<int> = iter.next();
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_6400
     * @tc.name mapOverviewPart02Test064
     * @tc.desc Verify entries().next() not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      let result: IteratorResult<[string, int]> = iter.next();
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_6500
     * @tc.name mapOverviewPart02Test065
     * @tc.desc Verify size=1 Map keys().next().value! key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<string> = m.keys();
      expect(iter.next().value!).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_6600
     * @tc.name mapOverviewPart02Test066
     * @tc.desc Verify size=1 Map values().next().value! value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<int> = m.values();
      expect(iter.next().value!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_6700
     * @tc.name mapOverviewPart02Test067
     * @tc.desc Verify Map values().next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<int> = m.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_6800
     * @tc.name mapOverviewPart02Test068
     * @tc.desc Verify Map entries().next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<[string, int]> = m.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_6900
     * @tc.name mapOverviewPart02Test069
     * @tc.desc Verify keys().next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_7000
     * @tc.name mapOverviewPart02Test070
     * @tc.desc Verify values().next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<int> = m.values();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_7100
     * @tc.name mapOverviewPart02Test071
     * @tc.desc Verify keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      let iter: IterableIterator<string> = m.keys();
      expect(iter.next().value!).assertEqual('a');
      expect(iter.next().value!).assertEqual('b');
      expect(iter.next().value!).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_7200
     * @tc.name mapOverviewPart02Test072
     * @tc.desc Verify values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      let iter: IterableIterator<int> = m.values();
      expect(iter.next().value!).assertEqual(1);
      expect(iter.next().value!).assertEqual(2);
      expect(iter.next().value!).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_7300
     * @tc.name mapOverviewPart02Test073
     * @tc.desc Verify Map toString not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      expect(m.toString()).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_7400
     * @tc.name mapOverviewPart02Test074
     * @tc.desc Verify size number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let s: int = m.size;
      expect(typeof s).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_7500
     * @tc.name mapOverviewPart02Test075
     * @tc.desc Verify set 1 size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_7600
     * @tc.name mapOverviewPart02Test076
     * @tc.desc Verify set 2 key size 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_7700
     * @tc.name mapOverviewPart02Test077
     * @tc.desc Verify delete size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      m.delete('a');
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_7800
     * @tc.name mapOverviewPart02Test078
     * @tc.desc Verify get size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let s: int = m.size;
      m.get('a');
      expect(m.size).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_7900
     * @tc.name mapOverviewPart02Test079
     * @tc.desc Verify has size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let s: int = m.size;
      m.has('b');
      expect(m.size).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_8000
     * @tc.name mapOverviewPart02Test080
     * @tc.desc Verify set key get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      expect(m.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_8100
     * @tc.name mapOverviewPart02Test081
     * @tc.desc Verify keys() Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let s: int = m.size;
      m.keys();
      expect(m.size).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_8200
     * @tc.name mapOverviewPart02Test082
     * @tc.desc Verify values() Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let s: int = m.size;
      m.values();
      expect(m.size).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_8300
     * @tc.name mapOverviewPart02Test083
     * @tc.desc Verify Map<RegExp, int> pattern RegExp key has() false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re1: RegExp = new RegExp('abc', 'g');
      let re2: RegExp = new RegExp('abc', 'g');
      const m: Map<RegExp, int> = new Map<RegExp, int>();
      m.set(re1, 42);
      expect(m.has(re2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_8400
     * @tc.name mapOverviewPart02Test084
     * @tc.desc Verify Map\<RegExp, int\> pattern RegExp key get( ) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re1: RegExp = new RegExp('test', 'i');
      let re2: RegExp = new RegExp('test', 'i');
      const m: Map<RegExp, int> = new Map<RegExp, int>();
      m.set(re1, 99);
      expect(m.get(re2)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_8500
     * @tc.name mapOverviewPart02Test085
     * @tc.desc Verify Record.get key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.set('a', 1);
      expect(r.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_8600
     * @tc.name mapOverviewPart02Test086
     * @tc.desc Verify Record.get key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.set('a', 10);
      expect(r.get('a')).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_8700
     * @tc.name mapOverviewPart02Test087
     * @tc.desc Verify Record.get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      let v: int | undefined = r.get('absent');
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_8800
     * @tc.name mapOverviewPart02Test088
     * @tc.desc Verify Record.set size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.set('a', 1);
      expect(r.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART02_TEST_8900
     * @tc.name mapOverviewPart02Test089
     * @tc.desc Verify Record K int get key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart02Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      r.set(-2147483648, 'minInt');
      expect(r.get(-2147483648)).assertEqual('minInt');
    });

  });
}
