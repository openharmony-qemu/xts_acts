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

class KeyTag {
  tag: string = 'key';
}

class PlainBox {
  name: string = 'plain';
  count: int = 0;
}

class NullableSlot {
  value: Object | null = null;
}

interface NamedPair {
  name: string;
  size: int;
}

function makeMap(): Map<string, int> {
  let built: Map<string, int> = new Map<string, int>();
  built.set('k', 1);
  return built;
}

function plainFn(x: int): int {
  return x + 1;
}

async function declaredAsyncWork(): Promise<int> {
  return 1;
}

class MapHolder {
  store: Map<string, int> = new Map<string, int>();
  caption: string = 'holder';

  readStore(): Map<string, int> {
    return this.store;
  }

  assign(next: Map<string, int>): void {
    this.store = next;
  }
}

interface MapSlot {
  slot: Map<string, int>;
  label: string;
}

class MarkerError extends Error {
  constructor(message: string) {
    super(message);
  }
}

class MapInspector {
  subject: Map<string, int> = new Map<string, int>();

  countWhenMap(): int {
    let probe: util.types = new util.types();
    if (probe.isMap(this.subject)) {
      return this.subject.size;
    }
    return -1;
  }
}

class ResultSlot {
  holding: boolean = false;

  capture(value: Object): void {
    let probe: util.types = new util.types();
    this.holding = probe.isMap(value);
  }
}

function passThrough(value: Object): Object {
  return value;
}

function judgeIsMap(value: Object): boolean {
  let probe: util.types = new util.types();
  return probe.isMap(value);
}

function classifyCollection(value: Object): string {
  let probe: util.types = new util.types();
  if (probe.isMap(value)) {
    return 'map';
  }
  return 'not-map';
}

function collectOrderedKeys(source: Map<string, int>): string[] {
  let order: string[] = [];
  for (const k of source.keys()) {
    order.push(k);
  }
  return order;
}

function fillPair(target: Map<string, int>, tag: string, amount: int): void {
  target.set(tag, amount);
}

export default function typesIsMapTest(): void {
  describe('TypesIsMapTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_0100
     * @tc.name testTypesIsMap001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a string to string Map and an int to string Map each holding one entry; double keyed Map of booleans and a boolean keyed Map of booleans; Maps with Error values and Date or RegExp keys are accepted, as is a Map whose values are int arrays; Map typed variable that still holds zero entries; Map whose values are themselves Map instances and Set instances.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns true for a string to string Map and an int to string Map each holding one entry ---
      {
        let mapProbe: util.types = new util.types();
        let words: Map<string, string> = new Map<string, string>();
        words.set('a', 'b');
        let indexed: Map<int, string> = new Map<int, string>();
        indexed.set(1, 'one');
        let probes: Object[] = [words, indexed];
        expect(mapProbe.isMap(probes[0])).assertTrue();
        expect(mapProbe.isMap(probes[1])).assertTrue();
        expect(words.size).assertEqual(1);
        expect(indexed.size).assertEqual(1);
      }

      // --- [2] Verify isMap returns true for a double keyed Map of booleans and a boolean keyed Map of booleans ---
      {
        let mapProbe: util.types = new util.types();
        let ratios: Map<double, boolean> = new Map<double, boolean>();
        ratios.set(1.5, true);
        let flags: Map<boolean, boolean> = new Map<boolean, boolean>();
        flags.set(true, false);
        expect(mapProbe.isMap(ratios)).assertTrue();
        expect(mapProbe.isMap(flags)).assertTrue();
        expect(ratios.size).assertEqual(1);
        expect(flags.size).assertEqual(1);
      }

      // --- [3] Verify Maps with Error values and Date or RegExp keys are accepted, as is a Map whose values are int arrays ---
      {
        let mapProbe: util.types = new util.types();
        let errorValues: Map<int, Error> = new Map<int, Error>();
        errorValues.set(1, new Error('boom'));
        let dateKeys: Map<Date, int> = new Map<Date, int>();
        dateKeys.set(new Date(0), 1);
        let regexpKeys: Map<RegExp, int> = new Map<RegExp, int>();
        regexpKeys.set(new RegExp('probe'), 1);
        expect(mapProbe.isMap(errorValues)).assertTrue();
        expect(errorValues.size).assertEqual(1);
        expect(mapProbe.isMap(dateKeys)).assertTrue();
        expect(dateKeys.size).assertEqual(1);
        expect(mapProbe.isMap(regexpKeys)).assertTrue();
        expect(regexpKeys.size).assertEqual(1);
        let mapProbe_2: util.types = new util.types();
        let m: Map<int, int[]> = new Map<int, int[]>();
        m.set(1, [1, 2]);
        let r: boolean = mapProbe_2.isMap(m);
        expect(r).assertTrue();
        expect(m.size).assertEqual(1);
      }

      // --- [4] Verify isMap returns true for a Map typed variable that still holds zero entries ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<int, int> = new Map<int, int>();
        let r: boolean = mapProbe.isMap(m);
        expect(r).assertTrue();
        expect(m.size).assertEqual(0);
      }

      // --- [5] Verify isMap returns true for a Map whose values are themselves Map instances and Set instances ---
      {
        let mapChecker: util.types = new util.types();
        let inner: Map<string, int> = new Map<string, int>();
        inner.set('x', 1);
        let outer: Map<int, Map<string, int>> = new Map<int, Map<string, int>>();
        outer.set(1, inner);
        let r: boolean = mapChecker.isMap(outer);
        expect(r).assertTrue();
        expect(mapChecker.isMap(inner)).assertTrue();
        let mapProbe: util.types = new util.types();
        let inner_2: Set<int> = new Set<int>();
        inner_2.add(1);
        let m: Map<int, Set<int>> = new Map<int, Set<int>>();
        m.set(1, inner_2);
        expect(mapProbe.isMap(m)).assertTrue();
        expect(inner_2.size).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_0200
     * @tc.name testTypesIsMap002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a Map whose values are Uint8Array views; whose values are plain function references; typed with Object keys and Object values holding class instances; filled with one thousand distinct int keys and reports size one thousand; the size of a Map is the same before and after the isMap call and equals the number of keys inserted.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns true for a Map whose values are Uint8Array views ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<int, Uint8Array> = new Map<int, Uint8Array>();
        m.set(1, new Uint8Array(2));
        expect(mapProbe.isMap(m)).assertTrue();
        expect(m.size).assertEqual(1);
      }

      // --- [2] Verify isMap returns true for a Map whose values are plain function references ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, Object> = new Map<string, Object>();
        m.set('f', plainFn);
        expect(mapProbe.isMap(m)).assertTrue();
        expect(m.size).assertEqual(1);
      }

      // --- [3] Verify isMap returns true for a Map typed with Object keys and Object values holding class instances ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<Object, Object> = new Map<Object, Object>();
        m.set(new KeyTag(), new PlainBox());
        expect(mapProbe.isMap(m)).assertTrue();
        expect(m.size).assertEqual(1);
      }

      // --- [4] Verify isMap returns true for a Map filled with one thousand distinct int keys and reports size one thousand ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<int, int> = new Map<int, int>();
        for (let i: int = 0; i < 1000; i++) {
          m.set(i, i);
        }
        let r: boolean = mapProbe.isMap(m);
        expect(r).assertTrue();
        expect(m.size).assertEqual(1000);
      }

      // --- [5] Verify the size of a Map is the same before and after the isMap call and equals the number of keys inserted ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        let before: int = m.size;
        let ok: boolean = mapProbe.isMap(m);
        let after: int = m.size;
        expect(ok).assertTrue();
        expect(after).assertEqual(before);
        expect(after).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_0300
     * @tc.name testTypesIsMap003
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a Map rebuilt from the value iterator of a Set; holding the int minus one hundred and an empty Map grown to three keys; a reinserted key and a set, clear, set, set and delete sequence both leave a Map accepted at size one; that holds itself as a value so the size is one; accepts a source Map whose entries iterator was fully consumed to build an equal sized copy.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns true for a Map rebuilt from the value iterator of a Set ---
      {
        let mapProbe: util.types = new util.types();
        let src: Set<string> = new Set<string>();
        src.add('x');
        src.add('y');
        let built: Map<string, int> = new Map<string, int>();
        for (const k of src.values()) {
          built.set(k, 0);
        }
        expect(mapProbe.isMap(built)).assertTrue();
        expect(built.size).assertEqual(2);
      }

      // --- [2] Verify a Map holding the int minus one hundred and an empty Map grown to three keys are both accepted ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('neg', -100);
        expect(mapProbe.isMap(m)).assertTrue();
        expect(m.size).assertEqual(1);
        let mapProbe_2: util.types = new util.types();
        let m_2: Map<string, int> = new Map<string, int>();
        let emptyResult: boolean = mapProbe_2.isMap(m_2);
        m_2.set('a', 1);
        m_2.set('b', 2);
        m_2.set('c', 3);
        let filledResult: boolean = mapProbe_2.isMap(m_2);
        expect(emptyResult).assertTrue();
        expect(filledResult).assertTrue();
        expect(m_2.size).assertEqual(3);
      }

      // --- [3] Verify a reinserted key and a set, clear, set, set and delete sequence both leave a Map accepted at size one ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('cycle', 1);
        m.delete('cycle');
        m.set('cycle', 9);
        let ok: boolean = mapProbe.isMap(m);
        expect(ok).assertTrue();
        expect(m.size).assertEqual(1);
        expect(m.get('cycle')).assertEqual(9);
        let mapProbe_2: util.types = new util.types();
        let m_2: Map<string, int> = new Map<string, int>();
        m_2.set('a', 1);
        m_2.clear();
        m_2.set('b', 2);
        m_2.set('c', 3);
        m_2.delete('b');
        let ok_2: boolean = mapProbe_2.isMap(m_2);
        expect(ok_2).assertTrue();
        expect(m_2.size).assertEqual(1);
        expect(m_2.has('c')).assertTrue();
      }

      // --- [4] Verify isMap returns true for a Map that holds itself as a value so the size is one ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, Object> = new Map<string, Object>();
        m.set('self', m);
        let verdict: boolean = mapProbe.isMap(m);
        expect(verdict).assertTrue();
        expect(m.size).assertEqual(1);
      }

      // --- [5] Verify isMap returns true for a source Map whose entries iterator was fully consumed to build an equal sized copy ---
      {
        let mapProbe: util.types = new util.types();
        let src: Map<string, int> = new Map<string, int>();
        src.set('m', 1);
        src.set('n', 2);
        let copy: Map<string, int> = new Map<string, int>();
        for (const pair of src.entries()) {
          copy.set(pair[0], pair[1]);
        }
        let sourceVerdict: boolean = mapProbe.isMap(src);
        let copyVerdict: boolean = mapProbe.isMap(copy);
        expect(copyVerdict).assertTrue();
        expect(sourceVerdict).assertTrue();
        expect(copy.size).assertEqual(src.size);
        expect(copy.get('n')).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_0400
     * @tc.name testTypesIsMap004
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: entries iterated after the isMap check reproduce the stored key value pairs in order; accepts a Map while both its keys and values iterators are partially consumed; the IteratorResult from Map.keys().next carries the key and is a plain object no map predicate accepts; accepts a Map holding an explicit boxed zero value cast to Object; accepts a Map holding a NaN value cast to Object.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries iterated after the isMap check reproduce the stored key value pairs in order ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('p', 11);
        m.set('q', 22);
        let ok: boolean = mapProbe.isMap(m);
        let seen: string[] = [];
        for (const pair of m.entries()) {
          seen.push(pair[0] + '=' + pair[1]);
        }
        expect(ok).assertTrue();
        expect(seen[0]).assertEqual('p=11');
        expect(seen[1]).assertEqual('q=22');
      }

      // --- [2] Verify isMap returns true for a Map while both its keys and values iterators are partially consumed ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        m.set('c', 3);
        let keys: IterableIterator<string> = m.keys();
        let values: IterableIterator<int> = m.values();
        let firstKey: IteratorResult<string> = keys.next();
        let firstValue: IteratorResult<int> = values.next();
        let ok: boolean = mapProbe.isMap(m);
        expect(ok).assertTrue();
        expect(firstKey.done).assertFalse();
        expect(firstValue.done).assertFalse();
        expect(m.size).assertEqual(3);
      }

      // --- [3] Verify the IteratorResult from Map.keys().next carries the key and is a plain object no map predicate accepts ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('solo', 7);
        let walk: IterableIterator<string> = m.keys();
        let step: IteratorResult<string> = walk.next();
        expect(mapProbe.isMapIterator(walk)).assertTrue();
        expect(mapProbe.isMapIterator(step)).assertFalse();
        expect(mapProbe.isMap(step)).assertFalse();
        expect(step.done).assertFalse();
        expect(step.value).assertEqual('solo');
      }

      // --- [4] Verify isMap returns true for a Map holding an explicit boxed zero value cast to Object ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, Object> = new Map<string, Object>();
        m.set('n', 0.0 as Object);
        expect(mapProbe.isMap(m)).assertTrue();
        expect(m.size).assertEqual(1);
      }

      // --- [5] Verify isMap returns true for a Map holding a NaN value cast to Object ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, Object> = new Map<string, Object>();
        m.set('u', Double.NaN as Object);
        expect(mapProbe.isMap(m)).assertTrue();
        expect(m.size).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_0500
     * @tc.name testTypesIsMap005
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a Map holding a Date value that stays a Date and a Map refilled with one key after a clear; two distinct object keys so the size is two; accepts a Map rebuilt by iterating the key iterator of a source Map; both a NaN key and a finite numeric key so size is two; accepts a Map whose has check still finds its string key afterwards.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a Map holding a Date value that stays a Date and a Map refilled with one key after a clear are both accepted ---
      {
        let mapProbe: util.types = new util.types();
        let d: Date = new Date(0);
        let m: Map<string, Date> = new Map<string, Date>();
        m.set('d', d);
        expect(mapProbe.isMap(m)).assertTrue();
        expect(mapProbe.isDate(d)).assertTrue();
        expect(m.size).assertEqual(1);
        let mapProbe_2: util.types = new util.types();
        let m_2: Map<string, int> = new Map<string, int>();
        m_2.set('old', 1);
        m_2.clear();
        m_2.set('fresh', 8);
        let ok: boolean = mapProbe_2.isMap(m_2);
        expect(ok).assertTrue();
        expect(m_2.size).assertEqual(1);
        expect(m_2.has('fresh')).assertTrue();
      }

      // --- [2] Verify isMap returns true for a Map holding two distinct object keys so the size is two ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<Object, int> = new Map<Object, int>();
        let first: Object = new Date(0);
        let second: Object = new Map<string, int>();
        m.set(first, 1);
        m.set(second, 2);
        let ok: boolean = mapProbe.isMap(m);
        expect(ok).assertTrue();
        expect(m.size).assertEqual(2);
        expect(m.has(first)).assertTrue();
        expect(m.has(second)).assertTrue();
      }

      // --- [3] Verify isMap returns true for a Map rebuilt by iterating the key iterator of a source Map ---
      {
        let mapProbe: util.types = new util.types();
        let src: Map<string, int> = new Map<string, int>();
        src.set('a', 1);
        src.set('b', 2);
        let built: Map<string, int> = new Map<string, int>();
        for (const k of src.keys()) {
          built.set(k, 0);
        }
        expect(mapProbe.isMap(built)).assertTrue();
        expect(built.size).assertEqual(2);
      }

      // --- [4] Verify isMap returns true for a Map holding both a NaN key and a finite numeric key so size is two ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<double, int> = new Map<double, int>();
        m.set(Double.NaN, 1);
        m.set(7, 2);
        let ok: boolean = mapProbe.isMap(m);
        expect(ok).assertTrue();
        expect(m.size).assertEqual(2);
        expect(m.get(7)).assertEqual(2);
        expect(m.get(Double.NaN)).assertEqual(1);
      }

      // --- [5] Verify isMap returns true for a Map whose has check still finds its string key afterwards ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('keep', 5);
        let ok: boolean = mapProbe.isMap(m);
        expect(ok).assertTrue();
        expect(m.has('keep')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_0600
     * @tc.name testTypesIsMap006
     * @tc.desc Merged batch (3 tests): Basic construction and recognition: accepts a Map after every key is removed one by one so the size reaches zero; keys collected after the isMap check keep the non alphabetical insertion order of the Map; the keys values and entries iterators of one Map all fail isMap while that same Map passes it.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns true for a Map after every key is removed one by one so the size reaches zero ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        m.set('c', 3);
        for (const k of collectOrderedKeys(m)) {
          m.delete(k);
        }
        let ok: boolean = mapProbe.isMap(m);
        expect(ok).assertTrue();
        expect(m.size).assertEqual(0);
        expect(m.has('b')).assertFalse();
      }

      // --- [2] Verify keys collected after the isMap check keep the non alphabetical insertion order of the Map ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('gamma', 3);
        m.set('alpha', 1);
        m.set('beta', 2);
        let ok: boolean = mapProbe.isMap(m);
        let order: string[] = collectOrderedKeys(m);
        expect(ok).assertTrue();
        expect(order[0]).assertEqual('gamma');
        expect(order[1]).assertEqual('alpha');
        expect(order[2]).assertEqual('beta');
      }

      // --- [3] Verify the keys values and entries iterators of one Map all fail isMap while that same Map passes it ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        let keys: Object = m.keys();
        let values: Object = m.values();
        let entries: Object = m.entries();
        let rejected: boolean = mapProbe.isMap(keys) || mapProbe.isMap(values) || mapProbe.isMap(entries);
        expect(rejected).assertFalse();
        expect(mapProbe.isMap(m)).assertTrue();
        expect(m.size).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_0700
     * @tc.name testTypesIsMap007
     * @tc.desc Merged batch (3 tests): Type conversion and subclassing: checks widening and subclass handling, covering conversion and subclass paths.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns true for a Map keyed by a class instance and valued by an Error subclass with both lookups succeeding ---
      {
        let mapProbe: util.types = new util.types();
        let key: KeyTag = new KeyTag();
        let err: MarkerError = new MarkerError('boom');
        let m: Map<KeyTag, MarkerError> = new Map<KeyTag, MarkerError>();
        m.set(key, err);
        expect(mapProbe.isMap(m)).assertTrue();
        expect(m.has(key)).assertTrue();
        let got: MarkerError | undefined = m.get(key);
        let same: boolean = got === err;
        expect(same).assertTrue();
      }

      // --- [2] Verify isMap for a Map agrees with the instanceof Map check on the same Object typed value ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        let boxed: Object = m;
        let fromApi: boolean = mapProbe.isMap(boxed);
        let fromOperator: boolean = boxed instanceof Map;
        expect(fromApi).assertTrue();
        expect(fromOperator).assertTrue();
      }

      // --- [3] Verify isMap returns true for a Map keyed by an Error subclass while isNativeError accepts that key ---
      {
        let mapProbe: util.types = new util.types();
        let key: MarkerError = new MarkerError('keyed');
        let m: Map<MarkerError, int> = new Map<MarkerError, int>();
        m.set(key, 1);
        let ok: boolean = mapProbe.isMap(m);
        expect(ok).assertTrue();
        expect(m.has(key)).assertTrue();
        expect(mapProbe.isNativeError(key)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_0800
     * @tc.name testTypesIsMap008
     * @tc.desc Merged batch (5 tests): Boundary values: accepts a Map where negative zero and positive zero collapsed into one entry through SameValueZero so the size is one; a Map is accepted before and after clear empties four keys and a positive zero key overwrites a negative zero key; rejects the empty string whose length is zero; isMap rejects the doubles 3.14, NaN, positive infinity and negative zero in a single pass; accepts a Map keyed by Number.MAX_VALUE the largest finite double.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns true for a Map where negative zero and positive zero collapsed into one entry through SameValueZero so the size is one ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<double, int> = new Map<double, int>();
        m.set(-0.0, 1);
        m.set(0.0, 2);
        let r: boolean = mapProbe.isMap(m);
        expect(r).assertTrue();
        expect(m.size).assertEqual(1);
      }

      // --- [2] Verify a Map is accepted before and after clear empties four keys and a positive zero key overwrites a negative zero key ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        m.set('c', 3);
        m.set('d', 4);
        expect(mapProbe.isMap(m)).assertTrue();
        m.clear();
        expect(mapProbe.isMap(m)).assertTrue();
        let remaining: int = 0;
        for (const k of m.keys()) {
          remaining++;
        }
        expect(m.size).assertEqual(0);
        expect(remaining).assertEqual(0);
        let mapProbe_2: util.types = new util.types();
        let m_2: Map<double, string> = new Map<double, string>();
        m_2.set(-0, 'negative zero');
        m_2.set(0, 'positive zero');
        let ok: boolean = mapProbe_2.isMap(m_2);
        expect(ok).assertTrue();
        expect(m_2.size).assertEqual(1);
        expect(m_2.get(0)).assertEqual('positive zero');
      }

      // --- [3] Verify isMap returns false for the empty string whose length is zero ---
      {
        let mapProbe: util.types = new util.types();
        let value: string = '';
        let r: boolean = mapProbe.isMap(value);
        expect(r).assertFalse();
      }

      // --- [4] Verify isMap rejects the doubles 3.14, NaN, positive infinity and negative zero in a single pass ---
      {
        let mapChecker: util.types = new util.types();
        let values: double[] = [3.14, Double.NaN, Double.POSITIVE_INFINITY, -0.0];
        let hits: int = 0;
        for (const value of values) {
          if (mapChecker.isMap(value)) {
            hits = hits + 1;
          }
        }
        expect(values[3]).assertEqual(0);
        expect(hits).assertEqual(0);
      }

      // --- [5] Verify isMap returns true for a Map keyed by Number.MAX_VALUE the largest finite double ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<double, int> = new Map<double, int>();
        m.set(Number.MAX_VALUE, 1);
        expect(mapProbe.isMap(m)).assertTrue();
        expect(m.size).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_0900
     * @tc.name testTypesIsMap009
     * @tc.desc Merged batch (3 tests): Boundary values: accepts a Map keyed by Number.MIN_VALUE the smallest positive double; the int minimum value -2147483648; rejects an int array whose length and first element are unchanged.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns true for a Map keyed by Number.MIN_VALUE the smallest positive double ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<double, int> = new Map<double, int>();
        let key: double = Number.MIN_VALUE;
        m.set(key, 1);
        expect(mapProbe.isMap(m)).assertTrue();
        expect(m.size).assertEqual(1);
      }

      // --- [2] Verify isMap returns true for a Map keyed by the int minimum value -2147483648 ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<int, int> = new Map<int, int>();
        m.set(-2147483648, 1);
        expect(m.has(-2147483648)).assertTrue();
        expect(mapProbe.isMap(m)).assertTrue();
      }

      // --- [3] Verify isMap returns false for an int array whose length and first element are unchanged ---
      {
        let mapProbe: util.types = new util.types();
        let arr: int[] = [1, 2, 3];
        let r: boolean = mapProbe.isMap(arr);
        expect(r).assertFalse();
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_1000
     * @tc.name testTypesIsMap010
     * @tc.desc Merged batch (5 tests): Primitive value rejection: the isMap result concatenated into a string reads flag true for a Map and flag false for a Set; rejects a string whose text is the word Map because a string is not a Map instance; rejects the int 42 and negative infinity; rejects both boolean primitives true and false; rejects the int maximum held in an Object typed variable.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the isMap result concatenated into a string reads flag true for a Map and flag false for a Set ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        let s: Set<string> = new Set<string>();
        let mapText: string = 'flag:' + mapProbe.isMap(m);
        let setText: string = 'flag:' + mapProbe.isMap(s);
        expect(mapText).assertEqual('flag:true');
        expect(setText).assertEqual('flag:false');
      }

      // --- [2] Verify isMap returns false for a string whose text is the word Map because a string is not a Map instance ---
      {
        let mapProbe: util.types = new util.types();
        let value: string = 'Map';
        expect(mapProbe.isMap(value)).assertFalse();
      }

      // --- [3] Verify isMap returns false for the int 42 and negative infinity ---
      {
        let mapChecker: util.types = new util.types();
        let value: int = 42;
        let r: boolean = mapChecker.isMap(value);
        expect(r).assertFalse();
        let mapChecker_2: util.types = new util.types();
        let value_2: double = Double.NEGATIVE_INFINITY;
        let flags: boolean[] = [mapChecker_2.isMap(value_2)];
        expect(flags[0]).assertFalse();
      }

      // --- [4] Verify isMap returns false for both boolean primitives true and false ---
      {
        let mapChecker: util.types = new util.types();
        let values: boolean[] = [true, false];
        let accepted: int = 0;
        for (let i: int = 0; i < values.length; i++) {
          if (mapChecker.isMap(values[i])) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(0);
      }

      // --- [5] Verify isMap returns false for the int maximum held in an Object typed variable ---
      {
        let mapChecker: util.types = new util.types();
        let raw: int = 2147483647;
        let boxed: Object = raw;
        expect(mapChecker.isMap(boxed)).assertFalse();
        expect(mapChecker.isMap(raw)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_1100
     * @tc.name testTypesIsMap011
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the int minimum held in an Object typed variable; Map.delete reports a true then a false removal; rejects a Set holding three string members and one double member and one Date member; rejects a Set filled with one thousand int members; rejects an empty int array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns false for the int minimum held in an Object typed variable ---
      {
        let mapChecker: util.types = new util.types();
        let raw: int = -2147483648;
        let boxed: Object = raw;
        let verdict: boolean = mapChecker.isMap(boxed);
        expect(verdict).assertFalse();
        expect(raw).assertLess(0);
      }

      // --- [2] Verify Map.delete reports a true then a false removal while the boolean result is not a map and the entry is gone ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('gone', 1);
        let removed: boolean = m.delete('gone');
        let again: boolean = m.delete('gone');
        expect(removed).assertTrue();
        expect(again).assertFalse();
        expect(mapProbe.isMap(removed)).assertFalse();
        expect(m.size).assertEqual(0);
      }

      // --- [3] Verify isMap returns false for a Set holding three string members and one double member and one Date member ---
      {
        let mapProbe: util.types = new util.types();
        let s: Set<string> = new Set<string>();
        s.add('a');
        s.add('b');
        s.add('c');
        let r: boolean = mapProbe.isMap(s);
        expect(r).assertFalse();
        expect(s.size).assertEqual(3);
        let mapProbe_2: util.types = new util.types();
        let s_2: Set<Object> = new Set<Object>();
        s_2.add(3.14);
        s_2.add(new Date(0));
        let r_2: boolean = mapProbe_2.isMap(s_2);
        expect(r_2).assertFalse();
        expect(s_2.size).assertEqual(2);
      }

      // --- [4] Verify isMap returns false for a Set filled with one thousand int members ---
      {
        let mapProbe: util.types = new util.types();
        let s: Set<int> = new Set<int>();
        for (let i: int = 0; i < 1000; i++) {
          s.add(i);
        }
        let r: boolean = mapProbe.isMap(s);
        expect(r).assertFalse();
        expect(s.size).assertEqual(1000);
      }

      // --- [5] Verify isMap returns false for an empty int array ---
      {
        let mapProbe: util.types = new util.types();
        let arr: int[] = [];
        let r: boolean = mapProbe.isMap(arr);
        expect(r).assertFalse();
        expect(arr.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_1200
     * @tc.name testTypesIsMap012
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects an Array of strings; rejects a Date argument while the string form of that Date is still non-empty; a Map keyed by a Number wrapper stays a Map while the wrapper itself is not one; two isMap results pushed into a boolean array keep the true then false order; rejects a plain object whose int field keeps the value written before the check.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns false for an Array of strings ---
      {
        let mapProbe: util.types = new util.types();
        let arr: Array<string> = ['a', 'b'];
        let r: boolean = mapProbe.isMap(arr);
        expect(r).assertFalse();
        expect(arr.length).assertEqual(2);
      }

      // --- [2] Verify isMap returns false for a Date argument while the string form of that Date is still non-empty ---
      {
        let mapProbe: util.types = new util.types();
        let d: Date = new Date(0);
        let r: boolean = mapProbe.isMap(d);
        expect(r).assertFalse();
        expect(d.toISOString()).assertEqual('1970-01-01T00:00:00.000Z');
      }

      // --- [3] Verify a Map keyed by a Number wrapper stays a Map while the wrapper itself is not one ---
      {
        let mapProbe: util.types = new util.types();
        let numericKey: Number = new Number(5);
        let textValue: String = new String('box');
        let ledger: Map<Object, Object> = new Map<Object, Object>();
        ledger.set(numericKey, textValue);
        expect(mapProbe.isMap(ledger)).assertTrue();
        expect(ledger.get(numericKey)).assertEqual(textValue);
        expect(mapProbe.isMap(numericKey)).assertFalse();
        expect(mapProbe.isMap(textValue)).assertFalse();
        expect(mapProbe.isMap(new Boolean(true))).assertFalse();
      }

      // --- [4] Verify two isMap results pushed into a boolean array keep the true then false order ---
      {
        let mapProbe: util.types = new util.types();
        let results: boolean[] = [];
        results.push(mapProbe.isMap(new Map<string, int>()));
        results.push(mapProbe.isMap(new Set<string>()));
        expect(results.length).assertEqual(2);
        expect(results[0]).assertTrue();
        expect(results[1]).assertFalse();
      }

      // --- [5] Verify isMap returns false for a plain object whose int field keeps the value written before the check ---
      {
        let mapProbe: util.types = new util.types();
        let box: PlainBox = new PlainBox();
        box.count = 7;
        let r: boolean = mapProbe.isMap(box);
        expect(r).assertFalse();
        expect(box.count).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_1300
     * @tc.name testTypesIsMap013
     * @tc.desc Merged batch (1 test): Primitive value rejection: rejects an Error argument while its message text is unchanged.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns false for an Error argument while its message text is unchanged ---
      {
        let mapProbe: util.types = new util.types();
        let e: Error = new Error('boom');
        let r: boolean = mapProbe.isMap(e);
        expect(r).assertFalse();
        expect(e.message).assertEqual('boom');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_1400
     * @tc.name testTypesIsMap014
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects the arithmetic result of six multiplied by seven; rejects a WeakMap holding one class instance key; rejects an empty Set and WeakSet; rejects a WeakSet holding one class instance member; rejects a plain class instance that only carries data fields and an object literal reached through an Object typed variable.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns false for the arithmetic result of six multiplied by seven ---
      {
        let mapProbe: util.types = new util.types();
        let value: int = 6 * 7;
        let r: boolean = mapProbe.isMap(value);
        expect(r).assertFalse();
        expect(value).assertEqual(42);
      }

      // --- [2] Verify isMap returns false for a WeakMap holding one class instance key ---
      {
        let mapProbe: util.types = new util.types();
        let key: KeyTag = new KeyTag();
        let wm: WeakMap<KeyTag, KeyTag> = new WeakMap<KeyTag, KeyTag>();
        wm.set(key, key);
        let r: boolean = mapProbe.isMap(wm);
        expect(r).assertFalse();
        expect(wm.has(key)).assertTrue();
      }

      // --- [3] Verify isMap returns false for an empty Set and WeakSet ---
      {
        let mapProbe: util.types = new util.types();
        let s: Set<string> = new Set<string>();
        let r: boolean = mapProbe.isMap(s);
        expect(r).assertFalse();
        expect(s.size).assertEqual(0);
        let mapChecker: util.types = new util.types();
        let ws: WeakSet<KeyTag> = new WeakSet<KeyTag>();
        let r_2: boolean = mapChecker.isMap(ws);
        expect(r_2).assertFalse();
        let w: boolean = mapChecker.isWeakSet(ws);
        expect(w).assertTrue();
      }

      // --- [4] Verify isMap returns false for a WeakSet holding one class instance member ---
      {
        let mapProbe: util.types = new util.types();
        let item: KeyTag = new KeyTag();
        let ws: WeakSet<KeyTag> = new WeakSet<KeyTag>();
        ws.add(item);
        let r: boolean = mapProbe.isMap(ws);
        expect(r).assertFalse();
        expect(ws.has(item)).assertTrue();
      }

      // --- [5] Verify isMap returns false for a plain class instance that only carries data fields and an object literal reached through an Object typed variable ---
      {
        let mapProbe: util.types = new util.types();
        let box: PlainBox = new PlainBox();
        let r: boolean = mapProbe.isMap(box);
        expect(r).assertFalse();
        expect(box.name).assertEqual('plain');
        let mapChecker: util.types = new util.types();
        let pair: NamedPair = { name: 'boxed', size: 1 };
        let boxed: Object = pair;
        expect(mapChecker.isMap(boxed)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_1500
     * @tc.name testTypesIsMap015
     * @tc.desc Merged batch (5 tests): Non-target object rejection: an error reports its own name, Error for the base kind and TypeError for the subclass; the RangeError raised by an Int8Array window running past its buffer is rejected by isMap and named RangeError; rejects an ArrayBuffer; rejects a DataView over a four byte buffer; rejects every one of eleven distinct TypedArray kinds checked in a single loop.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an error reports its own name, Error for the base kind and TypeError for the subclass, while isMap rejects the subclass ---
      {
        let mapProbe: util.types = new util.types();
        let base: Error = new Error('boom');
        let typed: Error = new TypeError('bad type');
        expect(base.name).assertEqual('Error');
        expect(typed.name).assertEqual('TypeError');
        expect(mapProbe.isMap(typed)).assertFalse();
      }

      // --- [2] Verify the RangeError raised by an Int8Array window running past its buffer is rejected by isMap and named RangeError ---
      {
        let mapProbe: util.types = new util.types();
        try {
          new Int8Array(new ArrayBuffer(4), 2, 4);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
          expect(mapProbe.isMap(err)).assertFalse();
        }
      }

      // --- [3] Verify isMap returns false for an ArrayBuffer ---
      {
        let mapProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let r: boolean = mapProbe.isMap(buf);
        expect(r).assertFalse();
        expect(buf.byteLength).assertEqual(8);
      }

      // --- [4] Verify isMap returns false for a DataView over a four byte buffer ---
      {
        let mapProbe: util.types = new util.types();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let r: boolean = mapProbe.isMap(dv);
        expect(r).assertFalse();
        expect(dv.byteLength).assertEqual(4);
      }

      // --- [5] Verify isMap returns false for every one of eleven distinct TypedArray kinds checked in a single loop ---
      {
        let mapProbe: util.types = new util.types();
        let views: Object[] = [];
        views.push(new Int8Array(1));
        views.push(new Uint8Array(1));
        views.push(new Uint8ClampedArray(1));
        views.push(new Int16Array(1));
        views.push(new Uint16Array(1));
        views.push(new Int32Array(1));
        views.push(new Uint32Array(1));
        views.push(new Float32Array(1));
        views.push(new Float64Array(1));
        views.push(new BigInt64Array(1));
        views.push(new BigUint64Array(1));
        let allFalse: boolean = true;
        for (let i: int = 0; i < views.length; i++) {
          if (mapProbe.isMap(views[i])) {
            allFalse = false;
          }
        }
        expect(allFalse).assertTrue();
        expect(views.length).assertEqual(11);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_1600
     * @tc.name testTypesIsMap016
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects an already resolved Promise and arrow function value; rejects a function pulled out of an Object array; rejects the iterator produced by Map.keys and Map.values; rejects the iterator produced by Set.keys; rejects a plain value read out of a Map entry.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns false for an already resolved Promise and arrow function value ---
      {
        let mapChecker: util.types = new util.types();
        let p: Promise<int> = Promise.resolve<int>(1);
        let r: boolean = mapChecker.isMap(p);
        expect(r).assertFalse();
        let mapChecker_2: util.types = new util.types();
        let fn: Function = (): void => {
        };
        let r_2: boolean = mapChecker_2.isMap(fn);
        expect(r_2).assertFalse();
      }

      // --- [2] Verify isMap returns false for a function pulled out of an Object array ---
      {
        let mapProbe: util.types = new util.types();
        let holder: Object[] = [];
        holder.push(plainFn);
        let r: boolean = mapProbe.isMap(holder[0]);
        expect(r).assertFalse();
        expect(holder.length).assertEqual(1);
      }

      // --- [3] Verify isMap returns false for the iterator produced by Map.keys and Map.values ---
      {
        let mapChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('k', 1);
        let iter: IterableIterator<string> = m.keys();
        expect(mapChecker.isMap(iter as Object)).assertFalse();
        expect(mapChecker.isMap(m)).assertTrue();
        let mapChecker_2: util.types = new util.types();
        let m_2: Map<string, int> = new Map<string, int>();
        m_2.set('k', 1);
        let iter_2: IterableIterator<int> = m_2.values();
        expect(mapChecker_2.isMap(iter_2 as Object)).assertFalse();
        expect(mapChecker_2.isMap(m_2)).assertTrue();
      }

      // --- [4] Verify isMap returns false for the iterator produced by Set.keys ---
      {
        let mapChecker: util.types = new util.types();
        let s: Set<string> = new Set<string>();
        s.add('k');
        let iter: IterableIterator<string> = s.keys();
        expect(mapChecker.isMap(iter as Object)).assertFalse();
        expect(mapChecker.isMap(s)).assertFalse();
      }

      // --- [5] Verify isMap returns false for a plain value read out of a Map entry ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, Object> = new Map<string, Object>();
        m.set('p', new PlainBox());
        let got: Object | undefined = m.get('p');
        expect(mapProbe.isMap(got as Object)).assertFalse();
        expect(m.size).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_1700
     * @tc.name testTypesIsMap017
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a util.types instance itself; Uint8Array whose write is visible through a second view over the same buffer; a Set fails before and after its only member is dropped and a RegExp fails; DataView with byteOffset four whose byteLength stays four; rejects both an Int32Array and a Float32Array sharing one ArrayBuffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns false for a util.types instance itself ---
      {
        let mapChecker: util.types = new util.types();
        let checker: util.types = new util.types();
        expect(mapChecker.isMap(checker)).assertFalse();
      }

      // --- [2] Verify isMap returns false for a Uint8Array whose write is visible through a second view over the same buffer ---
      {
        let mapProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let writer: Uint8Array = new Uint8Array(buf);
        let reader: Uint8Array = new Uint8Array(buf);
        writer.$_set(0, 9);
        let r: boolean = mapProbe.isMap(writer);
        expect(r).assertFalse();
        expect(reader.$_get(0)).assertEqual(9);
      }

      // --- [3] Verify a Set fails before and after its only member is dropped and a RegExp fails while its test method still matches ---
      {
        let mapProbe: util.types = new util.types();
        let s: Set<string> = new Set<string>();
        s.add('a');
        expect(mapProbe.isMap(s)).assertFalse();
        s.delete('a');
        expect(mapProbe.isMap(s)).assertFalse();
        expect(s.size).assertEqual(0);
        let mapProbe_2: util.types = new util.types();
        let re: RegExp = new RegExp('probe');
        let r: boolean = mapProbe_2.isMap(re);
        expect(r).assertFalse();
        expect(re.test('probe-text')).assertTrue();
      }

      // --- [4] Verify isMap returns false for a DataView with byteOffset four whose byteLength stays four ---
      {
        let mapProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let dv: DataView = new DataView(buf, 4, 4);
        let r: boolean = mapProbe.isMap(dv);
        expect(r).assertFalse();
        expect(dv.byteOffset).assertEqual(4);
        expect(dv.byteLength).assertEqual(4);
      }

      // --- [5] Verify isMap returns false for both an Int32Array and a Float32Array sharing one ArrayBuffer ---
      {
        let mapProbe: util.types = new util.types();
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let int32View: Int32Array = new Int32Array(buf);
        let float32View: Float32Array = new Float32Array(buf);
        let first: boolean = mapProbe.isMap(int32View);
        let second: boolean = mapProbe.isMap(float32View);
        expect(first).assertFalse();
        expect(second).assertFalse();
        expect(int32View.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_1800
     * @tc.name testTypesIsMap018
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a Set while the Set keeps its size has and growth behaviour; Uint8Array whose byteLength and first byte are unchanged and subarray whose byteOffset and length are unchanged; Map keys iterator that has already consumed exactly one key while the Map keeps its keys; Map values iterator driven to completion while the Map size stays unchanged; a class method that stores the isMap result in a field leaves the field true for a Map and false for a Set.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns false for a Set while the Set keeps its size has and growth behaviour ---
      {
        let mapProbe: util.types = new util.types();
        let s: Set<string> = new Set<string>();
        s.add('a');
        let r: boolean = mapProbe.isMap(s);
        expect(r).assertFalse();
        expect(s.size).assertEqual(1);
        expect(s.has('a')).assertTrue();
        s.add('b');
        expect(s.size).assertEqual(2);
      }

      // --- [2] Verify isMap returns false for a Uint8Array whose byteLength and first byte are unchanged and subarray whose byteOffset and length are unchanged ---
      {
        let mapProbe: util.types = new util.types();
        let uint8View: Uint8Array = new Uint8Array(4);
        uint8View.$_set(0, 7);
        let r: boolean = mapProbe.isMap(uint8View);
        expect(r).assertFalse();
        expect(uint8View.byteLength).assertEqual(4);
        expect(uint8View.$_get(0)).assertEqual(7);
        let mapProbe_2: util.types = new util.types();
        let base: Uint8Array = new Uint8Array(8);
        let sub: Uint8Array = base.subarray(2, 6);
        let r_2: boolean = mapProbe_2.isMap(sub);
        expect(r_2).assertFalse();
        expect(sub.byteOffset).assertEqual(2);
        expect(sub.length).assertEqual(4);
      }

      // --- [3] Verify isMap returns false for a Map keys iterator that has already consumed exactly one key while the Map keeps its keys ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        let cursor: IterableIterator<string> = m.keys();
        let step: IteratorResult<string> = cursor.next();
        let consumed: boolean = !step.done;
        expect(consumed).assertTrue();
        expect(mapProbe.isMap(cursor as Object)).assertFalse();
        expect(mapProbe.isMap(m)).assertTrue();
        expect(m.size).assertEqual(2);
      }

      // --- [4] Verify isMap returns false for a Map values iterator driven to completion while the Map size stays unchanged ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        m.set('b', 2);
        m.set('c', 3);
        let cursor: IterableIterator<int> = m.values();
        let drained: int = 0;
        let step: IteratorResult<int> = cursor.next();
        while (!step.done) {
          drained++;
          step = cursor.next();
        }
        expect(drained).assertEqual(3);
        expect(mapProbe.isMap(cursor as Object)).assertFalse();
        expect(mapProbe.isMap(m)).assertTrue();
        expect(m.size).assertEqual(3);
      }

      // --- [5] Verify a class method that stores the isMap result in a field leaves the field true for a Map and false for a Set ---
      {
        let mapProbe: util.types = new util.types();
        let slot: ResultSlot = new ResultSlot();
        let m: Map<string, int> = new Map<string, int>();
        m.set('k', 1);
        slot.capture(m);
        let afterMap: boolean = slot.holding;
        slot.capture(new Set<string>());
        let afterSet: boolean = slot.holding;
        expect(afterMap).assertTrue();
        expect(afterSet).assertFalse();
        expect(mapProbe.isMap(m)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_1900
     * @tc.name testTypesIsMap019
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects an object literal typed by a module level interface; rejects a reference to a module level named function and async function; isWeakMap and isPromise both return false for a Map whose value is a resolved Promise; negating the isMap result for a Map yields false while negating it for a Set yields true; the conjunction of an isMap result for a Map and an isMap result for a Set is false.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isMap returns false for an object literal typed by a module level interface ---
      {
        let mapProbe: util.types = new util.types();
        let pair: NamedPair = { name: 'pair', size: 2 };
        let r: boolean = mapProbe.isMap(pair);
        expect(r).assertFalse();
        expect(pair.size).assertEqual(2);
      }

      // --- [2] Verify isMap returns false for a reference to a module level named function and async function ---
      {
        let mapChecker: util.types = new util.types();
        let r: boolean = mapChecker.isMap(plainFn);
        expect(r).assertFalse();
        let mapChecker_2: util.types = new util.types();
        let hits: int = 0;
        if (mapChecker_2.isMap(declaredAsyncWork)) {
          hits += 1;
        }
        expect(hits).assertEqual(0);
      }

      // --- [3] Verify isWeakMap and isPromise both return false for a Map whose value is a resolved Promise ---
      {
        let mapChecker: util.types = new util.types();
        let m: Map<string, Object> = new Map<string, Object>();
        m.set('p', Promise.resolve<int>(1));
        expect(mapChecker.isWeakMap(m)).assertFalse();
        expect(mapChecker.isPromise(m)).assertFalse();
        expect(mapChecker.isMap(m)).assertTrue();
      }

      // --- [4] Verify negating the isMap result for a Map yields false while negating it for a Set yields true ---
      {
        let mapProbe: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        let s: Set<string> = new Set<string>();
        let notMap: boolean = !mapProbe.isMap(m);
        let notSet: boolean = !mapProbe.isMap(s);
        expect(notMap).assertFalse();
        expect(notSet).assertTrue();
      }

      // --- [5] Verify the conjunction of an isMap result for a Map and an isMap result for a Set is false ---
      {
        let mapChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        let s: Set<string> = new Set<string>();
        let both: boolean = mapChecker.isMap(m) && mapChecker.isMap(s);
        expect(both).assertFalse();
        expect(mapChecker.isMap(m)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_MAP_2000
     * @tc.name testTypesIsMap020
     * @tc.desc Merged batch (2 tests): Non-target object rejection: an if statement driven by isMap on a Set takes the else branch and records not a map; isMap rejects a Set values iterator while the iterator is identified as a SetIterator and not as a Set.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsMap020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an if statement driven by isMap on a Set takes the else branch and records not a map ---
      {
        let mapProbe: util.types = new util.types();
        let s: Set<string> = new Set<string>();
        let label: string = 'unset';
        if (mapProbe.isMap(s)) {
          label = 'is-map';
        } else {
          label = 'not-map';
        }
        expect(label).assertEqual('not-map');
      }

      // --- [2] Verify isMap rejects a Set values iterator while the iterator is identified as a SetIterator and not as a Set ---
      {
        let mapProbe: util.types = new util.types();
        let names: Set<string> = new Set<string>();
        names.add('north');
        names.add('south');
        let cursor: IterableIterator<string> = names.values();
        let ledger: Map<string, int> = new Map<string, int>();
        let slot: int = 0;
        for (const name of cursor) {
          ledger.set(name, slot);
          slot++;
        }
        expect(mapProbe.isMap(ledger)).assertTrue();
        expect(ledger.size).assertEqual(2);
        expect(mapProbe.isMap(cursor)).assertFalse();
        expect(mapProbe.isSetIterator(cursor)).assertTrue();
        expect(mapProbe.isSet(cursor)).assertFalse();
        expect(names.size).assertEqual(2);
      }
    });

  });
}
