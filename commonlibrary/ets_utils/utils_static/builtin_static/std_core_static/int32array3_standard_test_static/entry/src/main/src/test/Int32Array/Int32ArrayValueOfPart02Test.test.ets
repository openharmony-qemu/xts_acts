'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
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

export default function int32ArrayValueOfPart02Test(): void {
  describe('int32ArrayValueOfPart02Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0010
     * @tc.name int32ArrayValueOfPart02Test001
     * @tc.desc Verify Int32Array.of() valueOf() ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      let r: Int32Array = a.valueOf();
      expect(r).assertEqual(a);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0020
     * @tc.name int32ArrayValueOfPart02Test002
     * @tc.desc Verify Int32Array.from mapFn valueOf() ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let a: Int32Array = Int32Array.from(src, (v: number) => v * 3);
      let r: Int32Array = a.valueOf();
      expect(r).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0030
     * @tc.name int32ArrayValueOfPart02Test003
     * @tc.desc Verify map valueOf() === map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let m: Int32Array = a.map((v: number, _i: int) => v + 1);
      let r: Int32Array = m.valueOf();
      expect(r).assertEqual(m);
      expect(r).not().assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0040
     * @tc.name int32ArrayValueOfPart02Test004
     * @tc.desc Verify filter valueOf() === filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1, 0, 1, 2);
      let f: Int32Array = a.filter((v: number, _i: int) => v > 0);
      let r: Int32Array = f.valueOf();
      expect(r).assertEqual(f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0050
     * @tc.name int32ArrayValueOfPart02Test005
     * @tc.desc Verify filter valueOf() ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let empty: Int32Array = a.filter((v: number, _i: int) => v < 0);
      let r: Int32Array = empty.valueOf();
      expect(r).assertEqual(empty);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0060
     * @tc.name int32ArrayValueOfPart02Test006
     * @tc.desc Verify subarray(begin,begin) valueOf() ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let z: Int32Array = a.subarray(2, 2);
      let r: Int32Array = z.valueOf();
      expect(r).assertEqual(z);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0070
     * @tc.name int32ArrayValueOfPart02Test007
     * @tc.desc Verify subarray valueOf() ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      let tail: Int32Array = a.subarray(3, 4);
      let r: Int32Array = tail.valueOf();
      expect(r).assertEqual(tail);
      expect(r.$_get(0)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0080
     * @tc.name int32ArrayValueOfPart02Test008
     * @tc.desc Verify ArrayBuffer valueOf() ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf0: ArrayBuffer = new ArrayBuffer(0);
      let a: Int32Array = new Int32Array(buf0, 0, 0);
      let r: Int32Array = a.valueOf();
      expect(r).assertEqual(a);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0090
     * @tc.name int32ArrayValueOfPart02Test009
     * @tc.desc Verify subarray subarray valueOf() ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 1, 2, 3, 4, 5);
      let s1: Int32Array = a.subarray(1);
      let s2: Int32Array = s1.subarray(1, 3);
      let r: Int32Array = s2.valueOf();
      expect(r).assertEqual(s2);
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayValueOfPart02Test010
     * @tc.desc Verify fill() valueOf() ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let f: Int32Array = a.fill(5);
      let r: Int32Array = f.valueOf();
      expect(r).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0110
     * @tc.name int32ArrayValueOfPart02Test011
     * @tc.desc Verify valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let b: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.valueOf()).assertEqual(a);
      expect(b.valueOf()).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0120
     * @tc.name int32ArrayValueOfPart02Test012
     * @tc.desc Verify slice valueOf() valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let c: Int32Array = a.slice();
      expect(c.valueOf()).assertEqual(c);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0130
     * @tc.name int32ArrayValueOfPart02Test013
     * @tc.desc Verify map valueOf() valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let m: Int32Array = a.map((v: number, _i: int) => v);
      expect(m.valueOf()).assertEqual(m);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0140
     * @tc.name int32ArrayValueOfPart02Test014
     * @tc.desc Verify subarray valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let s: Int32Array = a.subarray(1, 3);
      expect(s.valueOf()).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0150
     * @tc.name int32ArrayValueOfPart02Test015
     * @tc.desc Verify buffer valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      expect(a.valueOf()).assertEqual(a);
      expect(b.valueOf()).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0160
     * @tc.name int32ArrayValueOfPart02Test016
     * @tc.desc Verify 5 valueOf() ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(7, 8);
      let r: Int32Array = a.valueOf()
      .valueOf()
      .valueOf()
      .valueOf()
      .valueOf();
      expect(r).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0170
     * @tc.name int32ArrayValueOfPart02Test017
     * @tc.desc Verify valueOf().valueOf().$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(42);
      let v: number = a.valueOf().valueOf().$_get(0);
      expect(v).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0180
     * @tc.name int32ArrayValueOfPart02Test018
     * @tc.desc Verify valueOf().valueOf().$_set(0,v)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.valueOf().valueOf().$_set(0, 55);
      expect(a.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0190
     * @tc.name int32ArrayValueOfPart02Test019
     * @tc.desc Verify valueOf().valueOf().length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(6);
      let n: int = a.valueOf().valueOf().length;
      expect(n).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayValueOfPart02Test020
     * @tc.desc Verify valueOf().valueOf().buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      expect(a.valueOf().valueOf().buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0210
     * @tc.name int32ArrayValueOfPart02Test021
     * @tc.desc Verify 4 valueOf() length 0 ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let r: Int32Array = a.valueOf().valueOf().valueOf().valueOf();
      expect(r).assertEqual(a);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0220
     * @tc.name int32ArrayValueOfPart02Test022
     * @tc.desc Verify valueOf() fill(9) 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let r: Int32Array = a.valueOf();
      r.fill(9);
      expect(a.$_get(0)).assertEqual(9);
      expect(a.$_get(1)).assertEqual(9);
      expect(a.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0230
     * @tc.name int32ArrayValueOfPart02Test023
     * @tc.desc Verify valueOf() fill(-1) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.valueOf().fill(-1);
      expect(a.$_get(0)).assertEqual(-1);
      expect(a.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0240
     * @tc.name int32ArrayValueOfPart02Test024
     * @tc.desc Verify valueOf() reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      a.valueOf().reverse();
      expect(a.$_get(0)).assertEqual(4);
      expect(a.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0250
     * @tc.name int32ArrayValueOfPart02Test025
     * @tc.desc Verify valueOf() sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5, 3, 4, 1, 2);
      a.valueOf().sort();
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0260
     * @tc.name int32ArrayValueOfPart02Test026
     * @tc.desc Verify valueOf() set(typedArray, offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      let src: Int32Array = Int32Array.of(11, 22);
      a.valueOf().set(src, 2);
      expect(a.$_get(2)).assertEqual(11);
      expect(a.$_get(3)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0270
     * @tc.name int32ArrayValueOfPart02Test027
     * @tc.desc Verify valueOf() copyWithin()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      a.valueOf().copyWithin(0, 2, 4);
      expect(a.$_get(0)).assertEqual(30);
      expect(a.$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0280
     * @tc.name int32ArrayValueOfPart02Test028
     * @tc.desc Verify valueOf() valueOf().valueOf() fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.valueOf().valueOf().fill(77);
      expect(a.$_get(0)).assertEqual(77);
      expect(a.$_get(1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0290
     * @tc.name int32ArrayValueOfPart02Test029
     * @tc.desc Verify valueOf() preserves the view offset and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      let r: Object = a.valueOf();
      expect((r as Int32Array).byteOffset).assertEqual(4);
      expect((r as Int32Array).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayValueOfPart02Test030
     * @tc.desc Verify subarray valueOf() preserves elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let s: Object = a.subarray(0).valueOf();
      expect((s as Int32Array).length).assertEqual(3);
      expect((s as Int32Array).$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0310
     * @tc.name int32ArrayValueOfPart02Test031
     * @tc.desc Verify map valueOf() preserves mapped elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let m: Object = a.map((v: number, _i: int) => v).valueOf();
      expect((m as Int32Array).length).assertEqual(2);
      expect((m as Int32Array).$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0320
     * @tc.name int32ArrayValueOfPart02Test032
     * @tc.desc Verify filter valueOf() preserves filtered elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, -2, 3);
      let f: Object = a.filter((v: number, _i: int) => v > 0).valueOf();
      expect((f as Int32Array).length).assertEqual(2);
      expect((f as Int32Array).$_get(0)).assertEqual(1);
      expect((f as Int32Array).$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0330
     * @tc.name int32ArrayValueOfPart02Test033
     * @tc.desc Verify valueOf() Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let r: Object = a.valueOf();
      expect((r as Int32Array).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0340
     * @tc.name int32ArrayValueOfPart02Test034
     * @tc.desc Verify ArrayBuffer.isView valueOf() true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 8, 1);
      expect(ArrayBuffer.isView(a.valueOf())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0350
     * @tc.name int32ArrayValueOfPart02Test035
     * @tc.desc Verify ArrayBuffer.isView subarray valueOf() true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let s: Int32Array = a.subarray(1);
      expect(ArrayBuffer.isView(s.valueOf())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0360
     * @tc.name int32ArrayValueOfPart02Test036
     * @tc.desc Verify ArrayBuffer.isView map valueOf() true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let m: Int32Array = a.map((v: number, _i: int) => v);
      expect(ArrayBuffer.isView(m.valueOf())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0370
     * @tc.name int32ArrayValueOfPart02Test037
     * @tc.desc Verify Int32Array.of() valueOf().length === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      expect(a.valueOf().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0380
     * @tc.name int32ArrayValueOfPart02Test038
     * @tc.desc Verify length=7 4 valueOf().length === 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(7);
      expect(a.valueOf().length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0390
     * @tc.name int32ArrayValueOfPart02Test039
     * @tc.desc Verify 5 valueOf().length === 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      expect(a.valueOf().length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayValueOfPart02Test040
     * @tc.desc Verify ArrayBuffer 4 length=3 valueOf().length === 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 3);
      expect(a.valueOf().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0410
     * @tc.name int32ArrayValueOfPart02Test041
     * @tc.desc Verify subarray(1) valueOf().length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 1, 2, 3, 4, 5);
      let s: Int32Array = a.subarray(2);
      expect(s.valueOf().length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0420
     * @tc.name int32ArrayValueOfPart02Test042
     * @tc.desc Verify valueOf() $_set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let r: Int32Array = a.valueOf();
      r.$_set(0, 1);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0430
     * @tc.name int32ArrayValueOfPart02Test043
     * @tc.desc Verify valueOf() fill length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.valueOf().fill(0);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0440
     * @tc.name int32ArrayValueOfPart02Test044
     * @tc.desc Verify length=7 valueOf().byteLength === 28 7*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(7);
      expect(a.valueOf().byteLength).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0450
     * @tc.name int32ArrayValueOfPart02Test045
     * @tc.desc Verify 5 valueOf().byteLength === 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      expect(a.valueOf().byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0460
     * @tc.name int32ArrayValueOfPart02Test046
     * @tc.desc Verify ArrayBuffer 4 length=3 valueOf().byteLength === 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 3);
      expect(a.valueOf().byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0470
     * @tc.name int32ArrayValueOfPart02Test047
     * @tc.desc Verify subarray(2) 4 valueOf().byteLength === 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 1, 2, 3, 4, 5);
      expect(a.subarray(2).valueOf().byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0480
     * @tc.name int32ArrayValueOfPart02Test048
     * @tc.desc Verify valueOf() fill byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.valueOf().fill(7);
      expect(a.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0490
     * @tc.name int32ArrayValueOfPart02Test049
     * @tc.desc Verify ArrayBuffer 12 1 valueOf().byteOffset === 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 12, 1);
      expect(a.valueOf().byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayValueOfPart02Test050
     * @tc.desc Verify subarray(2) 0 valueOf().byteOffset === 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      expect(a.subarray(2).valueOf().byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0510
     * @tc.name int32ArrayValueOfPart02Test051
     * @tc.desc Verify subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 1, 2, 3, 4, 5);
      let s1: Int32Array = a.subarray(1);
      let s2: Int32Array = s1.subarray(2);
      expect(s2.valueOf().byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0520
     * @tc.name int32ArrayValueOfPart02Test052
     * @tc.desc Verify slice() valueOf().byteOffset === 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let c: Int32Array = a.slice(1, 3);
      expect(c.valueOf().byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0530
     * @tc.name int32ArrayValueOfPart02Test053
     * @tc.desc Verify map valueOf().byteOffset === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let m: Int32Array = a.map((v: number, _i: int) => v);
      expect(m.valueOf().byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0540
     * @tc.name int32ArrayValueOfPart02Test054
     * @tc.desc Verify filter valueOf().byteOffset === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1, 0, 1);
      let f: Int32Array = a.filter((v: number, _i: int) => v > 0);
      expect(f.valueOf().byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0550
     * @tc.name int32ArrayValueOfPart02Test055
     * @tc.desc Verify valueOf() $_set byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      a.valueOf().$_set(0, 123);
      expect(a.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0560
     * @tc.name int32ArrayValueOfPart02Test056
     * @tc.desc Verify of() valueOf().buffer buffer ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      expect(a.valueOf().buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0570
     * @tc.name int32ArrayValueOfPart02Test057
     * @tc.desc Verify ArrayBuffer 4 valueOf().buffer === buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      expect(a.valueOf().buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0580
     * @tc.name int32ArrayValueOfPart02Test058
     * @tc.desc Verify subarray valueOf().buffer === buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 1, 2, 3, 4, 5);
      let s1: Int32Array = a.subarray(1);
      let s2: Int32Array = s1.subarray(2);
      expect(s2.valueOf().buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0590
     * @tc.name int32ArrayValueOfPart02Test059
     * @tc.desc Verify valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 0, 4);
      a.valueOf().$_set(0, 77);
      expect(b.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayValueOfPart02Test060
     * @tc.desc Verify valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      a.$_set(0, 0);
      b.valueOf().$_set(0, 333);
      let probe: Int32Array = new Int32Array(buf, 0, 4);
      expect(probe.$_get(2)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0610
     * @tc.name int32ArrayValueOfPart02Test061
     * @tc.desc Verify subarray valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let s: Int32Array = a.subarray(1, 3);
      s.valueOf().$_set(0, 99);
      expect(a.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0620
     * @tc.name int32ArrayValueOfPart02Test062
     * @tc.desc Verify subarray fill valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      let s: Int32Array = a.subarray(1, 4);
      s.valueOf().fill(8);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(8);
      expect(a.$_get(3)).assertEqual(8);
      expect(a.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0630
     * @tc.name int32ArrayValueOfPart02Test063
     * @tc.desc Verify slice valueOf().buffer !== buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let c: Int32Array = a.slice();
      expect(c.valueOf().buffer).not().assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0640
     * @tc.name int32ArrayValueOfPart02Test064
     * @tc.desc Verify map valueOf().buffer !== buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let m: Int32Array = a.map((v: number, _i: int) => v);
      expect(m.valueOf().buffer).not().assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0650
     * @tc.name int32ArrayValueOfPart02Test065
     * @tc.desc Verify filter valueOf().buffer !== buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1, 1);
      let f: Int32Array = a.filter((v: number, _i: int) => v > 0);
      expect(f.valueOf().buffer).not().assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0660
     * @tc.name int32ArrayValueOfPart02Test066
     * @tc.desc Verify valueOf().buffer.byteLength === buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let a: Int32Array = new Int32Array(buf, 8, 3);
      expect(a.valueOf().buffer.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0670
     * @tc.name int32ArrayValueOfPart02Test067
     * @tc.desc Verify new Int32Array(other.valueOf())
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let c: Int32Array = new Int32Array(a.valueOf());
      c.$_set(0, 999);
      expect(a.$_get(0)).assertEqual(1);
      expect(c.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0680
     * @tc.name int32ArrayValueOfPart02Test068
     * @tc.desc Verify ArrayBuffer valueOf().BYTES_PER_ELEMENT === 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 8, 1);
      expect(a.valueOf().BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0690
     * @tc.name int32ArrayValueOfPart02Test069
     * @tc.desc Verify subarray valueOf().BYTES_PER_ELEMENT === 4; Also verify verify valueOf().indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.subarray(1).valueOf().BYTES_PER_ELEMENT).assertEqual(4);

      {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.valueOf().indexOf(99)).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayValueOfPart02Test070
     * @tc.desc Verify valueOf().BYTES_PER_ELEMENT === 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      expect(a.valueOf().BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0710
     * @tc.name int32ArrayValueOfPart02Test071
     * @tc.desc Verify 0 valueOf() $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      expect(a.valueOf().$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0720
     * @tc.name int32ArrayValueOfPart02Test072
     * @tc.desc Verify of() valueOf().BYTES_PER_ELEMENT === 4; Also verify verify 1 valueOf() $_get(0) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      expect(a.valueOf().$_get(0)).assertEqual(1);

      {
      let a: Int32Array = Int32Array.of(1);
      expect(a.valueOf().BYTES_PER_ELEMENT).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0730
     * @tc.name int32ArrayValueOfPart02Test073
     * @tc.desc Verify -1 valueOf() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1);
      expect(a.valueOf().$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0740
     * @tc.name int32ArrayValueOfPart02Test074
     * @tc.desc Verify INT_MAX 2147483647 valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483647);
      expect(a.valueOf().$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0750
     * @tc.name int32ArrayValueOfPart02Test075
     * @tc.desc Verify INT_MIN -2147483648 valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-2147483648);
      expect(a.valueOf().$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0760
     * @tc.name int32ArrayValueOfPart02Test076
     * @tc.desc Verify valueOf()[0] $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(11, 22, 33);
      let r: Int32Array = a.valueOf();
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(1)).assertEqual(22);
      expect(r.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0770
     * @tc.name int32ArrayValueOfPart02Test077
     * @tc.desc Verify valueOf().$_get(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      expect(a.valueOf().$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0780
     * @tc.name int32ArrayValueOfPart02Test078
     * @tc.desc Verify valueOf() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf, 0, 4);
      full.$_set(0, 10);
      full.$_set(1, 20);
      full.$_set(2, 30);
      full.$_set(3, 40);
      let view: Int32Array = new Int32Array(buf, 8, 2);
      expect(view.valueOf().$_get(0)).assertEqual(30);
      expect(view.valueOf().$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0790
     * @tc.name int32ArrayValueOfPart02Test079
     * @tc.desc Verify valueOf() Number.NaN ToInt32 0 $_get 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.valueOf().$_set(0, Number.NaN);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayValueOfPart02Test080
     * @tc.desc Verify valueOf() 0.9 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.valueOf().$_set(0, 0.9);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0810
     * @tc.name int32ArrayValueOfPart02Test081
     * @tc.desc Verify valueOf() -0.9 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.valueOf().$_set(0, -0.9);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0820
     * @tc.name int32ArrayValueOfPart02Test082
     * @tc.desc Verify valueOf().forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sum: number = 0;
      a.valueOf().forEach((v: number, _i: int) => {
        sum = sum + v;
      });
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0830
     * @tc.name int32ArrayValueOfPart02Test083
     * @tc.desc Verify valueOf().forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let cnt: int = 0;
      a.valueOf().forEach((_v: number, _i: int) => {
        cnt = cnt + 1;
      });
      expect(cnt).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0840
     * @tc.name int32ArrayValueOfPart02Test084
     * @tc.desc Verify valueOf().every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.valueOf().every((v: number, _i: int) => v > 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0850
     * @tc.name int32ArrayValueOfPart02Test085
     * @tc.desc Verify valueOf().every false v > 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 0, 3);
      expect(a.valueOf().every((v: number, _i: int) => v > 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0860
     * @tc.name int32ArrayValueOfPart02Test086
     * @tc.desc Verify valueOf().every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      expect(a.valueOf().every((_v: number, _i: int) => false)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0870
     * @tc.name int32ArrayValueOfPart02Test087
     * @tc.desc Verify valueOf().some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, -2, 3);
      expect(a.valueOf().some((v: number, _i: int) => v < 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0880
     * @tc.name int32ArrayValueOfPart02Test088
     * @tc.desc Verify valueOf().some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      expect(a.valueOf().some((_v: number, _i: int) => true)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0890
     * @tc.name int32ArrayValueOfPart02Test089
     * @tc.desc Verify valueOf().reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sum: number = a.valueOf().reduce((acc: number, v: number) => acc + v, 0);
      expect(Double.toInt(sum)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayValueOfPart02Test090
     * @tc.desc Verify valueOf().indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5, 6, 7, 8);
      expect(a.valueOf().indexOf(7)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0910
     * @tc.name int32ArrayValueOfPart02Test091
     * @tc.desc Verify valueOf().includes true; Also verify verify valueOf().includes false; Also verify verify valueOf().join(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.valueOf().includes(20)).assertTrue();

      {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.valueOf().includes(99)).assertFalse();
      }

      {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.valueOf().join(',')).assertEqual('10,20,30');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0920
     * @tc.name int32ArrayValueOfPart02Test092
     * @tc.desc Verify valueOf().join(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(42);
      expect(a.valueOf().join(',')).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0930
     * @tc.name int32ArrayValueOfPart02Test093
     * @tc.desc Verify valueOf().join(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      expect(a.valueOf().join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0940
     * @tc.name int32ArrayValueOfPart02Test094
     * @tc.desc Verify for valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = a.valueOf();
      let s: number = 0;
      for (let i: int = 0; i < r.length; i++) {
        s = s + r.$_get(i);
      }
      expect(s).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0950
     * @tc.name int32ArrayValueOfPart02Test095
     * @tc.desc Verify 10 valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(7, 8, 9);
      for (let i: int = 0; i < 10; i++) {
        a.valueOf();
      }
      expect(a.$_get(0)).assertEqual(7);
      expect(a.$_get(1)).assertEqual(8);
      expect(a.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0960
     * @tc.name int32ArrayValueOfPart02Test096
     * @tc.desc Verify valueOf() byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let before: int = a.byteLength;
      for (let i: int = 0; i < 5; i++) {
        a.valueOf();
      }
      expect(a.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0970
     * @tc.name int32ArrayValueOfPart02Test097
     * @tc.desc Verify valueOf() byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let a: Int32Array = new Int32Array(buf, 12, 2);
      let before: int = a.byteOffset;
      for (let i: int = 0; i < 5; i++) {
        a.valueOf();
      }
      expect(a.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0980
     * @tc.name int32ArrayValueOfPart02Test098
     * @tc.desc Verify valueOf() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let b0: ArrayBuffer = a.buffer;
      for (let i: int = 0; i < 5; i++) {
        a.valueOf();
      }
      expect(a.buffer).assertEqual(b0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_0990
     * @tc.name int32ArrayValueOfPart02Test099
     * @tc.desc Verify valueOf() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      a.valueOf();
      a.$_set(0, 100);
      expect(a.$_get(0)).assertEqual(100);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayValueOfPart02Test100
     * @tc.desc Verify subarray valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let s: Int32Array = a.subarray(1, 3);
      s.valueOf();
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART02_TEST_MINDMAP_1010
     * @tc.name int32ArrayValueOfPart02Test101
     * @tc.desc Verify ArrayBuffer valueOf() byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart02Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 16, 2);
      a.valueOf();
      expect(b.byteOffset).assertEqual(16);
      expect(b.length).assertEqual(2);
    });
  });
}
