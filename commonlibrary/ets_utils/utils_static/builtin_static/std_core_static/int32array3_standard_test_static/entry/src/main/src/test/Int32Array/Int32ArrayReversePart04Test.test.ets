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

export default function int32ArrayReversePart04Test(): void {
  describe('Int32ArrayReversePart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayReversePart04Test001
     * @tc.desc Verify reverse length ( 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let beforeLen: int = arr.length;
      arr.reverse();
      expect(arr.length).assertEqual(beforeLen);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayReversePart04Test002
     * @tc.desc Verify reverse byteLength 4*length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      let beforeBL: int = arr.byteLength;
      arr.reverse();
      expect(arr.byteLength).assertEqual(beforeBL);
      expect(arr.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayReversePart04Test003
     * @tc.desc Verify ( ) reverse byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      let beforeBO: int = arr.byteOffset;
      arr.reverse();
      expect(arr.byteOffset).assertEqual(beforeBO);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayReversePart04Test004
     * @tc.desc Verify byteOffset reverse byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let view: Int32Array = new Int32Array(buf, 8, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      let beforeBO: int = view.byteOffset;
      view.reverse();
      expect(view.byteOffset).assertEqual(beforeBO);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayReversePart04Test005
     * @tc.desc Verify reverse buffer ArrayBuffer ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let bufRef: ArrayBuffer = arr.buffer;
      arr.reverse();
      expect(arr.buffer).assertEqual(bufRef);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayReversePart04Test006
     * @tc.desc Verify reverse changes the element order in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayReversePart04Test007
     * @tc.desc Verify reverse buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let blen: int = arr.buffer.byteLength;
      arr.reverse();
      expect(arr.buffer.byteLength).assertEqual(blen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayReversePart04Test008
     * @tc.desc Verify reverse length 0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.reverse();
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayReversePart04Test009
     * @tc.desc Verify reverse length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(777);
      arr.reverse();
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayReversePart04Test010
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      arr.reverse().reverse();
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArrayReversePart04Test011
     * @tc.desc Verify ( ) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.reverse().reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArrayReversePart04Test012
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-10, -20, -30);
      arr.reverse().reverse();
      expect(arr.$_get(0)).assertEqual(-10);
      expect(arr.$_get(2)).assertEqual(-30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArrayReversePart04Test013
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.reverse().reverse().reverse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArrayReversePart04Test014
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(999);
      arr.reverse().reverse().reverse();
      expect(arr.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArrayReversePart04Test015
     * @tc.desc Verify reverse reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.reverse().reverse().reverse();
      expect(arr.$_get(0)).assertEqual(30);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArrayReversePart04Test016
     * @tc.desc Verify (4 )reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      for (let i: int = 0; i < 4; i = i + 1) {
        arr.reverse();
      }
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArrayReversePart04Test017
     * @tc.desc Verify (5 )reverse reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      for (let i: int = 0; i < 5; i = i + 1) {
        arr.reverse();
      }
      expect(arr.$_get(0)).assertEqual(40);
      expect(arr.$_get(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArrayReversePart04Test018
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let ret: Int32Array = arr.reverse().reverse();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArrayReversePart04Test019
     * @tc.desc Verify reverse fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.reverse().fill(0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArrayReversePart04Test020
     * @tc.desc Verify reverse set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let src: Int32Array = Int32Array.of(100, 200);
      arr.reverse().set(src, 1);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(100);
      expect(arr.$_get(2)).assertEqual(200);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArrayReversePart04Test021
     * @tc.desc Verify reverse copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      arr.reverse().copyWithin(0, 2, 4);
      expect(arr.$_get(0)).assertEqual(20);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(20);
      expect(arr.$_get(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArrayReversePart04Test022
     * @tc.desc Verify reverse subarray ( buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sub: Int32Array = arr.reverse().subarray(1, 4);
      expect(sub.length).assertEqual(3);
      expect(sub.$_get(0)).assertEqual(4);
      expect(sub.$_get(2)).assertEqual(2);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArrayReversePart04Test023
     * @tc.desc Verify reverse slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33, 44);
      let s: Int32Array = arr.reverse().slice(0, 2);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(44);
      expect(s.$_get(1)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArrayReversePart04Test024
     * @tc.desc Verify reverse indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let idx: int = arr.reverse().indexOf(9);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArrayReversePart04Test025
     * @tc.desc Verify fill( ) reverse this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let ret: Int32Array = arr.fill(7).reverse();
      expect(ret).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArrayReversePart04Test026
     * @tc.desc Verify sort reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 4, 1, 5);
      arr.sort().reverse();
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArrayReversePart04Test027
     * @tc.desc Verify reverse at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let first: number | undefined = arr.reverse().at(0);
      let last: number | undefined = arr.at(-1);
      expect(first as number).assertEqual(30);
      expect(last as number).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArrayReversePart04Test028
     * @tc.desc Verify reverse findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(55, 66, 77);
      arr.reverse();
      expect(arr.findIndex((v: number): boolean => v === 55)).assertEqual(2);
      expect(arr.findIndex((v: number): boolean => v === 77)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArrayReversePart04Test029
     * @tc.desc Verify reverse lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9, 8, 7);
      arr.reverse();
      expect(arr.lastIndexOf(9)).assertEqual(2);
      expect(arr.lastIndexOf(7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArrayReversePart04Test030
     * @tc.desc Verify set reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let src: Int32Array = Int32Array.of(7, 8, 9, 10);
      arr.set(src);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArrayReversePart04Test031
     * @tc.desc Verify from reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let dst: Int32Array = Int32Array.from(src);
      dst.reverse();
      expect(src.$_get(0)).assertEqual(1);
      expect(dst.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArrayReversePart04Test032
     * @tc.desc Verify reverse $_get(0) $_get(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(111, 222);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(222);
      expect(arr.$_get(1)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArrayReversePart04Test033
     * @tc.desc Verify reverse length/byteLength/byteOffset byteLength==length*BYTES_PER_ELEMENT; Also verify verify ( )reverse $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(1);

      {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.reverse();
      expect(arr.byteLength).assertEqual(arr.length * arr.BYTES_PER_ELEMENT);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArrayReversePart04Test034
     * @tc.desc Verify ( )reverse $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(60);
      expect(arr.$_get(2)).assertEqual(40);
      expect(arr.$_get(3)).assertEqual(30);
      expect(arr.$_get(5)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArrayReversePart04Test035
     * @tc.desc Verify reverse [] ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77, 88, 99);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(99);
      expect(arr.$_get(2)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArrayReversePart04Test036
     * @tc.desc Verify reverse forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let collected: Int32Array = new Int32Array(3);
      let idx: int = 0;
      arr.reverse();
      arr.forEach((value: number, i: int, a: Int32Array) => {
        collected.$_set(idx, value);
        idx = idx + 1;
      });
      expect(collected.$_get(0)).assertEqual(3);
      expect(collected.$_get(1)).assertEqual(2);
      expect(collected.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArrayReversePart04Test037
     * @tc.desc Verify reverse for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5, 6);
      let first: number = 0;
      let seen: int = 0;
      arr.reverse();
      for (const v of arr) {
        if (seen === 0) {
          first = v;
        }
        seen = seen + 1;
      }
      expect(first).assertEqual(6);
      expect(seen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArrayReversePart04Test038
     * @tc.desc Verify reverse join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.reverse();
      let s: String = arr.join(',');
      expect(s.toString()).assertEqual('4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArrayReversePart04Test039
     * @tc.desc Verify reverse join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reverse();
      let s: String = arr.join('-');
      expect(s.toString()).assertEqual('3-2-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArrayReversePart04Test040
     * @tc.desc Verify reverse toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5, 6);
      arr.reverse();
      let s: String = arr.toString();
      expect(s.toString()).assertEqual('6,5,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArrayReversePart04Test041
     * @tc.desc Verify reverse includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7, 8);
      arr.reverse();
      let found: boolean = arr.includes(5);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArrayReversePart04Test042
     * @tc.desc Verify reverse [Symbol.iterator]() next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      arr.reverse();
      let it = arr.values();
      let r1 = it.next();
      expect(Double.toInt(r1.value as number)).assertEqual(9);
      let r2 = it.next();
      expect(Double.toInt(r2.value as number)).assertEqual(8);
      let r3 = it.next();
      expect(Double.toInt(r3.value as number)).assertEqual(7);
      let r4 = it.next();
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArrayReversePart04Test043
     * @tc.desc Verify reverse values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200);
      arr.reverse();
      let seen: int = 0;
      let first: number = 0;
      for (const v of arr.values()) {
        if (seen === 0) {
          first = v;
        }
        seen = seen + 1;
      }
      expect(first).assertEqual(200);
      expect(seen).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArrayReversePart04Test044
     * @tc.desc Verify reverse keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7, 8);
      arr.reverse();
      let hit: boolean = false;
      for (const k of arr.keys()) {
        if (k === 0) {
          expect(arr.$_get(k)).assertEqual(8);
          hit = true;
        }
      }
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArrayReversePart04Test045
     * @tc.desc Verify reverse find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.reverse();
      let v: number | undefined = arr.find((x: number): boolean => x === 30);
      expect(v as number).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArrayReversePart04Test046
     * @tc.desc Verify reverse some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reverse();
      let r: boolean = arr.some((v: number): boolean => v === 3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArrayReversePart04Test047
     * @tc.desc Verify reverse every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 4, 6);
      arr.reverse();
      let r: boolean = arr.every((v: number): boolean => v > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArrayReversePart04Test048
     * @tc.desc Verify reverse map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reverse();
      let mapped: Int32Array = arr.map((v: number): number => v * 10);
      expect(mapped.$_get(0)).assertEqual(30);
      expect(mapped.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArrayReversePart04Test049
     * @tc.desc Verify reverse reduce ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sumBefore: number = arr.reduce((acc: number, v: number): number => acc + v, 0);
      arr.reverse();
      let sumAfter: number = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(sumBefore).assertEqual(sumAfter);
      expect(sumAfter).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArrayReversePart04Test050
     * @tc.desc Verify reverse reduceRight ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.reverse();
      let order: Int32Array = new Int32Array(3);
      let p: int = 0;
      arr.reduce((acc: number, v: number): number => {
        if (p < 3) {
          order.$_set(p, v);
        }
        p = p + 1;
        return acc;
      }, 0);
      expect(order.$_get(0)).assertEqual(4);
      expect(order.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArrayReversePart04Test051
     * @tc.desc Verify reverse forEach array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      arr.reverse();
      let sameRef: boolean = false;
      arr.forEach((value: number, i: int, a: Int32Array) => {
        if (a === arr) {
          sameRef = true;
        }
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArrayReversePart04Test052
     * @tc.desc Verify (100 )reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let N: int = 100;
      let arr: Int32Array = new Int32Array(N);
      for (let i: int = 0; i < N; i = i + 1) {
        arr.$_set(i, i);
      }
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(99);
      expect(arr.$_get(99)).assertEqual(0);
      expect(arr.$_get(50)).assertEqual(49);
      expect(arr.$_get(49)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArrayReversePart04Test053
     * @tc.desc Verify reverse join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.reverse();
      let s: String = arr.join(',');
      expect(s.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArrayReversePart04Test054
     * @tc.desc Verify $_set reverse,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.$_set(0, 100);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArrayReversePart04Test055
     * @tc.desc Verify reverse $_set ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reverse();
      arr.$_set(0, 999);
      expect(arr.$_get(0)).assertEqual(999);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArrayReversePart04Test056
     * @tc.desc Verify fill(0) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(0).reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArrayReversePart04Test057
     * @tc.desc Verify reverse/fill/copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.reverse();
      arr.fill(9, 0, 2);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArrayReversePart04Test058
     * @tc.desc Verify forEach reverse, 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let visited: Int32Array = new Int32Array(4);
      let pos: int = 0;
      arr.forEach((value: number, i: int, a: Int32Array) => {
        visited.$_set(pos, value);
        pos = pos + 1;
        if (i === 1) {
          a.reverse();
        }
      });
      expect(pos).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArrayReversePart04Test059
     * @tc.desc Verify map reverse,map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let trigger: int = 0;
      let out: Int32Array = arr.map((value: number, i: int, a: Int32Array): number => {
        if (i === 0 && trigger === 0) {
          trigger = 1;
          a.reverse();
        }
        return value * 10;
      });
      expect(out.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArrayReversePart04Test060
     * @tc.desc Verify every reverse, length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let seen: int = 0;
      let result: boolean = arr.every((value: number, i: int, a: Int32Array): boolean => {
        seen = seen + 1;
        if (i === 1) {
          a.reverse();
        }
        return value > 0;
      });
      expect(result).assertTrue();
      expect(seen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArrayReversePart04Test061
     * @tc.desc Verify reduce reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sum: number = arr.reduce((acc: number, value: number, i: int, a: Int32Array): number => {
        if (i === 2) {
          a.reverse();
        }
        return acc + value;
      }, 0);
      expect(arr.$_get(0)).assertEqual(4);
      expect(sum).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArrayReversePart04Test062
     * @tc.desc Verify entries next reverse,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300);
      let it = arr.entries();
      let first = it.next();
      expect(first.done).assertFalse();
      arr.reverse();
      it.next();
      it.next();
      let fourth = it.next();
      expect(fourth.done).assertTrue();
      expect(arr.$_get(0)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArrayReversePart04Test063
     * @tc.desc Verify find reverse find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let callCount: int = 0;
      let found: number | undefined = arr.find((value: number, i: int, a: Int32Array): boolean => {
        callCount = callCount + 1;
        if (i === 1) {
          a.reverse();
        }
        return value === 5;
      });
      expect(arr.$_get(0)).assertEqual(5);
      expect(found).assertUndefined();
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArrayReversePart04Test064
     * @tc.desc Verify some reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let hits: int = 0;
      let result: boolean = arr.some((v: number, i: int, a: Int32Array): boolean => {
        hits = hits + 1;
        if (i === 0) {
          a.reverse();
        }
        return v === 10;
      });
      expect(arr.$_get(0)).assertEqual(40);
      expect(result).assertTrue();
      expect(hits).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArrayReversePart04Test065
     * @tc.desc Verify filter reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let out: Int32Array = arr.filter((v: number, i: int, a: Int32Array): boolean => {
        if (i === 1) {
          a.reverse();
        }
        return v > 0;
      });
      expect(arr.$_get(0)).assertEqual(4);
      expect(out.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArrayReversePart04Test066
     * @tc.desc Verify INT_MAX(2147483647) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 0, -1);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArrayReversePart04Test067
     * @tc.desc Verify INT_MIN(-2147483648) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 1, 2);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArrayReversePart04Test068
     * @tc.desc Verify 0x7FFFFFFF -0x80000000 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0x7FFFFFFF, 0, -0x80000000);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArrayReversePart04Test069
     * @tc.desc Verify INT_MAX reverse INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 2147483647, 2147483647);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArrayReversePart04Test070
     * @tc.desc Verify INT_MIN reverse INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, -2147483648);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_7100
     * @tc.name int32ArrayReversePart04Test071
     * @tc.desc Verify -1 reverse -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 1);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_7200
     * @tc.name int32ArrayReversePart04Test072
     * @tc.desc Verify INT_MAX reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 2147483647, 40, 50);
      arr.reverse();
      expect(arr.$_get(2)).assertEqual(2147483647);
      expect(arr.$_get(0)).assertEqual(50);
      expect(arr.$_get(4)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_7300
     * @tc.name int32ArrayReversePart04Test073
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648, 2147483647, -2147483648);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(2147483647);
      expect(arr.$_get(2)).assertEqual(-2147483648);
      expect(arr.$_get(3)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_7400
     * @tc.name int32ArrayReversePart04Test074
     * @tc.desc Verify $_set 2147483648(ToInt32 -2147483648) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, -2147483648);
      arr.$_set(1, 7);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_7500
     * @tc.name int32ArrayReversePart04Test075
     * @tc.desc Verify $_set 4294967295(0xFFFFFFFF -1) reverse-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, -1);
      arr.$_set(1, 2);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_7600
     * @tc.name int32ArrayReversePart04Test076
     * @tc.desc Verify reverse DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 0x12345678);
      arr.$_set(1, 0x7ABCDEF0);
      let dv: DataView = new DataView(buf);
      arr.reverse();
      expect(dv.getInt32(0, true)).assertEqual(0x7ABCDEF0);
      expect(dv.getInt32(4, true)).assertEqual(0x12345678);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_7700
     * @tc.name int32ArrayReversePart04Test077
     * @tc.desc Verify reverse 4 0x01020304
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Int32Array = new Int32Array(buf);
      view.$_set(0, 0x01020304);
      view.$_set(1, 0x0A0B0C0D);
      view.$_set(2, 0x7FFFFFFF);
      view.reverse();
      expect(view.$_get(0)).assertEqual(0x7FFFFFFF);
      expect(view.$_get(2)).assertEqual(0x01020304);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_7800
     * @tc.name int32ArrayReversePart04Test078
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 100);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(100);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_7900
     * @tc.name int32ArrayReversePart04Test079
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648, -2147483648, 2147483647);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(-2147483648);
      expect(arr.$_get(2)).assertEqual(-2147483648);
      expect(arr.$_get(3)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_8000
     * @tc.name int32ArrayReversePart04Test080
     * @tc.desc Verify reverse buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 10);
      parent.$_set(1, 20);
      parent.$_set(2, 30);
      parent.$_set(3, 40);
      let child: Int32Array = new Int32Array(buf, 0, 4);
      child.reverse();
      expect(parent.$_get(0)).assertEqual(40);
      expect(parent.$_get(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_8100
     * @tc.name int32ArrayReversePart04Test081
     * @tc.desc Verify byteOffset=8 3 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 100);
      parent.$_set(1, 200);
      parent.$_set(2, 300);
      parent.$_set(3, 400);
      parent.$_set(4, 500);
      parent.$_set(5, 600);
      let child: Int32Array = new Int32Array(buf, 8, 3);
      child.reverse();
      expect(parent.$_get(2)).assertEqual(500);
      expect(parent.$_get(3)).assertEqual(400);
      expect(parent.$_get(4)).assertEqual(300);
      expect(parent.$_get(0)).assertEqual(100);
      expect(parent.$_get(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_8200
     * @tc.name int32ArrayReversePart04Test082
     * @tc.desc Verify (Int32Array) reverse ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      let b: Int32Array = new Int32Array(buf, 4, 3);
      a.$_set(0, 11);
      a.$_set(1, 22);
      a.$_set(2, 33);
      b.$_set(0, 44);
      b.$_set(1, 55);
      b.$_set(2, 66);
      a.reverse();
      expect(b.$_get(0)).assertEqual(44);
      expect(b.$_get(2)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_8300
     * @tc.name int32ArrayReversePart04Test083
     * @tc.desc Verify reverse,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let parent: Int32Array = new Int32Array(buf);
      for (let i: int = 0; i < 6; i = i + 1) {
        parent.$_set(i, i + 1);
      }
      let sub: Int32Array = new Int32Array(buf, 8, 2);
      parent.reverse();
      expect(sub.$_get(0)).assertEqual(4);
      expect(sub.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_8400
     * @tc.name int32ArrayReversePart04Test084
     * @tc.desc Verify reverse DataView buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 0x11111111);
      arr.$_set(1, 0x22222222);
      let dv: DataView = new DataView(buf);
      arr.reverse();
      expect(dv.getInt32(0, true)).assertEqual(0x22222222);
      expect(dv.getInt32(4, true)).assertEqual(0x11111111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_8500
     * @tc.name int32ArrayReversePart04Test085
     * @tc.desc Verify Uint8Array Int32Array reverse 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let i32: Int32Array = new Int32Array(buf);
      i32.$_set(0, 1);
      i32.$_set(1, 2);
      let u8: Uint8Array = new Uint8Array(buf);
      let beforeFirstByte: number = u8.$_get(0);
      i32.reverse();
      expect(u8.$_get(4)).assertEqual(beforeFirstByte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_8600
     * @tc.name int32ArrayReversePart04Test086
     * @tc.desc Verify 1 reverse no-op,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      parent.$_set(2, 3);
      let sub: Int32Array = new Int32Array(buf, 4, 1);
      sub.reverse();
      expect(parent.$_get(0)).assertEqual(1);
      expect(parent.$_get(1)).assertEqual(2);
      expect(parent.$_get(2)).assertEqual(3);
      expect(sub.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_8700
     * @tc.name int32ArrayReversePart04Test087
     * @tc.desc Verify reverse reverse ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      for (let i: int = 0; i < 4; i = i + 1) {
        parent.$_set(i, i + 1);
      }
      let sub: Int32Array = new Int32Array(buf, 0, 4);
      parent.reverse();
      sub.reverse();
      expect(parent.$_get(0)).assertEqual(1);
      expect(parent.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_8800
     * @tc.name int32ArrayReversePart04Test088
     * @tc.desc Verify buffer offset reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      for (let i: int = 0; i < 5; i = i + 1) {
        let v: Int32Array = new Int32Array(buf, i * 4, 1);
        v.$_set(0, (i + 1) * 10);
      }
      let mid: Int32Array = new Int32Array(buf, 4, 3);
      mid.reverse();
      let full: Int32Array = new Int32Array(buf);
      expect(full.$_get(0)).assertEqual(10);
      expect(full.$_get(1)).assertEqual(40);
      expect(full.$_get(2)).assertEqual(30);
      expect(full.$_get(3)).assertEqual(20);
      expect(full.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_8900
     * @tc.name int32ArrayReversePart04Test089
     * @tc.desc Verify subarray reverse ( buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      let sub: Int32Array = arr.subarray(1, 5);
      sub.reverse();
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_9000
     * @tc.name int32ArrayReversePart04Test090
     * @tc.desc Verify slice buffer,reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let cp: Int32Array = arr.slice();
      cp.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
      expect(cp.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_9100
     * @tc.name int32ArrayReversePart04Test091
     * @tc.desc Verify reverse slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let cp: Int32Array = arr.slice();
      arr.reverse();
      expect(cp.$_get(0)).assertEqual(7);
      expect(cp.$_get(2)).assertEqual(9);
      expect(arr.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_9200
     * @tc.name int32ArrayReversePart04Test092
     * @tc.desc Verify of reverse (buffer )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(7, 8, 9);
      let b: Int32Array = Int32Array.of(7, 8, 9);
      a.reverse();
      expect(b.$_get(0)).assertEqual(7);
      expect(b.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_9300
     * @tc.name int32ArrayReversePart04Test093
     * @tc.desc Verify reverse buffer Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      a.reverse();
      let b: Int32Array = new Int32Array(buf);
      expect(b.$_get(0)).assertEqual(4);
      expect(b.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_9400
     * @tc.name int32ArrayReversePart04Test094
     * @tc.desc Verify 2 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 55);
      a.$_set(1, 66);
      let head: Int32Array = new Int32Array(buf, 0, 1);
      let tail: Int32Array = new Int32Array(buf, 4, 1);
      a.reverse();
      expect(head.$_get(0)).assertEqual(66);
      expect(tail.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_9500
     * @tc.name int32ArrayReversePart04Test095
     * @tc.desc Verify reverse subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reverse();
      let sub: Int32Array = arr.subarray(0, 2);
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sub.$_get(0)).assertEqual(3);
      expect(sub.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_9600
     * @tc.name int32ArrayReversePart04Test096
     * @tc.desc Verify subarray reverse no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let empty: Int32Array = arr.subarray(2, 2);
      empty.reverse();
      expect(empty.length).assertEqual(0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_9700
     * @tc.name int32ArrayReversePart04Test097
     * @tc.desc Verify byteOffset reverse ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let view: Int32Array = new Int32Array(buf, 8, 3);
      view.$_set(0, 10);
      view.$_set(1, 20);
      view.$_set(2, 30);
      view.reverse();
      expect(view.byteOffset).assertEqual(8);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(30);
      expect(view.$_get(2)).assertEqual(10);
      let prefix: Int32Array = new Int32Array(buf, 0, 2);
      expect(prefix.$_get(0)).assertEqual(0);
      expect(prefix.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART04_TEST_MINDMAP_9800
     * @tc.name int32ArrayReversePart04Test098
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart04Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let w: Int32Array = new Int32Array(buf);
      w.$_set(0, 111);
      w.$_set(1, 222);
      w.$_set(2, 333);
      let r: Int32Array = new Int32Array(buf);
      r.reverse();
      let observer: Int32Array = new Int32Array(buf);
      expect(observer.$_get(0)).assertEqual(333);
      expect(observer.$_get(1)).assertEqual(222);
      expect(observer.$_get(2)).assertEqual(111);
    });

  });
}
