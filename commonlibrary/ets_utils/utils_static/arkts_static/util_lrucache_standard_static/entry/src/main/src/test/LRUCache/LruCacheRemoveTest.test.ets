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
} from '@ohos/hypium-static/src/main/indexStatic';
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

class EntryValue {
  label: string = '';
  num: int = 0;
  constructor(label: string, num: int) {
    this.label = label;
    this.num = num;
  }
}

class Payload {
  tag: string = '';
  constructor(tag: string) {
    this.tag = tag;
  }
}

class Token {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

class CountRemovalCache<K, V> extends util.LRUCache<K, V> {
  count: int = 0;
  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V): void {
    this.count = this.count + 1;
  }
}

class BoomRemovalCache<K, V> extends util.LRUCache<K, V> {
  afterRemoval(isEvict: boolean, key: K, value: V, newValue: V): void {
    throw new Error('afterRemoval-boom');
  }
}

enum RemSlot {
  First = 0,
  Second = 1
}

export default function lruCacheRemoveTest(): void {
  describe('LruCacheRemoveTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0010
     * @tc.name testLruCacheRemove001
     * @tc.desc Merged batch (5 tests): [1] Verify remove hit on int key returns associated value | [2] Verify remove miss on absent int key returns undefined | [3] Verify remove hit on string key returns associat...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove hit on int key returns associated value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(7, 70);
        expect(lru.remove(7)).assertEqual(70);
      }

      // --- [2] Verify remove miss on absent int key returns undefined ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(7, 70);
        expect(lru.remove(8)).assertEqual(undefined);
      }

      // --- [3] Verify remove hit on string key returns associated value ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        let key: string = 'key1';
        lru.put(key, 'val1');
        expect(lru.remove(key)).assertEqual('val1');
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [4] Verify high end of the byte range: maximum byte [0xFF] does not match stored high-bit byte [0x80], remove returns undefined ---
      {
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(new Uint8Array([0x80]), 1);
        expect(lru.remove(new Uint8Array([0xFF]))).assertEqual(undefined);
      }

      // --- [5] Verify low end of the byte range: minimum byte [0x00] does not match stored byte [0x01], remove returns undefined ---
      {
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(new Uint8Array([0x01]), 1);
        expect(lru.remove(new Uint8Array([0x00]))).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0020
     * @tc.name testLruCacheRemove002
     * @tc.desc Merged batch (5 tests): [1] Verify remove hit on two-byte all-zero key whose length distinguishes it from single byte 0x00 | [2] Verify remove single-byte [0x00] misses stored two-byte [0x00,0x00] ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove hit on two-byte all-zero key whose length distinguishes it from single byte 0x00 ---
      {
        let twoZeroByteKey: Uint8Array = new Uint8Array([0x00, 0x00]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(twoZeroByteKey, 15);
        let removed: int | undefined = lru.remove(twoZeroByteKey);
        expect(removed).assertEqual(15);
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [2] Verify remove single-byte [0x00] misses stored two-byte [0x00,0x00] key ---
      {
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(new Uint8Array([0x00, 0x00]), 1);
        expect(lru.remove(new Uint8Array([0x00]))).assertEqual(undefined);
      }

      // --- [3] Verify remove hit on a four-byte key of high-bit bytes 0xDE,0xAD,0xBE,0xEF returns associated value ---
      {
        let deadBeefKey: Uint8Array = new Uint8Array([0xDE, 0xAD, 0xBE, 0xEF]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(deadBeefKey, 17);
        expect(lru.remove(deadBeefKey)).assertEqual(17);
      }

      // --- [4] Verify remove hit on key with inner 0x00 byte not truncating ---
      {
        let kMid: Uint8Array = new Uint8Array([0x01, 0x00, 0x02]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(kMid, 18);
        expect(lru.remove(kMid)).assertEqual(18);
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [5] Verify remove hit on key with trailing 0x00 byte not truncating ---
      {
        let kTail: Uint8Array = new Uint8Array([0x01, 0x02, 0x00]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(kTail, 19);
        let removed: int | undefined = lru.remove(kTail);
        expect(removed).assertEqual(19);
        expect(lru.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0030
     * @tc.name testLruCacheRemove003
     * @tc.desc Merged batch (5 tests): [1] Verify new [5,6] Uint8Array reference misses stored same-content key | [2] Verify remove hit on same [5,6] Uint8Array reference | [3] Verify remove hit on UTF-8 three-by...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify new [5,6] Uint8Array reference misses stored same-content key ---
      {
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(new Uint8Array([5, 6]), 20);
        expect(lru.remove(new Uint8Array([5, 6]))).assertEqual(undefined);
      }

      // --- [2] Verify remove hit on same [5,6] Uint8Array reference ---
      {
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        let bytesFiveSixKey: Uint8Array = new Uint8Array([5, 6]);
        expect(lru.contains(bytesFiveSixKey)).assertFalse();
        lru.put(bytesFiveSixKey, 21);
        expect(lru.remove(bytesFiveSixKey)).assertEqual(21);
      }

      // --- [3] Verify remove hit on UTF-8 three-byte sequence key ---
      {
        let kUtf: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(kUtf, 22);
        expect(lru.contains(kUtf)).assertTrue();
        let removed: int | undefined = lru.remove(kUtf);
        expect(removed).assertEqual(22);
      }

      // --- [4] Verify remove hit on 256-byte all-0xFF key returns associated value ---
      {
        let bigKey: Uint8Array = new Uint8Array(256);
        for (let i: int = 0; i < 256; i++) {
          bigKey.$_set(i, 0xFF);
        }
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(bigKey, 888);
        expect(lru.remove(bigKey)).assertEqual(888);
      }

      // --- [5] Verify remove prefix-only [0x0A] misses stored [0x0A,0x0B] key ---
      {
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(new Uint8Array([0x0A, 0x0B]), 24);
        expect(lru.remove(new Uint8Array([0x0A]))).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0040
     * @tc.name testLruCacheRemove004
     * @tc.desc Merged batch (5 tests): [1] Verify remove hit on mixed boundary bytes [0x00,0xFF] key | [2] Verify removing empty Uint8Array key decrements length by 1 | [3] Verify remove hit on newline string key...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove hit on mixed boundary bytes [0x00,0xFF] key ---
      {
        let kMix: Uint8Array = new Uint8Array([0x00, 0xFF]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(kMix, 25);
        let removed: int | undefined = lru.remove(kMix);
        expect(removed).assertEqual(25);
        expect(lru.length).assertEqual(0);
      }

      // --- [2] Verify removing empty Uint8Array key decrements length by 1 ---
      {
        let emptyKey: Uint8Array = new Uint8Array(0);
        let kOther: Uint8Array = new Uint8Array([1]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(emptyKey, 1);
        lru.put(kOther, 2);
        lru.remove(emptyKey);
        expect(lru.length).assertEqual(1);
      }

      // --- [3] Verify remove hit on newline string key ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('\n', 'newline');
        let before: int = lru.length;
        let removed: string | undefined = lru.remove('\n');
        expect(removed).assertEqual('newline');
        expect(lru.length).assertEqual(before - 1);
      }

      // --- [4] Verify remove hit on tab string key ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('\t', 'tab');
        expect(lru.contains('\t')).assertTrue();
        expect(lru.remove('\t')).assertEqual('tab');
      }

      // --- [5] Verify remove hit on emoji surrogate pair string key ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('😀', 'emoji');
        expect(lru.remove('😀')).assertEqual('emoji');
        expect(lru.get('😀')).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0050
     * @tc.name testLruCacheRemove005
     * @tc.desc Merged batch (5 tests): [1] Verify remove hit on lone surrogate string key | [2] Verify remove hit on NUL character string key not truncating | [3] Verify remove hit on 10000-char long string key n...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove hit on lone surrogate string key ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('\uDC04', 'lone');
        let removed: string | undefined = lru.remove('\uDC04');
        expect(removed).assertEqual('lone');
        expect(lru.length).assertEqual(0);
      }

      // --- [2] Verify remove hit on NUL character string key not truncating ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('\u0000', 'nul');
        let removed: string | undefined = lru.remove('\u0000');
        expect(removed).assertEqual('nul');
        expect(lru.get('\u0000')).assertEqual(undefined);
      }

      // --- [3] Verify remove hit on 10000-char long string key not truncating ---
      {
        let longKey: string = '';
        for (let i: int = 0; i < 10000; i++) {
          longKey = longKey + 'a';
        }
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put(longKey, 330);
        expect(lru.remove(longKey)).assertEqual(330);
      }

      // --- [4] Verify remove hit on Chinese string key ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('你好', 'zh');
        let removed: string | undefined = lru.remove('你好');
        expect(removed).assertEqual('zh');
        expect(lru.length).assertEqual(0);
      }

      // --- [5] Verify concatenated key 'x'+'y' and literal key 'xy' are same key on remove ---
      {
        let concatKey: string = 'x' + 'y';
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put(concatKey, 'concat');
        expect(lru.remove('xy')).assertEqual('concat');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0060
     * @tc.name testLruCacheRemove006
     * @tc.desc Merged batch (5 tests): [1] Verify remove '007' misses stored numeric string key '7' | [2] Verify remove hit on single-space string key without trimming | [3] Verify remove trailing-NUL 'a\u0000' m...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove '007' misses stored numeric string key '7' ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('7', 360);
        expect(lru.remove('007')).assertEqual(undefined);
      }

      // --- [2] Verify remove hit on single-space string key without trimming ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        let key: string = ' ';
        lru.put(key, 'space');
        expect(lru.contains(key)).assertTrue();
        expect(lru.remove(key)).assertEqual('space');
      }

      // --- [3] Verify remove trailing-NUL 'a\u0000' misses stored 'a' key ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 380);
        expect(lru.remove('a\u0000')).assertEqual(undefined);
      }

      // --- [4] Verify remove hit on trailing-NUL 'a\u0000' string key ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('a\u0000', 'nultail');
        expect(lru.remove('a\u0000')).assertEqual('nultail');
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [5] Verify remove hit on emoji and Chinese mixed string key ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        let value: string = 'mix';
        lru.put('😀你', value);
        let removed: string | undefined = lru.remove('😀你');
        expect(removed).assertEqual(value);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0070
     * @tc.name testLruCacheRemove007
     * @tc.desc Merged batch (5 tests): [1] Verify remove hit on pure numeric string key matches by characters | [2] Verify remove hit on negative int key -1 returns associated value | [3] Verify remove returns in...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove hit on pure numeric string key matches by characters ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('12345', 5);
        expect(lru.remove('12345')).assertEqual(5);
      }

      // --- [2] Verify remove hit on negative int key -1 returns associated value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(-1, 1002);
        expect(lru.remove(-1)).assertEqual(1002);
      }

      // --- [3] Verify remove returns int maximum value unchanged without truncation ---
      {
        let k: Uint8Array = new Uint8Array([0xFF]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        let stored: int = 2147483647;
        lru.put(k, stored);
        expect(lru.remove(k)).assertEqual(stored);
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [4] Verify remove hit on minimum byte 0x00 key returns stored negative value -5 ---
      {
        let k: Uint8Array = new Uint8Array([0x00]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(k, -5);
        expect(lru.remove(k)).assertEqual(-5);
      }

      // --- [5] Verify removing 256-byte all-0xFF big key leaves length 1 without overflow ---
      {
        let bigKey: Uint8Array = new Uint8Array(256);
        for (let i: int = 0; i < 256; i++) {
          bigKey.$_set(i, 0xFF);
        }
        let kOther: Uint8Array = new Uint8Array([1]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(bigKey, 1);
        lru.put(kOther, 2);
        lru.remove(bigKey);
        expect(lru.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0080
     * @tc.name testLruCacheRemove008
     * @tc.desc Merged batch (5 tests): [1] Verify removing one of four Uint8Array keys leaves length 3 | [2] Verify remove then re-put same Uint8Array key restores length 1 | [3] Verify remove hit does not increa...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify removing one of four Uint8Array keys leaves length 3 ---
      {
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        let kA: Uint8Array = new Uint8Array([1]);
        let kB: Uint8Array = new Uint8Array([2]);
        let kC: Uint8Array = new Uint8Array([3]);
        let kD: Uint8Array = new Uint8Array([4]);
        lru.put(kA, 1);
        lru.put(kB, 2);
        lru.put(kC, 3);
        lru.put(kD, 4);
        lru.remove(kB);
        expect(lru.length).assertEqual(3);
      }

      // --- [2] Verify remove then re-put same Uint8Array key restores length 1 ---
      {
        let k: Uint8Array = new Uint8Array([3]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(k, 1);
        lru.remove(k);
        lru.put(k, 2);
        expect(lru.length).assertEqual(1);
      }

      // --- [3] Verify remove hit does not increase getRemovalCount ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.put('b', 2);
        lru.remove('a');
        expect(lru.getRemovalCount()).assertEqual(0);
      }

      // --- [4] Verify remove miss does not increase getPutCount ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.put('b', 2);
        lru.remove('zz');
        expect(lru.getPutCount()).assertEqual(2);
      }

      // --- [5] Verify remove 4096-byte big key returns same reference and keeps byteLength ---
      {
        let bigArr: Uint8Array = new Uint8Array(4096);
        for (let i: int = 0; i < 4096; i++) {
          bigArr.$_set(i, 0x01);
        }
        let lru: util.LRUCache<Uint8Array, Uint8Array> = new util.LRUCache<Uint8Array, Uint8Array>();
        lru.put(bigArr, bigArr);
        let ret: Uint8Array | undefined = lru.remove(bigArr);
        expect(ret).assertEqual(bigArr);
        expect(ret!.byteLength).assertEqual(4096);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0090
     * @tc.name testLruCacheRemove009
     * @tc.desc Merged batch (5 tests): [1] Verify remove hit with Uint8Array key and string value instance | [2] Verify remove hit with string key and Date value returns same reference | [3] Verify remove hit wit...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove hit with Uint8Array key and string value instance ---
      {
        let k: Uint8Array = new Uint8Array([0x01]);
        let lru: util.LRUCache<Uint8Array, string> = new util.LRUCache<Uint8Array, string>();
        lru.put(k, 'byte-key');
        expect(lru.remove(k)).assertEqual('byte-key');
      }

      // --- [2] Verify remove hit with string key and Date value returns same reference ---
      {
        let dt: Date = new Date(2030, 5, 15);
        let lru: util.LRUCache<string, Date> = new util.LRUCache<string, Date>();
        lru.put('d', dt);
        expect(lru.remove('d')).assertEqual(dt);
      }

      // --- [3] Verify remove hit with same WeakMap reference as key returns associated value ---
      {
        let wm: WeakMap<object, int> = new WeakMap<object, int>();
        let lru: util.LRUCache<WeakMap<object, int>, int> = new util.LRUCache<WeakMap<object, int>, int>();
        lru.put(wm, 6);
        expect(lru.remove(wm)).assertEqual(6);
      }

      // --- [4] Verify remove different WeakMap instance misses stored WeakMap key ---
      {
        let lru: util.LRUCache<WeakMap<object, int>, int> = new util.LRUCache<WeakMap<object, int>, int>();
        lru.put(new WeakMap<object, int>(), 7);
        expect(lru.remove(new WeakMap<object, int>())).assertEqual(undefined);
      }

      // --- [5] Verify remove hit with same DataView reference as key returns associated value ---
      {
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(ab);
        let lru: util.LRUCache<DataView, int> = new util.LRUCache<DataView, int>();
        lru.put(dv, 8);
        expect(lru.remove(dv)).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0100
     * @tc.name testLruCacheRemove010
     * @tc.desc Merged batch (5 tests): [1] Verify remove hit with same Promise reference as key returns associated value | [2] Verify remove hit with same Uint16Array reference as key returns associated value | [...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove hit with same Promise reference as key returns associated value ---
      {
        let p: Promise<int> = Promise.resolve(1);
        let lru: util.LRUCache<Promise<int>, int> = new util.LRUCache<Promise<int>, int>();
        lru.put(p, 9);
        expect(lru.remove(p)).assertEqual(9);
      }

      // --- [2] Verify remove hit with same Uint16Array reference as key returns associated value ---
      {
        let u16: Uint16Array = new Uint16Array([1, 2]);
        let lru: util.LRUCache<Uint16Array, int> = new util.LRUCache<Uint16Array, int>();
        lru.put(u16, 10);
        expect(lru.remove(u16)).assertEqual(10);
        expect(lru.length).assertEqual(0);
      }

      // --- [3] Verify remove hit with same Int8Array reference as key returns associated value ---
      {
        let int8Key: Int8Array = new Int8Array([-1, 2]);
        let lru: util.LRUCache<Int8Array, int> = new util.LRUCache<Int8Array, int>();
        lru.put(int8Key, 11);
        expect(lru.remove(int8Key)).assertEqual(11);
      }

      // --- [4] Verify remove hit with Uint8Array key and Uint8Array value returns same value reference ---
      {
        let keyA: Uint8Array = new Uint8Array([1]);
        let valB: Uint8Array = new Uint8Array([2]);
        let lru: util.LRUCache<Uint8Array, Uint8Array> = new util.LRUCache<Uint8Array, Uint8Array>();
        lru.put(keyA, valB);
        expect(lru.remove(keyA)).assertEqual(valB);
      }

      // --- [5] Verify remove hit returns long large value unchanged without truncation ---
      {
        let k: Uint8Array = new Uint8Array([4]);
        let v: long = 9007199254740991;
        let lru: util.LRUCache<Uint8Array, long> = new util.LRUCache<Uint8Array, long>();
        lru.put(k, v);
        expect(lru.remove(k)).assertEqual(9007199254740991);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0110
     * @tc.name testLruCacheRemove011
     * @tc.desc Merged batch (5 tests): [1] Verify remove 4096-byte unstored big key returns undefined | [2] Verify remove DataView key misses stored Uint8Array key under Object key type | [3] Verify remove number...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove 4096-byte unstored big key returns undefined ---
      {
        let bigMiss: Uint8Array = new Uint8Array(4096);
        for (let i: int = 0; i < 4096; i++) {
          bigMiss.$_set(i, 1);
        }
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(new Uint8Array([0x01]), 1);
        expect(lru.remove(bigMiss)).assertEqual(undefined);
      }

      // --- [2] Verify remove DataView key misses stored Uint8Array key under Object key type ---
      {
        let lru: util.LRUCache<Object, int> = new util.LRUCache<Object, int>();
        lru.put(new Uint8Array([5]), 64);
        expect(lru.remove(new DataView(new ArrayBuffer(8)))).assertEqual(undefined);
      }

      // --- [3] Verify remove number key misses stored Uint8Array key under Object key type ---
      {
        let lru: util.LRUCache<Object, int> = new util.LRUCache<Object, int>();
        lru.put(new Uint8Array([5]), 65);
        expect(lru.remove(12345)).assertEqual(undefined);
      }

      // --- [4] Verify remove hit returns boolean false not undefined ---
      {
        let lru: util.LRUCache<string, boolean> = new util.LRUCache<string, boolean>();
        lru.put('f', false);
        expect(lru.remove('f')).assertFalse();
      }

      // --- [5] Verify keys array excludes removed Uint8Array key and length drops to 1 ---
      {
        let firstKey: Uint8Array = new Uint8Array([1]);
        let secondKey: Uint8Array = new Uint8Array([2]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(firstKey, 1);
        lru.put(secondKey, 2);
        lru.remove(firstKey);
        let ks: Array<Uint8Array> = lru.keys();
        expect(ks.length).assertEqual(1);
        expect(ks[0]).assertEqual(secondKey);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0120
     * @tc.name testLruCacheRemove012
     * @tc.desc Merged batch (5 tests): [1] Verify values array shrinks after removal and keeps remaining value | [2] Verify removing sole Uint8Array key makes isEmpty true | [3] Verify removing sole Uint8Array ke...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify values array shrinks after removal and keeps remaining value ---
      {
        let firstKey: Uint8Array = new Uint8Array([1]);
        let secondKey: Uint8Array = new Uint8Array([2]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(firstKey, 10);
        lru.put(secondKey, 20);
        lru.remove(firstKey);
        let vs: Array<int> = lru.values();
        expect(vs.length).assertEqual(1);
        expect(vs[0]).assertEqual(20);
      }

      // --- [2] Verify removing sole Uint8Array key makes isEmpty true ---
      {
        let k: Uint8Array = new Uint8Array([9]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(k, 9);
        lru.remove(k);
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [3] Verify removing sole Uint8Array key leaves length 0 ---
      {
        let k: Uint8Array = new Uint8Array([9]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(k, 9);
        lru.remove(k);
        expect(lru.length).assertEqual(0);
      }

      // --- [4] Verify removing oldest key keeps newest key readable via get ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('old', 1);
        lru.put('new', 2);
        lru.remove('old');
        expect(lru.get('new')).assertEqual(2);
      }

      // --- [5] Verify removing middle key preserves values insertion order of remaining elements ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a1', 10);
        lru.put('b2', 20);
        lru.put('c3', 30);
        lru.remove('b2');
        let vs: Array<int> = lru.values();
        expect(vs.length).assertEqual(2);
        expect(vs[0]).assertEqual(10);
        expect(vs[1]).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0130
     * @tc.name testLruCacheRemove013
     * @tc.desc Merged batch (5 tests): [1] Verify remove hit returns empty string value not undefined | [2] Verify removing same miss key twice returns undefined both times | [3] Verify remove after re-put same U...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove hit returns empty string value not undefined ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('k', '');
        let removed: string | undefined = lru.remove('k');
        expect(removed).assertEqual('');
        expect(lru.contains('k')).assertFalse();
      }

      // --- [2] Verify removing same miss key twice returns undefined both times ---
      {
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        let missKey: Uint8Array = new Uint8Array([77]);
        let firstMiss: int | undefined = lru.remove(missKey);
        let secondMiss: int | undefined = lru.remove(missKey);
        expect(firstMiss).assertEqual(undefined);
        expect(secondMiss).assertEqual(undefined);
      }

      // --- [3] Verify remove after re-put same Uint8Array key returns new associated value ---
      {
        let k: Uint8Array = new Uint8Array([3]);
        let lru: util.LRUCache<Uint8Array, int> = new util.LRUCache<Uint8Array, int>();
        lru.put(k, 30);
        lru.remove(k);
        lru.put(k, 31);
        expect(lru.remove(k)).assertEqual(31);
      }

      // --- [4] Verify remove hit return value type is int ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        let key: string = 'a';
        lru.put(key, 1);
        let ret: int | undefined = lru.remove(key);
        expect(typeof ret).assertEqual('int');
        expect(ret).assertEqual(1);
      }

      // --- [5] Verify remove hit double value return type is number ---
      {
        let lru: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        lru.put('b', 2.5);
        let before: int = lru.length;
        let ret: double | undefined = lru.remove('b');
        expect(typeof ret).assertEqual('number');
        expect(lru.length).assertEqual(before - 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0140
     * @tc.name testLruCacheRemove014
     * @tc.desc Merged batch (5 tests): [1] Verify remove miss return value type is undefined | [2] Verify remove hit class instance value is instanceof target class | [3] Verify remove hit string value return typ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove miss return value type is undefined ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        let ret: int | undefined = lru.remove('zzz');
        expect(typeof ret).assertEqual('undefined');
        expect(lru.contains('a')).assertTrue();
      }

      // --- [2] Verify remove hit class instance value is instanceof target class ---
      {
        let lru: util.LRUCache<string, EntryValue> = new util.LRUCache<string, EntryValue>();
        let ev: EntryValue = new EntryValue('type1', 1);
        lru.put('k', ev);
        let ret: EntryValue | undefined = lru.remove('k');
        expect(ret instanceof EntryValue).assertTrue();
        expect(ret!.label).assertEqual('type1');
        expect(ret!.num).assertEqual(1);
      }

      // --- [3] Verify remove hit string value return type is string ---
      {
        let lru: util.LRUCache<int, string> = new util.LRUCache<int, string>();
        lru.put(1, 'hello');
        let ret: string | undefined = lru.remove(1);
        expect(typeof ret).assertEqual('string');
        expect(ret).assertEqual('hello');
      }

      // --- [4] Verify remove hit boolean value return type is boolean ---
      {
        let lru: util.LRUCache<int, boolean> = new util.LRUCache<int, boolean>();
        lru.put(2, true);
        let ret: boolean | undefined = lru.remove(2);
        expect(typeof ret).assertEqual('boolean');
        expect(ret).assertTrue();
      }

      // --- [5] Verify remove hit array value is instanceof Array ---
      {
        let lru: util.LRUCache<string, int[]> = new util.LRUCache<string, int[]>();
        let arr: int[] = [1, 2];
        lru.put('a', arr);
        let ret: int[] | undefined = lru.remove('a');
        expect(ret instanceof Array).assertTrue();
        expect(ret!.length).assertEqual(2);
        expect(ret![0]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0150
     * @tc.name testLruCacheRemove015
     * @tc.desc Merged batch (5 tests): [1] Verify remove hit long value return type is long | [2] Verify remove hit Date value is instanceof Date | [3] Verify remove returns exact value stored by put | [4] Verify...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove hit long value return type is long ---
      {
        let lru: util.LRUCache<string, long> = new util.LRUCache<string, long>();
        let lg: long = 9;
        lru.put('a', lg);
        let ret: long | undefined = lru.remove('a');
        expect(typeof ret).assertEqual('long');
        expect(ret).assertEqual(lg);
      }

      // --- [2] Verify remove hit Date value is instanceof Date ---
      {
        let dt: Date = new Date(2024, 5, 1);
        let lru: util.LRUCache<string, Date> = new util.LRUCache<string, Date>();
        lru.put('d', dt);
        let ret: Date | undefined = lru.remove('d');
        expect(ret instanceof Date).assertTrue();
        expect(ret!.getTime()).assertEqual(dt.getTime());
      }

      // --- [3] Verify remove returns exact value stored by put ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 777);
        let removed: int | undefined = lru.remove('a');
        expect(removed).assertEqual(777);
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [4] Verify remove returned double value equals stored value ---
      {
        let lru: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        let stored: double = 3.14159;
        lru.put('a', stored);
        expect(lru.remove('a')).assertEqual(stored);
        expect(lru.length).assertEqual(0);
      }

      // --- [5] Verify remove returned boolean value stays true ---
      {
        let lru: util.LRUCache<string, boolean> = new util.LRUCache<string, boolean>();
        lru.put('k', true);
        let ret: boolean | undefined = lru.remove('k');
        expect(ret).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0160
     * @tc.name testLruCacheRemove016
     * @tc.desc Merged batch (5 tests): [1] Verify remove returns class instance value as same reference without copy | [2] Verify remove returned int array value is same reference as original array | [3] Verify r...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove returns class instance value as same reference without copy ---
      {
        let lru: util.LRUCache<string, EntryValue> = new util.LRUCache<string, EntryValue>();
        let p: EntryValue = new EntryValue('p1', 9);
        lru.put('a', p);
        let ret: EntryValue | undefined = lru.remove('a');
        expect(ret).assertEqual(p);
      }

      // --- [2] Verify remove returned int array value is same reference as original array ---
      {
        let arr: int[] = [7, 8, 9];
        let lru: util.LRUCache<string, int[]> = new util.LRUCache<string, int[]>();
        lru.put('a', arr);
        let ret: int[] | undefined = lru.remove('a');
        expect(ret).assertEqual(arr);
      }

      // --- [3] Verify remove hit returns stored negative value unchanged ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('n', -42);
        let ret: int | undefined = lru.remove('n');
        expect(ret).assertEqual(-42);
      }

      // --- [4] Verify remove hit returns stored zero value unchanged ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('z', 0);
        let removed: int | undefined = lru.remove('z');
        expect(removed).assertEqual(0);
        expect(lru.contains('z')).assertFalse();
      }

      // --- [5] Verify remove miss on empty cache returns undefined ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        let ret: string | undefined = lru.remove('missing');
        expect(ret).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0170
     * @tc.name testLruCacheRemove017
     * @tc.desc Merged batch (5 tests): [1] Verify removing an out-of-int-range long key leaves length 0 | [2] Verify removing one of two elements leaves length 1 | [3] Verify removing the middle element of five d...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify removing an out-of-int-range long key leaves length 0 ---
      {
        let lru: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let wideKey: long = 8589934592;
        lru.put(wideKey, 1);
        lru.remove(wideKey);
        expect(lru.length).assertEqual(0);
      }

      // --- [2] Verify removing one of two elements leaves length 1 ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.put('b', 2);
        lru.remove('a');
        expect(lru.length).assertEqual(1);
      }

      // --- [3] Verify removing the middle element of five decreases length by one ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.put('b', 2);
        lru.put('c', 3);
        lru.put('d', 4);
        lru.put('e', 5);
        let before: int = lru.length;
        lru.remove('c');
        expect(lru.length).assertEqual(before - 1);
      }

      // --- [4] Verify removing one element from full capacity 8 cache leaves length 7 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(8);
        for (let i: int = 0; i < 8; i++) {
          lru.put(i, i * 10);
        }
        lru.remove(3);
        expect(lru.length).assertEqual(7);
      }

      // --- [5] Verify removing sole element in capacity 1 cache leaves length 0 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(1);
        lru.put(1, 100);
        lru.remove(1);
        expect(lru.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0180
     * @tc.name testLruCacheRemove018
     * @tc.desc Merged batch (5 tests): [1] Verify removing from empty cache keeps length 0 | [2] Verify remove miss returns undefined and leaves the other key readable | [3] Verify cache capacity stays unchanged ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify removing from empty cache keeps length 0 ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.remove(1);
        expect(lru.length).assertEqual(0);
      }

      // --- [2] Verify remove miss returns undefined and leaves the other key readable ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.put('b', 2);
        let ret: int | undefined = lru.remove('zzz');
        expect(ret).assertEqual(undefined);
        expect(lru.get('a')).assertEqual(1);
      }

      // --- [3] Verify cache capacity stays unchanged after remove hit ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(10);
        lru.put(1, 100);
        lru.remove(1);
        expect(lru.getCapacity()).assertEqual(10);
      }

      // --- [4] Verify external class instance value object fields unchanged after remove ---
      {
        let ev: EntryValue = new EntryValue('ext', 7);
        let lru: util.LRUCache<string, EntryValue> = new util.LRUCache<string, EntryValue>();
        lru.put('a', ev);
        lru.remove('a');
        expect(ev.num).assertEqual(7);
      }

      // --- [5] Verify external array value object length unchanged after remove ---
      {
        let arr: int[] = [1, 2, 3];
        let lru: util.LRUCache<string, int[]> = new util.LRUCache<string, int[]>();
        lru.put('a', arr);
        lru.remove('a');
        expect(arr.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0190
     * @tc.name testLruCacheRemove019
     * @tc.desc Merged batch (5 tests): [1] Verify remove miss has no side effect on internal cache state | [2] Verify miss count stays 0 after remove | [3] Verify match count stays 0 after remove hit | [4] Verify...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove miss has no side effect on internal cache state ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.remove('b');
        expect(lru.contains('a')).assertTrue();
      }

      // --- [2] Verify miss count stays 0 after remove ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.remove('a');
        expect(lru.getMissCount()).assertEqual(0);
      }

      // --- [3] Verify match count stays 0 after remove hit ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.remove('a');
        expect(lru.getMatchCount()).assertEqual(0);
      }

      // --- [4] Verify remove miss does not trigger createDefault to create new entry ---
      {
        let lru: ProbeCache<int, int> = new ProbeCache<int, int>(
          undefined,
          (key: int) => key);
        lru.put(1, 100);
        lru.remove(99);
        expect(lru.getCreateCount()).assertEqual(0);
      }

      // --- [5] Verify receiver remains usable for put and get after remove ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.remove(1);
        lru.put(7, 70);
        expect(lru.get(7)).assertEqual(70);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0200
     * @tc.name testLruCacheRemove020
     * @tc.desc Merged batch (5 tests): [1] Verify remove returns the stored value before and after the key is re-inserted | [2] Verify updateCapacity then put after remove reads back new key value | [3] Verify is...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove returns the stored value before and after the key is re-inserted ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('a', 'A');
        let first: string | undefined = lru.remove('a');
        lru.put('a', 'A2');
        let second: string | undefined = lru.remove('a');
        expect(first).assertEqual('A');
        expect(second).assertEqual('A2');
      }

      // --- [2] Verify updateCapacity then put after remove reads back new key value ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(2, 20);
        lru.remove(2);
        lru.updateCapacity(6);
        lru.put(4, 40);
        expect(lru.get(4)).assertEqual(40);
      }

      // --- [3] Verify isEmpty flips true after remove then false after re-put ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(5, 50);
        lru.remove(5);
        expect(lru.isEmpty()).assertTrue();
        lru.put(6, 60);
        expect(lru.isEmpty()).assertFalse();
      }

      // --- [4] Verify receiver can still put after removing from empty cache ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.remove(1);
        lru.put(11, 110);
        expect(lru.get(11)).assertEqual(110);
      }

      // --- [5] Verify remove through alias reference updates original object ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        let alias: util.LRUCache<int, int> = lru;
        alias.remove(1);
        expect(lru.isEmpty()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0210
     * @tc.name testLruCacheRemove021
     * @tc.desc Merged batch (5 tests): [1] Verify refilled keys after remove follow new insertion order | [2] Verify keys array length matches length after remove | [3] Verify values array length matches length a...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify refilled keys after remove follow new insertion order ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(1, 100);
        lru.remove(1);
        lru.put(3, 300);
        lru.put(4, 400);
        let ks: int[] = lru.keys();
        expect(ks[0]).assertEqual(3);
        expect(ks[1]).assertEqual(4);
      }

      // --- [2] Verify keys array length matches length after remove ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.put('b', 2);
        lru.remove('a');
        let ks: string[] = lru.keys();
        expect(ks.length).assertEqual(lru.length);
      }

      // --- [3] Verify values array length matches length after remove ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(3, 300);
        lru.put(4, 400);
        lru.remove(3);
        let vs: int[] = lru.values();
        expect(vs.length).assertEqual(lru.length);
      }

      // --- [4] Verify keys array excludes removed key after remove ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.put('b', 2);
        lru.remove('a');
        let ks: string[] = lru.keys();
        expect(ks.indexOf('a')).assertEqual(-1);
      }

      // --- [5] Verify values array excludes removed value after remove ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(3, 300);
        lru.put(4, 400);
        lru.remove(3);
        let vs: int[] = lru.values();
        expect(vs.indexOf(300)).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0220
     * @tc.name testLruCacheRemove022
     * @tc.desc Merged batch (5 tests): [1] Verify entries iterator excludes removed pair after remove | [2] Verify contains removed key is false and length decremented after remove | [3] Verify length zero and is...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries iterator excludes removed pair after remove ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(3, 300);
        lru.put(4, 400);
        lru.remove(3);
        let iter: IterableIterator<[int, int]> = lru.entries();
        let hit: boolean = false;
        let item: IteratorResult<[int, int]> = iter.next();
        while (!item.done) {
          let entry: [int, int] | undefined = item.value;
          if (entry !== undefined && entry[0] === 3) {
            hit = true;
          }
          item = iter.next();
        }
        expect(hit).assertFalse();
      }

      // --- [2] Verify contains removed key is false and length decremented after remove ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(6, 600);
        lru.put(7, 700);
        lru.remove(6);
        expect(lru.contains(6)).assertFalse();
        expect(lru.length).assertEqual(1);
      }

      // --- [3] Verify length zero and isEmpty true are consistent after remove ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(9, 900);
        lru.remove(9);
        expect(lru.length).assertEqual(0);
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [4] Verify empty cache stays isEmpty true after remove ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.remove(1);
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [5] Verify removing already-removed key again returns undefined ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.remove('a');
        let ret: int | undefined = lru.remove('a');
        expect(ret).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0230
     * @tc.name testLruCacheRemove023
     * @tc.desc Merged batch (5 tests): [1] Verify remove hits empty-string key returning associated value | [2] Verify remove hits spaced key returning associated value without trimming | [3] Verify remove int ma...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove hits empty-string key returning associated value ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put('', 'empty');
        let ret: string | undefined = lru.remove('');
        expect(ret).assertEqual('empty');
      }

      // --- [2] Verify remove hits spaced key returning associated value without trimming ---
      {
        let lru: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        lru.put(' k ', 'spaced');
        let ret: string | undefined = lru.remove(' k ');
        expect(ret).assertEqual('spaced');
      }

      // --- [3] Verify remove int maximum key returns associated value without truncation ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(2147483647, 1);
        let ret: int | undefined = lru.remove(2147483647);
        expect(ret).assertEqual(1);
      }

      // --- [4] Verify remove int minimum key returns associated value without truncation ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>();
        lru.put(-2147483648, 2);
        let ret: int | undefined = lru.remove(-2147483648);
        expect(ret).assertEqual(2);
      }

      // --- [5] Verify remove long key beyond int range hits returning associated value ---
      {
        let lru: util.LRUCache<long, int> = new util.LRUCache<long, int>();
        let bigKey: long = 4294967296;
        lru.put(bigKey, 5);
        let ret: int | undefined = lru.remove(bigKey);
        expect(ret).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0240
     * @tc.name testLruCacheRemove024
     * @tc.desc Merged batch (5 tests): [1] Verify remove returns stored long maximum value unchanged without overflow | [2] Verify remove returns stored double maximum value without truncation | [3] Verify remove...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove returns stored long maximum value unchanged without overflow ---
      {
        let lru: util.LRUCache<string, long> = new util.LRUCache<string, long>();
        let bigVal: long = 9223372036854775807;
        lru.put('k', bigVal);
        let ret: long | undefined = lru.remove('k');
        expect(ret).assertEqual(bigVal);
      }

      // --- [2] Verify remove returns stored double maximum value without truncation ---
      {
        let lru: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        lru.put('k', Number.MAX_VALUE);
        let ret: double | undefined = lru.remove('k');
        expect(ret).assertEqual(Number.MAX_VALUE);
      }

      // --- [3] Verify remove returns stored negative-zero double value preserving sign ---
      {
        let lru: util.LRUCache<string, double> = new util.LRUCache<string, double>();
        lru.put('k', -0.0);
        let ret: double | undefined = lru.remove('k');
        expect(1 / ret!).assertEqual(Double.NEGATIVE_INFINITY);
      }

      // --- [4] Verify remove on huge capacity cache returns associated value without overflow ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(2147483647);
        lru.put(1, 1);
        let ret: int | undefined = lru.remove(1);
        expect(ret).assertEqual(1);
      }

      // --- [5] Verify full capacity-16 cache refills to length 16 after remove without overflow ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(16);
        for (let i: int = 0; i < 16; i++) {
          lru.put(i, i);
        }
        lru.remove(0);
        lru.put(100, 1);
        expect(lru.length).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0250
     * @tc.name testLruCacheRemove025
     * @tc.desc Merged batch (5 tests): [1] Verify removing all sixteen entries makes length zero without underflow | [2] Verify remove hits various typed key returning associated value | [3] Verify remove hits cl...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify removing all sixteen entries makes length zero without underflow ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(16);
        for (let i: int = 0; i < 16; i++) {
          lru.put(i, i);
        }
        for (let i: int = 0; i < 16; i++) {
          lru.remove(i);
        }
        expect(lru.length).assertEqual(0);
      }

      // --- [2] Verify remove hits various typed key returning associated value ---
      {
        // long-typed key
        let lruLong: util.LRUCache<long, long> = new util.LRUCache<long, long>();
        let kLong: long = 3;
        let vLong: long = 30;
        lruLong.put(kLong, vLong);
        let retLong: long | undefined = lruLong.remove(kLong);
        expect(retLong).assertEqual(30);

        // boolean-typed key
        let lruBool: util.LRUCache<boolean, string> = new util.LRUCache<boolean, string>();
        lruBool.put(true, 'yes');
        let retBool: string | undefined = lruBool.remove(true);
        expect(retBool).assertEqual('yes');

        // bigint-typed key
        let lruBig: util.LRUCache<bigint, string> = new util.LRUCache<bigint, string>();
        let kBig: bigint = 9n;
        lruBig.put(kBig, 'v');
        let retBig: string | undefined = lruBig.remove(kBig);
        expect(retBig).assertEqual('v');

        // float-typed key
        let lruFloat: util.LRUCache<float, string> = new util.LRUCache<float, string>();
        lruFloat.put(2.5 as float, 'v');
        let retFloat: string | undefined = lruFloat.remove(2.5 as float);
        expect(retFloat).assertEqual('v');

        // byte-typed key
        let lruByte: util.LRUCache<byte, byte> = new util.LRUCache<byte, byte>();
        lruByte.put(5 as byte, 6 as byte);
        let retByte: byte | undefined = lruByte.remove(5 as byte);
        expect(retByte).assertEqual(6 as byte);
      }

      // --- [3] Verify remove hits class instance key by same reference returning associated value ---
      {
        let ev: EntryValue = new EntryValue('c1', 1);
        let lru: util.LRUCache<EntryValue, int> = new util.LRUCache<EntryValue, int>();
        lru.put(ev, 5);
        let ret: int | undefined = lru.remove(ev);
        expect(ret).assertEqual(5);
      }

      // --- [4] Verify remove hits Error instance key returning associated value ---
      {
        let e: Error = new Error('boom');
        let lru: util.LRUCache<Error, string> = new util.LRUCache<Error, string>();
        lru.put(e, 'v');
        let ret: string | undefined = lru.remove(e);
        expect(ret).assertEqual('v');
      }

      // --- [5] Verify remove hits Map instance key by same reference returning associated value ---
      {
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let lru: util.LRUCache<Map<string, int>, int> = new util.LRUCache<Map<string, int>, int>();
        lru.put(m, 3);
        let ret: int | undefined = lru.remove(m);
        expect(ret).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0260
     * @tc.name testLruCacheRemove026
     * @tc.desc Merged batch (5 tests): [1] Verify remove hits Set instance key by same reference returning associated value | [2] Verify remove hits double-typed key by equal value returning associated value | [3...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove hits Set instance key by same reference returning associated value ---
      {
        let s: Set<string> = new Set<string>();
        s.add('x');
        let lru: util.LRUCache<Set<string>, int> = new util.LRUCache<Set<string>, int>();
        lru.put(s, 4);
        let ret: int | undefined = lru.remove(s);
        expect(ret).assertEqual(4);
      }

      // --- [2] Verify remove hits double-typed key by equal value returning associated value ---
      {
        let lru: util.LRUCache<double, string> = new util.LRUCache<double, string>();
        lru.put(1.5, 'v');
        let ret: string | undefined = lru.remove(1.5);
        expect(ret).assertEqual('v');
      }

      // --- [3] Verify remove single-argument miss returns undefined for absent key ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('k1', 30);
        let ret: int | undefined = lru.remove('k2');
        expect(ret).assertEqual(undefined);
      }

      // --- [4] Verify remove out-of-range negative key -1 returns undefined ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(16);
        for (let i: int = 0; i < 5; i++) {
          lru.put(i, 10 + i);
        }
        let ret: int | undefined = lru.remove(-1);
        expect(ret).assertEqual(undefined);
      }

      // --- [5] Verify remove positive boundary key 5 equal length returns undefined ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(16);
        let key: int = 0;
        while (lru.length < 5) {
          lru.put(key, 10 + key);
          key++;
        }
        let ret: int | undefined = lru.remove(5);
        expect(ret).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0270
     * @tc.name testLruCacheRemove027
     * @tc.desc Merged batch (5 tests): [1] Verify out-of-range remove miss keeps length five unchanged | [2] Verify positive out-of-range remove miss keeps length five unchanged | [3] Verify rejected null key rem...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify out-of-range remove miss keeps length five unchanged ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(16);
        let seededKeys: int[] = [0, 1, 2, 3, 4];
        for (let i: int = 0; i < seededKeys.length; i++) {
          lru.put(seededKeys[i], 10 + seededKeys[i]);
        }
        lru.remove(-1);
        expect(lru.length).assertEqual(5);
      }

      // --- [2] Verify positive out-of-range remove miss keeps length five unchanged ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(16);
        for (let k: int = 4; k >= 0; k--) {
          lru.put(k, 10 + k);
        }
        lru.remove(5);
        expect(lru.length).assertEqual(5);
      }

      // --- [3] Verify rejected null key remove leaves the full capacity one cache intact for the next evicting put ---
      {
        let lru: util.LRUCache<string | null, int> = new util.LRUCache<string | null, int>(1);
        lru.put('a', 1);
        try {
          lru.remove(null);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        lru.put('b', 2);
        expect(lru.length).assertEqual(1);
        expect(lru.get('b')).assertEqual(2);
      }

      // --- [4] Verify remove undefined key throwing keeps cache length unchanged ---
      {
        let lru: util.LRUCache<string | undefined, int> = new util.LRUCache<string | undefined, int>();
        lru.put('a', 1);
        try {
          lru.remove(undefined);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        expect(lru.length).assertEqual(1);
      }

      // --- [5] Verify remove NaN special key never matches returning undefined ---
      {
        let lru: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        lru.put(1, 100);
        let ret: int | undefined = lru.remove(Double.NaN);
        expect(ret).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0280
     * @tc.name testLruCacheRemove028
     * @tc.desc Merged batch (5 tests): [1] Verify remove NaN miss keeps length unchanged | [2] Verify remove negative zero key hits stored zero key returning associated value | [3] Verify remove wrong-type class ...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove NaN miss keeps length unchanged ---
      {
        let lru: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        lru.put(1, 100);
        lru.remove(Double.NaN);
        expect(lru.length).assertEqual(1);
      }

      // --- [2] Verify remove negative zero key hits stored zero key returning associated value ---
      {
        let lru: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        lru.put(0, 50);
        let ret: int | undefined = lru.remove(-0);
        expect(ret).assertEqual(50);
      }

      // --- [3] Verify remove wrong-type class instance key misses stored string key returning undefined ---
      {
        let lru: util.LRUCache<Object, int> = new util.LRUCache<Object, int>();
        lru.put('a', 1);
        let ret: int | undefined = lru.remove(new Token(0));
        expect(ret).assertEqual(undefined);
      }

      // --- [4] Verify remove wrong-type class instance key miss keeps length unchanged ---
      {
        let lru: util.LRUCache<Object, int> = new util.LRUCache<Object, int>();
        lru.put('a', 1);
        lru.remove(new Token(0));
        expect(lru.length).assertEqual(1);
      }

      // --- [5] Verify remove fractional numeric key 0.5 misses returning undefined ---
      {
        let lru: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        lru.put(1, 100);
        let ret: int | undefined = lru.remove(0.5);
        expect(ret).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0290
     * @tc.name testLruCacheRemove029
     * @tc.desc Merged batch (5 tests): [1] Verify remove positive infinity key misses returning undefined | [2] Verify remove negative infinity key misses returning undefined | [3] Verify remove string 1 misses s...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove positive infinity key misses returning undefined ---
      {
        let lru: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        lru.put(1, 100);
        let ret: int | undefined = lru.remove(Double.POSITIVE_INFINITY);
        expect(ret).assertEqual(undefined);
      }

      // --- [2] Verify remove negative infinity key misses returning undefined ---
      {
        let lru: util.LRUCache<double, int> = new util.LRUCache<double, int>();
        lru.put(1, 100);
        let ret: int | undefined = lru.remove(Double.NEGATIVE_INFINITY);
        expect(ret).assertEqual(undefined);
      }

      // --- [3] Verify remove string 1 misses stored numeric key 1 returning undefined ---
      {
        let lru: util.LRUCache<Object, int> = new util.LRUCache<Object, int>();
        lru.put(1, 100);
        let ret: int | undefined = lru.remove('1');
        expect(ret).assertEqual(undefined);
      }

      // --- [4] Verify remove one entry from all-same-value set returns that value ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 42);
        lru.put('b', 42);
        lru.put('c', 42);
        let ret: int | undefined = lru.remove('b');
        expect(ret).assertEqual(42);
      }

      // --- [5] Verify remove one entry from all-same-value set shrinks length to two keeping rest ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 42);
        lru.put('b', 42);
        lru.put('c', 42);
        lru.remove('b');
        expect(lru.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0300
     * @tc.name testLruCacheRemove030
     * @tc.desc Merged batch (5 tests): [1] Verify keys set length becomes zero after removing sole key | [2] Verify get returns undefined for same key after remove | [3] Verify contains returns false for same key...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify keys set length becomes zero after removing sole key ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.remove('a');
        let ks: string[] = lru.keys();
        expect(ks.length).assertEqual(0);
      }

      // --- [2] Verify get returns undefined for same key after remove ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.remove('a');
        let got: int | undefined = lru.get('a');
        expect(got).assertEqual(undefined);
      }

      // --- [3] Verify contains returns false for same key after remove ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.remove('a');
        expect(lru.contains('a')).assertFalse();
      }

      // --- [4] Verify remove returned object value is same reference as original put object ---
      {
        let lru: util.LRUCache<string, Payload> = new util.LRUCache<string, Payload>();
        let p: Payload = new Payload('p1');
        lru.put('a', p);
        let ret: Payload | undefined = lru.remove('a');
        expect(ret).assertEqual(p);
      }

      // --- [5] Verify remove miss leaves original values set unchanged with two elements ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 1);
        lru.put('b', 2);
        lru.remove('zzz');
        let vs: int[] = lru.values();
        expect(vs.length).assertEqual(2);
        expect(vs.join(',')).assertEqual('1,2');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0310
     * @tc.name testLruCacheRemove031
     * @tc.desc Merged batch (5 tests): [1] Verify overridden afterRemoval is invoked once on remove hit | [2] Verify afterRemoval isEvict parameter is false on manual remove | [3] Verify afterRemoval key paramete...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overridden afterRemoval is invoked once on remove hit ---
      {
        let lru: CountRemovalCache<string, int> = new CountRemovalCache<string, int>();
        lru.put('a', 1);
        lru.remove('a');
        expect(lru.count).assertEqual(1);
      }

      // --- [2] Verify afterRemoval isEvict parameter is false on manual remove ---
      {
        let lastEvict: boolean = true;
        let lru: ProbeCache<string, int> = new ProbeCache<string, int>(
          (self: util.LRUCache<string, int>, isEvict: boolean, key: string, value: int, newValue: int | undefined) => {
            lastEvict = isEvict;
          });
        lru.put('a', 1);
        let removedValue: int | undefined = lru.remove('a');
        expect(removedValue).assertEqual(1);
        expect(lastEvict).assertFalse();
        expect(lru.contains('a')).assertFalse();
      }

      // --- [3] Verify afterRemoval key parameter equals the removed key ---
      {
        let lastKey: string | undefined = undefined;
        let lru: ProbeCache<string, int> = new ProbeCache<string, int>(
          (self: util.LRUCache<string, int>, isEvict: boolean, key: string, value: int, newValue: int | undefined) => {
            lastKey = key;
          });
        lru.put('k1', 77);
        let removedValue: int | undefined = lru.remove('k1');
        expect(lastKey).assertEqual('k1');
        expect(removedValue).assertEqual(77);
        expect(lru.length).assertEqual(0);
      }

      // --- [4] Verify afterRemoval value parameter equals the removed key associated value ---
      {
        let lastValue: int | undefined = undefined;
        let lru: ProbeCache<string, int> = new ProbeCache<string, int>(
          (self: util.LRUCache<string, int>, isEvict: boolean, key: string, value: int, newValue: int | undefined) => {
            lastValue = value;
          });
        lru.put('k1', 77);
        let removedValue: int | undefined = lru.remove('k1');
        expect(lastValue).assertEqual(77);
        expect(removedValue).assertEqual(77);
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [5] Verify afterRemoval newValue parameter is undefined on manual remove ---
      {
        let lastNew: int | undefined = 0;
        let lru: ProbeCache<string, int> = new ProbeCache<string, int>(
          (self: util.LRUCache<string, int>, isEvict: boolean, key: string, value: int, newValue: int | undefined) => {
            lastNew = newValue;
          });
        lru.put('k1', 77);
        let removedValue: int | undefined = lru.remove('k1');
        expect(lastNew).assertEqual(undefined);
        expect(removedValue).assertEqual(77);
        expect(lru.get('k1')).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0320
     * @tc.name testLruCacheRemove032
     * @tc.desc Merged batch (5 tests): [1] Verify empty afterRemoval implementation does not affect remove return value | [2] Verify afterRemoval not invoked when removing nonexistent key | [3] Verify afterRemova...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify empty afterRemoval implementation does not affect remove return value ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a', 5);
        let removed: int | undefined = lru.remove('a');
        expect(removed).assertEqual(5);
        expect(lru.length).assertEqual(0);
      }

      // --- [2] Verify afterRemoval not invoked when removing nonexistent key ---
      {
        let lru: CountRemovalCache<string, int> = new CountRemovalCache<string, int>();
        lru.put('a', 1);
        lru.remove('zzz');
        expect(lru.count).assertEqual(0);
      }

      // --- [3] Verify afterRemoval not invoked when removing from empty cache ---
      {
        let lru: CountRemovalCache<string, int> = new CountRemovalCache<string, int>();
        lru.remove('x');
        expect(lru.count).assertEqual(0);
      }

      // --- [4] Verify two consecutive removes trigger afterRemoval twice accumulating count 1 then 2 ---
      {
        let lru: CountRemovalCache<string, int> = new CountRemovalCache<string, int>();
        lru.put('a', 1);
        lru.put('b', 2);
        lru.remove('a');
        expect(lru.count).assertEqual(1);
        lru.remove('b');
        expect(lru.count).assertEqual(2);
      }

      // --- [5] Verify afterRemoval throwing propagation leaves length already reduced to zero ---
      {
        let lru: BoomRemovalCache<string, int> = new BoomRemovalCache<string, int>();
        lru.put('a', 1);
        try {
          lru.remove('a');
          expect().assertFail();
        } catch (e) {
          expect(e.message).assertEqual('afterRemoval-boom');
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(lru.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0330
     * @tc.name testLruCacheRemove033
     * @tc.desc Merged batch (5 tests): [1] Verify full capacity-three cache shrinks to length two after remove | [2] Verify remove on empty capacity-three cache leaves length zero without underflow | [3] Verify r...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify full capacity-three cache shrinks to length two after remove ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>(3);
        lru.put('a', 1);
        lru.put('b', 2);
        lru.put('c', 3);
        lru.remove('b');
        expect(lru.length).assertEqual(2);
      }

      // --- [2] Verify remove on empty capacity-three cache leaves length zero without underflow ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>(3);
        lru.remove('a');
        expect(lru.length).assertEqual(0);
      }

      // --- [3] Verify removing every entry sequentially leaves isEmpty true ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>(4);
        lru.put('a', 1);
        lru.put('b', 2);
        lru.put('c', 3);
        lru.remove('a');
        lru.remove('b');
        lru.remove('c');
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [4] Verify remove of evicted key after updateCapacity shrink returns undefined ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>(3);
        lru.put('a', 1);
        lru.put('b', 2);
        lru.put('c', 3);
        lru.updateCapacity(2);
        let ret: int | undefined = lru.remove('a');
        expect(ret).assertEqual(undefined);
      }

      // --- [5] Verify remove frees capacity slot so refills reach capacity three without overflow ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>(3);
        lru.put('a', 1);
        lru.put('b', 2);
        lru.remove('a');
        lru.put('c', 3);
        lru.put('d', 4);
        expect(lru.length).assertEqual(3);
        expect(lru.get('b')).assertEqual(2);
        expect(lru.get('d')).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0340
     * @tc.name testLruCacheRemove034
     * @tc.desc Merged batch (5 tests): [1] Verify remove RegExp key of same pattern different instance misses returning undefined | [2] Verify remove RegExp key of same reference hits returning associated value |...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove RegExp key of same pattern different instance misses returning undefined ---
      {
        let lru: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        let firstRegex: RegExp = new RegExp('ab+c');
        lru.put(firstRegex, 1);
        let secondRegex: RegExp = new RegExp('ab+c');
        let ret: int | undefined = lru.remove(secondRegex);
        expect(ret).assertEqual(undefined);
      }

      // --- [2] Verify remove RegExp key of same reference hits returning associated value ---
      {
        let lru: util.LRUCache<RegExp, int> = new util.LRUCache<RegExp, int>();
        let re: RegExp = new RegExp('ab+c');
        lru.put(re, 1);
        let ret: int | undefined = lru.remove(re);
        expect(ret).assertEqual(1);
      }

      // --- [3] Verify remove Date key of same milliseconds different instance misses returning undefined ---
      {
        let lru: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        let firstDate: Date = new Date(2024, 0, 1);
        lru.put(firstDate, 7);
        let secondDate: Date = new Date(2024, 0, 1);
        let ret: int | undefined = lru.remove(secondDate);
        expect(ret).assertEqual(undefined);
      }

      // --- [4] Verify remove Date key of same reference hits returning associated value ---
      {
        let lru: util.LRUCache<Date, int> = new util.LRUCache<Date, int>();
        let d: Date = new Date(2024, 5, 15);
        lru.put(d, 9);
        let ret: int | undefined = lru.remove(d);
        expect(ret).assertEqual(9);
      }

      // --- [5] Verify remove Array key of same content different instance misses returning undefined ---
      {
        let lru: util.LRUCache<Array<int>, int> = new util.LRUCache<Array<int>, int>();
        let firstArray: Array<int> = [1, 2, 3];
        lru.put(firstArray, 11);
        let secondArray: Array<int> = [1, 2, 3];
        let ret: int | undefined = lru.remove(secondArray);
        expect(ret).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0350
     * @tc.name testLruCacheRemove035
     * @tc.desc Merged batch (5 tests): [1] Verify remove equal-valued distinct bigint instance key hits returning associated value | [2] Verify remove un-stored boolean false key returns undefined | [3] Verify re...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove equal-valued distinct bigint instance key hits returning associated value ---
      {
        let lru: util.LRUCache<bigint, int> = new util.LRUCache<bigint, int>();
        let firstBig: bigint = BigInt(123);
        lru.put(firstBig, 3);
        let secondBig: bigint = BigInt(123);
        let ret: int | undefined = lru.remove(secondBig);
        expect(ret).assertEqual(3);
      }

      // --- [2] Verify remove un-stored boolean false key returns undefined ---
      {
        let lru: util.LRUCache<boolean, int> = new util.LRUCache<boolean, int>();
        lru.put(true, 8);
        let ret: int | undefined = lru.remove(false);
        expect(ret).assertEqual(undefined);
      }

      // --- [3] Verify remove class instance key of same content different instance misses returning undefined ---
      {
        let lru: util.LRUCache<Token, int> = new util.LRUCache<Token, int>();
        let firstToken: Token = new Token(1);
        lru.put(firstToken, 21);
        let secondToken: Token = new Token(1);
        let ret: int | undefined = lru.remove(secondToken);
        expect(ret).assertEqual(undefined);
      }

      // --- [4] Verify remove Map key of same content different instance misses returning undefined ---
      {
        let lru: util.LRUCache<Map<string, int>, int> = new util.LRUCache<Map<string, int>, int>();
        let firstMap: Map<string, int> = new Map<string, int>();
        firstMap.set('x', 1);
        lru.put(firstMap, 4);
        let secondMap: Map<string, int> = new Map<string, int>();
        secondMap.set('x', 1);
        let ret: int | undefined = lru.remove(secondMap);
        expect(ret).assertEqual(undefined);
      }

      // --- [5] Verify remove lowercase a misses stored uppercase A key returning undefined ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('A', 1);
        let ret: int | undefined = lru.remove('a');
        expect(ret).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0360
     * @tc.name testLruCacheRemove036
     * @tc.desc Merged batch (5 tests): [1] Verify remove spaced key matches exactly returning associated value without trimming | [2] Verify afterRemoval throwing propagation leaves contains false for removed key...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove spaced key matches exactly returning associated value without trimming ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        lru.put('a b', 6);
        expect(lru.remove('a b')).assertEqual(6);
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [2] Verify afterRemoval throwing propagation leaves contains false for removed key ---
      {
        let lru: BoomRemovalCache<string, int> = new BoomRemovalCache<string, int>();
        lru.put('a', 1);
        try {
          lru.remove('a');
          expect().assertFail();
        } catch (e) {
          expect(e.message).assertEqual('afterRemoval-boom');
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        expect(lru.contains('a')).assertFalse();
      }

      // --- [3] Verify remaining capacity increases by one for each remove from a full cache back to full capacity at empty ---
      {
        let lru: util.LRUCache<int, int> = new util.LRUCache<int, int>(5);
        for (let i: int = 1; i <= 5; i++) {
          lru.put(i, i * 10);
        }
        expect(lru.getCapacity() - lru.length).assertEqual(0);
        lru.remove(1);
        expect(lru.getCapacity() - lru.length).assertEqual(1);
        lru.remove(2);
        expect(lru.getCapacity() - lru.length).assertEqual(2);
        lru.remove(3);
        lru.remove(4);
        expect(lru.getCapacity() - lru.length).assertEqual(4);
        lru.remove(5);
        expect(lru.getCapacity() - lru.length).assertEqual(5);
        expect(lru.isEmpty()).assertTrue();
      }

      // --- [4] Verify remove miss leaves remaining capacity unchanged while each remove hit frees one slot ---
      {
        let lru: util.LRUCache<string, int> = new util.LRUCache<string, int>(6);
        lru.put('a', 1);
        lru.put('b', 2);
        lru.put('c', 3);
        expect(lru.getCapacity() - lru.length).assertEqual(3);
        lru.remove('zzz');
        expect(lru.getCapacity() - lru.length).assertEqual(3);
        lru.remove('b');
        expect(lru.getCapacity() - lru.length).assertEqual(4);
        lru.remove('c');
        lru.remove('a');
        expect(lru.getCapacity() - lru.length).assertEqual(6);
        expect(lru.length).assertEqual(0);
      }

      // --- [5] Verify remove through a mutated object key deletes exactly that entry and a repeated remove misses ---
      {
        let k: Token = new Token(1);
        let cache: util.LRUCache<Token, string> = new util.LRUCache<Token, string>(6);
        cache.put(k, 'drop');
        k.id = 100;
        expect(cache.remove(k)).assertEqual('drop');
        expect(cache.length).assertEqual(0);
        expect(cache.remove(k)).assertEqual(undefined);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0370
     * @tc.name testLruCacheRemove037
     * @tc.desc Merged batch (5 tests): [1] Verify remove returns the stored value object by reference reflecting field changes made after put | [2] Verify remove of the zero width space key leaves the NUL and byt...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove returns the stored value object by reference reflecting field changes made after put ---
      {
        let v: EntryValue = new EntryValue('alpha', 1);
        let cache: util.LRUCache<string, EntryValue> = new util.LRUCache<string, EntryValue>(4);
        cache.put('k', v);
        v.label = 'omega';
        v.num = 42;
        let taken: EntryValue | undefined = cache.remove('k');
        expect(taken!.label).assertEqual('omega');
        expect(taken!.num).assertEqual(42);
      }

      // --- [2] Verify remove of the zero width space key leaves the NUL and byte order mark keys behind ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        cache.put('\u0000', 1);
        cache.put('\u200B', 2);
        cache.put('\uFEFF', 3);
        let removed: int | undefined = cache.remove('\u200B');
        expect(removed).assertEqual(2);
        expect(cache.length).assertEqual(2);
        expect(cache.get('\u0000')).assertEqual(1);
        expect(cache.get('\uFEFF')).assertEqual(3);
      }

      // --- [3] Verify removing the maximum BMP character key leaves its doubled form which can then be re-added ---
      {
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>(2);
        cache.put('\uFFFF', 1);
        cache.put('\uFFFF\uFFFF', 2);
        let removed: int | undefined = cache.remove('\uFFFF');
        expect(removed).assertEqual(1);
        expect(cache.contains('\uFFFF')).assertFalse();
        expect(cache.contains('\uFFFF\uFFFF')).assertTrue();
        cache.put('\uFFFF', 4);
        expect(cache.length).assertEqual(2);
      }

      // --- [4] Verify remove returns an emoji string value whose first unit is the high surrogate ---
      {
        let cache: util.LRUCache<string, string> = new util.LRUCache<string, string>();
        cache.put('k', '😀');
        let removed: string = cache.remove('k')!;
        expect(removed).assertEqual('😀');
        expect(removed.length).assertEqual(2);
        expect(removed.charCodeAt(0)).assertEqual(0xD83D);
      }

      // --- [5] Verify remove returns a NaN value still detected by isNaN ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>();
        cache.put(1, Double.NaN);
        let removed: double | undefined = cache.remove(1);
        expect(isNaN(removed!)).assertTrue();
        expect(cache.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LRUCACHE_REMOVE_0380
     * @tc.name testLruCacheRemove038
     * @tc.desc Merged batch (5 tests): [1] Verify remove returns positive and negative infinity values exactly as stored | [2] Verify remove returns the minimum long value stored under a key | [3] Verify remove d...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLruCacheRemove038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify remove returns positive and negative infinity values exactly as stored ---
      {
        let cache: util.LRUCache<int, double> = new util.LRUCache<int, double>(2);
        cache.put(1, Double.POSITIVE_INFINITY);
        cache.put(2, Double.NEGATIVE_INFINITY);
        let first: double | undefined = cache.remove(1);
        let second: double | undefined = cache.remove(2);
        expect(first).assertEqual(Double.POSITIVE_INFINITY);
        expect(second).assertEqual(Double.NEGATIVE_INFINITY);
        expect(cache.length).assertEqual(0);
      }

      // --- [2] Verify remove returns the minimum long value stored under a key ---
      {
        let cache: util.LRUCache<int, long> = new util.LRUCache<int, long>();
        let minLong: long = -9223372036854775807 - 1;
        cache.put(1, minLong);
        let removed: long | undefined = cache.remove(1);
        expect(removed).assertEqual(minLong);
      }

      // --- [3] Verify remove deletes one enum member key while the other member stays readable ---
      {
        let cache: util.LRUCache<RemSlot, int> = new util.LRUCache<RemSlot, int>();
        cache.put(RemSlot.First, 1);
        cache.put(RemSlot.Second, 2);
        let removed: int | undefined = cache.remove(RemSlot.First);
        expect(removed).assertEqual(1);
        expect(cache.contains(RemSlot.First)).assertFalse();
        expect(cache.get(RemSlot.Second)).assertEqual(2);
      }

      // --- [4] Verify remove returns the stored LRUCache value and the removed instance stays usable ---
      {
        let inner: util.LRUCache<int, int> = new util.LRUCache<int, int>(3);
        inner.put(7, 70);
        let outer: util.LRUCache<int, util.LRUCache<int, int>> = new util.LRUCache<int, util.LRUCache<int, int>>(4);
        outer.put(1, inner);
        let removed: util.LRUCache<int, int> | undefined = outer.remove(1);
        expect(removed).assertEqual(inner);
        expect(outer.length).assertEqual(0);
        expect(removed!.get(7)).assertEqual(70);
      }

      // --- [5] Verify remove accepts a cache instance key and returns its value then misses on repeat ---
      {
        let ownerKey: util.LRUCache<int, string> = new util.LRUCache<int, string>(2);
        ownerKey.put(1, 'x');
        let registry: util.LRUCache<util.LRUCache<int, string>, int> =
          new util.LRUCache<util.LRUCache<int, string>, int>(3);
        registry.put(ownerKey, 42);
        expect(registry.remove(ownerKey)).assertEqual(42);
        expect(registry.length).assertEqual(0);
        expect(registry.remove(ownerKey)).assertEqual(undefined);
        registry.put(ownerKey, 43);
        expect(registry.get(ownerKey)).assertEqual(43);
      }
    });

  });
}
