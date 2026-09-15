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
import { collections, lang } from '@kit.ArkTS';
import { ArkTSUtils } from '@kit.ArkTS'



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
      await sleep(30);
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
     * @tc.name   TypeArrayUint8ClampedArray0001
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0001
     * @tc.desc   Create Uint8ClampedArray from length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ClampedArray0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Uint8ClampedArray(5);
      expect(arr.length).assertEqual(5);
      expect(arr.byteLength).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0002
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0002
     * @tc.desc   Create Uint8ClampedArray from regular array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ClampedArray0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Uint8ClampedArray([10, 20, 30]);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr.toString()).assertEqual('10,20,30');
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0003
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0003
     * @tc.desc   Create Uint8ClampedArray from TypedArray
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ClampedArray0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = new Int16Array([5, 15, 25]);
      const arr = new collections.Uint8ClampedArray(source);
      expect(arr instanceof collections.Uint8ClampedArray).assertEqual(true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(15);
      expect(arr[2]).assertEqual(25);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0004
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0004
     * @tc.desc   Create from ArrayBuffer (with default offset and length)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ClampedArray0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new collections.ArrayBuffer(8);
      const arr = new collections.Uint8ClampedArray(buffer);
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
     * @tc.name   TypeArrayUint8ClampedArray0005
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0005
     * @tc.desc   Create from ArrayBuffer (with specified offset)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ClampedArray0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new collections.ArrayBuffer(10);
      const arr = new collections.Uint8ClampedArray(buffer, 3);
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
     * @tc.name   TypeArrayUint8ClampedArray0006
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0006
     * @tc.desc   Verify BYTES_PER_ELEMENT property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ClampedArray0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(collections.Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
      const arr = new collections.Uint8ClampedArray(1);
      expect(collections.Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0007
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0007
     * @tc.desc   Verify relationship between buffer property and original buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ClampedArray0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new collections.ArrayBuffer(5);
      const arr = new collections.Uint8ClampedArray(buffer);
      expect(arr.buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(arr.buffer).assertEqual(buffer);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0008
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0008
     * @tc.desc   Verify length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ClampedArray0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Uint8ClampedArray([1, 2, 3, 4]);
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
     * @tc.name   TypeArrayUint8ClampedArray0009
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0009
     * @tc.desc   Check if is an Array instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ClampedArray0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Uint8ClampedArray(3);
      expect(Array.isArray(arr)).assertEqual(false);
      expect(arr instanceof collections.Uint8ClampedArray).assertEqual(true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0010
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0010
     * @tc.desc   Verify behavior of empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ClampedArray0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Uint8ClampedArray(0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.toString()).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0011
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0011
     * @tc.desc   Access elements by index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ClampedArray0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Uint8ClampedArray([10, 20, 30, 40]);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[arr.length - 1]).assertEqual(40);
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0012
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0012
     * @tc.desc   Modify elements by index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ClampedArray0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Uint8ClampedArray([1, 2, 3]);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr.length).assertEqual(3);
      arr[1] = 50;
      expect(arr[1]).assertEqual(50);
      expect(arr.toString()).assertEqual('1,50,3');
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0013
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0013
     * @tc.desc   Access out-of-range indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint8ClampedArray0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Uint8ClampedArray(3);
      expect(arr[5]).assertUndefined();
      expect(arr[-1]).assertUndefined();
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0014
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0014
     * @tc.desc   Verify automatic clamping for values greater than 255
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray(2);
      arr[0] = 300;
      arr[1] = 256;
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0015
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0015
     * @tc.desc   Verify automatic clamping for values less than 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray(2);
      arr[0] = -10;
      arr[1] = -50;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0016
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0016
     * @tc.desc   Verify handling of NaN values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray(1);
      arr[0] = NaN;
      expect(arr[0]).assertEqual(0);
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0017
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0017
     * @tc.desc   Verify handling of Infinity values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray(2);
      arr[0] = Infinity;
      arr[1] = -Infinity;
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0020
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0020
     * @tc.desc   Modify elements in batch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray(5);
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
     * @tc.name   TypeArrayUint8ClampedArray0021
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0021
     * @tc.desc   Multiple views sharing the same ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new collections.ArrayBuffer(4);
      const arr1 = new collections.Uint8ClampedArray(buffer);
      const arr2 = new collections.Uint8ClampedArray(buffer);

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
     * @tc.name   TypeArrayUint8ClampedArray0022
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0022
     * @tc.desc   Create different types of views from Uint8ClampedArray
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new collections.Uint8ClampedArray([0x00, 0xFF, 0x80, 0x40]);
      const intView = new collections.Int32Array(clamped.buffer);
      expect(intView.length).assertEqual(1);
      expect(intView[0]).assertEqual(0x4080FF00);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0023
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0023
     * @tc.desc   Verify impact of view modification on original array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new collections.ArrayBuffer(8);
      const clamped = new collections.Uint8ClampedArray(buffer);
      const uintView = new collections.Uint8Array(buffer);
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
     * @tc.name   TypeArrayUint8ClampedArray0024
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0024
     * @tc.desc   Create views with different offsets
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new collections.ArrayBuffer(10);
      const base = new collections.Uint8ClampedArray(buffer);
      base.set([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);

      const view = new collections.Uint8ClampedArray(buffer, 3, 4);
      expect(view.length).assertEqual(4);
      expect(view.toString()).assertEqual('4,5,6,7');
      expect(view[0]).assertEqual(4);
      expect(view[1]).assertEqual(5);
      expect(view[2]).assertEqual(6);
      expect(view[3]).assertEqual(7);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0025
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0025
     * @tc.desc   Exception handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
        const clamped = new collections.Uint8ClampedArray([25, 0, 12]);
        expect(clamped.toString()).assertEqual('25,0,12');
        expect(clamped.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0026
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0026
     * @tc.desc   Interaction with DataView sharing the same buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   TypeArrayUint8ClampedArray0027
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0027
     * @tc.desc   Modify Uint8ClampedArray values via DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   TypeArrayUint8ClampedArray0028
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0028
     * @tc.desc   Interaction of multi-level nested views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new collections.ArrayBuffer(16);
      const base = new collections.Uint8ClampedArray(buffer);
      const view1 = new collections.Uint8ClampedArray(buffer, 4, 8);
      const view2 = new collections.Uint8ClampedArray(view1.buffer, 6, 4);

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
     * @tc.name   TypeArrayUint8ClampedArray0029
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0029
     * @tc.desc   Verify byteLength consistency of shared buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new collections.ArrayBuffer(10);
      const arr = new collections.Uint8ClampedArray(buffer, 2, 5);
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
     * @tc.name   TypeArrayUint8ClampedArray0030
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0030
     * @tc.desc   Verify clamping behavior across views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new collections.ArrayBuffer(4);
      const clamped = new collections.Uint8ClampedArray(buffer);
      const uintView = new collections.Uint8Array(buffer);

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
     * @tc.name   TypeArrayUint8ClampedArray0031
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0031
     * @tc.desc   set method: copy from regular array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray(5);
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
     * @tc.name   TypeArrayUint8ClampedArray0032
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0032
     * @tc.desc   set method: copy with offset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray(6);
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
     * @tc.name   TypeArrayUint8ClampedArray0033
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0033
     * @tc.desc   set method: handle out-of-range values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray(3);
      arr.set([260, -5, 128]);
      expect(arr.toString()).assertEqual('255,0,128');
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(128);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0034
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0034
     * @tc.desc   subarray method: create subarray
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      expect(sub.toString()).assertEqual('2,3,4');
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
      expect(sub.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0035
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0035
     * @tc.desc   slice method: create copy
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([10, 20, 30]);
      const sliced = arr.slice(1);
      expect(sliced.toString()).assertEqual('20,30');
      expect(sliced.buffer === arr.buffer).assertFalse();
      expect(sliced[0]).assertEqual(20);
      expect(sliced[1]).assertEqual(30);
      expect(sliced.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0036
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0036
     * @tc.desc   fill method: fill with single value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray(4);
      arr.fill(50);
      expect(arr.every(v => v === 50)).assertEqual(true);
      expect(arr[0]).assertEqual(50);
      expect(arr[1]).assertEqual(50);
      expect(arr[2]).assertEqual(50);
      expect(arr[3]).assertEqual(50);
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0037
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0037
     * @tc.desc   fill method: fill with out-of-range values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray(3);
      arr.fill(300);
      expect(arr.every(v => v === 255)).assertEqual(true);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0038
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0038
     * @tc.desc   map method: transform elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([10, 20, 30]);
      const mapped = arr.map(v => v * 5);
      expect(mapped.toString()).assertEqual('50,100,150');
      expect(mapped[0]).assertEqual(50);
      expect(mapped[1]).assertEqual(100);
      expect(mapped[2]).assertEqual(150);
      expect(mapped.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0039
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0039
     * @tc.desc   map method: handle clamping
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([50, 60, 70]);
      const mapped = arr.map(v => v * 5);
      expect(mapped.toString()).assertEqual('250,255,255');
      expect(mapped[0]).assertEqual(250);
      expect(mapped[1]).assertEqual(255);
      expect(mapped[2]).assertEqual(255);
      expect(mapped.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0040
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0040
     * @tc.desc   filter method: filter elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([10, 100, 200, 255, 50]);
      const filtered = arr.filter(v => v > 100);
      expect(filtered.toString()).assertEqual('200,255');
      expect(filtered[0]).assertEqual(200);
      expect(filtered[1]).assertEqual(255);
      expect(filtered.length).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0041
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0041
     * @tc.desc   reduce method: calculate sum
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([10, 20, 30, 40]);
      const sum = arr.reduce((acc, val) => acc + val, 0);
      expect(sum).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0042
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0042
     * @tc.desc   every method: check all elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([50, 100, 150]);
      const allBelow200 = arr.every(v => v < 200);
      const allAbove100 = arr.every(v => v > 100);
      expect(allBelow200).assertEqual(true);
      expect(allAbove100).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0043
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0043
     * @tc.desc   some method: check if any element exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([50, 100, 150]);
      const hasOver120 = arr.some(v => v > 120);
      const hasNegative = arr.some(v => v < 0);
      expect(hasOver120).assertEqual(true);
      expect(hasNegative).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0044
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0044
     * @tc.desc   find method: find element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([30, 70, 50, 90, 50]);
      const found = arr.find(v => v === 50);
      const notFound = arr.find(v => v === 100);
      expect(found).assertEqual(50);
      expect(notFound).assertUndefined();
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0045
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0045
     * @tc.desc   findIndex method: find index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([30, 70, 50, 90, 50]);
      const index = arr.findIndex(v => v === 50);
      const notFoundIndex = arr.findIndex(v => v === 100);
      expect(index).assertEqual(2);
      expect(notFoundIndex).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0046
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0046
     * @tc.desc   includes method: check if element exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([10, 20, 30, 255]);
      expect(arr.includes(20)).assertEqual(true);
      expect(arr.includes(256)).assertEqual(false);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(255);
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0047
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0047
     * @tc.desc   indexOf method: find index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([5, 10, 15, 10, 20]);
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
     * @tc.name   TypeArrayUint8ClampedArray0048
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0048
     * @tc.desc   lastIndexOf method: find last index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([5, 10, 15, 10, 20]);
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
     * @tc.name   TypeArrayUint8ClampedArray0049
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0049
     * @tc.desc   join method: concatenate into string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([255, 128, 0]);
      expect(arr.join(',')).assertEqual('255,128,0');
      expect(arr.join('|')).assertEqual('255|128|0');
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(128);
      expect(arr[2]).assertEqual(0);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0050
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0050
     * @tc.desc   values iterator: usage
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Uint8ClampedArray([10, 20, 30]);
      const values = collections.Uint8ClampedArray.from(arr.values());
      expect(values.toString()).assertEqual('10,20,30');
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(30);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0051
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0051
     * @tc.desc   Convert to regular array (Array.from)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new collections.Uint8ClampedArray([10, 20, 30]);
      const arr = collections.Uint8ClampedArray.from(clamped);
      expect(Array.isArray(arr)).assertEqual(false);
      expect(arr.toString()).assertEqual([10, 20, 30].toString());
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0052
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0052
     * @tc.desc   Convert to regular array (spread operator)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new collections.Uint8ClampedArray([5, 15, 25]);
      const arr = [...clamped];
      expect(Array.isArray(arr)).assertEqual(true);
      expect(arr.toString()).assertEqual([5, 15, 25].toString());
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0053
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0053
     * @tc.desc   Convert to Uint8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new collections.Uint8ClampedArray([100, 200, 255]);
      const uint8 = new Uint8Array(clamped);
      expect(uint8 instanceof Uint8Array).assertEqual(true);
      expect(uint8.toString()).assertEqual('100,200,255');
      expect(uint8.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0054
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0054
     * @tc.desc   Convert to Int32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new collections.Uint8ClampedArray([10, 20, 30]);
      const int32 = new Int32Array(clamped);
      expect(int32 instanceof Int32Array).assertEqual(true);
      expect(int32.toString()).assertEqual('10,20,30');
      expect(int32.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0055
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0055
     * @tc.desc   Interaction with JSON.stringify
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new collections.Uint8ClampedArray([1, 2, 3, 4]);
      const json: string = ArkTSUtils.ASON.stringify(Array.from(clamped));
      expect(json).assertEqual('[1,2,3,4]');
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0057
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0057
     * @tc.desc   Convert to string (toString)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new collections.Uint8ClampedArray([255, 0, 128]);
      expect(clamped.toString()).assertEqual('255,0,128');
      expect(clamped.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0058
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0058
     * @tc.desc   Convert to ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new collections.Uint8ClampedArray([5, 6, 7]);
      const buffer = clamped.buffer;
      expect(buffer instanceof collections.ArrayBuffer).assertEqual(true);
      expect(buffer.byteLength).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0059
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0059
     * @tc.desc   Convert from Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const float32 = new Float32Array([-1.5, 128.3, 300.9]);
      const clamped = new collections.Uint8ClampedArray(float32);
      expect(clamped.toString()).assertEqual('0,128,255');
      expect(clamped.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0060
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0060
     * @tc.desc   Convert to string (toLocaleString)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint8ClampedArray0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const clamped = new collections.Uint8ClampedArray([1000, 200, 300]);
      expect(clamped.toLocaleString()).assertEqual('255,200,255');
      expect(clamped.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayUint8ClampedArray0061
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT8CLAMPEDARRAY_0061
     * @tc.desc   Handling of maximum value (255)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
