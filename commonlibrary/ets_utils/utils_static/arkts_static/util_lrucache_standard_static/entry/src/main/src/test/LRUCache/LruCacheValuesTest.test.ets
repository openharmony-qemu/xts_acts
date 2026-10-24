'use static';

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
  beforeAll, afterEach, beforeEach, afterAll, describe, it, expect, TestType, Size, Level
} from '../../../../hypium/index';
import util from '@ohos.util';
import Utils from './../Util.test';

interface NameScorePair {
  name: string;
  score: int;
}

interface Person {
  name: string;
  age: int;
}

class Student {
  private _name: string;
  constructor(name: string) {
    this._name = name;
  }
  getName(): string {
    return this._name;
  }
}

class Employee {
  private _id: int;
  constructor(id: int) {
    this._id = id;
  }
  getId(): int {
    return this._id;
  }
}

class IdItem {
  id: int = 0;
  constructor(i: int) {
    this.id = i;
  }
}

class TaggedNode {
  tag: string = '';
  constructor(t: string) {
    this.tag = t;
  }
}

interface StrIdPair {
  id: string;
}

interface IdKeyObj {
  id: int;
}

enum ValSlot {
  Low = 0,
  High = 1
}

export default function lruCacheValuesTest(): void {
  describe('LruCacheValuesTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0010
     * @tc.name testLruCacheValues001
     * @tc.desc Merged batch (5 tests): [1] Verify values returns all cached values in insertion order | [2] Verify calling values has no side effect on cache length | [3] Verify values returns int values when V i...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values returns all cached values in insertion order ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.put(3, 'C');
        let result: Array<string> = pro.values();
        expect(result[0]).assertEqual('A');
        expect(result[1]).assertEqual('B');
        expect(result[2]).assertEqual('C');
      }

      // --- [2] Verify calling values has no side effect on cache length ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.values();
        expect(pro.length).assertEqual(2);
      }

      // --- [3] Verify values returns int values when V is int ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 10);
        pro.put(2, 20);
        let vs: Array<int> = pro.values();
        expect(vs[0]).assertEqual(10);
        expect(vs[1]).assertEqual(20);
      }

      // --- [4] Verify values returns string values when V is string ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'hello');
        pro.put(2, 'world');
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('hello');
        expect(vs[1]).assertEqual('world');
      }

      // --- [5] Verify values returns boolean values keeping insertion order ---
      {
        let pro: util.LRUCache<int, boolean> = new util.LRUCache<int, boolean>();
        pro.put(1, true);
        pro.put(2, false);
        let vs: Array<boolean> = pro.values();
        expect(vs[0]).assertTrue();
        expect(vs[1]).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0020
     * @tc.name testLruCacheValues002
     * @tc.desc Merged batch (5 tests): [1] Verify values keeps double precision for double values | [2] Verify values returns bigint value 100n | [3] Verify values returns Date instance with same timestamp | [4] ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values keeps double precision for double values ---
      {
        let pro: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        pro.put(1, 3.14);
        let vs: Array<double> = pro.values();
        expect(vs.length).assertEqual(1);
        expect(vs[0]).assertEqual(3.14);
      }

      // --- [2] Verify values returns bigint value 100n ---
      {
        let pro: util.LRUCache<int, bigint> = new util.LRUCache<int, bigint>();
        pro.put(1, 100n);
        let vs: Array<bigint> = pro.values();
        expect(vs[0]).assertEqual(100n);
      }

      // --- [3] Verify values returns Date instance with same timestamp ---
      {
        let pro: util.LRUCache<int, Date> = new util.LRUCache<int, Date>();
        let d: Date = new Date(0);
        pro.put(1, d);
        let result: Array<Date> = pro.values();
        expect(result.length).assertEqual(1);
        expect(result[0].getTime()).assertEqual(0);
      }

      // --- [4] Verify two same-millisecond Date values kept as independent entries ---
      {
        let pro: util.LRUCache<int, Date> = new util.LRUCache<int, Date>();
        pro.put(1, new Date(1000));
        pro.put(2, new Date(1000));
        let result: Array<Date> = pro.values();
        expect(result.length).assertEqual(2);
        expect(result[0].getTime()).assertEqual(result[1].getTime());
      }

      // --- [5] Verify values returns RegExp instance that can still match ---
      {
        let pro: util.LRUCache<int, RegExp> = new util.LRUCache<int, RegExp>();
        pro.put(1, new RegExp('abc', 'g'));
        let result: Array<RegExp> = pro.values();
        expect(result.length).assertEqual(1);
        expect(result[0].test('abc')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0030
     * @tc.name testLruCacheValues003
     * @tc.desc Merged batch (5 tests): [1] Verify two same-pattern RegExp values kept as independent entries | [2] Verify values returns Error instance preserving message | [3] Verify values returns interface obj...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two same-pattern RegExp values kept as independent entries ---
      {
        let pro: util.LRUCache<int, RegExp> = new util.LRUCache<int, RegExp>();
        let r1: RegExp = new RegExp('abc', 'g');
        let r2: RegExp = new RegExp('abc', 'g');
        pro.put(1, r1);
        pro.put(2, r2);
        expect(pro.values()[0]).assertEqual(r1);
        expect(pro.values()[1]).assertEqual(r2);
      }

      // --- [2] Verify values returns Error instance preserving message ---
      {
        let pro: util.LRUCache<int, Error> = new util.LRUCache<int, Error>();
        pro.put(1, new Error('boom'));
        let result: Array<Error> = pro.values();
        expect(result.length).assertEqual(1);
        expect(result[0].message).assertEqual('boom');
      }

      // --- [3] Verify values returns interface object preserving property ---
      {
        let pro: util.LRUCache<int, NameScorePair> = new util.LRUCache<int, NameScorePair>();
        let scorePair: NameScorePair = { name: 'A', score: 1 };
        pro.put(1, scorePair);
        let result: Array<NameScorePair> = pro.values();
        expect(result.length).assertEqual(1);
        expect(result[0].name).assertEqual('A');
      }

      // --- [4] Verify two same-property interface objects kept as independent entries ---
      {
        let pro: util.LRUCache<int, Person> = new util.LRUCache<int, Person>();
        let firstPerson: Person = { name: 'Tom', age: 20 };
        let secondPerson: Person = { name: 'Tom', age: 20 };
        pro.put(1, firstPerson);
        pro.put(2, secondPerson);
        let result: Array<Person> = pro.values();
        expect(result.length).assertEqual(2);
        expect(result[0].name).assertEqual(result[1].name);
      }

      // --- [5] Verify values returns class instance with accessible method state ---
      {
        let pro: util.LRUCache<int, Student> = new util.LRUCache<int, Student>();
        let s: Student = new Student('Bob');
        pro.put(1, s);
        let result: Array<Student> = pro.values();
        expect(result.length).assertEqual(1);
        expect(result[0].getName()).assertEqual('Bob');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0040
     * @tc.name testLruCacheValues004
     * @tc.desc Merged batch (5 tests): [1] Verify two same-state class instances kept as independent entries | [2] Verify values returns nested array with intact elements | [3] Verify two same-content arrays kept...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two same-state class instances kept as independent entries ---
      {
        let pro: util.LRUCache<int, Employee> = new util.LRUCache<int, Employee>();
        pro.put(1, new Employee(7));
        pro.put(2, new Employee(7));
        let result: Array<Employee> = pro.values();
        expect(result.length).assertEqual(2);
        expect(result[0].getId()).assertEqual(result[1].getId());
      }

      // --- [2] Verify values returns nested array with intact elements ---
      {
        let pro: util.LRUCache<int, int[]> = new util.LRUCache<int, int[]>();
        pro.put(1, [1, 2, 3]);
        let result: Array<int[]> = pro.values();
        expect(result.length).assertEqual(1);
        expect(result[0][0]).assertEqual(1);
        expect(result[0][1]).assertEqual(2);
        expect(result[0][2]).assertEqual(3);
      }

      // --- [3] Verify two same-content arrays kept as independent entries ---
      {
        let pro: util.LRUCache<int, int[]> = new util.LRUCache<int, int[]>();
        let a1: int[] = [1, 2, 3];
        let a2: int[] = [1, 2, 3];
        pro.put(1, a1);
        pro.put(2, a2);
        expect(pro.values()[0]).assertEqual(a1);
        expect(pro.values()[1]).assertEqual(a2);
      }

      // --- [4] Verify values returns Map value accessible by get ---
      {
        let pro: util.LRUCache<int, Map<string, int>> = new util.LRUCache<int, Map<string, int>>();
        let m: Map<string, int> = new Map<string, int>();
        m.set('k', 1);
        pro.put(1, m);
        let result: Array<Map<string, int>> = pro.values();
        expect(result.length).assertEqual(1);
        expect(result[0].get('k')).assertEqual(1);
      }

      // --- [5] Verify values returns Set value checkable by has ---
      {
        let pro: util.LRUCache<int, Set<int>> = new util.LRUCache<int, Set<int>>();
        let s: Set<int> = new Set<int>();
        s.add(5);
        pro.put(1, s);
        let result: Array<Set<int>> = pro.values();
        expect(result.length).assertEqual(1);
        expect(result[0].has(5)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0050
     * @tc.name testLruCacheValues005
     * @tc.desc Merged batch (5 tests): [1] Verify values returns Uint8Array with intact byte contents | [2] Verify values holds Record type value | [3] Verify values holds Promise object value | [4] Verify values...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values returns Uint8Array with intact byte contents ---
      {
        let pro: util.LRUCache<int, Uint8Array> = new util.LRUCache<int, Uint8Array>();
        let u: Uint8Array = new Uint8Array(3);
        u[0] = 1;
        u[1] = 2;
        u[2] = 3;
        pro.put(1, u);
        let result: Array<Uint8Array> = pro.values();
        expect(result.length).assertEqual(1);
        expect(result[0][2]).assertEqual(3);
      }

      // --- [2] Verify values holds Record type value ---
      {
        let pro: util.LRUCache<int, Record<string, double>> = new util.LRUCache<int, Record<string, double>>();
        let rec: Record<string, double> = { 'x': 1.5, 'y': 2.5 };
        pro.put(1, rec);
        expect(pro.values()[0]).assertEqual(rec);
      }

      // --- [3] Verify values holds Promise object value ---
      {
        let pro: util.LRUCache<int, Promise<int>> = new util.LRUCache<int, Promise<int>>();
        let p: Promise<int> = Promise.resolve<int>(7);
        pro.put(1, p);
        expect(pro.values()[0]).assertEqual(p);
      }

      // --- [4] Verify values returns int max 2147483647 untruncated ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 2147483647);
        let vs: Array<int> = pro.values();
        let first: int = vs[0];
        expect(first).assertEqual(2147483647);
      }

      // --- [5] Verify values returns int min -2147483648 without overflow ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, -2147483648);
        let vs: Array<int> = pro.values();
        expect(vs[0]).assertEqual(-2147483648);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0060
     * @tc.name testLruCacheValues006
     * @tc.desc Merged batch (5 tests): [1] Verify values returns zero value | [2] Verify values returns empty string element | [3] Verify values returns full 1000-char string untruncated | [4] Verify values retur...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values returns zero value ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        pro.put(1, 0);
        let vs: Array<int> = pro.values();
        expect(vs[0]).assertEqual(0);
        expect(pro.length).assertEqual(1);
      }

      // --- [2] Verify values returns empty string element ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, '');
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('');
      }

      // --- [3] Verify values returns full 1000-char string untruncated ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        let longStr: string = '';
        for (let i: int = 0; i < 1000; i++) {
          longStr = longStr + 'a';
        }
        pro.put(1, longStr);
        expect(pro.values()[0]).assertEqual(longStr);
      }

      // --- [4] Verify values returns chinese and emoji mixed string ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, '你好😀');
        pro.put(2, '中英mixed');
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('你好😀');
        expect(vs[1]).assertEqual('中英mixed');
      }

      // --- [5] Verify values returns all values A-F in insertion order when untouched ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.put(3, 'C');
        pro.put(4, 'D');
        pro.put(5, 'E');
        pro.put(6, 'F');
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('A');
        expect(vs[1]).assertEqual('B');
        expect(vs[2]).assertEqual('C');
        expect(vs[3]).assertEqual('D');
        expect(vs[4]).assertEqual('E');
        expect(vs[5]).assertEqual('F');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0070
     * @tc.name testLruCacheValues007
     * @tc.desc Merged batch (5 tests): [1] Verify hit values move to MRU end after get | [2] Verify hitting MRU element keeps values order unchanged | [3] Verify hitting LRU element moves it to MRU end | [4] Veri...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify hit values move to MRU end after get ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.put(3, 'C');
        pro.put(4, 'D');
        pro.put(5, 'E');
        pro.put(6, 'F');
        pro.get(1);
        pro.get(2);
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('C');
        expect(vs[1]).assertEqual('D');
        expect(vs[2]).assertEqual('E');
        expect(vs[3]).assertEqual('F');
        expect(vs[4]).assertEqual('A');
        expect(vs[5]).assertEqual('B');
      }

      // --- [2] Verify hitting MRU element keeps values order unchanged ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.put(3, 'C');
        pro.get(3);
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('A');
        expect(vs[1]).assertEqual('B');
        expect(vs[2]).assertEqual('C');
      }

      // --- [3] Verify hitting LRU element moves it to MRU end ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.put(3, 'C');
        pro.get(1);
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('B');
        expect(vs[1]).assertEqual('C');
        expect(vs[2]).assertEqual('A');
      }

      // --- [4] Verify put overwrite moves key to MRU end ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.put(3, 'C');
        pro.put(1, 'X');
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('B');
        expect(vs[1]).assertEqual('C');
        expect(vs[2]).assertEqual('X');
      }

      // --- [5] Verify put over capacity evicts LRU value ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>(2);
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.put(3, 'C');
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('B');
        expect(vs[1]).assertEqual('C');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0080
     * @tc.name testLruCacheValues008
     * @tc.desc Merged batch (5 tests): [1] Verify values excludes removed key value and keeps order | [2] Verify values returns empty array after clear | [3] Verify single element cache returns array with only th...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values excludes removed key value and keeps order ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.put(3, 'C');
        pro.remove(2);
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('A');
        expect(vs[1]).assertEqual('C');
      }

      // --- [2] Verify values returns empty array after clear ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.clear();
        expect(pro.values().length).assertEqual(0);
        expect(pro.isEmpty()).assertTrue();
      }

      // --- [3] Verify single element cache returns array with only that value ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('A');
      }

      // --- [4] Verify empty cache values returns empty array ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        expect(pro.values().length).assertEqual(0);
        expect(pro.values().join(',')).assertEqual('');
      }

      // --- [5] Verify updateCapacity increase keeps values order unchanged ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.updateCapacity(100);
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('A');
        expect(vs[1]).assertEqual('B');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0090
     * @tc.name testLruCacheValues009
     * @tc.desc Merged batch (5 tests): [1] Verify updateCapacity shrink evicts and values keeps MRU values | [2] Verify values still returns the stored entry after a get miss | [3] Verify consecutive get reorders...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify updateCapacity shrink evicts and values keeps MRU values ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>(3);
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.put(3, 'C');
        pro.updateCapacity(1);
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('C');
      }

      // --- [2] Verify values still returns the stored entry after a get miss ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.get(99);
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('A');
      }

      // --- [3] Verify consecutive get reorders values by recency ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.put(3, 'C');
        pro.put(4, 'D');
        pro.get(2);
        pro.get(3);
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('A');
        expect(vs[1]).assertEqual('D');
        expect(vs[2]).assertEqual('B');
        expect(vs[3]).assertEqual('C');
      }

      // --- [4] Verify mixed put and get reflects combined access order ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.get(1);
        pro.put(3, 'C');
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('B');
        expect(vs[1]).assertEqual('A');
        expect(vs[2]).assertEqual('C');
      }

      // --- [5] Verify modifying returned array copy does not affect cache values ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        let arr: Array<string> = pro.values();
        arr[0] = 'X';
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('A');
        expect(vs[1]).assertEqual('B');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0100
     * @tc.name testLruCacheValues010
     * @tc.desc Merged batch (5 tests): [1] Verify values order corresponds to keys order one by one | [2] Verify capacity 1 keeps only latest value on continuous put | [3] Verify capacity at int upper bound retur...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values order corresponds to keys order one by one ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.put(3, 'C');
        pro.get(1);
        let keys: Array<int> = pro.keys();
        let values: Array<string> = pro.values();
        expect(values[0]).assertEqual('B');
        expect(values[1]).assertEqual('C');
        expect(values[2]).assertEqual('A');
        expect(keys[0]).assertEqual(2);
        expect(keys[1]).assertEqual(3);
        expect(keys[2]).assertEqual(1);
      }

      // --- [2] Verify capacity 1 keeps only latest value on continuous put ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        pro.put(1, 100);
        pro.put(2, 200);
        let vs: Array<int> = pro.values();
        expect(vs[0]).assertEqual(200);
      }

      // --- [3] Verify capacity at int upper bound returns stored values ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        pro.put(1, 100);
        pro.put(2, 200);
        let vs: Array<int> = pro.values();
        expect(vs[0]).assertEqual(100);
        expect(vs[1]).assertEqual(200);
      }

      // --- [4] Verify same key put different values keeps only latest entry ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(1, 'B');
        pro.put(1, 'C');
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('C');
      }

      // --- [5] Verify a contains hit promotes the key so its value moves to the end of the values order ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        pro.put(1, 11);
        pro.put(2, 22);
        pro.put(3, 33);
        expect(pro.contains(1)).assertTrue();
        let vs: int[] = pro.values();
        expect(vs.length).assertEqual(3);
        expect(vs[0]).assertEqual(22);
        expect(vs[1]).assertEqual(33);
        expect(vs[2]).assertEqual(11);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0110
     * @tc.name testLruCacheValues011
     * @tc.desc Merged batch (5 tests): [1] Verify default capacity 64 full gives values length 64 | [2] Verify putting 65 keys into default 64 capacity evicts oldest | [3] Verify 100 key collection has full lengt...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify default capacity 64 full gives values length 64 ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 64; i++) {
          pro.put(i, i);
        }
        expect(pro.values().length).assertEqual(64);
      }

      // --- [2] Verify putting 65 keys into default 64 capacity evicts oldest ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 65; i++) {
          pro.put(i, i);
        }
        expect(pro.values().length).assertEqual(64);
        expect(pro.values()[0]).assertEqual(1);
      }

      // --- [3] Verify 100 key collection has full length and ordered endpoints ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>(100);
        for (let i: int = 0; i < 100; i++) {
          pro.put(i, i * 10);
        }
        let result: Array<int> = pro.values();
        expect(result.length).assertEqual(100);
        expect(result[0]).assertEqual(0);
        expect(result[99]).assertEqual(990);
      }

      // --- [4] Verify values result is an Array instance ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        expect(cache.values() instanceof Array).assertTrue();
        let vs: Array<int> = cache.values();
        expect(vs.length).assertEqual(1);
        expect(vs[0]).assertEqual(10);
      }

      // --- [5] Verify reference-typed value element is an instance of its type ---
      {
        // V Date
        let d055: Date = new Date(2024, 5, 15);
        let cache055: util.LRUCache<int, Date> = new util.LRUCache<int, Date>();
        cache055.put(1, d055);
        expect(cache055.values()[0] instanceof Date).assertTrue();
        expect(cache055.values()[0]).assertEqual(d055);

        // V Map
        let m056: Map<string, int> = new Map<string, int>();
        m056.set('a', 1);
        let cache056: util.LRUCache<int, Map<string, int>> = new util.LRUCache<int, Map<string, int>>();
        cache056.put(1, m056);
        expect(cache056.values()[0] instanceof Map).assertTrue();
        expect(cache056.values()[0]).assertEqual(m056);

        // V Set
        let s057: Set<int> = new Set<int>();
        s057.add(1);
        let cache057: util.LRUCache<int, Set<int>> = new util.LRUCache<int, Set<int>>();
        cache057.put(1, s057);
        expect(cache057.values()[0] instanceof Set).assertTrue();
        expect(cache057.values()[0]).assertEqual(s057);

        // V Uint8Array
        let u059: Uint8Array = new Uint8Array([1, 2]);
        let cache059: util.LRUCache<int, Uint8Array> = new util.LRUCache<int, Uint8Array>();
        cache059.put(1, u059);
        expect(cache059.values()[0] instanceof Uint8Array).assertTrue();
        expect(cache059.values()[0]).assertEqual(u059);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0120
     * @tc.name testLruCacheValues012
     * @tc.desc Merged batch (5 tests): [1] Verify Error value element is an Error instance | [2] Verify class instance value element is an instance of that class | [3] Verify int array value element is an Array i...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Error value element is an Error instance ---
      {
        let e: Error = new Error('x');
        let cache: util.LRUCache<int, Error> = new util.LRUCache<int, Error>();
        cache.put(1, e);
        expect(cache.values()[0] instanceof Error).assertTrue();
        expect(cache.values()[0]).assertEqual(e);
      }

      // --- [2] Verify class instance value element is an instance of that class ---
      {
        let it: IdItem = new IdItem(9);
        let cache: util.LRUCache<int, IdItem> = new util.LRUCache<int, IdItem>();
        cache.put(1, it);
        expect(cache.values()[0] instanceof IdItem).assertTrue();
        expect(cache.values()[0]).assertEqual(it);
      }

      // --- [3] Verify int array value element is an Array instance ---
      {
        let a: int[] = [1, 2, 3];
        let cache: util.LRUCache<int, int[]> = new util.LRUCache<int, int[]>();
        cache.put(1, a);
        expect(cache.values()[0] instanceof Array).assertTrue();
        expect(cache.values()[0]).assertEqual(a);
      }

      // --- [4] Verify a NUL character key and a letter key expose their values in insertion order ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('\u0000', 60);
        cache.put('z', 61);
        let vs: int[] = cache.values();
        expect(vs.length).assertEqual(2);
        expect(vs[0]).assertEqual(60);
        expect(vs[1]).assertEqual(61);
      }

      // --- [5] Verify values returns NaN value checked by isNaN ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, Double.NaN);
        expect(isNaN(cache.values()[0])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0130
     * @tc.name testLruCacheValues013
     * @tc.desc Merged batch (5 tests): [1] Verify values returns positive Infinity value | [2] Verify values returns negative Infinity value | [3] Verify the value put as negative zero is kept as negative zero so...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values returns positive Infinity value ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, Double.POSITIVE_INFINITY);
        expect(cache.values()[0]).assertEqual(Double.POSITIVE_INFINITY);
      }

      // --- [2] Verify values returns negative Infinity value ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, Double.NEGATIVE_INFINITY);
        expect(cache.values()[0]).assertEqual(Double.NEGATIVE_INFINITY);
      }

      // --- [3] Verify the value put as negative zero is kept as negative zero so its reciprocal 1 / 0 is negative infinity ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, -0);
        let stored: double = cache.values()[0];
        expect(stored).assertEqual(0);
        expect(1 / stored).assertEqual(Double.NEGATIVE_INFINITY);
      }

      // --- [4] Verify values returns long max value 9223372036854775807 ---
      {
        let lv: long = 9223372036854775807;
        let cache: util.LRUCache<int, long> = new util.LRUCache<int, long>();
        cache.put(1, lv);
        expect(cache.values()[0]).assertEqual(lv);
      }

      // --- [5] Verify values returns double value 0.25 ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, 0.25);
        expect(cache.values()[0]).assertEqual(0.25);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0140
     * @tc.name testLruCacheValues014
     * @tc.desc Merged batch (5 tests): [1] Verify values returns float value 1.5 | [2] Verify values returns chinese string value | [3] Verify values returns emoji surrogate pair value | [4] Verify values returns...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values returns float value 1.5 ---
      {
        let cache: util.LRUCache<int, float> = new util.LRUCache<int, float>();
        cache.put(1, 1.5 as float);
        expect(cache.values()[0]).assertEqual(1.5);
      }

      // --- [2] Verify values returns chinese string value ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, '你好');
        let vs: Array<string> = cache.values();
        expect(vs.length).assertEqual(1);
        expect(vs[0]).assertEqual('你好');
      }

      // --- [3] Verify values returns emoji surrogate pair value ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        let value: string = '😀';
        cache.put(1, value);
        expect(cache.values()[0]).assertEqual(value);
      }

      // --- [4] Verify values returns space character string value ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, ' ');
        let first: string = cache.values()[0];
        expect(first).assertEqual(' ');
      }

      // --- [5] Verify values returns full 10000 char string ---
      {
        let longVal: string = '';
        for (let i: int = 0; i < 10000; i++) {
          longVal += 'b';
        }
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, longVal);
        expect(cache.values()[0]).assertEqual(longVal);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0150
     * @tc.name testLruCacheValues015
     * @tc.desc Merged batch (5 tests): [1] Verify values returns boolean true value | [2] Verify values returns single character string value k | [3] Verify returned class element is same reference as put object ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values returns boolean true value ---
      {
        let cache: util.LRUCache<int, boolean> = new util.LRUCache<int, boolean>();
        cache.put(1, true);
        expect(cache.values()[0]).assertTrue();
      }

      // --- [2] Verify values returns single character string value k ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, 'k');
        let vs: Array<string> = cache.values();
        expect(vs[0]).assertEqual('k');
        expect(vs.length).assertEqual(1);
      }

      // --- [3] Verify returned class element is same reference as put object ---
      {
        let n: TaggedNode = new TaggedNode('n1');
        let cache: util.LRUCache<int, TaggedNode> = new util.LRUCache<int, TaggedNode>();
        cache.put(1, n);
        expect(cache.values()[0]).assertEqual(n);
      }

      // --- [4] Verify returned object literal element is same reference ---
      {
        let o: StrIdPair = { id: 'x' };
        let cache: util.LRUCache<int, StrIdPair> = new util.LRUCache<int, StrIdPair>();
        cache.put(1, o);
        expect(cache.values()[0]).assertEqual(o);
      }

      // --- [5] Verify returned reference-typed element is same reference as put ---
      {
        // V Date
        let d078: Date = new Date(2024, 5, 15);
        let cache078: util.LRUCache<int, Date> = new util.LRUCache<int, Date>();
        cache078.put(1, d078);
        expect(cache078.values()[0]).assertEqual(d078);

        // V RegExp
        let r079: RegExp = new RegExp('ab+c', 'g');
        let cache079: util.LRUCache<int, RegExp> = new util.LRUCache<int, RegExp>();
        cache079.put(1, r079);
        expect(cache079.values()[0]).assertEqual(r079);

        // V Map
        let m080: Map<string, int> = new Map<string, int>();
        m080.set('a', 1);
        let cache080: util.LRUCache<int, Map<string, int>> = new util.LRUCache<int, Map<string, int>>();
        cache080.put(1, m080);
        expect(cache080.values()[0]).assertEqual(m080);

        // V Set
        let s081: Set<int> = new Set<int>();
        s081.add(1);
        let cache081: util.LRUCache<int, Set<int>> = new util.LRUCache<int, Set<int>>();
        cache081.put(1, s081);
        expect(cache081.values()[0]).assertEqual(s081);

        // V Uint8Array
        let u082: Uint8Array = new Uint8Array([1, 2, 3]);
        let cache082: util.LRUCache<int, Uint8Array> = new util.LRUCache<int, Uint8Array>();
        cache082.put(1, u082);
        expect(cache082.values()[0]).assertEqual(u082);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0160
     * @tc.name testLruCacheValues016
     * @tc.desc Merged batch (5 tests): [1] Verify returned int array element is same reference as put object | [2] Verify single key cache values array holds that value and its length matches cache length | [3] V...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify returned int array element is same reference as put object ---
      {
        let a: int[] = [1, 2, 3];
        let cache: util.LRUCache<int, int[]> = new util.LRUCache<int, int[]>();
        cache.put(1, a);
        expect(cache.values()[0]).assertEqual(a);
      }

      // --- [2] Verify single key cache values array holds that value and its length matches cache length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let vs: int[] = cache.values();
        expect(vs[0]).assertEqual(10);
        expect(vs.length).assertEqual(cache.length);
      }

      // --- [3] Verify three keys values array length 3 with the tail element being the last value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let vs: int[] = cache.values();
        expect(vs.length).assertEqual(3);
        expect(vs[2]).assertEqual(30);
      }

      // --- [4] Verify put overwrite same key keeps values length 1 ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(1, 30);
        expect(cache.values().length).assertEqual(1);
      }

      // --- [5] Verify put new key increments values length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let before: int = cache.values().length;
        cache.put(2, 20);
        expect(before).assertEqual(1);
        expect(cache.values().length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0170
     * @tc.name testLruCacheValues017
     * @tc.desc Merged batch (5 tests): [1] Verify remove decreases values length | [2] Verify eviction keeps values length no more than capacity | [3] Verify push on returned array does not affect cache | [4] Ver...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove decreases values length ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.remove(1);
        expect(cache.values().length).assertEqual(1);
      }

      // --- [2] Verify eviction keeps values length no more than capacity ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        expect(cache.values().length).assertEqual(2);
      }

      // --- [3] Verify push on returned array does not affect cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let vals: Array<int> = cache.values();
        vals.push(99);
        expect(cache.values().length).assertEqual(1);
        expect(vals[1]).assertEqual(99);
      }

      // --- [4] Verify modifying returned array element does not affect cache get ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let vals: Array<int> = cache.values();
        vals[0] = 99;
        expect(cache.get(1)).assertEqual(10);
      }

      // --- [5] Verify reverse on returned array does not affect cache order ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let vals: Array<int> = cache.values();
        vals.reverse();
        expect(cache.values()[0]).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0180
     * @tc.name testLruCacheValues018
     * @tc.desc Merged batch (5 tests): [1] Verify zeroing returned array length does not affect cache | [2] Verify multiple values calls return consistent contents | [3] Verify get still returns correct value aft...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify zeroing returned array length does not affect cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let vals: Array<int> = cache.values();
        vals.length = 0;
        expect(cache.values().length).assertEqual(2);
      }

      // --- [2] Verify multiple values calls return consistent contents ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let first: Array<int> = cache.values();
        let second: Array<int> = cache.values();
        expect(first[0]).assertEqual(second[0]);
        expect(first[1]).assertEqual(second[1]);
      }

      // --- [3] Verify get still returns correct value after values call ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.values();
        expect(cache.get(1)).assertEqual(10);
      }

      // --- [4] Verify put after values call reflected by later values ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.values();
        cache.put(2, 20);
        expect(cache.values().length).assertEqual(2);
        expect(cache.values()[1]).assertEqual(20);
      }

      // --- [5] Verify remove after values call still yields correct remaining value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.values();
        cache.remove(1);
        expect(cache.values()[0]).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0190
     * @tc.name testLruCacheValues019
     * @tc.desc Merged batch (5 tests): [1] Verify clear after values call empties later values | [2] Verify empty cache values returns an Array instance | [3] Verify earlier returned array keeps old content after...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify clear after values call empties later values ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.values();
        cache.clear();
        expect(cache.values().length).assertEqual(0);
        expect(cache.isEmpty()).assertTrue();
      }

      // --- [2] Verify empty cache values returns an Array instance ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        expect(cache.values() instanceof Array).assertTrue();
        expect(cache.values().length).assertEqual(0);
      }

      // --- [3] Verify earlier returned array keeps old content after put snapshot ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let before: Array<int> = cache.values();
        cache.put(2, 20);
        expect(before.length).assertEqual(1);
        expect(before[0]).assertEqual(10);
      }

      // --- [4] Verify earlier returned array keeps old content after remove snapshot ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let before: Array<int> = cache.values();
        cache.remove(2);
        expect(before.length).assertEqual(2);
        expect(before[1]).assertEqual(20);
      }

      // --- [5] Verify values slice returns sub array ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let sub: Array<int> = cache.values().slice(0, 1);
        expect(sub.length).assertEqual(1);
        expect(sub[0]).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0200
     * @tc.name testLruCacheValues020
     * @tc.desc Merged batch (5 tests): [1] Verify values join('|') joins values into pipe-separated string | [2] Verify values indexOf locates value index | [3] Verify values includes detects existing value | [4]...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values join('|') joins values into pipe-separated string ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        expect(cache.values().join('|')).assertEqual('10|20');
      }

      // --- [2] Verify values indexOf locates value index ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        expect(cache.values().indexOf(20)).assertEqual(1);
      }

      // --- [3] Verify values includes detects existing value ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        expect(cache.values().includes(10)).assertTrue();
      }

      // --- [4] Verify values concat builds new array without affecting cache ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let merged: Array<int> = cache.values().concat([20, 30]);
        expect(merged[0]).assertEqual(10);
        expect(merged[2]).assertEqual(30);
        expect(cache.values().length).assertEqual(1);
      }

      // --- [5] Verify values map transforms without modifying cache values ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        let doubled: Array<int> = cache.values().map((v: int) => v * 2);
        expect(doubled[0]).assertEqual(20);
        expect(cache.get(1)).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0210
     * @tc.name testLruCacheValues021
     * @tc.desc Merged batch (5 tests): [1] Verify two values calls return distinct array objects | [2] Verify returned element shares reference and mutation visible via cache | [3] Verify out-of-range values inde...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two values calls return distinct array objects ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let firstValues: Array<int> = cache.values();
        cache.put(2, 20);
        let secondValues: Array<int> = cache.values();
        expect(firstValues.indexOf(20)).assertEqual(-1);
        expect(secondValues.indexOf(20)).assertEqual(1);
      }

      // --- [2] Verify returned element shares reference and mutation visible via cache ---
      {
        let n: TaggedNode = new TaggedNode('a');
        let cache: util.LRUCache<int, TaggedNode> = new util.LRUCache<int, TaggedNode>();
        cache.put(1, n);
        let vals: Array<TaggedNode> = cache.values();
        vals[0].tag = 'z';
        expect(n.tag).assertEqual('z');
        expect(cache.get(1)).assertEqual(n);
      }

      // --- [3] Verify out-of-range values index read throws RangeError and cache is unaffected ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        let vals: Array<int> = cache.values();
        let beyond: int = -1;
        try {
          beyond = vals[5];
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
          expect(e.code).assertEqual(0);
        }
        expect(beyond).assertEqual(-1);
        expect(cache.values().length).assertEqual(1);
      }

      // --- [4] Verify various K-V type combinations return value ---
      {
        // K string, V long
        let lv111: long = 789;
        let cache111: util.LRUCache<string, long> = new util.LRUCache<string, long>();
        cache111.put('k1', lv111);
        expect(cache111.values()[0]).assertEqual(lv111);

        // K boolean, V double
        let cache112: util.LRUCache<boolean, double> = new util.LRUCache<boolean, double>();
        cache112.put(true, 0.75);
        expect(cache112.values()[0]).assertEqual(0.75);

        // K Date, V string
        let d113: Date = new Date(2024, 5, 15);
        let cache113: util.LRUCache<Date, string> = new util.LRUCache<Date, string>();
        cache113.put(d113, 'q');
        expect(cache113.values()[0]).assertEqual('q');

        // K long, V boolean
        let cache114: util.LRUCache<long, boolean> = new util.LRUCache<long, boolean>();
        cache114.put(123, false);
        expect(cache114.values()[0]).assertFalse();

        // K string, V int
        let cache115: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache115.put('k', 42);
        expect(cache115.values()[0]).assertEqual(42);

        // K IdKeyObj, V string
        let ok116: IdKeyObj = { id: 7 };
        let cache116: util.LRUCache<IdKeyObj, string> = new util.LRUCache<IdKeyObj, string>();
        cache116.put(ok116, 'obj');
        expect(cache116.values()[0]).assertEqual('obj');
      }

      // --- [5] Verify values order equals entries second-element order after removal and add ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        cache.remove(2);
        cache.put(4, 40);
        let varr: int[] = cache.values();
        let earr: Array<[int, int]> = Array.from(cache.entries());
        expect(varr.length).assertEqual(earr.length);
        expect(varr[0]).assertEqual(10);
        expect(varr[1]).assertEqual(30);
        expect(varr[2]).assertEqual(40);
        for (let i: int = 0; i < varr.length; i++) {
          expect(varr[i]).assertEqual(earr[i][1]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0220
     * @tc.name testLruCacheValues022
     * @tc.desc Merged batch (5 tests): [1] Verify values holds mixed string and double values and indexOf finds each | [2] Verify values array assertDeepEquals matches expected value sequence | [3] Verify put ove...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values holds mixed string and double values and indexOf finds each ---
      {
        let cache: util.LRUCache<int, string | double> = new util.LRUCache<int, string | double>();
        cache.put(1, 'a');
        cache.put(2, 5);
        let vs: Array<string | double> = cache.values();
        expect(vs.length).assertEqual(2);
        expect(typeof vs[0]).assertEqual('string');
        expect(typeof vs[1]).assertEqual('number');
        expect(vs.indexOf('a')).assertEqual(0);
        expect(vs.indexOf(5)).assertEqual(1);
      }

      // --- [2] Verify values array assertDeepEquals matches expected value sequence ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        cache.put(1, 10);
        cache.put(2, 20);
        cache.put(3, 30);
        let valueArray: int[] = cache.values();
        expect(valueArray).assertDeepEquals([10, 20, 30]);
      }

      // --- [3] Verify put overwrite middle key moves its value to array tail ---
      {
        let pro: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        pro.put(1, 'A');
        pro.put(2, 'B');
        pro.put(3, 'C');
        pro.put(2, 'X');
        let vs: Array<string> = pro.values();
        expect(vs[0]).assertEqual('A');
        expect(vs[1]).assertEqual('C');
        expect(vs[2]).assertEqual('X');
      }

      // --- [4] Verify values() shows only the overwriting value once a key written via int overflow (INT_MAX + 1) aliases the stored literal INT_MIN key ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        let mx: int = 2147483647;
        let wrappedUp: int = mx + 1;
        cache.put(-2147483648, 11);
        cache.put(wrappedUp, 22);
        let vs: Array<int> = cache.values();
        expect(vs.length).assertEqual(1);
        expect(vs[0]).assertEqual(22);
      }

      // --- [5] Verify values returns enum member values in insertion order ---
      {
        let cache: util.LRUCache<int, ValSlot> = new util.LRUCache<int, ValSlot>();
        cache.put(1, ValSlot.Low);
        cache.put(2, ValSlot.High);
        let vs: ValSlot[] = cache.values();
        expect(vs.length).assertEqual(2);
        expect(vs[0]).assertEqual(ValSlot.Low);
        expect(vs[1]).assertEqual(ValSlot.High);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_VALUES_0230
     * @tc.name testLruCacheValues023
     * @tc.desc Merged batch (4 tests): [1] Verify values returns the maximum BMP character 0xFFFF string value with length 1 | [2] Verify values after a grow then shrink returns only the retained values | [3] Ver...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values returns the maximum BMP character 0xFFFF string value with length 1 ---
      {
        let cache: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        cache.put(1, '\uFFFF');
        cache.put(2, 'plain');
        let vs: string[] = cache.values();
        expect(vs.length).assertEqual(2);
        expect(vs[0]).assertEqual('\uFFFF');
        expect(vs[0].length).assertEqual(1);
        expect(vs[1]).assertEqual('plain');
      }

      // --- [2] Verify values after a grow then shrink returns only the retained values ---
      {
        let cache: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cache.put(1, 10);
        cache.put(2, 20);
        cache.updateCapacity(4);
        cache.put(3, 30);
        cache.updateCapacity(2);
        let vs: int[] = cache.values();
        expect(vs.length).assertEqual(2);
        expect(vs[0]).assertEqual(20);
        expect(vs[1]).assertEqual(30);
      }

      // --- [3] Verify values returns the stored LRUCache instances themselves as live references ---
      {
        let alpha: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        let beta: util.LRUCache<int, int> = new util.LRUCache<int, int>(6);
        let outer: util.LRUCache<int, util.LRUCache<int, int>> = new util.LRUCache<int, util.LRUCache<int, int>>(4);
        outer.put(1, alpha);
        outer.put(2, beta);
        let result: Array<util.LRUCache<int, int>> = outer.values();
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(alpha);
        expect(result[1]).assertEqual(beta);
        expect(result[0].isEmpty()).assertTrue();
        expect(result[1].length).assertEqual(0);
        alpha.put(9, 99);
        expect(result[0].isEmpty()).assertFalse();
      }

      // --- [4] Verify values keeps the runtime cache kind and string kind of a union valued cache ---
      {
        let mixed: util.LRUCache<int, util.LRUCache<int, int> | string> =
          new util.LRUCache<int, util.LRUCache<int, int> | string>(3);
        let nested: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        nested.put(1, 1);
        mixed.put(1, nested);
        mixed.put(2, 'plain');
        let out: Array<util.LRUCache<int, int> | string> = mixed.values();
        expect(out.length).assertEqual(2);
        expect(out[0] instanceof util.LRUCache).assertTrue();
        expect(out[1] instanceof util.LRUCache).assertFalse();
      }
    });

  });
}
