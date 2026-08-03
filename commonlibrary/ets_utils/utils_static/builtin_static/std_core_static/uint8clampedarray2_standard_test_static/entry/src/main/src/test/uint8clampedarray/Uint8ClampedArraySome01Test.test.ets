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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint8ClampedArraySomeOneTest(): void {
  describe('Uint8ClampedArraySomeOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_0100
     * @tc.name testUint8ClampedArraySomeOne001
     * @tc.desc Verify predicate element, index, array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => i === 1 && a.length === 3 && e === 20);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_0200
     * @tc.name testUint8ClampedArraySomeOne002
     * @tc.desc Verify some always-true on [1,2,3] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_0300
     * @tc.name testUint8ClampedArraySomeOne003
     * @tc.desc Verify some always-false on [1,2,3] returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => false);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_0400
     * @tc.name testUint8ClampedArraySomeOne004
     * @tc.desc Verify some e===100 on [100,200,300] calls predicate once, returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200, 300]);
      let calls = 0;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { calls++; return e === 100; });
      expect(r).assertTrue();
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_0500
     * @tc.name testUint8ClampedArraySomeOne005
     * @tc.desc Verify some e===5 on [1,2,3,4,5] calls predicate 5 times, returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let calls = 0;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { calls++; return e === 5; });
      expect(r).assertTrue();
      expect(calls).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_0600
     * @tc.name testUint8ClampedArraySomeOne006
     * @tc.desc Verify some with predicate i===2 returns true on [5,6,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => i === 2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_0700
     * @tc.name testUint8ClampedArraySomeOne007
     * @tc.desc Verify some with predicate i===99 returns false on [5,6,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => i === 99);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_0800
     * @tc.name testUint8ClampedArraySomeOne008
     * @tc.desc Verify some predicate receives array parameter a === arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => a === arr);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_0900
     * @tc.name testUint8ClampedArraySomeOne009
     * @tc.desc Verify nested some on [1,2,3] with inner some e===6 on [5,6] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const inner = new Uint8ClampedArray([5, 6]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => inner.some((x: number, j: int, b: Uint8ClampedArray) => x === 6));
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_1000
     * @tc.name testUint8ClampedArraySomeOne010
     * @tc.desc Verify some e > threshold with captured variable threshold=2 returns true on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let threshold: int = 2;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e > threshold);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_1100
     * @tc.name testUint8ClampedArraySomeOne011
     * @tc.desc Verify some always-false predicate called 3 times on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let counter: int = 0;
      arr.some((e: number, i: int, a: Uint8ClampedArray) => { counter++; return false; });
      expect(counter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_1200
     * @tc.name testUint8ClampedArraySomeOne012
     * @tc.desc Verify some e > 25 returns true on [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e > 25);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_1300
     * @tc.name testUint8ClampedArraySomeOne013
     * @tc.desc Verify predicate <
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e < 15);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_1400
     * @tc.name testUint8ClampedArraySomeOne014
     * @tc.desc Verify predicate >=
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e >= 30);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_1500
     * @tc.name testUint8ClampedArraySomeOne015
     * @tc.desc Verify predicate <=
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e <= 10);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_1600
     * @tc.name testUint8ClampedArraySomeOne016
     * @tc.desc Verify some e !== 5 returns false on [5,5,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5, 5]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e !== 5);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_1700
     * @tc.name testUint8ClampedArraySomeOne017
     * @tc.desc Verify predicate &&
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e > 15 && e < 25);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_1800
     * @tc.name testUint8ClampedArraySomeOne018
     * @tc.desc Verify predicate ||
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 5 || e === 20);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_1900
     * @tc.name testUint8ClampedArraySomeOne019
     * @tc.desc Verify predicate !
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 1]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => !(e === 0));
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_2000
     * @tc.name testUint8ClampedArraySomeOne020
     * @tc.desc Verify some on empty array returns false, predicate never called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      let calls = 0;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { calls++; return true; });
      expect(r).assertFalse();
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_2100
     * @tc.name testUint8ClampedArraySomeOne021
     * @tc.desc Verify some on empty ArrayBuffer returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Uint8ClampedArray(buf);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_2200
     * @tc.name testUint8ClampedArraySomeOne022
     * @tc.desc Verify some e===0 returns true on [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_2300
     * @tc.name testUint8ClampedArraySomeOne023
     * @tc.desc Verify 255 some 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_2400
     * @tc.name testUint8ClampedArraySomeOne024
     * @tc.desc Verify some e===200 on 65535-element array with 200 at last index returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i: int = 0; i < 65534; i++) { src.push(0); }
      src.push(200);
      const arr = new Uint8ClampedArray(src);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 200);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_2500
     * @tc.name testUint8ClampedArraySomeOne025
     * @tc.desc Verify ArrayBuffer some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 10; arr[1] = 20; arr[2] = 30; arr[3] = 40;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 30);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_2600
     * @tc.name testUint8ClampedArraySomeOne026
     * @tc.desc Verify byteOffset some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const parent = new Uint8ClampedArray(buf);
      parent[0] = 1; parent[1] = 2; parent[2] = 3; parent[3] = 4;
      parent[4] = 5; parent[5] = 6; parent[6] = 7; parent[7] = 8;
      const sub = new Uint8ClampedArray(buf, 4, 4);
      const r: boolean = sub.some((e: number, i: int, a: Uint8ClampedArray) => e === 5);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_2700
     * @tc.name testUint8ClampedArraySomeOne027
     * @tc.desc Verify clamp 255 some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr[1] = 256;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_2800
     * @tc.name testUint8ClampedArraySomeOne028
     * @tc.desc Verify arr[1]=-1 clamps to 0, some e===0 returns true on [100,100,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 100, 100]);
      arr[1] = -1;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_2900
     * @tc.name testUint8ClampedArraySomeOne029
     * @tc.desc Verify clamp NaN 0 some 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 100, 100]);
      arr[0] = Number.NaN;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_3000
     * @tc.name testUint8ClampedArraySomeOne030
     * @tc.desc Verify clamp Infinity 255 some 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr[2] = Number.POSITIVE_INFINITY;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_3100
     * @tc.name testUint8ClampedArraySomeOne031
     * @tc.desc Verify clamp -Infinity 0 some 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr[0] = -Number.POSITIVE_INFINITY;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_3200
     * @tc.name testUint8ClampedArraySomeOne032
     * @tc.desc Verify arr[0]=0.5 clamps to 0, some e===0 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10]);
      arr[0] = 0.5;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_3300
     * @tc.name testUint8ClampedArraySomeOne033
     * @tc.desc Verify arr[0]=0.9 rounds to 1, some e===1 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10]);
      arr[0] = 0.9;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_3400
     * @tc.name testUint8ClampedArraySomeOne034
     * @tc.desc Verify arr[0]=127.5 half-even rounds to 128, some e===128 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr[0] = 127.5;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 128);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_3500
     * @tc.name testUint8ClampedArraySomeOne035
     * @tc.desc Verify arr[0]=128.5 half-even rounds to 128, some e===128 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr[0] = 128.5;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 128);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_3600
     * @tc.name testUint8ClampedArraySomeOne036
     * @tc.desc Verify some visited indices are [0,1,2] in order on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const seen: number[] = [];
      arr.some((e: number, i: int, a: Uint8ClampedArray) => { seen.push(i); return false; });
      expect(seen.length).assertEqual(3);
      expect(seen[0]).assertEqual(0);
      expect(seen[1]).assertEqual(1);
      expect(seen[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_3700
     * @tc.name testUint8ClampedArraySomeOne037
     * @tc.desc Verify some typeof e is number returns true on [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => typeof e === 'number');
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_3800
     * @tc.name testUint8ClampedArraySomeOne038
     * @tc.desc Verify some predicate throws RangeError propagates to catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.some((e: number, i: int, a: Uint8ClampedArray) => { throw new RangeError('rng'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_3900
     * @tc.name testUint8ClampedArraySomeOne039
     * @tc.desc Verify predicate TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.some((e: number, i: int, a: Uint8ClampedArray) => { throw new TypeError('te'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_4000
     * @tc.name testUint8ClampedArraySomeOne040
     * @tc.desc Verify some on empty array returns false, predicate not called even if would throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      let called = false;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { called = true; throw new Error('x'); });
      expect(r).assertFalse();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_4100
     * @tc.name testUint8ClampedArraySomeOne041
     * @tc.desc Verify some predicate throws at i===1, calls=2, propagates Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let count = 0;
      try {
        arr.some((e: number, i: int, a: Uint8ClampedArray) => { count++; if (i === 1) throw new Error('stop'); return false; });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_4200
     * @tc.name testUint8ClampedArraySomeOne042
     * @tc.desc Verify some predicate throws Error, array elements unchanged on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.some((e: number, i: int, a: Uint8ClampedArray) => { throw new Error('x'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_4300
     * @tc.name testUint8ClampedArraySomeOne043
     * @tc.desc Verify subarray some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      const r: boolean = sub.some((e: number, i: int, a: Uint8ClampedArray) => e === 3);
      expect(parent.length).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(4);
      expect(parent[4]).assertEqual(5);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_4400
     * @tc.name testUint8ClampedArraySomeOne044
     * @tc.desc Verify some mid true calls 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let calls: number = 0;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { calls++; return e === 3; });
      expect(r).assertTrue();
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_4500
     * @tc.name testUint8ClampedArraySomeOne045
     * @tc.desc Verify some index 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => i === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_4600
     * @tc.name testUint8ClampedArraySomeOne046
     * @tc.desc Verify some array param read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => i === 1 && a[0] === 10);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_4700
     * @tc.name testUint8ClampedArraySomeOne047
     * @tc.desc Verify some single hit 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 42);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_4800
     * @tc.name testUint8ClampedArraySomeOne048
     * @tc.desc Verify some single miss 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 99);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_4900
     * @tc.name testUint8ClampedArraySomeOne049
     * @tc.desc Verify some all 0 not 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e !== 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_5000
     * @tc.name testUint8ClampedArraySomeOne050
     * @tc.desc Verify some len 256 last 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      arr[255] = 7;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 7);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_5100
     * @tc.name testUint8ClampedArraySomeOne051
     * @tc.desc Verify some len 1024 mid 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      arr[512] = 9;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 9);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_5200
     * @tc.name testUint8ClampedArraySomeOne052
     * @tc.desc Verify some 1e9 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr[0] = 1e9;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_5300
     * @tc.name testUint8ClampedArraySomeOne053
     * @tc.desc Verify some -1e9 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      arr[0] = -1e9;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_5400
     * @tc.name testUint8ClampedArraySomeOne054
     * @tc.desc Verify some MAX_VALUE clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr[0] = Number.MAX_VALUE;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_5500
     * @tc.name testUint8ClampedArraySomeOne055
     * @tc.desc Verify some MIN_VALUE clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      arr[0] = Number.MIN_VALUE;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_5600
     * @tc.name testUint8ClampedArraySomeOne056
     * @tc.desc Verify some 127 hit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 0, 0]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 127);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_5700
     * @tc.name testUint8ClampedArraySomeOne057
     * @tc.desc Verify some 128 hit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128, 0, 0]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 128);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_5800
     * @tc.name testUint8ClampedArraySomeOne058
     * @tc.desc Verify some 0x7F hit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0x7F]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 127);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_5900
     * @tc.name testUint8ClampedArraySomeOne059
     * @tc.desc Verify some 0xFF hit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_6000
     * @tc.name testUint8ClampedArraySomeOne060
     * @tc.desc Verify some 0o17 hit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o17]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 15);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_6100
     * @tc.name testUint8ClampedArraySomeOne061
     * @tc.desc Verify some 0b11111111 hit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b11111111]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_6200
     * @tc.name testUint8ClampedArraySomeOne062
     * @tc.desc Verify some 1e2 hit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e2]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 100);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_6300
     * @tc.name testUint8ClampedArraySomeOne063
     * @tc.desc Verify some second true calls 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2, 3, 4]);
      let count: number = 0;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { count++; return e > 0; });
      expect(r).assertTrue();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_ONE_6400
     * @tc.name testUint8ClampedArraySomeOne064
     * @tc.desc Verify some single true calls 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7]);
      let count: number = 0;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { count++; return true; });
      expect(r).assertTrue();
      expect(count).assertEqual(1);
    });
  });
}
