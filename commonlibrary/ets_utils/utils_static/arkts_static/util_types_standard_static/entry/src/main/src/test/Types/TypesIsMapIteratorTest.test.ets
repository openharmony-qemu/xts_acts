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

class IteratorKeyBox {
  tag: string = 'key';
}

class IteratorFieldHolder {
  handle: Object = new Map<string, int>().keys();
}

class IteratorNullSlot {
  slot: Object | null = null;
}

interface IteratorLabel {
  label: string;
}

function probeIteratorThroughObject(value: Object): boolean {
  return new util.types().isMapIterator(value);
}

function makeMapKeysIterator(): IterableIterator<string> {
  let m: Map<string, int> = new Map<string, int>();
  m.set('made', 1);
  return m.keys();
}

function makeMapValuesIterator(): IterableIterator<int> {
  let m: Map<string, int> = new Map<string, int>();
  m.set('made', 9);
  return m.values();
}

function makeMapEntriesIterator(): IterableIterator<[string, int]> {
  let m: Map<string, int> = new Map<string, int>();
  m.set('made', 4);
  return m.entries();
}

function plainRankFn(): int {
  return 3;
}

async function asyncRankTask(): Promise<int> {
  return 2;
}

function bareObjectValue(): Object {
  return new Object();
}

function surrogatePairText(): string {
  return '\uD83D\uDE00';
}

class IteratorProbeHolder {
  probe: util.types = new util.types();

  accepts(value: Object): boolean {
    return this.probe.isMapIterator(value);
  }
}

class IteratorQueueHolder {
  store: Map<string, int> = new Map<string, int>();

  keysIterator(): IterableIterator<string> {
    return this.store.keys();
  }
}

interface IteratorHandleCarrier {
  handle: Object;
}

function countAcceptedIterators(items: Object[], probe: util.types): int {
  let hits: int = 0;
  for (const item of items) {
    if (probe.isMapIterator(item)) {
      hits += 1;
    }
  }
  return hits;
}

async function asyncIteratorCheck(value: Object): Promise<boolean> {
  return new util.types().isMapIterator(value);
}

function iteratorOfMap(source: Map<string, int>): IterableIterator<string> {
  return source.keys();
}

function objectOfMapIterator(source: Map<string, int>): Object {
  return source.keys();
}

function fillIndexedMap(target: Map<int, int>, count: int): void {
  for (let i: int = 0; i < count; i++) {
    target.set(i, i);
  }
}

export default function typesIsMapIteratorTest(): void {
  describe('TypesIsMapIteratorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_0100
     * @tc.name testTypesIsMapIterator001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a boolean keyed Map whose single value is the bigint built by BigInt(1); accepts the keys iterators of a byte keyed and a short keyed Map; accepts the keys iterator of a Map that uses another Map as its single key; accepts the keys iterator of a Map that uses a Set as its single key and Uint8Array as its single key; two keys iterators obtained from the same Map are both recognized as Map iterators.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMapIterator returns true for a boolean keyed Map whose single value is the bigint built by BigInt(1) ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<boolean, bigint> = new Map<boolean, bigint>();
        m.set(true, BigInt(1));
        let it: IterableIterator<boolean> = m.keys();
        expect(iteratorChecker.isMapIterator(it)).assertTrue();
      }

      // --- [2] Verify isMapIterator returns true for the keys iterators of a byte keyed and a short keyed Map ---
      {
        let iteratorChecker: util.types = new util.types();
        let narrowMap: Map<byte, int> = new Map<byte, int>();
        let narrowKey: byte = 127;
        narrowMap.set(narrowKey, 1);
        let wideMap: Map<short, int> = new Map<short, int>();
        let wideKey: short = 7;
        wideMap.set(wideKey, 1);
        let narrowIt: IterableIterator<byte> = narrowMap.keys();
        let wideIt: IterableIterator<short> = wideMap.keys();
        expect(iteratorChecker.isMapIterator(narrowIt)).assertTrue();
        expect(iteratorChecker.isMapIterator(wideIt)).assertTrue();
      }

      // --- [3] Verify isMapIterator returns true for the keys iterator of a Map that uses another Map as its single key ---
      {
        let iteratorProbe: util.types = new util.types();
        let inner: Map<int, int> = new Map<int, int>();
        inner.set(1, 2);
        let m: Map<Map<int, int>, Object> = new Map<Map<int, int>, Object>();
        m.set(inner, new Object());
        let it: IterableIterator<Map<int, int>> = m.keys();
        expect(iteratorProbe.isMapIterator(it)).assertTrue();
        expect(inner.size).assertEqual(1);
      }

      // --- [4] Verify isMapIterator returns true for the keys iterator of a Map that uses a Set as its single key and Uint8Array as its single key ---
      {
        let iteratorChecker: util.types = new util.types();
        let inner: Set<string> = new Set<string>();
        inner.add('x');
        let m: Map<Set<string>, int> = new Map<Set<string>, int>();
        m.set(inner, 1);
        let it: IterableIterator<Set<string>> = m.keys();
        expect(iteratorChecker.isMapIterator(it)).assertTrue();
        let iteratorChecker_2: util.types = new util.types();
        let m_2: Map<Uint8Array, int> = new Map<Uint8Array, int>();
        let key: Uint8Array = new Uint8Array([1, 2]);
        m_2.set(key, 3);
        let it_2: IterableIterator<Uint8Array> = m_2.keys();
        expect(iteratorChecker_2.isMapIterator(it_2)).assertTrue();
      }

      // --- [5] Verify two keys iterators obtained from the same Map are both recognized as Map iterators ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('only', 1);
        let first: IterableIterator<string> = m.keys();
        let second: IterableIterator<string> = m.keys();
        expect(iteratorChecker.isMapIterator(first)).assertTrue();
        expect(iteratorChecker.isMapIterator(second)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_0200
     * @tc.name testTypesIsMapIterator002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts the outer keys iterator of a Map valued by a Map and the values iterator of a two entry Map; accepts a values iterator whose value is a bare Object and whose key is a Date; accepts the values iterator of an empty int keyed Map; accepts values iterators over RegExp and Error values; accepts a values iterator whose single value is the boolean true.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the outer keys iterator of a Map valued by a Map and the values iterator of a two entry Map are both accepted ---
      {
        let iteratorProbe: util.types = new util.types();
        let inner: Map<string, int> = new Map<string, int>();
        inner.set('a', 1);
        let outer: Map<string, Map<string, int>> = new Map<string, Map<string, int>>();
        outer.set('k', inner);
        let it: IterableIterator<string> = outer.keys();
        expect(iteratorProbe.isMapIterator(it)).assertTrue();
        expect(outer.size).assertEqual(1);
        let iteratorProbe_2: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        let it_2: IterableIterator<int> = m.values();
        expect(iteratorProbe_2.isMapIterator(it_2)).assertTrue();
        expect(m.size).assertEqual(2);
      }

      // --- [2] Verify isMapIterator returns true for a values iterator whose value is a bare Object and whose key is a Date ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<Date, Object> = new Map<Date, Object>();
        m.set(new Date(0), new Object());
        let it: IterableIterator<Object> = m.values();
        expect(iteratorChecker.isMapIterator(it)).assertTrue();
      }

      // --- [3] Verify isMapIterator returns true for the values iterator of an empty int keyed Map ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<int, int> = new Map<int, int>();
        let it: IterableIterator<int> = m.values();
        expect(iteratorChecker.isMapIterator(it)).assertTrue();
      }

      // --- [4] Verify isMapIterator returns true for values iterators over RegExp and Error values ---
      {
        let iteratorChecker: util.types = new util.types();
        let mapRegExp: Map<string, RegExp> = new Map<string, RegExp>();
        mapRegExp.set('r', new RegExp('a+'));
        let iteratorRegExp: IterableIterator<RegExp> = mapRegExp.values();
        expect(iteratorChecker.isMapIterator(iteratorRegExp)).assertTrue();
        let mapError: Map<string, Error> = new Map<string, Error>();
        mapError.set('e', new Error('x'));
        let iteratorError: IterableIterator<Error> = mapError.values();
        expect(iteratorChecker.isMapIterator(iteratorError)).assertTrue();
      }

      // --- [5] Verify isMapIterator returns true for a values iterator whose single value is the boolean true ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<string, boolean> = new Map<string, boolean>();
        m.set('flag', true);
        let it: IterableIterator<boolean> = m.values();
        expect(iteratorChecker.isMapIterator(it)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_0300
     * @tc.name testTypesIsMapIterator003
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a values iterator whose single value is a Date built from epoch 0; an int array; the keys, values and entries iterators of one Map are all recognized as Map iterators; a Uint8Array and resolved Promise; accepts the entries iterator of a populated string keyed Map.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMapIterator returns true for a values iterator whose single value is a Date built from epoch 0 ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<string, Date> = new Map<string, Date>();
        m.set('d', new Date(0));
        let it: IterableIterator<Date> = m.values();
        expect(iteratorChecker.isMapIterator(it)).assertTrue();
      }

      // --- [2] Verify isMapIterator returns true for a values iterator whose single value is an int array ---
      {
        let iteratorProbe: util.types = new util.types();
        let arr: int[] = [1, 2, 3];
        let m: Map<string, int[]> = new Map<string, int[]>();
        m.set('a', arr);
        let it: IterableIterator<int[]> = m.values();
        expect(iteratorProbe.isMapIterator(it)).assertTrue();
        expect(arr.length).assertEqual(3);
      }

      // --- [3] Verify the keys, values and entries iterators of one Map are all recognized as Map iterators ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let hitKeys: boolean = iteratorChecker.isMapIterator(m.keys());
        let hitValues: boolean = iteratorChecker.isMapIterator(m.values());
        let hitEntries: boolean = iteratorChecker.isMapIterator(m.entries());
        expect(hitKeys).assertTrue();
        expect(hitValues).assertEqual(hitKeys);
        expect(hitEntries).assertEqual(hitKeys);
      }

      // --- [4] Verify isMapIterator returns true for a values iterator whose single value is a Uint8Array and resolved Promise ---
      {
        let iteratorChecker: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array([1, 2]);
        let m: Map<string, Uint8Array> = new Map<string, Uint8Array>();
        m.set('u', uint8View);
        let it: IterableIterator<Uint8Array> = m.values();
        expect(iteratorChecker.isMapIterator(it)).assertTrue();
        let iteratorChecker_2: util.types = new util.types();
        let p: Promise<int> = Promise.resolve<int>(1);
        let m_2: Map<string, Promise<int>> = new Map<string, Promise<int>>();
        m_2.set('p', p);
        let it_2: IterableIterator<Promise<int>> = m_2.values();
        expect(iteratorChecker_2.isMapIterator(it_2)).assertTrue();
      }

      // --- [5] Verify isMapIterator returns true for the entries iterator of a populated string keyed Map ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let it: IterableIterator<[string, int]> = m.entries();
        expect(iteratorProbe.isMapIterator(it)).assertTrue();
        expect(m.size).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_0400
     * @tc.name testTypesIsMapIterator004
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts the entries iterator of an empty int keyed Map; keys and values iterators stay accepted after being drained by three and two next calls over their Maps; a keys iterator that already advanced once through next is still recognized as a Map iterator; a fully drained entries iterator of a single entry Map is still recognized as a Map iterator; accepts the values iterator of a Map storing one value under two keys yields it twice.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMapIterator returns true for the entries iterator of an empty int keyed Map ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<int, int> = new Map<int, int>();
        expect(iteratorChecker.isMapIterator(m.entries())).assertTrue();
      }

      // --- [2] Verify keys and values iterators stay accepted after being drained by three and two next calls over their Maps ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        m.set('c', 3);
        let it: IterableIterator<string> = m.keys();
        it.next();
        it.next();
        it.next();
        expect(iteratorChecker.isMapIterator(it)).assertTrue();
        let iteratorChecker_2: util.types = new util.types();
        let m_2: Map<string, int> = new Map<string, int>();
        m_2.set('a', 1);
        m_2.set('b', 2);
        let it_2: IterableIterator<int> = m_2.values();
        it_2.next();
        it_2.next();
        expect(iteratorChecker_2.isMapIterator(it_2)).assertTrue();
      }

      // --- [3] Verify a keys iterator that already advanced once through next is still recognized as a Map iterator ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        let it: IterableIterator<string> = m.keys();
        it.next();
        let advanced: boolean = iteratorChecker.isMapIterator(it);
        expect(advanced).assertTrue();
      }

      // --- [4] Verify a fully drained entries iterator of a single entry Map is still recognized as a Map iterator ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let it: IterableIterator<[string, int]> = m.entries();
        it.next();
        it.next();
        expect(iteratorChecker.isMapIterator(it)).assertTrue();
      }

      // --- [5] Verify the values iterator of a Map storing one value under two keys yields it twice and is accepted ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 7);
        m.set('b', 7);
        let it: IterableIterator<int> = m.values();
        let matches: int = 0;
        for (const v of it) {
          if (v === 7) {
            matches = matches + 1;
          }
        }
        expect(matches).assertEqual(2);
        expect(m.size).assertEqual(2);
        expect(iteratorProbe.isMapIterator(it)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_0500
     * @tc.name testTypesIsMapIterator005
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: two distinct Maps holding the same single entry both yield recognized keys iterators; keys iterators of a string keyed Map and an int keyed Map are both recognized by the check; keys iterators of two Maps that share one key object are recognized and both Maps report has true for that object; a keys iterator taken before a deletion and one over a Map of 1000 entries are both recognized; a WeakMap still reports has true for its key after the WeakMap was passed to the check.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two distinct Maps holding the same single entry both yield recognized keys iterators ---
      {
        let iteratorChecker: util.types = new util.types();
        let m1: Map<string, int> = new Map<string, int>();
        let m2: Map<string, int> = new Map<string, int>();
        m1.set('a', 1);
        m2.set('a', 1);
        expect(iteratorChecker.isMapIterator(m1.keys())).assertTrue();
        expect(iteratorChecker.isMapIterator(m2.keys())).assertTrue();
      }

      // --- [2] Verify keys iterators of a string keyed Map and an int keyed Map are both recognized by the check ---
      {
        let iteratorChecker: util.types = new util.types();
        let text: Map<string, int> = new Map<string, int>();
        text.set('a', 1);
        let numeric: Map<int, int> = new Map<int, int>();
        numeric.set(1, 1);
        expect(iteratorChecker.isMapIterator(text.keys())).assertTrue();
        expect(iteratorChecker.isMapIterator(numeric.keys())).assertTrue();
      }

      // --- [3] Verify keys iterators of two Maps that share one key object are recognized and both Maps report has true for that object ---
      {
        let iteratorProbe: util.types = new util.types();
        let shared: IteratorKeyBox = new IteratorKeyBox();
        let first: Map<IteratorKeyBox, int> = new Map<IteratorKeyBox, int>();
        first.set(shared, 1);
        let second: Map<IteratorKeyBox, int> = new Map<IteratorKeyBox, int>();
        second.set(shared, 2);
        expect(iteratorProbe.isMapIterator(first.keys())).assertTrue();
        expect(iteratorProbe.isMapIterator(second.keys())).assertTrue();
        expect(first.has(shared)).assertTrue();
        expect(second.has(shared)).assertTrue();
      }

      // --- [4] Verify a keys iterator taken before a deletion and one over a Map of 1000 entries are both recognized ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        let it: IterableIterator<string> = m.keys();
        m.delete('a');
        expect(iteratorProbe.isMapIterator(it)).assertTrue();
        expect(m.size).assertEqual(1);
        let iteratorProbe_2: util.types = new util.types();
        let m_2: Map<int, int> = new Map<int, int>();
        fillIndexedMap(m_2, 1000);
        let hit: boolean = iteratorProbe_2.isMapIterator(m_2.keys());
        expect(hit).assertTrue();
        expect(m_2.size).assertEqual(1000);
      }

      // --- [5] Verify a WeakMap still reports has true for its key after the WeakMap was passed to the check ---
      {
        let iteratorProbe: util.types = new util.types();
        let key: IteratorKeyBox = new IteratorKeyBox();
        let wm: WeakMap<IteratorKeyBox, string> = new WeakMap<IteratorKeyBox, string>();
        wm.set(key, 'held');
        iteratorProbe.isMapIterator(wm);
        expect(wm.has(key)).assertTrue();
        expect(key.tag).assertEqual('key');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_0600
     * @tc.name testTypesIsMapIterator006
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: a keys iterator taken after the Map was cleared is still recognized as a Map iterator; a Map still reports has true for an existing key after a values iterator was checked; the keys iterator of an empty Map is still a Map iterator after next reports the exhausted state; two util.types instances give the same true verdict for both the keys and the values iterators; a keys iterator and a values iterator of one Map stay recognized and consume their own elements independently.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a keys iterator taken after the Map was cleared is still recognized as a Map iterator ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.clear();
        let it: IterableIterator<string> = m.keys();
        expect(iteratorProbe.isMapIterator(it)).assertTrue();
        expect(m.size).assertEqual(0);
      }

      // --- [2] Verify a Map still reports has true for an existing key after a values iterator was checked ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        iteratorProbe.isMapIterator(m.values());
        expect(m.has('a')).assertTrue();
        expect(m.has('b')).assertFalse();
      }

      // --- [3] Verify the keys iterator of an empty Map is still a Map iterator after next reports the exhausted state ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<int, int> = new Map<int, int>();
        let it: IterableIterator<int> = m.keys();
        it.next();
        expect(iteratorChecker.isMapIterator(it)).assertTrue();
      }

      // --- [4] Verify two util.types instances give the same true verdict for both the keys and the values iterators ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('x', 11);
        m.set('y', 22);
        let keyIt: IterableIterator<string> = m.keys();
        let valIt: IterableIterator<int> = m.values();
        let keyA: boolean = first.isMapIterator(keyIt);
        let keyB: boolean = second.isMapIterator(keyIt);
        let valA: boolean = first.isMapIterator(valIt);
        let valB: boolean = second.isMapIterator(valIt);
        expect(keyA).assertTrue();
        expect(keyB).assertEqual(keyA);
        expect(valA).assertTrue();
        expect(valB).assertEqual(valA);
      }

      // --- [5] Verify a keys iterator and a values iterator of one Map stay recognized and consume their own elements independently ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        let keys: IterableIterator<string> = m.keys();
        let values: IterableIterator<int> = m.values();
        let keyText: string = '';
        for (const key of keys) {
          keyText += key;
        }
        let sum: int = 0;
        for (const value of values) {
          sum += value;
        }
        expect(iteratorProbe.isMapIterator(keys)).assertTrue();
        expect(iteratorProbe.isMapIterator(values)).assertTrue();
        expect(keyText).assertEqual('ab');
        expect(sum).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_0700
     * @tc.name testTypesIsMapIterator007
     * @tc.desc Merged batch (2 tests): Basic construction and recognition: a keys iterator taken before every entry was deleted is recognized and yields no key afterwards; of a Map built by copying another Map's entries is recognized and both Maps keep their size.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a keys iterator taken before every entry was deleted is recognized and yields no key afterwards ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        let it: IterableIterator<string> = m.keys();
        m.delete('a');
        m.delete('b');
        expect(iteratorProbe.isMapIterator(it)).assertTrue();
        let count: int = 0;
        for (const key of it) {
          count += 1;
        }
        expect(count).assertEqual(0);
        expect(m.size).assertEqual(0);
      }

      // --- [2] Verify a keys iterator of a Map built by copying another Map's entries is recognized and both Maps keep their size ---
      {
        let iteratorProbe: util.types = new util.types();
        let source: Map<string, int> = new Map<string, int>();
        source.set('one', 1);
        source.set('two', 2);
        let copy: Map<string, int> = new Map<string, int>();
        let keys: IterableIterator<string> = source.keys();
        for (const key of keys) {
          let value: int | undefined = source.get(key);
          if (value !== undefined) {
            copy.set(key, value);
          }
        }
        expect(iteratorProbe.isMapIterator(copy.keys())).assertTrue();
        expect(copy.size).assertEqual(2);
        expect(source.size).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_0800
     * @tc.name testTypesIsMapIterator008
     * @tc.desc Merged batch (5 tests): Boundary values: accepts a keys iterator over double keys 1.5 and Double.MAX_VALUE and one over a single element Map; isMapIterator returns true when the key set mixes the empty string and the surrogate pair text of code point U+1F600; rejects a zero byte ArrayBuffer; isMapIterator rejects a zero length Uint8Array while accepting a Map keys iterator in the same case; a keys iterator yields the same accepted result whether passed directly or read out of a single element Object array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a keys iterator over double keys 1.5 and Double.MAX_VALUE and one over a single element Map are accepted ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<double, string> = new Map<double, string>();
        m.set(1.5, 'half');
        m.set(Double.MAX_VALUE, 'big');
        let it: IterableIterator<double> = m.keys();
        expect(iteratorChecker.isMapIterator(it)).assertTrue();
        let iteratorProbe: util.types = new util.types();
        let m_2: Map<string, int> = new Map<string, int>();
        m_2.set('only', 1);
        expect(iteratorProbe.isMapIterator(m_2.keys())).assertTrue();
        expect(m_2.size).assertEqual(1);
      }

      // --- [2] Verify isMapIterator returns true when the key set mixes the empty string and the surrogate pair text of code point U+1F600 ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('', 0);
        m.set(surrogatePairText(), 1);
        expect(iteratorProbe.isMapIterator(m.keys())).assertTrue();
        expect(m.size).assertEqual(2);
      }

      // --- [3] Verify isMapIterator returns false for a zero byte ArrayBuffer ---
      {
        let iteratorProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(0);
        expect(iteratorProbe.isMapIterator(ab)).assertFalse();
        expect(ab.byteLength).assertEqual(0);
      }

      // --- [4] Verify isMapIterator rejects a zero length Uint8Array while accepting a Map keys iterator in the same case ---
      {
        let iteratorProbe: util.types = new util.types();
        let empty: Uint8Array = new Uint8Array(0);
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        expect(iteratorProbe.isMapIterator(empty)).assertFalse();
        expect(iteratorProbe.isMapIterator(m.keys())).assertTrue();
        expect(empty.length).assertEqual(0);
      }

      // --- [5] Verify a keys iterator yields the same accepted result whether passed directly or read out of a single element Object array ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let it: IterableIterator<string> = m.keys();
        let boxed: Object[] = [it];
        expect(iteratorChecker.isMapIterator(it)).assertTrue();
        expect(iteratorChecker.isMapIterator(boxed[0])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_0900
     * @tc.name testTypesIsMapIterator009
     * @tc.desc Merged batch (3 tests): Boundary values: accepts a Map keyed by 2147483647 and -2147483648, the int maximum and minimum; a keys iterator of a Map keyed by the empty string is recognized and the key stays present; a Uint8Array keeps byteLength 3 and its first element when passed to the check.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMapIterator returns true for a Map keyed by 2147483647 and -2147483648, the int maximum and minimum ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<int, string> = new Map<int, string>();
        m.set(2147483647, 'max');
        m.set(-2147483648, 'min');
        let it: IterableIterator<int> = m.keys();
        expect(iteratorProbe.isMapIterator(it)).assertTrue();
        expect(m.size).assertEqual(2);
      }

      // --- [2] Verify a keys iterator of a Map keyed by the empty string is recognized and the key stays present ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('', 5);
        expect(iteratorProbe.isMapIterator(m.keys())).assertTrue();
        expect(m.has('')).assertTrue();
      }

      // --- [3] Verify a Uint8Array keeps byteLength 3 and its first element when passed to the check ---
      {
        let iteratorProbe: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array([1, 2, 3]);
        iteratorProbe.isMapIterator(uint8View);
        expect(uint8View.byteLength).assertEqual(3);
        expect(uint8View.$_get(0)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_1000
     * @tc.name testTypesIsMapIterator010
     * @tc.desc Merged batch (4 tests): Boundary overflow: verifies numeric limit and wrapping behavior, covering loop and iterator traversal.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMapIterator returns false for the ints 0, -1, 2147483647 and -2147483648 in a single pass ---
      {
        let iteratorChecker: util.types = new util.types();
        let values: int[] = [0, -1, 2147483647, -2147483648];
        let hits: int = 0;
        for (const value of values) {
          if (iteratorChecker.isMapIterator(value)) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [2] Verify isMapIterator rejects the doubles 1.5, Double.MAX_VALUE, -0.0, 0.0, NaN and positive Infinity in a single pass ---
      {
        let iteratorChecker: util.types = new util.types();
        let notANumber: double = Double.NaN;
        let plusInf: double = Double.POSITIVE_INFINITY;
        let values: double[] = [1.5, Double.MAX_VALUE, -0.0, 0.0, notANumber, plusInf];
        let hits: int = 0;
        for (const value of values) {
          if (iteratorChecker.isMapIterator(value)) {
            hits = hits + 1;
          }
        }
        expect(isNaN(notANumber)).assertTrue();
        expect(isFinite(plusInf)).assertFalse();
        expect(hits).assertEqual(0);
      }

      // --- [3] Verify isMapIterator returns false for Double.MIN_VALUE, the smallest positive double ---
      {
        let iteratorChecker: util.types = new util.types();
        let smallest: double = Double.MIN_VALUE;
        let flags: boolean[] = [iteratorChecker.isMapIterator(smallest)];
        expect(flags).assertDeepEquals([false]);
      }

      // --- [4] Verify isMapIterator returns false for the scientific notation value 1e21 which is ten to the power 21 ---
      {
        let iteratorChecker: util.types = new util.types();
        let magnitudes: double[] = [1e21];
        let verdict: boolean = iteratorChecker.isMapIterator(magnitudes[0]);
        expect(verdict).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_1100
     * @tc.name testTypesIsMapIterator011
     * @tc.desc Merged batch (5 tests): Primitive value rejection: isMapIterator rejects a boxed int, byte and short primitive collected in one Object array; rejects the smallest positive number primitive 1 and Double.NEGATIVE_INFINITY; rejects 9007199254740992, the value of two to the power 53; rejects a float typed variable holding 3.25; rejects a long variable whether passed directly or boxed through Object.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMapIterator rejects a boxed int, byte and short primitive collected in one Object array ---
      {
        let iteratorChecker: util.types = new util.types();
        let held: Object = 5;
        let narrow: byte = 127;
        let half: short = 32767;
        let boxes: Object[] = [held, narrow, half];
        expect(iteratorChecker.isMapIterator(boxes[0])).assertFalse();
        expect(iteratorChecker.isMapIterator(boxes[1])).assertFalse();
        expect(iteratorChecker.isMapIterator(boxes[2])).assertFalse();
        expect(boxes.length).assertEqual(3);
      }

      // --- [2] Verify isMapIterator returns false for the smallest positive number primitive 1 and Double.NEGATIVE_INFINITY ---
      {
        let iteratorChecker: util.types = new util.types();
        let verdict: boolean = iteratorChecker.isMapIterator(1);
        expect(verdict).assertFalse();
        let iteratorChecker_2: util.types = new util.types();
        let boundary: double = Double.NEGATIVE_INFINITY;
        let negatives: double[] = [boundary];
        expect(iteratorChecker_2.isMapIterator(negatives[0])).assertFalse();
      }

      // --- [3] Verify isMapIterator returns false for 9007199254740992, the value of two to the power 53 ---
      {
        let iteratorChecker: util.types = new util.types();
        let candidates: double[] = [9007199254740992];
        let accepted: int = 0;
        for (const candidate of candidates) {
          if (iteratorChecker.isMapIterator(candidate)) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(0);
      }

      // --- [4] Verify isMapIterator returns false for a float typed variable holding 3.25 ---
      {
        let iteratorChecker: util.types = new util.types();
        let fl: float = 3.25f;
        expect(iteratorChecker.isMapIterator(fl)).assertFalse();
      }

      // --- [5] Verify isMapIterator returns false for a long variable whether passed directly or boxed through Object ---
      {
        let iteratorChecker: util.types = new util.types();
        let counted: long = 99;
        expect(iteratorChecker.isMapIterator(counted)).assertFalse();
        expect(iteratorChecker.isMapIterator(counted as Object)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_1200
     * @tc.name testTypesIsMapIterator012
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the two code unit surrogate pair of code point U+1F600; rejects a repeated string of 10000 characters; rejects both boolean literals true and false and the bigint value built by BigInt(1); the boolean true produced by an earlier iterator check is itself rejected when passed back to the check; rejects an Object typed variable holding an empty int array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMapIterator returns false for the two code unit surrogate pair of code point U+1F600 ---
      {
        let iteratorProbe: util.types = new util.types();
        let pair: string = surrogatePairText();
        expect(pair.length).assertEqual(2);
        expect(iteratorProbe.isMapIterator(pair)).assertFalse();
      }

      // --- [2] Verify isMapIterator returns false for a repeated string of 10000 characters ---
      {
        let iteratorProbe: util.types = new util.types();
        let longText: string = 'x'.repeat(10000);
        expect(longText.length).assertEqual(10000);
        expect(iteratorProbe.isMapIterator(longText)).assertFalse();
      }

      // --- [3] Verify isMapIterator returns false for both boolean literals true and false and the bigint value built by BigInt(1) ---
      {
        let iteratorChecker: util.types = new util.types();
        expect(iteratorChecker.isMapIterator(true)).assertFalse();
        expect(iteratorChecker.isMapIterator(false)).assertFalse();
        let iteratorChecker_2: util.types = new util.types();
        let oneBig: bigint = BigInt(1);
        expect(iteratorChecker_2.isMapIterator(oneBig)).assertFalse();
      }

      // --- [4] Verify the boolean true produced by an earlier iterator check is itself rejected when passed back to the check ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let verdict: boolean = iteratorChecker.isMapIterator(m.keys());
        expect(verdict).assertTrue();
        expect(iteratorChecker.isMapIterator(verdict)).assertFalse();
      }

      // --- [5] Verify isMapIterator returns false for an Object typed variable holding an empty int array ---
      {
        let iteratorProbe: util.types = new util.types();
        let arr: int[] = [];
        let held: Object = arr;
        expect(iteratorProbe.isMapIterator(held)).assertFalse();
        expect(arr.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_1300
     * @tc.name testTypesIsMapIterator013
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the keys iterator of a populated string Set; double Set holding 1.5; rejects the entries iterator of a populated int Set; three element int array; rejects the values iterator of a two element string array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMapIterator returns false for the keys iterator of a populated string Set ---
      {
        let iteratorChecker: util.types = new util.types();
        let s: Set<string> = new Set<string>();
        s.add('a');
        let it: IterableIterator<string> = s.keys();
        expect(iteratorChecker.isMapIterator(it)).assertFalse();
      }

      // --- [2] Verify isMapIterator returns false for the keys iterator of a double Set holding 1.5 ---
      {
        let iteratorChecker: util.types = new util.types();
        let s: Set<double> = new Set<double>();
        s.add(1.5);
        let it: IterableIterator<double> = s.keys();
        expect(iteratorChecker.isMapIterator(it)).assertFalse();
      }

      // --- [3] Verify isMapIterator returns false for the entries iterator of a populated int Set ---
      {
        let iteratorProbe: util.types = new util.types();
        let s: Set<int> = new Set<int>();
        s.add(1);
        let it: IterableIterator<[int, int]> = s.entries();
        expect(iteratorProbe.isMapIterator(it)).assertFalse();
        expect(s.size).assertEqual(1);
      }

      // --- [4] Verify isMapIterator returns false for the keys iterator of a three element int array ---
      {
        let iteratorChecker: util.types = new util.types();
        let arr: int[] = [1, 2, 3];
        let it: IterableIterator<int> = arr.keys();
        expect(iteratorChecker.isMapIterator(it)).assertFalse();
      }

      // --- [5] Verify isMapIterator returns false for the values iterator of a two element string array ---
      {
        let iteratorProbe: util.types = new util.types();
        let words: string[] = ['a', 'b'];
        let it: IterableIterator<string> = words.values();
        expect(iteratorProbe.isMapIterator(it)).assertFalse();
        expect(words.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_1400
     * @tc.name testTypesIsMapIterator014
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the entries iterator of a two element int array; rejects BigInt64Array, BigUint64Array, RegExp, TypeError and util.types values; rejects Date instances at the current time, epoch 0, 8640000000000000 and -8640000000000000 in a single pass; rejects a Promise resolved with the int 1; the iterator check rejects the Map body, an int array and a Uint8Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMapIterator returns false for the entries iterator of a two element int array ---
      {
        let iteratorChecker: util.types = new util.types();
        let nums: int[] = [10, 20];
        let it: IterableIterator<[int, int]> = nums.entries();
        expect(iteratorChecker.isMapIterator(it)).assertFalse();
      }

      // --- [2] Verify isMapIterator returns false for BigInt64Array, BigUint64Array, RegExp, TypeError and util.types values ---
      {
        let iteratorChecker: util.types = new util.types();
        let bigInt64View: BigInt64Array = new BigInt64Array(2);
        let bigUint64View: BigUint64Array = new BigUint64Array(2);
        let re: RegExp = new RegExp('abc');
        let te: Error = new TypeError('bad type');
        let other: Object = new util.types();
        expect(iteratorChecker.isMapIterator(bigInt64View)).assertFalse();
        expect(iteratorChecker.isMapIterator(bigUint64View)).assertFalse();
        expect(iteratorChecker.isMapIterator(re)).assertFalse();
        expect(iteratorChecker.isMapIterator(te)).assertFalse();
        expect(iteratorChecker.isMapIterator(other)).assertFalse();
      }

      // --- [3] Verify isMapIterator returns false for Date instances at the current time, epoch 0, 8640000000000000 and -8640000000000000 in a single pass ---
      {
        let iteratorChecker: util.types = new util.types();
        let current: Date = new Date();
        let epoch: Date = new Date(0);
        let times: long[] = [8640000000000000, -8640000000000000];
        let hits: int = 0;
        if (iteratorChecker.isMapIterator(current)) {
          hits = hits + 1;
        }
        if (iteratorChecker.isMapIterator(epoch)) {
          hits = hits + 1;
        }
        for (const time of times) {
          let d: Date = new Date(time);
          if (iteratorChecker.isMapIterator(d)) {
            hits = hits + 1;
          }
        }
        expect(epoch.getTime()).assertEqual(0);
        expect(hits).assertEqual(0);
      }

      // --- [4] Verify isMapIterator returns false for a Promise resolved with the int 1 ---
      {
        let iteratorChecker: util.types = new util.types();
        let p: Promise<int> = Promise.resolve<int>(1);
        expect(iteratorChecker.isMapIterator(p)).assertFalse();
      }

      // --- [5] Verify the iterator check rejects the Map body, an int array and a Uint8Array ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let arr: int[] = [1, 2];
        let uint8View: Uint8Array = new Uint8Array([1, 2]);
        let bodyHit: boolean = iteratorProbe.isMapIterator(m);
        let arrayHit: boolean = iteratorProbe.isMapIterator(arr);
        let viewHit: boolean = iteratorProbe.isMapIterator(uint8View);
        expect(bodyHit).assertFalse();
        expect(arrayHit).assertFalse();
        expect(viewHit).assertFalse();
        expect(m.size).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_1500
     * @tc.name testTypesIsMapIterator015
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects an Object typed variable holding a Date built from epoch 0; rejects the keys iterator of an empty Set and a Date Set holding a Date built from epoch 0; rejects the values iterator of a Set of bare Object instances; rejects the keys iterator of a Set whose single member is another Set; a Set keys iterator that advanced once through next is still not a Map iterator.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMapIterator returns false for an Object typed variable holding a Date built from epoch 0 ---
      {
        let iteratorChecker: util.types = new util.types();
        let d: Date = new Date(0);
        let held: Object = d;
        expect(iteratorChecker.isMapIterator(held)).assertFalse();
      }

      // --- [2] Verify isMapIterator returns false for the keys iterator of an empty Set and a Date Set holding a Date built from epoch 0 ---
      {
        let iteratorProbe: util.types = new util.types();
        let s: Set<int> = new Set<int>();
        let it: IterableIterator<int> = s.keys();
        expect(iteratorProbe.isMapIterator(it)).assertFalse();
        expect(s.size).assertEqual(0);
        let iteratorChecker: util.types = new util.types();
        let s_2: Set<Date> = new Set<Date>();
        s_2.add(new Date(0));
        let it_2: IterableIterator<Date> = s_2.keys();
        expect(iteratorChecker.isMapIterator(it_2)).assertFalse();
      }

      // --- [3] Verify isMapIterator returns false for the values iterator of a Set of bare Object instances ---
      {
        let iteratorChecker: util.types = new util.types();
        let s: Set<Object> = new Set<Object>();
        s.add(new Object());
        let it: IterableIterator<Object> = s.values();
        expect(iteratorChecker.isMapIterator(it)).assertFalse();
      }

      // --- [4] Verify isMapIterator returns false for the keys iterator of a Set whose single member is another Set ---
      {
        let iteratorChecker: util.types = new util.types();
        let inner: Set<int> = new Set<int>();
        let s: Set<Set<int>> = new Set<Set<int>>();
        s.add(inner);
        let it: IterableIterator<Set<int>> = s.keys();
        expect(iteratorChecker.isMapIterator(it)).assertFalse();
      }

      // --- [5] Verify a Set keys iterator that advanced once through next is still not a Map iterator ---
      {
        let iteratorChecker: util.types = new util.types();
        let s: Set<int> = new Set<int>();
        s.add(1);
        let it: IterableIterator<int> = s.keys();
        it.next();
        expect(iteratorChecker.isMapIterator(it)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_1600
     * @tc.name testTypesIsMapIterator016
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects the keys iterator of an Int32Array of two elements; rejects the values iterator of a three byte Uint8Array and entries iterator of a two element Float64Array; rejects an empty Map container passed as the value itself; rejects a Set container holding one member; rejects a WeakMap container keyed by a class instance.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMapIterator returns false for the keys iterator of an Int32Array of two elements ---
      {
        let iteratorChecker: util.types = new util.types();
        let int32View: Int32Array = new Int32Array(2);
        let it: IterableIterator<int> = int32View.keys();
        expect(iteratorChecker.isMapIterator(it)).assertFalse();
      }

      // --- [2] Verify isMapIterator returns false for the values iterator of a three byte Uint8Array and entries iterator of a two element Float64Array ---
      {
        let iteratorChecker: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(3);
        let it: IterableIterator<double> = uint8View.values();
        expect(iteratorChecker.isMapIterator(it)).assertFalse();
        let iteratorChecker_2: util.types = new util.types();
        let float64View: Float64Array = new Float64Array(2);
        let it_2: IterableIterator<[int, double]> = float64View.entries();
        expect(iteratorChecker_2.isMapIterator(it_2)).assertFalse();
      }

      // --- [3] Verify isMapIterator returns false for an empty Map container passed as the value itself ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<int, int> = new Map<int, int>();
        expect(iteratorChecker.isMapIterator(m)).assertFalse();
      }

      // --- [4] Verify isMapIterator returns false for a Set container holding one member ---
      {
        let iteratorChecker: util.types = new util.types();
        let s: Set<int> = new Set<int>();
        s.add(1);
        expect(iteratorChecker.isMapIterator(s)).assertFalse();
      }

      // --- [5] Verify isMapIterator returns false for a WeakMap container keyed by a class instance ---
      {
        let iteratorChecker: util.types = new util.types();
        let key: IteratorKeyBox = new IteratorKeyBox();
        let wm: WeakMap<IteratorKeyBox, string> = new WeakMap<IteratorKeyBox, string>();
        wm.set(key, 'held');
        expect(iteratorChecker.isMapIterator(wm)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_1700
     * @tc.name testTypesIsMapIterator017
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a WeakSet container holding a class instance; rejects three typed array views: Int8Array, Uint8Array and Uint8ClampedArray; bare eight byte ArrayBuffer, counted as a single rejection; DataView covering a whole four byte ArrayBuffer; global empty pattern RegExp and a util.Base64Helper instance.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMapIterator returns false for a WeakSet container holding a class instance ---
      {
        let iteratorChecker: util.types = new util.types();
        let key: IteratorKeyBox = new IteratorKeyBox();
        let ws: WeakSet<IteratorKeyBox> = new WeakSet<IteratorKeyBox>();
        ws.add(key);
        expect(iteratorChecker.isMapIterator(ws)).assertFalse();
      }

      // --- [2] Verify isMapIterator returns false for three typed array views: Int8Array, Uint8Array and Uint8ClampedArray ---
      {
        let iteratorChecker: util.types = new util.types();
        let int8View: Int8Array = new Int8Array([-1, 2]);
        let uint8View: Uint8Array = new Uint8Array([1, 2]);
        let clamped: Uint8ClampedArray = new Uint8ClampedArray([255]);
        expect(iteratorChecker.isMapIterator(int8View)).assertFalse();
        expect(iteratorChecker.isMapIterator(uint8View)).assertFalse();
        expect(iteratorChecker.isMapIterator(clamped)).assertFalse();
      }

      // --- [3] Verify isMapIterator returns false for a bare eight byte ArrayBuffer, counted as a single rejection ---
      {
        let iteratorProbe: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let rejected: int = 0;
        if (!iteratorProbe.isMapIterator(ab)) {
          rejected++;
        }
        expect(rejected).assertEqual(1);
        expect(ab.byteLength).assertEqual(8);
      }

      // --- [4] Verify isMapIterator returns false for a DataView covering a whole four byte ArrayBuffer ---
      {
        let iteratorChecker: util.types = new util.types();
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let dv: DataView = new DataView(ab);
        expect(iteratorChecker.isMapIterator(dv)).assertFalse();
      }

      // --- [5] Verify isMapIterator returns false for a global empty pattern RegExp and a util.Base64Helper instance ---
      {
        let iteratorChecker: util.types = new util.types();
        let re: RegExp = new RegExp('', 'g');
        let helper: util.Base64Helper = new util.Base64Helper();
        expect(iteratorChecker.isMapIterator(re)).assertFalse();
        expect(iteratorChecker.isMapIterator(helper)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_1800
     * @tc.name testTypesIsMapIterator018
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a generic Error instance carrying a message; rejects a plain arrow function reference carried in an Object variable; rejects an async arrow function reference carried in an Object variable; rejects an instance of a plain class; rejects an interface typed object literal.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMapIterator returns false for a generic Error instance carrying a message ---
      {
        let iteratorProbe: util.types = new util.types();
        let er: Error = new Error('probe');
        expect(iteratorProbe.isMapIterator(er)).assertFalse();
        expect(er.message).assertEqual('probe');
      }

      // --- [2] Verify isMapIterator returns false for a plain arrow function reference carried in an Object variable ---
      {
        let iteratorChecker: util.types = new util.types();
        let fn: Object = (): void => { };
        expect(iteratorChecker.isMapIterator(fn)).assertFalse();
      }

      // --- [3] Verify isMapIterator returns false for an async arrow function reference carried in an Object variable ---
      {
        let iteratorChecker: util.types = new util.types();
        let af: Object = async (): Promise<void> => { };
        expect(iteratorChecker.isMapIterator(af)).assertFalse();
      }

      // --- [4] Verify isMapIterator returns false for an instance of a plain class ---
      {
        let iteratorProbe: util.types = new util.types();
        let box: IteratorKeyBox = new IteratorKeyBox();
        expect(iteratorProbe.isMapIterator(box)).assertFalse();
        expect(box.tag).assertEqual('key');
      }

      // --- [5] Verify isMapIterator returns false for an interface typed object literal ---
      {
        let iteratorProbe: util.types = new util.types();
        let label: IteratorLabel = { label: 'x' };
        expect(iteratorProbe.isMapIterator(label)).assertFalse();
        expect(label.label).assertEqual('x');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_1900
     * @tc.name testTypesIsMapIterator019
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a bare Object instance produced by a helper function; rejects a util.LRUCache instance; isMapIterator rejects a RegExp and an Error while accepting the keys and values iterators of a Map; a Uint8Array and a Set values iterator are both rejected by the iterator check; the Map and WeakMap bodies are rejected by the iterator check.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMapIterator returns false for a bare Object instance produced by a helper function ---
      {
        let iteratorChecker: util.types = new util.types();
        let plain: Object = bareObjectValue();
        expect(iteratorChecker.isMapIterator(plain)).assertFalse();
      }

      // --- [2] Verify isMapIterator returns false for a util.LRUCache instance ---
      {
        let iteratorChecker: util.types = new util.types();
        let cache: util.LRUCache<string, int> = new util.LRUCache<string, int>();
        expect(iteratorChecker.isMapIterator(cache)).assertFalse();
      }

      // --- [3] Verify isMapIterator rejects a RegExp and an Error while accepting the keys and values iterators of a Map ---
      {
        let iteratorChecker: util.types = new util.types();
        let pattern: RegExp = new RegExp('');
        let err: Error = new Error('probe');
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        expect(iteratorChecker.isMapIterator(pattern)).assertFalse();
        expect(iteratorChecker.isMapIterator(err)).assertFalse();
        expect(iteratorChecker.isMapIterator(m.keys())).assertTrue();
        expect(iteratorChecker.isMapIterator(m.values())).assertTrue();
      }

      // --- [4] Verify a Uint8Array and a Set values iterator are both rejected by the iterator check ---
      {
        let iteratorProbe: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array([1, 2]);
        let s: Set<string> = new Set<string>();
        s.add('m');
        let bytesVerdict: boolean = iteratorProbe.isMapIterator(uint8View);
        let setValuesVerdict: boolean = iteratorProbe.isMapIterator(s.values());
        expect(bytesVerdict).assertFalse();
        expect(setValuesVerdict).assertFalse();
        expect(uint8View.byteLength).assertEqual(2);
      }

      // --- [5] Verify the Map and WeakMap bodies are rejected by the iterator check ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let key: IteratorKeyBox = new IteratorKeyBox();
        let wm: WeakMap<IteratorKeyBox, int> = new WeakMap<IteratorKeyBox, int>();
        wm.set(key, 1);

        expect(iteratorProbe.isMapIterator(m)).assertFalse();
        expect(iteratorProbe.isMapIterator(wm)).assertFalse();
        expect(key.tag).assertEqual('key');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_2000
     * @tc.name testTypesIsMapIterator020
     * @tc.desc Merged batch (5 tests): Non-target object rejection: a WeakSet body is rejected by the iterator check even though it holds an object member; collecting the iterator check results for a keys iterator and the Map body gives true then false; swapping the Object field of a holder for a Set values iterator turns the field check from true into false; the check does not consume a keys iterator because a later for of loop still sees every key; both keys iterators taken from one Map pass the iterator check while the Set iterator check fails.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a WeakSet body is rejected by the iterator check even though it holds an object member ---
      {
        let iteratorProbe: util.types = new util.types();
        let box: IteratorKeyBox = new IteratorKeyBox();
        let ws: WeakSet<IteratorKeyBox> = new WeakSet<IteratorKeyBox>();
        ws.add(box);
        let accepted: int = 0;
        if (iteratorProbe.isMapIterator(ws)) {
          accepted += 1;
        }
        expect(accepted).assertEqual(0);
        expect(ws.has(box)).assertTrue();
      }

      // --- [2] Verify collecting the iterator check results for a keys iterator and the Map body gives true then false ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let results: Array<boolean> = [];
        results.push(iteratorProbe.isMapIterator(m.keys()));
        results.push(iteratorProbe.isMapIterator(m));
        expect(results.length).assertEqual(2);
        expect(results[0]).assertTrue();
        expect(results[1]).assertFalse();
      }

      // --- [3] Verify swapping the Object field of a holder for a Set values iterator turns the field check from true into false ---
      {
        let iteratorChecker: util.types = new util.types();
        let holder: IteratorFieldHolder = new IteratorFieldHolder();
        let s: Set<int> = new Set<int>();
        s.add(1);
        expect(iteratorChecker.isMapIterator(holder.handle)).assertTrue();
        holder.handle = s.values();
        expect(iteratorChecker.isMapIterator(holder.handle)).assertFalse();
      }

      // --- [4] Verify the check does not consume a keys iterator because a later for of loop still sees every key ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('first', 1);
        m.set('second', 2);
        let it: IterableIterator<string> = m.keys();
        let hit: boolean = iteratorProbe.isMapIterator(it);
        let order: string = '';
        for (const key of it) {
          order += key;
        }
        expect(hit).assertTrue();
        expect(order).assertEqual('firstsecond');
      }

      // --- [5] Verify both keys iterators taken from one Map pass the iterator check while the Set iterator check fails ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let it: IterableIterator<string> = m.keys();
        let pairs: Object[] = [it, m.keys()];
        expect(pairs.every((probe: Object): boolean => iteratorChecker.isMapIterator(probe))).assertTrue();
        expect(iteratorChecker.isSetIterator(it)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_2100
     * @tc.name testTypesIsMapIterator021
     * @tc.desc Merged batch (5 tests): Non-target object rejection: two consecutive detections of the same Map body both return the same false value; the check does not consume a values iterator because a later for of loop still sees every value; draining one keys iterator does not disturb a second keys iterator taken from the same Map which still yields every key; a subarray cut from a Uint8Array is rejected; a helper that forwards an Object parameter to the iterator check reports false for the Map body.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two consecutive detections of the same Map body both return the same false value ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let r1: boolean = iteratorChecker.isMapIterator(m);
        let r2: boolean = iteratorChecker.isMapIterator(m);
        expect(r1).assertFalse();
        expect(r2).assertEqual(r1);
      }

      // --- [2] Verify the check does not consume a values iterator because a later for of loop still sees every value ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 3);
        m.set('b', 5);
        let it: IterableIterator<int> = m.values();
        let hit: boolean = iteratorProbe.isMapIterator(it);
        let sum: int = 0;
        for (const value of it) {
          sum += value;
        }
        expect(hit).assertTrue();
        expect(sum).assertEqual(8);
      }

      // --- [3] Verify draining one keys iterator does not disturb a second keys iterator taken from the same Map which still yields every key ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        let first: IterableIterator<string> = m.keys();
        let second: IterableIterator<string> = m.keys();
        let firstOrder: string = '';
        for (const key of first) {
          firstOrder += key;
        }
        let secondOrder: string = '';
        for (const key of second) {
          secondOrder += key;
        }
        expect(iteratorProbe.isMapIterator(first)).assertTrue();
        expect(iteratorProbe.isMapIterator(second)).assertTrue();
        expect(firstOrder).assertEqual('ab');
        expect(secondOrder).assertEqual('ab');
      }

      // --- [4] Verify a subarray cut from a Uint8Array is rejected while the subarray and its source buffer keep their byte lengths ---
      {
        let iteratorProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let view: Uint8Array = new Uint8Array(buf);
        let sub: Uint8Array = view.subarray(0, 2);
        expect(iteratorProbe.isMapIterator(sub)).assertFalse();
        expect(sub.byteLength).assertEqual(2);
        expect(buf.byteLength).assertEqual(4);
      }

      // --- [5] Verify a helper that forwards an Object parameter to the iterator check reports false for the Map body ---
      {
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        expect(probeIteratorThroughObject(m)).assertFalse();
        expect(m.has('a')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_2200
     * @tc.name testTypesIsMapIterator022
     * @tc.desc Merged batch (3 tests): Non-target object rejection: the key iterator taken from the Set returned by Map.keySet is judged a set iterator and not a map iterator; the Map container itself fails while its keys iterator passes the same check on the same Map; a Set values iterator fails the iterator check although the owning Set passes isSet.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the key iterator taken from the Set returned by Map.keySet is judged a set iterator and not a map iterator ---
      {
        let checker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('q', 1);
        let ks: Set<string> = m.keySet();
        let si: IterableIterator<string> = ks.keys();
        expect(checker.isSetIterator(si)).assertTrue();
        expect(checker.isMapIterator(si)).assertFalse();
      }

      // --- [2] Verify the Map container itself fails while its keys iterator passes the same check on the same Map ---
      {
        let iteratorChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        expect(iteratorChecker.isMapIterator(m)).assertFalse();
        expect(iteratorChecker.isMapIterator(m.keys())).assertTrue();
      }

      // --- [3] Verify a Set values iterator fails the iterator check although the owning Set passes isSet ---
      {
        let iteratorChecker: util.types = new util.types();
        let s: Set<int> = new Set<int>();
        s.add(4);
        let it: IterableIterator<int> = s.values();
        expect(iteratorChecker.isMapIterator(it)).assertFalse();
        expect(iteratorChecker.isSet(s)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_2300
     * @tc.name testTypesIsMapIterator023
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: a keys iterator that a for of loop already exhausted still reports both keys and stays a Map iterator; an entries iterator of a Map whose value is an int array is recognized and the row stays reachable; a values iterator of a Map keyed by a double is recognized and the key stays present; a Map keeps size 2 across a size driven loop and a keys iterator stored as a Map value keeps its identity and verdict; an entries iterator of a Map keyed by a boolean is recognized and the key stays present.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a keys iterator that a for of loop already exhausted still reports both keys and stays a Map iterator ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        let it: IterableIterator<string> = m.keys();
        let seen: int = 0;
        for (const key of it) {
          seen += 1;
        }
        expect(seen).assertEqual(2);
        expect(iteratorProbe.isMapIterator(it)).assertTrue();
      }

      // --- [2] Verify an entries iterator of a Map whose value is an int array is recognized and the row stays reachable ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int[]> = new Map<string, int[]>();
        m.set('row', [1, 2, 3]);
        expect(iteratorProbe.isMapIterator(m.entries())).assertTrue();
        let row: int[] | undefined = m.get('row');
        expect(row !== undefined).assertTrue();
      }

      // --- [3] Verify a values iterator of a Map keyed by a double is recognized and the key stays present ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<double, string> = new Map<double, string>();
        m.set(1.5, 'half');
        expect(iteratorProbe.isMapIterator(m.values())).assertTrue();
        expect(m.has(1.5)).assertTrue();
      }

      // --- [4] Verify a Map keeps size 2 across a size driven loop and a keys iterator stored as a Map value keeps its identity and verdict ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        let it: IterableIterator<string> = m.keys();
        let hit: boolean = iteratorProbe.isMapIterator(it);
        let visited: int = 0;
        while (visited < m.size) {
          visited += 1;
        }
        expect(hit).assertTrue();
        expect(visited).assertEqual(2);
        let iteratorProbe_2: util.types = new util.types();
        let m_2: Map<string, int> = new Map<string, int>();
        m_2.set('a', 1);
        let it_2: IterableIterator<string> = m_2.keys();
        let store: Map<string, IterableIterator<string>> = new Map<string, IterableIterator<string>>();
        store.set('iter', it_2);
        let held: IterableIterator<string> | undefined = store.get('iter');
        expect(held).assertEqual(it_2);
        expect(iteratorProbe_2.isMapIterator(it_2)).assertTrue();
      }

      // --- [5] Verify an entries iterator of a Map keyed by a boolean is recognized and the key stays present ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<boolean, int> = new Map<boolean, int>();
        m.set(true, 1);
        expect(iteratorProbe.isMapIterator(m.entries())).assertTrue();
        expect(m.has(true)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_ITERATOR_2400
     * @tc.name testTypesIsMapIterator024
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: an entries iterator of a Map whose value is a RegExp is recognized and the key stays present; a values iterator of a Map whose value is a Set is recognized and the key stays present; keys iterators of Maps holding a Date and an Error value are recognized; an entries iterator of a boolean keyed Map whose value is a Map is recognized and size stays one; a 64 entry keys iterator is recognized with size 64 and one keyed by a class instance keeps its key entry.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMapIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an entries iterator of a Map whose value is a RegExp is recognized and the key stays present ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, RegExp> = new Map<string, RegExp>();
        m.set('r', new RegExp('abc'));
        expect(iteratorProbe.isMapIterator(m.entries())).assertTrue();
        expect(m.has('r')).assertTrue();
      }

      // --- [2] Verify a values iterator of a Map whose value is a Set is recognized and the key stays present ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<string, Set<int>> = new Map<string, Set<int>>();
        m.set('s', new Set<int>());
        expect(iteratorProbe.isMapIterator(m.values())).assertTrue();
        expect(m.has('s')).assertTrue();
      }

      // --- [3] Verify keys iterators of Maps holding a Date and an Error value are recognized while each Map keeps one entry ---
      {
        let iteratorProbe: util.types = new util.types();
        let dates: Map<string, Date> = new Map<string, Date>();
        dates.set('d', new Date(0));
        expect(iteratorProbe.isMapIterator(dates.keys())).assertTrue();
        expect(dates.size).assertEqual(1);
        let errors: Map<string, Error> = new Map<string, Error>();
        errors.set('e', new Error('probe'));
        expect(iteratorProbe.isMapIterator(errors.keys())).assertTrue();
        expect(errors.size).assertEqual(1);
      }

      // --- [4] Verify an entries iterator of a boolean keyed Map whose value is a Map is recognized and size stays one ---
      {
        let iteratorProbe: util.types = new util.types();
        let m: Map<boolean, Map<string, int>> = new Map<boolean, Map<string, int>>();
        m.set(true, new Map<string, int>());
        expect(iteratorProbe.isMapIterator(m.entries())).assertTrue();
        expect(m.size).assertEqual(1);
      }

      // --- [5] Verify a 64 entry keys iterator is recognized with size 64 and one keyed by a class instance keeps its key entry ---
      {
        let m: Map<int, int> = new Map<int, int>();
        fillIndexedMap(m, 64);
        let holder: IteratorProbeHolder = new IteratorProbeHolder();
        expect(holder.accepts(m.keys())).assertTrue();
        expect(m.size).assertEqual(64);
        let iteratorProbe: util.types = new util.types();
        let key: IteratorKeyBox = new IteratorKeyBox();
        let m_2: Map<IteratorKeyBox, int> = new Map<IteratorKeyBox, int>();
        m_2.set(key, 1);
        expect(iteratorProbe.isMapIterator(m_2.keys())).assertTrue();
        expect(m_2.has(key)).assertTrue();
        expect(key.tag).assertEqual('key');
      }
    });

  });
}
