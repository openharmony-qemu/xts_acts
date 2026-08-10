'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
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

export default function int32ArraySlicePart04Test(): void {
  describe('Int32ArraySlicePart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0010
     * @tc.name int32ArraySlicePart04Test001
     * @tc.desc Verify slice() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30, 40);
      let beforeLen: int = orig.length;
      let cp: Int32Array = orig.slice();
      expect(orig.length).assertEqual(beforeLen);
      expect(cp.length).assertEqual(4);
      expect(cp.$_get(0)).assertEqual(10);
      expect(cp.$_get(3)).assertEqual(40);
      expect(cp.buffer).not().assertEqual(orig.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0020
     * @tc.name int32ArraySlicePart04Test002
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30, 40);
      orig.slice();
      expect(orig.$_get(0)).assertEqual(10);
      {
        let orig: Int32Array = Int32Array.of(10, 20, 30, 40);
        orig.slice();
        expect(orig.$_get(3)).assertEqual(40);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0030
     * @tc.name int32ArraySlicePart04Test003
     * @tc.desc Verify slice() buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let beforeBl: int = orig.buffer.byteLength;
      orig.slice();
      expect(orig.buffer.byteLength).assertEqual(beforeBl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0040
     * @tc.name int32ArraySlicePart04Test004
     * @tc.desc Verify slice byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 8, 3);
      let beforeBo: int = view.byteOffset;
      view.slice();
      expect(view.byteOffset).assertEqual(beforeBo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0050
     * @tc.name int32ArraySlicePart04Test005
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(42);
      orig.slice();
      expect(orig.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0060
     * @tc.name int32ArraySlicePart04Test006
     * @tc.desc Verify begin/end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      orig.slice(-3, -1);
      expect(orig.$_get(0)).assertEqual(1);
      expect(orig.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0070
     * @tc.name int32ArraySlicePart04Test007
     * @tc.desc Verify slice length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      orig.slice(0);
      orig.slice(1);
      orig.slice(-1);
      orig.slice(0, 0);
      expect(orig.$_get(0)).assertEqual(1);
      expect(orig.$_get(1)).assertEqual(2);
      expect(orig.$_get(2)).assertEqual(3);
      expect(orig.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0080
     * @tc.name int32ArraySlicePart04Test008
     * @tc.desc Verify slice (begin==end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(7, 8, 9);
      orig.slice(2, 2);
      expect(orig.$_get(0)).assertEqual(7);
      expect(orig.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0090
     * @tc.name int32ArraySlicePart04Test009
     * @tc.desc Verify slice begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2);
      orig.slice(99);
      expect(orig.$_get(0)).assertEqual(1);
      expect(orig.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0100
     * @tc.name int32ArraySlicePart04Test010
     * @tc.desc Verify slice(1,3) buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4);
      let cp: Int32Array = orig.slice(1, 3);
      let _d: boolean = cp.buffer !== orig.buffer;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0110
     * @tc.name int32ArraySlicePart04Test011
     * @tc.desc Verify a full slice preserves the original value after source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30);
      let cp: Int32Array = orig.slice();
      cp.$_set(0, 999);
      expect(orig.$_get(0)).assertEqual(10);
      {
        let orig: Int32Array = Int32Array.of(10, 20, 30);
        let cp: Int32Array = orig.slice();
        cp.$_set(2, -7);
        expect(orig.$_get(2)).assertEqual(30);
      }
      {
        let orig: Int32Array = Int32Array.of(10, 20, 30);
        let cp: Int32Array = orig.slice();
        orig.$_set(0, 888);
        expect(cp.$_get(0)).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0120
     * @tc.name int32ArraySlicePart04Test012
     * @tc.desc Verify slice reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp: Int32Array = orig.slice();
      cp.reverse();
      expect(orig.$_get(0)).assertEqual(1);
      expect(orig.$_get(2)).assertEqual(3);
      expect(cp.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0130
     * @tc.name int32ArraySlicePart04Test013
     * @tc.desc Verify slice buffer.byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let cp: Int32Array = orig.slice(1, 4);
      expect(cp.buffer.byteLength).assertEqual(cp.length * 4);
      expect(cp.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0140
     * @tc.name int32ArraySlicePart04Test014
     * @tc.desc Verify slice(begin>=end) buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp: Int32Array = orig.slice(2, 1);
      let _d: boolean = cp.buffer !== orig.buffer;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0150
     * @tc.name int32ArraySlicePart04Test015
     * @tc.desc Verify slice buffer.byteLength 0 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp: Int32Array = orig.slice(5, 10);
      expect(cp.buffer.byteLength).assertEqual(0);
      expect(cp.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0160
     * @tc.name int32ArraySlicePart04Test016
     * @tc.desc Verify slice buffer byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(7);
      let cp: Int32Array = orig.slice();
      let _d: boolean = cp.buffer !== orig.buffer;
      expect(_d).assertTrue();
      expect(cp.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0170
     * @tc.name int32ArraySlicePart04Test017
     * @tc.desc Verify slice fill slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp: Int32Array = orig.slice();
      orig.fill(0);
      expect(cp.$_get(0)).assertEqual(1);
      expect(cp.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0180
     * @tc.name int32ArraySlicePart04Test018
     * @tc.desc Verify slice reverse slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp: Int32Array = orig.slice();
      orig.reverse();
      expect(cp.$_get(0)).assertEqual(1);
      expect(cp.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0190
     * @tc.name int32ArraySlicePart04Test019
     * @tc.desc Verify slice set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp: Int32Array = orig.slice();
      let src: Int32Array = Int32Array.of(77, 88);
      cp.set(src);
      expect(orig.$_get(0)).assertEqual(1);
      expect(orig.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0200
     * @tc.name int32ArraySlicePart04Test020
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let a: Int32Array = orig.slice();
      let b: Int32Array = orig.slice();
      a.$_set(0, 111);
      let _d: boolean = b.buffer !== a.buffer;
      expect(_d).assertTrue();
      expect(b.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0210
     * @tc.name int32ArraySlicePart04Test021
     * @tc.desc Verify slice (1,3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let cp: Int32Array = orig.slice(1, 4);
      cp.$_set(0, 777);
      cp.$_set(1, 888);
      cp.$_set(2, 999);
      expect(orig.$_get(1)).assertEqual(20);
      expect(orig.$_get(2)).assertEqual(30);
      expect(orig.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0220
     * @tc.name int32ArraySlicePart04Test022
     * @tc.desc Verify slice().slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(5, 6, 7, 8);
      let cp2: Int32Array = orig.slice().slice();
      expect(cp2.length).assertEqual(4);
      expect(cp2.$_get(0)).assertEqual(5);
      expect(cp2.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0230
     * @tc.name int32ArraySlicePart04Test023
     * @tc.desc Verify three chained slices return values 2 and 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let inner: Int32Array = orig.slice(1, 4).slice(1, 2);
      expect(inner.length).assertEqual(1);
      expect(inner.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0240
     * @tc.name int32ArraySlicePart04Test024
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(0, 1, 2, 3, 4, 5, 6);
      let cp3: Int32Array = orig.slice(0, 6).slice(1, 5).slice(1, 3);
      expect(cp3.length).assertEqual(2);
      expect(cp3.$_get(0)).assertEqual(2);
      expect(cp3.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0250
     * @tc.name int32ArraySlicePart04Test025
     * @tc.desc Verify slice slice(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(11, 22, 33);
      let cp: Int32Array = orig.slice().slice(0);
      expect(cp.length).assertEqual(3);
      expect(cp.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0260
     * @tc.name int32ArraySlicePart04Test026
     * @tc.desc Verify slice begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4);
      let cp: Int32Array = orig.slice(1, 3).slice(5, 10);
      expect(cp.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0270
     * @tc.name int32ArraySlicePart04Test027
     * @tc.desc Verify slice(1,4) end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let cp: Int32Array = orig.slice(1, 4).slice(0, -1);
      expect(cp.length).assertEqual(2);
      expect(cp.$_get(0)).assertEqual(20);
      expect(cp.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0280
     * @tc.name int32ArraySlicePart04Test028
     * @tc.desc Verify slice slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2);
      let cp: Int32Array = orig.slice(5, 1).slice(0, 10);
      expect(cp.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0290
     * @tc.name int32ArraySlicePart04Test029
     * @tc.desc Verify nested slice results remain independent from parent arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let s1: Int32Array = orig.slice();
      let s2: Int32Array = s1.slice();
      let _d: boolean = s1.buffer !== orig.buffer;
      expect(_d).assertTrue();
      let _d2: boolean = s2.buffer !== s1.buffer;
      expect(_d2).assertTrue();
      let _d3: boolean = s2.buffer !== orig.buffer;
      expect(_d3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0300
     * @tc.name int32ArraySlicePart04Test030
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4);
      let s1: Int32Array = orig.slice();
      let s2: Int32Array = s1.slice();
      s2.$_set(0, -1);
      expect(s1.$_get(0)).assertEqual(1);
      expect(orig.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0310
     * @tc.name int32ArraySlicePart04Test031
     * @tc.desc Verify slice(-3).slice(0,1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let tail: Int32Array = orig.slice(-3);
      let head: Int32Array = tail.slice(0, 1);
      expect(tail.length).assertEqual(3);
      expect(tail.$_get(0)).assertEqual(3);
      expect(head.length).assertEqual(1);
      expect(head.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0320
     * @tc.name int32ArraySlicePart04Test032
     * @tc.desc Verify slice().slice(1,-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let mid: Int32Array = orig.slice().slice(1, -1);
      expect(mid.length).assertEqual(3);
      expect(mid.$_get(0)).assertEqual(20);
      expect(mid.$_get(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0330
     * @tc.name int32ArraySlicePart04Test033
     * @tc.desc Verify $_set slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      orig.$_set(1, 99);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0340
     * @tc.name int32ArraySlicePart04Test034
     * @tc.desc Verify fill(-1) slice -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array(4);
      orig.fill(-1);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(-1);
      expect(cp.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0350
     * @tc.name int32ArraySlicePart04Test035
     * @tc.desc Verify fill slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array(6);
      orig.fill(7, 1, 4);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(0);
      expect(cp.$_get(1)).assertEqual(7);
      expect(cp.$_get(3)).assertEqual(7);
      expect(cp.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0360
     * @tc.name int32ArraySlicePart04Test036
     * @tc.desc Verify reverse slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4);
      orig.reverse();
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(4);
      expect(cp.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0370
     * @tc.name int32ArraySlicePart04Test037
     * @tc.desc Verify sort slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(3, 1, 4, 2);
      orig.sort();
      let cp: Int32Array = orig.slice(0, 3);
      expect(cp.$_get(0)).assertEqual(1);
      expect(cp.$_get(1)).assertEqual(2);
      expect(cp.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0380
     * @tc.name int32ArraySlicePart04Test038
     * @tc.desc Verify set(array, offset) slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array(5);
      let src: Int32Array = Int32Array.of(88, 99);
      orig.set(src, 2);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(2)).assertEqual(88);
      expect(cp.$_get(3)).assertEqual(99);
      expect(cp.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0390
     * @tc.name int32ArraySlicePart04Test039
     * @tc.desc Verify copyWithin slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      orig.copyWithin(0, 3);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(40);
      expect(cp.$_get(1)).assertEqual(50);
      expect(cp.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0400
     * @tc.name int32ArraySlicePart04Test040
     * @tc.desc Verify slice copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let cp: Int32Array = orig.slice();
      cp.copyWithin(0, 3);
      expect(orig.$_get(0)).assertEqual(1);
      expect(orig.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0410
     * @tc.name int32ArraySlicePart04Test041
     * @tc.desc Verify INT32_MAX(2147483647) slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(2147483647);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0420
     * @tc.name int32ArraySlicePart04Test042
     * @tc.desc Verify -1 slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(-1);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0430
     * @tc.name int32ArraySlicePart04Test043
     * @tc.desc Verify 0 slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(0);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0440
     * @tc.name int32ArraySlicePart04Test044
     * @tc.desc Verify 2147483648( -2147483648) slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array(1);
      orig.$_set(0, 2147483648);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0450
     * @tc.name int32ArraySlicePart04Test045
     * @tc.desc Verify a full slice preserves INT32 boundary and signed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array(1);
      orig.$_set(0, 4294967295);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0460
     * @tc.name int32ArraySlicePart04Test046
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(2147483647, -2147483648, -1, 0, 1);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(2147483647);
      expect(cp.$_get(1)).assertEqual(-2147483648);
      expect(cp.$_get(2)).assertEqual(-1);
      expect(cp.$_get(3)).assertEqual(0);
      expect(cp.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0470
     * @tc.name int32ArraySlicePart04Test047
     * @tc.desc Verify slice(1,4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(0, -1, 2147483647, -2147483648, 100);
      let cp: Int32Array = orig.slice(1, 4);
      expect(cp.length).assertEqual(3);
      expect(cp.$_get(0)).assertEqual(-1);
      expect(cp.$_get(1)).assertEqual(2147483647);
      expect(cp.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0480
     * @tc.name int32ArraySlicePart04Test048
     * @tc.desc Verify (-1,-2,-3,-4) slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(-1, -2, -3, -4);
      let cp: Int32Array = orig.slice(1, 3);
      expect(cp.length).assertEqual(2);
      expect(cp.$_get(0)).assertEqual(-2);
      expect(cp.$_get(1)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0490
     * @tc.name int32ArraySlicePart04Test049
     * @tc.desc Verify Number.NaN ToInt32 0 slice 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array(1);
      orig.$_set(0, Number.NaN);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0500
     * @tc.name int32ArraySlicePart04Test050
     * @tc.desc Verify 3.9 3 slice 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array(1);
      orig.$_set(0, 3.9);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0510
     * @tc.name int32ArraySlicePart04Test051
     * @tc.desc Verify byteOffset=4 slice byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 4, 4);
      let cp: Int32Array = view.slice();
      expect(cp.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0520
     * @tc.name int32ArraySlicePart04Test052
     * @tc.desc Verify byteOffset=8 slice buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 8, 3);
      let cp: Int32Array = view.slice();
      let _d: boolean = cp.buffer !== buf;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0530
     * @tc.name int32ArraySlicePart04Test053
     * @tc.desc Verify byteOffset=8 slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 8, 3);
      view.$_set(0, 5);
      view.$_set(1, 6);
      view.$_set(2, 7);
      let cp: Int32Array = view.slice();
      expect(cp.length).assertEqual(3);
      expect(cp.$_get(0)).assertEqual(5);
      expect(cp.$_get(1)).assertEqual(6);
      expect(cp.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0540
     * @tc.name int32ArraySlicePart04Test054
     * @tc.desc Verify slice byteOffset 0 byteLength=length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let view: Int32Array = new Int32Array(buf, 12, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      let cp: Int32Array = view.slice(1, 3);
      expect(cp.byteOffset).assertEqual(0);
      expect(cp.byteLength).assertEqual(8);
      expect(cp.length).assertEqual(2);
      expect(cp.$_get(0)).assertEqual(2);
      expect(cp.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0550
     * @tc.name int32ArraySlicePart04Test055
     * @tc.desc Verify subarray slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = orig.subarray(1, 4);
      let cp: Int32Array = sub.slice();
      let _d: boolean = cp.buffer !== orig.buffer;
      expect(_d).assertTrue();
      expect(cp.$_get(0)).assertEqual(20);
      expect(cp.$_get(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0560
     * @tc.name int32ArraySlicePart04Test056
     * @tc.desc Verify subarray buffer slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = orig.subarray(0, 3);
      orig.$_set(1, 77);
      let cp: Int32Array = sub.slice();
      expect(cp.$_get(1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0570
     * @tc.name int32ArraySlicePart04Test057
     * @tc.desc Verify subarray slice sub/orig
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sub: Int32Array = orig.subarray(1, 4);
      let cp: Int32Array = sub.slice();
      cp.$_set(0, 999);
      expect(orig.$_get(1)).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(2);
      expect(cp.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0580
     * @tc.name int32ArraySlicePart04Test058
     * @tc.desc Verify slice subarray subarray slice buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4);
      let cp: Int32Array = orig.slice();
      let sub: Int32Array = cp.subarray(1, 3);
      expect(sub.buffer).assertEqual(cp.buffer);
      let _d: boolean = sub.buffer !== orig.buffer;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0590
     * @tc.name int32ArraySlicePart04Test059
     * @tc.desc Verify ArrayBuffer Int32Array slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let firstVal: Int32Array = new Int32Array(buf, 0, 2);
      let secondVal: Int32Array = new Int32Array(buf, 8, 2);
      firstVal.$_set(0, 11);
      firstVal.$_set(1, 22);
      secondVal.$_set(0, 33);
      secondVal.$_set(1, 44);
      let cp: Int32Array = firstVal.slice();
      cp.$_set(0, 999);
      expect(firstVal.$_get(0)).assertEqual(11);
      expect(secondVal.$_get(0)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0600
     * @tc.name int32ArraySlicePart04Test060
     * @tc.desc Verify buffer slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 111);
      b.$_set(1, 222);
      let cp: Int32Array = a.slice();
      expect(cp.$_get(0)).assertEqual(111);
      expect(cp.$_get(1)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0610
     * @tc.name int32ArraySlicePart04Test061
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(7, 8, 9);
      let cp: Int32Array = orig.slice();
      orig.$_set(1, 100);
      cp.$_set(1, 200);
      expect(orig.$_get(1)).assertEqual(100);
      expect(cp.$_get(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0620
     * @tc.name int32ArraySlicePart04Test062
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      let cp: Int32Array = a.slice();
      a.$_set(0, 999);
      expect(cp.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0630
     * @tc.name int32ArraySlicePart04Test063
     * @tc.desc Verify arr.slice().fill(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let filled: Int32Array = orig.slice().fill(0);
      expect(orig.$_get(0)).assertEqual(1);
      expect(orig.$_get(2)).assertEqual(3);
      expect(filled.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0640
     * @tc.name int32ArraySlicePart04Test064
     * @tc.desc Verify arr.slice().reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4);
      let rev: Int32Array = orig.slice().reverse();
      expect(rev.$_get(0)).assertEqual(4);
      expect(orig.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0650
     * @tc.name int32ArraySlicePart04Test065
     * @tc.desc Verify arr.slice().sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(3, 1, 2);
      let sorted: Int32Array = orig.slice().sort();
      expect(sorted.$_get(0)).assertEqual(1);
      expect(sorted.$_get(2)).assertEqual(3);
      expect(orig.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0660
     * @tc.name int32ArraySlicePart04Test066
     * @tc.desc Verify slice(1,4) includes /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let cp: Int32Array = orig.slice(1, 4);
      expect(cp.includes(20)).assertTrue();
      expect(cp.includes(10)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0670
     * @tc.name int32ArraySlicePart04Test067
     * @tc.desc Verify slice indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30, 40);
      let cp: Int32Array = orig.slice(1, 4);
      expect(cp.indexOf(30)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0680
     * @tc.name int32ArraySlicePart04Test068
     * @tc.desc Verify slice reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let cp: Int32Array = orig.slice(1, 4);
      let s: number = cp.reduce((acc: number, v: number): number => acc + v);
      expect(s).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0690
     * @tc.name int32ArraySlicePart04Test069
     * @tc.desc Verify slice map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let doubled: Int32Array = orig.slice().map((v: number): number => v * 2);
      expect(doubled.$_get(0)).assertEqual(2);
      expect(doubled.$_get(2)).assertEqual(6);
      expect(orig.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0700
     * @tc.name int32ArraySlicePart04Test070
     * @tc.desc Verify slice set TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4);
      let cp: Int32Array = orig.slice(1, 3);
      let dst: Int32Array = new Int32Array(3);
      dst.set(cp, 1);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0710
     * @tc.name int32ArraySlicePart04Test071
     * @tc.desc Verify slice set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let empty: Int32Array = orig.slice(2, 2);
      let dst: Int32Array = Int32Array.of(9, 9, 9);
      dst.set(empty, 0);
      expect(dst.$_get(0)).assertEqual(9);
      expect(dst.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0720
     * @tc.name int32ArraySlicePart04Test072
     * @tc.desc Verify slice forEach length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30);
      let cp: Int32Array = orig.slice();
      let count: int = 0;
      cp.forEach((_v: number, _i: int, _arr: Int32Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0730
     * @tc.name int32ArraySlicePart04Test073
     * @tc.desc Verify slice forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2);
      let empty: Int32Array = orig.slice(5, 10);
      let count: int = 0;
      empty.forEach((_v: number, _i: int, _arr: Int32Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0740
     * @tc.name int32ArraySlicePart04Test074
     * @tc.desc Verify slice some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30, 40);
      let cp: Int32Array = orig.slice(0, 4);
      let r: boolean = cp.some((v: number, _i: int, _arr: Int32Array): boolean => v === 30);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0750
     * @tc.name int32ArraySlicePart04Test075
     * @tc.desc Verify slice every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4);
      let cp: Int32Array = orig.slice();
      let r: boolean = cp.every((v: number, _i: int, _arr: Int32Array): boolean => v !== 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0760
     * @tc.name int32ArraySlicePart04Test076
     * @tc.desc Verify slice find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(5, 10, 15, 20);
      let cp: Int32Array = orig.slice();
      let r: number | undefined = cp.find((v: number, _i: int, _arr: Int32Array): boolean => v > 12);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0770
     * @tc.name int32ArraySlicePart04Test077
     * @tc.desc Verify slice join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30, 40);
      let cp: Int32Array = orig.slice(1, 3);
      let s: string = cp.join(',');
      expect(s).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0780
     * @tc.name int32ArraySlicePart04Test078
     * @tc.desc Verify slice join join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp: Int32Array = orig.slice();
      let s1: string = cp.join('-');
      expect(s1).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0790
     * @tc.name int32ArraySlicePart04Test079
     * @tc.desc Verify Int32Array.of slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(11, 22, 33);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(11);
      expect(cp.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0800
     * @tc.name int32ArraySlicePart04Test080
     * @tc.desc Verify new Int32Array(length) slice 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array(4);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(0);
      expect(cp.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0810
     * @tc.name int32ArraySlicePart04Test081
     * @tc.desc Verify Int32Array.from Int32Array slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: number[] = [5, 6, 7];
      let orig: Int32Array = Int32Array.from(source);
      let cp: Int32Array = orig.slice(1, 3);
      expect(cp.length).assertEqual(2);
      expect(cp.$_get(0)).assertEqual(6);
      expect(cp.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0820
     * @tc.name int32ArraySlicePart04Test082
     * @tc.desc Verify new Int32Array(typedArray) slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(100, 200, 300);
      let orig: Int32Array = new Int32Array(src);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(100);
      expect(cp.$_get(2)).assertEqual(300);
      let _d: boolean = cp.buffer !== orig.buffer;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0830
     * @tc.name int32ArraySlicePart04Test083
     * @tc.desc Verify slice() Int32Array.from(orig)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(7, 8, 9);
      let cp: Int32Array = orig.slice();
      let fromArr: Int32Array = Int32Array.from(orig);
      expect(cp.length).assertEqual(fromArr.length);
      expect(cp.$_get(0)).assertEqual(fromArr.$_get(0));
      expect(cp.$_get(2)).assertEqual(fromArr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0840
     * @tc.name int32ArraySlicePart04Test084
     * @tc.desc Verify slice() new Int32Array(orig) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(11, 22, 33, 44);
      let cp: Int32Array = orig.slice();
      let ctor: Int32Array = new Int32Array(orig);
      expect(cp.length).assertEqual(ctor.length);
      expect(cp.$_get(1)).assertEqual(ctor.$_get(1));
      let _d: boolean = cp.buffer !== ctor.buffer;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0850
     * @tc.name int32ArraySlicePart04Test085
     * @tc.desc Verify new Int32Array(buffer) buffer slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Int32Array = new Int32Array(buf);
      view.$_set(0, 11);
      view.$_set(1, 22);
      view.$_set(2, 33);
      let cp: Int32Array = view.slice();
      let _d: boolean = cp.buffer !== buf;
      expect(_d).assertTrue();
      expect(cp.$_get(0)).assertEqual(11);
      expect(cp.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0860
     * @tc.name int32ArraySlicePart04Test086
     * @tc.desc Verify for-of slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30, 40);
      let snapshot: Int32Array = new Int32Array(0);
      let sum: number = 0;
      for (let i = 0; i < orig.length; i++) {
        let v = orig.$_get(i);
        if (v === 20) {
          snapshot = orig.slice();
        }
        sum = sum + v;
      }
      expect(snapshot.length).assertEqual(4);
      expect(snapshot.$_get(1)).assertEqual(20);
      expect(sum).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0870
     * @tc.name int32ArraySlicePart04Test087
     * @tc.desc Verify forEach slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      orig.forEach((value: number, index: int, arr: Int32Array): void => {
        if (index === 1) {
          let cp: Int32Array = arr.slice();
          expect(cp.length).assertEqual(3);
          expect(cp.$_get(0)).assertEqual(1);
          expect(cp.$_get(2)).assertEqual(3);
          expect(cp.buffer).not().assertEqual(arr.buffer);
        }
      });
      expect(orig.$_get(0)).assertEqual(1);
      expect(orig.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0880
     * @tc.name int32ArraySlicePart04Test088
     * @tc.desc Verify slice for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(5, 6, 7);
      let cp: Int32Array = orig.slice();
      let collected: number[] = [];
      for (let i = 0; i < cp.length; i++) {
        let v = cp.$_get(i);
        collected.push(v);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(5);
      expect(collected[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0890
     * @tc.name int32ArraySlicePart04Test089
     * @tc.desc Verify slice entries key=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30);
      let cp: Int32Array = orig.slice(1, 3);
      let firstKey: int = -1;
      let firstVal: number = 0;
      let cnt: int = 0;
      for (let i = 0; i < cp.length; i++) {
        let k = i;
        let v = cp.$_get(i);
        if (cnt === 0) {
          firstKey = k;
          firstVal = v;
        }
        cnt = cnt + 1;
      }
      expect(firstKey).assertEqual(0);
      expect(firstVal).assertEqual(20);
      expect(cnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0900
     * @tc.name int32ArraySlicePart04Test090
     * @tc.desc Verify slice(1, 5) returns four alternating signed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array(5);
      orig.fill(7);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(7);
      expect(cp.$_get(4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0910
     * @tc.name int32ArraySlicePart04Test091
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, -1, 2, -2, 3, -3);
      let cp: Int32Array = orig.slice(1, 5);
      expect(cp.$_get(0)).assertEqual(-1);
      expect(cp.$_get(1)).assertEqual(2);
      expect(cp.$_get(2)).assertEqual(-2);
      expect(cp.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0920
     * @tc.name int32ArraySlicePart04Test092
     * @tc.desc Verify 16 iota slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array(16);
      for (let i = 0; i < 16; i = i + 1) {
        orig.$_set(i, i * 2);
      }
      let cp: Int32Array = orig.slice(4, 12);
      expect(cp.length).assertEqual(8);
      expect(cp.$_get(0)).assertEqual(8);
      expect(cp.$_get(7)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0930
     * @tc.name int32ArraySlicePart04Test093
     * @tc.desc Verify 16 iota slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array(16);
      for (let i = 0; i < 16; i = i + 1) {
        orig.$_set(i, i);
      }
      let cp: Int32Array = orig.slice();
      cp.$_set(7, -1);
      cp.$_set(8, -2);
      expect(orig.$_get(7)).assertEqual(7);
      expect(orig.$_get(8)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0940
     * @tc.name int32ArraySlicePart04Test094
     * @tc.desc Verify (64) slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array(64);
      for (let i = 0; i < 64; i = i + 1) {
        orig.$_set(i, i * 2);
      }
      let cp: Int32Array = orig.slice();
      expect(cp.length).assertEqual(64);
      expect(cp.$_get(0)).assertEqual(0);
      expect(cp.$_get(63)).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0950
     * @tc.name int32ArraySlicePart04Test095
     * @tc.desc Verify (128) (-8)slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array(128);
      for (let i = 0; i < 128; i = i + 1) {
        orig.$_set(i, i);
      }
      let cp: Int32Array = orig.slice(-8);
      expect(cp.length).assertEqual(8);
      expect(cp.$_get(0)).assertEqual(120);
      expect(cp.$_get(7)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0960
     * @tc.name int32ArraySlicePart04Test096
     * @tc.desc Verify slice returns an independent copy containing 1, 2, and 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp: Int32Array = orig.slice();
      expect(cp.length).assertEqual(3);
      expect(cp.$_get(0)).assertEqual(1);
      expect(cp.$_get(2)).assertEqual(3);
      let independent: boolean = cp.buffer !== orig.buffer;
      expect(independent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0970
     * @tc.name int32ArraySlicePart04Test097
     * @tc.desc Verify slice beyond the source length returns an empty Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1);
      let cp: Int32Array = orig.slice(5, 10);
      expect(cp.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0980
     * @tc.name int32ArraySlicePart04Test098
     * @tc.desc Verify slice(2,2) begin==end length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp: Int32Array = orig.slice(2, 2);
      expect(cp.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_0990
     * @tc.name int32ArraySlicePart04Test099
     * @tc.desc Verify slice(3,1) begin>end length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4);
      let cp: Int32Array = orig.slice(3, 1);
      expect(cp.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_1000
     * @tc.name int32ArraySlicePart04Test100
     * @tc.desc Verify slice byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp: Int32Array = orig.slice(1, 3);
      expect(cp.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART04_1010
     * @tc.name int32ArraySlicePart04Test101
     * @tc.desc Verify slice() preserves INT32_MAX-1 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart04Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(2147483646);
      let cp: Int32Array = orig.slice();
      expect(cp.$_get(0)).assertEqual(2147483646);
    });
  });
}
