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

export default function mapValuesPart03TestTest(): void {
  describe('MapValuesPart03TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_0100
     * @tc.name mapValuesPart03Test001
     * @tc.desc Verify Map next() value undefined V=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      let it = m.values();
      let r: IteratorResult<string> = it.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_0200
     * @tc.name mapValuesPart03Test002
     * @tc.desc Verify Map next() value undefined V=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let it = m.values();
      let r: IteratorResult<int> = it.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_0300
     * @tc.name mapValuesPart03Test003
     * @tc.desc Verify Map next() value undefined V=boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>();
      let it = m.values();
      let r: IteratorResult<boolean> = it.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_0400
     * @tc.name mapValuesPart03Test004
     * @tc.desc Verify Map next() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 77]]);
      let it = m.values();
      it.next();
      let r1: IteratorResult<int> = it.next();
      let r2: IteratorResult<int> = it.next();
      expect(r1.value).assertUndefined();
      expect(r2.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_0500
     * @tc.name mapValuesPart03Test005
     * @tc.desc Verify Map next() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['a', 'x'], ['b', 'y'], ['c', 'z']]);
      let it = m.values();
      it.next();
      it.next();
      it.next();
      let r: IteratorResult<string> = it.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_0600
     * @tc.name mapValuesPart03Test006
     * @tc.desc Verify values iterator == undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['only', 999]]);
      let it = m.values();
      let firstVal: int = it.next().value!;
      it.next();
      it.next();
      let r: IteratorResult<int> = it.next();
      expect(r.value).assertUndefined();
      expect(firstVal).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_0700
     * @tc.name mapValuesPart03Test007
     * @tc.desc Verify Map 5 next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let it = m.values();
      let allDone: boolean = true;
      for (let i: int = 0; i < 5; i++) {
        if (!it.next().done) {
          allDone = false;
        }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_0800
     * @tc.name mapValuesPart03Test008
     * @tc.desc Verify Map 5 next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['k', 'v']]);
      let it = m.values();
      it.next();
      let allDone: boolean = true;
      for (let i: int = 0; i < 5; i++) {
        if (!it.next().done) {
          allDone = false;
        }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_0900
     * @tc.name mapValuesPart03Test009
     * @tc.desc Verify Map 5 next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let it = m.values();
      it.next();
      it.next();
      let allDone: boolean = true;
      for (let i: int = 0; i < 5; i++) {
        if (!it.next().done) {
          allDone = false;
        }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_1000
     * @tc.name mapValuesPart03Test010
     * @tc.desc Verify Map 10 next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      let it = m.values();
      let count: int = 0;
      for (let i: int = 0; i < 10; i++) {
        let r = it.next();
        if (r.done) {
          count++;
        }
      }
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_1100
     * @tc.name mapValuesPart03Test011
     * @tc.desc Verify next() done boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 5]]);
      let it = m.values();
      it.next();
      let r1 = it.next();
      let r2 = it.next();
      let r3 = it.next();
      expect(typeof r1.done).assertEqual('boolean');
      expect(typeof r2.done).assertEqual('boolean');
      expect(typeof r3.done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_1200
     * @tc.name mapValuesPart03Test012
     * @tc.desc Verify next() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 10]]);
      let it = m.values();
      it.next();
      let r1 = it.next();
      let r2 = it.next();
      let r3 = it.next();
      expect(r1.value).assertUndefined();
      expect(r2.value).assertUndefined();
      expect(r3.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_1300
     * @tc.name mapValuesPart03Test013
     * @tc.desc Verify next() add entry, entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let it = m.values();
      m.set('b', 2);
      let r1: IteratorResult<int> = it.next();
      expect(r1.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_1400
     * @tc.name mapValuesPart03Test014
     * @tc.desc Verify next() delete entry, next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let it = m.values();
      m.delete('a');
      m.delete('b');
      let r: IteratorResult<int> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_1500
     * @tc.name mapValuesPart03Test015
     * @tc.desc Verify next() clear, next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['a', 'x'], ['b', 'y']]);
      let it = m.values();
      m.clear();
      let r: IteratorResult<string> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_1600
     * @tc.name mapValuesPart03Test016
     * @tc.desc Verify delete key, key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let it = m.values();
      it.next();
      m.delete('c');
      let r2: IteratorResult<int> = it.next();
      expect(r2.value!).assertEqual(2);
      let r3: IteratorResult<int> = it.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_1700
     * @tc.name mapValuesPart03Test017
     * @tc.desc Verify delete key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['a', 'x'], ['b', 'y'], ['c', 'z']]);
      let it = m.values();
      it.next();
      m.delete('a');
      let r2: IteratorResult<string> = it.next();
      expect(r2.value!).assertEqual('y');
      let r3: IteratorResult<string> = it.next();
      expect(r3.value!).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_1800
     * @tc.name mapValuesPart03Test018
     * @tc.desc Verify set key value, value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let it = m.values();
      it.next();
      m.set('c', 99);
      it.next();
      let r3: IteratorResult<int> = it.next();
      expect(r3.value!).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_1900
     * @tc.name mapValuesPart03Test019
     * @tc.desc Verify set key value, value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['a', 'x'], ['b', 'y'], ['c', 'z']]);
      let it = m.values();
      it.next();
      m.set('a', 'changed');
      let r2: IteratorResult<string> = it.next();
      expect(r2.value!).assertEqual('y');
      let r3: IteratorResult<string> = it.next();
      expect(r3.value!).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_2000
     * @tc.name mapValuesPart03Test020
     * @tc.desc Verify clear Map, next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let it = m.values();
      it.next();
      m.clear();
      let r: IteratorResult<int> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_2100
     * @tc.name mapValuesPart03Test021
     * @tc.desc Verify clear next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['a', 'x'], ['b', 'y']]);
      let it = m.values();
      it.next();
      m.clear();
      let r1: IteratorResult<string> = it.next();
      let r2: IteratorResult<string> = it.next();
      let r3: IteratorResult<string> = it.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_2200
     * @tc.name mapValuesPart03Test022
     * @tc.desc Verify delete add key, key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let it = m.values();
      it.next();
      m.delete('c');
      m.set('c', 30);
      it.next();
      let r3: IteratorResult<int> = it.next();
      expect(r3.value!).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_2300
     * @tc.name mapValuesPart03Test023
     * @tc.desc Verify add entry, entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let it = m.values();
      m.set('b', 2);
      m.set('c', 3);
      m.set('d', 4);
      let r1: IteratorResult<int> = it.next();
      expect(r1.value!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_2400
     * @tc.name mapValuesPart03Test024
     * @tc.desc Verify Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 10], ['b', 20]]);
      let it = m.values();
      m.set('c', 30);
      let collected: int[] = [];
      let r: IteratorResult<int> = it.next();
      while (!r.done) {
        collected.push(r.value!);
        r = it.next();
      }
      expect(collected.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_2500
     * @tc.name mapValuesPart03Test025
     * @tc.desc Verify V=long Map values() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, long> = new Map<string, long>();
      let it = m.values();
      let r: IteratorResult<long> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_2600
     * @tc.name mapValuesPart03Test026
     * @tc.desc Verify V=double Map values() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, double> = new Map<string, double>();
      let it = m.values();
      let r: IteratorResult<double> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_2700
     * @tc.name mapValuesPart03Test027
     * @tc.desc Verify V=float Map values() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, float> = new Map<string, float>();
      let it = m.values();
      let r: IteratorResult<float> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_2800
     * @tc.name mapValuesPart03Test028
     * @tc.desc Verify V=Date Map values() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Date> = new Map<string, Date>();
      let it = m.values();
      let r: IteratorResult<Date> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_2900
     * @tc.name mapValuesPart03Test029
     * @tc.desc Verify V=RegExp Map values() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, RegExp> = new Map<string, RegExp>();
      let it = m.values();
      let r: IteratorResult<RegExp> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_3000
     * @tc.name mapValuesPart03Test030
     * @tc.desc Verify V=Array Map values() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int[]> = new Map<string, int[]>();
      let it = m.values();
      let r: IteratorResult<int[]> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_3100
     * @tc.name mapValuesPart03Test031
     * @tc.desc Verify V=0(int) done value, done=false value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 0]]);
      let it = m.values();
      let r: IteratorResult<int> = it.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_3200
     * @tc.name mapValuesPart03Test032
     * @tc.desc Verify V=false(boolean) done value, done=false value=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>([['k', false]]);
      let it = m.values();
      let r: IteratorResult<boolean> = it.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_3300
     * @tc.name mapValuesPart03Test033
     * @tc.desc Verify V=""( ) done value, done=false value=""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['k', '']]);
      let it = m.values();
      let r: IteratorResult<string> = it.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_3400
     * @tc.name mapValuesPart03Test034
     * @tc.desc Verify V=null done=false value=null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | null> = new Map<string, string | null>([['k', null]]);
      let it = m.values();
      let r: IteratorResult<string | null> = it.next();
      expect(r.done).assertFalse();
      expect(r.value).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_3500
     * @tc.name mapValuesPart03Test035
     * @tc.desc Verify V=undefined done=false value=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | undefined> = new Map<string, string | undefined>();
      m.set('k', undefined);
      let it = m.values();
      let r: IteratorResult<string | undefined> = it.next();
      expect(r.done).assertFalse();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_3600
     * @tc.name mapValuesPart03Test036
     * @tc.desc Verify V=NaN done=false value NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>([['k', Number.NaN]]);
      let it = m.values();
      let r: IteratorResult<number> = it.next();
      expect(r.done).assertFalse();
      expect(isNaN(r.value!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_3700
     * @tc.name mapValuesPart03Test037
     * @tc.desc Verify values K=string V=number iterator == Number.NEGATIVE_INFI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>([['k', -0.0]]);
      let it = m.values();
      let r: IteratorResult<number> = it.next();
      expect(1.0 / r.value!).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_3800
     * @tc.name mapValuesPart03Test038
     * @tc.desc Verify value=int Map, next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 7], ['b', 7], ['c', 7]]);
      let it = m.values();
      expect(it.next().value!).assertEqual(7);
      expect(it.next().value!).assertEqual(7);
      expect(it.next().value!).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_3900
     * @tc.name mapValuesPart03Test039
     * @tc.desc Verify value=string Map, next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['a', 'dup'], ['b', 'dup'], ['c', 'dup']]);
      let it = m.values();
      expect(it.next().value!).assertEqual('dup');
      expect(it.next().value!).assertEqual('dup');
      expect(it.next().value!).assertEqual('dup');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_4000
     * @tc.name mapValuesPart03Test040
     * @tc.desc Verify value=null Map, next() null done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | null> = new Map<string, string | null>();
      m.set('a', null);
      m.set('b', null);
      m.set('c', null);
      let it = m.values();
      let r1: IteratorResult<string | null> = it.next();
      let r2: IteratorResult<string | null> = it.next();
      let r3: IteratorResult<string | null> = it.next();
      expect(r1.value).assertNull();
      expect(r2.value).assertNull();
      expect(r3.value).assertNull();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_4100
     * @tc.name mapValuesPart03Test041
     * @tc.desc Verify value=undefined Map, next() undefined done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | undefined> = new Map<string, string | undefined>();
      m.set('a', undefined);
      m.set('b', undefined);
      let it = m.values();
      let r1: IteratorResult<string | undefined> = it.next();
      let r2: IteratorResult<string | undefined> = it.next();
      expect(r1.value).assertUndefined();
      expect(r1.done).assertFalse();
      expect(r2.value).assertUndefined();
      expect(r2.done).assertFalse();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_4200
     * @tc.name mapValuesPart03Test042
     * @tc.desc Verify value=NaN Map, next() NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>([['a', Number.NaN], ['b', Number.NaN], ['c', Number.NaN]]);
      let it = m.values();
      expect(isNaN(it.next().value!)).assertTrue();
      expect(isNaN(it.next().value!)).assertTrue();
      expect(isNaN(it.next().value!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_4300
     * @tc.name mapValuesPart03Test043
     * @tc.desc Verify value=true Map, value true done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>([['a', true], ['b', true]]);
      let it = m.values();
      expect(it.next().value!).assertTrue();
      expect(it.next().value!).assertTrue();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_4400
     * @tc.name mapValuesPart03Test044
     * @tc.desc Verify value Date, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dt: Date = new Date(1700000000000);
      const m: Map<string, Date> = new Map<string, Date>([['a', dt], ['b', dt]]);
      let it = m.values();
      let firstVal: Date = it.next().value!;
      let secondVal: Date = it.next().value!;
      let sameRef: boolean = firstVal === secondVal;
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_4500
     * @tc.name mapValuesPart03Test045
     * @tc.desc Verify value RegExp, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('abc', 'g');
      const m: Map<string, RegExp> = new Map<string, RegExp>([['a', re], ['b', re]]);
      let it = m.values();
      let firstVal: RegExp = it.next().value!;
      let secondVal: RegExp = it.next().value!;
      let sameRef: boolean = firstVal === secondVal;
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_4600
     * @tc.name mapValuesPart03Test046
     * @tc.desc Verify Map key values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 0], ['b', 0], ['c', 0]]);
      m.delete('b');
      let it = m.values();
      let count: int = 0;
      let r: IteratorResult<int> = it.next();
      while (!r.done) {
        count++;
        r = it.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_4700
     * @tc.name mapValuesPart03Test047
     * @tc.desc Verify V=string values() Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['k', 'v']]);
      let it1: IterableIterator<string> = m.values();
      let it2: IterableIterator<string> = m.values();
      it1.next();
      expect(it1.next().done).assertTrue();
      expect(it2.next().value!).assertEqual('v');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_4800
     * @tc.name mapValuesPart03Test048
     * @tc.desc Verify V=int values() Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 1]]);
      let it1: IterableIterator<int> = m.values();
      let it2: IterableIterator<int> = m.values();
      it1.next();
      expect(it1.next().done).assertTrue();
      expect(it2.next().value!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_4900
     * @tc.name mapValuesPart03Test049
     * @tc.desc Verify values iterator sameRef true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let it1: IterableIterator<int> = m.values();
      let it2: IterableIterator<int> = m.values();
      it1.next();
      expect(it1.next().done).assertTrue();
      expect(it2.next().value!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_5000
     * @tc.name mapValuesPart03Test050
     * @tc.desc Verify Map values() Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let it1: IterableIterator<int> = m.values();
      let it2: IterableIterator<int> = m.values();
      expect(it1.next().done).assertTrue();
      expect(it2.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_5100
     * @tc.name mapValuesPart03Test051
     * @tc.desc Verify values() Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let it1: IterableIterator<int> = m.values();
      let it2: IterableIterator<int> = m.values();
      it1.next();
      expect(it1.next().done).assertTrue();
      expect(it2.next().value!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_5200
     * @tc.name mapValuesPart03Test052
     * @tc.desc Verify Symbol.iterator typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['k', 'v']]);
      let it: IterableIterator<string> = m.values();
      let symIt: IterableIterator<string> = it;
      expect(typeof symIt).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_5300
     * @tc.name mapValuesPart03Test053
     * @tc.desc Verify IteratorResult done value done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['k', 'hello']]);
      let it = m.values();
      let r: IteratorResult<string> = it.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_5400
     * @tc.name mapValuesPart03Test054
     * @tc.desc Verify IteratorResult done=true value=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 42]]);
      let it = m.values();
      it.next();
      let r: IteratorResult<int> = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_5500
     * @tc.name mapValuesPart03Test055
     * @tc.desc Verify IteratorResult.done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 1]]);
      let it = m.values();
      it.next();
      let r1: IteratorResult<int> = it.next();
      expect(r1.done).assertTrue();
      let r2: IteratorResult<int> = it.next();
      expect(r2.done).assertTrue();
      let r3: IteratorResult<int> = it.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_5600
     * @tc.name mapValuesPart03Test056
     * @tc.desc Verify K=int Map delete key, values key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      let it = m.values();
      it.next();
      m.delete(3);
      let r2: IteratorResult<string> = it.next();
      expect(r2.value!).assertEqual('b');
      let r3: IteratorResult<string> = it.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_5700
     * @tc.name mapValuesPart03Test057
     * @tc.desc Verify K=boolean Map delete key, values false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, string> = new Map<boolean, string>([[true, 'yes'], [false, 'no']]);
      let it = m.values();
      it.next();
      m.delete(false);
      let r: IteratorResult<string> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_5800
     * @tc.name mapValuesPart03Test058
     * @tc.desc Verify K=number Map delete key, values key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, string> = new Map<number, string>([[1.5, 'a'], [2.5, 'b'], [3.5, 'c']]);
      let it = m.values();
      it.next();
      m.delete(3.5);
      let r2: IteratorResult<string> = it.next();
      expect(r2.value!).assertEqual('b');
      let r3: IteratorResult<string> = it.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_5900
     * @tc.name mapValuesPart03Test059
     * @tc.desc Verify K=double Map delete key, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>([[1.0, 'a'], [2.0, 'b'], [3.0, 'c']]);
      let it = m.values();
      it.next();
      m.delete(1.0);
      let r2: IteratorResult<string> = it.next();
      expect(r2.value!).assertEqual('b');
      let r3: IteratorResult<string> = it.next();
      expect(r3.value!).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_6000
     * @tc.name mapValuesPart03Test060
     * @tc.desc Verify K=long Map clear, values done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, string> = new Map<long, string>([[Int.toLong(1), 'a'], [Int.toLong(2), 'b'], [Int.toLong(3), 'c']]);
      let it = m.values();
      it.next();
      m.clear();
      let r: IteratorResult<string> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_6100
     * @tc.name mapValuesPart03Test061
     * @tc.desc Verify K=float Map set key value, value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, int> = new Map<float, int>([[1.0 as float, 10], [2.0 as float, 20], [3.0 as float, 30]]);
      let it = m.values();
      it.next();
      m.set(3.0 as float, 99);
      it.next();
      let r3: IteratorResult<int> = it.next();
      expect(r3.value!).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_6200
     * @tc.name mapValuesPart03Test062
     * @tc.desc Verify for...of break next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let it: IterableIterator<int> = m.values();
      let first: int = 0;
      let second: int = 0;
      for (let v of it) {
        if (v === 2) {
          second = v;
          break;
        }
        first = v;
      }
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_6300
     * @tc.name mapValuesPart03Test063
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let entered: boolean = false;
      for (let v of m.values()) {
        entered = true;
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_6400
     * @tc.name mapValuesPart03Test064
     * @tc.desc Verify for...of int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 5], ['b', 5], ['c', 5]]);
      let collected: int[] = [];
      for (let v of m.values()) {
        collected.push(v);
      }
      expect(collected[0]).assertEqual(5);
      expect(collected[1]).assertEqual(5);
      expect(collected[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_6500
     * @tc.name mapValuesPart03Test065
     * @tc.desc Verify for...of null Map null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | null> = new Map<string, string | null>([['a', null], ['b', null]]);
      let count: int = 0;
      for (let v of m.values()) {
        expect(v).assertNull();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_6600
     * @tc.name mapValuesPart03Test066
     * @tc.desc Verify for...of undefined Map undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | undefined> = new Map<string, string | undefined>();
      m.set('a', undefined);
      m.set('b', undefined);
      let count: int = 0;
      for (let v of m.values()) {
        expect(v).assertUndefined();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_6700
     * @tc.name mapValuesPart03Test067
     * @tc.desc Verify for...of set entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let collected: int[] = [];
      for (let v of m.values()) {
        collected.push(v);
        if (v === 2) {
          m.set('d', 4);
          m.delete('a');
        }
      }
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(2);
      expect(collected[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_6800
     * @tc.name mapValuesPart03Test068
     * @tc.desc Verify next() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let it: IterableIterator<int> = m.values();
      it.next();
      let collected: int[] = [];
      for (let v of it) {
        collected.push(v);
      }
      expect(collected[0]).assertEqual(2);
      expect(collected[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_6900
     * @tc.name mapValuesPart03Test069
     * @tc.desc Verify set key delete key, values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 1]]);
      m.set('k', 2);
      m.delete('k');
      let it = m.values();
      let r: IteratorResult<int> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_7000
     * @tc.name mapValuesPart03Test070
     * @tc.desc Verify delete set key value, value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      m.delete('a');
      m.set('a', 10);
      let it = m.values();
      expect(it.next().value!).assertEqual(2);
      expect(it.next().value!).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_7100
     * @tc.name mapValuesPart03Test071
     * @tc.desc Verify set delete values() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('k1', 'a');
      m.set('k2', 'b');
      m.delete('k1');
      m.set('k3', 'c');
      m.delete('k2');
      let it = m.values();
      expect(it.next().value!).assertEqual('c');
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_7200
     * @tc.name mapValuesPart03Test072
     * @tc.desc Verify delete values() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      m.delete('a');
      m.delete('b');
      m.delete('c');
      let it = m.values();
      let r: IteratorResult<int> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_7300
     * @tc.name mapValuesPart03Test073
     * @tc.desc Verify clear Map values() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.clear();
      let it = m.values();
      let r: IteratorResult<int> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_7400
     * @tc.name mapValuesPart03Test074
     * @tc.desc Verify clear set, values() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['a', 'old']]);
      m.clear();
      m.set('b', 'new');
      let it = m.values();
      let r: IteratorResult<string> = it.next();
      expect(r.value!).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_7500
     * @tc.name mapValuesPart03Test075
     * @tc.desc Verify clear set entry, values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 100]]);
      m.clear();
      m.set('p', 10);
      m.set('q', 20);
      let it = m.values();
      expect(it.next().value!).assertEqual(10);
      expect(it.next().value!).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_7600
     * @tc.name mapValuesPart03Test076
     * @tc.desc Verify set clear set key, values() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k', 1);
      m.clear();
      m.set('k', 99);
      let it = m.values();
      let r: IteratorResult<int> = it.next();
      expect(r.value!).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_7700
     * @tc.name mapValuesPart03Test077
     * @tc.desc Verify clear set clear, values() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('a', 'x');
      m.clear();
      m.set('b', 'y');
      m.clear();
      let it = m.values();
      let r: IteratorResult<string> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_7800
     * @tc.name mapValuesPart03Test078
     * @tc.desc Verify entries value, values() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, int][] = [['a', 9], ['b', 9], ['c', 9]];
      const m: Map<string, int> = new Map<string, int>(entries);
      let it = m.values();
      expect(it.next().value!).assertEqual(9);
      expect(it.next().value!).assertEqual(9);
      expect(it.next().value!).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_7900
     * @tc.name mapValuesPart03Test079
     * @tc.desc Verify entries value null, values() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, string | null][] = [['a', null], ['b', null]];
      const m: Map<string, string | null> = new Map<string, string | null>(entries);
      let it = m.values();
      let r1: IteratorResult<string | null> = it.next();
      let r2: IteratorResult<string | null> = it.next();
      expect(r1.value).assertNull();
      expect(r2.value).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_8000
     * @tc.name mapValuesPart03Test080
     * @tc.desc Verify entries value undefined, values() undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, string | undefined][] = [['a', undefined], ['b', undefined]];
      const m: Map<string, string | undefined> = new Map<string, string | undefined>(entries);
      let it = m.values();
      let r1: IteratorResult<string | undefined> = it.next();
      let r2: IteratorResult<string | undefined> = it.next();
      expect(r1.value).assertUndefined();
      expect(r2.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_8100
     * @tc.name mapValuesPart03Test081
     * @tc.desc Verify entries key value, values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, int][] = [['dup', 5], ['dup', 5], ['dup', 5]];
      const m: Map<string, int> = new Map<string, int>(entries);
      let it = m.values();
      expect(it.next().value!).assertEqual(5);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_8200
     * @tc.name mapValuesPart03Test082
     * @tc.desc Verify entries key key, values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, int][] = [['a', 1], ['b', 100], ['a', 10], ['c', 3]];
      const m: Map<string, int> = new Map<string, int>(entries);
      let it = m.values();
      expect(it.next().value!).assertEqual(10);
      expect(it.next().value!).assertEqual(100);
      expect(it.next().value!).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART03_8300
     * @tc.name mapValuesPart03Test083
     * @tc.desc Verify entries, values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largeEntries: [string, int][] = [];
      for (let i: int = 0; i < 50; i++) {
        largeEntries.push(['k' + i, i]);
      }
      const m: Map<string, int> = new Map<string, int>(largeEntries);
      let it = m.values();
      let count: int = 0;
      while (!it.next().done) {
        count++;
      }
      expect(count).assertEqual(50);
    });

  });
}
