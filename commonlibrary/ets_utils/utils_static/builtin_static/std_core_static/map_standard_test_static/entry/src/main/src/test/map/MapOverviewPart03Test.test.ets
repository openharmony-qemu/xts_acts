'use static'


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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

export default function mapOverviewPart03TestTest(): void {
  describe('MapOverviewPart03TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0010
     * @tc.name mapOverviewPart03Test001
     * @tc.desc Verify constructor Map size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: [string, int][] = [];
      const m = new Map<string, int>(arr);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0020
     * @tc.name mapOverviewPart03Test002
     * @tc.desc Verify get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      const v = m.get('absent');
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0030
     * @tc.name mapOverviewPart03Test003
     * @tc.desc Verify get key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<int, string>();
      const v = m.get(0);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0040
     * @tc.name mapOverviewPart03Test004
     * @tc.desc Verify set get == 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      const v = m.get('a');
      expect(v).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0050
     * @tc.name mapOverviewPart03Test005
     * @tc.desc Verify get long.MAX key long.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, long>();
      const v = m.get('absent');
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0060
     * @tc.name mapOverviewPart03Test006
     * @tc.desc Verify has key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      expect(m.has('nonexistent')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0070
     * @tc.name mapOverviewPart03Test007
     * @tc.desc Verify has Map key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      expect(m.has('anything')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0080
     * @tc.name mapOverviewPart03Test008
     * @tc.desc Verify has long.MAX key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<long, int>();
      m.set(1, 10);
      expect(m.has(9223372036854775807)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0090
     * @tc.name mapOverviewPart03Test009
     * @tc.desc Verify has number NaN key set NaN false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<number, int>();
      m.set(Number.NaN, 1);
      expect(m.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0100
     * @tc.name mapOverviewPart03Test010
     * @tc.desc Verify has XSS key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      expect(m.has('<script>alert(1)</script>')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0110
     * @tc.name mapOverviewPart03Test011
     * @tc.desc Verify has key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('normal', 1);
      expect(m.has('​')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0120
     * @tc.name mapOverviewPart03Test012
     * @tc.desc Verify get number NaN key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<number, int>();
      const v = m.get(Number.NaN);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0130
     * @tc.name mapOverviewPart03Test013
     * @tc.desc Verify get long.MAX key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<long, int>();
      const v = m.get(9223372036854775807);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0140
     * @tc.name mapOverviewPart03Test014
     * @tc.desc Verify get XSS key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      const v = m.get('<script>alert(1)</script>');
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0150
     * @tc.name mapOverviewPart03Test015
     * @tc.desc Verify get key Map undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      const v = m.get('​');
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0160
     * @tc.name mapOverviewPart03Test016
     * @tc.desc Verify get key Map undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      const v = m.get('');
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0170
     * @tc.name mapOverviewPart03Test017
     * @tc.desc Verify set XSS key get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('<script>alert(1)</script>', 42);
      expect(m.get('<script>alert(1)</script>')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0180
     * @tc.name mapOverviewPart03Test018
     * @tc.desc Verify set key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('​', 1);
      expect(m.has('​')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0190
     * @tc.name mapOverviewPart03Test019
     * @tc.desc Verify set key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('', 1);
      expect(m.has('')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0200
     * @tc.name mapOverviewPart03Test020
     * @tc.desc Verify constructor entries null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ([string, int] | null)[] = [['a', 1], null, ['b', 2]];
      const m = new Map<string, int>(arr);
      expect(m.has('a')).assertTrue();
      expect(m.has('b')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0210
     * @tc.name mapOverviewPart03Test021
     * @tc.desc Verify constructor entries key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: [string, int][] = [['a', 1], ['a', 99], ['b', 2]];
      const m = new Map<string, int>(arr);
      expect(m.get('a')).assertEqual(99);
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0220
     * @tc.name mapOverviewPart03Test022
     * @tc.desc Verify constructor entries key size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: [string, int][] = [['same', 1], ['same', 2], ['same', 3]];
      const m = new Map<string, int>(arr);
      expect(m.get('same')).assertEqual(3);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0230
     * @tc.name mapOverviewPart03Test023
     * @tc.desc Verify constructor entries size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: [string, int][] = [['only', 1]];
      const m = new Map<string, int>(arr);
      expect(m.size).assertEqual(1);
      expect(m.get('only')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0240
     * @tc.name mapOverviewPart03Test024
     * @tc.desc Verify constructor entries long.MAX get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: [long, int][] = [[9223372036854775807, 100]];
      const m = new Map<long, int>(arr);
      expect(m.get(9223372036854775807)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0250
     * @tc.name mapOverviewPart03Test025
     * @tc.desc Verify constructor entries number NaN has NaN true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: [number, int][] = [[Number.NaN, 1]];
      const m = new Map<number, int>(arr);
      expect(m.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0260
     * @tc.name mapOverviewPart03Test026
     * @tc.desc Verify constructor entries XSS key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: [string, int][] = [['<script>alert(1)</script>', 1]];
      const m = new Map<string, int>(arr);
      expect(m.has('<script>alert(1)</script>')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0270
     * @tc.name mapOverviewPart03Test027
     * @tc.desc Verify constructor entries undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ([string, int] | undefined)[] = [['a', 1], undefined, ['c', 3]];
      const m = new Map<string, int>(arr);
      expect(m.has('a')).assertTrue();
      expect(m.has('c')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0280
     * @tc.name mapOverviewPart03Test028
     * @tc.desc Verify constructor bucketsCount 0 Map set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(0 as int);
      m.set('a', 1);
      expect(m.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0290
     * @tc.name mapOverviewPart03Test029
     * @tc.desc Verify constructor bucketsCount -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(-1 as int);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0300
     * @tc.name mapOverviewPart03Test030
     * @tc.desc Verify constructor bucketsCount 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(1 as int);
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      expect(m.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0310
     * @tc.name mapOverviewPart03Test031
     * @tc.desc Verify constructor bucketsCount 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(32);
      m.set('x', 99);
      expect(m.get('x')).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0320
     * @tc.name mapOverviewPart03Test032
     * @tc.desc Verify constructor bucketsCount int.MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(-2147483648 as int);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0330
     * @tc.name mapOverviewPart03Test033
     * @tc.desc Verify constructor bucketsCount 100000 Map set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(100000 as int);
      m.set('key', 42);
      expect(m.get('key')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0340
     * @tc.name mapOverviewPart03Test034
     * @tc.desc Verify forEach callbackfn forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      try {
        m.forEach((_value: int, _key: string): void => {
          throw new Error('callback error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0350
     * @tc.name mapOverviewPart03Test035
     * @tc.desc Verify forEach Map callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      let callCount = 0;
      m.forEach((_value: int, _key: string): void => {
        callCount++;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0360
     * @tc.name mapOverviewPart03Test036
     * @tc.desc Verify forEach Map callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('single', 1);
      let callCount = 0;
      m.forEach((_value: int, _key: string): void => {
        callCount++;
      });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0370
     * @tc.name mapOverviewPart03Test037
     * @tc.desc Verify forEach callbackfn (value, key, map)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('k', 42);
      m.forEach((value: int, key: string, _map: Map<string, int>): void => {
        expect(value).assertEqual(42);
        expect(key).assertEqual('k');
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0380
     * @tc.name mapOverviewPart03Test038
     * @tc.desc Verify forEach callbackfn key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      let visited: string[] = [];
      m.forEach((_value: int, key: string): void => {
        visited.push(key);
        m.delete(key);
      });
      expect(visited.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0390
     * @tc.name mapOverviewPart03Test039
     * @tc.desc Verify forEach callbackfn key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      let callCount = 0;
      m.forEach((_value: int, _key: string): void => {
        callCount++;
        m.set('new_key', 999);
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0400
     * @tc.name mapOverviewPart03Test040
     * @tc.desc Verify forEach clear callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.clear();
      let called = false;
      m.forEach((_value: int, _key: string): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0410
     * @tc.name mapOverviewPart03Test041
     * @tc.desc Verify forEach callbackfn void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      let count = 0;
      m.forEach((_value: int, _key: string): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0420
     * @tc.name mapOverviewPart03Test042
     * @tc.desc Verify get(key) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      const v: int | undefined = m.get('missing');
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0430
     * @tc.name mapOverviewPart03Test043
     * @tc.desc Verify get(key, def) V V|undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      const v: int = m.get('missing', -1);
      expect(v).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0440
     * @tc.name mapOverviewPart03Test044
     * @tc.desc Verify get(key, def) 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      const v: int | undefined = m.get('no_key');
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0450
     * @tc.name mapOverviewPart03Test045
     * @tc.desc Verify get(key, def) key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 100);
      const v = m.get('a');
      expect(v).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0460
     * @tc.name mapOverviewPart03Test046
     * @tc.desc Verify constructor(entries)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArr: [string, number][] = [];
      const m = new Map<string, number>(emptyArr);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0470
     * @tc.name mapOverviewPart03Test047
     * @tc.desc Verify constructor(map)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Map<string, int>();
      src.set('a', 1);
      const copy = new Map<string, int>(src);
      copy.set('a', 999);
      expect(src.get('a')).assertEqual(1);
      expect(copy.get('a')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0480
     * @tc.name mapOverviewPart03Test048
     * @tc.desc Verify constructor(bucketsCount) size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(8 as int);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0490
     * @tc.name mapOverviewPart03Test049
     * @tc.desc Verify delete key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      expect(m.delete('nonexistent')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0500
     * @tc.name mapOverviewPart03Test050
     * @tc.desc Verify delete key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      expect(m.delete('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0510
     * @tc.name mapOverviewPart03Test051
     * @tc.desc Verify delete size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.delete('a');
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0520
     * @tc.name mapOverviewPart03Test052
     * @tc.desc Verify set this set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      const ret = m.set('a', 1);
      ret.set('b', 2);
      expect(m.has('b')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0530
     * @tc.name mapOverviewPart03Test053
     * @tc.desc Verify keys() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      const iter = m.keys();
      iter.next();
      const result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0540
     * @tc.name mapOverviewPart03Test054
     * @tc.desc Verify values() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      const iter = m.values();
      iter.next();
      const result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0550
     * @tc.name mapOverviewPart03Test055
     * @tc.desc Verify entries() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      const iter = m.entries();
      iter.next();
      const result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0560
     * @tc.name mapOverviewPart03Test056
     * @tc.desc Verify delete key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.delete('a');
      expect(m.delete('a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0570
     * @tc.name mapOverviewPart03Test057
     * @tc.desc Verify delete long.MAX key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<long, int>();
      m.set(1, 10);
      expect(m.delete(9223372036854775807)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0580
     * @tc.name mapOverviewPart03Test058
     * @tc.desc Verify delete XSS key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('safe', 1);
      expect(m.delete('<script>alert(1)</script>')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0590
     * @tc.name mapOverviewPart03Test059
     * @tc.desc Verify clear Map clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.clear();
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0600
     * @tc.name mapOverviewPart03Test060
     * @tc.desc Verify clear get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.clear();
      expect(m.get('a')).assertUndefined();
      expect(m.get('b')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0610
     * @tc.name mapOverviewPart03Test061
     * @tc.desc Verify clear has key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.clear();
      expect(m.has('a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0620
     * @tc.name mapOverviewPart03Test062
     * @tc.desc Verify clear set size 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.clear();
      m.set('b', 2);
      expect(m.size).assertEqual(1);
      expect(m.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0630
     * @tc.name mapOverviewPart03Test063
     * @tc.desc Verify set key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      const sizeBefore = m.size;
      m.set('a', 999);
      expect(m.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0640
     * @tc.name mapOverviewPart03Test064
     * @tc.desc Verify set key get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.set('a', 999);
      expect(m.get('a')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0650
     * @tc.name mapOverviewPart03Test065
     * @tc.desc Verify delete set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      m.delete('a');
      m.set('a', 100);
      const iter = m.keys();
      expect(iter.next().value).assertEqual('b');
      expect(iter.next().value).assertEqual('c');
      expect(iter.next().value).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0660
     * @tc.name mapOverviewPart03Test066
     * @tc.desc Verify keys() Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      const iter = m.keys();
      const result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0670
     * @tc.name mapOverviewPart03Test067
     * @tc.desc Verify values() Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      const iter = m.values();
      const result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0680
     * @tc.name mapOverviewPart03Test068
     * @tc.desc Verify entries() Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      const iter = m.entries();
      const result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0690
     * @tc.name mapOverviewPart03Test069
     * @tc.desc Verify keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      m.delete('b');
      const iter = m.keys();
      expect(iter.next().value).assertEqual('a');
      expect(iter.next().value).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0700
     * @tc.name mapOverviewPart03Test070
     * @tc.desc Verify long.MAX key set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<long, int>();
      m.set(9223372036854775807, 42);
      expect(m.get(9223372036854775807)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0710
     * @tc.name mapOverviewPart03Test071
     * @tc.desc Verify long.MIN key set has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<long, int>();
      m.set(-9223372036854775808, 1);
      expect(m.has(-9223372036854775808)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0720
     * @tc.name mapOverviewPart03Test072
     * @tc.desc Verify 0xFFFFFFFF key int set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<long, int>();
      m.set(4294967295, 99);
      expect(m.get(4294967295)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0730
     * @tc.name mapOverviewPart03Test073
     * @tc.desc Verify number NaN value set key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, number>();
      m.set('k', Number.NaN);
      expect(m.has('k')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0740
     * @tc.name mapOverviewPart03Test074
     * @tc.desc Verify number POSITIVE_INFINITY key set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<number, int>();
      m.set(Number.POSITIVE_INFINITY, 1);
      expect(m.get(Number.POSITIVE_INFINITY)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0750
     * @tc.name mapOverviewPart03Test075
     * @tc.desc Verify number NEGATIVE_INFINITY key set has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<number, int>();
      m.set(Number.NEGATIVE_INFINITY, -1);
      expect(m.has(Number.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0760
     * @tc.name mapOverviewPart03Test076
     * @tc.desc Verify number key +0.0 -0.0 Map key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<number, int>();
      m.set(0.0, 1);
      m.set(-0.0, 2);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0770
     * @tc.name mapOverviewPart03Test077
     * @tc.desc Verify number EPSILON key set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<number, int>();
      m.set(Number.EPSILON, 1);
      expect(m.get(Number.EPSILON)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0780
     * @tc.name mapOverviewPart03Test078
     * @tc.desc Verify Map<Date, int> Date key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<Date, int>();
      const d1: Date = new Date(1000);
      m.set(d1, 42);
      const d2: Date = new Date(1000);
      const v = m.get(d2);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0790
     * @tc.name mapOverviewPart03Test079
     * @tc.desc Verify Map<RegExp, int> pattern RegExp key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<RegExp, int>();
      const r1: RegExp = new RegExp('abc', 'g');
      m.set(r1, 1);
      const r2: RegExp = new RegExp('abc', 'g');
      const v = m.get(r2);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0800
     * @tc.name mapOverviewPart03Test080
     * @tc.desc Verify Map<Array<int>, int> key get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<Array<int>, int>();
      const a1: int[] = [1, 2, 3];
      m.set(a1, 100);
      const a2: int[] = [1, 2, 3];
      const v = m.get(a2);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0810
     * @tc.name mapOverviewPart03Test081
     * @tc.desc Verify Map<boolean, int> true/false set/get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<boolean, int>();
      m.set(true, 1);
      m.set(false, 0);
      expect(m.get(true)).assertEqual(1);
      expect(m.get(false)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0820
     * @tc.name mapOverviewPart03Test082
     * @tc.desc Verify Map<boolean, int> true/false size 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<boolean, int>();
      m.set(true, 1);
      m.set(false, 0);
      m.set(true, 999);
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0830
     * @tc.name mapOverviewPart03Test083
     * @tc.desc Verify Map<string, Date> Date value set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, Date>();
      const d: Date = new Date(5000);
      m.set('d', d);
      expect(m.get('d')).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0840
     * @tc.name mapOverviewPart03Test084
     * @tc.desc Verify Map<string, Array<int>> Array value get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, Array<int>>();
      const arr: int[] = [1, 2, 3];
      m.set('arr', arr);
      expect(m.get('arr')).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0850
     * @tc.name mapOverviewPart03Test085
     * @tc.desc Verify Map<string, number> Float Infinity value set get Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, number>();
      m.set('inf', Number.POSITIVE_INFINITY);
      expect(m.get('inf')).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0860
     * @tc.name mapOverviewPart03Test086
     * @tc.desc Verify Map<long, int> long.MAX long.MIN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<long, int>();
      m.set(9223372036854775807, 1);
      m.set(-9223372036854775808, -1);
      expect(m.size).assertEqual(2);
      expect(m.get(9223372036854775807)).assertEqual(1);
      expect(m.get(-9223372036854775808)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0870
     * @tc.name mapOverviewPart03Test087
     * @tc.desc Verify Record $_get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<string, int>();
      const v = rec.$_get('missing');
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0880
     * @tc.name mapOverviewPart03Test088
     * @tc.desc Verify Record $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<string, int>();
      rec.$_set('a', 100);
      expect(rec.$_get('a')).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0890
     * @tc.name mapOverviewPart03Test089
     * @tc.desc Verify Record $_set key $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<string, int>();
      rec.$_set('a', 1);
      rec.$_set('a', 999);
      expect(rec.$_get('a')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0900
     * @tc.name mapOverviewPart03Test090
     * @tc.desc Verify Record $_set XSS key $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<string, int>();
      rec.$_set('<script>alert(1)</script>', 42);
      expect(rec.$_get('<script>alert(1)</script>')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0910
     * @tc.name mapOverviewPart03Test091
     * @tc.desc Verify Record $_set key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<string, int>();
      rec.$_set('', 1);
      expect(rec.has('')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0920
     * @tc.name mapOverviewPart03Test092
     * @tc.desc Verify Record int key $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<int, string>();
      rec.$_set(0, 'zero');
      rec.$_set(1, 'one');
      expect(rec.$_get(0)).assertEqual('zero');
      expect(rec.$_get(1)).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0930
     * @tc.name mapOverviewPart03Test093
     * @tc.desc Verify Record long key long.MAX key $_set/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<long, int>();
      rec.$_set(9223372036854775807, 100);
      expect(rec.$_get(9223372036854775807)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0940
     * @tc.name mapOverviewPart03Test094
     * @tc.desc Verify Record $_set delete true $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<string, int>();
      rec.$_set('a', 1);
      expect(rec.delete('a')).assertTrue();
      expect(rec.$_get('a')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0950
     * @tc.name mapOverviewPart03Test095
     * @tc.desc Verify Record size $_set delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<string, int>();
      rec.$_set('a', 1);
      rec.$_set('b', 2);
      rec.delete('a');
      expect(rec.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0960
     * @tc.name mapOverviewPart03Test096
     * @tc.desc Verify Record forEach $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<string, int>();
      rec.$_set('b', 2);
      rec.$_set('a', 1);
      rec.$_set('c', 3);
      let keys: string[] = [];
      rec.forEach((_value: int, key: string): void => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('b');
      expect(keys[1]).assertEqual('a');
      expect(keys[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0970
     * @tc.name mapOverviewPart03Test097
     * @tc.desc Verify Record $_set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<string, int>();
      rec.$_set('a', 1);
      rec.$_set('b', 2);
      rec.$_set('a', 100);
      let keys: string[] = [];
      rec.forEach((_value: int, key: string): void => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0980
     * @tc.name mapOverviewPart03Test098
     * @tc.desc Verify Record clear $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<string, int>();
      rec.$_set('a', 1);
      rec.clear();
      expect(rec.$_get('a')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_0990
     * @tc.name mapOverviewPart03Test099
     * @tc.desc Verify Record entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<string, int>();
      rec.$_set('x', 10);
      rec.$_set('y', 20);
      const iter = rec.entries();
      const first = iter.next().value;
      const second = iter.next().value;
      expect(first![0]).assertEqual('x');
      expect(first![1]).assertEqual(10);
      expect(second![0]).assertEqual('y');
      expect(second![1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_1000
     * @tc.name mapOverviewPart03Test100
     * @tc.desc Verify keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('first', 1);
      m.set('second', 2);
      m.set('third', 3);
      m.set('first', 111);
      const iter = m.keys();
      expect(iter.next().value).assertEqual('first');
      expect(iter.next().value).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_1010
     * @tc.name mapOverviewPart03Test101
     * @tc.desc Verify keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.delete('a');
      m.set('a', 10);
      m.delete('b');
      m.set('b', 20);
      const iter = m.keys();
      expect(iter.next().value).assertEqual('a');
      expect(iter.next().value).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_1020
     * @tc.name mapOverviewPart03Test102
     * @tc.desc Verify clear set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('old_a', 1);
      m.set('old_b', 2);
      m.clear();
      m.set('new_x', 100);
      m.set('new_y', 200);
      const iter = m.keys();
      expect(iter.next().value).assertEqual('new_x');
      expect(iter.next().value).assertEqual('new_y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_1030
     * @tc.name mapOverviewPart03Test103
     * @tc.desc Verify key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      m.set('a', 11);
      m.set('b', 22);
      m.set('a', 111);
      expect(m.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_1040
     * @tc.name mapOverviewPart03Test104
     * @tc.desc Verify Map keys for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      let count = 0;
      for (const _k of m.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_1050
     * @tc.name mapOverviewPart03Test105
     * @tc.desc Verify Map values for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      let count = 0;
      for (const _v of m.values()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_1060
     * @tc.name mapOverviewPart03Test106
     * @tc.desc Verify Map entries for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      let count = 0;
      for (const _e of m.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_1070
     * @tc.name mapOverviewPart03Test107
     * @tc.desc Verify for...of keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('z', 1);
      m.set('a', 2);
      m.set('m', 3);
      let result: string[] = [];
      for (const k of m.keys()) {
        result.push(k);
      }
      expect(result[0]).assertEqual('z');
      expect(result[1]).assertEqual('a');
      expect(result[2]).assertEqual('m');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_1080
     * @tc.name mapOverviewPart03Test108
     * @tc.desc Verify $_iterator for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('k', 1);
      const iter = m.keys();
      let found = false;
      for (const k of iter) {
        if (k === 'k') {
          found = true;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART03_TEST_1090
     * @tc.name mapOverviewPart03Test109
     * @tc.desc Verify $_iterator for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapOverviewPart03Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('only', 1);
      const iter = m.keys();
      iter.next();
      let count = 0;
      for (const _k of iter) {
        count++;
      }
      expect(count).assertEqual(0);
    });

  });
}
