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
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArrayFrom3Test(): void {
  describe('Float32ArrayFrom3Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0010
     * @tc.name testFloat32ArrayFromTHREE001
     * @tc.desc Verify arity 1 passing FixedArray<number> dispatches to the single-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [0x10, 0b1010, -1.0];
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0020
     * @tc.name testFloat32ArrayFromTHREE002
     * @tc.desc Verify arity 1 passing Array<number> dispatches to the single-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [10.0, 20.0];
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0030
     * @tc.name testFloat32ArrayFromTHREE003
     * @tc.desc Verify arity 1 passing Float32Array dispatches to the single-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0040
     * @tc.name testFloat32ArrayFromTHREE004
     * @tc.desc Verify arity 1 passing Set<number> dispatches to the single-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(7.0);
      src.add(8.0);
      src.add(9.0);
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0050
     * @tc.name testFloat32ArrayFromTHREE005
     * @tc.desc Verify arity 1 passing ArrayLike<number> dispatches to the single-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<number> = Float32Array.of(0x10, 0b1010, -1.0);
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0060
     * @tc.name testFloat32ArrayFromTHREE006
     * @tc.desc Verify arity 1 passing Iterable<number> dispatches to the Iterable single-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(11.0);
      s.add(12.0);
      let src: Iterable<number> = s;
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0070
     * @tc.name testFloat32ArrayFromTHREE007
     * @tc.desc Verify arity 2 passing Iterable<number> and mapfn dispatches to the Iterable optional mapfn overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(3.0);
      s.add(4.0);
      let src: Iterable<number> = s;
      let r = Float32Array.from(src, (v: number, k: number) => v + 10);
      expect(r.$_get(0)).assertEqual(13.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0080
     * @tc.name testFloat32ArrayFromTHREE008
     * @tc.desc Verify Array<number> dispatches and preserves element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [10.0, 20.0];
      let r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(10.0);
      expect(r.$_get(1)).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0090
     * @tc.name testFloat32ArrayFromTHREE009
     * @tc.desc Verify ArrayLike<number> dispatches and reads elements by length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<number> = Float32Array.of(0x10, 0b1010, -1.0);
      let r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0100
     * @tc.name testFloat32ArrayFromTHREE010
     * @tc.desc Verify Iterable<number> dispatches and writes in iteration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(11.0);
      s.add(12.0);
      let src: Iterable<number> = s;
      let r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(11.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0110
     * @tc.name testFloat32ArrayFromTHREE011
     * @tc.desc Verify the same Float32Array instance dispatches with Float32Array static type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let r = Float32Array.from(f);
      expect(r.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0120
     * @tc.name testFloat32ArrayFromTHREE012
     * @tc.desc Verify the same Float32Array instance dispatches to the ArrayLike overload with ArrayLike<number> static type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let al: ArrayLike<number> = f;
      let r = Float32Array.from(al);
      expect(r.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0130
     * @tc.name testFloat32ArrayFromTHREE013
     * @tc.desc Verify the same Set instance dispatches to the Iterable overload with Iterable<number> static type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(21.0);
      s.add(22.0);
      let it: Iterable<number> = s;
      let r = Float32Array.from(it);
      expect(r.$_get(1)).assertEqual(22.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0140
     * @tc.name testFloat32ArrayFromTHREE014
     * @tc.desc Verify the same Float32Array instance dispatches to the Iterable overload with Iterable<number> static type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float32Array = new Float32Array([31.0, 32.0]);
      let it: Iterable<number> = f;
      let r = Float32Array.from(it);
      expect(r.$_get(0)).assertEqual(31.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0150
     * @tc.name testFloat32ArrayFromTHREE015
     * @tc.desc Verify empty FixedArray dispatch returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [];
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0160
     * @tc.name testFloat32ArrayFromTHREE016
     * @tc.desc Verify empty Array dispatch returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [];
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0170
     * @tc.name testFloat32ArrayFromTHREE017
     * @tc.desc Verify empty Float32Array dispatch returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array(0);
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0180
     * @tc.name testFloat32ArrayFromTHREE018
     * @tc.desc Verify empty Set dispatch returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0190
     * @tc.name testFloat32ArrayFromTHREE019
     * @tc.desc Verify empty ArrayLike dispatch returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<number> = new Float32Array(0);
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0200
     * @tc.name testFloat32ArrayFromTHREE020
     * @tc.desc Verify empty Iterable dispatch returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      let src: Iterable<number> = s;
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0210
     * @tc.name testFloat32ArrayFromTHREE021
     * @tc.desc Verify single-element FixedArray dispatch returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [42.0];
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0220
     * @tc.name testFloat32ArrayFromTHREE022
     * @tc.desc Verify single-element Set dispatch returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(99.0);
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0230
     * @tc.name testFloat32ArrayFromTHREE023
     * @tc.desc Verify single-element ArrayLike dispatch returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<number> = new Float32Array([77.0]);
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0240
     * @tc.name testFloat32ArrayFromTHREE024
     * @tc.desc Verify Set insertion order 3,1,2 dispatch has last element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(3.0);
      src.add(1.0);
      src.add(2.0);
      let r = Float32Array.from(src);
      expect(r.$_get(2)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0250
     * @tc.name testFloat32ArrayFromTHREE025
     * @tc.desc Verify Float32Array with negative values dispatch preserves negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([-1.5, 2.5]);
      let r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(-1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0260
     * @tc.name testFloat32ArrayFromTHREE026
     * @tc.desc Verify FixedArray overload default byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0];
      let r = Float32Array.from(src);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0270
     * @tc.name testFloat32ArrayFromTHREE027
     * @tc.desc Verify Array overload default byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0];
      let r = Float32Array.from(src);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0280
     * @tc.name testFloat32ArrayFromTHREE028
     * @tc.desc Verify Float32Array overload default byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([1.0, 2.0]);
      let r = Float32Array.from(src);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0290
     * @tc.name testFloat32ArrayFromTHREE029
     * @tc.desc Verify Set overload default byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(1.0);
      let r = Float32Array.from(src);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0300
     * @tc.name testFloat32ArrayFromTHREE030
     * @tc.desc Verify ArrayLike overload default byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<number> = new Float32Array([1.0, 2.0]);
      let r = Float32Array.from(src);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0310
     * @tc.name testFloat32ArrayFromTHREE031
     * @tc.desc Verify Iterable overload default byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1.0);
      let src: Iterable<number> = s;
      let r = Float32Array.from(src);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0320
     * @tc.name testFloat32ArrayFromTHREE032
     * @tc.desc Verify FixedArray overload default byteLength equals length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [0x10, 0b1010, -1.0];
      let r = Float32Array.from(src);
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0330
     * @tc.name testFloat32ArrayFromTHREE033
     * @tc.desc Verify Array overload default byteLength equals length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0];
      let r = Float32Array.from(src);
      expect(r.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0340
     * @tc.name testFloat32ArrayFromTHREE034
     * @tc.desc Verify Float32Array overload default byteLength equals length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let r = Float32Array.from(src);
      expect(r.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0350
     * @tc.name testFloat32ArrayFromTHREE035
     * @tc.desc Verify Set overload default byteLength equals size*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(1.0);
      src.add(2.0);
      let r = Float32Array.from(src);
      expect(r.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0360
     * @tc.name testFloat32ArrayFromTHREE036
     * @tc.desc Verify ArrayLike overload default byteLength equals length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<number> = new Float32Array([1.0, 2.0]);
      let r = Float32Array.from(src);
      expect(r.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0370
     * @tc.name testFloat32ArrayFromTHREE037
     * @tc.desc Verify Iterable overload default byteLength equals length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1.0);
      s.add(2.0);
      s.add(3.0);
      let src: Iterable<number> = s;
      let r = Float32Array.from(src);
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0380
     * @tc.name testFloat32ArrayFromTHREE038
     * @tc.desc Verify FixedArray overload default length equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [0x10, 0b1010, -1.0, 0.0, 1000000.0];
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0390
     * @tc.name testFloat32ArrayFromTHREE039
     * @tc.desc Verify Array overload default length equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [0x10, 0b1010, -1.0];
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0400
     * @tc.name testFloat32ArrayFromTHREE040
     * @tc.desc Verify Float32Array overload default length equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array(6);
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0410
     * @tc.name testFloat32ArrayFromTHREE041
     * @tc.desc Verify Set overload default length equals source size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(1.0);
      src.add(2.0);
      src.add(3.0);
      src.add(4.0);
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0420
     * @tc.name testFloat32ArrayFromTHREE042
     * @tc.desc Verify ArrayLike overload default length equals source length property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<number> = new Float32Array(7);
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0430
     * @tc.name testFloat32ArrayFromTHREE043
     * @tc.desc Verify Iterable overload default length equals iteration count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1.0);
      s.add(2.0);
      let src: Iterable<number> = s;
      let r = Float32Array.from(src);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0440
     * @tc.name testFloat32ArrayFromTHREE044
     * @tc.desc Verify FixedArray overload result buffer is an ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0];
      let r = Float32Array.from(src);
      expect(r.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0450
     * @tc.name testFloat32ArrayFromTHREE045
     * @tc.desc Verify Array overload result buffer is an ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0];
      let r = Float32Array.from(src);
      expect(r.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0460
     * @tc.name testFloat32ArrayFromTHREE046
     * @tc.desc Verify Float32Array overload result buffer is an ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([1.0, 2.0]);
      let r = Float32Array.from(src);
      expect(r.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0470
     * @tc.name testFloat32ArrayFromTHREE047
     * @tc.desc Verify Set overload result buffer is an ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(1.0);
      let r = Float32Array.from(src);
      expect(r.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0480
     * @tc.name testFloat32ArrayFromTHREE048
     * @tc.desc Verify ArrayLike overload result buffer is an ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<number> = new Float32Array([1.0, 2.0]);
      let r = Float32Array.from(src);
      expect(r.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0490
     * @tc.name testFloat32ArrayFromTHREE049
     * @tc.desc Verify Iterable overload result buffer is an ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1.0);
      let src: Iterable<number> = s;
      let r = Float32Array.from(src);
      expect(r.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0500
     * @tc.name testFloat32ArrayFromTHREE050
     * @tc.desc Verify FixedArray overload return value is a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0];
      let r = Float32Array.from(src);
      expect(r instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0510
     * @tc.name testFloat32ArrayFromTHREE051
     * @tc.desc Verify Array overload return value is a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0];
      let r = Float32Array.from(src);
      expect(r instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0520
     * @tc.name testFloat32ArrayFromTHREE052
     * @tc.desc Verify Float32Array overload return value is a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([1.0, 2.0]);
      let r = Float32Array.from(src);
      expect(r instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0530
     * @tc.name testFloat32ArrayFromTHREE053
     * @tc.desc Verify Set overload return value is a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(1.0);
      let r = Float32Array.from(src);
      expect(r instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0540
     * @tc.name testFloat32ArrayFromTHREE054
     * @tc.desc Verify ArrayLike overload return value is a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<number> = new Float32Array([1.0, 2.0]);
      let r = Float32Array.from(src);
      expect(r instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0550
     * @tc.name testFloat32ArrayFromTHREE055
     * @tc.desc Verify Iterable overload return value is a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1.0);
      let src: Iterable<number> = s;
      let r = Float32Array.from(src);
      expect(r instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0560
     * @tc.name testFloat32ArrayFromTHREE056
     * @tc.desc Verify FixedArray overload toString contains element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0];
      let r = Float32Array.from(src);
      expect(r.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0570
     * @tc.name testFloat32ArrayFromTHREE057
     * @tc.desc Verify Array overload toString contains element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [3.0, 4.0];
      let r = Float32Array.from(src);
      expect(r.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0580
     * @tc.name testFloat32ArrayFromTHREE058
     * @tc.desc Verify Float32Array overload toString contains element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([5.0, 6.0]);
      let r = Float32Array.from(src);
      expect(r.toString()).assertEqual('5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0590
     * @tc.name testFloat32ArrayFromTHREE059
     * @tc.desc Verify Set overload toString concatenates in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(7.0);
      src.add(8.0);
      let r = Float32Array.from(src);
      expect(r.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0600
     * @tc.name testFloat32ArrayFromTHREE060
     * @tc.desc Verify ArrayLike overload toString contains element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<number> = new Float32Array([9.0, 10.0]);
      let r = Float32Array.from(src);
      expect(r.toString()).assertEqual('9,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0610
     * @tc.name testFloat32ArrayFromTHREE061
     * @tc.desc Verify Iterable overload toString contains element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(11.0);
      s.add(12.0);
      let src: Iterable<number> = s;
      let r = Float32Array.from(src);
      expect(r.toString()).assertEqual('11,12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0620
     * @tc.name testFloat32ArrayFromTHREE062
     * @tc.desc Verify FixedArray overload values iterator first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0];
      let r = Float32Array.from(src);
      const it = r.values();
      const n = it.next();
      expect(n.value).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0630
     * @tc.name testFloat32ArrayFromTHREE063
     * @tc.desc Verify Array overload values iterator first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [10.0, 20.0];
      let r = Float32Array.from(src);
      const it = r.values();
      const n = it.next();
      expect(n.value).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0640
     * @tc.name testFloat32ArrayFromTHREE064
     * @tc.desc Verify Float32Array overload values iterator first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([5.0, 6.0]);
      let r = Float32Array.from(src);
      const it = r.values();
      const n = it.next();
      expect(n.value).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0650
     * @tc.name testFloat32ArrayFromTHREE065
     * @tc.desc Verify Set overload values iterator first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(7.0);
      src.add(8.0);
      let r = Float32Array.from(src);
      const it = r.values();
      const n = it.next();
      expect(n.value).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0660
     * @tc.name testFloat32ArrayFromTHREE066
     * @tc.desc Verify ArrayLike overload values iterator first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<number> = new Float32Array([4.0, 5.0]);
      let r = Float32Array.from(src);
      const it = r.values();
      const n = it.next();
      expect(n.value).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0670
     * @tc.name testFloat32ArrayFromTHREE067
     * @tc.desc Verify Iterable overload values iterator first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(11.0);
      s.add(12.0);
      let src: Iterable<number> = s;
      let r = Float32Array.from(src);
      const it = r.values();
      const n = it.next();
      expect(n.value).assertEqual(11.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0680
     * @tc.name testFloat32ArrayFromTHREE068
     * @tc.desc Verify FixedArray overload result can be written and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0];
      let r = Float32Array.from(src);
      r.$_set(0, 99.0);
      expect(r.$_get(0)).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0690
     * @tc.name testFloat32ArrayFromTHREE069
     * @tc.desc Verify Array overload result can be written and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0];
      let r = Float32Array.from(src);
      r.$_set(1, 88.0);
      expect(r.$_get(1)).assertEqual(88.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0700
     * @tc.name testFloat32ArrayFromTHREE070
     * @tc.desc Verify Float32Array overload result can be written and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([1.0, 2.0]);
      let r = Float32Array.from(src);
      r.$_set(0, 77.0);
      expect(r.$_get(0)).assertEqual(77.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0710
     * @tc.name testFloat32ArrayFromTHREE071
     * @tc.desc Verify Set overload result can be written and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(1.0);
      let r = Float32Array.from(src);
      r.$_set(0, 66.0);
      expect(r.$_get(0)).assertEqual(66.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0720
     * @tc.name testFloat32ArrayFromTHREE072
     * @tc.desc Verify ArrayLike overload result can be written and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<number> = new Float32Array([1.0, 2.0]);
      let r = Float32Array.from(src);
      r.$_set(1, 55.0);
      expect(r.$_get(1)).assertEqual(55.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0730
     * @tc.name testFloat32ArrayFromTHREE073
     * @tc.desc Verify Iterable overload result can be written and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1.0);
      s.add(2.0);
      let src: Iterable<number> = s;
      let r = Float32Array.from(src);
      r.$_set(0, 44.0);
      expect(r.$_get(0)).assertEqual(44.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0740
     * @tc.name testFloat32ArrayFromTHREE074
     * @tc.desc Verify Array source mapfn throws on the second element and propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0];
      try {
        Float32Array.from(src, (v: number, k: number) => {
          if (k === 1) {
            throw new RangeError('second');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0750
     * @tc.name testFloat32ArrayFromTHREE075
     * @tc.desc Verify Float32Array source mapfn throws TypeError and propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([1.0]);
      try {
        Float32Array.from(src, (v: number, k: number) => {
          throw new TypeError('type');
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0760
     * @tc.name testFloat32ArrayFromTHREE076
     * @tc.desc Verify Set source mapfn throws Error and propagates, non-null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(1.0);
      try {
        Float32Array.from(src, (v: number, k: number) => {
          throw new Error('generic');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0770
     * @tc.name testFloat32ArrayFromTHREE077
     * @tc.desc Verify ArrayLike source mapfn throws and propagates, non-null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<number> = new Float32Array([1.0]);
      try {
        Float32Array.from(src, (v: number, k: number) => {
          throw new Error('al');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0780
     * @tc.name testFloat32ArrayFromTHREE078
     * @tc.desc Verify Iterable source mapfn throws RangeError and propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1.0);
      let src: Iterable<number> = s;
      try {
        Float32Array.from(src, (v: number, k: number) => {
          throw new RangeError('it');
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0790
     * @tc.name testFloat32ArrayFromTHREE079
     * @tc.desc Verify source Array remains unchanged after mapfn throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [10.0, 20.0];
      try {
        Float32Array.from(src, (v: number, k: number) => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(src.$_get(1)).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0800
     * @tc.name testFloat32ArrayFromTHREE080
     * @tc.desc Verify source Float32Array remains unchanged after mapfn throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([5.0, 6.0]);
      try {
        Float32Array.from(src, (v: number, k: number) => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(src.$_get(0)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0810
     * @tc.name testFloat32ArrayFromTHREE081
     * @tc.desc Verify source Set remains unchanged after mapfn throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(7.0);
      try {
        Float32Array.from(src, (v: number, k: number) => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(src.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0820
     * @tc.name testFloat32ArrayFromTHREE082
     * @tc.desc Verify from(Array) succeeds and recovers after mapfn throws and is caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [3.0, 4.0];
      try {
        Float32Array.from(src, (v: number, k: number) => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let r = Float32Array.from(src, (v: number, k: number) => v + 1);
      expect(r.$_get(0)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0830
     * @tc.name testFloat32ArrayFromTHREE083
     * @tc.desc Verify thrown error object identity is consistent in catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0];
      let marker: Error = new TypeError('identity');
      let caught: Error | null = null;
      try {
        Float32Array.from(src, (v: number, k: number) => {
          throw marker;
        });
        expect().assertFail();
      } catch (e) {
        caught = e as Error;
        expect(e.name).assertEqual('TypeError');
      }
      expect(caught).assertEqual(marker);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0840
     * @tc.name testFloat32ArrayFromTHREE084
     * @tc.desc Verify Infinity is stored normally when mapfn returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0];
      let r = Float32Array.from(src, (v: number, k: number) => Infinity);
      expect(r.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0850
     * @tc.name testFloat32ArrayFromTHREE085
     * @tc.desc Verify the second from after mapfn throws uses a safe mapfn and succeeds with correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(5.0);
      src.add(6.0);
      try {
        Float32Array.from(src, (v: number, k: number) => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let r = Float32Array.from(src, (v: number, k: number) => v * 10);
      expect(r.$_get(1)).assertEqual(60.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0860
     * @tc.name testFloat32ArrayFromTHREE086
     * @tc.desc Verify from(Float32Array) result buffer and source buffer have different references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([1.0, 2.0]);
      let r = Float32Array.from(src);
      r.$_set(0, 99.0);
      expect(src.$_get(0)).assertEqual(1.0);
      expect(r.$_get(0)).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0870
     * @tc.name testFloat32ArrayFromTHREE087
     * @tc.desc Verify modifying the from(Float32Array) result does not affect the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([1.0, 2.0]);
      let r = Float32Array.from(src);
      r.$_set(0, 999.0);
      expect(src.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0880
     * @tc.name testFloat32ArrayFromTHREE088
     * @tc.desc Verify modifying the source Float32Array does not affect the from result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([1.0, 2.0]);
      let r = Float32Array.from(src);
      src.$_set(0, 999.0);
      expect(r.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0890
     * @tc.name testFloat32ArrayFromTHREE089
     * @tc.desc Verify modifying the from(Array) result does not affect the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0];
      let r = Float32Array.from(src);
      r.$_set(0, 999.0);
      expect(src.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0900
     * @tc.name testFloat32ArrayFromTHREE090
     * @tc.desc Verify modifying the from(Set) result does not affect the source Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(1.0);
      src.add(2.0);
      let r = Float32Array.from(src);
      r.$_set(0, 999.0);
      expect(src.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0910
     * @tc.name testFloat32ArrayFromTHREE091
     * @tc.desc Verify modifying the from(ArrayLike) result does not affect the source view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<number> = new Float32Array([1.0, 2.0]);
      let r = Float32Array.from(src);
      r.$_set(0, 999.0);
      expect(src.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0920
     * @tc.name testFloat32ArrayFromTHREE092
     * @tc.desc Verify modifying the from(Iterable) result does not affect the source Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1.0);
      s.add(2.0);
      let src: Iterable<number> = s;
      let r = Float32Array.from(src);
      r.$_set(0, 999.0);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0930
     * @tc.name testFloat32ArrayFromTHREE093
     * @tc.desc Verify two from calls on the same source produce different instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0];
      let r1 = Float32Array.from(src);
      let r2 = Float32Array.from(src);
      r1.$_set(0, 99.0);
      expect(r2.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0940
     * @tc.name testFloat32ArrayFromTHREE094
     * @tc.desc Verify two from calls on the same source produce different buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([1.0, 2.0]);
      let r1 = Float32Array.from(src);
      let r2 = Float32Array.from(src);
      r1.$_set(0, 99.0);
      expect(r2.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0950
     * @tc.name testFloat32ArrayFromTHREE095
     * @tc.desc Verify result fill does not affect the source Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let r = Float32Array.from(src);
      r.fill(0.0);
      expect(src.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0960
     * @tc.name testFloat32ArrayFromTHREE096
     * @tc.desc Verify result reverse does not affect the source Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let r = Float32Array.from(src);
      r.reverse();
      expect(src.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0970
     * @tc.name testFloat32ArrayFromTHREE097
     * @tc.desc Verify result sort does not affect the source Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let r = Float32Array.from(src);
      r.sort();
      expect(src.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0980
     * @tc.name testFloat32ArrayFromTHREE098
     * @tc.desc Verify result copyWithin does not affect the source Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let r = Float32Array.from(src);
      r.copyWithin(0, 1);
      expect(src.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_0990
     * @tc.name testFloat32ArrayFromTHREE099
     * @tc.desc Verify nested from(from(src)) produces three independent buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([1.0, 2.0]);
      let r1 = Float32Array.from(src);
      let r2 = Float32Array.from(r1);
      r2.$_set(0, 99.0);
      expect(r1.$_get(0)).assertEqual(1.0);
      r1.$_set(1, 88.0);
      expect(src.$_get(1)).assertEqual(2.0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_1000
     * @tc.name testFloat32ArrayFromTHREE100
     * @tc.desc Verify push on the source Array after from does not affect the result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.0, 2.0];
      let r = Float32Array.from(src);
      src.push(3.0);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_1010
     * @tc.name testFloat32ArrayFromTHREE101
     * @tc.desc Verify add on the source Set after from does not affect the result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(1.0);
      let r = Float32Array.from(src);
      src.add(2.0);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_1020
     * @tc.name testFloat32ArrayFromTHREE102
     * @tc.desc Verify modifying the first result after two from calls does not affect the second result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0];
      let r1 = Float32Array.from(src);
      let r2 = Float32Array.from(src);
      r1.$_set(0, 999.0);
      expect(r2.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_1030
     * @tc.name testFloat32ArrayFromTHREE103
     * @tc.desc Verify from(Float32Array) with mapfn result is independent of the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([1.0, 2.0]);
      let r = Float32Array.from(src, (v: number, k: number) => v * 2);
      src.$_set(0, 999.0);
      expect(r.$_get(0)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_1040
     * @tc.name testFloat32ArrayFromTHREE104
     * @tc.desc Verify from(Set) iteration order is preserved as the first element in the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<number> = new Set<number>();
      src.add(3.0);
      src.add(1.0);
      src.add(2.0);
      let r = Float32Array.from(src);
      expect(r.$_get(0)).assertEqual(3.0);
      expect(r.$_get(1)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_1050
     * @tc.name testFloat32ArrayFromTHREE105
     * @tc.desc Verify across overloads, FixedArray and Array with the same values produce equal result elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<number> = [0x10, 0b1010, -1.0];
      let arr: Array<number> = [0x10, 0b1010, -1.0];
      let r1 = Float32Array.from(fa);
      let r2 = Float32Array.from(arr);
      expect(r1.$_get(2)).assertEqual(r2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_1060
     * @tc.name testFloat32ArrayFromTHREE106
     * @tc.desc Verify across overloads, Float32Array and FixedArray with the same values produce equal result elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: Float32Array = new Float32Array([4.0, 5.0]);
      let fa: FixedArray<number> = [4.0, 5.0];
      let r1 = Float32Array.from(f);
      let r2 = Float32Array.from(fa);
      expect(r1.$_get(1)).assertEqual(r2.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_1070
     * @tc.name testFloat32ArrayFromTHREE107
     * @tc.desc Verify across overloads, Set and Array with the same order and same values produce equal result elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(6.0);
      s.add(7.0);
      let arr: Array<number> = [6.0, 7.0];
      let r1 = Float32Array.from(s);
      let r2 = Float32Array.from(arr);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_1080
     * @tc.name testFloat32ArrayFromTHREE108
     * @tc.desc Verify across overloads, the same content produces equal byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<number> = [1.0, 2.0];
      let arr: Array<number> = [1.0, 2.0];
      let f: Float32Array = new Float32Array([1.0, 2.0]);
      let r1 = Float32Array.from(fa);
      let r2 = Float32Array.from(arr);
      let r3 = Float32Array.from(f);
      expect(r1.byteLength).assertEqual(r2.byteLength);
      expect(r2.byteLength).assertEqual(r3.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_1090
     * @tc.name testFloat32ArrayFromTHREE109
     * @tc.desc Verify across overloads, ArrayLike and Array with the same values produce equal result lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let al: ArrayLike<number> = new Float32Array([8.0, 9.0]);
      let arr: Array<number> = [8.0, 9.0];
      let r1 = Float32Array.from(al);
      let r2 = Float32Array.from(arr);
      expect(r1.length).assertEqual(r2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_1100
     * @tc.name testFloat32ArrayFromTHREE110
     * @tc.desc Verify across overloads, Iterable and Set from the same source produce results with different references but equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10.0);
      let it: Iterable<number> = s;
      let r1 = Float32Array.from(s);
      let r2 = Float32Array.from(it);
      expect(r2.$_get(0)).assertEqual(10.0);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
      r1.$_set(0, 99.0);
      expect(r2.$_get(0)).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_1110
     * @tc.name testFloat32ArrayFromTHREE111
     * @tc.desc Verify null source throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float32Array.from(null as ArrayLike<number>);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_1120
     * @tc.name testFloat32ArrayFromTHREE112
     * @tc.desc Verify undefined source throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float32Array.from(undefined as ArrayLike<number>);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FROMTHREE_1130
     * @tc.name testFloat32ArrayFromTHREE113
     * @tc.desc Verify from iterable mapfn exceptions are propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFromTHREE113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(1.0);
      set.add(2.0);
      try {
        Float32Array.from(set, (value: number, index: number): number => {
          if (index === 1) {
            throw new Error('stop');
          }
          return value;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

  });
}
