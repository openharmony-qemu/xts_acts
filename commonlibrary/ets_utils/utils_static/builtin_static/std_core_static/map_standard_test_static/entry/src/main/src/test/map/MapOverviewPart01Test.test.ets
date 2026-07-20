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

export default function mapOverviewPart01TestTest(): void {
  describe('MapOverviewPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0010
     * @tc.name mapOverviewPart01Test001
     * @tc.desc Verify constructor Map size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0020
     * @tc.name mapOverviewPart01Test002
     * @tc.desc Verify constructor Iterable entries size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1], ['b', 2]]);
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0030
     * @tc.name mapOverviewPart01Test003
     * @tc.desc Verify constructor Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Map<string, int>([['x', 10]]);
      const m = new Map<string, int>(src);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0040
     * @tc.name mapOverviewPart01Test004
     * @tc.desc Verify constructor Array< >
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<[string, int]> = [['k1', 100]];
      const m = new Map<string, int>(arr);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0050
     * @tc.name mapOverviewPart01Test005
     * @tc.desc Verify constructor bucketsCount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, number>(16);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0060
     * @tc.name mapOverviewPart01Test006
     * @tc.desc Verify get key V|undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      expect(m.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0070
     * @tc.name mapOverviewPart01Test007
     * @tc.desc Verify get key+def V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      expect(m.get('b', 99)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0080
     * @tc.name mapOverviewPart01Test008
     * @tc.desc Verify set key+val this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      const ret = m.set('a', 1);
      expect(ret).assertEqual(m);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0090
     * @tc.name mapOverviewPart01Test009
     * @tc.desc Verify has key boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      expect(m.has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0100
     * @tc.name mapOverviewPart01Test010
     * @tc.desc Verify delete key boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      expect(m.delete('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0110
     * @tc.name mapOverviewPart01Test011
     * @tc.desc Verify clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1], ['b', 2]]);
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0120
     * @tc.name mapOverviewPart01Test012
     * @tc.desc Verify forEach callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      let count = 0;
      m.forEach((value: int, key: string) => { count = count + 1; });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0130
     * @tc.name mapOverviewPart01Test013
     * @tc.desc Verify keys IterableIterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      const iter = m.keys();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0140
     * @tc.name mapOverviewPart01Test014
     * @tc.desc Verify values IterableIterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      const iter = m.values();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0150
     * @tc.name mapOverviewPart01Test015
     * @tc.desc Verify entries IterableIterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      const iter = m.entries();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0160
     * @tc.name mapOverviewPart01Test016
     * @tc.desc Verify toString string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      const s = m.toString();
      expect(typeof s).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0170
     * @tc.name mapOverviewPart01Test017
     * @tc.desc Verify Record.get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Record<string, int>();
      r.set('a', 1);
      expect(r.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0180
     * @tc.name mapOverviewPart01Test018
     * @tc.desc Verify Record.set key+value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Record<string, int>();
      r.set('b', 2);
      expect(r.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0190
     * @tc.name mapOverviewPart01Test019
     * @tc.desc Verify entries=null Map size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(null);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0200
     * @tc.name mapOverviewPart01Test020
     * @tc.desc Verify entries= Map size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([]);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0210
     * @tc.name mapOverviewPart01Test021
     * @tc.desc Verify entries= size=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['only', 42]]);
      expect(m.size).assertEqual(1);
      expect(m.get('only')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0220
     * @tc.name mapOverviewPart01Test022
     * @tc.desc Verify entries= size=N
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      expect(m.size).assertEqual(3);
      expect(m.get('a')).assertEqual(1);
      expect(m.get('b')).assertEqual(2);
      expect(m.get('c')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0230
     * @tc.name mapOverviewPart01Test023
     * @tc.desc Verify entries key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['dup', 1], ['dup', 2]]);
      expect(m.size).assertEqual(1);
      expect(m.get('dup')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0240
     * @tc.name mapOverviewPart01Test024
     * @tc.desc Verify entries null null key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string | null, int>([['a', 1], [null, 2]]);
      expect(m.size).assertEqual(2);
      expect(m.get(null)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0250
     * @tc.name mapOverviewPart01Test025
     * @tc.desc Verify entries undefined undefined key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string | undefined, int>([['a', 1], [undefined, 2]]);
      expect(m.size).assertEqual(2);
      expect(m.get(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0260
     * @tc.name mapOverviewPart01Test026
     * @tc.desc Verify entries entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const orig = new Map<string, int>([['x', 1], ['y', 2]]);
      const m = new Map<string, int>(orig.entries());
      expect(m.size).assertEqual(2);
      expect(m.get('x')).assertEqual(1);
      expect(m.get('y')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0270
     * @tc.name mapOverviewPart01Test027
     * @tc.desc Verify entries 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['max', 2147483647]]);
      expect(m.get('max')).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0280
     * @tc.name mapOverviewPart01Test028
     * @tc.desc Verify entries (-2147483647 - 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['min', -2147483648]]);
      expect(m.get('min')).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0290
     * @tc.name mapOverviewPart01Test029
     * @tc.desc Verify entries K=string V=boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, boolean>([['flag', true]]);
      expect(m.get('flag')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0300
     * @tc.name mapOverviewPart01Test030
     * @tc.desc Verify entries K=int V=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<int, string>([[1, 'one']]);
      expect(m.get(1)).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0310
     * @tc.name mapOverviewPart01Test031
     * @tc.desc Verify Map Map size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Map<string, int>();
      const m = new Map<string, int>(src);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0320
     * @tc.name mapOverviewPart01Test032
     * @tc.desc Verify Map size=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Map<string, int>([['k', 99]]);
      const m = new Map<string, int>(src);
      expect(m.size).assertEqual(1);
      expect(m.get('k')).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0330
     * @tc.name mapOverviewPart01Test033
     * @tc.desc Verify get == 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const m = new Map<string, int>(src);
      expect(m.size).assertEqual(3);
      expect(m.get('a')).assertEqual(1);
      expect(m.get('b')).assertEqual(2);
      expect(m.get('c')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0340
     * @tc.name mapOverviewPart01Test034
     * @tc.desc Verify has == 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Map<string, int>([['a', 1]]);
      const m = new Map<string, int>(src);
      src.set('b', 2);
      expect(m.size).assertEqual(1);
      expect(m.has('b')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0350
     * @tc.name mapOverviewPart01Test035
     * @tc.desc Verify has == 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Map<string, int>([['a', 1]]);
      const m = new Map<string, int>(src);
      m.set('b', 2);
      expect(src.size).assertEqual(1);
      expect(src.has('b')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0360
     * @tc.name mapOverviewPart01Test036
     * @tc.desc Verify bucketsCount=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(0);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0370
     * @tc.name mapOverviewPart01Test037
     * @tc.desc Verify bucketsCount=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(1);
      m.set('a', 1);
      expect(m.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0380
     * @tc.name mapOverviewPart01Test038
     * @tc.desc Verify size == 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(-1);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0390
     * @tc.name mapOverviewPart01Test039
     * @tc.desc Verify bucketsCount=2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const m = new Map<string, int>(2147483647);
        m.set('x', 100);
        expect(m.get('x')).assertEqual(100);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ArrayIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0400
     * @tc.name mapOverviewPart01Test040
     * @tc.desc Verify set get K=string V=number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, number>(32);
      m.set('pi', 3.14);
      expect(m.get('pi')).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0410
     * @tc.name mapOverviewPart01Test041
     * @tc.desc Verify key= "" has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('', 1);
      expect(m.has('')).assertTrue();
      expect(m.get('')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0420
     * @tc.name mapOverviewPart01Test042
     * @tc.desc Verify key=Unicode emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('😀', 100);
      expect(m.has('😀')).assertTrue();
      expect(m.get('😀')).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0430
     * @tc.name mapOverviewPart01Test043
     * @tc.desc Verify has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('​', 200);
      expect(m.has('​')).assertTrue();
      expect(m.get('​')).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0440
     * @tc.name mapOverviewPart01Test044
     * @tc.desc Verify key=XSS <script>alert(1)</script>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('<script>alert(1)</script>', 999);
      expect(m.has('<script>alert(1)</script>')).assertTrue();
      expect(m.get('<script>alert(1)</script>')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0450
     * @tc.name mapOverviewPart01Test045
     * @tc.desc Verify key=int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<int, string>();
      m.set(0, 'zero');
      expect(m.has(0)).assertTrue();
      expect(m.get(0)).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0460
     * @tc.name mapOverviewPart01Test046
     * @tc.desc Verify has K=int V=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<int, string>();
      m.set(2147483647, 'max');
      expect(m.has(2147483647)).assertTrue();
      expect(m.get(2147483647)).assertEqual('max');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0470
     * @tc.name mapOverviewPart01Test047
     * @tc.desc Verify key=(-2147483647 - 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<int, string>();
      m.set(-2147483648, 'min');
      expect(m.has(-2147483648)).assertTrue();
      expect(m.get(-2147483648)).assertEqual('min');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0480
     * @tc.name mapOverviewPart01Test048
     * @tc.desc Verify key=boolean true has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<boolean, int>();
      m.set(true, 1);
      expect(m.has(true)).assertTrue();
      expect(m.get(true)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0490
     * @tc.name mapOverviewPart01Test049
     * @tc.desc Verify key=boolean false has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<boolean, int>();
      m.set(false, 0);
      expect(m.has(false)).assertTrue();
      expect(m.get(false)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0500
     * @tc.name mapOverviewPart01Test050
     * @tc.desc Verify key=long 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<long, string>();
      m.set(Int.toLong(0), 'zero');
      expect(m.has(Int.toLong(0))).assertTrue();
      expect(m.get(Int.toLong(0))).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0510
     * @tc.name mapOverviewPart01Test051
     * @tc.desc Verify has K=long V=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<long, string>();
      m.set(9223372036854775807, 'lmax');
      expect(m.has(9223372036854775807)).assertTrue();
      expect(m.get(9223372036854775807)).assertEqual('lmax');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0520
     * @tc.name mapOverviewPart01Test052
     * @tc.desc Verify has K=long V=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<long, string>();
      m.set((-9223372036854775807 - 1), 'lmin');
      expect(m.has((-9223372036854775807 - 1))).assertTrue();
      expect(m.get((-9223372036854775807 - 1))).assertEqual('lmin');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0530
     * @tc.name mapOverviewPart01Test053
     * @tc.desc Verify key=Date Date key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<Date, int>();
      const d1 = new Date(1000);
      const d2 = new Date(1000);
      m.set(d1, 42);
      expect(m.get(d2)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0540
     * @tc.name mapOverviewPart01Test054
     * @tc.desc Verify key=null null key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string | null, int>();
      m.set(null, 999);
      expect(m.has(null)).assertTrue();
      expect(m.get(null)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0550
     * @tc.name mapOverviewPart01Test055
     * @tc.desc Verify key=undefined undefined key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string | undefined, int>();
      m.set(undefined, 888);
      expect(m.has(undefined)).assertTrue();
      expect(m.get(undefined)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0560
     * @tc.name mapOverviewPart01Test056
     * @tc.desc Verify key= key set size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      m.set('a', 100);
      expect(m.size).assertEqual(1);
      expect(m.get('a')).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0570
     * @tc.name mapOverviewPart01Test057
     * @tc.desc Verify key delete false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      expect(m.delete('nonexistent')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0580
     * @tc.name mapOverviewPart01Test058
     * @tc.desc Verify key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      expect(m.has('ghost')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0590
     * @tc.name mapOverviewPart01Test059
     * @tc.desc Verify key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      expect(m.get('missing')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0600
     * @tc.name mapOverviewPart01Test060
     * @tc.desc Verify val=int 0 set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('z', 0);
      expect(m.get('z')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0610
     * @tc.name mapOverviewPart01Test061
     * @tc.desc Verify val=2147483647 set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('max', 2147483647);
      expect(m.get('max')).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0620
     * @tc.name mapOverviewPart01Test062
     * @tc.desc Verify val=(-2147483647 - 1) set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('min', -2147483648);
      expect(m.get('min')).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0630
     * @tc.name mapOverviewPart01Test063
     * @tc.desc Verify val=null null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int | null>();
      m.set('nil', null);
      expect(m.get('nil')).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0640
     * @tc.name mapOverviewPart01Test064
     * @tc.desc Verify val=undefined undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int | undefined>();
      m.set('undef', undefined);
      expect(m.get('undef')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0650
     * @tc.name mapOverviewPart01Test065
     * @tc.desc Verify val=Date value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, Date>();
      const d = new Date(5000);
      m.set('date', d);
      expect(m.get('date')).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0660
     * @tc.name mapOverviewPart01Test066
     * @tc.desc Verify val=string set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<int, string>();
      m.set(1, 'hello');
      expect(m.get(1)).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0670
     * @tc.name mapOverviewPart01Test067
     * @tc.desc Verify val=boolean set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, boolean>();
      m.set('ready', true);
      expect(m.get('ready')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0680
     * @tc.name mapOverviewPart01Test068
     * @tc.desc Verify key def value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 10]]);
      expect(m.get('a', 999)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0690
     * @tc.name mapOverviewPart01Test069
     * @tc.desc Verify get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      expect(m.get('b', 50)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0700
     * @tc.name mapOverviewPart01Test070
     * @tc.desc Verify def (-2147483647 - 1) key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      expect(m.get('c', -2147483648)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0710
     * @tc.name mapOverviewPart01Test071
     * @tc.desc Verify callbackfn forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      try {
        m.forEach((value: int, key: string) => { throw new Error('boom'); });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0720
     * @tc.name mapOverviewPart01Test072
     * @tc.desc Verify forEach == 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let sum = 0;
      m.forEach((value: int, key: string) => { sum = sum + value; });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0730
     * @tc.name mapOverviewPart01Test073
     * @tc.desc Verify Map forEach callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      let called = false;
      m.forEach((value: int, key: string) => { called = true; });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0740
     * @tc.name mapOverviewPart01Test074
     * @tc.desc Verify constructor(Iterable) constructor(Array< >)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<[string, int]> = [['arr', 1]];
      const m1 = new Map<string, int>(arr);
      const m2 = new Map<string, int>([['iter', 2]]);
      expect(m1.get('arr')).assertEqual(1);
      expect(m2.get('iter')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0750
     * @tc.name mapOverviewPart01Test075
     * @tc.desc Verify constructor(Map<K,V>) constructor(entries)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Map<string, int>([['src', 99]]);
      const m1 = new Map<string, int>(src);
      const m2 = new Map<string, int>([['src', 99]]);
      expect(m1.get('src')).assertEqual(99);
      expect(m2.get('src')).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0760
     * @tc.name mapOverviewPart01Test076
     * @tc.desc Verify constructor(bucketsCount) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1 = new Map<string, int>(8);
      const m2 = new Map<string, int>([['a', 1]]);
      expect(m1.size).assertEqual(0);
      expect(m2.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0770
     * @tc.name mapOverviewPart01Test077
     * @tc.desc Verify get V|undefined get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      const v1: int | undefined = m.get('x');
      const v2: int = m.get('x', -1);
      expect(v1).assertUndefined();
      expect(v2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0780
     * @tc.name mapOverviewPart01Test078
     * @tc.desc Verify set this set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1).set('b', 2).set('c', 3);
      expect(m.size).assertEqual(3);
      expect(m.get('a')).assertEqual(1);
      expect(m.get('c')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0790
     * @tc.name mapOverviewPart01Test079
     * @tc.desc Verify size int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      const s: int = m.size;
      expect(s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0800
     * @tc.name mapOverviewPart01Test080
     * @tc.desc Verify get V|undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      const v1: int | undefined = m.get('a');
      const v2: int | undefined = m.get('b');
      expect(v1).assertEqual(1);
      expect(v2).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0810
     * @tc.name mapOverviewPart01Test081
     * @tc.desc Verify has boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      const b: boolean = m.has('a');
      expect(b).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0820
     * @tc.name mapOverviewPart01Test082
     * @tc.desc Verify set this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      const ret = m.set('k', 1);
      expect(ret).assertEqual(m);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0830
     * @tc.name mapOverviewPart01Test083
     * @tc.desc Verify keys() IterableIterator next() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['first', 1]]);
      const iter = m.keys();
      const result = iter.next();
      expect(result.value!).assertEqual('first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0840
     * @tc.name mapOverviewPart01Test084
     * @tc.desc Verify values() IterableIterator next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<int, string>([[1, 'one']]);
      const iter = m.values();
      const result = iter.next();
      expect(result.value!).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0850
     * @tc.name mapOverviewPart01Test085
     * @tc.desc Verify entries() IterableIterator next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['k', 99]]);
      const iter = m.entries();
      const result = iter.next();
      expect(result.value!).not().assertNull();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0860
     * @tc.name mapOverviewPart01Test086
     * @tc.desc Verify clear Map no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0870
     * @tc.name mapOverviewPart01Test087
     * @tc.desc Verify forEach Map callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.forEach((value: int, key: string) => {});
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0880
     * @tc.name mapOverviewPart01Test088
     * @tc.desc Verify next() done:true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      const iter = m.keys();
      iter.next();
      const result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0890
     * @tc.name mapOverviewPart01Test089
     * @tc.desc Verify Record.get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Record<string, int>();
      expect(r.get('nope')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0900
     * @tc.name mapOverviewPart01Test090
     * @tc.desc Verify Record.set key overwrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Record<string, int>();
      r.set('a', 1);
      r.set('a', 100);
      expect(r.get('a')).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0910
     * @tc.name mapOverviewPart01Test091
     * @tc.desc Verify keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      m.set('a', 100);
      const iter = m.keys();
      expect(iter.next().value!).assertEqual('a');
      expect(iter.next().value!).assertEqual('b');
      expect(iter.next().value!).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0920
     * @tc.name mapOverviewPart01Test092
     * @tc.desc Verify delete set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.delete('a');
      m.set('a', 10);
      const iter = m.keys();
      expect(iter.next().value!).assertEqual('b');
      expect(iter.next().value!).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0930
     * @tc.name mapOverviewPart01Test093
     * @tc.desc Verify keys key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('first', 1);
      m.set('second', 2);
      m.set('third', 3);
      const keys: string[] = [];
      const iter = m.keys();
      let r = iter.next();
      while (!r.done) {
        keys.push(r.value!);
        r = iter.next();
      }
      expect(keys[0]).assertEqual('first');
      expect(keys[1]).assertEqual('second');
      expect(keys[2]).assertEqual('third');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0940
     * @tc.name mapOverviewPart01Test094
     * @tc.desc Verify values value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 10);
      m.set('b', 20);
      const vals: int[] = [];
      const iter = m.values();
      let r = iter.next();
      while (!r.done) {
        vals.push(r.value!);
        r = iter.next();
      }
      expect(vals[0]).assertEqual(10);
      expect(vals[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0950
     * @tc.name mapOverviewPart01Test095
     * @tc.desc Verify K=string V=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('key', 42);
      expect(m.get('key')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0960
     * @tc.name mapOverviewPart01Test096
     * @tc.desc Verify K=int V=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<int, string>();
      m.set(100, 'hundred');
      expect(m.get(100)).assertEqual('hundred');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0970
     * @tc.name mapOverviewPart01Test097
     * @tc.desc Verify K=number( ) V=number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<number, number>();
      m.set(3.14, 2.71);
      expect(m.get(3.14)).assertEqual(2.71);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0980
     * @tc.name mapOverviewPart01Test098
     * @tc.desc Verify K=boolean V=boolean true/false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<boolean, boolean>();
      m.set(true, false);
      m.set(false, true);
      expect(m.get(true)).assertFalse();
      expect(m.get(false)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_0990
     * @tc.name mapOverviewPart01Test099
     * @tc.desc Verify K=long V=double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<long, double>();
      m.set(Int.toLong(1), 1.5);
      expect(m.get(Int.toLong(1))).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_1000
     * @tc.name mapOverviewPart01Test100
     * @tc.desc Verify K=Date V=int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<Date, int>();
      const d = new Date(0);
      m.set(d, 0);
      expect(m.get(d)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_1010
     * @tc.name mapOverviewPart01Test101
     * @tc.desc Verify Record K=string V=int set/get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Record<string, int>();
      r.set('k', 100);
      expect(r.get('k')).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART01_TEST_1020
     * @tc.name mapOverviewPart01Test102
     * @tc.desc Verify Record K=int V=string set/get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart01Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Record<int, string>();
      r.set(1, 'one');
      expect(r.get(1)).assertEqual('one');
    });

  });
}
