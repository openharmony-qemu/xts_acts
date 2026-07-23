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

class StaticHelper {
  static callCount: int = 0;
  static onEntry(value: int, key: string, _map: ReadonlyMap<string, int>): void {
    StaticHelper.callCount++;
  }
}
class InstanceCollector {
  keys: string[] = [];
  collect(value: int, key: string, _map: ReadonlyMap<string, int>): void {
    this.keys.push(key);
  }
}
class EntryValue {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function readonlyMapForEachPart01TestTest(): void {
  describe('ReadonlyMapForEachPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_0100
     * @tc.name readonlyMapForEachPart01Test001
     * @tc.desc Verify forEach 1 callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        callCount++;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_0200
     * @tc.name readonlyMapForEachPart01Test002
     * @tc.desc Verify callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_0300
     * @tc.name readonlyMapForEachPart01Test003
     * @tc.desc Verify callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let namedCount: int = 0;
      const namedCallback = (value: int, key: string, _map: ReadonlyMap<string, int>): void => {
        namedCount++;
      };
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      map.forEach(namedCallback);
      expect(namedCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_0400
     * @tc.name readonlyMapForEachPart01Test004
     * @tc.desc Verify callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      StaticHelper.callCount = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      map.forEach(StaticHelper.onEntry);
      expect(StaticHelper.callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_0500
     * @tc.name readonlyMapForEachPart01Test005
     * @tc.desc Verify callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collector: InstanceCollector = new InstanceCollector();
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      map.forEach((value: int, key: string, m: ReadonlyMap<string, int>) => {
        collector.collect(value, key, m);
      });
      expect(collector.keys[0]).assertEqual('x');
      expect(collector.keys[1]).assertEqual('y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_0600
     * @tc.name readonlyMapForEachPart01Test006
     * @tc.desc Verify Map forEach callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        callCount++;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_0700
     * @tc.name readonlyMapForEachPart01Test007
     * @tc.desc Verify Map forEach callbackfn 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['only', 42]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        callCount++;
      });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_0800
     * @tc.name readonlyMapForEachPart01Test008
     * @tc.desc Verify forEach key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let keyOrder: string[] = [];
      const map: ReadonlyMap<string, int> = new Map<string, int>([['z', 3], ['a', 1], ['m', 2]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        keyOrder.push(key);
      });
      expect(keyOrder[0]).assertEqual('z');
      expect(keyOrder[1]).assertEqual('a');
      expect(keyOrder[2]).assertEqual('m');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_0900
     * @tc.name readonlyMapForEachPart01Test009
     * @tc.desc Verify set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let keyOrder: string[] = [];
      let valOrder: int[] = [];
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['a', 99]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        keyOrder.push(key);
        valOrder.push(value);
      });
      expect(keyOrder[0]).assertEqual('a');
      expect(keyOrder[1]).assertEqual('b');
      expect(valOrder[0]).assertEqual(99);
      expect(valOrder[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_1000
     * @tc.name readonlyMapForEachPart01Test010
     * @tc.desc Verify forEach == 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedValue: int = -1;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 100]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        capturedValue = value;
      });
      expect(capturedValue).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_1100
     * @tc.name readonlyMapForEachPart01Test011
     * @tc.desc Verify forEach == 'targetKey'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedKey: string = '';
      const map: ReadonlyMap<string, int> = new Map<string, int>([['targetKey', 42]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        capturedKey = key;
      });
      expect(capturedKey).assertEqual('targetKey');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_1200
     * @tc.name readonlyMapForEachPart01Test012
     * @tc.desc Verify ReadonlyMap get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matchCount: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      map.forEach((value: int, key: string, m: ReadonlyMap<string, int>) => {
        if (m.get(key) === value) {
          matchCount++;
        }
      });
      expect(matchCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_1300
     * @tc.name readonlyMapForEachPart01Test013
     * @tc.desc Verify forEach value put
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: int[] = [];
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 123], ['b', 456]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        vals.push(value);
      });
      expect(vals[0]).assertEqual(123);
      expect(vals[1]).assertEqual(456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_1400
     * @tc.name readonlyMapForEachPart01Test014
     * @tc.desc Verify forEach key put
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let keys: string[] = [];
      const map: ReadonlyMap<string, int> = new Map<string, int>([['keyA', 10], ['keyB', 20]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('keyA');
      expect(keys[1]).assertEqual('keyB');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_1500
     * @tc.name readonlyMapForEachPart01Test015
     * @tc.desc Verify ReadonlyMap size Map.size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizeInCallback: int = -1;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      map.forEach((value: int, key: string, m: ReadonlyMap<string, int>) => {
        sizeInCallback = m.size;
      });
      expect(sizeInCallback).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_1600
     * @tc.name readonlyMapForEachPart01Test016
     * @tc.desc Verify ReadonlyMap has key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allKeysFound: boolean = true;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      map.forEach((value: int, key: string, m: ReadonlyMap<string, int>) => {
        if (!m.has(key)) {
          allKeysFound = false;
        }
      });
      expect(allKeysFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_1700
     * @tc.name readonlyMapForEachPart01Test017
     * @tc.desc Verify Map<int,int> forEach key int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let keys: int[] = [];
      const map: ReadonlyMap<int, int> = new Map<int, int>([[10, 100], [20, 200]]);
      map.forEach((value: int, key: int, _map: ReadonlyMap<int, int>) => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual(10);
      expect(keys[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_1800
     * @tc.name readonlyMapForEachPart01Test018
     * @tc.desc Verify Map<number,int> forEach key number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let keys: number[] = [];
      const map: ReadonlyMap<number, int> = new Map<number, int>([[1.5, 10], [2.75, 20]]);
      map.forEach((value: int, key: number, _map: ReadonlyMap<number, int>) => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual(1.5);
      expect(keys[1]).assertEqual(2.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_1900
     * @tc.name readonlyMapForEachPart01Test019
     * @tc.desc Verify Map<boolean,int> forEach key boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      const map: ReadonlyMap<boolean, int> = new Map<boolean, int>([[true, 10], [false, 20]]);
      map.forEach((value: int, key: boolean, _map: ReadonlyMap<boolean, int>) => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_2000
     * @tc.name readonlyMapForEachPart01Test020
     * @tc.desc Verify Map<long,int> forEach key long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let keys: long[] = [];
      const map: ReadonlyMap<long, int> = new Map<long, int>([[Int.toLong(100), 10], [Int.toLong(200), 20]]);
      map.forEach((value: int, key: long, _map: ReadonlyMap<long, int>) => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual(Int.toLong(100));
      expect(keys[1]).assertEqual(Int.toLong(200));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_2100
     * @tc.name readonlyMapForEachPart01Test021
     * @tc.desc Verify Map<double,int> forEach key double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let keys: double[] = [];
      const map: ReadonlyMap<double, int> = new Map<double, int>([[3.14, 10], [2.718, 20]]);
      map.forEach((value: int, key: double, _map: ReadonlyMap<double, int>) => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual(3.14);
      expect(keys[1]).assertEqual(2.718);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_2200
     * @tc.name readonlyMapForEachPart01Test022
     * @tc.desc Verify Map<byte,int> forEach key byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      const map: ReadonlyMap<byte, int> = new Map<byte, int>([[0x0a as byte, 10], [0x14 as byte, 20]]);
      map.forEach((value: int, key: byte, _map: ReadonlyMap<byte, int>) => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_2300
     * @tc.name readonlyMapForEachPart01Test023
     * @tc.desc Verify Map<short,int> forEach key short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      const map: ReadonlyMap<short, int> = new Map<short, int>([[100 as short, 10], [200 as short, 20]]);
      map.forEach((value: int, key: short, _map: ReadonlyMap<short, int>) => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_2400
     * @tc.name readonlyMapForEachPart01Test024
     * @tc.desc Verify Map<float,int> forEach key float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      const map: ReadonlyMap<float, int> = new Map<float, int>([[1.5 as float, 10], [2.5 as float, 20]]);
      map.forEach((value: int, key: float, _map: ReadonlyMap<float, int>) => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_2500
     * @tc.name readonlyMapForEachPart01Test025
     * @tc.desc Verify Map<char,int> forEach key char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      const map: ReadonlyMap<char, int> = new Map<char, int>([[c'a', 10], [c'b', 20]]);
      map.forEach((value: int, key: char, _map: ReadonlyMap<char, int>) => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_2600
     * @tc.name readonlyMapForEachPart01Test026
     * @tc.desc Verify Map<bigint,int> forEach key bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: int = 0;
      const map: ReadonlyMap<bigint, int> = new Map<bigint, int>([[100n, 10], [200n, 20]]);
      map.forEach((value: int, key: bigint, _map: ReadonlyMap<bigint, int>) => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_2700
     * @tc.name readonlyMapForEachPart01Test027
     * @tc.desc Verify Map<string,number> forEach value number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: number[] = [];
      const map: ReadonlyMap<string, number> = new Map<string, number>([['a', 1.5], ['b', 3.75]]);
      map.forEach((value: number, key: string, _map: ReadonlyMap<string, number>) => {
        vals.push(value);
      });
      expect(vals[0]).assertEqual(1.5);
      expect(vals[1]).assertEqual(3.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_2800
     * @tc.name readonlyMapForEachPart01Test028
     * @tc.desc Verify Map<string,boolean> forEach value boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: boolean[] = [];
      const map: ReadonlyMap<string, boolean> = new Map<string, boolean>([['a', true], ['b', false]]);
      map.forEach((value: boolean, key: string, _map: ReadonlyMap<string, boolean>) => {
        vals.push(value);
      });
      expect(vals[0]).assertTrue();
      expect(vals[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_2900
     * @tc.name readonlyMapForEachPart01Test029
     * @tc.desc Verify Map<string, bigint> forEach value long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: bigint[] = [];
      const map: ReadonlyMap<string, bigint> = new Map<string, bigint>([['a', 10n], ['b', 20n]]);
      map.forEach((value: bigint, key: string, _map: ReadonlyMap<string, bigint>) => {
        vals.push(value);
      });
      expect(vals[0]).assertEqual(10n);
      expect(vals[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_3000
     * @tc.name readonlyMapForEachPart01Test030
     * @tc.desc Verify Map<string,double> forEach value double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [];
      const map: ReadonlyMap<string, double> = new Map<string, double>([['a', 3.14], ['b', 2.718]]);
      map.forEach((value: double, key: string, _map: ReadonlyMap<string, double>) => {
        vals.push(value);
      });
      expect(vals[0]).assertEqual(3.14);
      expect(vals[1]).assertEqual(2.718);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_3100
     * @tc.name readonlyMapForEachPart01Test031
     * @tc.desc Verify Map<string,byte> forEach value byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: byte[] = [];
      const map: ReadonlyMap<string, byte> = new Map<string, byte>([['a', 0x0a as byte], ['b', 0x14 as byte]]);
      map.forEach((value: byte, key: string, _map: ReadonlyMap<string, byte>) => {
        vals.push(value);
      });
      expect(vals[0]).assertEqual(0x0a as byte);
      expect(vals[1]).assertEqual(0x14 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_3200
     * @tc.name readonlyMapForEachPart01Test032
     * @tc.desc Verify Map<string,short> forEach value short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: short[] = [];
      const map: ReadonlyMap<string, short> = new Map<string, short>([['a', 100 as short], ['b', 200 as short]]);
      map.forEach((value: short, key: string, _map: ReadonlyMap<string, short>) => {
        vals.push(value);
      });
      expect(vals[0]).assertEqual(100 as short);
      expect(vals[1]).assertEqual(200 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_3300
     * @tc.name readonlyMapForEachPart01Test033
     * @tc.desc Verify Map<string,float> forEach value float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: float[] = [];
      const map: ReadonlyMap<string, float> = new Map<string, float>([['a', 1.5 as float], ['b', 2.5 as float]]);
      map.forEach((value: float, key: string, _map: ReadonlyMap<string, float>) => {
        vals.push(value);
      });
      expect(vals[0]).assertEqual(1.5 as float);
      expect(vals[1]).assertEqual(2.5 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_3400
     * @tc.name readonlyMapForEachPart01Test034
     * @tc.desc Verify Map<string,char> forEach value char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: char[] = [];
      const map: ReadonlyMap<string, char> = new Map<string, char>([['a', c'x'], ['b', c'y']]);
      map.forEach((value: char, key: string, _map: ReadonlyMap<string, char>) => {
        vals.push(value);
      });
      expect(vals[0]).assertEqual(c'x');
      expect(vals[1]).assertEqual(c'y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_3500
     * @tc.name readonlyMapForEachPart01Test035
     * @tc.desc Verify Map<string,long> forEach value long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: long[] = [];
      const map: ReadonlyMap<string, long> = new Map<string, long>([['a', Int.toLong(100)], ['b', Int.toLong(200)]]);
      map.forEach((value: long, key: string, _map: ReadonlyMap<string, long>) => {
        vals.push(value);
      });
      expect(vals[0]).assertEqual(Int.toLong(100));
      expect(vals[1]).assertEqual(Int.toLong(200));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_3600
     * @tc.name readonlyMapForEachPart01Test036
     * @tc.desc Verify Map<int,string> forEach key int value string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: string[] = [];
      const map: ReadonlyMap<int, string> = new Map<int, string>([[1, 'one'], [2, 'two']]);
      map.forEach((value: string, key: int, _map: ReadonlyMap<int, string>) => {
        vals.push(value);
      });
      expect(vals[0]).assertEqual('one');
      expect(vals[1]).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_3700
     * @tc.name readonlyMapForEachPart01Test037
     * @tc.desc Verify Map<Date,int> forEach key Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1000);
      let d2: Date = new Date(2000);
      let callCount: int = 0;
      const map: ReadonlyMap<Date, int> = new Map<Date, int>([[d1, 10], [d2, 20]]);
      map.forEach((value: int, key: Date, _map: ReadonlyMap<Date, int>) => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_3800
     * @tc.name readonlyMapForEachPart01Test038
     * @tc.desc Verify Map<RegExp,int> forEach key RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: RegExp = new RegExp('abc', 'g');
      let r2: RegExp = new RegExp('def', 'i');
      let callCount: int = 0;
      const map: ReadonlyMap<RegExp, int> = new Map<RegExp, int>([[r1, 10], [r2, 20]]);
      map.forEach((value: int, key: RegExp, _map: ReadonlyMap<RegExp, int>) => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_3900
     * @tc.name readonlyMapForEachPart01Test039
     * @tc.desc Verify Map<string,Date> forEach value Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1000);
      let d2: Date = new Date(2000);
      let vals: Date[] = [];
      const map: ReadonlyMap<string, Date> = new Map<string, Date>([['a', d1], ['b', d2]]);
      map.forEach((value: Date, key: string, _map: ReadonlyMap<string, Date>) => {
        vals.push(value);
      });
      expect(vals[0].getTime()).assertEqual(1000);
      expect(vals[1].getTime()).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_4000
     * @tc.name readonlyMapForEachPart01Test040
     * @tc.desc Verify Map<string,RegExp> forEach value RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: RegExp = new RegExp('abc', 'g');
      let r2: RegExp = new RegExp('def', 'i');
      let callCount: int = 0;
      const map: ReadonlyMap<string, RegExp> = new Map<string, RegExp>([['a', r1], ['b', r2]]);
      map.forEach((value: RegExp, key: string, _map: ReadonlyMap<string, RegExp>) => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_4100
     * @tc.name readonlyMapForEachPart01Test041
     * @tc.desc Verify Map<string, > forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstValue: EntryValue = new EntryValue(10);
      let secondValue: EntryValue = new EntryValue(20);
      let vals: EntryValue[] = [];
      const map: ReadonlyMap<string, EntryValue> = new Map<string, EntryValue>([['a', firstValue], ['b', secondValue]]);
      map.forEach((value: EntryValue, key: string, _map: ReadonlyMap<string, EntryValue>) => {
        vals.push(value);
      });
      expect(vals[0].id).assertEqual(10);
      expect(vals[1].id).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_4200
     * @tc.name readonlyMapForEachPart01Test042
     * @tc.desc Verify Map<string,int > forEach value >]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: int[] = [1, 2];
      let arr2: int[] = [3, 4];
      let vals: int[][] = [];
      const map: ReadonlyMap<string, int[]> = new Map<string, int[]>([['a', arr1], ['b', arr2]]);
      map.forEach((value: int[], key: string, _map: ReadonlyMap<string, int[]>) => {
        vals.push(value);
      });
      expect(vals[0][0]).assertEqual(1);
      expect(vals[0][1]).assertEqual(2);
      expect(vals[1][0]).assertEqual(3);
      expect(vals[1][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_4300
     * @tc.name readonlyMapForEachPart01Test043
     * @tc.desc Verify K 2147483647 forEach key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundMax: boolean = false;
      const map: ReadonlyMap<int, string> = new Map<int, string>([[2147483647, 'max'], [0, 'zero']]);
      map.forEach((value: string, key: int, _map: ReadonlyMap<int, string>) => {
        if (key === 2147483647) {
          foundMax = true;
        }
      });
      expect(foundMax).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_4400
     * @tc.name readonlyMapForEachPart01Test044
     * @tc.desc Verify K (-2147483647 - 1) forEach key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundMin: boolean = false;
      const map: ReadonlyMap<int, string> = new Map<int, string>([[-2147483648, 'min'], [1, 'one']]);
      map.forEach((value: string, key: int, _map: ReadonlyMap<int, string>) => {
        if (key === -2147483648) {
          foundMin = true;
        }
      });
      expect(foundMin).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_4500
     * @tc.name readonlyMapForEachPart01Test045
     * @tc.desc Verify K 0 forEach key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundZero: boolean = false;
      const map: ReadonlyMap<int, string> = new Map<int, string>([[0, 'zero'], [1, 'one']]);
      map.forEach((value: string, key: int, _map: ReadonlyMap<int, string>) => {
        if (key === 0) {
          foundZero = true;
        }
      });
      expect(foundZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_4600
     * @tc.name readonlyMapForEachPart01Test046
     * @tc.desc Verify K -1 forEach key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundNeg: boolean = false;
      const map: ReadonlyMap<int, string> = new Map<int, string>([[-1, 'negative'], [1, 'positive']]);
      map.forEach((value: string, key: int, _map: ReadonlyMap<int, string>) => {
        if (key === -1) {
          foundNeg = true;
        }
      });
      expect(foundNeg).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_4700
     * @tc.name readonlyMapForEachPart01Test047
     * @tc.desc Verify K forEach key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundEmpty: boolean = false;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['', 0], ['nonempty', 1]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        if (key === '') {
          foundEmpty = true;
        }
      });
      expect(foundEmpty).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_4800
     * @tc.name readonlyMapForEachPart01Test048
     * @tc.desc Verify K Unicode emoji forEach key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundEmoji: boolean = false;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['😀', 1], ['normal', 2]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        if (key === '😀') {
          foundEmoji = true;
        }
      });
      expect(foundEmoji).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_4900
     * @tc.name readonlyMapForEachPart01Test049
     * @tc.desc Verify K number.NaN forEach key NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundNaN: boolean = false;
      const map: ReadonlyMap<number, int> = new Map<number, int>([[Number.NaN, 1], [3.14, 2]]);
      map.forEach((value: int, key: number, _map: ReadonlyMap<number, int>) => {
        if (key !== key) {
          foundNaN = true;
        }
      });
      expect(foundNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_5000
     * @tc.name readonlyMapForEachPart01Test050
     * @tc.desc Verify K Number.POSITIVE_INFINITY forEach key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundInf: boolean = false;
      const map: ReadonlyMap<number, int> = new Map<number, int>([[Number.POSITIVE_INFINITY, 1], [3.14, 2]]);
      map.forEach((value: int, key: number, _map: ReadonlyMap<number, int>) => {
        if (key === Number.POSITIVE_INFINITY) {
          foundInf = true;
        }
      });
      expect(foundInf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_5100
     * @tc.name readonlyMapForEachPart01Test051
     * @tc.desc Verify V 2147483647 forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundMax: boolean = false;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['max', 2147483647], ['normal', 1]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        if (value === 2147483647) {
          foundMax = true;
        }
      });
      expect(foundMax).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_5200
     * @tc.name readonlyMapForEachPart01Test052
     * @tc.desc Verify V (-2147483647 - 1) forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundMin: boolean = false;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['min', -2147483648], ['normal', 1]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        if (value === -2147483648) {
          foundMin = true;
        }
      });
      expect(foundMin).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_5300
     * @tc.name readonlyMapForEachPart01Test053
     * @tc.desc Verify V 0 forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundZero: boolean = false;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['zero', 0], ['nonzero', 1]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        if (value === 0) {
          foundZero = true;
        }
      });
      expect(foundZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_5400
     * @tc.name readonlyMapForEachPart01Test054
     * @tc.desc Verify V -1 forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundNeg: boolean = false;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['neg', -1], ['pos', 1]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        if (value === -1) {
          foundNeg = true;
        }
      });
      expect(foundNeg).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_5500
     * @tc.name readonlyMapForEachPart01Test055
     * @tc.desc Verify V number.NaN forEach value NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundNaN: boolean = false;
      const map: ReadonlyMap<string, number> = new Map<string, number>([['nan', Number.NaN], ['normal', 3.14]]);
      map.forEach((value: number, key: string, _map: ReadonlyMap<string, number>) => {
        if (value !== value) {
          foundNaN = true;
        }
      });
      expect(foundNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_5600
     * @tc.name readonlyMapForEachPart01Test056
     * @tc.desc Verify V Number.POSITIVE_INFINITY forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundInf: boolean = false;
      const map: ReadonlyMap<string, number> = new Map<string, number>([['inf', Number.POSITIVE_INFINITY], ['normal', 3.14]]);
      map.forEach((value: number, key: string, _map: ReadonlyMap<string, number>) => {
        if (value === Number.POSITIVE_INFINITY) {
          foundInf = true;
        }
      });
      expect(foundInf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_5700
     * @tc.name readonlyMapForEachPart01Test057
     * @tc.desc Verify V Number.NEGATIVE_INFINITY forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundNegInf: boolean = false;
      const map: ReadonlyMap<string, number> = new Map<string, number>([['negInf', Number.NEGATIVE_INFINITY], ['normal', 3.14]]);
      map.forEach((value: number, key: string, _map: ReadonlyMap<string, number>) => {
        if (value === Number.NEGATIVE_INFINITY) {
          foundNegInf = true;
        }
      });
      expect(foundNegInf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_5800
     * @tc.name readonlyMapForEachPart01Test058
     * @tc.desc Verify forEach == 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: int[] = [];
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 10], ['b', 20], ['c', 30]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        collected.push(value);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(10);
      expect(collected[1]).assertEqual(20);
      expect(collected[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_5900
     * @tc.name readonlyMapForEachPart01Test059
     * @tc.desc Verify forEach == 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: string[] = [];
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 1], ['y', 2], ['z', 3]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        collected.push(key);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual('x');
      expect(collected[1]).assertEqual('y');
      expect(collected[2]).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_6000
     * @tc.name readonlyMapForEachPart01Test060
     * @tc.desc Verify forEach == true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let externalValue: int = 999;
      let accessed: boolean = false;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        if (externalValue === 999) {
          accessed = true;
        }
      });
      expect(accessed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_6100
     * @tc.name readonlyMapForEachPart01Test061
     * @tc.desc Verify forEach == 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counter: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        counter = counter + value;
      });
      expect(counter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_6200
     * @tc.name readonlyMapForEachPart01Test062
     * @tc.desc Verify forEach == 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callRecord: string[] = [];
      const recordCall = (key: string): void => {
        callRecord.push(key);
      };
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      map.forEach((value: int, key: string, _map: ReadonlyMap<string, int>) => {
        recordCall(key);
      });
      expect(callRecord.length).assertEqual(2);
      expect(callRecord[0]).assertEqual('a');
      expect(callRecord[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_6300
     * @tc.name readonlyMapForEachPart01Test063
     * @tc.desc Verify forEach == true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allUsed: boolean = true;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 10], ['b', 20]]);
      map.forEach((value: int, key: string, m: ReadonlyMap<string, int>) => {
        if (m.get(key) !== value || key === '' || value < 0) {
          allUsed = false;
        }
      });
      expect(allUsed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART01_TEST_6400
     * @tc.name readonlyMapForEachPart01Test064
     * @tc.desc Verify map.size map.size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matchCount: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      map.forEach((value: int, key: string, m: ReadonlyMap<string, int>) => {
        if (m.size === map.size) {
          matchCount++;
        }
      });
      expect(matchCount).assertEqual(2);
    });

  });
}
