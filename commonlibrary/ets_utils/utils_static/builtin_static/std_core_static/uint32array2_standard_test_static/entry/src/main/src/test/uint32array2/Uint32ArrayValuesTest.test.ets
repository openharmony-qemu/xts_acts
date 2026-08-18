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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayValuesTest(): void {
  describe('Uint32ArrayValuesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_0100
     * @tc.name testUint32ArrayValues001
     * @tc.desc Verify values() arity 0 - null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      expect(arr.values().next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_0200
     * @tc.name testUint32ArrayValues002
     * @tc.desc Verify values() - next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const r = arr.values().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_0300
     * @tc.name testUint32ArrayValues003
     * @tc.desc Verify values() returns a fresh iterator on each call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const it1 = arr.values();
      const it2 = arr.values();
      const sameRef = it2 === it1;
      expect(sameRef).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_0400
     * @tc.name testUint32ArrayValues004
     * @tc.desc Verify values() second next() yields arr[1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const it = arr.values();
      it.next();
      const r2 = it.next();
      expect(r2.value).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_0500
     * @tc.name testUint32ArrayValues005
     * @tc.desc Verify values() last next() yields arr[length-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40);
      const it = arr.values();
      it.next();
      it.next();
      it.next();
      const rLast = it.next();
      expect(rLast.value).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_0600
     * @tc.name testUint32ArrayValues006
     * @tc.desc Verify values() iterates all elements via for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const collected: number[] = [];
      for (const v of arr.values()) {
        collected.push(v);
      }
      expect(collected.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_0700
     * @tc.name testUint32ArrayValues007
     * @tc.desc Verify values() single-element next() returns done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(99);
      const r = arr.values().next();
      expect(r.value).assertEqual(99);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_0800
     * @tc.name testUint32ArrayValues008
     * @tc.desc Verify values() next() values equal $_get(i) at each index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      const it = arr.values();
      const r0 = it.next();
      const r1 = it.next();
      const r2 = it.next();
      expect(r0.value).assertEqual(arr.$_get(0));
      expect(r1.value).assertEqual(arr.$_get(1));
      expect(r2.value).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_0900
     * @tc.name testUint32ArrayValues009
     * @tc.desc Verify values() independent iterators yield the same first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const it1 = arr.values();
      const it2 = arr.values();
      expect(it1.next().value).assertEqual(it2.next().value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_1000
     * @tc.name testUint32ArrayValues010
     * @tc.desc Verify values() next() value matches at(index) at same position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 6, 7);
      const it = arr.values();
      it.next();
      const r = it.next();
      expect(r.value).assertEqual(arr.at(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_1100
     * @tc.name testUint32ArrayValues011
     * @tc.desc Verify values() on empty array yields no elements in for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      let count = 0;
      for (const v of arr.values()) {
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_1200
     * @tc.name testUint32ArrayValues012
     * @tc.desc Verify values() on empty array returns done=true from first next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_1300
     * @tc.name testUint32ArrayValues013
     * @tc.desc Verify values() on empty array and empty slice both return done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(0);
      const src = Uint32Array.of(1, 2, 3);
      const b = src.slice(1, 1);
      expect(a.values().next().done).assertTrue();
      expect(b.values().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_1400
     * @tc.name testUint32ArrayValues014
     * @tc.desc Verify values() on empty array returns undefined for value after exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      const it = arr.values();
      it.next();
      const r2 = it.next();
      expect(r2.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_1500
     * @tc.name testUint32ArrayValues015
     * @tc.desc Verify break exits values() for...of after first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const collected: number[] = [];
      for (const v of arr.values()) {
        collected.push(v);
        break;
      }
      expect(collected.length).assertEqual(1);
      expect(collected[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_1600
     * @tc.name testUint32ArrayValues016
     * @tc.desc Verify break exits values() iteration before the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 3, 40, 50);
      const collected: number[] = [];
      for (const v of arr.values()) {
        collected.push(v);
        if (v === 3) {
          break;
        }
      }
      expect(collected.length).assertEqual(3);
      expect(collected[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_1700
     * @tc.name testUint32ArrayValues017
     * @tc.desc Verify break leaves iterator active with done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const it = arr.values();
      for (const v of it) {
        break;
      }
      const r = it.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_1800
     * @tc.name testUint32ArrayValues018
     * @tc.desc Verify break in values() for...of leaves a fresh values() unaffected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const it = arr.values();
      for (const v of it) {
        break;
      }
      const r = arr.values().next();
      expect(r.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_1900
     * @tc.name testUint32ArrayValues019
     * @tc.desc Verify break after collecting three elements stops values() iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      const collected: number[] = [];
      for (const v of arr.values()) {
        collected.push(v);
        if (collected.length === 3) {
          break;
        }
      }
      expect(collected.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_2000
     * @tc.name testUint32ArrayValues020
     * @tc.desc Verify continue skips matching elements during values() iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const collected: number[] = [];
      for (const v of arr.values()) {
        if (v === 2) {
          continue;
        }
        collected.push(v);
      }
      expect(collected.join(',')).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_2100
     * @tc.name testUint32ArrayValues021
     * @tc.desc Verify break exits the inner values() loop but continues outer iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer = Uint32Array.of(1, 2);
      const inner = Uint32Array.of(10, 20, 30);
      let sum: number = 0;
      for (const o of outer.values()) {
        for (const i of inner.values()) {
          if (i === 20) {
            break;
          }
          sum = sum + i;
        }
      }
      expect(sum).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_2200
     * @tc.name testUint32ArrayValues022
     * @tc.desc Verify break on v>20 stops values() iteration at the threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 15, 25, 35);
      const collected: number[] = [];
      for (const v of arr.values()) {
        if (v > 20) {
          break;
        }
        collected.push(v);
      }
      expect(collected.join(',')).assertEqual('5,15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_2300
     * @tc.name testUint32ArrayValues023
     * @tc.desc Verify next() done=false value=arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      const r = arr.values().next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_2400
     * @tc.name testUint32ArrayValues024
     * @tc.desc Verify next() done=false value=last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const it = arr.values();
      it.next();
      it.next();
      const rLast = it.next();
      expect(rLast.done).assertFalse();
      expect(rLast.value).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_2500
     * @tc.name testUint32ArrayValues025
     * @tc.desc Verify next() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      const it = arr.values();
      it.next();
      it.next();
      const r = it.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_2600
     * @tc.name testUint32ArrayValues026
     * @tc.desc Verify values() next() reports done=true after iterator is exhausted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      const it = arr.values();
      it.next();
      it.next();
      it.next();
      it.next();
      it.next();
      const r = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_2700
     * @tc.name testUint32ArrayValues027
     * @tc.desc Verify values() next() calls equal length+1 before reporting done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8);
      const it = arr.values();
      let calls = 0;
      let r = it.next();
      calls = calls + 1;
      while (!r.done) {
        r = it.next();
        calls = calls + 1;
      }
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_2800
     * @tc.name testUint32ArrayValues028
     * @tc.desc Verify values() next() yields exactly length values before done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4, 5, 6, 7);
      const it = arr.values();
      let valueCount = 0;
      let r = it.next();
      while (!r.done) {
        valueCount = valueCount + 1;
        r = it.next();
      }
      expect(valueCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_2900
     * @tc.name testUint32ArrayValues029
     * @tc.desc Verify values() yields uint32 minimum value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.values().next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_3000
     * @tc.name testUint32ArrayValues030
     * @tc.desc Verify values() yields uint32 maximum value 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295);
      expect(arr.values().next().value).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_3100
     * @tc.name testUint32ArrayValues031
     * @tc.desc Verify values() yields int32 maximum value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483647);
      expect(arr.values().next().value).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_3200
     * @tc.name testUint32ArrayValues032
     * @tc.desc Verify values() yields 4294967295 after $_set(0,-1) two's-complement wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, -1);
      expect(arr.values().next().value).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_3300
     * @tc.name testUint32ArrayValues033
     * @tc.desc Verify values() yields 0 after $_set(0,4294967296) modulo 2^32 wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, 4294967296);
      expect(arr.values().next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_3400
     * @tc.name testUint32ArrayValues034
     * @tc.desc Verify values() yields 0 after $_set(0,NaN) coercion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, Number.NaN);
      expect(arr.values().next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_3500
     * @tc.name testUint32ArrayValues035
     * @tc.desc Verify values() yields 3 after $_set(0,3.14) truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, 3.14);
      expect(arr.values().next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_3600
     * @tc.name testUint32ArrayValues036
     * @tc.desc Verify values() yields 15 for octal literal 0o17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0o17);
      expect(arr.values().next().value).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_3700
     * @tc.name testUint32ArrayValues037
     * @tc.desc Verify values() yields 10 for binary literal 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0b1010);
      expect(arr.values().next().value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_3800
     * @tc.name testUint32ArrayValues038
     * @tc.desc Verify values() yields 2000 for scientific literal 2e3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2e3);
      expect(arr.values().next().value).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_3900
     * @tc.name testUint32ArrayValues039
     * @tc.desc Verify values() yields duplicate elements 42,42,42 in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42, 42, 42);
      const it = arr.values();
      expect(it.next().value).assertEqual(42);
      expect(it.next().value).assertEqual(42);
      expect(it.next().value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_4000
     * @tc.name testUint32ArrayValues040
     * @tc.desc Verify values() spans full uint32 range from 0 to MAX in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 4294967295);
      const collected: number[] = [];
      for (const v of arr.values()) {
        collected.push(v);
      }
      expect(collected.join(',')).assertEqual('0,1,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_4100
     * @tc.name testUint32ArrayValues041
     * @tc.desc Verify values() yields exactly 1 element for length=1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100);
      let count = 0;
      for (const v of arr.values()) {
        count = count + 1;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_4200
     * @tc.name testUint32ArrayValues042
     * @tc.desc Verify values() yields exactly 2 elements for length=2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 200);
      let count = 0;
      for (const v of arr.values()) {
        count = count + 1;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_4300
     * @tc.name testUint32ArrayValues043
     * @tc.desc Verify values() yields 1000 elements from a length-1000 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr.$_set(i, i);
      }
      const collected: number[] = [];
      for (const v of arr.values()) {
        collected.push(v);
      }
      expect(collected.length).assertEqual(1000);
      expect(collected[0]).assertEqual(0);
      expect(collected[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_4400
     * @tc.name testUint32ArrayValues044
     * @tc.desc Verify values() on ArrayBuffer-backed view iterates stored elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 0, 2);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      const collected: number[] = [];
      for (const v of arr.values()) {
        collected.push(v);
      }
      expect(collected.join(',')).assertEqual('11,22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_4500
     * @tc.name testUint32ArrayValues045
     * @tc.desc Verify values() on subarray() iterates only the sub-range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40, 50);
      const sub = arr.subarray(1, 4);
      const collected: number[] = [];
      for (const v of sub.values()) {
        collected.push(v);
      }
      expect(collected.join(',')).assertEqual('20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_4600
     * @tc.name testUint32ArrayValues046
     * @tc.desc Verify values() on byteOffset-based view iterates from correct offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const base = new Uint32Array(buf);
      base.$_set(0, 1);
      base.$_set(1, 2);
      base.$_set(2, 3);
      base.$_set(3, 4);
      base.$_set(4, 5);
      base.$_set(5, 6);
      const view = new Uint32Array(buf, 8, 2);
      const collected: number[] = [];
      for (const v of view.values()) {
        collected.push(v);
      }
      expect(collected.join(',')).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_4700
     * @tc.name testUint32ArrayValues047
     * @tc.desc Verify values() sees $_set() write done between two next() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const it = arr.values();
      it.next();
      arr.$_set(1, 99);
      const second = it.next().value;
      expect(second).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_4800
     * @tc.name testUint32ArrayValues048
     * @tc.desc Verify values() unaffected when $_set() writes to already-visited index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const it = arr.values();
      it.next();
      arr.$_set(0, 99);
      const second = it.next().value;
      expect(second).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_4900
     * @tc.name testUint32ArrayValues049
     * @tc.desc Verify a fresh values() reflects the value written by $_set()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const before = arr.values().next().value;
      arr.$_set(0, 77);
      const after = arr.values().next().value;
      expect(before).assertEqual(1);
      expect(after).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_5000
     * @tc.name testUint32ArrayValues050
     * @tc.desc Verify values() for...of visits exactly length elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let count = 0;
      for (const v of arr.values()) {
        count = count + 1;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_5100
     * @tc.name testUint32ArrayValues051
     * @tc.desc Verify values() first result equals element at keys() first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const vIt = arr.values();
      const kIt = arr.keys();
      const v = vIt.next().value;
      const k = kIt.next().value;
      expect(v).assertEqual(arr.$_get(k!));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_5200
     * @tc.name testUint32ArrayValues052
     * @tc.desc Verify values() first value equals entries() first tuple value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      let fromEntries: number = 0;
      for (const entry of arr.entries()) {
        fromEntries = entry[1];
        break;
      }
      const fromValues = arr.values().next().value;
      expect(fromEntries).assertEqual(fromValues);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_5300
     * @tc.name testUint32ArrayValues053
     * @tc.desc Verify values() first value equals $_iterator() first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      const vVal = arr.values().next().value;
      const itVal = arr.$_iterator().next().value;
      expect(vVal).assertEqual(itVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_5400
     * @tc.name testUint32ArrayValues054
     * @tc.desc Verify values() for...of matches direct for...of on the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const fromValues: number[] = [];
      for (const v of arr.values()) {
        fromValues.push(v);
      }
      const fromDirect: number[] = [];
      for (const v of arr) {
        fromDirect.push(v);
      }
      expect(fromValues.join(',')).assertEqual(fromDirect.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_5500
     * @tc.name testUint32ArrayValues055
     * @tc.desc Verify values() iteration count equals array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 6, 7, 8);
      let count = 0;
      for (const v of arr.values()) {
        count = count + 1;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_5600
     * @tc.name testUint32ArrayValues056
     * @tc.desc Verify values() yields elements 10 and 20 in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      const it = arr.values();
      const a = it.next().value;
      const b = it.next().value;
      expect(a).assertEqual(10);
      expect(b).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_5700
     * @tc.name testUint32ArrayValues057
     * @tc.desc Verify values() iterators are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const it1 = arr.values();
      const it2 = arr.values();
      const a1 = it1.next().value;
      const b1 = it2.next().value;
      const a2 = it1.next().value;
      const b2 = it2.next().value;
      expect(a1).assertEqual(1);
      expect(a2).assertEqual(2);
      expect(b1).assertEqual(1);
      expect(b2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_5800
     * @tc.name testUint32ArrayValues058
     * @tc.desc Verify nested values() for...of enumerates Cartesian pair sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer = Uint32Array.of(1, 2);
      const pairs: string[] = [];
      for (const o of outer.values()) {
        for (const i of outer.values()) {
          pairs.push(o.toString() + ',' + i.toString());
        }
      }
      expect(pairs.join(';')).assertEqual('1,1;1,2;2,1;2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_5900
     * @tc.name testUint32ArrayValues059
     * @tc.desc Verify values() next() stays done=true after iterator is exhausted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const it = arr.values();
      it.next();
      it.next();
      const r1 = it.next();
      const r2 = it.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_6000
     * @tc.name testUint32ArrayValues060
     * @tc.desc Verify values() next() returns undefined value after exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const it = arr.values();
      it.next();
      it.next();
      const r = it.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_6100
     * @tc.name testUint32ArrayValues061
     * @tc.desc Verify values() on single-element array yields one done=false then done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_6200
     * @tc.name testUint32ArrayValues062
     * @tc.desc Verify $_set() during values() for...of updates array but iterator finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const collected: number[] = [];
      for (const v of arr.values()) {
        collected.push(v);
        arr.$_set(0, 99);
      }
      expect(collected.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_6300
     * @tc.name testUint32ArrayValues063
     * @tc.desc Verify $_set(-2147483648) 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, -2147483648);
      expect(arr.values().next().value).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_6400
     * @tc.name testUint32ArrayValues064
     * @tc.desc Verify $_set(4294967301) (2^32+5) 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, 4294967301);
      expect(arr.values().next().value).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_6500
     * @tc.name testUint32ArrayValues065
     * @tc.desc Verify $_set(8589934598) (2^33+6) 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, 8589934598);
      expect(arr.values().next().value).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_6600
     * @tc.name testUint32ArrayValues066
     * @tc.desc Verify values() on subarray reflects source mutation through shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const sub = arr.subarray(0, 2);
      arr.$_set(0, 99);
      const collected: number[] = [];
      for (const v of sub.values()) {
        collected.push(v);
      }
      expect(collected.join(',')).assertEqual('99,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_6700
     * @tc.name testUint32ArrayValues067
     * @tc.desc Verify values() on source reflects subarray write through shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const sub = arr.subarray(1, 3);
      sub.$_set(0, 99);
      const collected: number[] = [];
      for (const v of arr.values()) {
        collected.push(v);
      }
      expect(collected.join(',')).assertEqual('10,99,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_6800
     * @tc.name testUint32ArrayValues068
     * @tc.desc Verify values() on sibling view sees write through shared ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const v1 = new Uint32Array(buf, 0, 2);
      const v2 = new Uint32Array(buf, 0, 2);
      v1.$_set(0, 42);
      const val = v2.values().next().value;
      expect(val).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_6900
     * @tc.name testUint32ArrayValues069
     * @tc.desc Verify values() on out-of-range subarray yields zero elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const sub = arr.subarray(5, 10);
      let count = 0;
      for (const v of sub.values()) {
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_7000
     * @tc.name testUint32ArrayValues070
     * @tc.desc Verify values() on slice() copy is unaffected by later source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const copy = arr.slice(0, 3);
      arr.$_set(0, 99);
      const collected: number[] = [];
      for (const v of copy.values()) {
        collected.push(v);
      }
      expect(collected.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_7100
     * @tc.name testUint32ArrayValues071
     * @tc.desc Verify values() for...of sums all elements to expected total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let sum: number = 0;
      for (const v of arr.values()) {
        sum = sum + v;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_7200
     * @tc.name testUint32ArrayValues072
     * @tc.desc Verify values() for...of yields 0 iterations after iterator is exhausted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const it = arr.values();
      while (!it.next().done) {
      }
      let count = 0;
      for (const v of it) {
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_7300
     * @tc.name testUint32ArrayValues073
     * @tc.desc Verify values() yields 65535 elements for a length-65535 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(65535);
      let count = 0;
      for (const v of arr.values()) {
        count = count + 1;
      }
      expect(count).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_7400
     * @tc.name testUint32ArrayValues074
     * @tc.desc Verify values() iteration counts even elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      let evenCount = 0;
      for (const v of arr.values()) {
        if (v % 2 === 0) {
          evenCount = evenCount + 1;
        }
      }
      expect(evenCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_7500
     * @tc.name testUint32ArrayValues075
     * @tc.desc Verify values() over Uint32Array copied from another array yields same elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 8, 9);
      const arr = new Uint32Array(src);
      const collected: number[] = [];
      for (const v of arr.values()) {
        collected.push(v);
      }
      expect(collected.join(',')).assertEqual('7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_7600
     * @tc.name testUint32ArrayValues076
     * @tc.desc Verify values() on Uint32Array from FixedArray<number> yields int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      const arr = new Uint32Array(src);
      const it = arr.values();
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
      expect(it.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_7700
     * @tc.name testUint32ArrayValues077
     * @tc.desc Verify values() collected then joined matches Uint32Array.toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 10, 15);
      const collected: number[] = [];
      for (const v of arr.values()) {
        collected.push(v);
      }
      expect(collected.join(',')).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_7800
     * @tc.name testUint32ArrayValues078
     * @tc.desc Verify values() yields element written via $_set with byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      const b: byte = 7;
      arr.$_set(0, b);
      const collected: number[] = [];
      for (const v of arr.values()) {
        collected.push(v);
      }
      expect(collected[0]).assertEqual(7);
      expect(collected[1]).assertEqual(0);
      expect(collected.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_7900
     * @tc.name testUint32ArrayValues079
     * @tc.desc Verify new Uint32Array(4) - 4 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(4);
      const collected: number[] = [];
      for (const v of arr.values()) {
        collected.push(v);
      }
      expect(collected.join(',')).assertEqual('0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_8000
     * @tc.name testUint32ArrayValues080
     * @tc.desc Verify set(Uint32Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      arr.set(Uint32Array.of(7, 8, 9));
      const collected: number[] = [];
      for (const v of arr.values()) {
        collected.push(v);
      }
      expect(collected.join(',')).assertEqual('7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_8100
     * @tc.name testUint32ArrayValues081
     * @tc.desc Verify values().next() value can be used with lastIndexOf to locate index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const it = arr.values();
      it.next();
      const v = it.next().value;
      expect(arr.lastIndexOf(v!)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_8200
     * @tc.name testUint32ArrayValues082
     * @tc.desc Verify values() sequence aligns with entries() second column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const vIter = arr.values();
      const eIter = arr.entries();
      let steps: number = 0;
      while (true) {
        const vNext = vIter.next();
        const eNext = eIter.next();
        expect(vNext.done).assertEqual(eNext.done);
        if (vNext.done === true) {
          break;
        }
        expect(vNext.value).assertEqual(eNext.value![1]);
        expect(eNext.value![0]).assertEqual(steps);
        steps = steps + 1;
      }
      expect(steps).assertEqual(3);
      const empty = new Uint32Array(0);
      expect(empty.values().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUES_8300
     * @tc.name testUint32ArrayValues083
     * @tc.desc Verify values() advances in sync with keys() index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValues083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const vIter = arr.values();
      const kIter = arr.keys();
      expect(vIter.next().value).assertEqual(10);
      expect(kIter.next().value).assertEqual(0);
      expect(vIter.next().value).assertEqual(20);
      expect(kIter.next().value).assertEqual(1);
      expect(vIter.next().value).assertEqual(30);
      expect(kIter.next().value).assertEqual(2);
      expect(vIter.next().done).assertTrue();
      expect(kIter.next().done).assertTrue();
    });
  });
}
