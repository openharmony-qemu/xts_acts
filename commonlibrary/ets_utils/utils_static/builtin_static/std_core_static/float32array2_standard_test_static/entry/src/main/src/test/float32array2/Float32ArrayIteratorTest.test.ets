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

export default function Float32ArrayIteratorTest(): void {
  describe('Float32ArrayIteratorTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_0100
     * @tc.name testFloat32ArrayIterator001
     * @tc.desc Verify $_iterator() next() returns value 1.0 on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const it = arr.$_iterator();
      const r = it.next();
      expect(r.value).assertEqual(1.0);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_0200
     * @tc.name testFloat32ArrayIterator002
     * @tc.desc Verify two independent $_iterator() iterators both start at 7.0 on [7.0,8.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0, 8.0);
      const it1 = arr.$_iterator();
      const it2 = arr.$_iterator();
      const iteratorValue002 = it1.next().value;
      expect(iteratorValue002).assertEqual(7.0);
      const iteratorValue002Part2 = it2.next().value;
      expect(iteratorValue002Part2).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_0300
     * @tc.name testFloat32ArrayIterator003
     * @tc.desc Verify $_iterator() next() returns value 1.0 and done false on [1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const it = arr.$_iterator();
      const result = it.next();
      expect(result.value).assertEqual(1.0);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_0400
     * @tc.name testFloat32ArrayIterator004
     * @tc.desc Verify $_iterator() next().value equals 42.0 on [42.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const it = arr.$_iterator();
      const r = it.next();
      expect(r.value).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_0500
     * @tc.name testFloat32ArrayIterator005
     * @tc.desc Verify $_iterator() first next().done is false on [1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const it = arr.$_iterator();
      const r = it.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_0600
     * @tc.name testFloat32ArrayIterator006
     * @tc.desc Verify $_iterator() next().value equals 11.0 on [11.0,22.0,33.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(11.0, 22.0, 33.0);
      const it = arr.$_iterator();
      const iteratorValue006 = it.next().value;
      expect(iteratorValue006).assertEqual(11.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_0700
     * @tc.name testFloat32ArrayIterator007
     * @tc.desc Verify $_iterator() third next() returns value 3.0 and done false on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const it = arr.$_iterator();
      it.next();
      it.next();
      const last = it.next();
      expect(last.value).assertEqual(3.0);
      expect(last.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_0800
     * @tc.name testFloat32ArrayIterator008
     * @tc.desc Verify $_iterator() next().done remains true after exhausting [1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const it = arr.$_iterator();
      it.next();
      it.next();
      const iteratorValue008 = it.next().done;
      expect(iteratorValue008).assertTrue();
      const repeatedDone008 = it.next().done;
      expect(repeatedDone008).assertTrue();
      const finalDone008 = it.next().done;
      expect(finalDone008).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_0900
     * @tc.name testFloat32ArrayIterator009
     * @tc.desc Verify $_iterator() next().value is undefined after exhausting [1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const it = arr.$_iterator();
      it.next();
      const iteratorValue009 = it.next().value;
      expect(iteratorValue009).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_1000
     * @tc.name testFloat32ArrayIterator010
     * @tc.desc Verify $_iterator() yields values 1.0, 2.0, 3.0 sequentially on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const it = arr.$_iterator();
      const iteratorValue011 = it.next().value;
      expect(iteratorValue011).assertEqual(1.0);
      const iteratorValue011Part2 = it.next().value;
      expect(iteratorValue011Part2).assertEqual(2.0);
      const iteratorValue011Part3 = it.next().value;
      expect(iteratorValue011Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_1100
     * @tc.name testFloat32ArrayIterator011
     * @tc.desc Verify for loop with $_get collects [10.0,20.0,30.0] with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const collected: number[] = [];
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        collected.push(v);
      }
      expect(collected[0]).assertEqual(10.0);
      expect(collected[2]).assertEqual(30.0);
      expect(collected.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_1200
     * @tc.name testFloat32ArrayIterator012
     * @tc.desc Verify for loop with $_get break at sum>3 on [1.0,2.0,3.0,4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let sum = 0.0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        sum = sum + v;
        if (sum > 3) {
          break;
        }
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_1300
     * @tc.name testFloat32ArrayIterator013
     * @tc.desc Verify for loop with $_get continue skip 2.0 on [1.0,2.0,3.0,4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let sum = 0.0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        if (v === 2.0) {
          continue;
        }
        sum = sum + v;
      }
      expect(sum).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_1400
     * @tc.name testFloat32ArrayIterator014
     * @tc.desc Verify for loop with $_get on empty Float32Array(0) iterates zero times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      let count = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        expect(v).assertEqual(__f32i);
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_1500
     * @tc.name testFloat32ArrayIterator015
     * @tc.desc Verify for loop with $_get on [99.0] iterates once and retrieves value 99.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(99.0);
      let count = 0;
      let first = 0.0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        count = count + 1;
        first = v;
      }
      expect(count).assertEqual(1);
      expect(first).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_1600
     * @tc.name testFloat32ArrayIterator016
     * @tc.desc Verify for loop with $_get count equals 5 on [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      let count = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        expect(v).assertEqual(__f32i + 1);
        count = count + 1;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_1700
     * @tc.name testFloat32ArrayIterator017
     * @tc.desc Verify $_iterator next().done true on empty Float32Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.$_iterator();
      const iteratorValue018 = it.next().done;
      expect(iteratorValue018).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_1800
     * @tc.name testFloat32ArrayIterator018
     * @tc.desc Verify $_iterator() next().value is undefined on empty Float32Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.$_iterator();
      const iteratorValue019 = it.next().value;
      expect(iteratorValue019).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_1900
     * @tc.name testFloat32ArrayIterator019
     * @tc.desc Verify $_iterator next().done is true after exhausting array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.$_iterator();
      it.next();
      const iteratorValue020 = it.next().done;
      expect(iteratorValue020).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_2000
     * @tc.name testFloat32ArrayIterator020
     * @tc.desc Verify for loop with $_get on Float32Array(1) with one element iterates once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 42.0);
      let count = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        expect(v).assertEqual(42.0);
        count = count + 1;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_2100
     * @tc.name testFloat32ArrayIterator021
     * @tc.desc Verify $_iterator and values() next().done both true on empty Float32Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const a = arr.$_iterator().next();
      const b = arr.values().next();
      expect(a.done).assertTrue();
      expect(b.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_2200
     * @tc.name testFloat32ArrayIterator022
     * @tc.desc Verify $_iterator next().done true after exhausting [123.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(123.0);
      const it = arr.$_iterator();
      it.next();
      const iteratorValue024 = it.next().done;
      expect(iteratorValue024).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_2300
     * @tc.name testFloat32ArrayIterator023
     * @tc.desc Verify for loop with $_get retrieves 7.0 on [7.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      let got = 0.0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        got = v;
      }
      expect(got).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_2400
     * @tc.name testFloat32ArrayIterator024
     * @tc.desc Verify $_iterator yields -1.0, -2.0, -3.0 on [-1,-2,-3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const it = arr.$_iterator();
      const iteratorValue026 = it.next().value;
      expect(iteratorValue026).assertEqual(-1.0);
      const iteratorValue026Part2 = it.next().value;
      expect(iteratorValue026Part2).assertEqual(-2.0);
      const iteratorValue026Part3 = it.next().value;
      expect(iteratorValue026Part3).assertEqual(-3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_2500
     * @tc.name testFloat32ArrayIterator025
     * @tc.desc Verify $_iterator yields 0,0,0 on [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0);
      const it = arr.$_iterator();
      const iteratorValue027 = it.next().value;
      expect(iteratorValue027).assertEqual(0);
      const iteratorValue027Part2 = it.next().value;
      expect(iteratorValue027Part2).assertEqual(0);
      const iteratorValue027Part3 = it.next().value;
      expect(iteratorValue027Part3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_2600
     * @tc.name testFloat32ArrayIterator026
     * @tc.desc Verify $_iterator yields 5.0,5.0,5.0 on [5,5,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 5.0, 5.0);
      const it = arr.$_iterator();
      const iteratorValue028 = it.next().value;
      expect(iteratorValue028).assertEqual(5.0);
      const iteratorValue028Part2 = it.next().value;
      expect(iteratorValue028Part2).assertEqual(5.0);
      const iteratorValue028Part3 = it.next().value;
      expect(iteratorValue028Part3).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_2700
     * @tc.name testFloat32ArrayIterator027
     * @tc.desc Verify $_iterator yields 0 then 49 on 50-element array [0..49]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [];
      for (let i = 0; i < 50; i++) {
        src.push(i);
      }
      const arr = Float32Array.from(src);
      const it = arr.$_iterator();
      const iteratorValue029 = it.next().value;
      expect(iteratorValue029).assertEqual(0);
      for (let i = 0; i < 48; i++) {
        it.next();
      }
      const iteratorValue029Part2 = it.next().value;
      expect(iteratorValue029Part2).assertEqual(49);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_2800
     * @tc.name testFloat32ArrayIterator028
     * @tc.desc Verify $_iterator yields NaN from [NaN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN);
      const it = arr.$_iterator();
      const iteratorValue030 = it.next().value;
      expect(iteratorValue030).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_2900
     * @tc.name testFloat32ArrayIterator029
     * @tc.desc Verify $_iterator yields Infinity from [Infinity]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.POSITIVE_INFINITY);
      const it = arr.$_iterator();
      const iteratorValue031 = it.next().value;
      expect(iteratorValue031).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_3000
     * @tc.name testFloat32ArrayIterator030
     * @tc.desc Verify $_iterator yields -Infinity from [-Infinity]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-Number.POSITIVE_INFINITY);
      const it = arr.$_iterator();
      const iteratorValue032 = it.next().value;
      expect(iteratorValue032).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_3100
     * @tc.name testFloat32ArrayIterator031
     * @tc.desc Verify $_iterator yields -0 from Float32Array.of(-0.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.0);
      const it = arr.$_iterator();
      const v = it.next().value!;
      const observedValue034 = 1 / v;
      expect(observedValue034).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_3200
     * @tc.name testFloat32ArrayIterator032
     * @tc.desc Verify $_iterator yields Float32.MAX 3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38);
      const it = arr.$_iterator();
      const iteratorValue035 = it.next().value;
      expect(iteratorValue035).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_3300
     * @tc.name testFloat32ArrayIterator033
     * @tc.desc Verify $_iterator yields -Float32.MAX -3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-3.4028234663852886e+38);
      const it = arr.$_iterator();
      const iteratorValue036 = it.next().value;
      expect(iteratorValue036).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_3400
     * @tc.name testFloat32ArrayIterator034
     * @tc.desc Verify $_iterator yields Float32.MIN_NORMAL 1.1754943508222875e-38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.1754943508222875e-38);
      const it = arr.$_iterator();
      const iteratorValue037 = it.next().value;
      expect(iteratorValue037).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_3500
     * @tc.name testFloat32ArrayIterator035
     * @tc.desc Verify $_iterator yields Float32.MIN_VALUE 1.401298464324817e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.401298464324817e-45);
      const it = arr.$_iterator();
      const iteratorValue038 = it.next().value;
      expect(iteratorValue038).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_3600
     * @tc.name testFloat32ArrayIterator036
     * @tc.desc Verify $_iterator value equals arr.$_get(0) for 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1);
      const it = arr.$_iterator();
      const iteratorValue039 = it.next().value;
      expect(iteratorValue039).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_3700
     * @tc.name testFloat32ArrayIterator037
     * @tc.desc Verify $_iterator value equals arr.$_get(0) for 0.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.2);
      const it = arr.$_iterator();
      const iteratorValue040 = it.next().value;
      expect(iteratorValue040).assertEqual(0.20000000298023224);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_3800
     * @tc.name testFloat32ArrayIterator038
     * @tc.desc Verify $_iterator value equals arr.$_get(0) for 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.3);
      const it = arr.$_iterator();
      const iteratorValue041 = it.next().value;
      expect(iteratorValue041).assertEqual(0.30000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_3900
     * @tc.name testFloat32ArrayIterator039
     * @tc.desc Verify $_iterator value equals arr.$_get(0) for 1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.1);
      const it = arr.$_iterator();
      const iteratorValue042 = it.next().value;
      expect(iteratorValue042).assertEqual(1.100000023841858);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_4000
     * @tc.name testFloat32ArrayIterator040
     * @tc.desc Verify $_iterator value equals arr.$_get(0) for 1.0000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0000001);
      const it = arr.$_iterator();
      const iteratorValue043 = it.next().value;
      expect(iteratorValue043).assertEqual(1.0000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_4100
     * @tc.name testFloat32ArrayIterator041
     * @tc.desc Verify $_iterator yields 16777216 from [16777216]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777216.0);
      const it = arr.$_iterator();
      const iteratorValue044 = it.next().value;
      expect(iteratorValue044).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_4200
     * @tc.name testFloat32ArrayIterator042
     * @tc.desc Verify $_iterator yields 16777216 from Float32Array.of(16777217)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777217.0);
      const it = arr.$_iterator();
      const iteratorValue045 = it.next().value;
      expect(iteratorValue045).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_4300
     * @tc.name testFloat32ArrayIterator043
     * @tc.desc Verify $_iterator yields Infinity from Float32Array.of(1.0e40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e40);
      const it = arr.$_iterator();
      const iteratorValue046 = it.next().value;
      expect(iteratorValue046).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_4400
     * @tc.name testFloat32ArrayIterator044
     * @tc.desc Verify $_iterator yields -Infinity from Float32Array.of(-1.0e40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0e40);
      const it = arr.$_iterator();
      const iteratorValue047 = it.next().value;
      expect(iteratorValue047).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_4500
     * @tc.name testFloat32ArrayIterator045
     * @tc.desc Verify $_iterator yields 2147483648 from Float32Array.of(2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2147483647.0);
      const it = arr.$_iterator();
      const iteratorValue050 = it.next().value;
      expect(iteratorValue050).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_4600
     * @tc.name testFloat32ArrayIterator046
     * @tc.desc Verify $_iterator yields -2147483648 from Float32Array.of(-2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-2147483648.0);
      const it = arr.$_iterator();
      const iteratorValue051 = it.next().value;
      expect(iteratorValue051).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_4700
     * @tc.name testFloat32ArrayIterator047
     * @tc.desc Verify $_iterator yields 9.0 from Float32Array.of(9.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0);
      const it = arr.$_iterator();
      const iteratorValue053 = it.next().value;
      expect(iteratorValue053).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_4800
     * @tc.name testFloat32ArrayIterator048
     * @tc.desc Verify $_iterator: NaN in [1.0,NaN,3.0] detected via isNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.NaN, 3.0);
      const it = arr.$_iterator();
      const iteratorValue057 = it.next().value;
      expect(iteratorValue057).assertEqual(1.0);
      const iteratorValue057Part2 = it.next().value;
      expect(iteratorValue057Part2).assertNaN();
      const iteratorValue057Part3 = it.next().value;
      expect(iteratorValue057Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_4900
     * @tc.name testFloat32ArrayIterator049
     * @tc.desc Verify $_iterator yields Float32.MAX then Float32.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38, 1.401298464324817e-45);
      const it = arr.$_iterator();
      const iteratorValue058 = it.next().value;
      expect(iteratorValue058).assertEqual(3.4028234663852886e+38);
      const iteratorValue058Part2 = it.next().value;
      expect(iteratorValue058Part2).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_5000
     * @tc.name testFloat32ArrayIterator050
     * @tc.desc Verify $_iterator yields 1, 2.5, 3 on [1.0,2.5,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.5, 3.0);
      const it = arr.$_iterator();
      const iteratorValue059 = it.next().value;
      expect(iteratorValue059).assertEqual(1);
      const iteratorValue059Part2 = it.next().value;
      expect(iteratorValue059Part2).assertEqual(2.5);
      const iteratorValue059Part3 = it.next().value;
      expect(iteratorValue059Part3).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_5100
     * @tc.name testFloat32ArrayIterator051
     * @tc.desc Verify $_iterator and values() yield same sequence on [4.0,5.0,6.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      const a = arr.$_iterator();
      const b = arr.values();
      const iteratorValue060 = a.next().value;
      const valuesValue060 = b.next().value;
      expect(iteratorValue060).assertEqual(4.0);
      expect(valuesValue060).assertEqual(4.0);
      const iteratorValue060Part2 = a.next().value;
      const valuesValue060Part2 = b.next().value;
      expect(iteratorValue060Part2).assertEqual(5.0);
      expect(valuesValue060Part2).assertEqual(5.0);
      const iteratorValue060Part3 = a.next().value;
      const valuesValue060Part3 = b.next().value;
      expect(iteratorValue060Part3).assertEqual(6.0);
      expect(valuesValue060Part3).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_5200
     * @tc.name testFloat32ArrayIterator052
     * @tc.desc Verify values() independent of $_iterator exhaustion starts at 1.0 on [1.0,2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const a = arr.$_iterator();
      const b = arr.values();
      a.next();
      a.next();
      const iteratorValue061 = b.next().value;
      expect(iteratorValue061).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_5300
     * @tc.name testFloat32ArrayIterator053
     * @tc.desc Verify $_iterator and values() interleaved yield 10.0,10.0,20.0,20.0 on [10.0,20.0,30.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const a = arr.$_iterator();
      const b = arr.values();
      const iteratorValue062 = a.next().value;
      expect(iteratorValue062).assertEqual(10.0);
      const iteratorValue062Part2 = b.next().value;
      expect(iteratorValue062Part2).assertEqual(10.0);
      const iteratorValue062Part3 = a.next().value;
      expect(iteratorValue062Part3).assertEqual(20.0);
      const iteratorValue062Part4 = b.next().value;
      expect(iteratorValue062Part4).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_5400
     * @tc.name testFloat32ArrayIterator054
     * @tc.desc Verify two for loops with $_get collect equal arrays on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const viaIt = arr.$_iterator();
      const viaValues = arr.values();
      expect(viaIt.next().value).assertEqual(1.0);
      expect(viaValues.next().value).assertEqual(1.0);
      expect(viaIt.next().value).assertEqual(2.0);
      expect(viaValues.next().value).assertEqual(2.0);
      expect(viaIt.next().value).assertEqual(3.0);
      expect(viaValues.next().value).assertEqual(3.0);
      expect(viaIt.next().done).assertTrue();
      expect(viaValues.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_5500
     * @tc.name testFloat32ArrayIterator055
     * @tc.desc Verify $_iterator and values() next().done equal true on empty Float32Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const iteratorValue064 = arr.$_iterator().next().done;
      const iteratorValue064Part2 = arr.values().next().done;
      expect(iteratorValue064).assertTrue();
      expect(iteratorValue064Part2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_5600
     * @tc.name testFloat32ArrayIterator056
     * @tc.desc Verify independent $_iterator iterators start at same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const it1 = arr.$_iterator();
      const it2 = arr.$_iterator();
      it1.next();
      it1.next();
      const iteratorValue065 = it2.next().value;
      expect(iteratorValue065).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_5700
     * @tc.name testFloat32ArrayIterator057
     * @tc.desc Verify $_iterator it2 sum equals 18 after it1.next() on [5.0,6.0,7.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 6.0, 7.0);
      const it1 = arr.$_iterator();
      const it2 = arr.$_iterator();
      it1.next();
      let sum = 0.0;
      for (let __f32e = it2.next();!__f32e.done; __f32e = it2.next()) {
        const v = Number(__f32e.value);
        sum = sum + v;
      }
      expect(sum).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_5800
     * @tc.name testFloat32ArrayIterator058
     * @tc.desc Verify independent $_iterator iterators yield same sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const a = arr.$_iterator();
      const b = arr.$_iterator();
      const c = arr.$_iterator();
      const iteratorValue067 = a.next().value;
      expect(iteratorValue067).assertEqual(1.0);
      const iteratorValue067Part2 = b.next().value;
      expect(iteratorValue067Part2).assertEqual(1.0);
      const iteratorValue067Part3 = c.next().value;
      expect(iteratorValue067Part3).assertEqual(1.0);
      const iteratorValue067Part4 = a.next().value;
      expect(iteratorValue067Part4).assertEqual(2.0);
      const iteratorValue067Part5 = b.next().value;
      expect(iteratorValue067Part5).assertEqual(2.0);
      const iteratorValue067Part6 = c.next().value;
      expect(iteratorValue067Part6).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_5900
     * @tc.name testFloat32ArrayIterator059
     * @tc.desc Verify exhausted it1 done true while independent it2 starts at 1.0 on [1.0,2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const it1 = arr.$_iterator();
      const it2 = arr.$_iterator();
      it1.next();
      it1.next();
      it1.next();
      const iteratorValue068 = it1.next().done;
      expect(iteratorValue068).assertTrue();
      const iteratorValue068Part2 = it2.next().value;
      expect(iteratorValue068Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_6000
     * @tc.name testFloat32ArrayIterator060
     * @tc.desc Verify two independent $_iterator iterators both sum to 6 on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const it1 = arr.$_iterator();
      const it2 = arr.$_iterator();
      let s1 = 0.0;
      let s2 = 0.0;
      for (let __f32e = it1.next();!__f32e.done; __f32e = it1.next()) {
        const v = Number(__f32e.value);
        s1 = s1 + v;
      }
      for (let __f32e = it2.next();!__f32e.done; __f32e = it2.next()) {
        const v = Number(__f32e.value);
        s2 = s2 + v;
      }
      expect(s1).assertEqual(6);
      expect(s2).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_6100
     * @tc.name testFloat32ArrayIterator061
     * @tc.desc Verify $_iterator on [1.0,2.0] and [10.0,20.0] interleave 1.0,10.0,2.0,20.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Float32Array.of(1.0, 2.0);
      const arr2 = Float32Array.of(10.0, 20.0);
      const it1 = arr1.$_iterator();
      const it2 = arr2.$_iterator();
      const iteratorValue070 = it1.next().value;
      expect(iteratorValue070).assertEqual(1.0);
      const iteratorValue070Part2 = it2.next().value;
      expect(iteratorValue070Part2).assertEqual(10.0);
      const iteratorValue070Part3 = it1.next().value;
      expect(iteratorValue070Part3).assertEqual(2.0);
      const iteratorValue070Part4 = it2.next().value;
      expect(iteratorValue070Part4).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_6200
     * @tc.name testFloat32ArrayIterator062
     * @tc.desc Verify $_iterator exhaustion does not modify array elements on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const it = arr.$_iterator();
      it.next();
      it.next();
      it.next();
      const element071 = arr.$_get(0);
      expect(element071).assertEqual(1.0);
      const element071Part2 = arr.$_get(2);
      expect(element071Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_6300
     * @tc.name testFloat32ArrayIterator063
     * @tc.desc Verify for loop iteration yields correct values and preserves array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        expect(arr.$_get(__f32i)).assertEqual(__f32i + 1.0);
      }
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_6400
     * @tc.name testFloat32ArrayIterator064
     * @tc.desc Verify for loop iteration preserves byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        expect(arr.$_get(__f32i)).assertEqual(__f32i + 1.0);
      }
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_6500
     * @tc.name testFloat32ArrayIterator065
     * @tc.desc Verify $_iterator next() does not modify array elements on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const it = arr.$_iterator();
      it.next();
      const element074 = arr.$_get(0);
      expect(element074).assertEqual(1.0);
      it.next();
      const element074Part2 = arr.$_get(1);
      expect(element074Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_6600
     * @tc.name testFloat32ArrayIterator066
     * @tc.desc Verify for loop with $_get sums to 6 and $_get(2) is 3.0 on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let acc = 0.0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        acc = acc + v;
      }
      expect(acc).assertEqual(6);
      const element075 = arr.$_get(2);
      expect(element075).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_6700
     * @tc.name testFloat32ArrayIterator067
     * @tc.desc Verify nested $_iterator iterators: inner starts at 1.0, outer resumes at 2.0 on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const outer = arr.$_iterator();
      outer.next();
      const inner = arr.$_iterator();
      const iteratorValue076 = inner.next().value;
      expect(iteratorValue076).assertEqual(1.0);
      const iteratorValue076Part2 = outer.next().value;
      expect(iteratorValue076Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_6800
     * @tc.name testFloat32ArrayIterator068
     * @tc.desc Verify iterator break then next() resumes at next value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const it = arr.$_iterator();
      let first = 0.0;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        const v = Number(__f32e.value);
        first = v;
        break;
      }
      expect(first).assertEqual(1.0);
      const iteratorValue078 = it.next().value;
      expect(iteratorValue078).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_6900
     * @tc.name testFloat32ArrayIterator069
     * @tc.desc Verify $_iterator yields 3.0 then done true on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const it = arr.$_iterator();
      it.next();
      it.next();
      const iteratorValue079 = it.next().value;
      expect(iteratorValue079).assertEqual(3.0);
      const iteratorValue079Part2 = it.next().done;
      expect(iteratorValue079Part2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_7000
     * @tc.name testFloat32ArrayIterator070
     * @tc.desc Verify subarray(1,3) view iterator yields 2.0,3.0 then done on [1.0,2.0,3.0,4.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const view = arr.subarray(1, 3);
      const it = view.$_iterator();
      const iteratorValue080 = it.next().value;
      expect(iteratorValue080).assertEqual(2.0);
      const iteratorValue080Part2 = it.next().value;
      expect(iteratorValue080Part2).assertEqual(3.0);
      const iteratorValue080Part3 = it.next().done;
      expect(iteratorValue080Part3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_7100
     * @tc.name testFloat32ArrayIterator071
     * @tc.desc Verify buffer view (offset 4, length 2) iterator yields 22.0,33.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Float32Array(buf);
      parent.$_set(0, 11.0);
      parent.$_set(1, 22.0);
      const child = new Float32Array(buf, 4, 2);
      parent.$_set(2, 33.0);
      const it = child.$_iterator();
      const iteratorValue081 = it.next().value;
      expect(iteratorValue081).assertEqual(22.0);
      const iteratorValue081Part2 = it.next().value;
      expect(iteratorValue081Part2).assertEqual(33.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_7200
     * @tc.name testFloat32ArrayIterator072
     * @tc.desc Verify parent iterator yields 99.0 after child $_set on buffer view (offset 0, length 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const parent = new Float32Array(buf);
      parent.$_set(0, 1.0);
      parent.$_set(1, 2.0);
      const child = new Float32Array(buf, 0, 1);
      child.$_set(0, 99.0);
      const it = parent.$_iterator();
      const iteratorValue082 = it.next().value;
      expect(iteratorValue082).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_7300
     * @tc.name testFloat32ArrayIterator073
     * @tc.desc Verify byteOffset view (offset 4, length 2) iterator yields 2.0,3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const full = new Float32Array(buf);
      full.$_set(0, 1.0);
      full.$_set(1, 2.0);
      full.$_set(2, 3.0);
      const view = new Float32Array(buf, 4, 2);
      const it = view.$_iterator();
      const iteratorValue083 = it.next().value;
      expect(iteratorValue083).assertEqual(2.0);
      const iteratorValue083Part2 = it.next().value;
      expect(iteratorValue083Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_7400
     * @tc.name testFloat32ArrayIterator074
     * @tc.desc Verify subarray(10,5) empty view iterator done true on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const view = arr.subarray(10, 5);
      const it = view.$_iterator();
      const iteratorValue084 = it.next().done;
      expect(iteratorValue084).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_7500
     * @tc.name testFloat32ArrayIterator075
     * @tc.desc Verify slice(0,2) copy iterator yields 1.0 and arr.$_get(2) is 3.0 on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const copy = arr.slice(0, 2);
      const it = copy.$_iterator();
      const iteratorValue085 = it.next().value;
      expect(iteratorValue085).assertEqual(1.0);
      const element085 = arr.$_get(2);
      expect(element085).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_7600
     * @tc.name testFloat32ArrayIterator076
     * @tc.desc Verify three 1-element buffer views yield 10.0,20.0,30.0 via iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const a = new Float32Array(buf, 0, 1);
      const b = new Float32Array(buf, 4, 1);
      const c = new Float32Array(buf, 8, 1);
      a.$_set(0, 10.0);
      b.$_set(0, 20.0);
      c.$_set(0, 30.0);
      const iteratorValue086 = a.$_iterator().next().value;
      expect(iteratorValue086).assertEqual(10.0);
      const iteratorValue086Part2 = b.$_iterator().next().value;
      expect(iteratorValue086Part2).assertEqual(20.0);
      const iteratorValue086Part3 = c.$_iterator().next().value;
      expect(iteratorValue086Part3).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_7700
     * @tc.name testFloat32ArrayIterator077
     * @tc.desc Verify Float32Array.from([1.0,2.0,3.0]) iterator yields 1.0,2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([1.0, 2.0, 3.0]);
      const it = arr.$_iterator();
      const iteratorValue087 = it.next().value;
      expect(iteratorValue087).assertEqual(1.0);
      const iteratorValue087Part2 = it.next().value;
      expect(iteratorValue087Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_7800
     * @tc.name testFloat32ArrayIterator078
     * @tc.desc Verify Float32Array.from([4.0,5.0]) iterator yields 4.0,5.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [4.0, 5.0];
      const arr = Float32Array.from(src);
      const it = arr.$_iterator();
      const iteratorValue088 = it.next().value;
      expect(iteratorValue088).assertEqual(4.0);
      const iteratorValue088Part2 = it.next().value;
      expect(iteratorValue088Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_7900
     * @tc.name testFloat32ArrayIterator079
     * @tc.desc Verify new Float32Array(3) iterator yields all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const it = arr.$_iterator();
      const iteratorValue089 = it.next().value;
      expect(iteratorValue089).assertEqual(0);
      const iteratorValue089Part2 = it.next().value;
      expect(iteratorValue089Part2).assertEqual(0);
      const iteratorValue089Part3 = it.next().value;
      expect(iteratorValue089Part3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_8000
     * @tc.name testFloat32ArrayIterator080
     * @tc.desc Verify Float32Array(buffer) iterator yields set values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf);
      arr.$_set(0, 1.0);
      arr.$_set(1, 2.0);
      const it = arr.$_iterator();
      const iteratorValue090 = it.next().value;
      expect(iteratorValue090).assertEqual(1.0);
      const iteratorValue090Part2 = it.next().value;
      expect(iteratorValue090Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_8100
     * @tc.name testFloat32ArrayIterator081
     * @tc.desc Verify for loop with $_get on 100-element Float32Array.from yields count 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [];
      for (let i = 0; i < 100; i++) {
        src.push(i);
      }
      const arr = Float32Array.from(src);
      let count = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        expect(v).assertEqual(__f32i);
        count = count + 1;
      }
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_8200
     * @tc.name testFloat32ArrayIterator082
     * @tc.desc Verify $_iterator yields 1 then 100 on 100-element array [1..100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [];
      for (let i = 0; i < 100; i++) {
        src.push(i + 1);
      }
      const arr = Float32Array.from(src);
      const it = arr.$_iterator();
      const iteratorValue092 = it.next().value;
      expect(iteratorValue092).assertEqual(1);
      for (let i = 0; i < 98; i++) {
        it.next();
      }
      const iteratorValue092Part2 = it.next().value;
      expect(iteratorValue092Part2).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_8300
     * @tc.name testFloat32ArrayIterator083
     * @tc.desc Verify $_iterator yields 0,1,2,3 sequentially on 10-element array [0..9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [];
      for (let i = 0; i < 10; i++) {
        src.push(i);
      }
      const arr = Float32Array.from(src);
      const it = arr.$_iterator();
      const iteratorValue093 = it.next().value;
      expect(iteratorValue093).assertEqual(0);
      const iteratorValue093Part2 = it.next().value;
      expect(iteratorValue093Part2).assertEqual(1);
      const iteratorValue093Part3 = it.next().value;
      expect(iteratorValue093Part3).assertEqual(2);
      const iteratorValue093Part4 = it.next().value;
      expect(iteratorValue093Part4).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_8400
     * @tc.name testFloat32ArrayIterator084
     * @tc.desc Verify $_iterator next() done true and value undefined on empty Float32Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.$_iterator();
      const r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_8500
     * @tc.name testFloat32ArrayIterator085
     * @tc.desc Verify empty ArrayBuffer view iterator done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Float32Array(buf);
      const it = arr.$_iterator();
      const iteratorValue096 = it.next().done;
      expect(iteratorValue096).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_8600
     * @tc.name testFloat32ArrayIterator086
     * @tc.desc Verify for loop on [NaN, NaN, NaN] count 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, Number.NaN, Number.NaN);
      const iterator = arr.$_iterator();
      expect(iterator.next().value).assertNaN();
      expect(iterator.next().value).assertNaN();
      expect(iterator.next().value).assertNaN();
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_8700
     * @tc.name testFloat32ArrayIterator087
     * @tc.desc Verify $_set(0, 16777217) truncates to 16777216 due to float32 precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 16777217);
      const it = arr.$_iterator();
      const iteratorValue098 = it.next().value;
      expect(iteratorValue098).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_8800
     * @tc.name testFloat32ArrayIterator088
     * @tc.desc Verify $_set(0, 1.0e40) overflows to +Infinity in float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 1.0e40);
      const it = arr.$_iterator();
      const iteratorValue099 = it.next().value;
      expect(iteratorValue099).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_8900
     * @tc.name testFloat32ArrayIterator089
     * @tc.desc Verify $_set(0, -1.0e40) overflows to -Infinity in float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, -1.0e40);
      const it = arr.$_iterator();
      const iteratorValue100 = it.next().value;
      expect(iteratorValue100).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_9000
     * @tc.name testFloat32ArrayIterator090
     * @tc.desc Verify $_set(0, 1.0e-46) underflows to +0 in float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 1.0e-46);
      const it = arr.$_iterator();
      const iteratorValue101 = it.next().value;
      expect(iteratorValue101).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_9100
     * @tc.name testFloat32ArrayIterator091
     * @tc.desc Verify $_set(0, 0.1) then iterator value equals arr.$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 0.1);
      const it = arr.$_iterator();
      const iteratorValue102 = it.next().value;
      expect(iteratorValue102).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_9200
     * @tc.name testFloat32ArrayIterator092
     * @tc.desc Verify $_set then iterator yields updated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.$_set(1, 99.0);
      const it = arr.$_iterator();
      const iteratorValue103 = it.next().value;
      expect(iteratorValue103).assertEqual(1.0);
      const iteratorValue103Part2 = it.next().value;
      expect(iteratorValue103Part2).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_9300
     * @tc.name testFloat32ArrayIterator093
     * @tc.desc Verify fill then iterator yields all same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.fill(7.0);
      const it = arr.$_iterator();
      const iteratorValue104 = it.next().value;
      expect(iteratorValue104).assertEqual(7.0);
      const iteratorValue104Part2 = it.next().value;
      expect(iteratorValue104Part2).assertEqual(7.0);
      const iteratorValue104Part3 = it.next().value;
      expect(iteratorValue104Part3).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_9400
     * @tc.name testFloat32ArrayIterator094
     * @tc.desc Verify reverse then iterator yields reversed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.reverse();
      const it = arr.$_iterator();
      const iteratorValue105 = it.next().value;
      expect(iteratorValue105).assertEqual(3.0);
      const iteratorValue105Part2 = it.next().value;
      expect(iteratorValue105Part2).assertEqual(2.0);
      const iteratorValue105Part3 = it.next().value;
      expect(iteratorValue105Part3).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_9500
     * @tc.name testFloat32ArrayIterator095
     * @tc.desc Verify sort then iterator yields sorted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      arr.sort();
      const it = arr.$_iterator();
      const iteratorValue106 = it.next().value;
      expect(iteratorValue106).assertEqual(1.0);
      const iteratorValue106Part2 = it.next().value;
      expect(iteratorValue106Part2).assertEqual(2.0);
      const iteratorValue106Part3 = it.next().value;
      expect(iteratorValue106Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_9600
     * @tc.name testFloat32ArrayIterator096
     * @tc.desc Verify copyWithin then iterator yields copied values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      arr.copyWithin(0, 2);
      const it = arr.$_iterator();
      const iteratorValue107 = it.next().value;
      expect(iteratorValue107).assertEqual(3.0);
      const iteratorValue107Part2 = it.next().value;
      expect(iteratorValue107Part2).assertEqual(4.0);
      const iteratorValue107Part3 = it.next().value;
      expect(iteratorValue107Part3).assertEqual(3.0);
      const iteratorValue107Part4 = it.next().value;
      expect(iteratorValue107Part4).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_9700
     * @tc.name testFloat32ArrayIterator097
     * @tc.desc Verify iterator reads the live mutated value of a not-yet-visited element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const it = arr.$_iterator();
      const iteratorValue108 = it.next().value;
      expect(iteratorValue108).assertEqual(1.0);
      arr.$_set(1, 99.0);
      const iteratorValue108Part2 = it.next().value;
      expect(iteratorValue108Part2).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_9800
     * @tc.name testFloat32ArrayIterator098
     * @tc.desc Verify iterator reads NaN written to a not-yet-visited element mid-iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const it = arr.$_iterator();
      const iteratorValue109 = it.next().value;
      expect(iteratorValue109).assertEqual(1.0);
      arr.$_set(1, Number.NaN);
      const iteratorValue109Part2 = it.next().value;
      expect(iteratorValue109Part2).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ITERATOR_9900
     * @tc.name testFloat32ArrayIterator099
     * @tc.desc Verify iterator next().value is a value copy unaffected by later mutation of the visited slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIterator099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const it = arr.$_iterator();
      const iteratorValue110 = it.next().value;
      expect(iteratorValue110).assertEqual(1.0);
      arr.$_set(0, 99.0);
      expect(iteratorValue110).assertEqual(1.0);
    });

  });
}
