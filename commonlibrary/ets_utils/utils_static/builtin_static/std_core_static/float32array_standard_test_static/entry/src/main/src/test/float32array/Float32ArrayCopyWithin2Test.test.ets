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

export default function Float32ArrayCopyWithin2Test(): void {
  describe('Float32ArrayCopyWithin2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_0100
     * @tc.name testFloat32ArrayCopyWithinTWO001
     * @tc.desc Verify return value is the receiver and copied elements are written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.copyWithin(0, 1);
      expect(r).assertEqual(arr);
      expect(r.$_get(0)).assertEqual(10.0);
      expect(r.$_get(1)).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_0200
     * @tc.name testFloat32ArrayCopyWithinTWO002
     * @tc.desc Verify return value instanceof Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.copyWithin(0, 1, 2);
      expect(r instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_0300
     * @tc.name testFloat32ArrayCopyWithinTWO003
     * @tc.desc Verify return value is not a plain array, Array.isArray is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.0, 4.0]);
      const r: Float32Array = arr.copyWithin(0, 1);
      expect(Array.isArray(r)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_0400
     * @tc.name testFloat32ArrayCopyWithinTWO004
     * @tc.desc Verify empty array return value and original array are same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      const r: Float32Array = arr.copyWithin(0, 0);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_0500
     * @tc.name testFloat32ArrayCopyWithinTWO005
     * @tc.desc Verify when target is out of bounds with no-op, return value is still this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.copyWithin(5, 0);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_0600
     * @tc.name testFloat32ArrayCopyWithinTWO006
     * @tc.desc Verify three-parameter call return value and original array are same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r: Float32Array = arr.copyWithin(0, 1, 3);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_0700
     * @tc.name testFloat32ArrayCopyWithinTWO007
     * @tc.desc Verify start equals end empty copy, return value is still this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.copyWithin(0, 1, 1);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_0800
     * @tc.name testFloat32ArrayCopyWithinTWO008
     * @tc.desc Verify chained copyWithin then another copyWithin, result content is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.copyWithin(0, 1).copyWithin(3, 0);
      expect(arr.$_get(0)).assertEqual(2.0);
      expect(arr.$_get(3)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_0900
     * @tc.name testFloat32ArrayCopyWithinTWO009
     * @tc.desc Verify return value length equals original array length (multi-element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const r: Float32Array = arr.copyWithin(0, 2);
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_1000
     * @tc.name testFloat32ArrayCopyWithinTWO010
     * @tc.desc Verify empty array return value length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      const r: Float32Array = arr.copyWithin(0, 0);
      expect(r.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_1100
     * @tc.name testFloat32ArrayCopyWithinTWO011
     * @tc.desc Verify return value byteLength equals element count times 4 (multi-element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const r: Float32Array = arr.copyWithin(0, 2);
      expect(r.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_1200
     * @tc.name testFloat32ArrayCopyWithinTWO012
     * @tc.desc Verify empty array return value byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      const r: Float32Array = arr.copyWithin(0, 0);
      expect(r.byteLength).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_1300
     * @tc.name testFloat32ArrayCopyWithinTWO013
     * @tc.desc Verify default construction return value byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.copyWithin(0, 1);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_1400
     * @tc.name testFloat32ArrayCopyWithinTWO014
     * @tc.desc Verify buffer view offset 8, return value byteOffset is 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const arr: Float32Array = new Float32Array(buf, 8, 3);
      const r: Float32Array = arr.copyWithin(0, 1);
      expect(r.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_1500
     * @tc.name testFloat32ArrayCopyWithinTWO015
     * @tc.desc Verify return value buffer and original array buffer are same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.copyWithin(0, 1);
      expect(r.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_1600
     * @tc.name testFloat32ArrayCopyWithinTWO016
     * @tc.desc Verify write through return value reflected in original array (shared buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.copyWithin(0, 1);
      r.$_set(0, 99.0);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_1700
     * @tc.name testFloat32ArrayCopyWithinTWO017
     * @tc.desc Verify buffer view array return value buffer and view buffer are same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Float32Array = new Float32Array(buf, 0, 4);
      const r: Float32Array = arr.copyWithin(0, 2);
      expect(r.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_1800
     * @tc.name testFloat32ArrayCopyWithinTWO018
     * @tc.desc Verify subarray derived view copyWithin return value and view are same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view: Float32Array = base.subarray(1, 3);
      const r: Float32Array = view.copyWithin(0, 1);
      expect(r).assertEqual(view);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_1900
     * @tc.name testFloat32ArrayCopyWithinTWO019
     * @tc.desc Verify derived view copyWithin write reflected in base array (shared buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view: Float32Array = base.subarray(1, 3);
      view.copyWithin(0, 1);
      expect(base.$_get(1)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_2000
     * @tc.name testFloat32ArrayCopyWithinTWO020
     * @tc.desc Verify view copyWithin return value byteOffset matches a static-input view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const view: Float32Array = base.subarray(2);
      const r: Float32Array = view.copyWithin(0, 1);
      expect(r.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_2100
     * @tc.name testFloat32ArrayCopyWithinTWO021
     * @tc.desc Verify multi-view shared buffer only copyWithin view interval is modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const v1: Float32Array = new Float32Array(buf, 0, 2);
      const v2: Float32Array = new Float32Array(buf, 8, 2);
      v1.$_set(0, 11.0);
      v1.$_set(1, 22.0);
      v1.copyWithin(0, 1);
      expect(v2.$_get(0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_2200
     * @tc.name testFloat32ArrayCopyWithinTWO022
     * @tc.desc Verify view copyWithin write child read parent another view (shared buffer cross)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const parent: Float32Array = new Float32Array(buf, 0, 5);
      const child: Float32Array = parent.subarray(1, 4);
      child.$_set(0, 5.0);
      child.$_set(1, 6.0);
      child.$_set(2, 7.0);
      child.copyWithin(0, 2);
      expect(parent.$_get(1)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_2300
     * @tc.name testFloat32ArrayCopyWithinTWO023
     * @tc.desc Verify copyWithin with target equal start keeps all elements unchanged and returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstValue: number = 1.0;
      const secondValue: number = 2.0;
      const thirdValue: number = 3.0;
      const arr: Float32Array = Float32Array.of(firstValue, secondValue, thirdValue);
      const result: Float32Array = arr.copyWithin(1, 1, 3);
      expect(result).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(firstValue);
      expect(arr.$_get(1)).assertEqual(secondValue);
      expect(arr.$_get(2)).assertEqual(thirdValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_2400
     * @tc.name testFloat32ArrayCopyWithinTWO024
     * @tc.desc Verify copyWithin with start equal end performs no write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(4.0, 5.0, 6.0);
      const beforeFirst: number = arr.$_get(0);
      const beforeSecond: number = arr.$_get(1);
      const beforeThird: number = arr.$_get(2);
      arr.copyWithin(0, 2, 2);
      expect(arr.$_get(0)).assertEqual(beforeFirst);
      expect(arr.$_get(1)).assertEqual(beforeSecond);
      expect(arr.$_get(2)).assertEqual(beforeThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_2500
     * @tc.name testFloat32ArrayCopyWithinTWO025
     * @tc.desc Verify copyWithin with target at length leaves the array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(7.0, 8.0, 9.0);
      const targetIndex: int = arr.length;
      const beforeText: string = arr.join(',');
      arr.copyWithin(targetIndex, 0, 2);
      const actualText: string = arr.join(',');
      expect(actualText).assertEqual(beforeText);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_2600
     * @tc.name testFloat32ArrayCopyWithinTWO026
     * @tc.desc Verify copyWithin with negative target writes at the computed last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstValue: number = 10.0;
      const secondValue: number = 20.0;
      const thirdValue: number = 30.0;
      const arr: Float32Array = Float32Array.of(firstValue, secondValue, thirdValue);
      arr.copyWithin(-1, 0, 1);
      expect(arr.$_get(0)).assertEqual(firstValue);
      expect(arr.$_get(1)).assertEqual(secondValue);
      expect(arr.$_get(2)).assertEqual(firstValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_2700
     * @tc.name testFloat32ArrayCopyWithinTWO027
     * @tc.desc Verify overlapping copyWithin uses source order and produces the expected shifted sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const targetIndex: int = 1;
      const startIndex: int = 0;
      const endIndex: int = 3;
      arr.copyWithin(targetIndex, startIndex, endIndex);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(1.0);
      expect(arr.$_get(2)).assertEqual(2.0);
      expect(arr.$_get(3)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTWO_2800
     * @tc.name testFloat32ArrayCopyWithinTWO028
     * @tc.desc Verify negative target normalization still returns the receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.copyWithin(-2, 0, 1);
      expect(result).assertEqual(arr);
      expect(arr.$_get(2)).assertEqual(1.0);
    });

  });
}
