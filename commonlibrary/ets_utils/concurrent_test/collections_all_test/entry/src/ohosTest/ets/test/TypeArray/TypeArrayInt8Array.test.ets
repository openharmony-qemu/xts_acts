/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from '../../testability/pages/Utils'
import { collections } from '@kit.ArkTS'


export default function typeArrayInt8ArrayTest() {
  describe('TypeArrayInt8ArrayTest', () => {
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
     * @tc.name   TypeArrayInt8ArrayTest0001
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0001
     * @tc.desc   Verify basic properties of Int8Array constructed with ArrayBuffer (offset 0, length 8)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf = new collections.ArrayBuffer(8);
      const int8Arr = new collections.Int8Array(buf, 0, 8);
      let errorMsg: string = '';

      if (int8Arr.buffer !== buf) {
        errorMsg = 'Buffer reference mismatch';
      } else if (int8Arr.byteOffset !==
        0) {
        errorMsg = 'byteOffset should be 0';
      } else if (int8Arr.byteLength !== 8) {
        errorMsg =
          'byteLength should be 8';
      } else if (int8Arr.length !== 8) {
        errorMsg = 'length should be 8';
      } else {
        for (let i = 0; i < int8Arr.length; i++) {
          if (int8Arr[i] !== 0) {
            errorMsg = `Initial value at index ${i} should be 0`;
            break;
          }
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0002
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0002
     * @tc.desc   Verify Int8Array basic properties with ArrayBuffer (offset 2, length 3)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf = new collections.ArrayBuffer(8);
      const int8Arr = new collections.Int8Array(buf, 2, 3);
      let errorMsg: string = '';

      if (int8Arr.byteOffset !== 2) {
        errorMsg = 'byteOffset should be 2';
      } else if (int8Arr.byteLength !== 3) {
        errorMsg =
          'byteLength should be 3';
      } else if (int8Arr.length !== 3) {
        errorMsg =
          'length should be 3';
      } else if (int8Arr.buffer !== buf) {
        errorMsg = 'Buffer reference mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0003
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0003
     * @tc.desc   Verify Int8Array initial values are all 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf = new collections.ArrayBuffer(4);
      const int8Arr = new collections.Int8Array(buf);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== 0) {
          errorMsg = `Initial value at index ${i} is not 0`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0004
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0004
     * @tc.desc   Verify Int8Array stores legal maximum value (127) correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array(1);
      const maxValue: number = 127;
      int8Arr[0] = maxValue;
      let errorMsg: string = '';

      if (int8Arr[0] !== maxValue) {
        errorMsg = `Should store max value ${maxValue}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0005
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0005
     * @tc.desc   Verify Int8Array stores legal minimum value (-128) correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array(1);
      const minValue: number = -128;
      int8Arr[0] = minValue;
      let errorMsg: string = '';

      if (int8Arr[0] !== minValue) {
        errorMsg = `Should store min value ${minValue}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0006
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0006
     * @tc.desc   Verify Int8Array overflows to -128 when value is 128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array(1);
      const overflowVal: number = 128;
      const expectedVal: number = -128;
      int8Arr[0] = overflowVal;
      let errorMsg: string = '';

      if (int8Arr[0] !== expectedVal) {
        errorMsg = `${overflowVal} should overflow to ${expectedVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0007
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0007
     * @tc.desc   Verify Int8Array overflows to 127 when value is -129
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array(1);
      const overflowVal: number = -129;
      const expectedVal: number = 127;
      int8Arr[0] = overflowVal;
      let errorMsg: string = '';

      if (int8Arr[0] !== expectedVal) {
        errorMsg = `${overflowVal} should overflow to ${expectedVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0008
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0008
     * @tc.desc   Verify Int8Array stores 0 correctly (middle of range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array(1);
      const testVal: number = 0;
      int8Arr[0] = testVal;
      let errorMsg: string = '';

      if (int8Arr[0] !== testVal) {
        errorMsg = `Should store value ${testVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0009
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0009
     * @tc.desc   Verify Int8Array set method with plain array (start index 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(5);
      const int8Arr: collections.Int8Array = new collections.Int8Array(buf);
      const sourceArr: number[] = [10, 20, 30, 40, 50];
      int8Arr.set(sourceArr);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== sourceArr[i]) {
          errorMsg = `Value at index ${i} mismatch: ${int8Arr[i]} vs ${sourceArr[i]}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0010
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0010
     * @tc.desc   Verify Int8Array set method with plain array (start index 2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(5);
      const int8Arr: collections.Int8Array = new collections.Int8Array(buf);
      const sourceArr: number[] = [40, 50];
      const startIdx: number = 2;
      int8Arr.set(sourceArr, startIdx);
      let errorMsg: string = '';

      if (int8Arr[startIdx] !== 40) {
        errorMsg = `Value at index ${startIdx} should be 40`;
      } else if (int8Arr[startIdx +
        1] !== 50) {
        errorMsg = `Value at index ${startIdx + 1} should be 50`;
      } else if (int8Arr[0] !== 0) {
        errorMsg =
          'Unassigned index 0 should be 0';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0011
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0011
     * @tc.desc   Verify Int8Array set method with Uint8Array (start index 1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(4);
      const int8Arr: collections.Int8Array = new collections.Int8Array(buf);
      const uint8Source: Uint8Array = new Uint8Array([60, 70]);
      const startIdx: number = 1;
      int8Arr.set(uint8Source, startIdx);
      let errorMsg: string = '';

      if (int8Arr[startIdx] !== 60) {
        errorMsg = `Value at index ${startIdx} should be 60`;
      } else if (int8Arr[startIdx +
        1] !== 70) {
        errorMsg = `Value at index ${startIdx + 1} should be 70`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0012
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0012
     * @tc.desc   Verify Int8Array set method truncates Int16Array values to 8-bit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(3);
      const int8Arr: collections.Int8Array = new collections.Int8Array(buf);
      const int16Source: Int16Array = new Int16Array([200, 300]);
      int8Arr.set(int16Source);
      let errorMsg: string = '';

      if (int8Arr[0] !== -56) {
        errorMsg = 'Truncated value -56 mismatch';
      } else if (int8Arr[1] !== 44) {
        errorMsg =
          'Truncated value 300 should be 44';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0013
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0013
     * @tc.desc   Verify Int8Array set method throws RangeError when source length exceeds view
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(3);
      const int8Arr: collections.Int8Array = new collections.Int8Array(buf);
      const sourceArr: number[] = [1, 2, 3, 4];
      let hasError: boolean = false;
      let errorMsg: string = '';

      try {
        int8Arr.set(sourceArr);
      } catch (e) {
        hasError = true;
        if ((e as Error).name !== 'RangeError') {
          errorMsg = 'Thrown error should be RangeError';
        }
      }

      if (!hasError) {
        errorMsg = 'Should throw RangeError for excess source length';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0014
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0014
     * @tc.desc   Verify Int8Array subarray shares buffer with original view (modify subarray)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(5);
      const int8Arr: collections.Int8Array = new collections.Int8Array(buf);
      int8Arr.set([1, 2, 3, 4, 5]);
      const subArr: collections.Int8Array = int8Arr.subarray(1, 4);
      subArr[0] = 20;
      let errorMsg: string = '';

      if (int8Arr[1] !== 20) {
        errorMsg =
          'Original view not updated by subarray modification';
      } else if (subArr.length !== 3) {
        errorMsg =
          'Subarray length should be 3';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0015
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0015
     * @tc.desc   Verify Int8Array subarray with start index 0 (full range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([10, 20, 30]);
      const subArr: collections.Int8Array = int8Arr.subarray(0);
      let errorMsg: string = '';

      if (subArr.length !== int8Arr.length) {
        errorMsg = 'Subarray length should match original';
      } else if (subArr[2] !==
        30) {
        errorMsg = 'Subarray last value should be 30';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0016
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0016
     * @tc.desc   Verify Int8Array subarray returns empty view when start=end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([5, 6, 7]);
      const subArr: collections.Int8Array = int8Arr.subarray(2, 2);
      let errorMsg: string = '';

      if (subArr.length !== 0) {
        errorMsg = 'Subarray should be empty when start=end';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0018
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0018
     * @tc.desc   Verify DataView reads Int8Array shared ArrayBuffer (offset 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const int8Arr: Int8Array = new Int8Array(buf);
      int8Arr.set([-10, 20, -30]);
      const dv: DataView = new DataView(buf);
      let errorMsg: string = '';

      if (dv.getInt8(0) !== -10) {
        errorMsg = 'DataView read offset 0 mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0019
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0019
     * @tc.desc   Verify DataView reads Int8Array shared ArrayBuffer (offset 2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const int8Arr: Int8Array = new Int8Array(buf);
      int8Arr.set([-10, 20, -30]);
      const dv: DataView = new DataView(buf);
      let errorMsg: string = '';

      if (dv.getInt8(2) !== -30) {
        errorMsg = 'DataView read offset 2 mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0020
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0020
     * @tc.desc   Verify DataView modifies Int8Array shared ArrayBuffer (offset 1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const int8Arr: Int8Array = new Int8Array(buf);
      const dv: DataView = new DataView(buf);
      const modifyVal: number = 50;
      dv.setInt8(1, modifyVal);
      let errorMsg: string = '';

      if (int8Arr[1] !== modifyVal) {
        errorMsg = 'Int8Array not updated by DataView';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0021
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0021
     * @tc.desc   Verify bidirectional sync between DataView and Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      const int8Arr: Int8Array = new Int8Array(buf);
      const dv: DataView = new DataView(buf);
      let errorMsg: string = '';
      int8Arr[0] = 40;
      if (dv.getInt8(0) !== 40) {
        errorMsg = 'DataView not synced from Int8Array';
      } else {
        dv.setInt8(1, -60);
        if (int8Arr[1] !== -60) {
          errorMsg = 'Int8Array not synced from DataView';
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0022
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0022
     * @tc.desc   Verify Int8Array converts to plain array via Array.from
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-5, 0, 5]);
      const plainArr: collections.Int8Array = collections.Int8Array.from(int8Arr);
      let errorMsg: string = '';

      if (!(plainArr instanceof collections.Int8Array)) {
        errorMsg = 'Should convert to plain array';
      } else if (plainArr.at(0) !==
        -5) {
        errorMsg = 'Converted value at index 0 mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0023
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0023
     * @tc.desc   Verify Int8Array converts to plain array via spread syntax
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-10, 20, -30]);
      const plainArr: number[] = [...int8Arr];
      let errorMsg: string = '';

      if (!Array.isArray(plainArr)) {
        errorMsg = 'Should convert to plain array';
      } else if (plainArr[2] !==
        -30) {
        errorMsg = 'Converted value at index 2 mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0024
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0024
     * @tc.desc   Verify modifying converted plain array does not affect original Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([1, 2]);
      const plainArr: collections.Int8Array = collections.Int8Array.from(int8Arr);
      plainArr[0] = 100;
      let errorMsg: string = '';

      if (int8Arr[0] !== 1) {
        errorMsg = 'Original Int8Array should remain unchanged';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0025
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0025
     * @tc.desc   Verify Int8Array converts to plain array with map via Array.from
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([2, 4, 6]);
      const plainArr: collections.Int8Array = collections.Int8Array.from(int8Arr, x => x * 2);
      let errorMsg: string = '';

      if (plainArr[1] !== 8) {
        errorMsg = 'Mapped value at index 1 should be 8';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0026
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0026
     * @tc.desc   Verify plain array with overflow values converts to Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const plainArr: number[] = [130, -130];
      const int8Arr: collections.Int8Array = new collections.Int8Array(plainArr);
      let errorMsg: string = '';

      if (int8Arr[0] !== -126) {
        errorMsg = '130 should convert to -128';
      } else if (int8Arr[1] !== 126) {
        errorMsg =
          '-130 should convert to 126';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0027
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0027
     * @tc.desc   Verify Int8Array returns undefined for negative index access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([10, 20]);
      const accessResult: number | undefined = int8Arr[-1];
      let errorMsg: string = '';

      if (accessResult !== undefined) {
        errorMsg = 'Negative index should return undefined';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0028
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0028
     * @tc.desc   Verify Int8Array returns undefined for out-of-bounds index access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([10, 20]);
      const accessResult: number | undefined = int8Arr[5];
      let errorMsg: string = '';

      if (accessResult !== undefined) {
        errorMsg = 'Out-of-bounds index should return undefined';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0029
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0029
     * @tc.desc   Verify Int8Array ignores assignment to negative index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([10, 20]);
      const initialVal0: number = int8Arr[0];
      const initialVal1: number = int8Arr[1];
      int8Arr[-1] = 30;
      let errorMsg: string = '';

      if (int8Arr[0] !== initialVal0 || int8Arr[1] !== initialVal1) {
        errorMsg =
          'Negative index assignment should be ignored';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0030
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0030
     * @tc.desc   Verify Int8Array ignores assignment to out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([10, 20]);
      const initialVal0: number = int8Arr[0];
      const initialVal1: number = int8Arr[1];
      int8Arr[5] = 30;
      let errorMsg: string = '';

      if (int8Arr[0] !== initialVal0 || int8Arr[1] !== initialVal1) {
        errorMsg =
          'Out-of-bounds index assignment should be ignored';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0031
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0031
     * @tc.desc   Verify Int8Array returns undefined for NaN index access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([10, 20]);
      const accessResult: number | undefined = int8Arr[NaN as number];
      let errorMsg: string = '';

      if (accessResult !== undefined) {
        errorMsg = 'NaN index should return undefined';
      }
      expect(errorMsg).assertEqual('');
    })


    /**
     * @tc.name   TypeArrayInt8ArrayTest0040
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0040
     * @tc.desc   Verify Int8Array throws RangeError when offset exceeds buffer length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(4);
      let hasError: boolean = false;
      let errorMsg: string = '';

      try {
        new collections.Int8Array(buf, 5, 1);
      } catch (e) {
        hasError = true;
        if ((e as Error).name !== 'RangeError') {
          errorMsg = 'Thrown error should be RangeError';
        }
      }

      if (!hasError) {
        errorMsg = 'Should throw RangeError for invalid offset';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0041
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0041
     * @tc.desc   Verify Int8Array throws RangeError when offset+length exceeds buffer length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(4);
      let hasError: boolean = false;
      let errorMsg: string = '';

      try {
        new collections.Int8Array(buf, 2, 3);
      } catch (e) {
        hasError = true;
        if ((e as Error).name !== 'RangeError') {
          errorMsg = 'Thrown error should be RangeError';
        }
      }

      if (!hasError) {
        errorMsg = 'Should throw RangeError for invalid offset+length';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0042
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0042
     * @tc.desc   Verify Int8Array forEach method iterates all elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([2, 4, 6]);
      let sum: number = 0;
      int8Arr.forEach(val => sum += val);
      let errorMsg: string = '';

      if (sum !== 12) {
        errorMsg = 'forEach should sum all elements to 12';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0043
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0043
     * @tc.desc   Verify Int8Array map method returns new Int8Array with mapped values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([1, 2, 3]);
      const mappedArr: collections.Int8Array = int8Arr.map(val => val * 2);
      let errorMsg: string = '';

      if (!(mappedArr instanceof collections.Int8Array)) {
        errorMsg = 'map should return Int8Array';
      } else if (mappedArr[1] !==
        4) {
        errorMsg = 'mapped value at index 1 should be 4';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0044
     * @tc.number SUB_BUILDINS_TYPEARRAY_INT8ARRAY_TEST_0044
     * @tc.desc   Verify Int8Array filter method returns new Int8Array with filtered values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-5, 0, 5, 10]);
      const filteredArr: collections.Int8Array = int8Arr.filter(val => val > 0);
      let errorMsg: string = '';

      if (filteredArr.length !== 2) {
        errorMsg = 'filtered array length should be 2';
      } else if (filteredArr[0] !==
        5) {
