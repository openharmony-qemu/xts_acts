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

export default function int8ArraySlicePart03Test(): void {
  describe('Int8ArraySlicePart03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_0100
     * @tc.name int8ArraySlicePart03Test001
     * @tc.desc Verify slice begin=length returns length=0 byteLength=0 BYTES_PER_ELEMENT=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(4);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
      let actualByteLen: int = r.byteLength;
      let expectedByteLen: int = 0;
      expect(actualByteLen).assertEqual(expectedByteLen);
      let actualBpe: int = r.BYTES_PER_ELEMENT;
      let expectedBpe: int = 1;
      expect(actualBpe).assertEqual(expectedBpe);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_0200
     * @tc.name int8ArraySlicePart03Test002
     * @tc.desc Verify slice begin=-length-1 clamped to 0 returns full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(-5);
      let actualLen: int = r.length;
      let expectedLen: int = 4;
      expect(actualLen).assertEqual(expectedLen);
      let actualVal: number = r.$_get(0);
      let expectedVal: int = 10;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_0300
     * @tc.name int8ArraySlicePart03Test003
     * @tc.desc Verify slice end=length+1 returns length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(0, 5);
      let actualLen: int = r.length;
      let expectedLen: int = 4;
      expect(actualLen).assertEqual(expectedLen);
      let actualVal: number = r.$_get(3);
      let expectedVal: int = 40;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_0400
     * @tc.name int8ArraySlicePart03Test004
     * @tc.desc Verify slice end=-length-1 returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(0, -5);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_0500
     * @tc.name int8ArraySlicePart03Test005
     * @tc.desc Verify slice end=-2147483648 returns length=0 byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(0, -2147483648);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
      let actualByteLen: int = r.byteLength;
      let expectedByteLen: int = 0;
      expect(actualByteLen).assertEqual(expectedByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_0600
     * @tc.name int8ArraySlicePart03Test006
     * @tc.desc Verify slice begin=2, end=1 begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(2, 1);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_0700
     * @tc.name int8ArraySlicePart03Test007
     * @tc.desc Verify slice begin=3, end=-3 begin > end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(3, -3);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_0800
     * @tc.name int8ArraySlicePart03Test008
     * @tc.desc Verify slice begin=length end=0 returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(4, 0);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_0900
     * @tc.name int8ArraySlicePart03Test009
     * @tc.desc Verify slice begin=5, end=3 begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(5, 3);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_1000
     * @tc.name int8ArraySlicePart03Test010
     * @tc.desc Verify slice begin=-1, end=-5 begin=3 > end=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(-1, -5);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_1100
     * @tc.name int8ArraySlicePart03Test011
     * @tc.desc Verify slice begin=-5, end=-5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(-5, -5);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_1200
     * @tc.name int8ArraySlicePart03Test012
     * @tc.desc Verify slice begin=2147483647, end=2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(2147483647, 2147483647);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_1300
     * @tc.name int8ArraySlicePart03Test013
     * @tc.desc Verify slice begin=2147483647, end=-2147483648 begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(2147483647, -2147483648);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_1400
     * @tc.name int8ArraySlicePart03Test014
     * @tc.desc Verify slice(undefined, 2) begin=undefined 0 end=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(undefined, 2);
      let actualLen: int = r.length;
      let expectedLen: int = 2;
      expect(actualLen).assertEqual(expectedLen);
      let actualVal: number = r.$_get(1);
      let expectedVal: int = 20;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_1500
     * @tc.name int8ArraySlicePart03Test015
     * @tc.desc Verify slice(2, undefined) begin=2 end=undefined length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(2, undefined);
      let actualLen: int = r.length;
      let expectedLen: int = 2;
      expect(actualLen).assertEqual(expectedLen);
      let actualVal: number = r.$_get(0);
      let expectedVal: int = 30;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_2100
     * @tc.name int8ArraySlicePart03Test021
     * @tc.desc Verify slice(-2147483648) begin 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Int8Array = new Int8Array([7]);
      let r: Int8Array = s.slice(-2147483648);
      let actualLen: int = r.length;
      let expectedLen: int = 1;
      expect(actualLen).assertEqual(expectedLen);
      let actualVal: number = r.$_get(0);
      let expectedVal: int = 7;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_2200
     * @tc.name int8ArraySlicePart03Test022
     * @tc.desc Verify slice(2, 2) begin=end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = new Int8Array([7, 7, 7, 7]);
      let r: Int8Array = a.slice(2, 2);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_2300
     * @tc.name int8ArraySlicePart03Test023
     * @tc.desc Verify slice(2, 2147483647) end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = new Int8Array([7, 7, 7, 7]);
      let r: Int8Array = a.slice(2, 2147483647);
      let actualLen: int = r.length;
      let expectedLen: int = 2;
      expect(actualLen).assertEqual(expectedLen);
      let actualVal: number = r.$_get(0);
      let expectedVal: int = 7;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_2400
     * @tc.name int8ArraySlicePart03Test024
     * @tc.desc Verify slice begin=end=-2147483648 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(-2147483648, -2147483648);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_2500
     * @tc.name int8ArraySlicePart03Test025
     * @tc.desc Verify slice begin=end=length returns length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(4, 4);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_2600
     * @tc.name int8ArraySlicePart03Test026
     * @tc.desc Verify slice() returns new Int8Array containing copy of specified range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(-2147483648, 2147483647);
      let actualVal: number = r.$_get(0);
      let expectedVal: int = 10;
      expect(actualVal).assertEqual(expectedVal);
      let actualVal2: number = r.$_get(3);
      let expectedVal2: int = 40;
      expect(actualVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_2700
     * @tc.name int8ArraySlicePart03Test027
     * @tc.desc Verify slice begin=-length-1 returns independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let copy: Int8Array = base.slice(-5);
      copy.$_set(0, 99);
      let actualVal: number = base.$_get(0);
      let expectedVal: int = 10;
      expect(actualVal).assertEqual(expectedVal);
      let actualVal2: number = copy.$_get(0);
      let expectedVal2: int = 99;
      expect(actualVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_2800
     * @tc.name int8ArraySlicePart03Test028
     * @tc.desc Verify slice begin=-5 0 end=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(-5, 2);
      let actualLen: int = r.length;
      let expectedLen: int = 2;
      expect(actualLen).assertEqual(expectedLen);
      let actualVal: number = r.$_get(0);
      let expectedVal: int = 10;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_2900
     * @tc.name int8ArraySlicePart03Test029
     * @tc.desc Verify slice begin=1 end= 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(1, 2147483647);
      let actualVal: number = r.$_get(0);
      let expectedVal: int = 20;
      expect(actualVal).assertEqual(expectedVal);
      let actualVal2: number = r.$_get(2);
      let expectedVal2: int = 40;
      expect(actualVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_3000
     * @tc.name int8ArraySlicePart03Test030
     * @tc.desc Verify slice begin=1 end=-5 0 begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(1, -5);
      let actualLen: int = r.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART03_TEST_3100
     * @tc.name int8ArraySlicePart03Test031
     * @tc.desc Verify slice begin=3 end=5 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([10, 20, 30, 40]);
      let r: Int8Array = base.slice(3, 5);
      let actualLen: int = r.length;
      let expectedLen: int = 1;
      expect(actualLen).assertEqual(expectedLen);
      let actualVal: number = r.$_get(0);
      let expectedVal: int = 40;
      expect(actualVal).assertEqual(expectedVal);
    });
  });
}
