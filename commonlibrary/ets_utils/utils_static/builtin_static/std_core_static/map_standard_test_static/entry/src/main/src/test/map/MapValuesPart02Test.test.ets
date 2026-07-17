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

class Person {
  name: string = '';
  age: int = 0;
}

export default function mapValuesPart02TestTest(): void {
  describe('MapValuesPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_0100
     * @tc.name mapValuesPart02Test001
     * @tc.desc Verify typeof values() "object" string key, int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k1', 100);
      let iter = m.values();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_0200
     * @tc.name mapValuesPart02Test002
     * @tc.desc Verify values() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('x', 1);
      let iter = m.values();
      let result = iter.next();
      expect(result.value!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_0300
     * @tc.name mapValuesPart02Test003
     * @tc.desc Verify values() undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 10);
      let iter = m.values();
      let result = iter.next();
      expect(result.value!).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_0400
     * @tc.name mapValuesPart02Test004
     * @tc.desc Verify typeof iter.next "function"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('key', 5);
      let iter = m.values();
      expect(typeof iter.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_0500
     * @tc.name mapValuesPart02Test005
     * @tc.desc Verify iter.next null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      let iter = m.values();
      expect(iter.next).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_0600
     * @tc.name mapValuesPart02Test006
     * @tc.desc Verify iter.next() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('name', 'test');
      let iter = m.values();
      let result = iter.next();
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_0700
     * @tc.name mapValuesPart02Test007
     * @tc.desc Verify typeof iter.next().done "boolean"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('one', 1);
      let iter = m.values();
      let result = iter.next();
      expect(typeof result.done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_0800
     * @tc.name mapValuesPart02Test008
     * @tc.desc Verify typeof iter.next().value! "number" int V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('count', 7);
      let iter = m.values();
      let result = iter.next();
      expect(typeof result.value!).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_0900
     * @tc.name mapValuesPart02Test009
     * @tc.desc Verify typeof iter.next().value! "string" string V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('msg', 'hello');
      let iter = m.values();
      let result = iter.next();
      expect(typeof result.value!).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_1000
     * @tc.name mapValuesPart02Test010
     * @tc.desc Verify typeof iter.next().value! 'long' V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, long> = new Map<string, long>();
      m.set('big', 9999999999999);
      let iter = m.values();
      let result = iter.next();
      expect(typeof result.value!).assertEqual('long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_1100
     * @tc.name mapValuesPart02Test011
     * @tc.desc Verify Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter = m.values();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_1200
     * @tc.name mapValuesPart02Test012
     * @tc.desc Verify Map next() done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 10);
      let iter = m.values();
      let result = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_1300
     * @tc.name mapValuesPart02Test013
     * @tc.desc Verify Map done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('k', 'v');
      let iter = m.values();
      iter.next();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_1400
     * @tc.name mapValuesPart02Test014
     * @tc.desc Verify Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('x', 1);
      m.set('y', 2);
      let iter = m.values();
      iter.next();
      iter.next();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_1500
     * @tc.name mapValuesPart02Test015
     * @tc.desc Verify next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      let iter = m.values();
      iter.next();
      iter.next();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_1600
     * @tc.name mapValuesPart02Test016
     * @tc.desc Verify Map next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>();
      let iter = m.values();
      let d: boolean = iter.next().done;
      expect(d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_1700
     * @tc.name mapValuesPart02Test017
     * @tc.desc Verify Map next() value undefined int V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('val', 42);
      let iter = m.values();
      let result = iter.next();
      let v = result.value!;
      expect(v).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_1800
     * @tc.name mapValuesPart02Test018
     * @tc.desc Verify Map next() value undefined string V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('key', 'text');
      let iter = m.values();
      let result = iter.next();
      let v = result.value!;
      expect(v).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_1900
     * @tc.name mapValuesPart02Test019
     * @tc.desc Verify single entry string V: value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('key1', 'alpha');
      let iter = m.values();
      let result = iter.next();
      expect(result.value!).assertEqual('alpha');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_2000
     * @tc.name mapValuesPart02Test020
     * @tc.desc Verify single entry int V: value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k', 99);
      let iter = m.values();
      let result = iter.next();
      expect(result.value!).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_2100
     * @tc.name mapValuesPart02Test021
     * @tc.desc Verify single entry int V value = 0: 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('zero', 0);
      let iter = m.values();
      let result = iter.next();
      expect(result.value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_2200
     * @tc.name mapValuesPart02Test022
     * @tc.desc Verify single entry int V value = -1: -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('neg', -1);
      let iter = m.values();
      let result = iter.next();
      expect(result.value!).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_2300
     * @tc.name mapValuesPart02Test023
     * @tc.desc Verify single entry number V (float):
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('pi', 3.14159);
      let iter = m.values();
      let result = iter.next();
      expect(result.value!).assertEqual(3.14159);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_2400
     * @tc.name mapValuesPart02Test024
     * @tc.desc Verify single entry boolean V (true): true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>();
      m.set('flag', true);
      let iter = m.values();
      let result = iter.next();
      expect(result.value!).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_2500
     * @tc.name mapValuesPart02Test025
     * @tc.desc Verify single entry boolean V (false): false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>();
      m.set('off', false);
      let iter = m.values();
      let result = iter.next();
      expect(result.value!).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_2600
     * @tc.name mapValuesPart02Test026
     * @tc.desc Verify single entry long V: bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, long> = new Map<string, long>();
      m.set('large', 9999999999999);
      let iter = m.values();
      let result = iter.next();
      expect(result.value!).assertEqual(9999999999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_2700
     * @tc.name mapValuesPart02Test027
     * @tc.desc Verify single entry double V:
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, double> = new Map<string, double>();
      m.set('d', 2.718281828);
      let iter = m.values();
      let result = iter.next();
      expect(result.value!).assertEqual(2.718281828);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_2800
     * @tc.name mapValuesPart02Test028
     * @tc.desc Verify single entry value: ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('empty', '');
      let iter = m.values();
      let result = iter.next();
      expect(result.value!).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_2900
     * @tc.name mapValuesPart02Test029
     * @tc.desc Verify int value : value int float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('x', 42);
      let iter = m.values();
      let result = iter.next();
      expect(result.value!).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_3000
     * @tc.name mapValuesPart02Test030
     * @tc.desc Verify Map next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('first', 100);
      m.set('second', 200);
      let iter = m.values();
      expect(iter.next().value!).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_3100
     * @tc.name mapValuesPart02Test031
     * @tc.desc Verify Map next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 10);
      m.set('b', 20);
      let iter = m.values();
      iter.next();
      expect(iter.next().value!).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_3200
     * @tc.name mapValuesPart02Test032
     * @tc.desc Verify Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('k1', 'v1');
      m.set('k2', 'v2');
      m.set('k3', 'v3');
      let iter = m.values();
      expect(iter.next().value!).assertEqual('v1');
      expect(iter.next().value!).assertEqual('v2');
      expect(iter.next().value!).assertEqual('v3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_3300
     * @tc.name mapValuesPart02Test033
     * @tc.desc Verify Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('A', 5);
      m.set('B', 15);
      m.set('C', 25);
      let iter = m.values();
      iter.next();
      expect(iter.next().value!).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_3400
     * @tc.name mapValuesPart02Test034
     * @tc.desc Verify key value: value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('kA', 77);
      m.set('kB', 77);
      let iter = m.values();
      expect(iter.next().value!).assertEqual(77);
      expect(iter.next().value!).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_3500
     * @tc.name mapValuesPart02Test035
     * @tc.desc Verify set key: value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('key', 'old');
      m.set('key', 'new');
      let iter = m.values();
      expect(iter.next().value!).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_3600
     * @tc.name mapValuesPart02Test036
     * @tc.desc Verify set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k', 1);
      m.set('k', 2);
      let iter = m.values();
      iter.next();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_3700
     * @tc.name mapValuesPart02Test037
     * @tc.desc Verify delete value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('keep', 10);
      m.set('remove', 20);
      m.delete('remove');
      let iter = m.values();
      expect(iter.next().value!).assertEqual(10);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_3800
     * @tc.name mapValuesPart02Test038
     * @tc.desc Verify key values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('z', 9);
      m.set('a', 1);
      m.set('m', 5);
      let iter = m.values();
      expect(iter.next().value!).assertEqual(9);
      expect(iter.next().value!).assertEqual(1);
      expect(iter.next().value!).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_3900
     * @tc.name mapValuesPart02Test039
     * @tc.desc Verify set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('a', 10);
      let iter = m.values();
      expect(iter.next().value!).assertEqual(10);
      expect(iter.next().value!).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_4000
     * @tc.name mapValuesPart02Test040
     * @tc.desc Verify values() ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('x', 1);
      let iter1 = m.values();
      let iter2 = m.values();
      expect(iter1).not().assertEqual(iter2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_4100
     * @tc.name mapValuesPart02Test041
     * @tc.desc Verify values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 100);
      m.set('b', 200);
      let iterA = m.values();
      let iterB = m.values();
      expect(iterA.next().value!).assertEqual(100);
      expect(iterB.next().value!).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_4200
     * @tc.name mapValuesPart02Test042
     * @tc.desc Verify iterator iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('p', 1);
      m.set('q', 2);
      m.set('r', 3);
      let first = m.values();
      first.next();
      first.next();
      let second = m.values();
      expect(second.next().value!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_4300
     * @tc.name mapValuesPart02Test043
     * @tc.desc Verify iterator iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('k', 'val');
      let iter1 = m.values();
      let iter2 = m.values();
      iter1.next();
      iter1.next();
      expect(iter2.next().value!).assertEqual('val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_4400
     * @tc.name mapValuesPart02Test044
     * @tc.desc Verify values() iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('key', 42);
      let a = m.values();
      let b = m.values();
      let c = m.values();
      expect(a).not().assertEqual(b);
      expect(b).not().assertEqual(c);
      expect(a).not().assertEqual(c);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_4500
     * @tc.name mapValuesPart02Test045
     * @tc.desc Verify iterator Map done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      let iter = m.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_4600
     * @tc.name mapValuesPart02Test046
     * @tc.desc Verify Map values() iterator null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let i1 = m.values();
      let i2 = m.values();
      expect(m.size).assertEqual(0);
      expect(i1.next().done).assertTrue();
      expect(m.size).assertEqual(0);
      expect(i2.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_4700
     * @tc.name mapValuesPart02Test047
     * @tc.desc Verify values() Map.size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      let iter = m.values();
      let count: int = 0;
      while (iter.next().done === false) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_4800
     * @tc.name mapValuesPart02Test048
     * @tc.desc Verify values() Map.get()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('test', 99);
      let iter = m.values();
      expect(m.get('test')).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_4900
     * @tc.name mapValuesPart02Test049
     * @tc.desc Verify iterator Map.size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('x', 10);
      m.set('y', 20);
      let iter = m.values();
      iter.next();
      iter.next();
      iter.next();
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_5000
     * @tc.name mapValuesPart02Test050
     * @tc.desc Verify iterator Map.has()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('k', 'v');
      let iter = m.values();
      iter.next();
      iter.next();
      expect(m.has('k')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_5100
     * @tc.name mapValuesPart02Test051
     * @tc.desc Verify iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      let iter = m.values();
      iter.next();
      m.set('b', 2);
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_5200
     * @tc.name mapValuesPart02Test052
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('key', 999);
      m.values();
      m.values();
      m.values();
      expect(m.get('key')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_5300
     * @tc.name mapValuesPart02Test053
     * @tc.desc Verify for...of Map 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let count: int = 0;
      for (let v of m.values()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_5400
     * @tc.name mapValuesPart02Test054
     * @tc.desc Verify for...of Map 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('only', 42);
      let count: int = 0;
      for (let v of m.values()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_5500
     * @tc.name mapValuesPart02Test055
     * @tc.desc Verify for...of Map 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 10);
      m.set('b', 20);
      let count: int = 0;
      for (let v of m.values()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_5600
     * @tc.name mapValuesPart02Test056
     * @tc.desc Verify for...of Map 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k0', 0);
      m.set('k1', 1);
      m.set('k2', 2);
      m.set('k3', 3);
      m.set('k4', 4);
      let count: int = 0;
      for (let v of m.values()) {
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_5700
     * @tc.name mapValuesPart02Test057
     * @tc.desc Verify for...of values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('z', 'last');
      m.set('a', 'first');
      m.set('m', 'mid');
      let result: string[] = [];
      for (let v of m.values()) {
        result.push(v);
      }
      expect(result[0]).assertEqual('last');
      expect(result[1]).assertEqual('first');
      expect(result[2]).assertEqual('mid');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_5800
     * @tc.name mapValuesPart02Test058
     * @tc.desc Verify for...of int V: value int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('n', 77);
      let allInt: boolean = true;
      for (let v of m.values()) {
        if (typeof v !== 'int') {
          allInt = false;
        }
      }
      expect(allInt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_5900
     * @tc.name mapValuesPart02Test059
     * @tc.desc Verify for...of string V: value string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('s', 'text');
      let allString: boolean = true;
      for (let v of m.values()) {
        if (typeof v !== 'string') {
          allString = false;
        }
      }
      expect(allString).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_6000
     * @tc.name mapValuesPart02Test060
     * @tc.desc Verify for...of boolean V: value boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>();
      m.set('b1', true);
      m.set('b2', false);
      let allBool: boolean = true;
      for (let v of m.values()) {
        if (typeof v !== 'boolean') {
          allBool = false;
        }
      }
      expect(allBool).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_6100
     * @tc.name mapValuesPart02Test061
     * @tc.desc Verify Map next() done === true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter = m.values();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_6200
     * @tc.name mapValuesPart02Test062
     * @tc.desc Verify Map next() done === true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('k', 'v');
      let iter = m.values();
      iter.next();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_6300
     * @tc.name mapValuesPart02Test063
     * @tc.desc Verify values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('x', 5);
      let iter = m.values();
      iter.next();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_6400
     * @tc.name mapValuesPart02Test064
     * @tc.desc Verify clear values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.clear();
      let iter = m.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_6500
     * @tc.name mapValuesPart02Test065
     * @tc.desc Verify delete values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('only', 100);
      m.delete('only');
      let iter = m.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_6600
     * @tc.name mapValuesPart02Test066
     * @tc.desc Verify Map for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let executed: boolean = false;
      for (let v of m.values()) {
        executed = true;
      }
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_6700
     * @tc.name mapValuesPart02Test067
     * @tc.desc Verify int MAX (2147483647) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('max', 2147483647);
      let iter = m.values();
      expect(iter.next().value!).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_6800
     * @tc.name mapValuesPart02Test068
     * @tc.desc Verify int MIN (-2147483648) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('min', -2147483648);
      let iter = m.values();
      expect(iter.next().value!).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_6900
     * @tc.name mapValuesPart02Test069
     * @tc.desc Verify number NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('nan', Number.NaN);
      let iter = m.values();
      let v: number = iter.next().value!;
      expect(isNaN(v)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_7000
     * @tc.name mapValuesPart02Test070
     * @tc.desc Verify number POSITIVE_INFINITY value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('inf', Number.POSITIVE_INFINITY);
      let iter = m.values();
      expect(iter.next().value!).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_7100
     * @tc.name mapValuesPart02Test071
     * @tc.desc Verify number NEGATIVE_INFINITY value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('ninf', Number.NEGATIVE_INFINITY);
      let iter = m.values();
      expect(iter.next().value!).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_7200
     * @tc.name mapValuesPart02Test072
     * @tc.desc Verify long MAX value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, long> = new Map<string, long>();
      m.set('lmax', 9223372036854775807);
      let iter = m.values();
      expect(iter.next().value!).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_7300
     * @tc.name mapValuesPart02Test073
     * @tc.desc Verify long MIN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, long> = new Map<string, long>();
      m.set('lmin', (-9223372036854775807 - 1));
      let iter = m.values();
      expect(iter.next().value!).assertEqual((-9223372036854775807 - 1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_7400
     * @tc.name mapValuesPart02Test074
     * @tc.desc Verify "" value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(1, '');
      let iter = m.values();
      expect(iter.next().value!).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_7500
     * @tc.name mapValuesPart02Test075
     * @tc.desc Verify Unicode emoji value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('emoji', '😀');
      let iter = m.values();
      expect(iter.next().value!).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_7600
     * @tc.name mapValuesPart02Test076
     * @tc.desc Verify 100 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = 'abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789ab';
      const m: Map<string, string> = new Map<string, string>();
      m.set('long', longStr);
      let iter = m.values();
      expect(iter.next().value!).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_7700
     * @tc.name mapValuesPart02Test077
     * @tc.desc Verify values K=string V=string iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('zw', '​');
      let iter = m.values();
      expect(iter.next().value!).assertEqual('​');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_7800
     * @tc.name mapValuesPart02Test078
     * @tc.desc Verify V=Date: value Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Date> = new Map<string, Date>();
      let d: Date = new Date(2025, 0, 15);
      m.set('date', d);
      let iter = m.values();
      expect(iter.next().value!.getTime()).assertEqual(d.getTime());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_7900
     * @tc.name mapValuesPart02Test079
     * @tc.desc Verify V=RegExp: value RegExp pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, RegExp> = new Map<string, RegExp>();
      let r: RegExp = new RegExp('abc', 'g');
      m.set('re', r);
      let iter = m.values();
      expect(iter.next().value!.source).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_8000
     * @tc.name mapValuesPart02Test080
     * @tc.desc Verify V=class : class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Person> = new Map<string, Person>();
      let p: Person = new Person();
      p.name = 'Alice';
      p.age = 30;
      m.set('person', p);
      let iter = m.values();
      expect(iter.next().value!.name).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_8100
     * @tc.name mapValuesPart02Test081
     * @tc.desc Verify V=Array: value >]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int[]> = new Map<string, int[]>();
      let arr: int[] = [1, 2, 3];
      m.set('arr', arr);
      let iter = m.values();
      let result: int[] = iter.next().value!;
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_8200
     * @tc.name mapValuesPart02Test082
     * @tc.desc Verify Date values:
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(2025, 5, 10, 12, 0, 0, 0);
      let d2: Date = new Date(2025, 5, 10, 12, 0, 0, 0);
      const m: Map<string, Date> = new Map<string, Date>();
      m.set('d1', d1);
      m.set('d2', d2);
      let iter = m.values();
      expect(iter.next().value!.getTime()).assertEqual(d1.getTime());
      expect(iter.next().value!.getTime()).assertEqual(d2.getTime());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_8300
     * @tc.name mapValuesPart02Test083
     * @tc.desc Verify V=Map Map :
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Map<string, int> = new Map<string, int>();
      inner.set('x', 10);
      const outer: Map<string, Map<string, int>> = new Map<string, Map<string, int>>();
      outer.set('nested', inner);
      let iter = outer.values();
      const retrieved: Map<string, int> = iter.next().value!;
      expect(retrieved.get('x')).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_8400
     * @tc.name mapValuesPart02Test084
     * @tc.desc Verify entries values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, int][] = [['a', 1], ['b', 2]];
      const m: Map<string, int> = new Map<string, int>(entries);
      let iter = m.values();
      expect(iter.next().value!).assertEqual(1);
      expect(iter.next().value!).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_8500
     * @tc.name mapValuesPart02Test085
     * @tc.desc Verify entries values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, int][] = [];
      const m: Map<string, int> = new Map<string, int>(entries);
      let iter = m.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_8600
     * @tc.name mapValuesPart02Test086
     * @tc.desc Verify entries key values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, int][] = [['dup', 1], ['dup', 2]];
      const m: Map<string, int> = new Map<string, int>(entries);
      let iter = m.values();
      expect(iter.next().value!).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_8700
     * @tc.name mapValuesPart02Test087
     * @tc.desc Verify entries=null values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>(null);
      let iter = m.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_8800
     * @tc.name mapValuesPart02Test088
     * @tc.desc Verify ReadonlyMap values() Map values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('r', 100);
      const rm: ReadonlyMap<string, int> = m as ReadonlyMap<string, int>;
      let iter = rm.values();
      expect(iter.next().value!).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_8900
     * @tc.name mapValuesPart02Test089
     * @tc.desc Verify size=1 values() 1 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('single', 50);
      let iter = m.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART02_9000
     * @tc.name mapValuesPart02Test090
     * @tc.desc Verify size=3 values() 3 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart02Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      let iter = m.values();
      let count: int = 0;
      while (!iter.next().done) {
        count++;
      }
      expect(count).assertEqual(3);
    });

  });
}
