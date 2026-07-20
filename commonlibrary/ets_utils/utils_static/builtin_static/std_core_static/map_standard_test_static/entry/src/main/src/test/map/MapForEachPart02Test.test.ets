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

export default function mapForEachPart02TestTest(): void {
  describe('MapForEachPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_0100
     * @tc.name mapForEachPart02Test001
     * @tc.desc Verify K=string V=int Map forEach typeof undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['alpha', 99]]);
      let ret = m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(typeof ret).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_0200
     * @tc.name mapForEachPart02Test002
     * @tc.desc Verify K=string V=int Map forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k0', 10], ['k1', 20]]);
      let result = m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_0300
     * @tc.name mapForEachPart02Test003
     * @tc.desc Verify K=string V=int Map forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let result = m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_0400
     * @tc.name mapForEachPart02Test004
     * @tc.desc Verify K=int V=string Map forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>([[99, 'ninetyNine']]);
      let result = m.forEach((value: string, key: int, map: Map<int, string>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_0500
     * @tc.name mapForEachPart02Test005
     * @tc.desc Verify K=double V=number forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, number> = new Map<double, number>([[1.1, 2.2], [3.3, 4.4], [5.5, 6.6]]);
      let result = m.forEach((value: number, key: double, map: Map<double, number>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_0600
     * @tc.name mapForEachPart02Test006
     * @tc.desc Verify K=boolean V=string forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, string> = new Map<boolean, string>([[true, 'T'], [false, 'F']]);
      let result = m.forEach((value: string, key: boolean, map: Map<boolean, string>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_0700
     * @tc.name mapForEachPart02Test007
     * @tc.desc Verify K=Date V=number forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(2023, 6, 15);
      let d2: Date = new Date(2024, 6, 15);
      const m: Map<Date, number> = new Map<Date, number>([[d1, 1.5], [d2, 2.5]]);
      let result = m.forEach((value: number, key: Date, map: Map<Date, number>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_0800
     * @tc.name mapForEachPart02Test008
     * @tc.desc Verify K=long V=int forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, int> = new Map<long, int>([[Int.toLong(5000), 5], [Int.toLong(10000), 10]]);
      let result = m.forEach((value: int, key: long, map: Map<long, int>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_0900
     * @tc.name mapForEachPart02Test009
     * @tc.desc Verify Map null entry forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | null> = new Map<string, string | null>();
      m.set('defined', 'hello');
      m.set('nil', null);
      let result = m.forEach((value: string | null, key: string, map: Map<string, string | null>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_1000
     * @tc.name mapForEachPart02Test010
     * @tc.desc Verify K=string V=int 10 Map forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      for (let i: int = 0; i < 10; i++) {
        m.set('entry' + i.toString(), i * 10);
      }
      let result = m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_1100
     * @tc.name mapForEachPart02Test011
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['t1', 55]]);
      let ret = m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(ret instanceof Map).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_1200
     * @tc.name mapForEachPart02Test012
     * @tc.desc Verify Map forEach size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_1300
     * @tc.name mapForEachPart02Test013
     * @tc.desc Verify Map forEach size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['lonely', 777]]);
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_1400
     * @tc.name mapForEachPart02Test014
     * @tc.desc Verify Map forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['A', 10], ['B', 20], ['C', 30], ['D', 40]]);
      let beforeSize: int = m.size;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(m.size).assertEqual(beforeSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_1500
     * @tc.name mapForEachPart02Test015
     * @tc.desc Verify K=int V=string forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>([[10, 'ten'], [20, 'twenty'], [30, 'thirty']]);
      let beforeSize: int = m.size;
      m.forEach((value: string, key: int, map: Map<int, string>): void => {});
      expect(m.size).assertEqual(beforeSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_1600
     * @tc.name mapForEachPart02Test016
     * @tc.desc Verify K=double V=number forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, number> = new Map<double, number>([[1.0, 10.0], [2.0, 20.0]]);
      let beforeSize: int = m.size;
      m.forEach((value: number, key: double, map: Map<double, number>): void => {});
      expect(m.size).assertEqual(beforeSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_1700
     * @tc.name mapForEachPart02Test017
     * @tc.desc Verify K=boolean V=string forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, string> = new Map<boolean, string>([[true, 'ok'], [false, 'nok']]);
      let beforeSize: int = m.size;
      m.forEach((value: string, key: boolean, map: Map<boolean, string>): void => {});
      expect(m.size).assertEqual(beforeSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_1800
     * @tc.name mapForEachPart02Test018
     * @tc.desc Verify K=Date V=int forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(2020, 1, 1);
      let d2: Date = new Date(2020, 2, 1);
      const m: Map<Date, int> = new Map<Date, int>([[d1, 111], [d2, 222]]);
      let beforeSize: int = m.size;
      m.forEach((value: int, key: Date, map: Map<Date, int>): void => {});
      expect(m.size).assertEqual(beforeSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_1900
     * @tc.name mapForEachPart02Test019
     * @tc.desc Verify set key forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['apple', 1], ['banana', 2]]);
      m.set('apple', 999);
      let beforeSize: int = m.size;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(m.size).assertEqual(beforeSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_2000
     * @tc.name mapForEachPart02Test020
     * @tc.desc Verify delete forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['remove', 1], ['stay', 2], ['alsoStay', 3]]);
      m.delete('remove');
      let beforeSize: int = m.size;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(m.size).assertEqual(beforeSize);
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_2100
     * @tc.name mapForEachPart02Test021
     * @tc.desc Verify Map forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      for (let i: int = 0; i < 20; i++) {
        m.set('key' + i.toString(), i);
      }
      let beforeSize: int = m.size;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(m.size).assertEqual(beforeSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_2200
     * @tc.name mapForEachPart02Test022
     * @tc.desc Verify forEach has key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['red', 1], ['green', 2], ['blue', 3]]);
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(m.has('red')).assertTrue();
      expect(m.has('green')).assertTrue();
      expect(m.has('blue')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_2300
     * @tc.name mapForEachPart02Test023
     * @tc.desc Verify forEach has key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['gold', 5], ['silver', 10]]);
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(m.has('platinum')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_2400
     * @tc.name mapForEachPart02Test024
     * @tc.desc Verify forEach get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['cat', 100], ['dog', 200], ['bird', 300]]);
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(m.get('cat')).assertEqual(100);
      expect(m.get('dog')).assertEqual(200);
      expect(m.get('bird')).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_2500
     * @tc.name mapForEachPart02Test025
     * @tc.desc Verify forEach entries key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('sun', 1);
      m.set('moon', 2);
      m.set('star', 3);
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      let iter: IterableIterator<[string, int]> = m.entries();
      let r1: IteratorResult<[string, int]> = iter.next();
      let r2: IteratorResult<[string, int]> = iter.next();
      let r3: IteratorResult<[string, int]> = iter.next();
      expect(r1.value![0]).assertEqual('sun');
      expect(r2.value![0]).assertEqual('moon');
      expect(r3.value![0]).assertEqual('star');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_2600
     * @tc.name mapForEachPart02Test026
     * @tc.desc Verify forEach toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20], ['z', 30]]);
      let tsBefore: string = m.toString();
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      let tsAfter: string = m.toString();
      expect(tsAfter).assertEqual(tsBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_2700
     * @tc.name mapForEachPart02Test027
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['L', 11], ['M', 22], ['N', 33]]);
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(m.has('L')).assertTrue();
      expect(m.has('M')).assertTrue();
      expect(m.has('N')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_2800
     * @tc.name mapForEachPart02Test028
     * @tc.desc Verify forEach values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['up', 1], ['down', -1]]);
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      let valIter: IterableIterator<int> = m.values();
      expect(valIter.next().value!).assertEqual(1);
      expect(valIter.next().value!).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_2900
     * @tc.name mapForEachPart02Test029
     * @tc.desc Verify forEach keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['before', 0], ['after', 1]]);
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      let keyIter: IterableIterator<string> = m.keys();
      expect(keyIter.next().value!).assertEqual('before');
      expect(keyIter.next().value!).assertEqual('after');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_3000
     * @tc.name mapForEachPart02Test030
     * @tc.desc Verify set key forEach entries key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('primary', 1);
      m.set('secondary', 2);
      m.set('tertiary', 3);
      m.set('secondary', 2222);
      m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      let eIter: IterableIterator<[string, int]> = m.entries();
      let f: IteratorResult<[string, int]> = eIter.next();
      let s: IteratorResult<[string, int]> = eIter.next();
      let t: IteratorResult<[string, int]> = eIter.next();
      expect(f.value![0]).assertEqual('primary');
      expect(s.value![0]).assertEqual('secondary');
      expect(t.value![0]).assertEqual('tertiary');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_3100
     * @tc.name mapForEachPart02Test031
     * @tc.desc Verify K=Date forEach get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(2019, 6, 1);
      let d2: Date = new Date(2020, 6, 1);
      const m: Map<Date, int> = new Map<Date, int>([[d1, 555], [d2, 666]]);
      m.forEach((value: int, key: Date, map: Map<Date, int>): void => {});
      expect(m.get(d1)).assertEqual(555);
      expect(m.get(d2)).assertEqual(666);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_3200
     * @tc.name mapForEachPart02Test032
     * @tc.desc Verify K=boolean forEach has get boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, string> = new Map<boolean, string>([[true, 'on'], [false, 'off']]);
      m.forEach((value: string, key: boolean, map: Map<boolean, string>): void => {});
      expect(m.has(true)).assertTrue();
      expect(m.has(false)).assertTrue();
      expect(m.get(true)).assertEqual('on');
      expect(m.get(false)).assertEqual('off');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_3300
     * @tc.name mapForEachPart02Test033
     * @tc.desc Verify forEach isSame true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['ref', 42]]);
      let isSame: boolean = false;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        if (map === m) { isSame = true; }
      });
      expect(isSame).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_3400
     * @tc.name mapForEachPart02Test034
     * @tc.desc Verify map size Map.size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['szA', 1], ['szB', 2], ['szC', 3]]);
      let fromCb: int = 0;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        fromCb = map.size;
      });
      expect(fromCb).assertEqual(m.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_3500
     * @tc.name mapForEachPart02Test035
     * @tc.desc Verify map.get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['cg1', 10], ['cg2', 20]]);
      let allConsistent: boolean = true;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        if (map.get(key) !== value) { allConsistent = false; }
      });
      expect(allConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_3600
     * @tc.name mapForEachPart02Test036
     * @tc.desc Verify map.has key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['hkA', 7], ['hkB', 8], ['hkC', 9]]);
      let everyKeyFound: boolean = true;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        if (!map.has(key)) { everyKeyFound = false; }
      });
      expect(everyKeyFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_3700
     * @tc.name mapForEachPart02Test037
     * @tc.desc Verify map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('head', 1);
      m.set('body', 2);
      m.set('tail', 3);
      let cbKeys: string[] = [];
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        cbKeys.push(key);
      });
      expect(cbKeys[0]).assertEqual('head');
      expect(cbKeys[1]).assertEqual('body');
      expect(cbKeys[2]).assertEqual('tail');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_3800
     * @tc.name mapForEachPart02Test038
     * @tc.desc Verify map toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['tsCb1', 1], ['tsCb2', 2]]);
      let captured: string = '';
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        captured = map.toString();
      });
      expect(captured).assertEqual(m.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_3900
     * @tc.name mapForEachPart02Test039
     * @tc.desc Verify map.set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['orig', 1]]);
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        map.set('inserted', 888);
      });
      expect(m.has('inserted')).assertTrue();
      expect(m.get('inserted')).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_4000
     * @tc.name mapForEachPart02Test040
     * @tc.desc Verify map.delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['victim', 1], ['survivor', 2], ['alsoSurvivor', 3]]);
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        if (key === 'survivor') { map.delete('victim'); }
      });
      expect(m.has('victim')).assertFalse();
      expect(m.has('survivor')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_4100
     * @tc.name mapForEachPart02Test041
     * @tc.desc Verify map.clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['wipe1', 1], ['wipe2', 2], ['wipe3', 3]]);
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        map.clear();
      });
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_4200
     * @tc.name mapForEachPart02Test042
     * @tc.desc Verify V=int value typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['vInt', 42]]);
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        expect(typeof value).assertEqual('int');
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_4300
     * @tc.name mapForEachPart02Test043
     * @tc.desc Verify V=string value typeof string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['vStr', 'text']]);
      m.forEach((value: string, key: string, map: Map<string, string>): void => {
        expect(typeof value).assertEqual('string');
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_4400
     * @tc.name mapForEachPart02Test044
     * @tc.desc Verify V=boolean value typeof boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>([['vBool', false]]);
      m.forEach((value: boolean, key: string, map: Map<string, boolean>): void => {
        expect(typeof value).assertEqual('boolean');
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_4500
     * @tc.name mapForEachPart02Test045
     * @tc.desc Verify V=long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, long> = new Map<string, long>([['vLong', 8888888888]]);
      let passed: long = Int.toLong(0);
      m.forEach((value: long, key: string, map: Map<string, long>): void => {
        passed = value;
      });
      expect(passed).assertEqual(8888888888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_4600
     * @tc.name mapForEachPart02Test046
     * @tc.desc Verify V=double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, double> = new Map<string, double>([['vDbl', 1.41421]]);
      let captured: double = 0.0;
      m.forEach((value: double, key: string, map: Map<string, double>): void => {
        captured = value;
      });
      expect(captured).assertEqual(1.41421);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_4700
     * @tc.name mapForEachPart02Test047
     * @tc.desc Verify V=byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, byte> = new Map<string, byte>([['vByte', 77 as byte]]);
      let captured: byte = 0 as byte;
      m.forEach((value: byte, key: string, map: Map<string, byte>): void => {
        captured = value;
      });
      expect(captured).assertEqual(77 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_4800
     * @tc.name mapForEachPart02Test048
     * @tc.desc Verify V=float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, float> = new Map<string, float>([['vFloat', 3.5 as float]]);
      let captured: float = 0.0 as float;
      m.forEach((value: float, key: string, map: Map<string, float>): void => {
        captured = value;
      });
      expect(captured).assertEqual(3.5 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_4900
     * @tc.name mapForEachPart02Test049
     * @tc.desc Verify K=long key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, string> = new Map<long, string>([[1234567890123, 'L']]);
      let passed: long = Int.toLong(0);
      m.forEach((value: string, key: long, map: Map<long, string>): void => {
        passed = key;
      });
      expect(passed).assertEqual(1234567890123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_5000
     * @tc.name mapForEachPart02Test050
     * @tc.desc Verify K=double key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>([[6.022e23, 'avogadro']]);
      let passed: double = 0.0;
      m.forEach((value: string, key: double, map: Map<double, string>): void => {
        passed = key;
      });
      expect(passed).assertEqual(6.022e23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_5100
     * @tc.name mapForEachPart02Test051
     * @tc.desc Verify K=char key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<char, string> = new Map<char, string>([[c'@', 'at']]);
      let passed: char = c'A';
      m.forEach((value: string, key: char, map: Map<char, string>): void => {
        passed = key;
      });
      expect(passed).assertEqual(c'@');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_5200
     * @tc.name mapForEachPart02Test052
     * @tc.desc Verify K=bigint key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<bigint, string> = new Map<bigint, string>([[7777777n, 'big']]);
      let passed: bigint = 0n;
      m.forEach((value: string, key: bigint, map: Map<bigint, string>): void => {
        passed = key;
      });
      expect(passed).assertEqual(7777777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_5300
     * @tc.name mapForEachPart02Test053
     * @tc.desc Verify K=float key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, int> = new Map<float, int>([[0.25 as float, 25]]);
      let passed: float = 0.0 as float;
      m.forEach((value: int, key: float, map: Map<float, int>): void => {
        passed = key;
      });
      expect(passed).assertEqual(0.25 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_5400
     * @tc.name mapForEachPart02Test054
     * @tc.desc Verify value get(key) K=string V=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['eq1', 11], ['eq2', 22], ['eq3', 33]]);
      let mismatchFound: boolean = false;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        if (value !== m.get(key)) { mismatchFound = true; }
      });
      expect(mismatchFound).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_5500
     * @tc.name mapForEachPart02Test055
     * @tc.desc Verify value get(key) K=int V=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>([[101, 'hundredOne'], [202, 'twoHundredTwo']]);
      let anyError: boolean = false;
      m.forEach((value: string, key: int, map: Map<int, string>): void => {
        if (value !== m.get(key)) { anyError = true; }
      });
      expect(anyError).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_5600
     * @tc.name mapForEachPart02Test056
     * @tc.desc Verify forEach == 'orderA'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('orderA', 100);
      m.set('orderB', 200);
      m.set('orderC', 300);
      m.set('orderD', 400);
      let captured: string[] = [];
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        captured.push(key);
      });
      expect(captured[0]).assertEqual('orderA');
      expect(captured[1]).assertEqual('orderB');
      expect(captured[2]).assertEqual('orderC');
      expect(captured[3]).assertEqual('orderD');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_5700
     * @tc.name mapForEachPart02Test057
     * @tc.desc Verify forEach false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['genuine', 1]]);
      let phantomDetected: boolean = false;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        if (key === 'phantom') { phantomDetected = true; }
      });
      expect(phantomDetected).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_5800
     * @tc.name mapForEachPart02Test058
     * @tc.desc Verify forEach == 'posA'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('posA', 1);
      m.set('posB', 2);
      m.set('posC', 3);
      m.set('posB', 22222);
      let positions: string[] = [];
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        positions.push(key);
      });
      expect(positions[0]).assertEqual('posA');
      expect(positions[1]).assertEqual('posB');
      expect(positions[2]).assertEqual('posC');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_5900
     * @tc.name mapForEachPart02Test059
     * @tc.desc Verify value set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('loc1', 1);
      m.set('loc2', 2);
      m.set('loc2', 222);
      let values: int[] = [];
      let keys: string[] = [];
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        keys.push(key);
        values.push(value);
      });
      expect(keys[0]).assertEqual('loc1');
      expect(values[0]).assertEqual(1);
      expect(keys[1]).assertEqual('loc2');
      expect(values[1]).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_6000
     * @tc.name mapForEachPart02Test060
     * @tc.desc Verify Map forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let triggered: boolean = false;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        triggered = true;
      });
      expect(triggered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_6100
     * @tc.name mapForEachPart02Test061
     * @tc.desc Verify clear Map forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 1], ['y', 2], ['z', 3]]);
      m.clear();
      let invoked: boolean = false;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        invoked = true;
      });
      expect(invoked).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_6200
     * @tc.name mapForEachPart02Test062
     * @tc.desc Verify delete Map forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['d1', 100], ['d2', 200]]);
      m.delete('d1');
      m.delete('d2');
      let executed: boolean = false;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        executed = true;
      });
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_6300
     * @tc.name mapForEachPart02Test063
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['nochain', 5]]);
      let retVal = m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(retVal).not().assertEqual(m);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_6400
     * @tc.name mapForEachPart02Test064
     * @tc.desc Verify forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['nc', 64]]);
      let result = m.forEach((value: int, key: string, map: Map<string, int>): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_6500
     * @tc.name mapForEachPart02Test065
     * @tc.desc Verify forEach Map.size K=string V=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['cnt1', 10], ['cnt2', 20], ['cnt3', 30]]);
      let callCount: int = 0;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        callCount++;
      });
      expect(callCount).assertEqual(m.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_6600
     * @tc.name mapForEachPart02Test066
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer: Map<string, int> = new Map<string, int>([['o1', 1], ['o2', 2]]);
      const inner: Map<string, int> = new Map<string, int>([['i1', 10], ['i2', 20], ['i3', 30]]);
      let outerKeys: string[] = [];
      let innerKeys: string[] = [];
      outer.forEach((ov: int, ok: string, om: Map<string, int>): void => {
        outerKeys.push(ok);
        inner.forEach((iv: int, ik: string, im: Map<string, int>): void => {
          innerKeys.push(ik);
        });
      });
      expect(outerKeys.length).assertEqual(2);
      expect(innerKeys.length).assertEqual(6);
      expect(outerKeys[0]).assertEqual('o1');
      expect(outerKeys[1]).assertEqual('o2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART02_6700
     * @tc.name mapForEachPart02Test067
     * @tc.desc Verify Map forEach key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['idemA', 100], ['idemB', 200], ['idemC', 300]]);
      let pass1: string[] = [];
      let pass2: string[] = [];
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        pass1.push(key);
      });
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        pass2.push(key);
      });
      expect(pass1.length).assertEqual(pass2.length);
      expect(pass1[0]).assertEqual(pass2[0]);
      expect(pass1[1]).assertEqual(pass2[1]);
      expect(pass1[2]).assertEqual(pass2[2]);
    });

  });
}
