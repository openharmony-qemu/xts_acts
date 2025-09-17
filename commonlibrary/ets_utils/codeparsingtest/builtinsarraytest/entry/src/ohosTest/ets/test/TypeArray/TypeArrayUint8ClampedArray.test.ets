/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from '../../testability/pages/Utils'

interface GeneratedObjectLiteralInterface_1 {
  magic: string;
  version: number;
}

interface GeneratedObjectLiteralInterface_2 {
  version: number;
  flags: number;
  length: number;
}

interface GeneratedTypeLiteralInterface_1 {
  speed: number;
  fuel: number;
  temp: number;
}

interface GeneratedTypeLiteralInterface_2 {
  humidity: number;
  pressure: number;
}

export default function typeArrayUint8ClampedArrayTest() {
  describe('TypeArrayUint8ClampedArrayTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0001
     * @tc.name TypeArrayUint8ClampedArray0001
     * @tc.desc Create Uint8ClampedArray from length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Uint8ClampedArray(5);
      expect(arr.length).assertEqual(5);
      expect(arr.byteLength).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0002
     * @tc.name TypeArrayUint8ClampedArray0002
     * @tc.desc Create Uint8ClampedArray from regular array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr.toString()).assertEqual('10,20,30');
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0003
     * @tc.name TypeArrayUint8ClampedArray0003
     * @tc.desc Create Uint8ClampedArray from TypedArray
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = new Int16Array([5, 15, 25]);
      const arr = new Uint8ClampedArray(source);
      expect(arr instanceof Uint8ClampedArray).assertEqual(true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(15);
      expect(arr[2]).assertEqual(25);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0004
     * @tc.name TypeArrayUint8ClampedArray0004
     * @tc.desc Create from ArrayBuffer (with default offset and length)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buffer);
      expect(arr.buffer).assertEqual(buffer);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.byteLength).assertEqual(8);
      expect(arr.length).assertEqual(8);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
      expect(arr[5]).assertEqual(0);
      expect(arr[6]).assertEqual(0);
      expect(arr[7]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0005
     * @tc.name TypeArrayUint8ClampedArray0005
     * @tc.desc Create from ArrayBuffer (with specified offset)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const arr = new Uint8ClampedArray(buffer, 3);
      expect(arr.byteOffset).assertEqual(3);
      expect(arr.byteLength).assertEqual(7);
      expect(arr.length).assertEqual(7);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
      expect(arr[5]).assertEqual(0);
      expect(arr[6]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0006
     * @tc.name TypeArrayUint8ClampedArray0006
     * @tc.desc Verify BYTES_PER_ELEMENT property
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
      const arr = new Uint8ClampedArray(1);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0007
     * @tc.name TypeArrayUint8ClampedArray0007
     * @tc.desc Verify relationship between buffer property and original buffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(5);
      const arr = new Uint8ClampedArray(buffer);
      expect(arr.buffer instanceof ArrayBuffer).assertEqual(true);
      expect(arr.buffer).assertEqual(buffer);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0008
     * @tc.name TypeArrayUint8ClampedArray0008
     * @tc.desc Verify length property
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      arr[4] = 5;
      expect(arr.length).assertEqual(4);
      expect(arr[4]).assertUndefined();
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0009
     * @tc.name TypeArrayUint8ClampedArray0009
     * @tc.desc Check if is an Array instance
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Uint8ClampedArray(3);
      expect(Array.isArray(arr)).assertEqual(false);
      expect(arr instanceof Uint8ClampedArray).assertEqual(true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0010
     * @tc.name TypeArrayUint8ClampedArray0010
     * @tc.desc Verify behavior of empty array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.toString()).assertEqual('');
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0011
     * @tc.name TypeArrayUint8ClampedArray0011
     * @tc.desc Access elements by index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[arr.length - 1]).assertEqual(40);
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0012
     * @tc.name TypeArrayUint8ClampedArray0012
     * @tc.desc Modify elements by index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr.length).assertEqual(3);
      arr[1] = 50;
      expect(arr[1]).assertEqual(50);
      expect(arr.toString()).assertEqual('1,50,3');
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0013
     * @tc.name TypeArrayUint8ClampedArray0013
     * @tc.desc Access out-of-range indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Uint8ClampedArray(3);
      expect(arr[5]).assertUndefined();
      expect(arr[-1]).assertUndefined();
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0014
     * @tc.name TypeArrayUint8ClampedArray0014
     * @tc.desc Verify automatic clamping for values greater than 255
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 300;
      arr[1] = 256;
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr.length).assertEqual(2);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0015
     * @tc.name TypeArrayUint8ClampedArray0015
     * @tc.desc Verify automatic clamping for values less than 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = -10;
      arr[1] = -50;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr.length).assertEqual(2);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0016
     * @tc.name TypeArrayUint8ClampedArray0016
     * @tc.desc Verify handling of NaN values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = NaN;
      expect(arr[0]).assertEqual(0);
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0017
     * @tc.name TypeArrayUint8ClampedArray0017
     * @tc.desc Verify handling of Infinity values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = Infinity;
      arr[1] = -Infinity;
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr.length).assertEqual(2);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0020
     * @tc.name TypeArrayUint8ClampedArray0020
     * @tc.desc Modify elements in batch
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(5);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i * 60;
      }
      expect(arr.toString()).assertEqual('0,60,120,180,240');
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(60);
      expect(arr[2]).assertEqual(120);
      expect(arr[3]).assertEqual(180);
      expect(arr[4]).assertEqual(240);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0021
     * @tc.name TypeArrayUint8ClampedArray0021
     * @tc.desc Multiple views sharing the same ArrayBuffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const arr1 = new Uint8ClampedArray(buffer);
      const arr2 = new Uint8ClampedArray(buffer);

      arr1[0] = 100;
      expect(arr2[0]).assertEqual(100);

      arr2[3] = 200;
      expect(arr1[3]).assertEqual(200);
      expect(arr1[3]).assertEqual(200);
      expect(arr1[0]).assertEqual(100);
      expect(arr1[1]).assertEqual(0);
      expect(arr1[2]).assertEqual(0);
      expect(arr2[0]).assertEqual(100);
      expect(arr2[1]).assertEqual(0);
      expect(arr2[2]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0022
     * @tc.name TypeArrayUint8ClampedArray0022
     * @tc.desc Create different types of views from Uint8ClampedArray
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new Uint8ClampedArray([0x00, 0xFF, 0x80, 0x40]);
      const intView = new Int32Array(clamped.buffer);
      expect(intView.length).assertEqual(1);
      expect(intView[0]).assertEqual(0x4080FF00);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0023
     * @tc.name TypeArrayUint8ClampedArray0023
     * @tc.desc Verify impact of view modification on original array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const clamped = new Uint8ClampedArray(buffer);
      const uintView = new Uint8Array(buffer);
      uintView[2] = 255;
      expect(clamped[2]).assertEqual(255);
      uintView[5] = 300;
      expect(clamped[5]).assertEqual(44);
      expect(clamped[5]).assertEqual(44);
      expect(clamped[0]).assertEqual(0);
      expect(clamped[1]).assertEqual(0);
      expect(clamped[2]).assertEqual(255);
      expect(clamped[3]).assertEqual(0);
      expect(clamped[4]).assertEqual(0);
      expect(clamped[6]).assertEqual(0);
      expect(clamped[7]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0024
     * @tc.name TypeArrayUint8ClampedArray0024
     * @tc.desc Create views with different offsets
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(10);
      const base = new Uint8ClampedArray(buffer);
      base.set([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);

      const view = new Uint8ClampedArray(buffer, 3, 4);
      expect(view.length).assertEqual(4);
      expect(view.toString()).assertEqual('4,5,6,7');
      expect(view[0]).assertEqual(4);
      expect(view[1]).assertEqual(5);
      expect(view[2]).assertEqual(6);
      expect(view[3]).assertEqual(7);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0025
     * @tc.name TypeArrayUint8ClampedArray0025
     * @tc.desc Exception handling when view boundaries exceed buffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(5);
      expect(() => {
        new Uint8ClampedArray(buffer, 3, 4);
      }).assertThrowError(RangeError);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0026
     * @tc.name TypeArrayUint8ClampedArray0026
     * @tc.desc Interaction with DataView sharing the same buffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(8);
      const clamped = new Uint8ClampedArray(buffer);
      const dataView = new DataView(buffer);

      dataView.setUint8(2, 150);
      expect(clamped[2]).assertEqual(150);

      clamped[5] = 200;
      expect(dataView.getUint8(5)).assertEqual(200);
      expect(clamped[0]).assertEqual(0);
      expect(clamped[1]).assertEqual(0);
      expect(clamped[3]).assertEqual(0);
      expect(clamped[4]).assertEqual(0);
      expect(clamped[6]).assertEqual(0);
      expect(clamped[7]).assertEqual(0);
      expect(dataView.getUint8(0)).assertEqual(0);
      expect(dataView.getUint8(1)).assertEqual(0);
      expect(dataView.getUint8(2)).assertEqual(150);
      expect(dataView.getUint8(3)).assertEqual(0);
      expect(dataView.getUint8(4)).assertEqual(0);
      expect(dataView.getUint8(6)).assertEqual(0);
      expect(dataView.getUint8(7)).assertEqual(0);
      expect(clamped.length).assertEqual(8);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0027
     * @tc.name TypeArrayUint8ClampedArray0027
     * @tc.desc Modify Uint8ClampedArray values via DataView
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const clamped = new Uint8ClampedArray(buffer);
      const dataView = new DataView(buffer);

      dataView.setInt16(0, 300, true);
      expect(clamped[0]).assertEqual(44);
      expect(clamped[1]).assertEqual(1);
      expect(clamped[2]).assertEqual(0);
      expect(clamped[3]).assertEqual(0);
      expect(clamped.length).assertEqual(4);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0028
     * @tc.name TypeArrayUint8ClampedArray0028
     * @tc.desc Interaction of multi-level nested views
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(16);
      const base = new Uint8ClampedArray(buffer);
      const view1 = new Uint8ClampedArray(buffer, 4, 8);
      const view2 = new Uint8ClampedArray(view1.buffer, 6, 4);

      base.fill(0);
      view1[2] = 255;
      expect(view2[0]).assertEqual(255);
      expect(base[6]).assertEqual(255);
      expect(base[0]).assertEqual(0);
      expect(base[1]).assertEqual(0);
      expect(base[2]).assertEqual(0);
      expect(base[3]).assertEqual(0);
      expect(base[4]).assertEqual(0);
      expect(base[5]).assertEqual(0);
      expect(base[7]).assertEqual(0);
      expect(base[8]).assertEqual(0);
      expect(base[9]).assertEqual(0);
      expect(base[10]).assertEqual(0);
      expect(base[11]).assertEqual(0);
      expect(base[12]).assertEqual(0);
      expect(base[13]).assertEqual(0);
      expect(base[14]).assertEqual(0);
      expect(base[15]).assertEqual(0);
      expect(view2[1]).assertEqual(0);
      expect(view2[2]).assertEqual(0);
      expect(view2[3]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0029
     * @tc.name TypeArrayUint8ClampedArray0029
     * @tc.desc Verify byteLength consistency of shared buffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(10);
      const arr = new Uint8ClampedArray(buffer, 2, 5);
      expect(arr.byteLength).assertEqual(5);
      expect(arr.buffer.byteLength).assertEqual(10);
      expect(arr.byteOffset).assertEqual(2);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0030
     * @tc.name TypeArrayUint8ClampedArray0030
     * @tc.desc Verify clamping behavior across views
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const clamped = new Uint8ClampedArray(buffer);
      const uintView = new Uint8Array(buffer);

      clamped[0] = 300;
      expect(clamped[0]).assertEqual(255);
      expect(uintView[0]).assertEqual(255);

      uintView[1] = 300;
      expect(uintView[1]).assertEqual(44);
      expect(clamped[1]).assertEqual(44);
      expect(clamped[2]).assertEqual(0);
      expect(clamped[3]).assertEqual(0);
      expect(uintView[2]).assertEqual(0);
      expect(uintView[3]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0031
     * @tc.name TypeArrayUint8ClampedArray0031
     * @tc.desc set method: copy from regular array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(5);
      arr.set([10, 20, 30]);
      expect(arr.toString()).assertEqual('10,20,30,0,0');
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0032
     * @tc.name TypeArrayUint8ClampedArray0032
     * @tc.desc set method: copy with offset
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(6);
      arr.fill(1);
      arr.set([5, 6, 7], 2);
      expect(arr.toString()).assertEqual('1,1,5,6,7,1');
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(5);
      expect(arr[3]).assertEqual(6);
      expect(arr[4]).assertEqual(7);
      expect(arr[5]).assertEqual(1);
      expect(arr.length).assertEqual(6);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0033
     * @tc.name TypeArrayUint8ClampedArray0033
     * @tc.desc set method: handle out-of-range values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(3);
      arr.set([260, -5, 128]);
      expect(arr.toString()).assertEqual('255,0,128');
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(128);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0034
     * @tc.name TypeArrayUint8ClampedArray0034
     * @tc.desc subarray method: create subarray
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      expect(sub.toString()).assertEqual('2,3,4');
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
      expect(sub.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0035
     * @tc.name TypeArrayUint8ClampedArray0035
     * @tc.desc slice method: create copy
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const sliced = arr.slice(1);
      expect(sliced.toString()).assertEqual('20,30');
      expect(sliced.buffer === arr.buffer).assertFalse();
      expect(sliced[0]).assertEqual(20);
      expect(sliced[1]).assertEqual(30);
      expect(sliced.length).assertEqual(2);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0036
     * @tc.name TypeArrayUint8ClampedArray0036
     * @tc.desc fill method: fill with single value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(4);
      arr.fill(50);
      expect(arr.every(v => v === 50)).assertEqual(true);
      expect(arr[0]).assertEqual(50);
      expect(arr[1]).assertEqual(50);
      expect(arr[2]).assertEqual(50);
      expect(arr[3]).assertEqual(50);
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0037
     * @tc.name TypeArrayUint8ClampedArray0037
     * @tc.desc fill method: fill with out-of-range values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(3);
      arr.fill(300);
      expect(arr.every(v => v === 255)).assertEqual(true);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0038
     * @tc.name TypeArrayUint8ClampedArray0038
     * @tc.desc map method: transform elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const mapped = arr.map(v => v * 5);
      expect(mapped.toString()).assertEqual('50,100,150');
      expect(mapped[0]).assertEqual(50);
      expect(mapped[1]).assertEqual(100);
      expect(mapped[2]).assertEqual(150);
      expect(mapped.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0039
     * @tc.name TypeArrayUint8ClampedArray0039
     * @tc.desc map method: handle clamping
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([50, 60, 70]);
      const mapped = arr.map(v => v * 5);
      expect(mapped.toString()).assertEqual('250,255,255');
      expect(mapped[0]).assertEqual(250);
      expect(mapped[1]).assertEqual(255);
      expect(mapped[2]).assertEqual(255);
      expect(mapped.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0040
     * @tc.name TypeArrayUint8ClampedArray0040
     * @tc.desc filter method: filter elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([10, 100, 200, 255, 50]);
      const filtered = arr.filter(v => v > 100);
      expect(filtered.toString()).assertEqual('200,255');
      expect(filtered[0]).assertEqual(200);
      expect(filtered[1]).assertEqual(255);
      expect(filtered.length).assertEqual(2);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0041
     * @tc.name TypeArrayUint8ClampedArray0041
     * @tc.desc reduce method: calculate sum
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sum = arr.reduce((acc, val) => acc + val, 0);
      expect(sum).assertEqual(100);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0042
     * @tc.name TypeArrayUint8ClampedArray0042
     * @tc.desc every method: check all elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      const allBelow200 = arr.every(v => v < 200);
      const allAbove100 = arr.every(v => v > 100);
      expect(allBelow200).assertEqual(true);
      expect(allAbove100).assertEqual(false);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0043
     * @tc.name TypeArrayUint8ClampedArray0043
     * @tc.desc some method: check if any element exists
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      const hasOver120 = arr.some(v => v > 120);
      const hasNegative = arr.some(v => v < 0);
      expect(hasOver120).assertEqual(true);
      expect(hasNegative).assertEqual(false);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0044
     * @tc.name TypeArrayUint8ClampedArray0044
     * @tc.desc find method: find element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([30, 70, 50, 90, 50]);
      const found = arr.find(v => v === 50);
      const notFound = arr.find(v => v === 100);
      expect(found).assertEqual(50);
      expect(notFound).assertUndefined();
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0045
     * @tc.name TypeArrayUint8ClampedArray0045
     * @tc.desc findIndex method: find index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([30, 70, 50, 90, 50]);
      const index = arr.findIndex(v => v === 50);
      const notFoundIndex = arr.findIndex(v => v === 100);
      expect(index).assertEqual(2);
      expect(notFoundIndex).assertEqual(-1);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0046
     * @tc.name TypeArrayUint8ClampedArray0046
     * @tc.desc includes method: check if element exists
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([10, 20, 30, 255]);
      expect(arr.includes(20)).assertEqual(true);
      expect(arr.includes(256)).assertEqual(false);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(255);
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0047
     * @tc.name TypeArrayUint8ClampedArray0047
     * @tc.desc indexOf method: find index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([5, 10, 15, 10, 20]);
      expect(arr.indexOf(10)).assertEqual(1);
      expect(arr.indexOf(25)).assertEqual(-1);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(15);
      expect(arr[3]).assertEqual(10);
      expect(arr[4]).assertEqual(20);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0048
     * @tc.name TypeArrayUint8ClampedArray0048
     * @tc.desc lastIndexOf method: find last index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([5, 10, 15, 10, 20]);
      expect(arr.lastIndexOf(10)).assertEqual(3);
      expect(arr.lastIndexOf(25)).assertEqual(-1);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(15);
      expect(arr[3]).assertEqual(10);
      expect(arr[4]).assertEqual(20);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0049
     * @tc.name TypeArrayUint8ClampedArray0049
     * @tc.desc join method: concatenate into string
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([255, 128, 0]);
      expect(arr.join(',')).assertEqual('255,128,0');
      expect(arr.join('|')).assertEqual('255|128|0');
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(128);
      expect(arr[2]).assertEqual(0);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0050
     * @tc.name TypeArrayUint8ClampedArray0050
     * @tc.desc values iterator: usage
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const values = Array.from(arr.values());
      expect(values.toString()).assertEqual('10,20,30');
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(30);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0051
     * @tc.name TypeArrayUint8ClampedArray0051
     * @tc.desc Convert to regular array (Array.from)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new Uint8ClampedArray([10, 20, 30]);
      const arr = Array.from(clamped);
      expect(Array.isArray(arr)).assertEqual(true);
      expect(arr.toString()).assertEqual([10, 20, 30].toString());
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0052
     * @tc.name TypeArrayUint8ClampedArray0052
     * @tc.desc Convert to regular array (spread operator)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new Uint8ClampedArray([5, 15, 25]);
      const arr = [...clamped];
      expect(Array.isArray(arr)).assertEqual(true);
      expect(arr.toString()).assertEqual([5, 15, 25].toString());
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0053
     * @tc.name TypeArrayUint8ClampedArray0053
     * @tc.desc Convert to Uint8Array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new Uint8ClampedArray([100, 200, 255]);
      const uint8 = new Uint8Array(clamped);
      expect(uint8 instanceof Uint8Array).assertEqual(true);
      expect(uint8.toString()).assertEqual('100,200,255');
      expect(uint8.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0054
     * @tc.name TypeArrayUint8ClampedArray0054
     * @tc.desc Convert to Int32Array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new Uint8ClampedArray([10, 20, 30]);
      const int32 = new Int32Array(clamped);
      expect(int32 instanceof Int32Array).assertEqual(true);
      expect(int32.toString()).assertEqual('10,20,30');
      expect(int32.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0055
     * @tc.name TypeArrayUint8ClampedArray0055
     * @tc.desc Interaction with JSON.stringify
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new Uint8ClampedArray([1, 2, 3, 4]);
      const json = JSON.stringify(clamped);
      expect(json).assertEqual('{"0":1,"1":2,"2":3,"3":4}');
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0057
     * @tc.name TypeArrayUint8ClampedArray0057
     * @tc.desc Convert to string (toString)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new Uint8ClampedArray([255, 0, 128]);
      expect(clamped.toString()).assertEqual('255,0,128');
      expect(clamped.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0058
     * @tc.name TypeArrayUint8ClampedArray0058
     * @tc.desc Convert to ArrayBuffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new Uint8ClampedArray([5, 6, 7]);
      const buffer = clamped.buffer;
      expect(buffer instanceof ArrayBuffer).assertEqual(true);
      expect(buffer.byteLength).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0059
     * @tc.name TypeArrayUint8ClampedArray0059
     * @tc.desc Convert from Float32Array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const float32 = new Float32Array([-1.5, 128.3, 300.9]);
      const clamped = new Uint8ClampedArray(float32);
      expect(clamped.toString()).assertEqual('0,128,255');
      expect(clamped.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0060
     * @tc.name TypeArrayUint8ClampedArray0060
     * @tc.desc Convert to string (toLocaleString)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new Uint8ClampedArray([1000, 200, 300]);
      expect(clamped.toLocaleString()).assertEqual('255,200,255');
      expect(clamped.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0061
     * @tc.name TypeArrayUint8ClampedArray0061
     * @tc.desc Handling of maximum value (255)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 255;
      expect(arr[0]).assertEqual(255);
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0062
     * @tc.name TypeArrayUint8ClampedArray0062
     * @tc.desc Handling of minimum value (0)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 0;
      expect(arr[0]).assertEqual(0);
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0063
     * @tc.name TypeArrayUint8ClampedArray0063
     * @tc.desc Clamping of values exceeding maximum (255)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const values = [256, 300, 1000, 2147483647];
      const arr = new Uint8ClampedArray(values);
      expect(arr.every(v => v === 255)).assertEqual(true);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0064
     * @tc.name TypeArrayUint8ClampedArray0064
     * @tc.desc Clamping of values below minimum (0)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const values = [-1, -50, -1000, -2147483648];
      const arr = new Uint8ClampedArray(values);
      expect(arr.every(v => v === 0)).assertEqual(true);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0065
     * @tc.name TypeArrayUint8ClampedArray0065
     * @tc.desc Handling of NaN values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = NaN;
      arr[1] = Number.NaN;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr.length).assertEqual(2);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0066
     * @tc.name TypeArrayUint8ClampedArray0066
     * @tc.desc Handling of Infinity values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = Infinity;
      arr[1] = -Infinity;
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr.length).assertEqual(2);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0069
     * @tc.name TypeArrayUint8ClampedArray0069
     * @tc.desc Very large array (close to maximum length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const maxLength = Math.pow(2, 28) - 1;
      const arr = new Uint8ClampedArray(maxLength);
      expect(arr.length).assertEqual(maxLength);
      arr[0] = 255;
      arr[maxLength - 1] = 128;
      expect(arr[0]).assertEqual(255);
      expect(arr[maxLength - 1]).assertEqual(128);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0071
     * @tc.name TypeArrayUint8ClampedArray0071
     * @tc.desc Pixel data processing (RGBA values)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const pixels = new Uint8ClampedArray([255, 0, 0, 255,
        0, 255, 0, 255]);
      expect(pixels[0]).assertEqual(255);
      expect(pixels[1]).assertEqual(0);
      expect(pixels[2]).assertEqual(0);
      expect(pixels[3]).assertEqual(255);
      expect(pixels[4]).assertEqual(0);
      expect(pixels[5]).assertEqual(255);
      expect(pixels[6]).assertEqual(0);
      expect(pixels[7]).assertEqual(255);
      expect(pixels.length).assertEqual(8);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0072
     * @tc.name TypeArrayUint8ClampedArray0072
     * @tc.desc Brightness adjustment in image processing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const adjustBrightness = (pixels: Uint8ClampedArray, value: number) => {
        for (let i = 0; i < pixels.length; i += 4) {
          pixels[i] += value;
          pixels[i+1] += value;
          pixels[i+2] += value;
        }
      };

      const pixels = new Uint8ClampedArray([100, 100, 100, 255]);
      adjustBrightness(pixels, 200);
      expect(pixels[0]).assertEqual(255);
      expect(pixels[1]).assertEqual(255);
      expect(pixels[2]).assertEqual(255);
      expect(pixels[3]).assertEqual(255);
      expect(pixels.length).assertEqual(4);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0073
     * @tc.name TypeArrayUint8ClampedArray0073
     * @tc.desc Color channel separation (extract red channel)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const extractRedChannel = (pixels: Uint8ClampedArray) => {
        const reds = new Uint8ClampedArray(pixels.length / 4);
        for (let i = 0; i < reds.length; i++) {
          reds[i] = pixels[i * 4];
        }
        return reds;
      };

      const pixels = new Uint8ClampedArray([255, 0, 0, 255, 100, 50, 30, 255]);
      const reds = extractRedChannel(pixels);
      expect(reds.toString()).assertEqual('255,100');
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0074
     * @tc.name TypeArrayUint8ClampedArray0074
     * @tc.desc Simple contrast adjustment in image processing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const adjustContrast = (pixels: Uint8ClampedArray, factor: number) => {
        for (let i = 0; i < pixels.length; i += 4) {
          for (let c = 0; c < 3; c++) {
            pixels[i + c] = 128 + (pixels[i + c] - 128) * factor;
          }
        }
      };

      const pixels = new Uint8ClampedArray([128, 128, 128, 255]);
      adjustContrast(pixels, 2);
      expect(pixels[0]).assertEqual(128 + (128 - 128) * 2);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0075
     * @tc.name TypeArrayUint8ClampedArray0075
     * @tc.desc Simple invert filter for images
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const invertColors = (pixels: Uint8ClampedArray) => {
        for (let i = 0; i < pixels.length; i += 4) {
          pixels[i] = 255 - pixels[i];
          pixels[i+1] = 255 - pixels[i+1];
          pixels[i+2] = 255 - pixels[i+2];
        }
      };

      const pixels = new Uint8ClampedArray([255, 0, 128, 255]);
      invertColors(pixels);
      expect(pixels[0]).assertEqual(0);
      expect(pixels[1]).assertEqual(255);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0076
     * @tc.name TypeArrayUint8ClampedArray0076
     * @tc.desc 8-bit audio sample data processing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const normalizeAudio = (samples: Uint8ClampedArray) => {
        return samples.map(s => s - 128);
      };

      const samples = new Uint8ClampedArray([128, 255, 0]);
      const normalized = normalizeAudio(samples);
      expect(normalized.toString()).assertEqual([0, 127, 0].toString());
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0077
     * @tc.name TypeArrayUint8ClampedArray0077
     * @tc.desc Byte processing in data compression algorithms
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const deltaEncode = (data: Uint8ClampedArray) => {
        const encoded = new Uint8ClampedArray(data.length);
        encoded[0] = data[0];
        for (let i = 1; i < data.length; i++) {
          encoded[i] = data[i] - data[i-1];
        }
        return encoded;
      };

      const data = new Uint8ClampedArray([50, 52, 55, 55, 57]);
      const encoded = deltaEncode(data);
      expect(encoded.toString()).assertEqual('50,2,3,0,2');
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0078
     * @tc.name TypeArrayUint8ClampedArray0078
     * @tc.desc Network protocol packet construction
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buildHeader = (version: number, length: number) => {
        const header = new Uint8ClampedArray(4);
        header[0] = version;
        header[1] = length >> 16;
        header[2] = (length >> 8) & 0xFF;
        header[3] = length & 0xFF;
        return header;
      };

      const header = buildHeader(1, 0x123456);
      expect(header[0]).assertEqual(1);
      expect(header[3]).assertEqual(0x56);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0079
     * @tc.name TypeArrayUint8ClampedArray0079
     * @tc.desc Data checksum calculation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const calculateChecksum = (data: Uint8ClampedArray) => {
        return data.reduce((sum, val) => (sum + val) % 256, 0);
      };

      const data = new Uint8ClampedArray([0x10, 0x20, 0x30, 0x40]);
      const checksum = calculateChecksum(data);
      expect(checksum).assertEqual(0xA0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0080
     * @tc.name TypeArrayUint8ClampedArray0080
     * @tc.desc Binary file read/write simulation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const readFileHeader = (data: Uint8ClampedArray) => {
        return ({
          magic: String.fromCharCode(data[0], data[1]),
          version: data[2]
        } as GeneratedObjectLiteralInterface_1);
      };

      const fileData = new Uint8ClampedArray([0x50, 0x4E, 0x03, 0x00]);
      const header = readFileHeader(fileData);
      expect(header.magic).assertEqual('PN');
      expect(header.version).assertEqual(3);
    })
    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0081
     * @tc.name TypeArrayUint8ClampedArray0081
     * @tc.desc Verify iterator behavior with for...of loop
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const values: number[] = [];

      for (const value of arr) {
        values.push(value);
      }
      expect(values.toString()).assertEqual([10, 20, 30].toString());
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0082
     * @tc.name TypeArrayUint8ClampedArray0082
     * @tc.desc Verify keys iterator functionality
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(3);
      const keys = Array.from(arr.keys());
      expect(keys.toString()).assertEqual([0, 1, 2].toString());
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0083
     * @tc.name TypeArrayUint8ClampedArray0083
     * @tc.desc Verify entries iterator returns [index, value] pairs
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([5, 15]);
      const entries = Array.from(arr.entries());
      expect(entries.toString()).assertEqual([[0, 5], [1, 15]].toString());
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0084
     * @tc.name TypeArrayUint8ClampedArray0084
     * @tc.desc Verify copyWithin method basic functionality
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3);
      expect(arr.toString()).assertEqual('4,5,3,4,5');
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0085
     * @tc.name TypeArrayUint8ClampedArray0085
     * @tc.desc Verify copyWithin with target, start and end parameters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(2, 0, 2);
      expect(arr.toString()).assertEqual('1,2,1,2,5');
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0086
     * @tc.name TypeArrayUint8ClampedArray0086
     * @tc.desc Verify handling of non-integer values during creation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([1.2, 2.9, 3.5]);
      expect(arr.toString()).assertEqual('1,3,4');
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0087
     * @tc.name TypeArrayUint8ClampedArray0087
     * @tc.desc Verify reduceRight method functionality
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([2, 3, 4]);
      const product = arr.reduceRight((acc, val) => acc * val, 1);
      expect(product).assertEqual(24);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0088
     * @tc.name TypeArrayUint8ClampedArray0088
     * @tc.desc Verify sort method with default comparator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([3, 1, 4, 2]);
      arr.sort();
      expect(arr.toString()).assertEqual('1,2,3,4');
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0089
     * @tc.name TypeArrayUint8ClampedArray0089
     * @tc.desc Verify sort method with custom comparator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([3, 1, 4, 2]);
      arr.sort((a, b) => b - a);
      expect(arr.toString()).assertEqual('4,3,2,1');
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0090
     * @tc.name TypeArrayUint8ClampedArray0090
     * @tc.desc Verify buffer transfer between TypedArrays
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new Uint8ClampedArray([10, 20, 30]);
      const uint8 = new Uint8Array(clamped.buffer, clamped.byteOffset, clamped.byteLength);
      expect(uint8.toString()).assertEqual('10,20,30');
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0091
     * @tc.name TypeArrayUint8ClampedArray0091
     * @tc.desc Verify handling of large buffer with multiple views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(100);
      const view1 = new Uint8ClampedArray(buffer, 10, 40);
      const view2 = new Uint8ClampedArray(buffer, 60, 30);

      view1.fill(255);
      view2.fill(0);
      expect(view1[0]).assertEqual(255);
      expect(view2[0]).assertEqual(0);
      expect(view1.byteLength + view2.byteLength).assertEqual(70);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0092
     * @tc.name TypeArrayUint8ClampedArray0092
     * @tc.desc Verify behavior when setting values through parent buffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new ArrayBuffer(4);
      const clamped = new Uint8ClampedArray(buffer);
      const uint8 = new Uint8Array(buffer);

      uint8[0] = 300;
      expect(clamped[0]).assertEqual(44);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0094
     * @tc.name TypeArrayUint8ClampedArray0094
     * @tc.desc Verify handling of 0-length subarray
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(1, 1);
      expect(sub.length).assertEqual(0);
      expect(sub.buffer).assertEqual(arr.buffer);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0097
     * @tc.name TypeArrayUint8ClampedArray0097
     * @tc.desc Verify handling of clamped values in multi-step operations
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const processData = (data: Uint8ClampedArray) => {
        return data
          .map(v => v * 2)
          .filter(v => v > 100)
          .reduce((a, b) => a + b, 0);
      };

      const data = new Uint8ClampedArray([100, 150, 50]);
      const result = processData(data);
      expect(result).assertEqual(455);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0098
     * @tc.name TypeArrayUint8ClampedArray0098
     * @tc.desc Verify compatibility with ArrayBuffer.isView
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray(1);
      const buffer = new ArrayBuffer(1);
      expect(ArrayBuffer.isView(arr)).assertEqual(true);
      expect(ArrayBuffer.isView(buffer)).assertEqual(false);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0099
     * @tc.name TypeArrayUint8ClampedArray0099
     * @tc.desc Verify interaction with DataView for multi-byte values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayUint8ClampedArray0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const buffer = new ArrayBuffer(4);
      const clamped = new Uint8ClampedArray(buffer);
      const view = new DataView(buffer);

      view.setUint32(0, 0x12345678, true);
      expect(clamped[0]).assertEqual(0x78);
      expect(clamped[3]).assertEqual(0x12);
    })


    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0102
     * @tc.name TypeArrayUint8ClampedArray0102
     * @tc.desc Verify subarray updates reflect in original array (buffer sharing)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const original = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = original.subarray(1, 3);

      sub[0] = 99;
      expect(original[1]).assertEqual(99);
      expect(original.length).assertEqual(4);
      expect(original[0]).assertEqual(10);
      expect(original[2]).assertEqual(30);
      expect(original[3]).assertEqual(40);
      original[2] = 88;
      expect(sub[1]).assertEqual(88);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(99);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0103
     * @tc.name TypeArrayUint8ClampedArray0103
     * @tc.desc Verify slice creates independent copy (no buffer sharing)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const original = new Uint8ClampedArray([5, 15, 25]);
      const sliced = original.slice(1);
      sliced[0] = 99;
      expect(original[1]).assertEqual(15);
      expect(original.length).assertEqual(3);
      expect(original[0]).assertEqual(5);
      expect(original[2]).assertEqual(25);
      original[1] = 88;
      expect(sliced[0]).assertEqual(99);
      expect(sliced.length).assertEqual(2);
      expect(sliced[1]).assertEqual(25);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0104
     * @tc.name TypeArrayUint8ClampedArray0104
     * @tc.desc Verify set method handles out-of-bounds source (truncates safely)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const target = new Uint8ClampedArray(3);
      const source = [10, 20, 30, 40];
      try {
        target.set(source);
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertContain('The sum of length and targetOffset is greater than targetLength.');
      }
      expect(target.length).assertEqual(3);
      expect(target[0]).assertEqual(0);
      expect(target[1]).assertEqual(0);
      expect(target[2]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0105
     * @tc.name TypeArrayUint8ClampedArray0105
     * @tc.desc Verify set method with offset (avoids overwriting early elements)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const target = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const source = [99, 88];

      target.set(source, 2);
      expect(target.toString()).assertEqual('1,2,99,88,5');
      expect(target.length).assertEqual(5);
      expect(target[0]).assertEqual(1);
      expect(target[1]).assertEqual(2);
      expect(target[2]).assertEqual(99);
      expect(target[3]).assertEqual(88);
      expect(target[4]).assertEqual(5);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0106
     * @tc.name TypeArrayUint8ClampedArray0106
     * @tc.desc Verify includes method with clamped values (e.g., 300 → 255)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([100, 300, -50]);
      expect(arr.includes(255)).assertEqual(true);
      expect(arr.includes(300)).assertEqual(false);
      expect(arr.includes(0)).assertEqual(true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(0);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0107
     * @tc.name TypeArrayUint8ClampedArray0107
     * @tc.desc Verify indexOf with duplicate clamped values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new Uint8ClampedArray([200, 280, 255, 300]);
      expect(arr.indexOf(255)).assertEqual(1);
      expect(arr.lastIndexOf(255)).assertEqual(3);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(200);
      expect(arr[2]).assertEqual(255);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0108
     * @tc.name TypeArrayUint8ClampedArray0108
     * @tc.desc Verify map returns Uint8ClampedArray (preserves type)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const original = new Uint8ClampedArray([10, 20]);
      const mapped = original.map(val => val * 2);
      expect(mapped instanceof Uint8ClampedArray).assertEqual(true);
      expect(mapped.toString()).assertEqual('20,40');
      expect(mapped.length).assertEqual(2);
      expect(mapped[0]).assertEqual(20);
      expect(mapped[1]).assertEqual(40);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0109
     * @tc.name TypeArrayUint8ClampedArray0109
     * @tc.desc Verify filter returns Uint8ClampedArray (preserves type)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayUint8ClampedArray0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const original = new Uint8ClampedArray([5, 15, 25, 35]);
      const filtered = original.filter(val => val > 15);
      expect(filtered instanceof Uint8ClampedArray).assertEqual(true);
      expect(filtered.toString()).assertEqual('25,35');
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(25);
      expect(filtered[1]).assertEqual(35);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0110
     * @tc.name TypeArrayUint8ClampedArray0110
     * @tc.desc Verify fill with negative offset (starts from end)
  