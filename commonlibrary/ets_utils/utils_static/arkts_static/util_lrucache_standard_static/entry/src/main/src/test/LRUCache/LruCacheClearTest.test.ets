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

class ProbeCache<K, V> extends util.LRUCache<K, V> {
  hook: (cache: util.LRUCache<K, V>, isEvict: boolean, key: K, value: V,
         newValue: V | undefined) => void =
    (cache: util.LRUCache<K, V>, isEvict: boolean, key: K, value: V, newValue: V | undefined) => {};
  make: (key: K) => V | undefined = (key: K) => undefined;

  constructor(hook?: (cache: util.LRUCache<K, V>, isEvict: boolean, key: K, value: V,
                              newValue: V | undefined) => void,
              make?: (key: K) => V | undefined, capacity?: int) {
    super(capacity);
    if (hook !== undefined) {
      this.hook = hook;
    }
    if (make !== undefined) {
      this.make = make;
    }
  }

  createDefault(key: K): V | undefined {
    return this.make(key);
  }

  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V | undefined): void {
    this.hook(this, isEvict, key, value, newValue);
  }
}

class TestClass {
  value: int = 0;
  constructor(v: int) {
    this.value = v;
  }
}

interface Entry {
  name: string;
  value: int;
}

class EntryValue {
  label: string = '';
  num: int = 0;
  constructor(label: string, num: int) {
    this.label = label;
    this.num = num;
  }
}

class ClearCallbackCache extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  callbackCount: int = 0;
  lastIsEvict: boolean = false;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.callbackCount = this.callbackCount + 1;
    this.lastIsEvict = isEvict;
  }
}

class CaptureClearCache extends util.LRUCache<string, string> {
  constructor(capacity?: int) {
    super(capacity);
  }
  capturedKeys: string[] = [];
  capturedValues: string[] = [];
  lastIsEvict: boolean = false;
  afterRemoval(isEvict: boolean, key: string, value: string, newValue: string | undefined): void {
    this.lastIsEvict = isEvict;
    this.capturedKeys.push(key);
    this.capturedValues.push(value);
  }
}

class ThrowClearCache extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    throw new Error('clear-callback-throw');
  }
}

class ReturnUndefCache extends util.LRUCache<int, int> {
  constructor(capacity?: int) {
    super(capacity);
  }
  returnCount: int = 0;
  afterRemoval(isEvict: boolean, key: int, value: int, newValue: int | undefined): void {
    this.returnCount = this.returnCount + 1;
    return;
  }
}

class TestValue {
  label: string = '';
  constructor(input: string) {
    this.label = input;
  }
}

class CycleValue {
  tag: int;
  self: Object;
  constructor(tag: int) {
    this.tag = tag;
    this.self = this;
  }
}

export default function lruCacheClearTest(): void {
  describe('LruCacheClearTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0010
     * @tc.name testLruCacheClear001
     * @tc.desc Merged batch (5 tests): [1] Verify clear on empty cache keeps length at zero | [2] Verify cache is immediately reusable with put and get after clear | [3] Verify length equals keys array length aft...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify clear on empty cache keeps length at zero ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [2] Verify cache is immediately reusable with put and get after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.clear();
        lru.put(9, 900);
        expect(lru.get(9)).assertEqual(900);
      }

      // --- [3] Verify length equals keys array length after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(5, 50);
        lru.clear();
        let ks: int[] = lru.keys();
        expect(ks.length).assertEqual(lru.length);
      }

      // --- [4] Verify repeated clear second call has no side effect ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.clear();
        lru.clear();
        expect(lru.length).assertEqual(0);
        expect(lru.getCapacity()).assertEqual(64);
      }

      // --- [5] Verify three consecutive clears on empty cache are idempotent ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.clear();
        lru.clear();
        lru.clear();
        expect(lru.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0020
     * @tc.name testLruCacheClear002
     * @tc.desc Merged batch (5 tests): [1] Verify clear works on cache containing zero key and zero value | [2] Verify cache still usable when clear and updateCapacity alternate | [3] Verify cache is empty after ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify clear works on cache containing zero key and zero value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(0, 1);
        lru.put(1, 0);
        lru.clear();
        expect(lru.length).assertEqual(0);
        expect(lru.contains(0)).assertFalse();
      }

      // --- [2] Verify cache still usable when clear and updateCapacity alternate ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.clear();
        lru.updateCapacity(5);
        lru.put(2, 200);
        expect(lru.get(2)).assertEqual(200);
      }

      // --- [3] Verify cache is empty after loop of put then clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 4; i++) {
          lru.put(i, i * 10);
          lru.clear();
        }
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [4] Verify string two entry cache clear triggers callback twice ---
      {
        let removalCount: int = 0;
        let lru: ProbeCache<string, string> = new ProbeCache<string, string>(
          (self: util.LRUCache<string, string>, isEvict: boolean, key: string, value: string, newValue: string | undefined) => {
            removalCount = removalCount + 1;
          });
        lru.put('a', 'A');
        lru.put('b', 'B');
        lru.clear();
        expect(removalCount).assertEqual(2);
      }

      // --- [5] Verify int min key contains false after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(-2147483648, 2);
        lru.clear();
        expect(lru.contains(-2147483648)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0030
     * @tc.name testLruCacheClear003
     * @tc.desc Merged batch (5 tests): [1] Verify long max boundary key overwritten then cleared leaves cache empty | [2] Verify cache refillable to capacity after clear | [3] Verify put count is not reset by cle...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify long max boundary key overwritten then cleared leaves cache empty ---
      {
        let lru: util.LRUCache<long, long> = new util.LRUCache<long, long>();
        lru.put(9223372036854775807, 1);
        lru.put(9223372036854775807, 2);
        expect(lru.length).assertEqual(1);
        lru.clear();
        expect(lru.keys().length).assertEqual(0);
      }

      // --- [2] Verify cache refillable to capacity after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.clear();
        lru.put(4, 400);
        lru.put(5, 500);
        lru.put(6, 600);
        expect(lru.length).assertEqual(3);
        expect(lru.get(4)).assertEqual(400);
        expect(lru.get(6)).assertEqual(600);
      }

      // --- [3] Verify put count is not reset by clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.clear();
        expect(lru.getPutCount()).assertEqual(2);
      }

      // --- [4] Verify miss count keeps historical statistics after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.get(99);
        lru.clear();
        expect(lru.getMissCount()).assertEqual(1);
      }

      // --- [5] Verify new inserts after clear evict in new order at full capacity ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        lru.put(1, 100);
        lru.put(2, 200);
        lru.clear();
        lru.put(3, 300);
        lru.put(4, 400);
        lru.put(5, 500);
        expect(lru.contains(3)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0040
     * @tc.name testLruCacheClear004
     * @tc.desc Merged batch (5 tests): [1] Verify same-typed key-value cache length zeroes after clear | [2] Verify int string mixed cache keys empty after clear | [3] Verify three loop inserted double key entrie...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify same-typed key-value cache length zeroes after clear ---
      {
        // string, string
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('a', 'A');
        lru.put('b', 'B');
        lru.clear();
        expect(lru.length).assertEqual(0);

        // boolean, boolean
        let lruBool: util.LRUCache<boolean, boolean> = new util.LRUCache<boolean, boolean>();
        lruBool.put(true, false);
        lruBool.clear();
        expect(lruBool.length).assertEqual(0);

        // byte, byte
        let lruByte: util.LRUCache<byte, byte> = new util.LRUCache<byte, byte>();
        let b: byte = 5;
        lruByte.put(b, b);
        lruByte.clear();
        expect(lruByte.length).assertEqual(0);

        // float, float
        let lruFloat: util.LRUCache<float, float> = new util.LRUCache<float, float>();
        let f: float = 2.5 as float;
        lruFloat.put(f, f);
        lruFloat.clear();
        expect(lruFloat.length).assertEqual(0);

        // Error, Error
        let lruErr: util.LRUCache<Error, Error> = new util.LRUCache<Error, Error>();
        let e1: Error = new Error('err');
        lruErr.put(e1, e1);
        lruErr.clear();
        expect(lruErr.length).assertEqual(0);
      }

      // --- [2] Verify int string mixed cache keys empty after clear ---
      {
        let lru: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        lru.put(1, 'A');
        lru.put(2, 'B');
        lru.clear();
        let ks: int[] = lru.keys();
        expect(ks.length).assertEqual(0);
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [3] Verify three loop inserted double key entries cleared leave cache empty ---
      {
        let lru: util.LRUCache<double, double> = new util.LRUCache<double, double>();
        for (let i: int = 0; i < 3; i++) {
          lru.put(i + 0.5, i + 1.5);
        }
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [4] Verify single character string cache contains original key false after clear ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        let c: string = 'x';
        lru.put(c, c);
        lru.clear();
        expect(lru.contains(c)).assertFalse();
      }

      // --- [5] Verify short short cache read then cleared is empty ---
      {
        let lru: util.LRUCache<short, short> = new util.LRUCache<short, short>();
        let s: short = 3;
        lru.put(s, s);
        expect(lru.get(s)).assertEqual(3);
        lru.clear();
        expect(lru.get(s)).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0050
     * @tc.name testLruCacheClear005
     * @tc.desc Merged batch (5 tests): [1] Verify bigint bigint cache hasKey false after clear | [2] Verify same millisecond Date key value cache length zeroes after clear | [3] Verify two same pattern RegExp ins...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify bigint bigint cache hasKey false after clear ---
      {
        let lru: util.LRUCache<bigint, bigint> = new util.LRUCache<bigint, bigint>();
        let bi: bigint = 100n;
        lru.put(bi, bi);
        lru.clear();
        expect(lru.contains(bi)).assertFalse();
      }

      // --- [2] Verify same millisecond Date key value cache length zeroes after clear ---
      {
        let lru: util.LRUCache<Date, Date> = new util.LRUCache<Date, Date>();
        let d1: Date = new Date(2020, 0, 1);
        let d2: Date = new Date(2020, 0, 1);
        lru.put(d1, d2);
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [3] Verify two same pattern RegExp instances cleared leave cache empty ---
      {
        let lru: util.LRUCache<RegExp, RegExp> = new util.LRUCache<RegExp, RegExp>();
        let r1: RegExp = new RegExp("ab", "g");
        let r2: RegExp = new RegExp("ab", "g");
        lru.put(r1, r1);
        lru.put(r2, r2);
        lru.clear();
        expect(lru.contains(r1)).assertFalse();
      }

      // --- [4] Verify class instance cache contains false after clear ---
      {
        let lru: util.LRUCache<TestClass, TestClass> = new util.LRUCache<TestClass, TestClass>();
        let t1: TestClass = new TestClass(1);
        let t2: TestClass = new TestClass(2);
        lru.put(t1, t2);
        lru.clear();
        expect(lru.contains(t1)).assertFalse();
      }

      // --- [5] Verify int array value cache length zeroes after clear ---
      {
        let lru: util.LRUCache<string, int[]> = new util.LRUCache<string, int[]>();
        let arr: int[] = [1, 2, 3];
        lru.put('a', arr);
        lru.clear();
        expect(lru.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0060
     * @tc.name testLruCacheClear006
     * @tc.desc Merged batch (5 tests): [1] Verify Map value cache two entries cleared leave cache empty | [2] Verify Set value cache length zeroes after clear | [3] Verify Uint8Array value cache contains false af...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Map value cache two entries cleared leave cache empty ---
      {
        let lru: util.LRUCache<string, Map<string, int>> = new util.LRUCache<string, Map<string, int>>();
        let m1: Map<string, int> = new Map<string, int>();
        m1.set("k", 1);
        let m2: Map<string, int> = new Map<string, int>();
        m2.set("k", 2);
        lru.put("a", m1);
        lru.put("b", m2);
        lru.clear();
        expect(lru.values().length).assertEqual(0);
      }

      // --- [2] Verify Set value cache length zeroes after clear ---
      {
        let lru: util.LRUCache<string, Set<string>> = new util.LRUCache<string, Set<string>>();
        let st: Set<string> = new Set<string>();
        lru.put('a', st);
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [3] Verify Uint8Array value cache contains false after clear ---
      {
        let lru: util.LRUCache<string, Uint8Array> = new util.LRUCache<string, Uint8Array>();
        let u8: Uint8Array = new Uint8Array([1, 2, 3]);
        lru.put('a', u8);
        lru.clear();
        expect(lru.contains('a')).assertFalse();
      }

      // --- [4] Verify interface object literal value cache length zeroes after clear ---
      {
        let lru: util.LRUCache<int, Entry> = new util.LRUCache<int, Entry>();
        let o: Entry = { name: 'a', value: 1 };
        lru.put(1, o);
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [5] Verify string long mixed cache values empty array after clear ---
      {
        let lru: util.LRUCache<string, long> = new util.LRUCache<string, long>();
        lru.put('a', 100);
        lru.clear();
        let vs: long[] = lru.values();
        expect(vs.length).assertEqual(0);
        expect(lru.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0070
     * @tc.name testLruCacheClear007
     * @tc.desc Merged batch (5 tests): [1] Verify Date key string value mixed cache length zeroes after clear | [2] Verify keys return value is an Array instance after clear | [3] Verify values return value is an...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Date key string value mixed cache length zeroes after clear ---
      {
        let lru: util.LRUCache<Date, string> = new util.LRUCache<Date, string>();
        let d: Date = new Date(2021, 5, 15);
        lru.put(d, 'x');
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [2] Verify keys return value is an Array instance after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(7, 700);
        lru.clear();
        expect(lru.keys() instanceof Array).assertTrue();
        expect(lru.keys().length).assertEqual(0);
      }

      // --- [3] Verify values return value is an Array instance after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(8, 800);
        lru.clear();
        expect(lru.values() instanceof Array).assertTrue();
        expect(lru.values().length).assertEqual(0);
      }

      // --- [4] Verify single entry string cache isEmpty returns true after clear ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('a', 'A');
        lru.clear();
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [5] Verify entries iterator first next is done after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(61, 610);
        lru.put(62, 620);
        lru.clear();
        expect(lru.entries().next().done).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0080
     * @tc.name testLruCacheClear008
     * @tc.desc Merged batch (5 tests): [1] Verify iterator first next is done after clear | [2] Verify capacity five full cache length zeroes after clear | [3] Verify capacity one full entry evicted cache length ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterator first next is done after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(71, 710);
        lru.put(72, 720);
        lru.put(73, 730);
        lru.clear();
        expect(lru.$_iterator().next().done).assertTrue();
      }

      // --- [2] Verify capacity five full cache length zeroes after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.put(4, 400);
        lru.put(5, 500);
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [3] Verify capacity one full entry evicted cache length zeroes after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        lru.put(6, 60);
        lru.put(7, 70);
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [4] Verify long type long entry cache length zeroes after clear ---
      {
        let lru: util.LRUCache<long, long> = new util.LRUCache<long, long>();
        let k1: long = 3;
        let v1: long = 30;
        let k2: long = 5;
        let v2: long = 50;
        lru.put(k1, v1);
        lru.put(k2, v2);
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [5] Verify original object state synchronized empty through alias reference ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        let alias: util.LRUCache<int, int> = lru;
        alias.clear();
        expect(lru.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0090
     * @tc.name testLruCacheClear009
     * @tc.desc Merged batch (5 tests): [1] Verify external class instance value object field is not modified after clear | [2] Verify clear discards entries built by createDefault so the next miss rebuilds with a...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify external class instance value object field is not modified after clear ---
      {
        let ev: EntryValue = new EntryValue('tag', 7);
        let lru: util.LRUCache<int, EntryValue> = new util.LRUCache<int, EntryValue>();
        lru.put(1, ev);
        lru.clear();
        expect(ev.num).assertEqual(7);
      }

      // --- [2] Verify clear discards entries built by createDefault so the next miss rebuilds with a fresh value ---
      {
        let seq: int = 0;
        let lru: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined, (key: int) => {
            seq = seq + 1;
            return seq * 100;
          });
        expect(lru.get(2)).assertEqual(100);
        expect(lru.get(3)).assertEqual(200);
        lru.clear();
        expect(lru.get(2)).assertEqual(300);
      }

      // --- [3] Verify clear keeps the separate miss and match tallies advancing on later get calls ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(7, 70);
        lru.get(7);
        lru.get(70);
        lru.get(71);
        lru.clear();
        lru.get(72);
        lru.put(8, 80);
        lru.get(8);
        expect(lru.getMissCount()).assertEqual(3);
        expect(lru.getMatchCount()).assertEqual(2);
      }

      // --- [4] Verify clear does not reset match count after two hits ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(24, 240);
        lru.get(24);
        lru.put(25, 250);
        lru.get(25);
        lru.clear();
        expect(lru.getMatchCount()).assertEqual(2);
      }

      // --- [5] Verify clear does not reset create count after one createDefault ---
      {
        let lru: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => key);
        lru.put(1, 100);
        lru.get(8);
        lru.clear();
        expect(lru.getCreateCount()).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0100
     * @tc.name testLruCacheClear010
     * @tc.desc Merged batch (5 tests): [1] Verify external array value object length stays unchanged after clear | [2] Verify isEmpty turns false after re-put following clear | [3] Verify remove original key retu...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify external array value object length stays unchanged after clear ---
      {
        let arr: int[] = [1, 2, 3];
        let lru: util.LRUCache<string, int[]> = new util.LRUCache<string, int[]>();
        lru.put('a', arr);
        lru.clear();
        expect(arr.length).assertEqual(3);
      }

      // --- [2] Verify isEmpty turns false after re-put following clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(5, 50);
        lru.clear();
        expect(lru.isEmpty()).assertTrue();
        lru.put(6, 60);
        expect(lru.isEmpty()).assertFalse();
      }

      // --- [3] Verify remove original key returns undefined without throwing after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(8, 80);
        lru.clear();
        expect(lru.remove(8)).assertEqual(undefined);
      }

      // --- [4] Verify contains original key false then true after re-put ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('k', 'v');
        lru.clear();
        expect(lru.contains('k')).assertFalse();
        lru.put('k', 'v2');
        expect(lru.contains('k')).assertTrue();
      }

      // --- [5] Verify refilled entries iterate in new insertion order after clear ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('a', 'A');
        lru.clear();
        lru.put('x', 'X');
        lru.put('y', 'Y');
        let first: [string, string] | undefined = lru.entries().next().value;
        expect(first![0]).assertEqual('x');
        expect(first![1]).assertEqual('X');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0110
     * @tc.name testLruCacheClear011
     * @tc.desc Merged batch (5 tests): [1] Verify put new key readable after clear on empty cache | [2] Verify two clear put rounds end with zero length and writable again | [3] Verify string cache keys array len...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify put new key readable after clear on empty cache ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.clear();
        lru.put(11, 110);
        expect(lru.get(11)).assertEqual(110);
      }

      // --- [2] Verify two clear put rounds end with zero length and writable again ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 10);
        lru.clear();
        lru.put(2, 20);
        lru.clear();
        expect(lru.length).assertEqual(0);
        lru.put(3, 30);
        expect(lru.get(3)).assertEqual(30);
      }

      // --- [3] Verify string cache keys array length consistent with length after clear ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('a', 'A');
        lru.put('b', 'B');
        lru.clear();
        let ks: string[] = lru.keys();
        expect(ks.length).assertEqual(lru.length);
      }

      // --- [4] Verify int cache values array length consistent with length after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(3, 300);
        lru.put(4, 400);
        lru.clear();
        let vs: int[] = lru.values();
        expect(vs.length).assertEqual(lru.length);
      }

      // --- [5] Verify contains original key false consistent with isEmpty true after clear of a cache that already evicted ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        lru.put(6, 600);
        lru.put(7, 700);
        lru.put(8, 800);
        lru.clear();
        expect(lru.contains(6)).assertFalse();
        expect(lru.contains(8)).assertFalse();
        expect(lru.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0120
     * @tc.name testLruCacheClear012
     * @tc.desc Merged batch (5 tests): [1] Verify entries iterator done consistent with length zero after clear | [2] Verify length zero consistent with values still an Array instance after clear | [3] Verify cac...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries iterator done consistent with length zero after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(7, 700);
        lru.put(8, 800);
        lru.clear();
        expect(lru.entries().next().done).assertTrue();
        expect(lru.length).assertEqual(0);
      }

      // --- [2] Verify length zero consistent with values still an Array instance after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(9, 900);
        lru.clear();
        expect(lru.length).assertEqual(0);
        expect(lru.values() instanceof Array).assertTrue();
      }

      // --- [3] Verify cache with negative keys length zeroes after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(-1, 10);
        lru.put(-2, 20);
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [4] Verify cache with empty string key length zeroes after clear ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('', 'empty');
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [5] Verify capacity sixteen filled and cleared cache getCapacity stays sixteen ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(16);
        for (let i: int = 0; i < 16; i++) {
          lru.put(i, i * 5);
        }
        lru.clear();
        expect(lru.getCapacity()).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0130
     * @tc.name testLruCacheClear013
     * @tc.desc Merged batch (5 tests): [1] Verify long max key cache length zeroes after clear | [2] Verify double max value key cache length zeroes after clear | [3] Verify negative zero double key cache length ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify long max key cache length zeroes after clear ---
      {
        let lru: util.LRUCache<long, long> = new util.LRUCache<long, long>();
        lru.put(9223372036854775807, 1);
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [2] Verify double max value key cache length zeroes after clear ---
      {
        let lru: util.LRUCache<double, double> = new util.LRUCache<double, double>();
        lru.put(Number.MAX_VALUE, 1.5);
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [3] Verify negative zero double key cache length zeroes after clear ---
      {
        let lru: util.LRUCache<double, double> = new util.LRUCache<double, double>();
        lru.put(-0.0, 2.5);
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [4] Verify big capacity one hundred insert cache length one hundred then empty after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(1000);
        for (let i: int = 0; i < 100; i++) {
          lru.put(i, i * 3);
        }
        expect(lru.length).assertEqual(100);
        lru.clear();
        expect(lru.keys().length).assertEqual(0);
      }

      // --- [5] Verify capacity seven refilled to seven entries length is seven after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(7);
        for (let i: int = 1; i <= 7; i++) {
          lru.put(i, i * 100);
        }
        lru.clear();
        for (let i: int = 1; i <= 7; i++) {
          lru.put(i, i * 200);
        }
        expect(lru.length).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0140
     * @tc.name testLruCacheClear014
     * @tc.desc Merged batch (5 tests): [1] Verify capacity one refilled single entry length is one after clear | [2] Verify three alternating string key boolean value entries cleared leave cache empty | [3] Verif...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify capacity one refilled single entry length is one after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        lru.put(1, 100);
        lru.clear();
        lru.put(2, 200);
        expect(lru.length).assertEqual(1);
      }

      // --- [2] Verify three alternating string key boolean value entries cleared leave cache empty ---
      {
        let lru: util.LRUCache<string, boolean> = new util.LRUCache<string, boolean>();
        let keys: string[] = ["a", "b", "c"];
        let flags: boolean[] = [true, false, true];
        for (let i: int = 0; i < keys.length; i++) {
          lru.put(keys[i], flags[i]);
        }
        lru.clear();
        expect(Array.from(lru.entries()).length).assertEqual(0);
      }

      // --- [3] Verify class instance key int value cache contains original instance false after clear ---
      {
        let ev: EntryValue = new EntryValue('g4', 1);
        let lru: util.LRUCache<EntryValue, int> = new util.LRUCache<EntryValue, int>();
        lru.put(ev, 5);
        lru.clear();
        expect(lru.contains(ev)).assertFalse();
      }

      // --- [4] Verify various key-value typed cache length zeroes after clear ---
      {
        // Date key, int value
        let dt: Date = new Date(2024, 0, 1);
        let lru: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        lru.put(dt, 7);
        lru.clear();
        expect(lru.length).assertEqual(0);

        // Map key, string value
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let lruMap: util.LRUCache<Map<string, int>, string> = new util.LRUCache<Map<string, int>, string>();
        lruMap.put(m, 'v');
        lruMap.clear();
        expect(lruMap.length).assertEqual(0);

        // float key, long value
        let lruFL: util.LRUCache<float, long> = new util.LRUCache<float, long>();
        let f: float = 2.5 as float;
        let lg: long = 7;
        lruFL.put(f, lg);
        lruFL.clear();
        expect(lruFL.length).assertEqual(0);

        // long key, string value
        let lruLS: util.LRUCache<long, string> = new util.LRUCache<long, string>();
        let lgLong: long = 6;
        lruLS.put(lgLong, 'v');
        lruLS.clear();
        expect(lruLS.length).assertEqual(0);

        // string key, int value
        let lruSI: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lruSI.put('aa', 5);
        lruSI.put('bb', 6);
        lruSI.clear();
        expect(lruSI.length).assertEqual(0);

        // int key, string value
        let lruIS: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        lruIS.put(1, 'one');
        lruIS.put(2, 'two');
        lruIS.clear();
        expect(lruIS.length).assertEqual(0);

        // boolean key, int value
        let lruBI: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        lruBI.put(true, 1);
        lruBI.put(false, 0);
        lruBI.clear();
        expect(lruBI.length).assertEqual(0);
      }

      // --- [5] Verify two Set keys of different size cleared leave cache empty ---
      {
        let lru: util.LRUCache<Set<string>, string> = new util.LRUCache<Set<string>, string>();
        let s1: Set<string> = new Set<string>();
        s1.add("x");
        let s2: Set<string> = new Set<string>();
        s2.add("x");
        s2.add("y");
        lru.put(s1, "v1");
        lru.put(s2, "v2");
        lru.clear();
        expect(lru.contains(s1)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0150
     * @tc.name testLruCacheClear015
     * @tc.desc Merged batch (5 tests): [1] Verify Error key string value cache contains original error false after clear | [2] Verify byte key short value cache isEmpty true after clear of two variable held entri...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Error key string value cache contains original error false after clear ---
      {
        let e: Error = new Error('boom');
        let lru: util.LRUCache<Error, string> = new util.LRUCache<Error, string>();
        lru.put(e, 'v');
        lru.clear();
        expect(lru.contains(e)).assertFalse();
      }

      // --- [2] Verify byte key short value cache isEmpty true after clear of two variable held entries ---
      {
        let lru: util.LRUCache<byte, short> = new util.LRUCache<byte, short>();
        let b1: byte = 5;
        let v1: short = 3;
        let b2: byte = 6;
        let v2: short = 4;
        lru.put(b1, v1);
        lru.put(b2, v2);
        lru.clear();
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [3] Verify bigint key string value cache cleared leaves cache empty after remove and re-put ---
      {
        let lru: util.LRUCache<bigint, string> = new util.LRUCache<bigint, string>();
        let bi: bigint = 9n;
        lru.put(bi, "v");
        lru.remove(bi);
        lru.put(bi, "w");
        lru.clear();
        expect(lru.get(bi)).assertEqual(undefined);
      }

      // --- [4] Verify a record literal key cache loses that key after clear leaves cache empty ---
      {
        let meta: Record<string, int> = { 'a': 1 };
        let lru: util.LRUCache<Record<string, int>, string> = new util.LRUCache<Record<string, int>, string>();
        lru.put(meta, 'meta');
        expect(lru.contains(meta)).assertTrue();
        lru.clear();
        expect(lru.contains(meta)).assertFalse();
        expect(lru.length).assertEqual(0);
      }

      // --- [5] Verify a surrogate pair emoji key and its suffixed variant are two distinct keys both removed by clear ---
      {
        let emoji: string = '😀';
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put(emoji, 1);
        lru.put(emoji + '!', 2);
        expect(emoji.length).assertEqual(2);
        expect(lru.length).assertEqual(2);
        lru.clear();
        expect(lru.length).assertEqual(0);
        expect(lru.contains(emoji)).assertFalse();
        expect(lru.contains(emoji + '!')).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0160
     * @tc.name testLruCacheClear016
     * @tc.desc Merged batch (5 tests): [1] Verify two class instance keys with same field different references both false after clear | [2] Verify three element clear isEmpty true and length zero together | [3] V...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two class instance keys with same field different references both false after clear ---
      {
        let a: EntryValue = new EntryValue('same', 1);
        let b: EntryValue = new EntryValue('same', 1);
        let lru: util.LRUCache<EntryValue, EntryValue> = new util.LRUCache<EntryValue, EntryValue>();
        lru.put(a, a);
        lru.put(b, b);
        lru.clear();
        expect(lru.contains(a)).assertFalse();
        expect(lru.contains(b)).assertFalse();
      }

      // --- [2] Verify three element clear isEmpty true and length zero together ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.clear();
        expect(lru.isEmpty()).assertTrue();
        expect(lru.length).assertEqual(0);
      }

      // --- [3] Verify two clears on empty cache have no side effect ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.clear();
        lru.clear();
        expect(lru.length).assertEqual(0);
        expect(lru.entries().next().done).assertTrue();
      }

      // --- [4] Verify empty cache clear keeps removal count zero ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.clear();
        expect(lru.getRemovalCount()).assertEqual(0);
      }

      // --- [5] Verify empty cache clear contains arbitrary key false ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.clear();
        expect(lru.contains(7)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0170
     * @tc.name testLruCacheClear017
     * @tc.desc Merged batch (5 tests): [1] Verify single element clear triggers afterRemoval exactly once | [2] Verify all same key overwrite clear zeroes length | [3] Verify all same key overwrite clear contains...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify single element clear triggers afterRemoval exactly once ---
      {
        let lru: ClearCallbackCache = new ClearCallbackCache();
        lru.put(5, 50);
        lru.clear();
        expect(lru.callbackCount).assertEqual(1);
      }

      // --- [2] Verify all same key overwrite clear zeroes length ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(9, 100);
        lru.put(9, 200);
        lru.put(9, 300);
        lru.clear();
        expect(lru.length).assertEqual(0);
      }

      // --- [3] Verify all same key overwrite clear contains false ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(9, 100);
        lru.put(9, 999);
        lru.clear();
        expect(lru.contains(9)).assertFalse();
      }

      // --- [4] Verify overwrite then clear accumulates two removal callbacks ---
      {
        let lru: ClearCallbackCache = new ClearCallbackCache();
        lru.put(4, 40);
        lru.put(4, 40);
        lru.clear();
        expect(lru.callbackCount).assertEqual(2);
      }

      // --- [5] Verify int max capacity reached via updateCapacity is empty after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.updateCapacity(2147483647);
        lru.put(1, 100);
        lru.clear();
        expect(lru.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0180
     * @tc.name testLruCacheClear018
     * @tc.desc Merged batch (5 tests): [1] Verify overflow two entries then clear removes all | [2] Verify clearing a full 64-entry default cache triggers 64 removal callbacks | [3] Verify clear callback override...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overflow two entries then clear removes all ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.put(4, 400);
        lru.clear();
        expect(lru.length).assertEqual(0);
        expect(lru.contains(4)).assertFalse();
      }

      // --- [2] Verify clearing a full 64-entry default cache triggers 64 removal callbacks ---
      {
        let lru: ClearCallbackCache = new ClearCallbackCache();
        for (let i: int = 0; i < 64; i++) {
          lru.put(i, i * 10);
        }
        lru.clear();
        expect(lru.callbackCount).assertEqual(64);
      }

      // --- [3] Verify clear callback overrides previous eviction isEvict to false ---
      {
        let lru: ClearCallbackCache = new ClearCallbackCache(2);
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        lru.clear();
        expect(lru.lastIsEvict).assertFalse();
      }

      // --- [4] Verify clear callback key iterator captures all cleared keys ---
      {
        let lru: CaptureClearCache = new CaptureClearCache();
        lru.put('k1', 'v1');
        lru.put('k2', 'v2');
        lru.put('k3', 'v3');
        lru.clear();
        expect(lru.capturedKeys.length).assertEqual(3);
        expect(lru.capturedKeys.join(',')).assertEqual('k1,k2,k3');
      }

      // --- [5] Verify clear callback key iterator captures first key in insertion order ---
      {
        let lru: CaptureClearCache = new CaptureClearCache();
        lru.put('aa', 'AA');
        lru.put('bb', 'BB');
        lru.clear();
        expect(lru.capturedKeys[0]).assertEqual('aa');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0190
     * @tc.name testLruCacheClear019
     * @tc.desc Merged batch (5 tests): [1] Verify clear callback value iterator captures all cleared values | [2] Verify clear on a cache keyed by cache instances empties the registry while each instance keeps it...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify clear callback value iterator captures all cleared values ---
      {
        let lru: CaptureClearCache = new CaptureClearCache();
        lru.put('x1', 'one');
        lru.put('x2', 'two');
        lru.clear();
        expect(lru.capturedValues[1]).assertEqual('two');
      }

      // --- [2] Verify clear on a cache keyed by cache instances empties the registry while each instance keeps its own entries ---
      {
        let drawer: util.LRUCache<int, string> = new util.LRUCache<int, string>(2);
        drawer.put(1, 'one');
        let shelf: util.LRUCache<int, string> = new util.LRUCache<int, string>(2);
        shelf.put(2, 'two');
        let registry: util.LRUCache<util.LRUCache<int, string>, int> =
          new util.LRUCache<util.LRUCache<int, string>, int>(4);
        registry.put(drawer, 10);
        registry.put(shelf, 20);
        expect(registry.length).assertEqual(2);
        registry.clear();
        expect(registry.length).assertEqual(0);
        expect(registry.contains(drawer)).assertFalse();
        expect(registry.contains(shelf)).assertFalse();
        expect(drawer.get(1)).assertEqual('one');
        expect(shelf.get(2)).assertEqual('two');
      }

      // --- [3] Verify clear propagates exception when afterRemoval throws ---
      {
        let lru: ThrowClearCache = new ThrowClearCache();
        lru.put(1, 100);
        try {
          lru.clear();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
      }

      // --- [4] Verify second clear still throws after afterRemoval throw ---
      {
        let lru: ThrowClearCache = new ThrowClearCache();
        lru.put(1, 100);
        let threwFirst: boolean = false;
        try {
          lru.clear();
          expect().assertFail();
        } catch (e) {
          threwFirst = true;
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let threwSecond: boolean = false;
        try {
          lru.clear();
          expect().assertFail();
        } catch (e) {
          threwSecond = true;
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(threwFirst).assertTrue();
        expect(threwSecond).assertTrue();
      }

      // --- [5] Verify clear completes normally with zero length when afterRemoval returns empty ---
      {
        let lru: ReturnUndefCache = new ReturnUndefCache();
        lru.put(1, 100);
        lru.put(2, 200);
        lru.clear();
        expect(lru.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0200
     * @tc.name testLruCacheClear020
     * @tc.desc Merged batch (5 tests): [1] Verify second clear on empty cache does not trigger afterRemoval again | [2] Verify three element clear callback captured value array length equals element count | [3] V...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify second clear on empty cache does not trigger afterRemoval again ---
      {
        let lru: ReturnUndefCache = new ReturnUndefCache();
        lru.put(1, 100);
        lru.clear();
        lru.clear();
        expect(lru.returnCount).assertEqual(1);
      }

      // --- [2] Verify three element clear callback captured value array length equals element count ---
      {
        let lru: CaptureClearCache = new CaptureClearCache();
        lru.put('p1', 'p1v');
        lru.put('p2', 'p2v');
        lru.put('p3', 'p3v');
        lru.clear();
        expect(lru.capturedValues.length).assertEqual(3);
      }

      // --- [3] Verify clear only on one instance leaves a second instance entries intact ---
      {
        let cleared: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        cleared.put(1, 10);
        cleared.put(2, 20);
        let untouched: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        untouched.put(3, 30);
        cleared.clear();
        expect(cleared.length).assertEqual(0);
        expect(untouched.length).assertEqual(1);
        expect(untouched.contains(3)).assertTrue();
        expect(cleared.contains(1)).assertFalse();
      }

      // --- [4] Verify capacity eight refill overflow triggers eviction with length clamped to eight ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(8);
        for (let i: int = 0; i < 8; i++) {
          lru.put(i, i * 5);
        }
        lru.clear();
        for (let j: int = 0; j < 10; j++) {
          lru.put(j, j * 6);
        }
        expect(lru.length).assertEqual(8);
      }

      // --- [5] Verify capacity four over half evicted then clear empties all ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
        for (let i: int = 0; i < 6; i++) {
          lru.put(i, i * 100);
        }
        lru.clear();
        expect(lru.length).assertEqual(0);
        expect(lru.contains(5)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0210
     * @tc.name testLruCacheClear021
     * @tc.desc Merged batch (5 tests): [1] Verify multiple clears on large cache keep capacity two hundred fifty six | [2] Verify default capacity full clear refill length returns to sixty four | [3] Verify get m...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify multiple clears on large cache keep capacity two hundred fifty six ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(256);
        lru.put(1, 100);
        lru.clear();
        lru.put(2, 200);
        lru.clear();
        expect(lru.getCapacity()).assertEqual(256);
      }

      // --- [2] Verify default capacity full clear refill length returns to sixty four ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        for (let i: int = 0; i < 64; i++) {
          lru.put(i, i * 4);
        }
        lru.clear();
        for (let j: int = 0; j < 64; j++) {
          lru.put(j, j * 8);
        }
        expect(lru.length).assertEqual(64);
      }

      // --- [3] Verify get miss after clear triggers createDefault derived value ---
      {
        let lru: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => key * 100);
        lru.put(1, 10);
        lru.clear();
        expect(lru.get(5)).assertEqual(500);
      }

      // --- [4] Verify clear then refill within capacity leaves removal count at 0 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        lru.put(1, 100);
        lru.clear();
        lru.put(2, 200);
        lru.put(3, 300);
        lru.put(4, 400);
        expect(lru.getRemovalCount()).assertEqual(0);
      }

      // --- [5] Verify reference type key value cache length zeroes after clear ---
      {
        let lru: util.LRUCache<TestValue, int> = new util.LRUCache<TestValue, int>();
        let t1: TestValue = new TestValue('first');
        let t2: TestValue = new TestValue('second');
        lru.put(t1, 11);
        lru.put(t2, 22);
        lru.clear();
        expect(lru.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0220
     * @tc.name testLruCacheClear022
     * @tc.desc Merged batch (5 tests): [1] Verify NaN double key is removed after clear | [2] Verify cache holding self cyclic reference value clears without error | [3] Verify entries iterator obtained before cl...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify NaN double key is removed after clear ---
      {
        let lru: util.LRUCache<double, double> = new util.LRUCache<double, double>();
        lru.put(Double.NaN, 1.5);
        lru.clear();
        expect(lru.length).assertEqual(0);
        expect(lru.contains(Double.NaN)).assertFalse();
        expect(lru.get(Double.NaN)).assertEqual(undefined);
      }

      // --- [2] Verify cache holding self cyclic reference value clears without error ---
      {
        let lru: util.LRUCache<string, CycleValue> = new util.LRUCache<string, CycleValue>();
        let node: CycleValue = new CycleValue(9);
        lru.put('cyc', node);
        lru.clear();
        expect(lru.length).assertEqual(0);
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [3] Verify entries iterator obtained before clear is done after clear ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.put(2, 200);
        let iter: IterableIterator<[int, int]> = lru.entries();
        expect(iter.next().done).assertFalse();
        lru.clear();
        expect(iter.next().done).assertTrue();
      }

      // --- [4] Verify shrink capacity below size then clear keeps new capacity and zero size ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(10);
        for (let i: int = 0; i < 10; i++) {
          lru.put(i, i * 10);
        }
        lru.updateCapacity(4);
        expect(lru.length).assertEqual(4);
        lru.clear();
        expect(lru.length).assertEqual(0);
        expect(lru.getCapacity()).assertEqual(4);
      }

      // --- [5] Verify enlarge capacity after clear leaves no residue of cleared keys ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        lru.put(7, 700);
        lru.clear();
        lru.updateCapacity(6);
        lru.put(8, 800);
        lru.put(9, 900);
        expect(lru.getCapacity()).assertEqual(6);
        expect(lru.length).assertEqual(2);
        expect(lru.contains(7)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0230
     * @tc.name testLruCacheClear023
     * @tc.desc Merged batch (5 tests): [1] Verify get each old key undefined then re-put old key reads new value after clear | [2] Verify clear reports each blank string of length zero one and two once through th...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get each old key undefined then re-put old key reads new value after clear ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('a', 'old1');
        lru.put('b', 'old2');
        lru.put('c', 'old3');
        lru.clear();
        expect(lru.get('a')).assertEqual(undefined);
        expect(lru.get('b')).assertEqual(undefined);
        expect(lru.get('c')).assertEqual(undefined);
        lru.put('a', 'new1');
        expect(lru.get('a')).assertEqual('new1');
        expect(lru.length).assertEqual(1);
      }

      // --- [2] Verify clear reports each blank string of length zero one and two once through the removal callback ---
      {
        let lru: CaptureClearCache = new CaptureClearCache();
        lru.put('', 'a');
        lru.put(' ', 'b');
        lru.put('  ', 'c');
        lru.clear();
        expect(lru.capturedKeys.length).assertEqual(3);
        expect(lru.capturedKeys[0].length).assertEqual(0);
        expect(lru.capturedKeys[1].length).assertEqual(1);
        expect(lru.capturedKeys[2].length).assertEqual(2);
        expect(lru.lastIsEvict).assertFalse();
      }

      // --- [3] Verify an eviction preceding a clear leaves the removal count at one because clear adds none ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2);
        lru.put(1, 100);
        lru.put(2, 200);
        lru.put(3, 300);
        expect(lru.getRemovalCount()).assertEqual(1);
        lru.clear();
        expect(lru.getRemovalCount()).assertEqual(1);
        expect(lru.length).assertEqual(0);
      }

      // --- [4] Verify clear empties NaN positive infinity and negative infinity held as three distinct double keys ---
      {
        let lru: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        lru.put(Double.NaN, 1);
        lru.put(Double.POSITIVE_INFINITY, 2);
        lru.put(Double.NEGATIVE_INFINITY, 3);
        expect(lru.length).assertEqual(3);
        lru.clear();
        expect(lru.length).assertEqual(0);
        expect(lru.get(Double.NaN)).assertEqual(undefined);
        expect(lru.get(Double.POSITIVE_INFINITY)).assertEqual(undefined);
        expect(lru.get(Double.NEGATIVE_INFINITY)).assertEqual(undefined);
      }

      // --- [5] Verify a blank string key inserted after clear is a fresh entry returning no previous value ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put(' ', 'old');
        lru.clear();
        let previous: string | undefined = lru.put(' ', 'new');
        expect(previous).assertEqual(undefined);
        expect(lru.length).assertEqual(1);
        expect(lru.get(' ')).assertEqual('new');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CLEAR_0240
     * @tc.name testLruCacheClear024
     * @tc.desc Merged batch (1 tests): [1] Verify clearing the nested cache value leaves the outer cache entry intact
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheClear024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify clearing the nested cache value leaves the outer cache entry intact ---
      {
        let drawer: util.LRUCache<int, string> = new util.LRUCache<int, string>(3);
        drawer.put(1, 'one');
        let cabinet: util.LRUCache<string, util.LRUCache<int, string>> =
          new util.LRUCache<string, util.LRUCache<int, string>>(3);
        cabinet.put('drawer', drawer);
        cabinet.get('drawer')!.clear();
        expect(drawer.isEmpty()).assertTrue();
        expect(cabinet.contains('drawer')).assertTrue();
        drawer.put(2, 'two');
        expect(cabinet.get('drawer')!.get(2)).assertEqual('two');
      }
    });

  });
}
