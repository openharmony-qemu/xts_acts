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
import { sleep } from './pages/Utils'
import { collections } from '@kit.ArkTS'


export default function Int8ArrayAllTest() {
  describe('Int8ArrayAllTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0001
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0002
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0003
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0004
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0005
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0006
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0007
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0008
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0009
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0010
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0011
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0012
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0013
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0014
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0015
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0016
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0017
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0018
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0019
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0020
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0021
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0022
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0023
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0024
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0025
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0026
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0027
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0028
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0029
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0030
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0031
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0032
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0033
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0034
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0035
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
        errorMsg = 'first filtered value should be 5';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0036
     * @tc.desc   Verify Int8Array find method returns first matching value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-10, 20, -30, 40]);
      const foundVal: number | undefined = int8Arr.find(val => val < -20);
      let errorMsg: string = '';

      if (foundVal !== -30) {
        errorMsg = 'find should return first value < -20 (-30)';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0037
     * @tc.desc   Verify Int8Array findIndex method returns first matching index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-10, 20, -30, 40]);
      const foundIdx: number = int8Arr.findIndex(val => val > 20);
      let errorMsg: string = '';

      if (foundIdx !== 3) {
        errorMsg = 'findIndex should return index 3 (value 40)';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0038
     * @tc.desc   Verify Int8Array every method checks all elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-50, -30, -10]);
      const allNegative: boolean = int8Arr.every(val => val < 0);
      let errorMsg: string = '';

      if (!allNegative) {
        errorMsg = 'every should return true for all negative values';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0039
     * @tc.desc   Verify Int8Array some method checks at least one element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-50, -30, 10]);
      const hasPositive: boolean = int8Arr.some(val => val > 0);
      let errorMsg: string = '';

      if (!hasPositive) {
        errorMsg = 'some should return true for at least one positive value';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0040
     * @tc.desc   Verify Int8Array reduce method accumulates values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4]);
      const total: number = int8Arr.reduce((acc, val) => acc + val, 0);
      let errorMsg: string = '';

      if (total !== 10) {
        errorMsg = 'reduce should accumulate to 10';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0041
     * @tc.desc   Verify Int8Array includes method checks element existence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-127, 0, 127]);
      const has127: boolean = int8Arr.includes(127);
      const has128: boolean = int8Arr.includes(128);
      let errorMsg: string = '';

      if (!has127) {
        errorMsg = 'includes should find 127';
      } else if (has128) {
        errorMsg = 'includes should not find 128';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0042
     * @tc.desc   Verify Int8Array constructed with plain array (length 3)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const sourceArr: number[] = [10, 20, 30];
      const int8Arr: collections.Int8Array = new collections.Int8Array(sourceArr);
      let errorMsg: string = '';

      if (int8Arr.length !== sourceArr.length) {
        errorMsg = 'Length mismatch with source array';
      } else {
        for (let i = 0; i < int8Arr.length; i++) {
          if (int8Arr[i] !== sourceArr[i]) {
            errorMsg = `Value at index ${i} mismatch: ${int8Arr[i]} vs ${sourceArr[i]}`;
            break;
          }
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0043
     * @tc.desc   Verify Int8Array constructed with Uint8Array (valid range values)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const uint8Source: Uint8Array = new Uint8Array([120, 60, 90]);
      const int8Arr: collections.Int8Array = new collections.Int8Array(uint8Source);
      let errorMsg: string = '';

      if (int8Arr.length !== uint8Source.length) {
        errorMsg = 'Length mismatch with Uint8Array';
      } else {
        for (let i = 0; i < int8Arr.length; i++) {
          if (int8Arr[i] !== uint8Source[i]) {
            errorMsg = `Value at index ${i} mismatch: ${int8Arr[i]} vs ${uint8Source[i]}`;
            break;
          }
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0044
     * @tc.desc   Verify Int8Array constructed with Int16Array (truncated to 8-bit)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int16Source: Int16Array = new Int16Array([250, 300]);
      const int8Arr: collections.Int8Array = new collections.Int8Array(int16Source);
      let errorMsg: string = '';

      if (int8Arr[0] !== -6) {
        errorMsg = 'Truncated value -6 mismatch';
      } else if (int8Arr[1] !== 44) {
        errorMsg =
          'Truncated value 300 should be 44';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0045
     * @tc.desc   Verify Int8Array byteLength property matches length × 1 (1 byte per element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testLengths: number[] = [1, 5, 10];
      let errorMsg: string = '';

      for (const len of testLengths) {
        const int8Arr: collections.Int8Array = new collections.Int8Array(len);
        if (int8Arr.byteLength !== len * 1) {
          errorMsg = `byteLength mismatch for length ${len}: ${int8Arr.byteLength} vs ${len * 1}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0046
     * @tc.desc   Verify Int8Array byteOffset property is correct for offset buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(10);
      const offsets: number[] = [1, 3, 5];
      let errorMsg: string = '';

      for (const offset of offsets) {
        const int8Arr: collections.Int8Array = new collections.Int8Array(buf, offset, 2);
        if (int8Arr.byteOffset !== offset) {
          errorMsg = `byteOffset mismatch for offset ${offset}: ${int8Arr.byteOffset} vs ${offset}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0047
     * @tc.desc   Verify Int8Array set method with empty source array (no modification)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(4);
      const int8Arr: collections.Int8Array = new collections.Int8Array(buf);
      int8Arr.set([10, 20, 30, 40]);
      const originalVals: number[] = [...int8Arr];
      const emptySource: number[] = [];

      int8Arr.set(emptySource);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== originalVals[i]) {
          errorMsg = `Value at index ${i} changed after set with empty array`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0059
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0048
     * @tc.desc   Verify Int8Array subarray with negative start index (treats as 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([10, 20, 30, 40]);
      const subArr: collections.Int8Array = int8Arr.subarray(-2, 3);
      expect(subArr.length).assertEqual(1);
      expect(subArr[0]).assertEqual(30);
      expect(subArr[2]).assertEqual(undefined);
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0060
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0049
     * @tc.desc   Verify Int8Array subarray with end index exceeding view length (treats as view length)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([10, 20, 30, 40]);
      const subArr: collections.Int8Array = int8Arr.subarray(1, 10);
      let errorMsg: string = '';

      if (subArr.length !== 3) {
        errorMsg = 'Subarray length should be 3 (end=10 treated as 4)';
      } else if (subArr[0] !==
        20 || subArr[2] !== 40) {
        errorMsg = 'Subarray values mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0050
     * @tc.desc   Verify DataView reads Int8Array buffer with non-zero byteOffset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const int8Arr: Int8Array = new Int8Array(buf, 2, 4);
      int8Arr.set([-5, 15, -25, 35]);
      const dv: DataView = new DataView(buf);
      let errorMsg: string = '';


      if (dv.getInt8(2) !== -5) {
        errorMsg = 'DataView read offset 2 mismatch';
      } else if (dv.getInt8(5) !==
        35) {
        errorMsg = 'DataView read offset 5 mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0062
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0051
     * @tc.desc   Verify DataView writes to Int8Array buffer with non-zero byteOffset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const int8Arr: Int8Array = new Int8Array(buf, 3, 3);
      const dv: DataView = new DataView(buf);
      dv.setInt8(3, 40);
      dv.setInt8(5, 60);
      let errorMsg: string = '';

      if (int8Arr[0] !== 40) {
        errorMsg = 'Int8Array[0] mismatch after DataView write';
      } else if (int8Arr[2] !==
        60) {
        errorMsg = 'Int8Array[2] mismatch after DataView write';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0052
     * @tc.desc   Verify Int8Array converts to plain array with Array.from (empty Int8Array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array(0);
      const plainArr: collections.Int8Array = collections.Int8Array.from(int8Arr);
      let errorMsg: string = '';

      if (!(plainArr instanceof collections.Int8Array)) {
        errorMsg = 'Should convert to plain array';
      } else if (plainArr.length !==
        0) {
        errorMsg = 'Converted array should be empty';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0064
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0053
     * @tc.desc   Verify Int8Array converts to plain array with spread syntax (empty Int8Array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array(0);
      const plainArr: number[] = [...int8Arr];
      let errorMsg: string = '';

      if (!Array.isArray(plainArr)) {
        errorMsg = 'Should convert to plain array';
      } else if (plainArr.length !==
        0) {
        errorMsg = 'Converted array should be empty';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0054
     * @tc.desc   Verify plain array with zero values converts to Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const plainArr: number[] = [0, 0, 0];
      const int8Arr: collections.Int8Array = new collections.Int8Array(plainArr);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== 0) {
          errorMsg = `Value at index ${i} should be 0`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0066
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0055
     * @tc.desc   Verify Int8Array index access with valid integer index (full range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-128, -64, 0, 64, 127]);
      const testIndices: number[] = [0, 2, 4];
      const expectedVals: number[] = [-128, 0, 127];
      let errorMsg: string = '';

      for (let i = 0; i < testIndices.length; i++) {
        const idx: number = testIndices[i];
        if (int8Arr[idx] !== expectedVals[i]) {
          errorMsg = `Value at index ${idx} mismatch: ${int8Arr[idx]} vs ${expectedVals[i]}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0067
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0056
     * @tc.desc   Verify Int8Array assignment with valid integer index (full range)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array(5);
      const assignIndices: number[] = [0, 2, 4];
      const assignVals: number[] = [-128, 0, 127];
      let errorMsg: string = '';

      for (let i = 0; i < assignIndices.length; i++) {
        const idx: number = assignIndices[i];
        int8Arr[idx] = assignVals[i];
        if (int8Arr[idx] !== assignVals[i]) {
          errorMsg = `Assignment at index ${idx} failed: ${int8Arr[idx]} vs ${assignVals[i]}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0057
     * @tc.desc   Verify Int8Array forEach method passes correct index and array to callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([5, 10, 15]);

      interface GeneratedTypeLiteralInterface_1 {
        val: number;
        idx: number;
        arr: collections.Int8Array;
      }

      const log: GeneratedTypeLiteralInterface_1[] = [];
      int8Arr.forEach((val, idx, arr) => {
        log.push({ val, idx, arr });
      });
      let errorMsg: string = '';

      if (log.length !== int8Arr.length) {
        errorMsg = 'forEach should iterate all elements';
      } else if (log[1].val !==
        10 || log[1].idx !== 1) {
        errorMsg = 'forEach callback params mismatch at index 1';
      } else if (log[0].arr !==
        int8Arr) {
        errorMsg = 'forEach callback array param should be original Int8Array';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0058
     * @tc.desc   Verify Int8Array map method passes correct index and array to callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([2, 4, 6]);
      const mappedVals: number[] = [];
      int8Arr.map((val, _idx) => {
        mappedVals.push(val * 2);
        return val * 2;
      });
      let errorMsg: string = '';

      if (mappedVals[0] !== 4 || mappedVals[2] !== 12) {
        errorMsg =
          'map callback val param mismatch';
      } else if (mappedVals.length !== int8Arr.length) {
        errorMsg =
          'map should process all elements';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0059
     * @tc.desc   Verify Int8Array filter method passes correct index and array to callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-3, 0, 3, -6, 6]);
      const filteredIndices: number[] = [];
      int8Arr.filter((val, idx) => {
        if (val > 0) {
          filteredIndices.push(idx);
        }
        return val > 0;
      });
      let errorMsg: string = '';

      if (filteredIndices.join(',') !== '2,4') {
        errorMsg = 'filter callback idx param mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0060
     * @tc.desc   Verify Int8Array find method passes correct index and array to callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([10, 20, 30, 40]);
      let foundIdx: number | undefined;
      const targetVal: number = 30;
      int8Arr.find((val, idx) => {
        if (val === targetVal) {
          foundIdx = idx;
        }
        return val === targetVal;
      });
      let errorMsg: string = '';

      if (foundIdx !== 2) {
        errorMsg = `find callback idx param mismatch: ${foundIdx} vs 2`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0072
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0061
     * @tc.desc   Verify Int8Array findIndex method passes correct value and array to callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-5, -10, -15, -20]);
      let checkedVal: number | undefined;
      const targetIdx: number = 2;
      int8Arr.findIndex((val, idx) => {
        if (idx === targetIdx) {
          checkedVal = val;
        }
        return idx === targetIdx;
      });
      let errorMsg: string = '';

      if (checkedVal !== -15) {
        errorMsg = `findIndex callback val param mismatch: ${checkedVal} vs -15`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0073
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0062
     * @tc.desc   Verify Int8Array every method stops iterating on first false condition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 0, 5]);
      let iterateCount: number = 0;
      const result: boolean = int8Arr.every(val => {
        iterateCount++;
        return val > 0;
      });
      let errorMsg: string = '';

      if (result !== false) {
        errorMsg = 'every should return false for array with 0';
      } else if (iterateCount !==
        5) {
        errorMsg = 'every should stop at first false (index 4), iterateCount=5';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0074
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0063
     * @tc.desc   Verify Int8Array some method stops iterating on first true condition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-1, -2, -3, 4, -5]);
      let iterateCount: number = 0;
      const result: boolean = int8Arr.some(val => {
        iterateCount++;
        return val > 0;
      });
      let errorMsg: string = '';

      if (result !== true) {
        errorMsg = 'some should return true for array with 4';
      } else if (iterateCount !==
        4) {
        errorMsg = 'some should stop at first true (index 3), iterateCount=4';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0075
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0064
     * @tc.desc   Verify Int8Array reduce method uses initial value correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([3, 6, 9]);
      const initialVal: number = 10;
      const total: number = int8Arr.reduce((acc, val) => acc + val, initialVal);
      let errorMsg: string = '';

      const expectedTotal: number = initialVal + 3 + 6 + 9;
      if (total !== expectedTotal) {
        errorMsg = `reduce total mismatch: ${total} vs ${expectedTotal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0076
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0065
     * @tc.desc   Verify Int8Array reduce method without initial value uses first element as initial
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([2, 4, 6]);

      const total: number = int8Arr.reduce((acc, val) => acc + val);
      let errorMsg: string = '';

      if (total !== 12) {
        errorMsg = `reduce total without initial value mismatch: ${total} vs 12`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0077
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0066
     * @tc.desc   Verify Int8Array includes method returns false for non-existent value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-120, -60, 60, 120]);
      const testVals: number[] = [-100, 0, 100];
      let errorMsg: string = '';

      for (const val of testVals) {
        if (int8Arr.includes(val)) {
          errorMsg = `includes should return false for non-existent value ${val}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0078
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0067
     * @tc.desc   Verify Int8Array includes method works with duplicate values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([5, 10, 5, 15, 5]);
      let errorMsg: string = '';

      if (!int8Arr.includes(5)) {
        errorMsg = 'includes should find duplicate value 5';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0079
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0068
     * @tc.desc   Verify Int8Array indexOf method returns first occurrence index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([8, 4, 8, 2, 8]);
      const targetVal: number = 8;
      const firstIdx: number = int8Arr.indexOf(targetVal);
      let errorMsg: string = '';

      if (firstIdx !== 0) {
        errorMsg = `indexOf should return first occurrence index 0 for ${targetVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0080
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0069
     * @tc.desc   Verify Int8Array indexOf method returns -1 for non-existent value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-7, -3, 3, 7]);
      const targetVal: number = 0;
      const idx: number = int8Arr.indexOf(targetVal);
      let errorMsg: string = '';

      if (idx !== -1) {
        errorMsg = `indexOf should return -1 for non-existent value ${targetVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0081
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0070
     * @tc.desc   Verify Int8Array lastIndexOf method returns last occurrence index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([12, 6, 12, 3, 12]);
      const targetVal: number = 12;
      const lastIdx: number = int8Arr.lastIndexOf(targetVal);
      let errorMsg: string = '';

      if (lastIdx !== 4) {
        errorMsg = `lastIndexOf should return last occurrence index 4 for ${targetVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0082
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0071
     * @tc.desc   Verify Int8Array lastIndexOf method returns -1 for non-existent value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([-11, -5, 5, 11]);
      const targetVal: number = 0;
      const idx: number = int8Arr.lastIndexOf(targetVal);
      let errorMsg: string = '';

      if (idx !== -1) {
        errorMsg = `lastIndexOf should return -1 for non-existent value ${targetVal}`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0083
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0072
     * @tc.desc   Verify Int8Array slice method returns new Int8Array (no buffer share)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4]);
      const slicedArr: collections.Int8Array = int8Arr.slice(1, 3);
      slicedArr[0] = 20;
      let errorMsg: string = '';

      if (int8Arr[1] === 20) {
        errorMsg = 'slice should return new array (no buffer share)';
      } else if (slicedArr[0] !==
        20) {
        errorMsg = 'sliced array modification failed';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0084
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0073
     * @tc.desc   Verify Int8Array slice method with negative start index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([10, 20, 30, 40, 50]);
      const slicedArr: collections.Int8Array = int8Arr.slice(-3);
      let errorMsg: string = '';

      if (slicedArr.length !== 3) {
        errorMsg = 'sliced array length should be 3 (start=-3)';
      } else if (slicedArr[0] !==
        30 || slicedArr[2] !== 50) {
        errorMsg = 'sliced array values mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0085
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0074
     * @tc.desc   Verify Int8Array slice method with negative end index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([10, 20, 30, 40, 50]);
      const slicedArr: collections.Int8Array = int8Arr.slice(1, -2);
      let errorMsg: string = '';

      if (slicedArr.length !== 2) {
        errorMsg =
          'sliced array length should be 2 (start=1, end=-2)';
      } else if (slicedArr[0] !== 20 ||
        slicedArr[1] !== 30) {
        errorMsg = 'sliced array values mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0086
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0075
     * @tc.desc   Verify Int8Array copyWithin method copies elements within array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      int8Arr.copyWithin(0, 3);
      let errorMsg: string = '';

      if (int8Arr[0] !== 4 || int8Arr[1] !== 5) {
        errorMsg =
          'copyWithin result mismatch at start';
      } else if (int8Arr[2] !== 3) {
        errorMsg =
          'copyWithin should retain unoverwritten values';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0087
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0076
     * @tc.desc   Verify Int8Array copyWithin method with target, start and end indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([10, 20, 30, 40, 50, 60]);

      int8Arr.copyWithin(4, 2, 4);
      let errorMsg: string = '';

      if (int8Arr[4] !== 30 || int8Arr[5] !== 40) {
        errorMsg = 'copyWithin result mismatch';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0088
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0077
     * @tc.desc   Verify Int8Array fill method fills all elements with specified value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array(4);
      const fillVal: number = -15;
      int8Arr.fill(fillVal);
      let errorMsg: string = '';

      for (let i = 0; i < int8Arr.length; i++) {
        if (int8Arr[i] !== fillVal) {
          errorMsg = `Value at index ${i} not filled with ${fillVal}`;
          break;
        }
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0089
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0078
     * @tc.desc   Verify Int8Array fill method with start index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5]);
      const fillVal: number = 9;
      const startIdx: number = 2;
      int8Arr.fill(fillVal, startIdx);
      let errorMsg: string = '';

      if (int8Arr[0] === 9 || int8Arr[1] === 9) {
        errorMsg =
          'fill should not affect elements before start index';
      } else if (int8Arr[2] !== 9 ||
        int8Arr[4] !== 9) {
        errorMsg = 'fill should affect elements from start index';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0090
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0079
     * @tc.desc   Verify Int8Array fill method with start and end indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([1, 2, 3, 4, 5, 6]);
      const fillVal: number = 7;
      const startIdx: number = 1;
      const endIdx: number = 4;

      int8Arr.fill(fillVal, startIdx, endIdx);
      let errorMsg: string = '';

      if (int8Arr[1] !== 7 || int8Arr[3] !== 7) {
        errorMsg =
          'fill should affect elements in [start, end)';
      } else if (int8Arr[0] === 7 || int8Arr[4] === 7) {
        errorMsg =
          'fill should not affect elements outside [start, end)';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0091
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0080
     * @tc.desc   Verify Int8Array fill method with overflow value (auto-handled)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const int8Arr: collections.Int8Array = new collections.Int8Array(2);
      const overflowVal: number = 130;
      int8Arr.fill(overflowVal);
      let errorMsg: string = '';

      if (int8Arr[0] !== -126 || int8Arr[1] !== -126) {
        errorMsg =
          `fill with ${overflowVal} should auto-handle overflow to -126`;
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0092
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0081
     * @tc.desc   Verify Int8Array constructor throws RangeError with negative length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let hasError: boolean = false;
      let errorMsg: string = '';

      try {
        new collections.Int8Array(-5);
      } catch (e) {
        hasError = true;
        if ((e as Error).name !== 'RangeError') {
          errorMsg = 'Thrown error should be RangeError';
        }
      }

      if (!hasError) {
        errorMsg = 'Should throw RangeError with negative length';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0094
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0082
     * @tc.desc   Verify Int8Array constructor with ArrayBuffer and length exceeding buffer capacity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt8ArrayTest0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf: collections.ArrayBuffer = new collections.ArrayBuffer(4);
      let hasError: boolean = false;
      let errorMsg: string = '';

      try {
        new collections.Int8Array(buf, 0, 5);
      } catch (e) {
        hasError = true;
        if ((e as Error).name !== 'RangeError') {
          errorMsg = 'Thrown error should be RangeError';
        }
      }

      if (!hasError) {
        errorMsg = 'Should throw RangeError when length exceeds buffer capacity';
      }
      expect(errorMsg).assertEqual('');
    })

    /**
     * @tc.name   TypeArrayInt8ArrayTest0095
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_ALL_0083
     * @tc.desc   Verify Int8Array constructor with valid length (large but within limit)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt8ArrayTest0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testLength: number = 100;
      const int8Arr: collections.Int8Array = new collections.Int8Array(testLength);
      let errorMsg: string = '';

      if (int8Arr.length !== testLength) {
        errorMsg =
          `Length mismatch: ${int8Arr.length} vs ${testLength}`;
      } else if (int8Arr.byteLength !==
        testLength * 1) {
        errorMsg = `byteLength mismatch for length ${testLength}`;
      }
      expect(errorMsg).assertEqual('');
