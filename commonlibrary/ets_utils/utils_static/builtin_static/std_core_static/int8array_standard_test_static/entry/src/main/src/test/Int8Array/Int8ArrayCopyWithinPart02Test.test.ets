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
import Utils from '../Util.test';

export default function int8ArrayCopyWithinPart02Test(): void {
  describe('Int8ArrayCopyWithinPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0100
     * @tc.name int8ArrayCopyWithinPart02Test001
     * @tc.desc Verify copyWithin returns non-undefined (API contract test), with copyWithin(0, 1, 3), on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 1, 3);
      let r1: number = ret.$_get(0);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = ret.$_get(1);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
      let r3: number = ret.$_get(3);
      let e3: int = 4;
      expect(r3).assertEqual(e3);
      let r4: number = ret.$_get(4);
      let e4: int = 5;
      expect(r4).assertEqual(e4);
      let r5: int = ret.length;
      let e5: int = 5;
      expect(r5).assertEqual(e5);
      let r6: int = ret.byteLength;
      let e6: int = 5;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0200
     * @tc.name int8ArrayCopyWithinPart02Test002
     * @tc.desc Verify copyWithin returns non-undefined (API contract test), with copyWithin(0, 0, 0), on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let ret = arr.copyWithin(0, 0, 0);
      let r1: int = ret.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: int = ret.byteLength;
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      expect(ret).assertEqual(arr);
      let r3: ArrayBuffer = ret.buffer;
      let e3: ArrayBuffer = arr.buffer;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0300
     * @tc.name int8ArrayCopyWithinPart02Test003
     * @tc.desc Verify copyWithin returns non-undefined (API contract test), with copyWithin(0, 0, 1), on new Int8Array([7])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7]);
      let ret = arr.copyWithin(0, 0, 1);
      let r1: number = ret.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      let r2: int = ret.length;
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0400
     * @tc.name int8ArrayCopyWithinPart02Test004
     * @tc.desc Verify copyWithin returns non-undefined (API contract test), with copyWithin(-1, -3, -2), on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(-1, -3, -2);
      let r1: number = ret.$_get(4);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0500
     * @tc.name int8ArrayCopyWithinPart02Test005
     * @tc.desc Verify copyWithin returns non-undefined (API contract test), with copyWithin(-2, -3, -1), on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let ret = arr.copyWithin(-2, -3, -1);
      let r1: number = ret.$_get(2);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0600
     * @tc.name int8ArrayCopyWithinPart02Test006
     * @tc.desc Verify copyWithin expects arr.length, with copyWithin(0, 1, 2), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let ret = arr.copyWithin(0, 1, 2);
      expect(ret.length).assertEqual(arr.length);
      let r1: number = ret.$_get(0);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = ret.$_get(2);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0700
     * @tc.name int8ArrayCopyWithinPart02Test007
     * @tc.desc Verify copyWithin expects arr.length, with copyWithin(0, 0, 0), on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let ret = arr.copyWithin(0, 0, 0);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0800
     * @tc.name int8ArrayCopyWithinPart02Test008
     * @tc.desc Verify copyWithin(0, 2).copyWithin(1, 3) expects arr.length on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 2).copyWithin(1, 3);
      expect(ret.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_0900
     * @tc.name int8ArrayCopyWithinPart02Test009
     * @tc.desc Verify copyWithin(0, 1, 2) keeps length 6 on 6-byte ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let view = new Int8Array(buf, 0, 6);
      view.$_set(0, 5);
      view.$_set(1, 6);
      view.$_set(2, 7);
      let ret = view.copyWithin(0, 1, 2);
      expect(ret.length).assertEqual(view.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1000
     * @tc.name int8ArrayCopyWithinPart02Test010
     * @tc.desc Verify copyWithin expects arr.length, with copyWithin(100, 0, 1), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let ret = arr.copyWithin(100, 0, 1);
      expect(ret.length).assertEqual(arr.length);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1100
     * @tc.name int8ArrayCopyWithinPart02Test011
     * @tc.desc Verify copyWithin target=0 start=3 copies elements from start to end of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 3);
      expect(ret.$_get(0)).assertEqual(4);
      expect(ret.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1200
     * @tc.name int8ArrayCopyWithinPart02Test012
     * @tc.desc Verify copyWithin target=3 start=0 end=2 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let ret = arr.copyWithin(3, 0, 2);
      expect(ret.$_get(3)).assertEqual(1);
      expect(ret.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1300
     * @tc.name int8ArrayCopyWithinPart02Test013
     * @tc.desc Verify copyWithin target=0 start=0 end=2 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 0, 2);
      expect(ret.$_get(0)).assertEqual(1);
      expect(ret.$_get(1)).assertEqual(2);
      let r1: number = ret.$_get(2);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = ret.$_get(3);
      let e2: int = 4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1400
     * @tc.name int8ArrayCopyWithinPart02Test014
     * @tc.desc Verify copyWithin target=3 start=0 end=1 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([9, 8, 7, 6]);
      let ret = arr.copyWithin(3, 0, 1);
      expect(ret.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1500
     * @tc.name int8ArrayCopyWithinPart02Test015
     * @tc.desc Verify copyWithin target=0 start=2 end=100 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 2, 100);
      expect(ret.$_get(0)).assertEqual(3);
      expect(ret.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1600
     * @tc.name int8ArrayCopyWithinPart02Test016
     * @tc.desc Verify copyWithin target=100 start=0 end=2 is a no-op keeping [1,2,3,4], on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(100, 0, 2);
      expect(ret.$_get(0)).assertEqual(1);
      expect(ret.$_get(1)).assertEqual(2);
      let r1: int = ret.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1700
     * @tc.name int8ArrayCopyWithinPart02Test017
     * @tc.desc Verify copyWithin target=-2 start=0 end=2 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(-2, 0, 2);
      expect(ret.$_get(3)).assertEqual(1);
      expect(ret.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1800
     * @tc.name int8ArrayCopyWithinPart02Test018
     * @tc.desc Verify copyWithin target=0 start=-2 copies elements from start to end of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, -2);
      expect(ret.$_get(0)).assertEqual(4);
      expect(ret.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_1900
     * @tc.name int8ArrayCopyWithinPart02Test019
     * @tc.desc Verify copyWithin target=0 start=1 end=-1 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 1, -1);
      expect(ret.$_get(0)).assertEqual(2);
      expect(ret.$_get(1)).assertEqual(3);
      expect(ret.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2000
     * @tc.name int8ArrayCopyWithinPart02Test020
     * @tc.desc Verify copyWithin target=-3 start=-4 end=-2 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40, 50]);
      let ret = arr.copyWithin(-3, -4, -2);
      expect(ret.$_get(2)).assertEqual(20);
      expect(ret.$_get(3)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2100
     * @tc.name int8ArrayCopyWithinPart02Test021
     * @tc.desc Verify copyWithin target=-4 start=2 end=4 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(-4, 2, 4);
      expect(ret.$_get(0)).assertEqual(3);
      expect(ret.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2200
     * @tc.name int8ArrayCopyWithinPart02Test022
     * @tc.desc Verify copyWithin target=2 start=-4 end=-2 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 6, 7, 8]);
      let ret = arr.copyWithin(2, -4, -2);
      expect(ret.$_get(2)).assertEqual(5);
      expect(ret.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2300
     * @tc.name int8ArrayCopyWithinPart02Test023
     * @tc.desc Verify copyWithin target=1 start=0 end=4 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(1, 0, 4);
      expect(ret.$_get(1)).assertEqual(1);
      expect(ret.$_get(2)).assertEqual(2);
      expect(ret.$_get(3)).assertEqual(3);
      expect(ret.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2400
     * @tc.name int8ArrayCopyWithinPart02Test024
     * @tc.desc Verify copyWithin target=0 start=1 end=4 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 1, 4);
      expect(ret.$_get(0)).assertEqual(2);
      expect(ret.$_get(1)).assertEqual(3);
      expect(ret.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2500
     * @tc.name int8ArrayCopyWithinPart02Test025
     * @tc.desc Verify copyWithin target=1 start=1 end=3 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(1, 1, 3);
      expect(ret.$_get(1)).assertEqual(2);
      expect(ret.$_get(2)).assertEqual(3);
      let r1: number = ret.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = ret.$_get(3);
      let e2: int = 4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2600
     * @tc.name int8ArrayCopyWithinPart02Test026
     * @tc.desc Verify copyWithin target=2 start=0 end=3 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let ret = arr.copyWithin(2, 0, 3);
      expect(ret.$_get(2)).assertEqual(1);
      expect(ret.$_get(3)).assertEqual(2);
      expect(ret.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2700
     * @tc.name int8ArrayCopyWithinPart02Test027
     * @tc.desc Verify copyWithin target=2 start=1 end=5 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(2, 1, 5);
      expect(ret.$_get(2)).assertEqual(2);
      expect(ret.$_get(3)).assertEqual(3);
      expect(ret.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2800
     * @tc.name int8ArrayCopyWithinPart02Test028
     * @tc.desc Verify copyWithin target=0 start=3 end=5 copies 4,5 to head on new Int8Array([1, 2, 3, 4, 5, 6])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let ret = arr.copyWithin(0, 3, 5);
      let r1: number = ret.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = ret.$_get(1);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
      expect(ret.$_get(4)).assertEqual(5);
      expect(ret.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_2900
     * @tc.name int8ArrayCopyWithinPart02Test029
     * @tc.desc Verify copyWithin target=0 start=100 end=200 is a no-op keeping [1,2,3,4], on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 100, 200);
      expect(ret.$_get(0)).assertEqual(1);
      expect(ret.$_get(3)).assertEqual(4);
      let r1: int = ret.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3000
     * @tc.name int8ArrayCopyWithinPart02Test030
     * @tc.desc Verify copyWithin does nothing when start >= end, with copyWithin(0, 3, 1), on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 3, 1);
      expect(ret.$_get(0)).assertEqual(1);
      expect(ret.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3100
     * @tc.name int8ArrayCopyWithinPart02Test031
     * @tc.desc Verify copyWithin(0, 0, 0) keeps length 0 on empty new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let ret = arr.copyWithin(0, 0, 0);
      let r1: int = ret.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3200
     * @tc.name int8ArrayCopyWithinPart02Test032
     * @tc.desc Verify copyWithin target=0 start=1 end=1000 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 1, 1000);
      let r1: int = ret.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = ret.$_get(0);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = ret.$_get(1);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
      let r4: number = ret.$_get(3);
      let e4: int = 4;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3300
     * @tc.name int8ArrayCopyWithinPart02Test033
     * @tc.desc Verify copyWithin(0, 2).copyWithin(1, 3) expects 5 on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 2).copyWithin(1, 3);
      expect(ret.length).assertEqual(5);
      expect(ret).assertEqual(arr);
      let r1: ArrayBuffer = ret.buffer;
      let e1: ArrayBuffer = arr.buffer;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3400
     * @tc.name int8ArrayCopyWithinPart02Test034
     * @tc.desc Verify copyWithin target=-3 start=-5 end=-1 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let ret = arr.copyWithin(-3, -5, -1);
      let r1: int = ret.length;
      let e1: int = 6;
      expect(r1).assertEqual(e1);
      let r2: number = ret.$_get(3);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = ret.$_get(4);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
      let r4: number = ret.$_get(5);
      let e4: int = 4;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3500
     * @tc.name int8ArrayCopyWithinPart02Test035
     * @tc.desc Verify copyWithin target=0 start=2 end=4 on view keeps byteLength 4 and buffer buf, on new Int8Array(buf, 0, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new Int8Array(buf, 0, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      let ret = view.copyWithin(0, 2, 4);
      let r1: int = ret.byteLength;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: ArrayBuffer = ret.buffer;
      let e2: ArrayBuffer = buf;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3600
     * @tc.name int8ArrayCopyWithinPart02Test036
     * @tc.desc Verify copyWithin target=0 start=1 end=3 on view keeps byteOffset 2 and buffer buf, on new Int8Array(buf, 2, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new Int8Array(buf, 2, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      let ret = view.copyWithin(0, 1, 3);
      let r1: int = ret.byteOffset;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: ArrayBuffer = ret.buffer;
      let e2: ArrayBuffer = buf;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3700
     * @tc.name int8ArrayCopyWithinPart02Test037
     * @tc.desc Verify copyWithin(0,2).copyWithin(1,4) expects 6 byteLength on new Int8Array([1, 2, 3, 4, 5, 6])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let ret = arr.copyWithin(0, 2).copyWithin(1, 4);
      let r1: int = ret.byteLength;
      let e1: int = 6;
      expect(r1).assertEqual(e1);
      let r2: number = ret.$_get(0);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
      let r3: number = ret.$_get(1);
      let e3: int = 5;
      expect(r3).assertEqual(e3);
      let r4: number = ret.$_get(5);
      let e4: int = 6;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3800
     * @tc.name int8ArrayCopyWithinPart02Test038
     * @tc.desc Verify copyWithin(0, 1, 3) returns this sharing arr.buffer, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 1, 3);
      expect(ret).assertEqual(arr);
      let r1: ArrayBuffer = ret.buffer;
      let e1: ArrayBuffer = arr.buffer;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_3900
     * @tc.name int8ArrayCopyWithinPart02Test039
     * @tc.desc Verify copyWithin(0, 0, 1) returns this on new Int8Array([9])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([9]);
      let ret = arr.copyWithin(0, 0, 1);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4000
     * @tc.name int8ArrayCopyWithinPart02Test040
     * @tc.desc Verify copyWithin(0, 1, 2) returns this on view, on new Int8Array(buf, 0, 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let view = new Int8Array(buf, 0, 6);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      let ret = view.copyWithin(0, 1, 2);
      expect(ret).assertEqual(view);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4100
     * @tc.name int8ArrayCopyWithinPart02Test041
     * @tc.desc Verify copyWithin(0,2).reverse() returns arr on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 2).reverse();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4200
     * @tc.name int8ArrayCopyWithinPart02Test042
     * @tc.desc Verify copyWithin(0, 2).fill(0, 0, 2) chain returns this, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.copyWithin(0, 2).fill(0, 0, 2);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4300
     * @tc.name int8ArrayCopyWithinPart02Test043
     * @tc.desc Verify copyWithin(0,2).sort() returns arr on new Int8Array([3, 1, 4, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 1, 4, 2]);
      let ret = arr.copyWithin(0, 2).sort();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4400
     * @tc.name int8ArrayCopyWithinPart02Test044
     * @tc.desc Verify copyWithin(0,1).copyWithin(2,4).copyWithin(3,0) returns arr on new Int8Array([1, 2, 3, 4, 5, 6])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let ret = arr.copyWithin(0, 1).copyWithin(2, 4).copyWithin(3, 0);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4500
     * @tc.name int8ArrayCopyWithinPart02Test045
     * @tc.desc Verify chained copyWithin(0, 0, 0) returns this on empty new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let ret = arr.copyWithin(0, 0, 0).copyWithin(0, 0, 0);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4600
     * @tc.name int8ArrayCopyWithinPart02Test046
     * @tc.desc Verify copyWithin(0, 2, 4) writes 30,40 to head readable via new view on new Int8Array(buf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr = new Int8Array(buf);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      arr.$_set(3, 40);
      arr.copyWithin(0, 2, 4);
      let reader = new Int8Array(buf);
      expect(reader.$_get(0)).assertEqual(30);
      expect(reader.$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4700
     * @tc.name int8ArrayCopyWithinPart02Test047
     * @tc.desc Verify copyWithin(0, 2, 4) does not affect bytes outside view range on new Int8Array(buf, 2, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new Int8Array(buf, 2, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      let outside = new Int8Array(buf, 0, 2);
      outside.$_set(0, 90);
      outside.$_set(1, 91);
      view.copyWithin(0, 2, 4);
      expect(outside.$_get(0)).assertEqual(90);
      expect(outside.$_get(1)).assertEqual(91);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4800
     * @tc.name int8ArrayCopyWithinPart02Test048
     * @tc.desc Verify copyWithin(0, 1, 2) copies 6 to view head keeping byteOffset 4, on new Int8Array(buf, 4, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let view = new Int8Array(buf, 4, 2);
      view.$_set(0, 5);
      view.$_set(1, 6);
      let ret = view.copyWithin(0, 1, 2);
      expect(ret.byteOffset).assertEqual(4);
      expect(ret.$_get(0)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_4900
     * @tc.name int8ArrayCopyWithinPart02Test049
     * @tc.desc Verify copyWithin(0, 1, 3) on subarray(2, 5) returns byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3, 4, 5, 6]);
      let sub = base.subarray(2, 5);
      let ret = sub.copyWithin(0, 1, 3);
      expect(ret.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5000
     * @tc.name int8ArrayCopyWithinPart02Test050
     * @tc.desc Verify copyWithin target=2 start=0 end=1 copies INT8_MAX to result[2], on new Int8Array([INT8_MAX, 1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5100
     * @tc.name int8ArrayCopyWithinPart02Test051
     * @tc.desc Verify copyWithin target=2 start=0 end=1 truncates -129 to INT8_MAX at result[2], on new Int8Array([-129, 1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-129, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5200
     * @tc.name int8ArrayCopyWithinPart02Test052
     * @tc.desc Verify copyWithin expects -INT8_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0x81, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5300
     * @tc.name int8ArrayCopyWithinPart02Test053
     * @tc.desc Verify copyWithin expects -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([128, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5400
     * @tc.name int8ArrayCopyWithinPart02Test054
     * @tc.desc Verify copyWithin expects -1, on new Int8Array([255, 1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([255, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5500
     * @tc.name int8ArrayCopyWithinPart02Test055
     * @tc.desc Verify copyWithin target=2 start=0 end=1 copies Number.NaN as 0 to result[2], on new Int8Array([Number.NaN, 1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([Number.NaN, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5600
     * @tc.name int8ArrayCopyWithinPart02Test056
     * @tc.desc Verify copyWithin target=2 start=0 end=1 truncates 1.9 to 1 at result[2], on new Int8Array([1.9, 1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1.9, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5700
     * @tc.name int8ArrayCopyWithinPart02Test057
     * @tc.desc Verify copyWithin expects -1, on new Int8Array([-1.9, 1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1.9, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5800
     * @tc.name int8ArrayCopyWithinPart02Test058
     * @tc.desc Verify copyWithin target=2 start=0 end=1 truncates 0x100 to 0 at result[2], on new Int8Array([0x100, 1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0x100, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_5900
     * @tc.name int8ArrayCopyWithinPart02Test059
     * @tc.desc Verify copyWithin target=2 start=0 end=100 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(2, 0, 100);
      expect(ret.$_get(2)).assertEqual(1);
      expect(ret.$_get(3)).assertEqual(2);
      expect(ret.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6000
     * @tc.name int8ArrayCopyWithinPart02Test060
     * @tc.desc Verify copyWithin target=1 start=0 end=5 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(1, 0, 5);
      expect(ret.$_get(1)).assertEqual(1);
      expect(ret.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6100
     * @tc.name int8ArrayCopyWithinPart02Test061
     * @tc.desc Verify copyWithin target=-2 start=-5 end=-1 copies source elements to target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5, 6]);
      let ret = arr.copyWithin(-2, -5, -1);
      expect(ret.$_get(4)).assertEqual(2);
      expect(ret.$_get(5)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6200
     * @tc.name int8ArrayCopyWithinPart02Test062
     * @tc.desc Verify copyWithin target=0 start=3 end=5 copies 4,5 to head, on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 3, 5);
      expect(ret.at(-1)).assertEqual(5);
      let r1: number = ret.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = ret.$_get(1);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6300
     * @tc.name int8ArrayCopyWithinPart02Test063
     * @tc.desc Verify subarray(1, 4) of copyWithin result has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let ret = arr.copyWithin(0, 1, 3);
      let sub = ret.subarray(1, 4);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6400
     * @tc.name int8ArrayCopyWithinPart02Test064
     * @tc.desc Verify copyWithin(2, 0, 1) on new Int8Array([Number.POSITIVE_INFINITY, 1, 2, 3]) copies Infinity clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([Number.POSITIVE_INFINITY, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART02_TEST_6500
     * @tc.name int8ArrayCopyWithinPart02Test065
     * @tc.desc Verify copyWithin(2, 0, 1) on new Int8Array([Number.NEGATIVE_INFINITY, 1, 2, 3]) copies Infinity clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([Number.NEGATIVE_INFINITY, 1, 2, 3]);
      let ret = arr.copyWithin(2, 0, 1);
      expect(ret.$_get(2)).assertEqual(0);
    });
  });
}
