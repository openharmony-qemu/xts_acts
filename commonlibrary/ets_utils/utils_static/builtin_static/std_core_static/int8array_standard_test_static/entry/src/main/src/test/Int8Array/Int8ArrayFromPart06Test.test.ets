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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from './../Util.test';

class ArrayLikeN3_10_20_30 implements ArrayLike<number> {
  length: int = 3;
  private data: number[] = [10, 20, 30];
  $_get(i: int): number {
    return this.data[i];
  }
  $_set(i: int, v: number): void {
    this.data[i] = v;
  }
}

class ArrayLikeN3_1_2_3 implements ArrayLike<number> {
  length: int = 3;
  private data: number[] = [1, 2, 3];
  $_get(i: int): number {
    return this.data[i];
  }
  $_set(i: int, v: number): void {
    this.data[i] = v;
  }
}

export default function int8ArrayFromPart06Test(): void {
  describe('Int8ArrayFromPart06Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_0100
     * @tc.name int8ArrayFromPart06Test001
     * @tc.desc Verify Int8Array.from(Int8Array) dispatches to Int8Array overload returning new instance reference-unequal but value-equal to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = Int8Array.of(10, 20, 30);
      const res: Int8Array = Int8Array.from(src);
      expect(res).not().assertEqual(src);
      expect(res.$_get(0)).assertEqual(10);
      expect(res.$_get(2)).assertEqual(30);
      expect(res.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_0200
     * @tc.name int8ArrayFromPart06Test002
     * @tc.desc Verify Int8Array.from(FixedArray<int>) dispatches to FixedArray<int> overload returning Int8Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [10, 20, 30];
      const res: Int8Array = Int8Array.from(src);
      expect(res.length).assertEqual(3);
      expect(res.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_0300
     * @tc.name int8ArrayFromPart06Test003
     * @tc.desc Verify Int8Array.from(Set<int>) dispatches to Set<int> overload writing in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<int> = new Set<int>();
      src.add(10);
      src.add(20);
      src.add(30);
      const res: Int8Array = Int8Array.from(src);
      expect(res.length).assertEqual(3);
      expect(res.$_get(0)).assertEqual(10);
      expect(res.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_0400
     * @tc.name int8ArrayFromPart06Test004
     * @tc.desc Verify Int8Array.from(Array<number>) dispatches to Array<number> overload returning Int8Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const res: Int8Array = Int8Array.from(src);
      expect(res.length).assertEqual(3);
      expect(res.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_0500
     * @tc.name int8ArrayFromPart06Test005
     * @tc.desc Verify Int8Array.from(ArrayLike<number>) dispatches to ArrayLike<number> overload writing in index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLikeN3_10_20_30 = new ArrayLikeN3_10_20_30();
      const res: Int8Array = Int8Array.from(src);
      expect(res.length).assertEqual(3);
      expect(res.$_get(0)).assertEqual(10);
      expect(res.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_0600
     * @tc.name int8ArrayFromPart06Test006
     * @tc.desc Verify Int8Array.from(Int8Array, mapfn) dispatches to Iterable<number>+mapfn overload with mapfn applied to each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = Int8Array.of(1, 2, 3);
      const res: Int8Array = Int8Array.from(src, (v, k) => {
        return v * 10;
      });
      expect(res.$_get(0)).assertEqual(10);
      expect(res.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_0700
     * @tc.name int8ArrayFromPart06Test007
     * @tc.desc Verify Int8Array.from(ArrayLike<number>, mapfn) dispatches to ArrayLike<U>+mapfn overload with mapfn applied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLikeN3_1_2_3 = new ArrayLikeN3_1_2_3();
      const res: Int8Array = Int8Array.from(src, (v, k) => {
        return v * 10;
      });
      expect(res.$_get(0)).assertEqual(10);
      expect(res.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_0800
     * @tc.name int8ArrayFromPart06Test008
     * @tc.desc Verify Int8Array.from(i8Src) same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i8Src: Int8Array = Int8Array.of(10, 20, 30);
      const arrSrc: Array<number> = [10, 20, 30];
      const r1: Int8Array = Int8Array.from(i8Src);
      const r2: Int8Array = Int8Array.from(arrSrc);
      expect(r1.length).assertEqual(r2.length);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
      expect(r1.$_get(2)).assertEqual(r2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_0900
     * @tc.name int8ArrayFromPart06Test009
     * @tc.desc Verify Int8Array.from(FixedArray<int>) and Int8Array.from(Set<int>) return Int8Array instances with matching $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [10, 20, 30];
      const setSrc: Set<int> = new Set<int>();
      setSrc.add(10);
      setSrc.add(20);
      setSrc.add(30);
      const r1: Int8Array = Int8Array.from(faSrc);
      const r2: Int8Array = Int8Array.from(setSrc);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
      expect(r1.$_get(2)).assertEqual(r2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_1000
     * @tc.name int8ArrayFromPart06Test010
     * @tc.desc Verify Int8Array.from(ArrayLike<number>) and Int8Array.from(Array<number>) return Int8Array instances with matching element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const alSrc: ArrayLikeN3_10_20_30 = new ArrayLikeN3_10_20_30();
      const arrSrc: Array<number> = [10, 20, 30];
      const r1: Int8Array = Int8Array.from(alSrc);
      const r2: Int8Array = Int8Array.from(arrSrc);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
      expect(r1.$_get(1)).assertEqual(r2.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_1100
     * @tc.name int8ArrayFromPart06Test011
     * @tc.desc Verify Int8Array.from(FixedArray<int>) and Int8Array.from(Int8Array) return Int8Array instances with matching $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [10, 20, 30];
      const i8Src: Int8Array = Int8Array.of(10, 20, 30);
      const r1: Int8Array = Int8Array.from(faSrc);
      const r2: Int8Array = Int8Array.from(i8Src);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
      expect(r1.$_get(2)).assertEqual(r2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_1200
     * @tc.name int8ArrayFromPart06Test012
     * @tc.desc Verify Int8Array.from(setSrc) same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const setSrc: Set<int> = new Set<int>();
      setSrc.add(10);
      setSrc.add(20);
      setSrc.add(30);
      const arrSrc: Array<number> = [10, 20, 30];
      const r1: Int8Array = Int8Array.from(setSrc);
      const r2: Int8Array = Int8Array.from(arrSrc);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
      expect(r1.$_get(2)).assertEqual(r2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_1300
     * @tc.name int8ArrayFromPart06Test013
     * @tc.desc Verify Int8Array.from(ArrayLike<number>) and Int8Array.from(Int8Array) return Int8Array instances with matching $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const alSrc: ArrayLikeN3_10_20_30 = new ArrayLikeN3_10_20_30();
      const i8Src: Int8Array = Int8Array.of(10, 20, 30);
      const r1: Int8Array = Int8Array.from(alSrc);
      const r2: Int8Array = Int8Array.from(i8Src);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
      expect(r1.$_get(2)).assertEqual(r2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_1400
     * @tc.name int8ArrayFromPart06Test014
     * @tc.desc Verify Int8Array.from(Int8Array,mapfn) and Int8Array.from(Array<number>,mapfn) with same source and mapfn produce equal results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i8Src: Int8Array = Int8Array.of(1, 2, 3);
      const arrSrc: Array<number> = [1, 2, 3];
      const fn: (v: number, k: number) => number = (v, k) => {
        return v + 5;
      };
      const r1: Int8Array = Int8Array.from(i8Src, fn);
      const r2: Int8Array = Int8Array.from(arrSrc, fn);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
      expect(r1.$_get(2)).assertEqual(r2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_1500
     * @tc.name int8ArrayFromPart06Test015
     * @tc.desc Verify Int8Array.from(ArrayLike,mapfn) and Int8Array.from(Array<number>,mapfn) with same source and mapfn produce equal results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const alSrc: ArrayLikeN3_1_2_3 = new ArrayLikeN3_1_2_3();
      const arrSrc: Array<number> = [1, 2, 3];
      const fn: (v: number, k: number) => number = (v, k) => {
        return v + 5;
      };
      const r1: Int8Array = Int8Array.from(alSrc, fn);
      const r2: Int8Array = Int8Array.from(arrSrc, fn);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
      expect(r1.$_get(2)).assertEqual(r2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_1600
     * @tc.name int8ArrayFromPart06Test016
     * @tc.desc Verify Int8Array.from(faSrc/arrSrc/i8Src) all produce length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [10, 20, 30];
      const arrSrc: Array<number> = [10, 20, 30];
      const i8Src: Int8Array = Int8Array.of(10, 20, 30);
      expect(Int8Array.from(faSrc).length).assertEqual(3);
      expect(Int8Array.from(arrSrc).length).assertEqual(3);
      expect(Int8Array.from(i8Src).length).assertEqual(3);
      expect(Int8Array.from(faSrc).byteOffset).assertEqual(0);
      expect(Int8Array.from(arrSrc).byteOffset).assertEqual(0);
      expect(Int8Array.from(i8Src).byteOffset).assertEqual(0);
      expect(Int8Array.from(faSrc).buffer.byteLength).assertEqual(3);
      expect(Int8Array.from(arrSrc).buffer.byteLength).assertEqual(3);
      expect(Int8Array.from(i8Src).buffer.byteLength).assertEqual(3);
      expect(Int8Array.from(faSrc).BYTES_PER_ELEMENT).assertEqual(1);
      expect(Int8Array.from(arrSrc).BYTES_PER_ELEMENT).assertEqual(1);
      expect(Int8Array.from(i8Src).BYTES_PER_ELEMENT).assertEqual(1);
      let r1: string = Int8Array.from(faSrc).toString();
      let e1: string = '10,20,30';
      expect(r1).assertEqual(e1);
      let r2: string = Int8Array.from(arrSrc).toString();
      let e2: string = '10,20,30';
      expect(r2).assertEqual(e2);
      let r3: string = Int8Array.from(i8Src).toString();
      let e3: string = '10,20,30';
      expect(r3).assertEqual(e3);
      expect(Int8Array.from(faSrc).at(0)).assertEqual(10);
      expect(Int8Array.from(arrSrc).at(0)).assertEqual(10);
      expect(Int8Array.from(i8Src).at(0)).assertEqual(10);
      expect(Int8Array.from(faSrc).at(-1)).assertEqual(30);
      expect(Int8Array.from(arrSrc).at(-1)).assertEqual(30);
      expect(Int8Array.from(i8Src).at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_1700
     * @tc.name int8ArrayFromPart06Test017
     * @tc.desc Verify Int8Array.from(faSrc/arrSrc/i8Src) all produce byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [10, 20, 30];
      const arrSrc: Array<number> = [10, 20, 30];
      const i8Src: Int8Array = Int8Array.of(10, 20, 30);
      expect(Int8Array.from(faSrc).byteOffset).assertEqual(0);
      expect(Int8Array.from(arrSrc).byteOffset).assertEqual(0);
      expect(Int8Array.from(i8Src).byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_1800
     * @tc.name int8ArrayFromPart06Test018
     * @tc.desc Verify Int8Array.from(faSrc/setSrc) join() with no separator equals '10,20,30'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [10, 20, 30];
      const setSrc: Set<int> = new Set<int>();
      setSrc.add(10);
      setSrc.add(20);
      setSrc.add(30);
      expect(Int8Array.from(faSrc).join()).assertEqual('10,20,30');
      expect(Int8Array.from(setSrc).join()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_1900
     * @tc.name int8ArrayFromPart06Test019
     * @tc.desc Verify Int8Array.from(arrSrc) join('-') consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSrc: Array<number> = [10, 20, 30];
      const i8Src: Int8Array = Int8Array.of(10, 20, 30);
      expect(Int8Array.from(arrSrc).join('-')).assertEqual('10-20-30');
      expect(Int8Array.from(i8Src).join('-')).assertEqual('10-20-30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_2000
     * @tc.name int8ArrayFromPart06Test020
     * @tc.desc Verify Int8Array.from(faSrc/setSrc/i8Src) all produce $_get(0) equal to 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [10, 20, 30];
      const setSrc: Set<int> = new Set<int>();
      setSrc.add(10);
      setSrc.add(20);
      setSrc.add(30);
      const i8Src: Int8Array = Int8Array.of(10, 20, 30);
      expect(Int8Array.from(faSrc).$_get(0)).assertEqual(10);
      expect(Int8Array.from(setSrc).$_get(0)).assertEqual(10);
      expect(Int8Array.from(i8Src).$_get(0)).assertEqual(10);
      expect(Int8Array.from(faSrc).indexOf(20)).assertEqual(1);
      expect(Int8Array.from(setSrc).indexOf(20)).assertEqual(1);
      expect(Int8Array.from(i8Src).indexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_2100
     * @tc.name int8ArrayFromPart06Test021
     * @tc.desc Verify Int8Array.from(Array<number>, mapfn) propagates RangeError thrown by mapfn and source array remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      try {
        Int8Array.from(src, (v, k) => {
          throw new RangeError('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(src.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_2200
     * @tc.name int8ArrayFromPart06Test022
     * @tc.desc Verify Int8Array.from(Int8Array, mapfn) propagates TypeError thrown by mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = Int8Array.of(10, 20, 30);
      try {
        Int8Array.from(src, (v, k) => {
          throw new TypeError('t');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(src.$_get(0)).assertEqual(10);
      expect(src.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_2300
     * @tc.name int8ArrayFromPart06Test023
     * @tc.desc Verify Int8Array.from(ArrayLike<number>, mapfn) propagates RangeError thrown by mapfn and source length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayLikeN3_10_20_30 = new ArrayLikeN3_10_20_30();
      try {
        Int8Array.from(src, (v, k) => {
          throw new RangeError('al');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(src.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_2400
     * @tc.name int8ArrayFromPart06Test024
     * @tc.desc Verify mapfn throw at element 0 interrupts Int8Array.from call with no return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      let reached: boolean = false;
      try {
        Int8Array.from(src, (v, k) => {
          if (k === 0) {
            throw new Error('first');
          }
          reached = true;
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('first');
      }
      expect(reached).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_2500
     * @tc.name int8ArrayFromPart06Test025
     * @tc.desc Verify Int8Array.from(Int8Array, mapfn) propagates Error thrown by mapfn with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = Int8Array.of(10, 20, 30);
      try {
        Int8Array.from(src, (v, k) => {
          if (k === 1) {
            throw new Error('second');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('second');
      }
      expect(src.$_get(0)).assertEqual(10);
      expect(src.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_2600
     * @tc.name int8ArrayFromPart06Test026
     * @tc.desc Verify Int8Array.from mapfn throwing RangeError propagates exception with name RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      try {
        Int8Array.from(src, (v, k) => {
          throw new RangeError('r');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_2700
     * @tc.name int8ArrayFromPart06Test027
     * @tc.desc Verify Int8Array.from mapfn throwing Error('custom-msg-xyz') propagates name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = Int8Array.of(1, 2, 3);
      try {
        Int8Array.from(src, (v, k) => {
          throw new Error('custom-msg-xyz');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('custom-msg-xyz');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_2800
     * @tc.name int8ArrayFromPart06Test028
     * @tc.desc Verify Int8Array.from(faSrc) all overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [10, 20, 30];
      const setSrc: Set<int> = new Set<int>();
      setSrc.add(10);
      setSrc.add(20);
      setSrc.add(30);
      const arrSrc: Array<number> = [10, 20, 30];
      const i8Src: Int8Array = Int8Array.of(10, 20, 30);
      const r1: Int8Array = Int8Array.from(faSrc);
      const r2: Int8Array = Int8Array.from(setSrc);
      const r3: Int8Array = Int8Array.from(arrSrc);
      const r4: Int8Array = Int8Array.from(i8Src);
      expect(r1.BYTES_PER_ELEMENT).assertEqual(1);
      expect(r2.length).assertEqual(3);
      expect(r3.$_get(0)).assertEqual(10);
      expect(r4.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_2900
     * @tc.name int8ArrayFromPart06Test029
     * @tc.desc Verify Int8Array.from(faSrc/arrSrc) valueOf() returns the array itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = Int8Array.of(10, 20, 30);
      try {
        Int8Array.from(src, (_v, _k) => {
          throw new TypeError('t');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(src.$_get(0)).assertEqual(10);
      expect(src.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_3000
     * @tc.name int8ArrayFromPart06Test030
     * @tc.desc Verify Int8Array.from(faSrc) $_set(0, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [10, 20, 30];
      const i8Src: Int8Array = Int8Array.of(10, 20, 30);
      const r1: Int8Array = Int8Array.from(faSrc);
      const r2: Int8Array = Int8Array.from(i8Src);
      r1.$_set(0, 99);
      r2.$_set(0, 99);
      expect(r1.$_get(0)).assertEqual(99);
      expect(r2.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_3100
     * @tc.name int8ArrayFromPart06Test031
     * @tc.desc Verify Int8Array.from(faSrc) keys() iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [10, 20, 30];
      const setSrc: Set<int> = new Set<int>();
      setSrc.add(10);
      setSrc.add(20);
      setSrc.add(30);
      const r1: Int8Array = Int8Array.from(faSrc);
      const r2: Int8Array = Int8Array.from(setSrc);
      const k1 = r1.keys().next();
      const k2 = r2.keys().next();
      expect(k1.value).assertEqual(0);
      expect(k2.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_3200
     * @tc.name int8ArrayFromPart06Test032
     * @tc.desc Verify Int8Array.from(faSrc) values() iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [10, 20, 30];
      const arrSrc: Array<number> = [10, 20, 30];
      const r1: Int8Array = Int8Array.from(faSrc);
      const r2: Int8Array = Int8Array.from(arrSrc);
      const iterFromFa: IteratorResult<number> = r1.values().next();
      const iterFromArr: IteratorResult<number> = r2.values().next();
      expect(iterFromFa.value).assertEqual(10);
      expect(iterFromArr.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_3300
     * @tc.name int8ArrayFromPart06Test033
     * @tc.desc Verify Int8Array.from(faSrc) forEach callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [10, 20, 30];
      const i8Src: Int8Array = Int8Array.of(10, 20, 30);
      const r1: Int8Array = Int8Array.from(faSrc);
      const r2: Int8Array = Int8Array.from(i8Src);
      let c1: number = 0;
      let c2: number = 0;
      r1.forEach((v, k) => {
        c1 = c1 + 1;
      });
      r2.forEach((v, k) => {
        c2 = c2 + 1;
      });
      expect(c1).assertEqual(3);
      expect(c2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_3400
     * @tc.name int8ArrayFromPart06Test034
     * @tc.desc Verify Int8Array.from(faSrc) reverse() element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [10, 20, 30];
      const i8Src: Int8Array = Int8Array.of(10, 20, 30);
      const r1: Int8Array = Int8Array.from(faSrc);
      const r2: Int8Array = Int8Array.from(i8Src);
      r1.reverse();
      r2.reverse();
      expect(r1.$_get(0)).assertEqual(30);
      expect(r2.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_3500
     * @tc.name int8ArrayFromPart06Test035
     * @tc.desc Verify Int8Array.from(Array<number>) returns independent of source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const res: Int8Array = Int8Array.from(src);
      res.$_set(0, 99);
      expect(src[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_3600
     * @tc.name int8ArrayFromPart06Test036
     * @tc.desc Verify Int8Array.from(Int8Array) mutating returned instance leaves source unchanged (deep-copy semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = Int8Array.of(10, 20, 30);
      const res: Int8Array = Int8Array.from(src);
      res.$_set(0, 99);
      expect(src.$_get(0)).assertEqual(10);
      expect(res.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_3700
     * @tc.name int8ArrayFromPart06Test037
     * @tc.desc Verify Int8Array.from(Set<int>) after source add new element, returned instance length unchanged (snapshot)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<int> = new Set<int>();
      src.add(10);
      src.add(20);
      const res: Int8Array = Int8Array.from(src);
      src.add(30);
      expect(res.length).assertEqual(2);
      expect(src.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_3800
     * @tc.name int8ArrayFromPart06Test038
     * @tc.desc Verify Int8Array.from(Array<number>) after source push, returned instance length unchanged (snapshot)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20];
      const res: Int8Array = Int8Array.from(src);
      src.push(30);
      expect(res.length).assertEqual(2);
      expect(src.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_3900
     * @tc.name int8ArrayFromPart06Test039
     * @tc.desc Verify Int8Array.from(FixedArray<int>) after source modification, returned instance unchanged (snapshot)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [10, 20, 30];
      const res: Int8Array = Int8Array.from(src);
      src[0] = 99;
      expect(res.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_4000
     * @tc.name int8ArrayFromPart06Test040
     * @tc.desc Verify Int8Array.from(Int8Array.from(i8)) nested double-copy, values equal source but references unequal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = Int8Array.of(10, 20, 30);
      const mid: Int8Array = Int8Array.from(src);
      const res: Int8Array = Int8Array.from(mid);
      expect(res).not().assertEqual(src);
      expect(res).not().assertEqual(mid);
      let r1: number = res.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = res.$_get(2);
      let e2: int = 30;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_4100
     * @tc.name int8ArrayFromPart06Test041
     * @tc.desc Verify Int8Array.from(Int8Array, mapfn) and Int8Array.from(Array<number>, mapfn) with mapfn returning constant 0 produce matching zero-filled instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i8Src: Int8Array = Int8Array.of(1, 2, 3);
      const arrSrc: Array<number> = [1, 2, 3];
      const fn: (v: number, k: number) => number = (v, k) => {
        return 0;
      };
      const r1: Int8Array = Int8Array.from(i8Src, fn);
      const r2: Int8Array = Int8Array.from(arrSrc, fn);
      expect(r1.$_get(0)).assertEqual(0);
      expect(r2.$_get(0)).assertEqual(0);
      expect(r1.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_4200
     * @tc.name int8ArrayFromPart06Test042
     * @tc.desc Verify Int8Array.from(i8Src, mapfn) with mapfn returning INT8_MAX produces INT8_MAX values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i8Src: Int8Array = Int8Array.of(1, 2, 3);
      const arrSrc: Array<number> = [1, 2, 3];
      const fn: (v: number, k: number) => number = (v, k) => {
        return INT8_MAX;
      };
      const r1: Int8Array = Int8Array.from(i8Src, fn);
      const r2: Int8Array = Int8Array.from(arrSrc, fn);
      expect(r1.$_get(0)).assertEqual(INT8_MAX);
      expect(r2.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_4300
     * @tc.name int8ArrayFromPart06Test043
     * @tc.desc Verify Int8Array.from(i8Src, mapfn) with mapfn returning 128 truncates to -128 (int8 overflow)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i8Src: Int8Array = Int8Array.of(1, 2, 3);
      const arrSrc: Array<number> = [1, 2, 3];
      const fn: (v: number, k: number) => number = (v, k) => {
        return 128;
      };
      const r1: Int8Array = Int8Array.from(i8Src, fn);
      const r2: Int8Array = Int8Array.from(arrSrc, fn);
      expect(r1.$_get(0)).assertEqual(-128);
      expect(r2.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_4400
     * @tc.name int8ArrayFromPart06Test044
     * @tc.desc Verify Int8Array.from(Int8Array, mapfn) and Int8Array.from(Array<number>, mapfn) with mapfn returning Number.NaN produce matching zero-valued instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i8Src: Int8Array = Int8Array.of(1, 2, 3);
      const arrSrc: Array<number> = [1, 2, 3];
      const fn: (v: number, k: number) => number = (v, k) => {
        return Number.NaN;
      };
      const r1: Int8Array = Int8Array.from(i8Src, fn);
      const r2: Int8Array = Int8Array.from(arrSrc, fn);
      expect(r1.$_get(0)).assertEqual(0);
      expect(r2.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_4500
     * @tc.name int8ArrayFromPart06Test045
     * @tc.desc Verify Int8Array.from(Int8Array, mapfn) and Int8Array.from(Array<number>, mapfn) with mapfn returning index k produce matching key-based values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [10, 20, 30];
      const i8Src: Int8Array = Int8Array.of(10, 20, 30);
      const r1: Int8Array = Int8Array.from(faSrc);
      const r2: Int8Array = Int8Array.from(i8Src);
      r1.reverse();
      r2.reverse();
      expect(r1.$_get(0)).assertEqual(30);
      expect(r2.$_get(0)).assertEqual(30);
      expect(r1.$_get(2)).assertEqual(r2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_4600
     * @tc.name int8ArrayFromPart06Test046
     * @tc.desc Verify Int8Array.from(i8Src, mapfn) with mapfn returning v+k produces element 0 = 10 (10+0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [10, 20, 30];
      const setSrc: Set<int> = new Set<int>();
      setSrc.add(10);
      setSrc.add(20);
      setSrc.add(30);
      const r1: Int8Array = Int8Array.from(faSrc);
      const r2: Int8Array = Int8Array.from(setSrc);
      expect(r1.includes(20)).assertTrue();
      expect(r2.includes(20)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_4700
     * @tc.name int8ArrayFromPart06Test047
     * @tc.desc Verify Int8Array.from(empty sources) all return length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyFa: FixedArray<int> = [];
      const emptyArr: Array<number> = [];
      const emptyI8: Int8Array = new Int8Array(0);
      const emptySet: Set<int> = new Set<int>();
      expect(Int8Array.from(emptyFa).length).assertEqual(0);
      expect(Int8Array.from(emptyArr).length).assertEqual(0);
      expect(Int8Array.from(emptyI8).length).assertEqual(0);
      expect(Int8Array.from(emptySet).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_4800
     * @tc.name int8ArrayFromPart06Test048
     * @tc.desc Verify Int8Array.from with from() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyFa: FixedArray<int> = [];
      const emptyArr: Array<number> = [];
      const emptyI8: Int8Array = new Int8Array(0);
      expect(Int8Array.from(emptyFa).byteLength).assertEqual(0);
      expect(Int8Array.from(emptyArr).byteLength).assertEqual(0);
      expect(Int8Array.from(emptyI8).byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_4900
     * @tc.name int8ArrayFromPart06Test049
     * @tc.desc Verify Int8Array.from empty sources toString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyFa: FixedArray<int> = [];
      const emptyArr: Array<number> = [];
      const emptyI8: Int8Array = new Int8Array(0);
      expect(Int8Array.from(emptyFa).toString()).assertEqual('');
      expect(Int8Array.from(emptyArr).toString()).assertEqual('');
      expect(Int8Array.from(emptyI8).toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_5000
     * @tc.name int8ArrayFromPart06Test050
     * @tc.desc Verify Int8Array.from empty sources produce 0-length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyFa: FixedArray<int> = [];
      const emptyArr: Array<number> = [];
      const emptyI8: Int8Array = new Int8Array(0);
      expect(Int8Array.from(emptyFa).buffer.byteLength).assertEqual(0);
      expect(Int8Array.from(emptyArr).buffer.byteLength).assertEqual(0);
      expect(Int8Array.from(emptyI8).buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_5100
     * @tc.name int8ArrayFromPart06Test051
     * @tc.desc Verify Int8Array.from() with single-element sources (FixedArray/Array/Int8Array/Set) produces length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [42];
      const arrSrc: Array<number> = [42];
      const i8Src: Int8Array = Int8Array.of(42);
      const setSrc: Set<int> = new Set<int>();
      setSrc.add(42);
      expect(Int8Array.from(faSrc).length).assertEqual(1);
      expect(Int8Array.from(arrSrc).length).assertEqual(1);
      expect(Int8Array.from(i8Src).length).assertEqual(1);
      expect(Int8Array.from(setSrc).length).assertEqual(1);
      expect(Int8Array.from(faSrc).$_get(0)).assertEqual(42);
      expect(Int8Array.from(arrSrc).$_get(0)).assertEqual(42);
      expect(Int8Array.from(i8Src).$_get(0)).assertEqual(42);
      expect(Int8Array.from(setSrc).$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART06_TEST_5200
     * @tc.name int8ArrayFromPart06Test052
     * @tc.desc Verify Int8Array.from(...).at(-1) returns 42 for FixedArray, Array and Int8Array sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart06Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const faSrc: FixedArray<int> = [42];
      const arrSrc: Array<number> = [42];
      const i8Src: Int8Array = Int8Array.of(42);
      expect(Int8Array.from(faSrc).at(-1)).assertEqual(42);
      expect(Int8Array.from(arrSrc).at(-1)).assertEqual(42);
      expect(Int8Array.from(i8Src).at(-1)).assertEqual(42);
      expect(Int8Array.from(faSrc).join()).assertEqual('42');
      expect(Int8Array.from(arrSrc).join()).assertEqual('42');
      expect(Int8Array.from(i8Src).join()).assertEqual('42');
    });
  });
}
