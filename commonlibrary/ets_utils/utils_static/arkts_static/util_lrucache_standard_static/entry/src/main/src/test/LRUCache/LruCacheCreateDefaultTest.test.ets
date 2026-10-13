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

class KeyObjOne {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

interface ObjKey {
  id: int;
  name: string;
}

class CustomDefaultError extends Error {
  tag: int = 1;
}

class KeyEchoCache<K> extends util.LRUCache<K, K> {
  constructor(capacity?: int) {
    super(capacity);
  }
  lastKey: K | undefined = undefined;
  createDefault(key: K): K | undefined {
    this.lastKey = key;
    return key;
  }
}

class KeyIdentityCache<K> extends util.LRUCache<K, K> {
  constructor(capacity?: int) {
    super(capacity);
  }
  createDefault(key: K): K | undefined {
    return key;
  }
}

class RemovalWatchCache<K, V> extends util.LRUCache<K, V> {
  removalCalls: int = 0;
  lastIsEvict: boolean = false;
  lastKey: K | undefined = undefined;
  make: (key: K) => V | undefined = (key: K) => undefined;

  constructor(make: (key: K) => V | undefined, capacity?: int) {
    super(capacity);
    this.make = make;
  }

  createDefault(key: K): V | undefined {
    return this.make(key);
  }

  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V | undefined): void {
    this.removalCalls = this.removalCalls + 1;
    this.lastIsEvict = isEvict;
    this.lastKey = key;
  }
}

class ConstValueCache<K, V> extends util.LRUCache<K, V> {
  ret: V | undefined = undefined;

  constructor(ret: V, capacity?: int) {
    super(capacity);
    this.ret = ret;
  }

  createDefault(key: K): V | undefined {
    return this.ret;
  }
}

class FactoryCache<K, V> extends util.LRUCache<K, V> {
  make: (key: K) => V | undefined = (key: K) => undefined;

  constructor(make: (key: K) => V | undefined, capacity?: int) {
    super(capacity);
    this.make = make;
  }

  createDefault(key: K): V | undefined {
    return this.make(key);
  }
}

enum CdSlot {
  Low = 0,
  High = 1
}

export default function lruCacheCreateDefaultTest(): void {
  describe('LruCacheCreateDefaultTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0010
     * @tc.name testLruCacheCreateDefault001
     * @tc.desc Merged batch (5 tests): [1] Verify createDefault called with single unmatched key returns undefined | [2] Verify overridden createDefault receives key and returns derived key plus one value | [3] V...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault called with single unmatched key returns undefined ---
      {
        let pro: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        let result: int | undefined = pro.createDefault(50);
        expect(result).assertEqual(undefined);
      }

      // --- [2] Verify overridden createDefault receives key and returns derived key plus one value ---
      {
        let lastKey: int = -1;
        let cache: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => {
          lastKey = k;
          return k + 1;
        });
        expect(cache.createDefault(7)).assertEqual(8);
        expect(lastKey).assertEqual(7);
      }

      // --- [3] Verify SDK invokes createDefault on miss and get returns callback value ---
      {
        let cache: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => k * 2);
        expect(cache.get(5)).assertEqual(10);
      }

      // --- [4] Verify get hit does not invoke createDefault keeping call count zero ---
      {
        let calls: int = 0;
        let cache: FactoryCache<int, int> = new FactoryCache<int, int>((key: int) => {
          calls = calls + 1;
          return key;
        });
        cache.put(1, 10);
        expect(cache.get(1)).assertEqual(10);
        expect(calls).assertEqual(0);
        expect(cache.contains(1)).assertTrue();
      }

      // --- [5] Verify each of two distinct misses triggers createDefault exactly once ---
      {
        let calls: int = 0;
        let cache: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => {
          calls = calls + 1;
          return k;
        });
        cache.get(1);
        cache.get(2);
        expect(calls).assertEqual(2);
        expect(cache.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0020
     * @tc.name testLruCacheCreateDefault002
     * @tc.desc Merged batch (5 tests): [1] Verify direct createDefault call does not mutate cache contents | [2] Verify createDefault handles zero int key and callback receives zero key | [3] Verify createDefault...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify direct createDefault call does not mutate cache contents ---
      {
        let cache: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        cache.createDefault(3);
        expect(cache.isEmpty()).assertTrue();
      }

      // --- [2] Verify createDefault handles zero int key and callback receives zero key ---
      {
        let cache: KeyEchoCache<int> = new KeyEchoCache<int>();
        expect(cache.get(0)).assertEqual(0);
        expect(cache.lastKey).assertEqual(0);
        expect(cache.length).assertEqual(1);
      }

      // --- [3] Verify createDefault handles negative int key minus one and forwards key ---
      {
        let cache: KeyEchoCache<int> = new KeyEchoCache<int>();
        expect(cache.get(-1)).assertEqual(-1);
        expect(cache.lastKey).assertEqual(-1);
      }

      // --- [4] Verify createDefault handles smallest positive int key one ---
      {
        let cache: KeyEchoCache<int> = new KeyEchoCache<int>();
        let n: int = 1;
        expect(cache.get(n)).assertEqual(n);
        expect(cache.lastKey).assertEqual(n);
      }

      // --- [5] Verify an ordinary int key hit returns the stored value without invoking createDefault ---
      {
        let cache: KeyEchoCache<int> = new KeyEchoCache<int>();
        cache.put(42, 420);
        expect(cache.get(42)).assertEqual(420);
        expect(cache.lastKey).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0030
     * @tc.name testLruCacheCreateDefault003
     * @tc.desc Merged batch (5 tests): [1] Verify createDefault handles large positive int key 1000000 | [2] Verify createDefault handles int max key 2147483647 | [3] Verify createDefault handles int min key nega...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault handles large positive int key 1000000 ---
      {
        let cache: KeyEchoCache<int> = new KeyEchoCache<int>();
        expect(cache.get(1000000)).assertEqual(cache.lastKey);
        expect(cache.lastKey).assertEqual(1000000);
      }

      // --- [2] Verify createDefault handles int max key 2147483647 ---
      {
        let cache: KeyEchoCache<int> = new KeyEchoCache<int>();
        expect(cache.get(2147483647)).assertEqual(2147483647);
        expect(cache.lastKey).assertEqual(2147483647);
        expect(cache.contains(2147483647)).assertTrue();
      }

      // --- [3] Verify createDefault handles int min key negative 2147483647 minus one ---
      {
        let cache: KeyEchoCache<int> = new KeyEchoCache<int>();
        expect(cache.get(-2147483647 - 1)).assertEqual(-2147483647 - 1);
        expect(cache.lastKey).assertEqual(-2147483647 - 1);
      }

      // --- [4] Verify createDefault handles long max key 9223372036854775807 ---
      {
        let cache: KeyEchoCache<long> = new KeyEchoCache<long>();
        let maxL: long = 9223372036854775807;
        expect(cache.get(maxL)).assertEqual(maxL);
        expect(cache.lastKey).assertEqual(maxL);
      }

      // --- [5] Verify createDefault handles long key 2147483648 beyond int range ---
      {
        let cache: KeyIdentityCache<long> = new KeyIdentityCache<long>();
        let over: long = 2147483648;
        expect(cache.get(over)).assertEqual(over);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0040
     * @tc.name testLruCacheCreateDefault004
     * @tc.desc Merged batch (5 tests): [1] Verify createDefault handles long zero key Int.toLong 0 | [2] Verify createDefault handles negative long key Int.toLong minus one | [3] Verify createDefault handles a lo...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault handles long zero key Int.toLong 0 ---
      {
        let cache: KeyEchoCache<long> = new KeyEchoCache<long>();
        expect(cache.get(Int.toLong(0))).assertEqual(Int.toLong(0));
        expect(cache.lastKey).assertEqual(Int.toLong(0));
      }

      // --- [2] Verify createDefault handles negative long key Int.toLong minus one ---
      {
        let cache: KeyEchoCache<long> = new KeyEchoCache<long>();
        expect(cache.get(Int.toLong(-1))).assertEqual(Int.toLong(-1));
        expect(cache.lastKey).assertEqual(Int.toLong(-1));
      }

      // --- [3] Verify createDefault handles a long key derived by multiplying Int.toLong 1000 by 100 ---
      {
        let cache: KeyEchoCache<long> = new KeyEchoCache<long>();
        let base: long = Int.toLong(1000);
        expect(cache.get(base * 100)).assertEqual(Int.toLong(100000));
        expect(cache.lastKey).assertEqual(Int.toLong(100000));
      }

      // --- [4] Verify createDefault handles double zero key 0.0 ---
      {
        let cache: KeyEchoCache<double> = new KeyEchoCache<double>();
        let zero: double = 0.0;
        expect(cache.get(zero)).assertEqual(zero);
        expect(cache.lastKey).assertEqual(zero);
      }

      // --- [5] Verify createDefault handles negative double key minus 1.5 ---
      {
        let cache: KeyEchoCache<double> = new KeyEchoCache<double>();
        expect(cache.get(-1.5)).assertEqual(-1.5);
        expect(cache.lastKey).assertEqual(-1.5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0050
     * @tc.name testLruCacheCreateDefault005
     * @tc.desc Merged batch (5 tests): [1] Verify createDefault handles fractional double key 3.14 | [2] Verify createDefault handles scientific notation double key 1e10 | [3] Verify createDefault handles double ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault handles fractional double key 3.14 ---
      {
        let cache: KeyEchoCache<double> = new KeyEchoCache<double>();
        let probe: double = 3.14;
        expect(cache.get(probe)).assertEqual(3.14);
        expect(cache.lastKey).assertEqual(3.14);
      }

      // --- [2] Verify createDefault handles scientific notation double key 1e10 ---
      {
        let cache: KeyEchoCache<double> = new KeyEchoCache<double>();
        expect(cache.get(1e10)).assertEqual(1e10);
        expect(cache.lastKey).assertEqual(1e10);
        expect(cache.isEmpty()).assertFalse();
      }

      // --- [3] Verify createDefault handles double extreme key Number.MAX_VALUE ---
      {
        let cache: KeyEchoCache<double> = new KeyEchoCache<double>();
        expect(cache.get(Number.MAX_VALUE)).assertEqual(Number.MAX_VALUE);
        expect(cache.lastKey).assertEqual(Number.MAX_VALUE);
      }

      // --- [4] Verify NaN key hits the stored NaN entry so createDefault is not invoked ---
      {
        let calls: int = 0;
        let cache: FactoryCache<double, string> = new FactoryCache<double, string>((k: double) => {
          calls = calls + 1;
          return 'created';
        });
        cache.put(Double.NaN, 'hit');
        expect(cache.get(Double.NaN)).assertEqual('hit');
        expect(calls).assertEqual(0);
      }

      // --- [5] Verify createDefault handles float key 1.5 passed as float variable ---
      {
        let cache: KeyEchoCache<float> = new KeyEchoCache<float>();
        let f: float = 1.5 as float;
        expect(cache.get(f)).assertEqual(f);
        expect(cache.lastKey).assertEqual(f);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0060
     * @tc.name testLruCacheCreateDefault006
     * @tc.desc Merged batch (5 tests): [1] Verify createDefault handles boolean key true | [2] Verify createDefault handles boolean key false | [3] Verify createDefault handles single character string key A passe...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault handles boolean key true ---
      {
        let cache: KeyEchoCache<boolean> = new KeyEchoCache<boolean>();
        expect(cache.get(true)).assertTrue();
        expect(cache.lastKey).assertTrue();
      }

      // --- [2] Verify createDefault handles boolean key false ---
      {
        let cache: KeyEchoCache<boolean> = new KeyEchoCache<boolean>();
        expect(cache.get(false)).assertFalse();
        expect(cache.lastKey).assertFalse();
      }

      // --- [3] Verify createDefault handles single character string key A passed as string variable ---
      {
        let cache: KeyEchoCache<string> = new KeyEchoCache<string>();
        let c: string = 'A';
        expect(cache.get(c)).assertEqual(c);
        expect(cache.lastKey).assertEqual(c);
      }

      // --- [4] Verify createDefault handles a CJK char key as a single UTF-16 unit ---
      {
        let cache: KeyIdentityCache<string> = new KeyIdentityCache<string>();
        let cn: string = '你';
        expect(cache.get(cn)).assertEqual(cn);
      }

      // --- [5] Verify createDefault handles byte min key Int.toByte minus 128 ---
      {
        let cache: KeyEchoCache<byte> = new KeyEchoCache<byte>();
        expect(cache.get(Int.toByte(-128))).assertEqual(Int.toByte(-128));
        expect(cache.lastKey).assertEqual(Int.toByte(-128));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0070
     * @tc.name testLruCacheCreateDefault007
     * @tc.desc Merged batch (5 tests): [1] Verify createDefault handles byte max key Int.toByte 127 | [2] Verify createDefault handles short max key Int.toShort 32767 | [3] Verify createDefault handles short min ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault handles byte max key Int.toByte 127 ---
      {
        let cache: KeyEchoCache<byte> = new KeyEchoCache<byte>();
        expect(cache.get(Int.toByte(127))).assertEqual(Int.toByte(127));
        expect(cache.lastKey).assertEqual(Int.toByte(127));
      }

      // --- [2] Verify createDefault handles short max key Int.toShort 32767 ---
      {
        let cache: KeyEchoCache<short> = new KeyEchoCache<short>();
        expect(cache.get(Int.toShort(32767))).assertEqual(Int.toShort(32767));
        expect(cache.lastKey).assertEqual(Int.toShort(32767));
      }

      // --- [3] Verify createDefault handles short min key Int.toShort minus 32768 ---
      {
        let cache: KeyEchoCache<short> = new KeyEchoCache<short>();
        expect(cache.get(Int.toShort(-32768))).assertEqual(Int.toShort(-32768));
        expect(cache.lastKey).assertEqual(Int.toShort(-32768));
      }

      // --- [4] Verify a get miss with bigint zero key 0n invokes createDefault returning 0n and the callback receives 0n ---
      {
        let cache: KeyEchoCache<bigint> = new KeyEchoCache<bigint>();
        expect(cache.get(0n)).assertEqual(0n);
        expect(cache.lastKey).assertEqual(0n);
      }

      // --- [5] Verify a get miss with negative bigint key -1n invokes createDefault returning -1n and the callback receives -1n ---
      {
        let cache: KeyEchoCache<bigint> = new KeyEchoCache<bigint>();
        expect(cache.get(-1n)).assertEqual(-1n);
        expect(cache.lastKey).assertEqual(-1n);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0080
     * @tc.name testLruCacheCreateDefault008
     * @tc.desc Merged batch (5 tests): [1] Verify a get miss with bigint key 9007199254740993n beyond Number safe integer invokes createDefault returning the key | [2] Verify createDefault handles empty string ke...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a get miss with bigint key 9007199254740993n beyond Number safe integer invokes createDefault returning the key ---
      {
        let cache: KeyIdentityCache<bigint> = new KeyIdentityCache<bigint>();
        expect(cache.get(9007199254740993n)).assertEqual(9007199254740993n);
      }

      // --- [2] Verify createDefault handles empty string key ---
      {
        let cache: KeyEchoCache<string> = new KeyEchoCache<string>();
        expect(cache.get('')).assertEqual('');
        expect(cache.lastKey).assertEqual('');
        expect(cache.length).assertEqual(1);
      }

      // --- [3] Verify createDefault handles single character string key a ---
      {
        let cache: KeyEchoCache<string> = new KeyEchoCache<string>();
        expect(cache.get('a')).assertEqual('a');
        expect(cache.lastKey).assertEqual('a');
        expect(cache.contains('a')).assertTrue();
      }

      // --- [4] Verify createDefault handles Chinese string key hello ---
      {
        let cache: KeyEchoCache<string> = new KeyEchoCache<string>();
        expect(cache.get('你好')).assertEqual('你好');
        expect(cache.lastKey).assertEqual('你好');
      }

      // --- [5] Verify createDefault handles emoji surrogate pair string key ---
      {
        let cache: KeyEchoCache<string> = new KeyEchoCache<string>();
        expect(cache.get('😀')).assertEqual('😀');
        expect(cache.lastKey).assertEqual('😀');
        expect(cache.get('😀')).assertEqual(cache.lastKey);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0090
     * @tc.name testLruCacheCreateDefault009
     * @tc.desc Merged batch (5 tests): [1] Verify createDefault handles 62 character long string key | [2] Verify createDefault handles whitespace-only string key | [3] Verify createDefault handles special script...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault handles 62 character long string key ---
      {
        let longKey: string = 'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        let cache: KeyEchoCache<string> = new KeyEchoCache<string>();
        expect(cache.get(longKey)).assertEqual(longKey);
        expect(cache.lastKey).assertEqual(longKey);
      }

      // --- [2] Verify createDefault handles whitespace-only string key ---
      {
        let cache: KeyEchoCache<string> = new KeyEchoCache<string>();
        let blank: string = '   ';
        expect(cache.get(blank)).assertEqual('   ');
        expect(cache.lastKey).assertEqual(blank);
      }

      // --- [3] Verify createDefault handles special script tag string key ---
      {
        let cache: KeyEchoCache<string> = new KeyEchoCache<string>();
        let tag: string = '<script>';
        expect(cache.get(tag)).assertEqual(tag);
        expect(cache.lastKey).assertEqual(tag);
      }

      // --- [4] Verify hex-like string key 0x10 stays literal string without numeric conversion ---
      {
        let cache: KeyEchoCache<string> = new KeyEchoCache<string>();
        expect(cache.get('0x10')).assertEqual('0x10');
        expect(cache.lastKey).assertEqual('0x10');
        expect(cache.getCapacity()).assertEqual(64);
      }

      // --- [5] Verify two same-time different Date references treated as distinct keys triggering createDefault ---
      {
        let cache: ConstValueCache<Date, string> = new ConstValueCache<Date, string>('created');
        let firstDate: Date = new Date(2024, 0, 1);
        let secondDate: Date = new Date(2024, 0, 1);
        cache.put(firstDate, 'hit');
        expect(cache.get(secondDate)).assertEqual('created');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0100
     * @tc.name testLruCacheCreateDefault010
     * @tc.desc Merged batch (5 tests): [1] Verify same reference-typed key hits stored value and skips createDefault | [2] Verify createDefault receives same Date reference used for query on miss | [3] Verify two...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify same reference-typed key hits stored value and skips createDefault ---
      {
        // Date reference key hits stored value, createDefault skipped
        let cacheDate: ConstValueCache<Date, string> = new ConstValueCache<Date, string>('created');
        let dDate: Date = new Date(2024, 5, 15);
        cacheDate.put(dDate, 'hit');
        expect(cacheDate.get(dDate)).assertEqual('hit');

        // RegExp reference key hits stored value, createDefault skipped
        let cacheRegex: ConstValueCache<RegExp, string> = new ConstValueCache<RegExp, string>('created');
        let rRegex: RegExp = new RegExp('\\d+', 'i');
        cacheRegex.put(rRegex, 'hit');
        expect(cacheRegex.get(rRegex)).assertEqual('hit');

        // Error reference key hits stored value, createDefault skipped
        let cacheError: ConstValueCache<Error, string> = new ConstValueCache<Error, string>('created');
        let eError: Error = new Error('ref');
        cacheError.put(eError, 'hit');
        expect(cacheError.get(eError)).assertEqual('hit');

        // Int32Array reference key hits stored value, createDefault skipped
        let callsInt32: int = 0;
        let cacheInt32: FactoryCache<Int32Array, string> = new FactoryCache<Int32Array, string>((key: Int32Array) => {
          callsInt32 = callsInt32 + 1;
          return 'created';
        });
        let sharedInt32: Int32Array = new Int32Array([1, 2, 3]);
        cacheInt32.put(sharedInt32, 'hit');
        expect(cacheInt32.get(sharedInt32)).assertEqual('hit');
        expect(callsInt32).assertEqual(0);

        // Uint8Array reference key hits stored value, createDefault skipped
        let callsUint8: int = 0;
        let cacheUint8: FactoryCache<Uint8Array, string> = new FactoryCache<Uint8Array, string>((k: Uint8Array) => {
          callsUint8 = callsUint8 + 1;
          return 'created';
        });
        let sharedUint8: Uint8Array = new Uint8Array([1, 2, 3]);
        cacheUint8.put(sharedUint8, 'hit');
        expect(callsUint8).assertEqual(0);
        expect(cacheUint8.get(sharedUint8)).assertEqual('hit');
      }

      // --- [2] Verify createDefault receives same Date reference used for query on miss ---
      {
        let lastKey: Date | undefined = undefined;
        let cache: FactoryCache<Date, string> = new FactoryCache<Date, string>((k: Date) => {
          lastKey = k;
          return 'created';
        });
        let d: Date = new Date(2023, 11, 31);
        cache.get(d);
        expect(lastKey).assertEqual(d);
      }

      // --- [3] Verify two same-pattern different RegExp references treated as distinct keys ---
      {
        let cache: ConstValueCache<RegExp, string> = new ConstValueCache<RegExp, string>('created');
        let firstRegex: RegExp = new RegExp('abc', 'g');
        let secondRegex: RegExp = new RegExp('abc', 'g');
        cache.put(firstRegex, 'hit');
        expect(cache.get(secondRegex)).assertEqual('created');
      }

      // --- [4] Verify Error instance key on empty cache misses and createDefault returns created ---
      {
        let cache: ConstValueCache<Error, string> = new ConstValueCache<Error, string>('created');
        let e: Error = new Error('boom');
        expect(cache.get(e)).assertEqual('created');
      }

      // --- [5] Verify two same-id different class instance references treated as distinct keys ---
      {
        let cache: ConstValueCache<KeyObjOne, string> = new ConstValueCache<KeyObjOne, string>('created');
        let firstKey: KeyObjOne = new KeyObjOne(1);
        let secondKey: KeyObjOne = new KeyObjOne(1);
        cache.put(firstKey, 'hit');
        expect(cache.get(secondKey)).assertEqual('created');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0110
     * @tc.name testLruCacheCreateDefault011
     * @tc.desc Merged batch (5 tests): [1] Verify same class instance reference key hits stored value and skips createDefault | [2] Verify two same-property different object literal references treated as distinct...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify same class instance reference key hits stored value and skips createDefault ---
      {
        let cache: ConstValueCache<KeyObjOne, string> = new ConstValueCache<KeyObjOne, string>('created');
        let o: KeyObjOne = new KeyObjOne(7);
        cache.put(o, 'hit');
        expect(cache.get(o)).assertEqual('hit');
      }

      // --- [2] Verify two same-property different object literal references treated as distinct keys ---
      {
        let cache: ConstValueCache<ObjKey, string> = new ConstValueCache<ObjKey, string>('created');
        let firstKey: ObjKey = { id: 1, name: 'a' };
        let secondKey: ObjKey = { id: 1, name: 'a' };
        cache.put(firstKey, 'hit');
        expect(cache.get(secondKey)).assertEqual('created');
      }

      // --- [3] Verify two same-content different int array references treated as distinct keys ---
      {
        let cache: ConstValueCache<int[], string> = new ConstValueCache<int[], string>('created');
        let firstArray: int[] = [1, 2, 3];
        let secondArray: int[] = [1, 2, 3];
        cache.put(firstArray, 'hit');
        expect(cache.get(secondArray)).assertEqual('created');
      }

      // --- [4] Verify same int array reference key hits stored value and skips createDefault ---
      {
        let cache: ConstValueCache<int[], string> = new ConstValueCache<int[], string>('created');
        let a: int[] = [4, 5, 6];
        cache.put(a, 'hit');
        expect(cache.get(a)).assertEqual('hit');
      }

      // --- [5] Verify Map instance key on empty cache misses and createDefault returns created ---
      {
        let cache: ConstValueCache<Map<string, int>, string> = new ConstValueCache<Map<string, int>, string>('created');
        let m: Map<string, int> = new Map<string, int>();
        m.set('k', 1);
        expect(cache.get(m)).assertEqual('created');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0120
     * @tc.name testLruCacheCreateDefault012
     * @tc.desc Merged batch (5 tests): [1] Verify Set instance key on empty cache misses and createDefault returns created | [2] Verify get with undefined key throws BusinessError without invoking createDefault |...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Set instance key on empty cache misses and createDefault returns created ---
      {
        let cache: ConstValueCache<Set<string>, string> = new ConstValueCache<Set<string>, string>('created');
        let s: Set<string> = new Set<string>();
        s.add('x');
        expect(cache.get(s)).assertEqual('created');
      }

      // --- [2] Verify get with undefined key throws BusinessError without invoking createDefault ---
      {
        let calls: int = 0;
        let cache: FactoryCache<string | undefined, string> = new FactoryCache<string | undefined, string>((k: string | undefined) => {
          calls = calls + 1;
          return 'created';
        });
        try {
          cache.get(undefined);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(calls).assertEqual(0);
      }

      // --- [3] Verify get with null key throws BusinessError without invoking createDefault ---
      {
        let lastKey: string | null = null;
        let cache: FactoryCache<string | null, string> = new FactoryCache<string | null, string>((k: string | null) => {
          lastKey = k;
          return 'created';
        });
        try {
          cache.get(null);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(lastKey).assertEqual(null);
      }

      // --- [4] Verify typeof default createDefault return value is undefined ---
      {
        let pro: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        let result: string | undefined = pro.createDefault('abc');
        expect(typeof result).assertEqual('undefined');
        expect(result).assertEqual(undefined);
      }

      // --- [5] Verify createDefault returns constant 99 independent of key on get miss ---
      {
        let cache: ConstValueCache<int, int> = new ConstValueCache<int, int>(99);
        expect(cache.get(7)).assertEqual(99);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0130
     * @tc.name testLruCacheCreateDefault013
     * @tc.desc Merged batch (5 tests): [1] Verify createDefault returns key derived value key plus 1000 on get miss | [2] Verify explicit undefined return is not cached so two gets trigger createDefault twice | [...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault returns key derived value key plus 1000 on get miss ---
      {
        let cache: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => k + 1000);
        expect(cache.get(7)).assertEqual(1007);
      }

      // --- [2] Verify explicit undefined return is not cached so two gets trigger createDefault twice ---
      {
        let calls: int = 0;
        let cache: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => {
          calls = calls + 1;
          return undefined;
        });
        cache.get(3);
        cache.get(3);
        expect(calls).assertEqual(2);
      }

      // --- [3] Verify non undefined return is cached so second get hits without createDefault ---
      {
        let calls: int = 0;
        let cache: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => {
          calls = calls + 1;
          return k + 100;
        });
        expect(cache.get(5)).assertEqual(105);
        cache.get(5);
        expect(calls).assertEqual(1);
      }

      // --- [4] Verify generic identity subclass instantiated with int key returns key itself ---
      {
        let cache: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        expect(cache.get(5)).assertEqual(5);
      }

      // --- [5] Verify generic identity subclass instantiated with Date key returns same Date reference ---
      {
        let cache: KeyIdentityCache<Date> = new KeyIdentityCache<Date>();
        let d: Date = new Date(2024, 0, 1);
        expect(cache.get(d)).assertEqual(d);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0140
     * @tc.name testLruCacheCreateDefault014
     * @tc.desc Merged batch (5 tests): [1] Verify string key int value subclass derives int from key length | [2] Verify int key string value subclass returns constant created on get miss | [3] Verify long key in...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify string key int value subclass derives int from key length ---
      {
        let cache: FactoryCache<string, int> = new FactoryCache<string, int>((k: string) => k.length);
        expect(cache.get('abc')).assertEqual(3);
      }

      // --- [2] Verify int key string value subclass returns constant created on get miss ---
      {
        let cache: ConstValueCache<int, string> = new ConstValueCache<int, string>('created');
        expect(cache.get(5)).assertEqual('created');
      }

      // --- [3] Verify long key int value subclass returns constant 7 on get miss ---
      {
        let cache: ConstValueCache<long, int> = new ConstValueCache<long, int>(7);
        expect(cache.get(Int.toLong(123456))).assertEqual(7);
      }

      // --- [4] Verify typeof overridden createDefault returning string is string ---
      {
        let c: ConstValueCache<int, string> = new ConstValueCache<int, string>('made');
        let t: string = typeof c.createDefault(3);
        expect(t).assertEqual('string');
      }

      // --- [5] Verify overridden createDefault returning boolean gives typeof boolean ---
      {
        let c: ConstValueCache<int, boolean> = new ConstValueCache<int, boolean>(true);
        let t: string = typeof c.createDefault(3);
        expect(t).assertEqual('boolean');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0150
     * @tc.name testLruCacheCreateDefault015
     * @tc.desc Merged batch (5 tests): [1] Verify createDefault overridden to return bigint yields a value whose typeof is bigint | [2] Verify typeof overridden createDefault returning class instance is object | ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault overridden to return bigint yields a value whose typeof is bigint ---
      {
        let c: ConstValueCache<int, bigint> = new ConstValueCache<int, bigint>(1n);
        let t: string = typeof c.createDefault(3);
        expect(t).assertEqual('bigint');
      }

      // --- [2] Verify typeof overridden createDefault returning class instance is object ---
      {
        let c: FactoryCache<int, KeyObjOne> = new FactoryCache<int, KeyObjOne>((k: int) => new KeyObjOne(0));
        let t: string = typeof c.createDefault(3);
        expect(t).assertEqual('object');
      }

      // --- [3] Verify overridden createDefault returning typed instance passes instanceof check ---
      {
        // Date instance passes instanceof Date
        let cDate: FactoryCache<int, Date> = new FactoryCache<int, Date>((k: int) => new Date(0));
        expect(cDate.createDefault(1)! instanceof Date).assertTrue();
        let dvDate: Date = cDate.createDefault(1)!;
        expect(dvDate.getTime()).assertEqual(0);

        // RegExp instance passes instanceof RegExp
        let cRegex: FactoryCache<int, RegExp> = new FactoryCache<int, RegExp>((k: int) => new RegExp('a+'));
        expect(cRegex.createDefault(1)! instanceof RegExp).assertTrue();
        let rvRegex: RegExp = cRegex.createDefault(1)!;
        expect(rvRegex.source).assertEqual('a+');

        // Error instance passes instanceof Error
        let cError: FactoryCache<int, Error> = new FactoryCache<int, Error>((k: int) => new Error('boom'));
        expect(cError.createDefault(1)! instanceof Error).assertTrue();
        let evError: Error = cError.createDefault(1)!;
        expect(evError.message).assertEqual('boom');

        // Map instance passes instanceof Map
        let cMap: FactoryCache<int, Map<string, int>> = new FactoryCache<int, Map<string, int>>((k: int) => { let m: Map<string, int> = new Map<string, int>(); m.set('a', 1); return m; });
        expect(cMap.createDefault(1)! instanceof Map).assertTrue();
        let mvMap: Map<string, int> = cMap.createDefault(1)!;
        expect(mvMap.size).assertEqual(1);
        expect(mvMap.get('a')).assertEqual(1);

        // Set instance passes instanceof Set
        let cSet: FactoryCache<int, Set<int>> = new FactoryCache<int, Set<int>>((k: int) => { let s: Set<int> = new Set<int>(); s.add(1); return s; });
        expect(cSet.createDefault(1)! instanceof Set).assertTrue();
        let svSet: Set<int> = cSet.createDefault(1)!;
        expect(svSet.size).assertEqual(1);
        expect(svSet.has(1)).assertTrue();

        // Promise instance passes instanceof Promise
        let sharedPromise: Promise<int> = Promise.resolve<int>(1);
        let cPromise: FactoryCache<int, Promise<int>> = new FactoryCache<int, Promise<int>>((k: int) => sharedPromise);
        expect(cPromise.createDefault(1)! instanceof Promise).assertTrue();
        expect(cPromise.createDefault(1)!).assertEqual(sharedPromise);

        // WeakMap instance passes instanceof WeakMap
        let cWeakMap: FactoryCache<int, WeakMap<object, int>> = new FactoryCache<int, WeakMap<object, int>>((k: int) => new WeakMap<object, int>());
        expect(cWeakMap.createDefault(1)! instanceof WeakMap).assertTrue();
        let wkWeakMap: KeyObjOne = new KeyObjOne(0);
        let wmWeakMap: WeakMap<object, int> = cWeakMap.createDefault(1)!;
        wmWeakMap.set(wkWeakMap, 5);
        expect(wmWeakMap.get(wkWeakMap)).assertEqual(5);
      }

      // --- [4] Verify overridden createDefault returning array instance passes instanceof Array ---
      {
        let c: FactoryCache<int, int[]> = new FactoryCache<int, int[]>((k: int) => [1, 2]);
        expect(c.createDefault(1)! instanceof Array).assertTrue();
        let av: int[] = c.createDefault(1)!;
        expect(av.length).assertEqual(2);
        expect(av[0]).assertEqual(1);
      }

      // --- [5] Verify overridden createDefault returning Int32Array passes instanceof Int32Array ---
      {
        let c: FactoryCache<int, Int32Array> = new FactoryCache<int, Int32Array>((k: int) => new Int32Array(2));
        expect(c.createDefault(1)! instanceof Int32Array).assertTrue();
        let tv: Int32Array = c.createDefault(1)!;
        expect(tv.length).assertEqual(2);
        expect(tv[0]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0160
     * @tc.name testLruCacheCreateDefault016
     * @tc.desc Merged batch (5 tests): [1] Verify overridden createDefault returning custom class instance passes instanceof | [2] Verify overridden createDefault returning WeakSet instance passes instanceof Weak...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overridden createDefault returning custom class instance passes instanceof ---
      {
        let c: FactoryCache<int, KeyObjOne> = new FactoryCache<int, KeyObjOne>((k: int) => new KeyObjOne(0));
        expect(c.createDefault(1)! instanceof KeyObjOne).assertTrue();
        let ov: KeyObjOne = c.createDefault(1)!;
        expect(ov.id).assertEqual(0);
      }

      // --- [2] Verify overridden createDefault returning WeakSet instance passes instanceof WeakSet ---
      {
        let c: FactoryCache<int, WeakSet<object>> = new FactoryCache<int, WeakSet<object>>((k: int) => new WeakSet<object>());
        expect(c.createDefault(1)! instanceof WeakSet).assertTrue();
        let wk: KeyObjOne = new KeyObjOne(0);
        let ws: WeakSet<object> = c.createDefault(1)!;
        ws.add(wk);
        expect(ws.has(wk)).assertTrue();
      }

      // --- [3] Verify overridden createDefault returns key times two derived value ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => k * 2);
        expect(c.createDefault(5)).assertEqual(10);
      }

      // --- [4] Verify overridden createDefault returns constant 42 ---
      {
        let c: ConstValueCache<int, int> = new ConstValueCache<int, int>(42);
        expect(c.createDefault(0)).assertEqual(42);
        expect(c.length).assertEqual(0);
      }

      // --- [5] Verify overridden createDefault returns negative of key value ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => -k);
        expect(c.createDefault(6)).assertEqual(-6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0170
     * @tc.name testLruCacheCreateDefault017
     * @tc.desc Merged batch (5 tests): [1] Verify overridden createDefault returns boolean derived from key sign | [2] Verify overridden createDefault returns zero boundary value | [3] Verify int overflow at max ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overridden createDefault returns boolean derived from key sign ---
      {
        let c: FactoryCache<int, boolean> = new FactoryCache<int, boolean>((k: int) => k > 0);
        expect(c.createDefault(1)).assertTrue();
      }

      // --- [2] Verify overridden createDefault returns zero boundary value ---
      {
        let c: ConstValueCache<int, int> = new ConstValueCache<int, int>(0);
        expect(c.createDefault(9)).assertEqual(c.ret);
        expect(c.ret).assertEqual(0);
      }

      // --- [3] Verify int overflow at max key plus one wraps to int min ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => k + 1);
        expect(c.createDefault(2147483647)).assertEqual(-2147483648);
      }

      // --- [4] Verify overridden createDefault returns large number 100000 ---
      {
        let c: ConstValueCache<int, int> = new ConstValueCache<int, int>(100000);
        expect(c.createDefault(0)).assertEqual(100000);
      }

      // --- [5] Verify overridden createDefault returning NaN passes isNaN check ---
      {
        let c: ConstValueCache<int, double> = new ConstValueCache<int, double>(Double.NaN);
        expect(isNaN(c.createDefault(2) ?? Double.NaN)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0180
     * @tc.name testLruCacheCreateDefault018
     * @tc.desc Merged batch (5 tests): [1] Verify overridden createDefault returning positive infinity | [2] Verify overridden createDefault returning negative infinity | [3] Verify overridden createDefault retur...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overridden createDefault returning positive infinity ---
      {
        let c: ConstValueCache<int, double> = new ConstValueCache<int, double>(Double.POSITIVE_INFINITY);
        expect(c.createDefault(2)).assertEqual(Double.POSITIVE_INFINITY);
      }

      // --- [2] Verify overridden createDefault returning negative infinity ---
      {
        let c: ConstValueCache<int, double> = new ConstValueCache<int, double>(Double.NEGATIVE_INFINITY);
        expect(c.createDefault(2)).assertEqual(Double.NEGATIVE_INFINITY);
      }

      // --- [3] Verify overridden createDefault returns long max 9223372036854775807 value ---
      {
        let c: ConstValueCache<int, long> = new ConstValueCache<int, long>(9223372036854775807);
        expect(c.createDefault(2)).assertEqual(9223372036854775807);
      }

      // --- [4] Verify overridden createDefault returns byte max 127 value ---
      {
        let c: ConstValueCache<int, byte> = new ConstValueCache<int, byte>(127);
        expect(c.createDefault(1)).assertEqual(127);
        expect(c.createDefault(2)).assertEqual(127);
      }

      // --- [5] Verify overridden createDefault returns short max 32767 value ---
      {
        let c: ConstValueCache<int, short> = new ConstValueCache<int, short>(32767);
        expect(c.createDefault(2)).assertEqual(c.ret);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0190
     * @tc.name testLruCacheCreateDefault019
     * @tc.desc Merged batch (5 tests): [1] Verify overridden createDefault returns character A value | [2] Verify overridden createDefault returns float 2.5 value | [3] Verify overridden createDefault returns dou...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overridden createDefault returns character A value ---
      {
        let c: ConstValueCache<int, string> = new ConstValueCache<int, string>('A');
        expect(c.createDefault(2)).assertEqual('A');
      }

      // --- [2] Verify overridden createDefault returns float 2.5 value ---
      {
        let c: ConstValueCache<int, float> = new ConstValueCache<int, float>(2.5 as float);
        let got: float | undefined = c.createDefault(2);
        expect(got).assertEqual(2.5 as float);
      }

      // --- [3] Verify overridden createDefault returns double 3.25 value ---
      {
        let c: ConstValueCache<int, double> = new ConstValueCache<int, double>(3.25);
        let got: double | undefined = c.createDefault(7);
        expect(got).assertEqual(3.25);
      }

      // --- [4] Verify overridden createDefault returns Date whose getTime is 1700000000000 ---
      {
        let c: FactoryCache<int, Date> = new FactoryCache<int, Date>((k: int) => new Date(1700000000000));
        expect(c.createDefault(2)!.getTime()).assertEqual(1700000000000);
      }

      // --- [5] Verify overridden createDefault returns array whose first element is 10 ---
      {
        let c: FactoryCache<int, int[]> = new FactoryCache<int, int[]>((k: int) => [10, 20, 30]);
        expect(c.createDefault(2)![0]).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0200
     * @tc.name testLruCacheCreateDefault020
     * @tc.desc Merged batch (5 tests): [1] Verify overridden createDefault returns class instance whose id field equals key | [2] Verify overridden createDefault returns Record whose x property is 5 | [3] Verify ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overridden createDefault returns class instance whose id field equals key ---
      {
        let c: FactoryCache<int, KeyObjOne> = new FactoryCache<int, KeyObjOne>((k: int) => {
          let h: KeyObjOne = new KeyObjOne(0);
          h.id = k; return h;
        });
        expect(c.createDefault(6)!.id).assertEqual(6);
      }

      // --- [2] Verify overridden createDefault returns Record whose x property is 5 ---
      {
        let c: FactoryCache<int, Record<string, int>> = new FactoryCache<int, Record<string, int>>((k: int) => { let rec: Record<string, int> = { 'x': 5 }; return rec; });
        expect(c.createDefault(2)!['x']).assertEqual(5);
      }

      // --- [3] Verify explicit undefined return asserted as undefined ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => undefined);
        expect(c.createDefault(2)).assertEqual(undefined);
      }

      // --- [4] Verify a child overriding createDefault to return 7n yields 7n ---
      {
        let c: ConstValueCache<int, bigint> = new ConstValueCache<int, bigint>(7n);
        expect(c.createDefault(2)).assertEqual(7n);
      }

      // --- [5] Verify returned string length is 5 for abcde value ---
      {
        let c: ConstValueCache<int, string> = new ConstValueCache<int, string>('abcde');
        expect(c.createDefault(2)!.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0210
     * @tc.name testLruCacheCreateDefault021
     * @tc.desc Merged batch (5 tests): [1] Verify returned array length is 2 for two element value | [2] Verify returned Map size is 2 for two entry value | [3] Verify returned Set size is 3 for three entry value...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify returned array length is 2 for two element value ---
      {
        let c: FactoryCache<int, int[]> = new FactoryCache<int, int[]>((k: int) => [7, 8]);
        expect(c.createDefault(2)!.length).assertEqual(2);
      }

      // --- [2] Verify returned Map size is 2 for two entry value ---
      {
        let c: FactoryCache<int, Map<string, int>> = new FactoryCache<int, Map<string, int>>((k: int) => { let m: Map<string, int> = new Map<string, int>(); m.set('a', 1); m.set('b', 2); return m; });
        expect(c.createDefault(2)!.size).assertEqual(2);
      }

      // --- [3] Verify returned Set size is 3 for three entry value ---
      {
        let c: FactoryCache<int, Set<int>> = new FactoryCache<int, Set<int>>((k: int) => { let s: Set<int> = new Set<int>(); s.add(1); s.add(2); s.add(3); return s; });
        expect(c.createDefault(2)!.size).assertEqual(3);
      }

      // --- [4] Verify returned Uint8Array byteLength is 8 for length eight ---
      {
        let c: FactoryCache<int, Uint8Array> = new FactoryCache<int, Uint8Array>((k: int) => new Uint8Array(8));
        expect(c.createDefault(2)!.byteLength).assertEqual(8);
      }

      // --- [5] Verify returned Int32Array byteLength is 16 for length four ---
      {
        let c: FactoryCache<int, Int32Array> = new FactoryCache<int, Int32Array>((k: int) => new Int32Array(4));
        expect(c.createDefault(2)!.byteLength).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0220
     * @tc.name testLruCacheCreateDefault022
     * @tc.desc Merged batch (5 tests): [1] Verify direct createDefault does not change stored entry value | [2] Verify direct createDefault does not change default capacity 64 | [3] Verify direct createDefault ke...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify direct createDefault does not change stored entry value ---
      {
        let c: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        c.put(1, 10);
        c.createDefault(50);
        expect(c.get(1)).assertEqual(10);
      }

      // --- [2] Verify direct createDefault does not change default capacity 64 ---
      {
        let c: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        c.createDefault(50);
        expect(c.getCapacity()).assertEqual(64);
      }

      // --- [3] Verify direct createDefault keeps match count unchanged at one ---
      {
        let c: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        c.put(2, 10);
        c.get(2);
        c.createDefault(50);
        expect(c.getMatchCount()).assertEqual(1);
      }

      // --- [4] Verify direct createDefault does not trigger afterRemoval callback ---
      {
        let c: RemovalWatchCache<int, int> = new RemovalWatchCache<int, int>((k: int) => k);
        c.createDefault(1);
        expect(c.removalCalls).assertEqual(0);
      }

      // --- [5] Verify direct createDefault does not alter contains state of absent key ---
      {
        let c: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        c.createDefault(50);
        expect(c.contains(50)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0230
     * @tc.name testLruCacheCreateDefault023
     * @tc.desc Merged batch (5 tests): [1] Verify createDefault returning shared instance makes later result reflect field mutation | [2] Verify createDefault returning new instance each call keeps results indepe...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault returning shared instance makes later result reflect field mutation ---
      {
        let c: ConstValueCache<int, KeyObjOne> = new ConstValueCache<int, KeyObjOne>(new KeyObjOne(0), 64);
        let firstRef: KeyObjOne | undefined = c.createDefault(1);
        let secondRef: KeyObjOne | undefined = c.createDefault(2);
        firstRef!.id = 99;
        expect(secondRef!.id).assertEqual(99);
      }

      // --- [2] Verify createDefault returning new instance each call keeps results independent ---
      {
        let c: FactoryCache<int, KeyObjOne> = new FactoryCache<int, KeyObjOne>((k: int) => new KeyObjOne(0));
        let firstRef: KeyObjOne | undefined = c.createDefault(1);
        let secondRef: KeyObjOne | undefined = c.createDefault(2);
        firstRef!.id = 77;
        expect(secondRef!.id).assertEqual(0);
      }

      // --- [3] Verify second get hit keeps create count at one ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => k + 10);
        c.get(5);
        c.get(5);
        expect(c.getCreateCount()).assertEqual(1);
      }

      // --- [4] Verify undefined createDefault value not inserted so contains returns false ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => undefined);
        c.get(8);
        expect(c.contains(8)).assertFalse();
      }

      // --- [5] Verify the factory records the queried key once per miss in request order while hits and evictions never consult it ---
      {
        let requested: int[] = [];
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((key: int) => {
          requested.push(key);
          return key * 2;
        }, 2);
        c.put(9, 90);
        expect(c.get(9)).assertEqual(90);
        c.get(1);
        c.get(2);
        expect(c.get(2)).assertEqual(4);
        c.get(3);
        expect(requested.join(',')).assertEqual('1,2,3');
        expect(c.contains(1)).assertFalse();
        expect(c.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0240
     * @tc.name testLruCacheCreateDefault024
     * @tc.desc Merged batch (5 tests): [1] Verify get miss return type propagates createDefault string type | [2] Verify string key createDefault returns dflt prefix concatenated key | [3] Verify boolean key crea...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get miss return type propagates createDefault string type ---
      {
        let c: ConstValueCache<int, string> = new ConstValueCache<int, string>('made');
        let t: string = typeof c.get(2);
        expect(t).assertEqual('string');
      }

      // --- [2] Verify string key createDefault returns dflt prefix concatenated key ---
      {
        let c: FactoryCache<string, string> = new FactoryCache<string, string>((k: string) => 'dflt:' + k);
        expect(c.createDefault('k')).assertEqual('dflt:k');
      }

      // --- [3] Verify boolean key createDefault returns negated key value ---
      {
        let c: FactoryCache<boolean, boolean> = new FactoryCache<boolean, boolean>((k: boolean) => !k);
        expect(c.createDefault(false)).assertTrue();
      }

      // --- [4] Verify a <bigint,bigint> child createDefault(5n) returns key plus 1n value 6n ---
      {
        let c: FactoryCache<bigint, bigint> = new FactoryCache<bigint, bigint>((k: bigint) => k + 1n);
        expect(c.createDefault(5n)).assertEqual(6n);
        expect(c.length).assertEqual(0);
      }

      // --- [5] Verify Date key createDefault returns getTime value 1700000000000 ---
      {
        let c: FactoryCache<Date, long> = new FactoryCache<Date, long>((k: Date) => k.getTime());
        expect(c.createDefault(new Date(1700000000000))).assertEqual(1700000000000);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0250
     * @tc.name testLruCacheCreateDefault025
     * @tc.desc Merged batch (5 tests): [1] Verify RegExp key createDefault test method returns true | [2] Verify Error key createDefault returns message boom | [3] Verify array key createDefault returns length va...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify RegExp key createDefault test method returns true ---
      {
        let c: FactoryCache<RegExp, boolean> = new FactoryCache<RegExp, boolean>((k: RegExp) => k.test('aabbcc'));
        expect(c.createDefault(new RegExp('ab+c'))).assertTrue();
      }

      // --- [2] Verify Error key createDefault returns message boom ---
      {
        let c: FactoryCache<Error, string> = new FactoryCache<Error, string>((k: Error) => k.message);
        expect(c.createDefault(new Error('boom'))).assertEqual('boom');
      }

      // --- [3] Verify array key createDefault returns length value two ---
      {
        let c: FactoryCache<int[], int> = new FactoryCache<int[], int>((k: int[]) => k.length);
        expect(c.createDefault([1, 2])).assertEqual(2);
      }

      // --- [4] Verify Map key createDefault returns size value two ---
      {
        let c: FactoryCache<Map<string, int>, int> = new FactoryCache<Map<string, int>, int>((k: Map<string, int>) => k.size);
        let km: Map<string, int> = new Map<string, int>();
        km.set('a', 1);
        km.set('b', 2);
        expect(c.createDefault(km)).assertEqual(2);
      }

      // --- [5] Verify Set key createDefault returns size value three ---
      {
        let c: FactoryCache<Set<string>, int> = new FactoryCache<Set<string>, int>((k: Set<string>) => k.size);
        let ks: Set<string> = new Set<string>();
        ks.add('x');
        ks.add('y');
        ks.add('z');
        expect(c.createDefault(ks)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0260
     * @tc.name testLruCacheCreateDefault026
     * @tc.desc Merged batch (5 tests): [1] Verify class instance key createDefault returns id field seven | [2] Verify Int32Array key createDefault returns length value four | [3] Verify long boundary key createD...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify class instance key createDefault returns id field seven ---
      {
        let c: FactoryCache<KeyObjOne, int> = new FactoryCache<KeyObjOne, int>((k: KeyObjOne) => k.id);
        expect(c.createDefault(new KeyObjOne(7))).assertEqual(7);
      }

      // --- [2] Verify Int32Array key createDefault returns length value four ---
      {
        let c: FactoryCache<Int32Array, int> = new FactoryCache<Int32Array, int>((k: Int32Array) => k.length);
        expect(c.createDefault(new Int32Array(4))).assertEqual(4);
      }

      // --- [3] Verify long boundary key createDefault returns key plus one value ---
      {
        let c: FactoryCache<long, long> = new FactoryCache<long, long>((k: long) => k + 1);
        expect(c.createDefault(2147483648)).assertEqual(2147483649);
      }

      // --- [4] Verify double key createDefault returns floored key value two ---
      {
        let c: FactoryCache<double, int> = new FactoryCache<double, int>((k: double) => Double.toInt(Math.floor(k)));
        expect(c.createDefault(2.7)).assertEqual(2);
      }

      // --- [5] Verify constant value cache with string key int value returns 55 ---
      {
        let c: ConstValueCache<string, int> = new ConstValueCache<string, int>(55, 64);
        expect(c.createDefault('q')).assertEqual(55);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0270
     * @tc.name testLruCacheCreateDefault027
     * @tc.desc Merged batch (5 tests): [1] Verify constant value cache with int key string value returns gen | [2] Verify constant value cache with string key Date value returns Date | [3] Verify undefined union ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify constant value cache with int key string value returns gen ---
      {
        let c: ConstValueCache<int, string> = new ConstValueCache<int, string>('gen', 64);
        expect(c.createDefault(1)).assertEqual('gen');
      }

      // --- [2] Verify constant value cache with string key Date value returns Date ---
      {
        let c: ConstValueCache<string, Date> = new ConstValueCache<string, Date>(new Date(999), 64);
        expect(c.createDefault('d')!.getTime()).assertEqual(999);
      }

      // --- [3] Verify undefined union key createDefault returns minus one branch value ---
      {
        let c: FactoryCache<string | undefined, int> = new FactoryCache<string | undefined, int>((k: string | undefined) => k === undefined ? -1 : 0);
        expect(c.createDefault(undefined)).assertEqual(-1);
      }

      // --- [4] Verify createDefault exception propagates through get miss path ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => { throw new Error('create-default-fail'); });
        let thrown: boolean = false;
        try {
          c.get(1);
          expect().assertFail();
        } catch (e) {
          thrown = true;
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(thrown).assertTrue();
      }

      // --- [5] Verify single key calls are deterministic returning equal values ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => k * 7);
        let a: int = c.createDefault(2)!;
        let b: int = c.createDefault(2)!;
        expect(a).assertEqual(b);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0280
     * @tc.name testLruCacheCreateDefault028
     * @tc.desc Merged batch (5 tests): [1] Verify unmatched negative key minus one returns key itself | [2] Verify unmatched key negative length returns key itself after five entries loaded | [3] Verify createDef...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify unmatched negative key minus one returns key itself ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        expect(c.createDefault(-1)).assertEqual(-1);
      }

      // --- [2] Verify unmatched key negative length returns key itself after five entries loaded ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        for (let i: int = 0; i < 5; i = i + 1) {
          c.put(i, i * 10);
        }
        expect(c.createDefault(-5)).assertEqual(-5);
      }

      // --- [3] Verify createDefault on the negative of a stored key returns that key and leaves the mirrored entry intact ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        for (let i: int = 0; i < 5; i = i + 1) {
          c.put(i, i * 10);
        }
        expect(c.createDefault(-3)).assertEqual(-3);
        expect(c.get(3)).assertEqual(30);
      }

      // --- [4] Verify unmatched boundary key equal to length returns key itself after five entries loaded ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        for (let i: int = 0; i < 5; i = i + 1) {
          c.put(i, i * 10);
        }
        expect(c.createDefault(5)).assertEqual(5);
      }

      // --- [5] Verify createDefault on an int key equal to a stored value returns that key and does not insert it ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        for (let i: int = 0; i < 5; i = i + 1) {
          c.put(i, i * 10);
        }
        expect(c.createDefault(10)).assertEqual(10);
        expect(c.length).assertEqual(5);
        expect(c.contains(10)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0290
     * @tc.name testLruCacheCreateDefault029
     * @tc.desc Merged batch (5 tests): [1] Verify unmatched huge positive int max key returns key itself without truncation | [2] Verify unmatched huge negative int min key returns key itself without truncation |...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify unmatched huge positive int max key returns key itself without truncation ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        expect(c.createDefault(2147483647)).assertEqual(2147483647);
        expect(c.length).assertEqual(0);
      }

      // --- [2] Verify unmatched huge negative int min key returns key itself without truncation ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        expect(c.createDefault(-2147483648)).assertEqual(-2147483648);
      }

      // --- [3] Verify default createDefault returns undefined for null union key ---
      {
        let c: util.LRUCache<string | null, int> = new util.LRUCache<string | null, int>();
        expect(c.createDefault(null)).assertEqual(undefined);
      }

      // --- [4] Verify overridden createDefault returns minus one branch for null key ---
      {
        let c: FactoryCache<string | null, int> = new FactoryCache<string | null, int>((k: string | null) => k === null ? -1 : 0);
        expect(c.createDefault(null)).assertEqual(-1);
      }

      // --- [5] Verify default createDefault returns undefined for undefined union key ---
      {
        let c: util.LRUCache<string | undefined, int> = new util.LRUCache<string | undefined, int>();
        expect(c.createDefault(undefined)).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0300
     * @tc.name testLruCacheCreateDefault030
     * @tc.desc Merged batch (5 tests): [1] Verify default createDefault returns undefined for NaN double key | [2] Verify overridden createDefault returns minus seven branch for NaN key | [3] Verify negative zero...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify default createDefault returns undefined for NaN double key ---
      {
        let c: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        expect(c.createDefault(Double.NaN)).assertEqual(undefined);
      }

      // --- [2] Verify overridden createDefault returns minus seven branch for NaN key ---
      {
        let c: FactoryCache<double, int> = new FactoryCache<double, int>((k: double) => isNaN(k) ? -7 : 0);
        expect(c.createDefault(Double.NaN)).assertEqual(-7);
      }

      // --- [3] Verify negative zero key result keeps negative zero semantics via reciprocal ---
      {
        let c: FactoryCache<double, double> = new FactoryCache<double, double>((k: double) => k === 0 ? -0.0 : 1.0);
        let r: double = c.createDefault(-0)!;
        expect(1 / r).assertEqual(Double.NEGATIVE_INFINITY);
      }

      // --- [4] Verify type mismatch numeric key misses stored string key and triggers createDefault ---
      {
        let c: ConstValueCache<string | double, int> = new ConstValueCache<string | double, int>(300);
        c.put('k', 1);
        expect(c.get(7)).assertEqual(300);
      }

      // --- [5] Verify NaN key never equals stored numeric key and triggers createDefault ---
      {
        let c: ConstValueCache<double, int> = new ConstValueCache<double, int>(400);
        c.put(1, 10);
        expect(c.get(Double.NaN)).assertEqual(400);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0310
     * @tc.name testLruCacheCreateDefault031
     * @tc.desc Merged batch (5 tests): [1] Verify createDefault on empty cache keeps length zero | [2] Verify createDefault on single element cache keeps length one | [3] Verify get of middle key still returns sh...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault on empty cache keeps length zero ---
      {
        let c: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        c.createDefault(9);
        expect(c.length).assertEqual(0);
      }

      // --- [2] Verify createDefault on single element cache keeps length one ---
      {
        let c: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        c.put(1, 10);
        c.createDefault(9);
        expect(c.length).assertEqual(1);
      }

      // --- [3] Verify get of middle key still returns shared value after createDefault on all-same value set ---
      {
        let c: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        c.put(1, 42);
        c.put(2, 42);
        c.put(3, 42);
        c.createDefault(9);
        expect(c.get(2)).assertEqual(42);
      }

      // --- [4] Verify direct createDefault returns derived value not stored value ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => k * 5);
        c.put(1, 10);
        expect(c.createDefault(1)).assertEqual(5);
      }

      // --- [5] Verify get of existing key does not trigger createDefault and keeps create count zero ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => k * 5);
        c.put(1, 10);
        c.get(1);
        expect(c.getCreateCount()).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0320
     * @tc.name testLruCacheCreateDefault032
     * @tc.desc Merged batch (5 tests): [1] Verify createDefault direct call throws Error with preserved message | [2] Verify createDefault throws Error via get miss path with preserved message | [3] Verify TypeEr...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault direct call throws Error with preserved message ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => { throw new Error('direct-throw'); });
        let msg: string = '';
        try {
          c.createDefault(1);
          expect().assertFail();
        } catch (e) {
          msg = e.message;
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(msg).assertEqual('direct-throw');
      }

      // --- [2] Verify createDefault throws Error via get miss path with preserved message ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => { throw new Error('create-fail'); });
        let msg: string = '';
        try {
          c.get(5);
          expect().assertFail();
        } catch (e) {
          msg = e.message;
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(msg).assertEqual('create-fail');
      }

      // --- [3] Verify TypeError thrown by createDefault propagates with name TypeError ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => { throw new TypeError('bad-key'); });
        let name: string = '';
        try {
          c.get(1);
          expect().assertFail();
        } catch (e) {
          name = e.name;
          expect(e.name).assertEqual('TypeError');
          expect(e.code).assertEqual(0);
        }
        expect(name).assertEqual('TypeError');
      }

      // --- [4] Verify custom error subclass thrown by createDefault is caught by instanceof ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => { throw new CustomDefaultError(); });
        let caught: boolean = false;
        try {
          c.createDefault(2);
          expect().assertFail();
        } catch (e) {
          caught = e instanceof CustomDefaultError;
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(caught).assertTrue();
      }

      // --- [5] Verify conditional throw in createDefault propagates via get miss ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => { if (k === 1) { throw new Error('one'); } return k; });
        let msg: string = '';
        try {
          c.get(1);
          expect().assertFail();
        } catch (e) {
          msg = e.message;
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(msg).assertEqual('one');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0330
     * @tc.name testLruCacheCreateDefault033
     * @tc.desc Merged batch (5 tests): [1] Verify conditional createDefault returns normal value for non-throwing key | [2] Verify cache remains usable after createDefault error is caught | [3] Verify failed crea...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify conditional createDefault returns normal value for non-throwing key ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => { if (k === 1) { throw new Error('one'); } return k; });
        expect(c.get(2)).assertEqual(2);
      }

      // --- [2] Verify cache remains usable after createDefault error is caught ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => { throw new Error('create-default-fail'); });
        try {
          c.get(1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        c.put(5, 50);
        expect(c.get(5)).assertEqual(50);
      }

      // --- [3] Verify failed createDefault key is not inserted into cache ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => { throw new Error('create-default-fail'); });
        try {
          c.get(1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(c.contains(1)).assertFalse();
      }

      // --- [4] Verify createDefault returning undefined leaves getCreateCount at 0 ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => undefined);
        c.get(3);
        expect(c.getCreateCount()).assertEqual(0);
      }

      // --- [5] Verify get returns undefined for odd key through createDefault undefined branch ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => { if (k % 2 === 1) { return undefined; } return k * 10; });
        expect(c.get(1)).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0340
     * @tc.name testLruCacheCreateDefault034
     * @tc.desc Merged batch (5 tests): [1] Verify get returns created value for even key through createDefault value branch | [2] Verify get miss increments miss count to one | [3] Verify second get hit after fir...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get returns created value for even key through createDefault value branch ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => { if (k % 2 === 1) { return undefined; } return k * 10; });
        expect(c.get(2)).assertEqual(20);
      }

      // --- [2] Verify get miss increments miss count to one ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        c.get(5);
        expect(c.getMissCount()).assertEqual(1);
      }

      // --- [3] Verify second get hit after first miss increments match count to one ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        c.get(5);
        c.get(5);
        expect(c.getMatchCount()).assertEqual(1);
      }

      // --- [4] Verify direct createDefault after a hit keeps miss count zero ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        c.put(1, 10);
        c.get(1);
        c.createDefault(2);
        expect(c.getMissCount()).assertEqual(0);
      }

      // --- [5] Verify direct createDefault twice increments external counter to two ---
      {
        let calls: int = 0;
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => {
          calls = calls + 1;
          return k;
        });
        c.createDefault(1);
        c.createDefault(2);
        expect(calls).assertEqual(2);
        expect(c.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0350
     * @tc.name testLruCacheCreateDefault035
     * @tc.desc Merged batch (5 tests): [1] Verify get-miss createDefault insertion invokes no afterRemoval | [2] Verify capacity one cache eviction reports isEvict true on second create | [3] Verify capacity one ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get-miss createDefault insertion invokes no afterRemoval ---
      {
        let c: RemovalWatchCache<int, int> = new RemovalWatchCache<int, int>((k: int) => k * 2);
        c.get(4);
        expect(c.removalCalls).assertEqual(0);
      }

      // --- [2] Verify capacity one cache eviction reports isEvict true on second create ---
      {
        let c: RemovalWatchCache<int, int> = new RemovalWatchCache<int, int>((k: int) => k, 1);
        c.get(1);
        c.get(2);
        expect(c.lastIsEvict).assertTrue();
      }

      // --- [3] Verify capacity one cache eviction reports oldest key one ---
      {
        let c: RemovalWatchCache<int, int> = new RemovalWatchCache<int, int>((k: int) => k, 1);
        c.get(1);
        c.get(2);
        expect(c.lastKey).assertEqual(1);
      }

      // --- [4] Verify returning undefined on get miss does not trigger afterRemoval ---
      {
        let c: RemovalWatchCache<int, int> = new RemovalWatchCache<int, int>((k: int) => { return undefined; });
        c.get(7);
        expect(c.removalCalls).assertEqual(0);
      }

      // --- [5] Verify capacity one cache get miss inserts created value ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>(1);
        c.get(1);
        expect(c.contains(1)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0360
     * @tc.name testLruCacheCreateDefault036
     * @tc.desc Merged batch (5 tests): [1] Verify evicted key recreated through get cycles returns one | [2] Verify long precision key createDefault preserves value | [3] Verify double fractional key createDefaul...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify evicted key recreated through get cycles returns one ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>(1);
        c.get(1);
        c.get(2);
        expect(c.get(1)).assertEqual(1);
      }

      // --- [2] Verify long precision key createDefault preserves value ---
      {
        let c: KeyIdentityCache<long> = new KeyIdentityCache<long>();
        let probe: long = 9007199254740993;
        expect(c.createDefault(probe)).assertEqual(9007199254740993);
      }

      // --- [3] Verify double fractional key createDefault returns same value ---
      {
        let c: KeyIdentityCache<double> = new KeyIdentityCache<double>();
        expect(c.createDefault(0.1)).assertEqual(0.1);
      }

      // --- [4] Verify a <bigint,bigint> child createDefault(0n) returns key plus 1n value 1n ---
      {
        let c: FactoryCache<bigint, bigint> = new FactoryCache<bigint, bigint>((k: bigint) => k + 1n);
        let expected: bigint = 1n;
        let got: bigint | undefined = c.createDefault(0n);
        expect(got).assertEqual(expected);
      }

      // --- [5] Verify a <bigint,bigint> child createDefault on extreme key 9223372036854775807n returns 9223372036854775808n without overflow ---
      {
        let c: FactoryCache<bigint, bigint> = new FactoryCache<bigint, bigint>((k: bigint) => k + 1n);
        expect(c.createDefault(9223372036854775807n)).assertEqual(9223372036854775808n);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0370
     * @tc.name testLruCacheCreateDefault037
     * @tc.desc Merged batch (5 tests): [1] Verify double max key createDefault returns same extreme value | [2] Verify double subnormal key createDefault returns same value | [3] Verify Date keys with same conten...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify double max key createDefault returns same extreme value ---
      {
        let c: KeyIdentityCache<double> = new KeyIdentityCache<double>();
        let got: double | undefined = c.createDefault(1.7976931348623157e308);
        expect(got).assertEqual(1.7976931348623157e308);
      }

      // --- [2] Verify double subnormal key createDefault returns same value ---
      {
        let c: KeyIdentityCache<double> = new KeyIdentityCache<double>();
        expect(c.createDefault(5e-324)).assertEqual(5e-324);
      }

      // --- [3] Verify Date keys with same content produce equal createDefault results ---
      {
        let c: FactoryCache<Date, long> = new FactoryCache<Date, long>((k: Date) => k.getTime());
        let firstDate: Date = new Date(1700000000000);
        let secondDate: Date = new Date(1700000000000);
        expect(c.createDefault(firstDate)).assertEqual(c.createDefault(secondDate));
      }

      // --- [4] Verify RegExp keys with same pattern produce equal createDefault results ---
      {
        let c: FactoryCache<RegExp, boolean> = new FactoryCache<RegExp, boolean>((k: RegExp) => k.test('aabbcc'));
        let firstRegex: RegExp = new RegExp('b+');
        let secondRegex: RegExp = new RegExp('b+');
        expect(c.createDefault(firstRegex)).assertEqual(c.createDefault(secondRegex));
      }

      // --- [5] Verify array keys with same content produce equal createDefault length results ---
      {
        let c: FactoryCache<int[], int> = new FactoryCache<int[], int>((k: int[]) => k.length);
        let firstArray: int[] = [1, 2, 3];
        let secondArray: int[] = [1, 2, 3];
        expect(c.createDefault(firstArray)).assertEqual(c.createDefault(secondArray));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0380
     * @tc.name testLruCacheCreateDefault038
     * @tc.desc Merged batch (5 tests): [1] Verify generic subclass with int key type returns created value | [2] Verify generic subclass with string key type returns constant value | [3] Verify Promise reference ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify generic subclass with int key type returns created value ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        expect(c.createDefault(8)).assertEqual(8);
        expect(c.isEmpty()).assertTrue();
      }

      // --- [2] Verify generic subclass with string key type returns constant value ---
      {
        let c: ConstValueCache<string, int> = new ConstValueCache<string, int>(1);
        expect(c.createDefault('abc')).assertEqual(1);
      }

      // --- [3] Verify Promise reference key createDefault returns constant one ---
      {
        let c: ConstValueCache<Promise<int>, int> = new ConstValueCache<Promise<int>, int>(1);
        let p: Promise<int> = Promise.resolve<int>(1);
        expect(c.createDefault(p)).assertEqual(1);
      }

      // --- [4] Verify WeakMap reference key createDefault returns constant two ---
      {
        let c: ConstValueCache<WeakMap<object, int>, int> = new ConstValueCache<WeakMap<object, int>, int>(2);
        let wm: WeakMap<object, int> = new WeakMap<object, int>();
        expect(c.createDefault(wm)).assertEqual(2);
      }

      // --- [5] Verify Record key createDefault returns property value ---
      {
        let c: FactoryCache<Record<string, int>, int> = new FactoryCache<Record<string, int>, int>((k: Record<string, int>) => k['a']);
        let rk: Record<string, int> = { 'a': 5 };
        expect(c.createDefault(rk)).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0390
     * @tc.name testLruCacheCreateDefault039
     * @tc.desc Merged batch (5 tests): [1] Verify get long precision miss returns same value through createDefault | [2] Verify get miss created entry increments length and flips isEmpty false | [3] Verify multip...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify get long precision miss returns same value through createDefault ---
      {
        let c: KeyIdentityCache<long> = new KeyIdentityCache<long>();
        expect(c.get(9007199254740993)).assertEqual(9007199254740993);
      }

      // --- [2] Verify get miss created entry increments length and flips isEmpty false ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        c.get(7);
        expect(c.length).assertEqual(1);
        expect(c.isEmpty()).assertFalse();
        expect(c.contains(7)).assertTrue();
      }

      // --- [3] Verify multiple get misses create entries exposed by keys and length ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        c.get(1);
        c.get(2);
        c.get(3);
        let ks: int[] = c.keys();
        expect(c.length).assertEqual(3);
        expect(ks.length).assertEqual(3);
        expect(c.contains(1)).assertTrue();
        expect(c.contains(2)).assertTrue();
        expect(c.contains(3)).assertTrue();
      }

      // --- [4] Verify values returns value created through get miss ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => k * 10);
        c.get(5);
        let vs: int[] = c.values();
        expect(vs.length).assertEqual(1);
        expect(vs[0]).assertEqual(50);
        expect(c.get(5)).assertEqual(50);
      }

      // --- [5] Verify put and get-created entries coexist in keys and values ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => k * 10);
        c.put(10, 100);
        c.get(20);
        let ks: int[] = c.keys();
        let vs: int[] = c.values();
        expect(ks.length).assertEqual(2);
        expect(vs.length).assertEqual(2);
        expect(ks.indexOf(10)).assertEqual(0);
        expect(ks.indexOf(20)).assertEqual(1);
        expect(vs.indexOf(100)).assertEqual(0);
        expect(vs.indexOf(200)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0400
     * @tc.name testLruCacheCreateDefault040
     * @tc.desc Merged batch (5 tests): [1] Verify removing created key makes next get miss recreate it | [2] Verify clear empties cache and next get miss recreates entry | [3] Verify put overwrite then remove the...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify removing created key makes next get miss recreate it ---
      {
        let calls: int = 0;
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => {
          calls = calls + 1;
          return k;
        });
        c.get(1);
        c.get(1);
        expect(calls).assertEqual(1);
        c.remove(1);
        c.get(1);
        expect(calls).assertEqual(2);
        expect(c.length).assertEqual(1);
      }

      // --- [2] Verify clear empties cache and next get miss recreates entry ---
      {
        let calls: int = 0;
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => {
          calls = calls + 1;
          return k;
        });
        c.get(1);
        c.get(2);
        expect(calls).assertEqual(2);
        c.clear();
        expect(c.isEmpty()).assertTrue();
        c.get(1);
        expect(calls).assertEqual(3);
        expect(c.length).assertEqual(1);
      }

      // --- [3] Verify put overwrite then remove then get miss recreates derived value ---
      {
        let calls: int = 0;
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => {
          calls = calls + 1;
          return k + 100;
        });
        expect(c.get(5)).assertEqual(105);
        c.put(5, 7);
        expect(c.get(5)).assertEqual(7);
        c.remove(5);
        expect(c.contains(5)).assertFalse();
        expect(c.get(5)).assertEqual(105);
        expect(calls).assertEqual(2);
      }

      // --- [4] Verify fourth get miss on capacity three cache evicts oldest created key ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>(3);
        c.get(0);
        c.get(1);
        c.get(2);
        c.get(3);
        expect(c.length).assertEqual(3);
        expect(c.contains(0)).assertFalse();
        expect(c.contains(1)).assertTrue();
        expect(c.contains(2)).assertTrue();
        expect(c.contains(3)).assertTrue();
      }

      // --- [5] Verify evicted created key recreated through get miss evicts next oldest ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>(2);
        c.get(1);
        c.get(2);
        c.get(3);
        c.get(1);
        expect(c.length).assertEqual(2);
        expect(c.contains(1)).assertTrue();
        expect(c.contains(2)).assertFalse();
        expect(c.contains(3)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0410
     * @tc.name testLruCacheCreateDefault041
     * @tc.desc Merged batch (5 tests): [1] Verify updateCapacity shrink evicts oldest created key | [2] Verify updateCapacity grow holds more created keys without eviction | [3] Verify same-content different Int3...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify updateCapacity shrink evicts oldest created key ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>(3);
        c.get(1);
        c.get(2);
        c.get(3);
        expect(c.length).assertEqual(3);
        c.updateCapacity(2);
        expect(c.length).assertEqual(2);
        expect(c.contains(1)).assertFalse();
        expect(c.contains(2)).assertTrue();
        expect(c.contains(3)).assertTrue();
      }

      // --- [2] Verify updateCapacity grow holds more created keys without eviction ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>(1);
        c.get(1);
        expect(c.length).assertEqual(1);
        c.updateCapacity(3);
        c.get(2);
        c.get(3);
        expect(c.length).assertEqual(3);
        expect(c.contains(1)).assertTrue();
        expect(c.contains(2)).assertTrue();
        expect(c.contains(3)).assertTrue();
      }

      // --- [3] Verify same-content different Int32Array reference misses and triggers createDefault ---
      {
        let calls: int = 0;
        let c: FactoryCache<Int32Array, string> = new FactoryCache<Int32Array, string>((k: Int32Array) => {
          calls = calls + 1;
          return 'created';
        });
        let firstKey: Int32Array = new Int32Array([1, 2, 3]);
        let secondKey: Int32Array = new Int32Array([1, 2, 3]);
        c.put(firstKey, 'hit');
        expect(c.get(secondKey)).assertEqual('created');
        expect(calls).assertEqual(1);
      }

      // --- [4] Verify same-content different Uint8Array reference misses and triggers createDefault ---
      {
        let calls: int = 0;
        let c: FactoryCache<Uint8Array, string> = new FactoryCache<Uint8Array, string>((k: Uint8Array) => {
          calls = calls + 1;
          return 'created';
        });
        let firstKey: Uint8Array = new Uint8Array([1, 2, 3]);
        let secondKey: Uint8Array = new Uint8Array([1, 2, 3]);
        c.put(firstKey, 'hit');
        expect(c.get(secondKey)).assertEqual('created');
        expect(calls).assertEqual(1);
        expect(c.contains(secondKey)).assertTrue();
      }

      // --- [5] Verify createDefault receives same class instance reference used for query on miss ---
      {
        let lastKey: KeyObjOne | undefined = undefined;
        let c: FactoryCache<KeyObjOne, string> = new FactoryCache<KeyObjOne, string>((k: KeyObjOne) => {
          lastKey = k;
          return 'made';
        });
        let o: KeyObjOne = new KeyObjOne(1);
        expect(c.get(o)).assertEqual('made');
        expect(lastKey).assertEqual(o);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0420
     * @tc.name testLruCacheCreateDefault042
     * @tc.desc Merged batch (5 tests): [1] Verify two cache instances create entries independently | [2] Verify undefined createDefault return leaves cache empty and miss count increases | [3] Verify filling defa...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two cache instances create entries independently ---
      {
        let aCalls: int = 0;
        let a: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => {
          aCalls = aCalls + 1;
          return k;
        });
        let bCalls: int = 0;
        let b: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => {
          bCalls = bCalls + 1;
          return k;
        });
        a.get(1);
        expect(aCalls).assertEqual(1);
        expect(b.length).assertEqual(0);
        b.get(1);
        expect(bCalls).assertEqual(1);
        expect(a.length).assertEqual(1);
        expect(a.contains(2)).assertFalse();
      }

      // --- [2] Verify undefined createDefault return leaves cache empty and miss count increases ---
      {
        let c: FactoryCache<int, int> = new FactoryCache<int, int>((k: int) => undefined);
        c.get(9);
        expect(c.getMissCount()).assertEqual(1);
        expect(c.length).assertEqual(0);
        c.get(9);
        expect(c.getMissCount()).assertEqual(2);
        expect(c.length).assertEqual(0);
      }

      // --- [3] Verify filling default capacity through get misses evicts oldest on overflow ---
      {
        let c: KeyIdentityCache<int> = new KeyIdentityCache<int>();
        for (let i: int = 0; i < 64; i = i + 1) {
          c.get(i);
        }
        expect(c.length).assertEqual(64);
        c.get(64);
        expect(c.length).assertEqual(64);
        expect(c.contains(0)).assertFalse();
        expect(c.contains(64)).assertTrue();
      }

      // --- [4] Verify Map key created entry exposed by keys with same reference ---
      {
        let c: ConstValueCache<Map<string, int>, string> = new ConstValueCache<Map<string, int>, string>('created');
        let m: Map<string, int> = new Map<string, int>();
        m.set('k', 1);
        c.get(m);
        let ks: Map<string, int>[] = c.keys();
        expect(ks.length).assertEqual(1);
        expect(ks[0]).assertEqual(m);
        expect(c.contains(m)).assertTrue();
      }

      // --- [5] Verify negative zero and zero double keys share slot so get hits without createDefault ---
      {
        let calls: int = 0;
        let c: FactoryCache<double, string> = new FactoryCache<double, string>((k: double) => {
          calls = calls + 1;
          return 'created';
        });
        let nz: double = -1.0 / Double.POSITIVE_INFINITY;
        c.put(nz, 'hit');
        expect(c.get(0.0)).assertEqual('hit');
        expect(calls).assertEqual(0);
        expect(c.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_CREATE_DEFAULT_0430
     * @tc.name testLruCacheCreateDefault043
     * @tc.desc Merged batch (4 tests): [1] Verify createDefault echoes each of the NUL zero width space and byte order mark keys | [2] Verify createDefault is invoked for the minimum long key and echoes it back |...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheCreateDefault043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify createDefault echoes each of the NUL zero width space and byte order mark keys ---
      {
        let cache: KeyEchoCache<string> = new KeyEchoCache<string>();
        expect(cache.get('\u0000')).assertEqual('\u0000');
        expect(cache.lastKey).assertEqual('\u0000');
        expect(cache.get('\u200B')).assertEqual('\u200B');
        expect(cache.lastKey).assertEqual('\u200B');
        expect(cache.get('\uFEFF')).assertEqual('\uFEFF');
        expect(cache.lastKey).assertEqual('\uFEFF');
      }

      // --- [2] Verify createDefault is invoked for the minimum long key and echoes it back ---
      {
        let cache: KeyEchoCache<long> = new KeyEchoCache<long>();
        let minLong: long = -9223372036854775807 - 1;
        expect(cache.get(minLong)).assertEqual(minLong);
        expect(cache.lastKey).assertEqual(minLong);
        expect(cache.length).assertEqual(1);
      }

      // --- [3] Verify createDefault produces distinct entries for two enum member keys ---
      {
        let cache: KeyIdentityCache<CdSlot> = new KeyIdentityCache<CdSlot>(2);
        expect(cache.get(CdSlot.Low)).assertEqual(CdSlot.Low);
        expect(cache.get(CdSlot.High)).assertEqual(CdSlot.High);
        expect(cache.length).assertEqual(2);
        expect(cache.getCreateCount()).assertEqual(2);
      }

      // --- [4] Verify createDefault returning a fresh cache instance caches it and stops recreating it ---
      {
        let created: int = 0;
        let pool: FactoryCache<string, util.LRUCache<int, int>> =
          new FactoryCache<string, util.LRUCache<int, int>>(
            (key: string): util.LRUCache<int, int> | undefined => {
              created = created + 1;
              let fresh: util.LRUCache<int, int> = new util.LRUCache<int, int>(4);
              fresh.put(created, created);
              return fresh;
            }, 2);
        let first: util.LRUCache<int, int> | undefined = pool.get('a');
        expect(first!.get(1)).assertEqual(1);
        expect(pool.getCreateCount()).assertEqual(1);
        pool.get('a');
        expect(created).assertEqual(1);
        expect(pool.length).assertEqual(1);
      }
    });

  });
}
