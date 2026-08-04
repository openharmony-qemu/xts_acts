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

  interface SampleObj {
        id: int;
        name: string;
      }

  interface IdCard {
        serial: int;
      }

export default function mapForEachPart01TestTest(): void {
  describe('MapForEachPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_0100
     * @tc.name mapForEachPart01Test001
     * @tc.desc Verify forEach 1 callbackfn, Map (K=string,V=int)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      let count: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_0200
     * @tc.name mapForEachPart01Test002
     * @tc.desc Verify forEach callbackfn ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['first', 100], ['second', 200]]);
      let keys: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('first');
      expect(keys[1]).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_0300
     * @tc.name mapForEachPart01Test003
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {});
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_0400
     * @tc.name mapForEachPart01Test004
     * @tc.desc Verify value, value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['alpha', 5], ['beta', 10]]);
      let values: int[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        values.push(value);
      });
      expect(values[0]).assertEqual(5);
      expect(values[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_0500
     * @tc.name mapForEachPart01Test005
     * @tc.desc Verify key, key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['one', 1], ['two', 2]]);
      let keys: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('one');
      expect(keys[1]).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_0600
     * @tc.name mapForEachPart01Test006
     * @tc.desc Verify map, map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['k1', 100], ['k2', 200]]);
      let totalSize: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        totalSize = m.size;
      });
      expect(totalSize).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_0700
     * @tc.name mapForEachPart01Test007
     * @tc.desc Verify 3 (value,key,map)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['p', 42]]);
      let ok: boolean = false;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        if (value === 42 && key === 'p' && m.size === 1) {
          ok = true;
        }
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_0800
     * @tc.name mapForEachPart01Test008
     * @tc.desc Verify value key( map)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['A', 3], ['B', 7]]);
      let acc: int = 0;
      map.forEach((value: int, key: string): void => {
        if (key === 'A') { acc = acc + value; }
        if (key === 'B') { acc = acc + value; }
      });
      expect(acc).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_0900
     * @tc.name mapForEachPart01Test009
     * @tc.desc Verify value map( key), value map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['m1', 30], ['m2', 50]]);
      let sum: int = 0;
      let sz: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        sum = sum + value;
        sz = m.size;
      });
      expect(sum).assertEqual(80);
      expect(sz).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_1000
     * @tc.name mapForEachPart01Test010
     * @tc.desc Verify key map( value), key map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['cat', 99], ['dog', 88]]);
      let allKeys: string = '';
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        allKeys = allKeys + key;
      });
      expect(allKeys).assertEqual('catdog');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_1100
     * @tc.name mapForEachPart01Test011
     * @tc.desc Verify 1 value( key), value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['keyA', 111]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        expect(value).assertEqual(111);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_1200
     * @tc.name mapForEachPart01Test012
     * @tc.desc Verify 2 key( value), key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['target', 999]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        expect(key).assertEqual('target');
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_1300
     * @tc.name mapForEachPart01Test013
     * @tc.desc Verify 3 map, map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['z', 0]]);
      const mapRef: Map<string, int> = map;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        expect(m).assertEqual(mapRef);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_1400
     * @tc.name mapForEachPart01Test014
     * @tc.desc Verify forEach K=int V=string == 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[1, 'a']]);
      map.forEach((value: string, key: int, m: Map<int, string>): void => {
        expect(value).assertEqual('a');
        expect(key).assertEqual(1);
        expect(m.size).assertEqual(1);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_1500
     * @tc.name mapForEachPart01Test015
     * @tc.desc Verify K=string,V=int, value number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['key', 10]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        expect(typeof value).assertEqual('int');
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_1600
     * @tc.name mapForEachPart01Test016
     * @tc.desc Verify K=string,V=int, key string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['name', 99]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        expect(typeof key).assertEqual('string');
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_1700
     * @tc.name mapForEachPart01Test017
     * @tc.desc Verify K=number,V=boolean, value boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, boolean> = new Map<number, boolean>([[1.5, true]]);
      map.forEach((value: boolean, key: number, m: Map<number, boolean>): void => {
        expect(typeof value).assertEqual('boolean');
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_1800
     * @tc.name mapForEachPart01Test018
     * @tc.desc Verify K=number,V=boolean, key number( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, boolean> = new Map<number, boolean>([[3.14, false]]);
      map.forEach((value: boolean, key: number, m: Map<number, boolean>): void => {
        expect(typeof key).assertEqual('number');
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_1900
     * @tc.name mapForEachPart01Test019
     * @tc.desc Verify 1 value value(K=string,V=int)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['first', 777]]);
      let received: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        received = value;
      });
      expect(received).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_2000
     * @tc.name mapForEachPart01Test020
     * @tc.desc Verify 1 key key(K=string,V=int)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['uniqueKey', 333]]);
      let receivedKey: string = '';
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        receivedKey = key;
      });
      expect(receivedKey).assertEqual('uniqueKey');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_2100
     * @tc.name mapForEachPart01Test021
     * @tc.desc Verify Map value key (3 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 10], ['b', 20], ['c', 30]]);
      let pairs: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        pairs.push(key + '=' + value.toString());
      });
      expect(pairs[0]).assertEqual('a=10');
      expect(pairs[1]).assertEqual('b=20');
      expect(pairs[2]).assertEqual('c=30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_2200
     * @tc.name mapForEachPart01Test022
     * @tc.desc Verify Map int int.MAX(2147483647), value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxInt: int = 2147483647;
      const map: Map<string, int> = new Map<string, int>([['max', maxInt]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        expect(value).assertEqual(2147483647);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_2300
     * @tc.name mapForEachPart01Test023
     * @tc.desc Verify Map int int.MIN(-2147483648), value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minInt: int = -2147483648;
      const map: Map<string, int> = new Map<string, int>([['min', minInt]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        expect(value).assertEqual(-2147483648);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_2400
     * @tc.name mapForEachPart01Test024
     * @tc.desc Verify map.size Map.size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['s1', 11], ['s2', 22], ['s3', 33]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        expect(m.size).assertEqual(3);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_2500
     * @tc.name mapForEachPart01Test025
     * @tc.desc Verify map set, Map ReadonlyMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['original', 1]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        m.set('addedInCallback', 999);
      });
      expect(map.has('addedInCallback')).assertTrue();
      expect(map.get('addedInCallback')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_2600
     * @tc.name mapForEachPart01Test026
     * @tc.desc Verify map.get key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['getMe', 555]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        let fromGet: int | undefined = m.get(key);
        expect(fromGet).assertEqual(555);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_2700
     * @tc.name mapForEachPart01Test027
     * @tc.desc Verify map.has key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['exist', 888]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        expect(m.has(key)).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_2800
     * @tc.name mapForEachPart01Test028
     * @tc.desc Verify Map(size=0), callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let called: boolean = false;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_2900
     * @tc.name mapForEachPart01Test029
     * @tc.desc Verify Map, forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.forEach((value: int, key: string, m: Map<string, int>): void => {});
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_3000
     * @tc.name mapForEachPart01Test030
     * @tc.desc Verify size=1, callbackfn 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['solo', 1]]);
      let callCount: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        callCount++;
      });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_3100
     * @tc.name mapForEachPart01Test031
     * @tc.desc Verify Map, value key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['only', 42]]);
      let v: int = 0;
      let k: string = '';
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        v = value;
        k = key;
      });
      expect(v).assertEqual(42);
      expect(k).assertEqual('only');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_3200
     * @tc.name mapForEachPart01Test032
     * @tc.desc Verify size=3, callbackfn 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['x1', 1], ['x2', 2], ['x3', 3]]);
      let hit: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        hit++;
      });
      expect(hit).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_3300
     * @tc.name mapForEachPart01Test033
     * @tc.desc Verify Map(size=4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['A', 5], ['B', 10], ['C', 15], ['D', 20]]);
      let sum: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        sum = sum + value;
      });
      expect(sum).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_3400
     * @tc.name mapForEachPart01Test034
     * @tc.desc Verify A B C, (string key)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('apple', 1);
      map.set('banana', 2);
      map.set('cherry', 3);
      let order: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        order.push(key);
      });
      expect(order[0]).assertEqual('apple');
      expect(order[1]).assertEqual('banana');
      expect(order[2]).assertEqual('cherry');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_3500
     * @tc.name mapForEachPart01Test035
     * @tc.desc Verify 1 2 3, (int key)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(10, 'ten');
      map.set(20, 'twenty');
      map.set(30, 'thirty');
      let order: int[] = [];
      map.forEach((value: string, key: int, m: Map<int, string>): void => {
        order.push(key);
      });
      expect(order[0]).assertEqual(10);
      expect(order[1]).assertEqual(20);
      expect(order[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_3600
     * @tc.name mapForEachPart01Test036
     * @tc.desc Verify set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['keep', 100], ['next', 200]]);
      map.set('keep', 999);
      let keys: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('keep');
      expect(keys[1]).assertEqual('next');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_3700
     * @tc.name mapForEachPart01Test037
     * @tc.desc Verify delete key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['del', 1], ['stay', 2]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        m.delete(key);
      });
      expect(map.has('del')).assertFalse();
      expect(map.has('stay')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_3800
     * @tc.name mapForEachPart01Test038
     * @tc.desc Verify delete 1 key, 2 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['rmFirst', 10], ['second', 20], ['third', 30]]);
      let visited: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        visited.push(key);
        if (key === 'rmFirst') {
          m.delete(key);
        }
      });
      expect(visited[0]).assertEqual('rmFirst');
      expect(visited.length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_3900
     * @tc.name mapForEachPart01Test039
     * @tc.desc Verify delete map.size, size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['d1', 1], ['d2', 2], ['d3', 3]]);
      let szAfter: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        if (key === 'd1') {
          m.delete(key);
        }
        szAfter = m.size;
      });
      expect(szAfter < 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_4000
     * @tc.name mapForEachPart01Test040
     * @tc.desc Verify set key-value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['orig', 1]]);
      let keys: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        keys.push(key);
        m.set('newOne', 999);
      });
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_4100
     * @tc.name mapForEachPart01Test041
     * @tc.desc Verify set key map.size, size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['base', 100]]);
      let finalSize: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        m.set('added', 200);
        finalSize = m.size;
      });
      expect(finalSize).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_4200
     * @tc.name mapForEachPart01Test042
     * @tc.desc Verify key set, value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['update', 5], ['tail', 6]]);
      let values: int[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        values.push(value);
        if (key === 'update') {
          m.set('update', 500);
        }
      });
      expect(map.get('update')).assertEqual(500);
      expect(values.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_4300
     * @tc.name mapForEachPart01Test043
     * @tc.desc Verify key, value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['ov', 1]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        m.set(key, 999);
      });
      expect(map.get('ov')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_4400
     * @tc.name mapForEachPart01Test044
     * @tc.desc Verify size, entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['sameKey', 10], ['other', 20]]);
      let szAfter: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        m.set(key, 888);
        szAfter = m.size;
      });
      expect(szAfter).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_4500
     * @tc.name mapForEachPart01Test045
     * @tc.desc Verify clear map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['c1', 1], ['c2', 2], ['c3', 3]]);
      let visited: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        visited++;
        m.clear();
      });
      expect(visited).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_4600
     * @tc.name mapForEachPart01Test046
     * @tc.desc Verify clear map.size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['clr', 7]]);
      let finalSize: int = -1;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        m.clear();
        finalSize = m.size;
      });
      expect(finalSize).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_4700
     * @tc.name mapForEachPart01Test047
     * @tc.desc Verify throw Error, forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['err', 1]]);
      try {
        map.forEach((value: int, key: string, m: Map<string, int>): void => {
          throw new Error('callback error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_4800
     * @tc.name mapForEachPart01Test048
     * @tc.desc Verify forEach == 'Error'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['die', 1], ['never', 2], ['reached', 3]]);
      let visitedKeys: string[] = [];
      try {
        map.forEach((value: int, key: string, m: Map<string, int>): void => {
          visitedKeys.push(key);
          throw new Error('abort');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(visitedKeys.length).assertEqual(1);
      expect(visitedKeys[0]).assertEqual('die');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_4900
     * @tc.name mapForEachPart01Test049
     * @tc.desc Verify forEach == 'Error'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['mod', 10], ['untouched', 20]]);
      try {
        map.forEach((value: int, key: string, m: Map<string, int>): void => {
          m.set('mod', 999);
          throw new Error('stop');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(map.get('mod')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_5000
     * @tc.name mapForEachPart01Test050
     * @tc.desc Verify value=null, null(K=string,V=int|null )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int | null> = new Map<string, int | null>();
      map.set('nil', null);
      map.forEach((value: int | null, key: string, m: Map<string, int | null>): void => {
        expect(value).assertNull();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_5100
     * @tc.name mapForEachPart01Test051
     * @tc.desc Verify value=undefined, undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int | undefined> = new Map<string, int | undefined>();
      map.set('undef', undefined);
      map.forEach((value: int | undefined, key: string, m: Map<string, int | undefined>): void => {
        expect(value).assertUndefined();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_5200
     * @tc.name mapForEachPart01Test052
     * @tc.desc Verify value=NaN(number ), NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>([['nanVal', Number.NaN]]);
      map.forEach((value: number, key: string, m: Map<string, number>): void => {
        expect(isNaN(value)).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_5300
     * @tc.name mapForEachPart01Test053
     * @tc.desc Verify value=Number.POSITIVE_INFINITY, Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>([['infVal', Number.POSITIVE_INFINITY]]);
      map.forEach((value: number, key: string, m: Map<string, number>): void => {
        expect(value).assertEqual(Number.POSITIVE_INFINITY);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_5400
     * @tc.name mapForEachPart01Test054
     * @tc.desc Verify value=Number.NEGATIVE_INFINITY, -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>([['negInf', Number.NEGATIVE_INFINITY]]);
      map.forEach((value: number, key: string, m: Map<string, number>): void => {
        expect(value).assertEqual(Number.NEGATIVE_INFINITY);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_5500
     * @tc.name mapForEachPart01Test055
     * @tc.desc Verify value=0, 0( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['zero', 0]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        expect(value).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_5600
     * @tc.name mapForEachPart01Test056
     * @tc.desc Verify value=int.MAX(2147483647), int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['vmax', 2147483647]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        expect(value).assertEqual(2147483647);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_5700
     * @tc.name mapForEachPart01Test057
     * @tc.desc Verify value=int.MIN(-2147483648), int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['vmin', -2147483648]]);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        expect(value).assertEqual(-2147483648);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_5800
     * @tc.name mapForEachPart01Test058
     * @tc.desc Verify key= '', key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['', 1], ['b', 2]]);
      let keys: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_5900
     * @tc.name mapForEachPart01Test059
     * @tc.desc Verify key emoji( ), emoji key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['😀', 1], ['normal', 2]]);
      let emojiKey: string = '';
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        if (key === '😀') { emojiKey = key; }
      });
      expect(emojiKey).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_6000
     * @tc.name mapForEachPart01Test060
     * @tc.desc Verify key (10000 ), key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'k' + 'x'.repeat(9999);
      const map: Map<string, int> = new Map<string, int>([[longKey, 1]]);
      let receivedKey: string = '';
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        receivedKey = key;
      });
      expect(receivedKey).assertEqual(longKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_6100
     * @tc.name mapForEachPart01Test061
     * @tc.desc Verify value=Date, Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(2026, 0, 1);
      const map: Map<string, Date> = new Map<string, Date>([['dateKey', d]]);
      map.forEach((value: Date, key: string, m: Map<string, Date>): void => {
        expect(value).assertEqual(d);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_6200
     * @tc.name mapForEachPart01Test062
     * @tc.desc Verify value=Array, Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      const map: Map<string, int[]> = new Map<string, int[]>([['arrKey', arr]]);
      map.forEach((value: int[], key: string, m: Map<string, int[]>): void => {
        expect(value).assertEqual(arr);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_6300
     * @tc.name mapForEachPart01Test063
     * @tc.desc Verify value interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: SampleObj = { id: 1, name: 'test' } as SampleObj;
      const map: Map<string, SampleObj> = new Map<string, SampleObj>([['objKey', obj]]);
      map.forEach((value: SampleObj, key: string, m: Map<string, SampleObj>): void => {
        expect(value.id).assertEqual(1);
        expect(value.name).assertEqual('test');
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_6400
     * @tc.name mapForEachPart01Test064
     * @tc.desc Verify key=Date, Date key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(2025, 5, 15);
      const map: Map<Date, int> = new Map<Date, int>([[d1, 100]]);
      map.forEach((value: int, key: Date, m: Map<Date, int>): void => {
        expect(key).assertEqual(d1);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_6500
     * @tc.name mapForEachPart01Test065
     * @tc.desc Verify key interface, key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let card: IdCard = { serial: 42 } as IdCard;
      const map: Map<IdCard, string> = new Map<IdCard, string>([[card, 'owner']]);
      map.forEach((value: string, key: IdCard, m: Map<IdCard, string>): void => {
        expect(key.serial).assertEqual(42);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_6600
     * @tc.name mapForEachPart01Test066
     * @tc.desc Verify Map forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer: Map<string, int> = new Map<string, int>([['o1', 1], ['o2', 2]]);
      const inner: Map<string, int> = new Map<string, int>([['i1', 10], ['i2', 20]]);
      let total: int = 0;
      outer.forEach((value: int, key: string, m: Map<string, int>): void => {
        total = total + value;
        inner.forEach((iv: int, ik: string, im: Map<string, int>): void => {
          total = total + iv;
        });
      });
      expect(total).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_6700
     * @tc.name mapForEachPart01Test067
     * @tc.desc Verify Map forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['self', 5]]);
      let nestedCalled: boolean = false;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        map.forEach((v2: int, k2: string, m2: Map<string, int>): void => {
          nestedCalled = true;
        });
      });
      expect(nestedCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_6800
     * @tc.name mapForEachPart01Test068
     * @tc.desc Verify forEach == 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 0], ['b', 0], ['c', 0], ['d', 0]]);
      let counter: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        counter++;
      });
      expect(counter).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOR_EACH_PART01_6900
     * @tc.name mapForEachPart01Test069
     * @tc.desc Verify push value, value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapForEachPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['x', 100], ['y', 200], ['z', 300]]);
      let collected: int[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        collected.push(value);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(100);
      expect(collected[1]).assertEqual(200);
      expect(collected[2]).assertEqual(300);
    });

  });
}
