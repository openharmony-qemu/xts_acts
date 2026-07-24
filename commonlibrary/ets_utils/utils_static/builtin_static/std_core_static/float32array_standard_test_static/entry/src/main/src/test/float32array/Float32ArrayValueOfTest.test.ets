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

export default function Float32ArrayValueOfTest(): void {
  describe('Float32ArrayValueOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_0100
     * @tc.name testFloat32ArrayValueOf001
     * @tc.desc Verify valueOf called with no arguments (valid arity 0) returns the this reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.valueOf();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_0200
     * @tc.name testFloat32ArrayValueOf002
     * @tc.desc Verify valueOf of an empty array returns its own reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_0300
     * @tc.name testFloat32ArrayValueOf003
     * @tc.desc Verify valueOf of a single-element array returns its own reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0]);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_0400
     * @tc.name testFloat32ArrayValueOf004
     * @tc.desc Verify valueOf of a multi-element array returns its own reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_0500
     * @tc.name testFloat32ArrayValueOf005
     * @tc.desc Verify valueOf of an array constructed with length returns its own reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(8);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_0600
     * @tc.name testFloat32ArrayValueOf006
     * @tc.desc Verify the typeof of the valueOf return value is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      const r: Float32Array = arr.valueOf();
      expect(r).assertEqual(arr);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_0700
     * @tc.name testFloat32ArrayValueOf007
     * @tc.desc Verify the valueOf return value is the original array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      const result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_0800
     * @tc.name testFloat32ArrayValueOf008
     * @tc.desc Verify valueOf return value preserves stored element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      const result = arr.valueOf();
      expect(result.$_get(0)).assertEqual(1.0);
      expect(result.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_0900
     * @tc.name testFloat32ArrayValueOf009
     * @tc.desc Verify the name property of the valueOf function is valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      const fn = arr.valueOf;
      expect(fn.name).assertEqual('valueOf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_1000
     * @tc.name testFloat32ArrayValueOf010
     * @tc.desc Verify the length of the valueOf return value of an empty array is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expect(arr.valueOf().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_1100
     * @tc.name testFloat32ArrayValueOf011
     * @tc.desc Verify the length of the valueOf return value of a single-element array is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0]);
      expect(arr.valueOf().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_1200
     * @tc.name testFloat32ArrayValueOf012
     * @tc.desc Verify the length of the valueOf return value of a multi-element array equals the original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      expect(arr.valueOf().length).assertEqual(arr.length);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_1300
     * @tc.name testFloat32ArrayValueOf013
     * @tc.desc Verify the length of the valueOf return value of an ArrayBuffer view equals the number of view elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const arr: Float32Array = new Float32Array(buf, 0, 6);
      expect(arr.valueOf().length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_1400
     * @tc.name testFloat32ArrayValueOf014
     * @tc.desc Verify the byteLength of the valueOf return value equals the original byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.valueOf().byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_1500
     * @tc.name testFloat32ArrayValueOf015
     * @tc.desc Verify the byteLength of the valueOf return value is 16 for a four-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      expect(arr.valueOf().byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_1600
     * @tc.name testFloat32ArrayValueOf016
     * @tc.desc Verify the byteOffset of the valueOf return value defaults to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      expect(arr.valueOf().byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_1700
     * @tc.name testFloat32ArrayValueOf017
     * @tc.desc Verify the byteOffset of the valueOf return value equals the view offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Float32Array = new Float32Array(buf, 4, 3);
      expect(arr.valueOf().byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_1800
     * @tc.name testFloat32ArrayValueOf018
     * @tc.desc Verify the buffer reference of the valueOf return value equals the original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      expect(arr.valueOf().buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_1900
     * @tc.name testFloat32ArrayValueOf019
     * @tc.desc Verify the buffer of the valueOf return value of a subarray view equals the parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view: Float32Array = parent.subarray(1, 3);
      expect(view.valueOf().buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_2000
     * @tc.name testFloat32ArrayValueOf020
     * @tc.desc Verify the return values of two valueOf calls share the same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      const first: Float32Array = arr.valueOf();
      const second: Float32Array = arr.valueOf();
      expect(first.buffer).assertEqual(second.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_2100
     * @tc.name testFloat32ArrayValueOf021
     * @tc.desc Verify the first element of the valueOf return value equals the original first element ($_get)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.valueOf().$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_2200
     * @tc.name testFloat32ArrayValueOf022
     * @tc.desc Verify the last element of the valueOf return value equals the original last element (at)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.valueOf().at(-1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_2300
     * @tc.name testFloat32ArrayValueOf023
     * @tc.desc Verify the middle element of the valueOf return value equals the original middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      expect(arr.valueOf().$_get(1)).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_2400
     * @tc.name testFloat32ArrayValueOf024
     * @tc.desc Verify index read of the valueOf return value is consistent with the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0, 6.0, 7.0]);
      expect(arr.valueOf()[0]).assertEqual(5.0);
      expect(arr.valueOf()[2]).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_2500
     * @tc.name testFloat32ArrayValueOf025
     * @tc.desc Verify the NaN element of the valueOf return value stays NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([NaN, 1.0]);
      expect(arr.valueOf().$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_2600
     * @tc.name testFloat32ArrayValueOf026
     * @tc.desc Verify the +Infinity element of the valueOf return value stays +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Infinity]);
      expect(arr.valueOf().$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_2700
     * @tc.name testFloat32ArrayValueOf027
     * @tc.desc Verify the -Infinity element of the valueOf return value stays -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-Infinity]);
      expect(arr.valueOf().$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_2800
     * @tc.name testFloat32ArrayValueOf028
     * @tc.desc Verify the Float32 MAX element of the valueOf return value is kept
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.4028234663852886e+38]);
      expect(arr.valueOf().$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_2900
     * @tc.name testFloat32ArrayValueOf029
     * @tc.desc Verify the Float32 MIN_VALUE element of the valueOf return value is kept
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.401298464324817e-45]);
      expect(arr.valueOf().$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_3000
     * @tc.name testFloat32ArrayValueOf030
     * @tc.desc Verify the valueOf return value keeps the -0 element (use reciprocal sign to distinguish +0/-0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-0.0]);
      const v: number = arr.valueOf().$_get(0);
      expect(1.0 / v).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_3100
     * @tc.name testFloat32ArrayValueOf031
     * @tc.desc Verify the precision-loss value of the valueOf return value (16777217 clamped to 16777216) is kept
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([16777217.0]);
      expect(arr.valueOf().$_get(0)).assertEqual(16777216.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_3200
     * @tc.name testFloat32ArrayValueOf032
     * @tc.desc Verify the valueOf return value containing 1.0e40 is clamped to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0e40]);
      expect(arr.valueOf().$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_3300
     * @tc.name testFloat32ArrayValueOf033
     * @tc.desc Verify the valueOf return value containing 1.0e-46 underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0e-46]);
      const v: number = arr.valueOf().$_get(0);
      expect(1.0 / v).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_3400
     * @tc.name testFloat32ArrayValueOf034
     * @tc.desc Verify indexed traversal over the original array sums all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let sum: number = 0.0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        sum = sum + v;
      }
      expect(sum).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_3500
     * @tc.name testFloat32ArrayValueOf035
     * @tc.desc Verify the values() iterator iterates over the valueOf return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0]);
      const it = arr.valueOf().values();
      expect(it.next().value).assertEqual(10.0);
      expect(it.next().value).assertEqual(20.0);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_3600
     * @tc.name testFloat32ArrayValueOf036
     * @tc.desc Verify the entries() iterator iterates over the valueOf return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0]);
      const it = arr.valueOf().entries();
      const first = it.next();
      expect((first.value!)[0]).assertEqual(0);
      expect((first.value!)[1]).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_3700
     * @tc.name testFloat32ArrayValueOf037
     * @tc.desc Verify the keys() iterator iterates over the valueOf return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const it = arr.valueOf().keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_3800
     * @tc.name testFloat32ArrayValueOf038
     * @tc.desc Verify the join result is consistent with the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.valueOf().join(',')).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_3900
     * @tc.name testFloat32ArrayValueOf039
     * @tc.desc Verify the toString result is consistent with the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      expect(arr.valueOf().toString()).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_4000
     * @tc.name testFloat32ArrayValueOf040
     * @tc.desc Verify the length of the original array is unchanged after calling valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const before: number = arr.length;
      arr.valueOf();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_4100
     * @tc.name testFloat32ArrayValueOf041
     * @tc.desc Verify the first element of the original array is unchanged after calling valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      arr.valueOf();
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_4200
     * @tc.name testFloat32ArrayValueOf042
     * @tc.desc Verify the last element of the original array is unchanged after calling valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      arr.valueOf();
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_4300
     * @tc.name testFloat32ArrayValueOf043
     * @tc.desc Verify the original byteLength is unchanged after calling valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const before: number = arr.byteLength;
      arr.valueOf();
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_4400
     * @tc.name testFloat32ArrayValueOf044
     * @tc.desc Verify the original buffer reference is unchanged after calling valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      const before = arr.buffer;
      arr.valueOf();
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_4500
     * @tc.name testFloat32ArrayValueOf045
     * @tc.desc Verify modifying the first element of the return value via $_set changes the original array synchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.valueOf();
      r.$_set(0, 99.0);
      expect(arr.$_get(0)).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_4600
     * @tc.name testFloat32ArrayValueOf046
     * @tc.desc Verify modifying all elements of the return value via fill changes the original array synchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.valueOf();
      r.fill(7.0);
      expect(arr.$_get(0)).assertEqual(7.0);
      expect(arr.$_get(2)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_4700
     * @tc.name testFloat32ArrayValueOf047
     * @tc.desc Verify modifying the return value via fill with a range changes the corresponding range of the original array synchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r: Float32Array = arr.valueOf();
      r.fill(0.0, 1, 3);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(0.0);
      expect(arr.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_4800
     * @tc.name testFloat32ArrayValueOf048
     * @tc.desc Verify modifying the return value via copyWithin changes the original array synchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const r: Float32Array = arr.valueOf();
      r.copyWithin(0, 3, 5);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_4900
     * @tc.name testFloat32ArrayValueOf049
     * @tc.desc Verify modifying the return value via reverse reverses the order of the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.valueOf();
      r.reverse();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_5000
     * @tc.name testFloat32ArrayValueOf050
     * @tc.desc Verify sorting the valueOf return value mutates the original array order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.0, 1.0, 2.0]);
      const r: Float32Array = arr.valueOf();
      r.sort();
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_5100
     * @tc.name testFloat32ArrayValueOf051
     * @tc.desc Verify modifying the return value via sort with compareFn changes the original array synchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.valueOf();
      r.sort((a: number, b: number): int => (b - a).toInt());
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_5200
     * @tc.name testFloat32ArrayValueOf052
     * @tc.desc Verify writing to the return value via set changes the original array synchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0, 0.0]);
      const r: Float32Array = arr.valueOf();
      const src: Float32Array = Float32Array.of(9.0, 8.0);
      r.set(src, 1);
      expect(arr.$_get(1)).assertEqual(9.0);
      expect(arr.$_get(2)).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_5300
     * @tc.name testFloat32ArrayValueOf053
     * @tc.desc Verify modifying the return value via a subarray view changes the original array synchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r: Float32Array = arr.valueOf();
      const sub: Float32Array = r.subarray(1, 3);
      sub.$_set(0, 50.0);
      expect(arr.$_get(1)).assertEqual(50.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_5400
     * @tc.name testFloat32ArrayValueOf054
     * @tc.desc Verify reverse: after modifying the original array, the valueOf return value sees the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      const r: Float32Array = arr.valueOf();
      arr.$_set(0, 42.0);
      expect(r.$_get(0)).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_5500
     * @tc.name testFloat32ArrayValueOf055
     * @tc.desc Verify modifying the return value via copyWithin with a negative start changes the original array synchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r: Float32Array = arr.valueOf();
      r.copyWithin(0, -2);
      expect(arr.$_get(0)).assertEqual(3.0);
      expect(arr.$_get(1)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_5600
     * @tc.name testFloat32ArrayValueOf056
     * @tc.desc Verify reverse twice returns to the original order (verifies bidirectional modification)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.valueOf();
      r.reverse();
      r.reverse();
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_5700
     * @tc.name testFloat32ArrayValueOf057
     * @tc.desc Verify writing NaN to the return value via $_set makes the corresponding position of the original array become NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      const r: Float32Array = arr.valueOf();
      r.$_set(0, NaN);
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_5800
     * @tc.name testFloat32ArrayValueOf058
     * @tc.desc Verify with() returns a new array and modifying the with result does not affect the original array (compare with valueOf returning this)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.valueOf();
      const w: Float32Array = r.with(0, 99.0);
      expect(arr.$_get(0)).assertEqual(16);
      expect(w.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_5900
     * @tc.name testFloat32ArrayValueOf059
     * @tc.desc Verify the length is unchanged after calling fill on the valueOf return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: Float32Array = arr.valueOf();
      r.fill(0.0);
      expect(r.length).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_6000
     * @tc.name testFloat32ArrayValueOf060
     * @tc.desc Verify the valueOf return value is visible after another typed-array view writes to the shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Float32Array = new Float32Array(buf, 0, 2);
      const r: Float32Array = arr.valueOf();
      const writer: Float32Array = new Float32Array(buf, 0, 2);
      writer.$_set(0, 123.0);
      expect(r.$_get(0)).assertEqual(123.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_6100
     * @tc.name testFloat32ArrayValueOf061
     * @tc.desc Verify the valueOf().valueOf() return value equals the original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      expect(arr.valueOf().valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_6200
     * @tc.name testFloat32ArrayValueOf062
     * @tc.desc Verify $_set on the valueOf result of a valueOf result affects the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      arr.valueOf().valueOf().$_set(0, 55.0);
      expect(arr.$_get(0)).assertEqual(55.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_6300
     * @tc.name testFloat32ArrayValueOf063
     * @tc.desc Verify valueOf content is consistent after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      arr.fill(9.0);
      expect(arr.valueOf().$_get(1)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_6400
     * @tc.name testFloat32ArrayValueOf064
     * @tc.desc Verify valueOf content is consistent after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.0, 1.0, 2.0]);
      arr.sort();
      expect(arr.valueOf().$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_6500
     * @tc.name testFloat32ArrayValueOf065
     * @tc.desc Verify valueOf content is consistent after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      arr.reverse();
      expect(arr.valueOf().$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_6600
     * @tc.name testFloat32ArrayValueOf066
     * @tc.desc Verify valueOf content is consistent after set from another TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const src: Float32Array = Float32Array.of(4.0, 5.0, 6.0);
      arr.set(src);
      expect(arr.valueOf().$_get(2)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_6700
     * @tc.name testFloat32ArrayValueOf067
     * @tc.desc Verify the valueOf return value is used as the construction source of another Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const copy: Float32Array = new Float32Array(arr.valueOf());
      expect(copy.length).assertEqual(3);
      expect(copy.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_6800
     * @tc.name testFloat32ArrayValueOf068
     * @tc.desc Verify the valueOf return value is used as the target of set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0]);
      const src: Float32Array = Float32Array.of(7.0, 8.0);
      arr.valueOf().set(src);
      expect(arr.$_get(0)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_6900
     * @tc.name testFloat32ArrayValueOf069
     * @tc.desc Verify the indexOf of the valueOf return value is consistent with the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.valueOf().indexOf(0b1010)).assertEqual(arr.indexOf(0b1010));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_7000
     * @tc.name testFloat32ArrayValueOf070
     * @tc.desc Verify the includes of the valueOf return value is consistent with the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.valueOf().includes(0b1010)).assertEqual(arr.includes(0b1010));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_7100
     * @tc.name testFloat32ArrayValueOf071
     * @tc.desc Verify the find lookup result of the valueOf return value is consistent with the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const found: number = arr.valueOf().find((v: number) => v === 0b1010)!;
      expect(found).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_7200
     * @tc.name testFloat32ArrayValueOf072
     * @tc.desc Verify the every of the valueOf return value is consistent with the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.valueOf().every((v: number) => v > -2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_7300
     * @tc.name testFloat32ArrayValueOf073
     * @tc.desc Verify the some of the valueOf return value is consistent with the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.valueOf().some((v: number) => v === 0x10)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_7400
     * @tc.name testFloat32ArrayValueOf074
     * @tc.desc Verify the reduce sum of the valueOf return value is consistent with the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const sum: number = arr.valueOf().reduce((acc: number, v: number) => acc + v, 0.0);
      expect(sum).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_7500
     * @tc.name testFloat32ArrayValueOf075
     * @tc.desc Verify the forEach accumulation of the valueOf return value is consistent with the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let sum: number = 0.0;
      arr.valueOf().forEach((v: number) => {
        sum = sum + v;
      });
      expect(sum).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_7600
     * @tc.name testFloat32ArrayValueOf076
     * @tc.desc Verify slice of the valueOf return value produces an independent copy (does not affect the original array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const s: Float32Array = arr.valueOf().slice(0, 2);
      s.$_set(0, 99.0);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_7700
     * @tc.name testFloat32ArrayValueOf077
     * @tc.desc Verify map of the valueOf return value produces an independent copy (does not affect the original array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const m: Float32Array = arr.valueOf().map((v: number) => v * 2.0);
      expect(m.$_get(0)).assertEqual(32);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_7800
     * @tc.name testFloat32ArrayValueOf078
     * @tc.desc Verify filter of the valueOf return value produces an independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const f: Float32Array = arr.valueOf().filter((v: number) => v > 2.0);
      expect(f.length).assertEqual(2);
      expect(f.$_get(0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_7900
     * @tc.name testFloat32ArrayValueOf079
     * @tc.desc Verify toReversed of the valueOf return value produces an independent copy (original array unchanged)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const t: Float32Array = arr.valueOf().toReversed();
      expect(t.$_get(0)).assertEqual(-1);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_8000
     * @tc.name testFloat32ArrayValueOf080
     * @tc.desc Verify toSorted of the valueOf return value produces an independent copy (original array unchanged)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.0, 1.0, 2.0]);
      const t: Float32Array = arr.valueOf().toSorted();
      expect(t.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_8100
     * @tc.name testFloat32ArrayValueOf081
     * @tc.desc Verify valueOf never throws on a valid Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let ok: boolean = false;
      try {
        const r: Float32Array = arr.valueOf();
        ok = r === arr;
      } catch (e) {
        expect(e.name).assertEqual('Error');
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUE_OF_8200
     * @tc.name testFloat32ArrayValueOf082
     * @tc.desc Verify chained valueOf calls return the same receiver reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValueOf082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Float32Array.of(1.0, 2.0);
      const first = source.valueOf();
      const second = first.valueOf();
      expect(first).assertEqual(source);
      expect(second).assertEqual(source);
    });

  });
}
