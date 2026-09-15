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
import { sleep } from './pages/Utils'
import { arrayLike } from './pages/TypeArrayConst'
import { collections, lang } from '@kit.ArkTS';
import { ArkTSUtils } from '@kit.ArkTS'


interface GeneratedObjectLiteralInterface_1 {
  value: number;
}

interface GeneratedObjectLiteralInterface_2 {
  min: number;
  max: number;
}

interface GeneratedTypeLiteralInterface_1 {
  encrypted: collections.Int16Array;
  keySchedule: collections.Int16Array;
}

export default function Int16ArrayAllTest() {
  describe('Int16ArrayAllTest', () => {
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
     * @tc.name   TypeArrayInt16Array0000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0001
     * @tc.desc   Verify Int16Array constructor with length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Int16Array(5);
      expect(arr.length).assertEqual(5);
      expect(arr.byteLength).assertEqual(10);
      expect(collections.Int16Array.BYTES_PER_ELEMENT).assertEqual(2);

      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(0);
      }
    })

    /**
     * @tc.name   TypeArrayInt16Array0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0002
     * @tc.desc   Verify Int16Array constructor with array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = [1, 2, 3, 4, 5];
      const arr = new collections.Int16Array(source);

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
      expect(arr.byteLength).assertEqual(10);
    })

    /**
     * @tc.name   TypeArrayInt16Array0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0003
     * @tc.desc   Verify Int16Array constructor with buffer parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new collections.ArrayBuffer(16);
      const arr = new collections.Int16Array(buffer);

      expect(arr.length).assertEqual(8);
      expect(arr.byteOffset).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt16Array0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0004
     * @tc.desc   Verify Int16Array constructor with buffer, byteOffset and length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buffer = new collections.ArrayBuffer(20);
      const arr = new collections.Int16Array(buffer, 4, 5);

      expect(arr.length).assertEqual(5);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.byteLength).assertEqual(10);
    })

    /**
     * @tc.name   TypeArrayInt16Array0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0005
     * @tc.desc   Verify Int16Array constructor with another TypedArray
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const source = new Uint8Array([1, 2, 3, 4]);
      const arr = new collections.Int16Array(source);

      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt16Array0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0006
     * @tc.desc   Verify Int16Array set method with array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array(5);
      arr.set([10, 20, 30]);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt16Array0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0007
     * @tc.desc   Verify Int16Array set method with offset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array(5);
      arr.set([10, 20, 30], 2);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(10);
      expect(arr[4]).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayInt16Array0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0008
     * @tc.desc   Verify Int16Array set method with TypedArray
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const source = new collections.Int16Array([1, 2, 3]);
      const arr = new collections.Int16Array(5);
      arr.set(source);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt16Array0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0009
     * @tc.desc   Verify Int16Array subarray method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);

      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt16Array0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0010
     * @tc.desc   Verify Int16Array subarray with negative indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(-3, -1);

      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(3);
      expect(sub[1]).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt16Array0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0011
     * @tc.desc   Verify Int16Array handling of maximum and minimum values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array(3);
      arr[0] = 32767;
      arr[1] = -32768;
      arr[2] = 32768;

      expect(arr[0]).assertEqual(32767);
      expect(arr[1]).assertEqual(-32768);
      expect(arr[2]).assertEqual(-32768);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt16Array0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0012
     * @tc.desc   Verify Int16Array copyWithin method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3);

      expect(arr.toString()).assertEqual('4,5,3,4,5');
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt16Array0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0013
     * @tc.desc   Verify Int16Array fill method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array(5);
      arr.fill(10);

      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(10);
      expect(arr[4]).assertEqual(10);
      expect(arr.length).assertEqual(5);

      arr.fill(20, 1, 4);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(20);
      expect(arr[3]).assertEqual(20);
      expect(arr[4]).assertEqual(10);
    })

    /**
     * @tc.name   TypeArrayInt16Array0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0014
     * @tc.desc   Verify Int16Array includes method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3, 4, 5]);

      expect(arr.includes(3)).assertEqual(true);
      expect(arr.includes(6)).assertEqual(false);
      expect(arr.includes(2, 2)).assertEqual(false);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt16Array0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0015
     * @tc.desc   Verify Int16Array indexOf method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3, 2, 1]);

      expect(arr.indexOf(2)).assertEqual(1);
      expect(arr.indexOf(2, 2)).assertEqual(3);
      expect(arr.indexOf(6)).assertEqual(-1);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt16Array0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0016
     * @tc.desc   Verify Int16Array lastIndexOf method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3, 2, 1]);

      expect(arr.lastIndexOf(2)).assertEqual(3);
      expect(arr.lastIndexOf(2, 2)).assertEqual(1);
      expect(arr.lastIndexOf(6)).assertEqual(-1);
      expect(arr.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt16Array0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0017
     * @tc.desc   Verify Int16Array every method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([2, 4, 6, 8]);

      const allEven = arr.every(val => val % 2 === 0);
      const allPositive = arr.every(val => val > 0);
      const allLessThan5 = arr.every(val => val < 5);

      expect(allEven).assertEqual(true);
      expect(allPositive).assertEqual(true);
      expect(allLessThan5).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayInt16Array0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0018
     * @tc.desc   Verify Int16Array some method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 3, 5, 7, 8]);

      const hasEven = arr.some(val => val % 2 === 0);
      const hasNegative = arr.some(val => val < 0);
      const hasGreaterThan5 = arr.some(val => val > 5);

      expect(hasEven).assertEqual(true);
      expect(hasNegative).assertEqual(false);
      expect(hasGreaterThan5).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt16Array0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0019
     * @tc.desc   Verify Int16Array forEach method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3, 4]);
      const sum: GeneratedObjectLiteralInterface_1 = { value: 0 };

      arr.forEach(val => {
        sum.value += val;
      });

      expect(sum.value).assertEqual(10);
    })

    /**
     * @tc.name   TypeArrayInt16Array0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0020
     * @tc.desc   Verify Int16Array map method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3, 4]);
      const mapped = arr.map(val => val * 2);

      expect(mapped instanceof collections.Int16Array).assertEqual(true);
      expect(mapped.toString()).assertEqual('2,4,6,8');
      expect(mapped.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt16Array0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0021
     * @tc.desc   Verify Int16Array filter method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3, 4, 5, 6]);
      const filtered = arr.filter(val => val % 2 === 0);

      expect(filtered instanceof collections.Int16Array).assertEqual(true);
      expect(filtered.toString()).assertEqual('2,4,6');
      expect(filtered.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt16Array0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0022
     * @tc.desc   Verify Int16Array reduce method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3, 4]);

      const sum = arr.reduce((acc, val) => acc + val, 0);
      const product = arr.reduce((acc, val) => acc * val, 1);

      expect(sum).assertEqual(10);
      expect(product).assertEqual(24);
    })

    /**
     * @tc.name   TypeArrayInt16Array0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0023
     * @tc.desc   Verify Int16Array reduceRight method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3, 4]);
      const str = arr.reduceRight((acc, val) => acc + val.toString(), '');
      expect(str).assertEqual('4321');
    })

    /**
     * @tc.name   TypeArrayInt16Array0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0024
     * @tc.desc   Verify Int16Array find method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([10, 20, 30, 40, 50]);

      const found = arr.find(val => val > 25);
      const notFound = arr.find(val => val < 5);

      expect(found).assertEqual(30);
      expect(notFound).assertUndefined();
    })

    /**
     * @tc.name   TypeArrayInt16Array0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0025
     * @tc.desc   Verify Int16Array findIndex method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([10, 20, 30, 40, 50]);

      const index = arr.findIndex(val => val > 25);
      const notFoundIndex = arr.findIndex(val => val < 5);

      expect(index).assertEqual(2);
      expect(notFoundIndex).assertEqual(-1);
    })

    /**
     * @tc.name   TypeArrayInt16Array0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0026
     * @tc.desc   Verify Int16Array entries method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3]);
      const entries = arr.entries();

      let result = entries.next();
      expect(result.value.toString()).assertEqual([0, 1].toString());

      result = entries.next();
      expect(result.value.toString()).assertEqual([1, 2].toString());

      result = entries.next();
      expect(result.value.toString()).assertEqual([2, 3].toString());

      result = entries.next();
      expect(result.done).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt16Array0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0027
     * @tc.desc   Verify Int16Array keys method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3]);
      const keys = arr.keys();

      expect(keys.next().value).assertEqual(0);
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().done).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt16Array0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0028
     * @tc.desc   Verify Int16Array values method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3]);
      const values = arr.values();

      expect(values.next().value).assertEqual(1);
      expect(values.next().value).assertEqual(2);
      expect(values.next().value).assertEqual(3);
      expect(values.next().done).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt16Array0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0029
     * @tc.desc   Verify Int16Array iterator with for...of loop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3, 4]);
      const values: number[] = [];

      for (const val of arr) {
        values.push(val);
      }

      expect(values.toString()).assertEqual('1,2,3,4');
    })

    /**
     * @tc.name   TypeArrayInt16Array0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0030
     * @tc.desc   Verify Int16Array conversion to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayInt16Array0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new collections.Int16Array([1, 2, 3, 4]);

      expect(arr.toString()).assertEqual('1,2,3,4');
      expect(arr.join(';')).assertEqual('1;2;3;4');
    })

    /**
     * @tc.name   TypeArrayInt16Array0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0031
     * @tc.desc   Verify Int16Array with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(10);
      const arr = new Int16Array(buffer);
      const view = new DataView(buffer);

      arr[0] = 0x1234;
      arr[1] = 0x5678;

      expect(view.getInt16(0, true)).assertEqual(0x1234);
      expect(view.getInt16(0, false)).assertEqual(0x3412);
      expect(view.getInt16(2, false)).assertEqual(0x7856);

      view.setInt16(4, 0x9ABC, false);
      expect(arr[2]).assertEqual(-0x4366);
    })

    /**
     * @tc.name   TypeArrayInt16Array0031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0032
     * @tc.desc   Verify Int16Array handling of non-integer values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Int16Array(3);

      arr[0] = 3.14;
      arr[1] = -2.9;
      arr[2] = Infinity;

      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(-2);
      expect(arr[2]).assertEqual(0);
      expect(arr.length).assertEqual(3);
    })

    /**
     * @tc.name   TypeArrayInt16Array0032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0033
     * @tc.desc   Verify Int16Array buffer sharing with other TypedArrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new collections.ArrayBuffer(8);
      const int16Arr = new collections.Int16Array(buffer);
      const uint8Arr = new collections.Uint8Array(buffer);

      int16Arr[0] = 0x1234;
      int16Arr[1] = 0x5678;

      expect(uint8Arr[0]).assertEqual(0x34);
      expect(uint8Arr[1]).assertEqual(0x12);
      expect(uint8Arr[2]).assertEqual(0x78);
      expect(uint8Arr[3]).assertEqual(0x56);

      uint8Arr[0] = 0x9A;
      uint8Arr[1] = 0xBC;
      expect(int16Arr[0]).assertEqual(-0x4366);
    })

    /**
     * @tc.name   TypeArrayInt16Array0033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0034
     * @tc.desc   Verify Int16Array with invalid byteOffset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new collections.ArrayBuffer(10);

      let errorThrown = false;
      try {
        new collections.Int16Array(buffer, 1);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertEqual(true);

      const arr = new collections.Int16Array(buffer, 2);
      expect(arr.byteOffset).assertEqual(2);
    })

    /**
     * @tc.name   TypeArrayInt16Array0034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0035
     * @tc.desc   Verify Int16Array with Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Int16Array([10, 20, 30]);
      const iterator = arr.values();

      expect(iterator.next().value).assertEqual(10);
      expect(iterator.next().value).assertEqual(20);
      expect(iterator.next().value).assertEqual(30);
      expect(iterator.next().done).assertEqual(true);
      const spreadArr = [...arr];
      expect(spreadArr.toString()).assertEqual('10,20,30');
    })

    /**
     * @tc.name   TypeArrayInt16Array0035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0036
     * @tc.desc   Verify Int16Array handling of large arrays
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0035', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, () => {
      const size = 100000;
      const arr = new collections.Int16Array(size);

      expect(arr.length).assertEqual(size);
      expect(arr.byteLength).assertEqual(size * 2);


      for (let i = 0; i < size; i++) {
        arr[i] = i % 32767;
      }

      expect(arr[0]).assertEqual(0);
      expect(arr[size - 1]).assertEqual((size - 1) % 32767);
      expect(arr[12345]).assertEqual(12345);
    })

    /**
     * @tc.name   TypeArrayInt16Array0036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0037
     * @tc.desc   Verify Int16Array with JSON serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Int16Array([1, 2, 3, 4]);
      const json = JSON.stringify(Array.from(arr));

      expect(json).assertEqual('[1,2,3,4]');

      const parsed: ESObject = JSON.parse(json);
      const newArr = new collections.Int16Array(parsed);

      expect(newArr.toString()).assertEqual('1,2,3,4');
    })

    /**
     * @tc.name   TypeArrayInt16Array0037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0038
     * @tc.desc   Verify Int16Array with array-like objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Int16Array(arrayLike);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayInt16Array0038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0039
     * @tc.desc   Verify Int16Array with Atomics operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      if (typeof SharedArrayBuffer === 'undefined' || typeof Atomics === 'undefined') {
        console.log('SharedArrayBuffer or Atomics not supported, skipping test');
        return;
      }

      const buffer = new SharedArrayBuffer(4);
      const arr = new Int16Array(buffer);

      Atomics.store(arr, 0, 10);
      expect(Atomics.load(arr, 0)).assertEqual(10);

      Atomics.add(arr, 0, 5);
      expect(Atomics.load(arr, 0)).assertEqual(15);

      Atomics.sub(arr, 0, 3);
      expect(Atomics.load(arr, 0)).assertEqual(12);

      Atomics.exchange(arr, 0, 20);
      expect(Atomics.load(arr, 0)).assertEqual(20);

      const old = Atomics.compareExchange(arr, 0, 20, 30);
      expect(old).assertEqual(20);
      expect(Atomics.load(arr, 0)).assertEqual(30);
    })

    /**
     * @tc.name   TypeArrayInt16Array0040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0040
     * @tc.desc   Verify Int16Array with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Int16Array([0x000F, 0x00F0, 0x0F00, 0xF000]);

      const andResult = arr.map(val => val & 0x00FF);
      expect(andResult.toString()).assertEqual('15,240,0,0');

      const orResult = arr.map(val => val | 0x000F);
      expect(orResult.toString()).assertEqual('15,255,3855,-4081');

      const xorResult = arr.map(val => val ^ 0xFFFF);
      expect(xorResult.toString()).assertEqual('-16,-241,-3841,4095');

      const notResult = arr.map(val => ~val & 0xFFFF);
      expect(notResult.toString()).assertEqual('-16,-241,-3841,4095');

      const leftShift = arr.map(val => val << 4);
      expect(leftShift.toString()).assertEqual('240,3840,-4096,0');

      const rightShift = arr.map(val => val >> 4);
      expect(rightShift.toString()).assertEqual('0,15,240,-256');
    })


    /**
     * @tc.name   TypeArrayInt16Array0050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0041
     * @tc.desc   Verify Int16Array buffer slicing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buffer = new collections.ArrayBuffer(10);
      const arr = new collections.Int16Array(buffer);
      arr.set([1, 2, 3, 4, 5]);

      const slicedBuffer = buffer.slice(2, 8);
      const slicedArr = new collections.Int16Array(slicedBuffer);

      expect(slicedArr.length).assertEqual(3);
      expect(slicedArr.toString()).assertEqual('2,3,4');
    })

    /**
     * @tc.name   TypeArrayInt16Array0051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0042
     * @tc.desc   Verify Int16Array with WeakRef
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      if (typeof WeakRef === 'undefined') {
        console.log('WeakRef not supported, skipping test');
        return;
      }

      let arr = new collections.Int16Array([1, 2, 3]);
      const ref = new WeakRef(arr);

      expect(ref.deref()?.toString()).assertEqual('1,2,3');

      arr = new collections.Int16Array();


      expect(ref.deref() !== undefined).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt16Array0052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0043
     * @tc.desc   Verify Int16Array with FinalizationRegistry
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let finalized: boolean = false;
      const registry: FinalizationRegistry<string> = new FinalizationRegistry(() => {
        finalized = true;
      });

      let arr = new collections.Int16Array([1, 2, 3]);
      registry.register(arr, 'test');


      arr = new collections.Int16Array();


      expect(finalized).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayInt16Array0054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0044
     * @tc.desc   Verify Int16Array with error handling in constructors
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let errorThrown = false;

      const buffer = new collections.ArrayBuffer(4);
      try {
        new collections.Int16Array(buffer, 5);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(true);


      errorThrown = false;
      try {
        new collections.Int16Array(buffer, 2, 2);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt16Array0055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0045
     * @tc.desc   Verify Int16Array with arrayBuffer() method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const arr = new collections.Int16Array([1, 2, 3]);
      const buffer = arr.buffer;

      expect(buffer.byteLength).assertEqual(6);

      const newArr = new collections.Int16Array(buffer);
      expect(newArr.toString()).assertEqual('1,2,3');
    })

    /**
     * @tc.name   TypeArrayInt16Array0056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0046
     * @tc.desc   Verify Int16Array with toReversed method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const arr = new collections.Int16Array([1, 2, 3, 4]);
      const reversed = arr.reverse();

      expect(arr.toString()).assertEqual('4,3,2,1');
      expect(reversed.toString()).assertEqual('4,3,2,1');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(1);
      expect(reversed.length).assertEqual(4);
      expect(reversed[0]).assertEqual(4);
      expect(reversed[1]).assertEqual(3);
      expect(reversed[2]).assertEqual(2);
      expect(reversed[3]).assertEqual(1);
    })

    /**
     * @tc.name   TypeArrayInt16Array0057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0047
     * @tc.desc   Verify Int16Array with toSorted method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const arr = new collections.Int16Array([3, 1, 4, 2]);
      const sorted = arr.sort();

      expect(arr.toString()).assertEqual('1,2,3,4');
      expect(sorted.toString()).assertEqual('1,2,3,4');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(sorted.length).assertEqual(4);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
      expect(sorted[3]).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt16Array0058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0048
     * @tc.desc   Verify Int16Array with with method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const arr = new collections.Int16Array([1, 2, 3, 4]);
      const modified = arr.copyWithin(1, 10);

      expect(arr.toString()).assertEqual('1,2,3,4');
      expect(modified.toString()).assertEqual('1,2,3,4');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(modified.length).assertEqual(4);
      expect(modified[0]).assertEqual(1);
      expect(modified[1]).assertEqual(2);
      expect(modified[2]).assertEqual(3);
      expect(modified[3]).assertEqual(4);
    })


    /**
     * @tc.name   TypeArrayInt16Array0061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0049
     * @tc.desc   Verify Int16Array with numeric separators in assignments
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Int16Array(4);

      arr[0] = 1_000;
      arr[1] = 32_767;
      arr[2] = -32_768;
      arr[3] = 123_45;

      expect(arr[0]).assertEqual(1000);
      expect(arr[1]).assertEqual(32767);
      expect(arr[2]).assertEqual(-32768);
      expect(arr[3]).assertEqual(12345);
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt16Array0065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0050
     * @tc.desc   Verify Int16Array with error handling in array methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Int16Array([1, 2, 3, 4]);

      let errorThrown = false;
      try {
        arr.map(val => {
          if (val === 3) {
            throw new Error('Value 3 encountered');
          }
          return val;
        });
      } catch (e) {
        errorThrown = true;
        expect((e as Error).message).assertEqual('Value 3 encountered');
      }
      expect(errorThrown).assertEqual(true);

      errorThrown = false;
      try {
        arr.reduce((acc, val) => {
          if (val === 2) {
            throw new Error('Value 2 encountered');
          }
          return acc + val;
        }, 0);
      } catch (e) {
        errorThrown = true;
        expect((e as Error).message).assertEqual('Value 2 encountered');
      }
      expect(errorThrown).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt16Array0068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0051
     * @tc.desc   Verify Int16Array with JSON.parse reviver
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const json = '[1, 2, 3, 4, 5]';

      const reviver = (_key: string, value: Array<number>) => {
        if (Array.isArray(value)) {
          return new collections.Int16Array(value);
        }
        return value;
      };

      const result: collections.Int16Array = JSON.parse(json, reviver);

      expect(result instanceof collections.Int16Array).assertEqual(true);
      expect(result.toString()).assertEqual('1,2,3,4,5');
      expect(result.length).assertEqual(5);
    })

    /**
     * @tc.name   TypeArrayInt16Array0069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0052
     * @tc.desc   Verify Int16Array with JSON.stringify replacer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: collections.Int16Array = new collections.Int16Array([1, 2, 3, 4]);

      const replacer = (_key: string, value: collections.Int16Array): collections.Int16Array | number[] => {
        if (value instanceof collections.Int16Array) {
          return Array.from(value);
        }
        return value;
      };

      const json: string = JSON.stringify(arr, replacer);
      expect(json).assertEqual('[1,2,3,4]');
    })

    /**
     * @tc.name   TypeArrayInt16Array0070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0053
     * @tc.desc   Verify Int16Array with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt16Array0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (Done: Function) => {
        const arr = new collections.Int16Array([1, 2, 3, 4]);

        const promises =
          Array.from(arr).map(val => new Promise<number>(resolve => setTimeout(() => resolve(val * 2), 0)));

        const results = await Promise.all(promises);
        const resultArr = new collections.Int16Array(results);
        expect(resultArr.toString()).assertEqual('2,4,6,8');
        expect(resultArr.length).assertEqual(4);
        Done();
      })

    /**
     * @tc.name   TypeArrayInt16Array0071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0054
     * @tc.desc   Verify Int16Array with ArrayBuffer.isView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Int16Array([1, 2, 3]);
      const buffer = new ArrayBuffer(8);

      expect(ArrayBuffer.isView(arr)).assertEqual(true);
      expect(ArrayBuffer.isView(buffer)).assertEqual(false);

      const sub = arr.subarray(1, 3);
      expect(ArrayBuffer.isView(sub)).assertEqual(true);

      const dataView = new DataView(buffer);
      expect(ArrayBuffer.isView(dataView)).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt16Array0072
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0055
     * @tc.desc   Verify Int16Array with buffer resizing (detached)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const buffer = new collections.ArrayBuffer(8);
      const arr = new collections.Int16Array(buffer);
      arr.set([1, 2, 3, 4]);

      let errorThrown = false;
      try {
        arr[0];
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayInt16Array0073
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0056
     * @tc.desc   Verify Int16Array with various type checks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Int16Array([1, 2, 3]);
      const plainArr = [1, 2, 3];
      const uintArr = new collections.Uint16Array([1, 2, 3]);

      expect(arr instanceof collections.Int16Array).assertEqual(true);
      expect(arr instanceof collections.Array).assertEqual(false);

      expect(Array.isArray(arr)).assertEqual(false);
      expect(Array.isArray(plainArr)).assertEqual(true);

      expect(arr.constructor === collections.Int16Array).assertEqual(true);
      expect(arr instanceof uintArr.constructor).assertEqual(false);
    })

    /**
     * @tc.name   TypeArrayInt16Array0074
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0057
     * @tc.desc   Verify Int16Array with class inheritance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      @Sendable
      class EnhancedInt16Array extends collections.Int16Array {
        sum() {
          return this.reduce((a, b) => a + b, 0);
        }

        static fromArray(arr: number[]) {
          return new EnhancedInt16Array(arr);
        }
      }

      const arr = new EnhancedInt16Array([1, 2, 3, 4]);
      expect(arr.sum()).assertEqual(10);
      expect(arr instanceof collections.Int16Array).assertEqual(true);
      expect(arr instanceof EnhancedInt16Array).assertEqual(true);

      const fromArr = EnhancedInt16Array.fromArray([5, 6, 7]);
      expect(fromArr.sum()).assertEqual(18);
      expect(fromArr[0]).assertEqual(5);
      expect(fromArr.length).assertEqual(3);
      expect(arr.length).assertEqual(4);
    })

    /**
     * @tc.name   TypeArrayInt16Array0075
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0058
     * @tc.desc   Verify Int16Array with array concatenation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = new collections.Int16Array([1, 2, 3]);
      const arr2 = new collections.Int16Array([4, 5, 6]);


      const combined = new collections.Int16Array(arr1.length + arr2.length);
      combined.set(arr1);
      combined.set(arr2, arr1.length);

      expect(combined.toString()).assertEqual('1,2,3,4,5,6');

      const arr3 = new collections.Int16Array([7, 8]);
      const totalLength = arr1.length + arr2.length + arr3.length;
      const totalCombined = new collections.Int16Array(totalLength);

      let offset = 0;
      totalCombined.set(arr1, offset);
      offset += arr1.length;
      totalCombined.set(arr2, offset);
      offset += arr2.length;
      totalCombined.set(arr3, offset);

      expect(totalCombined.toString()).assertEqual('1,2,3,4,5,6,7,8');
    })
    /**
     * @tc.name   TypeArrayInt16Array0076
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0059
     * @tc.desc   Verify Int16Array with bit manipulation functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Int16Array([0b1010, 0b1100, 0b0011]);

      const countSetBits = (n: number) => {
        let count = 0;
        n = n & 0xFFFF;
        while (n) {
          count += n & 1;
          n = n >>> 1;
        }
        return count;
      };

      const bitCounts = arr.map((val): number => countSetBits(val));

      expect(bitCounts.toString()).assertEqual([2, 2, 2].toString());

      const reverseBits = (n: number) => {
        let reversed = 0;
        for (let i = 0; i < 16; i++) {
          reversed = (reversed << 1) | (n & 1);
          n >>>= 1;
        }
        return reversed << 16 >> 16;
      };

      const reversedBits = arr.map((val): number => reverseBits(val));
      expect(reversedBits[0]).assertEqual(0b0101000000000000);
    })

    /**
     * @tc.name   TypeArrayInt16Array0077
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0060
     * @tc.desc   Verify Int16Array with typed array conversion methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int16Arr = new collections.Int16Array([1, 2, 3, 4]);


      const uint16Arr = new collections.Uint16Array(int16Arr.buffer);
      const int8Arr = new collections.Int8Array(int16Arr.buffer);
      const float32Arr = new collections.Float32Array(int16Arr.buffer);

      expect(uint16Arr.toString()).assertEqual('1,2,3,4');
      expect(int8Arr.length).assertEqual(8);
      expect(float32Arr.length).assertEqual(2);


      int16Arr[0] = 100;
      expect(uint16Arr[0]).assertEqual(100);
    })

    /**
     * @tc.name   TypeArrayInt16Array0078
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0061
     * @tc.desc   Verify Int16Array with array-like object conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Int16Array(arrayLike);
      expect(arr.toString()).assertEqual('10,20,30');


      const newArrayLike = arr;
      expect(newArrayLike[0]).assertEqual(10);
      expect(newArrayLike.length).assertEqual(3);


      const fromArrayLike = collections.Int16Array.from(arrayLike);
      const fromArr = new collections.Int16Array(fromArrayLike);
      expect(fromArr.toString()).assertEqual('10,20,30');
    })

    /**
     * @tc.name   TypeArrayInt16Array0079
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0062
     * @tc.desc   Verify Int16Array with data validation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const validateInt16 = (value: number) => {
        return value >= -32768 && value <= 32767 && Number.isInteger(value);
      };

      const testValues = new collections.Int16Array([
        32767, -32768, 0, 123, -456,
        32768,
        -32769,
        123.45
      ]);

      const validationResults = Array.from(testValues).map(validateInt16);

      expect(validationResults.toString()).assertEqual([true, true, true, true, true, true, true, true].toString());


      const arrayIsValid = testValues.every((val): boolean => validateInt16(val));
      expect(arrayIsValid).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt16Array0080
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0063
     * @tc.desc   Verify Int16Array with async data processing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TypeArrayInt16Array0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (Done: Function) => {
        const processChunk = (chunk: collections.Int16Array): Promise<collections.Int16Array> => {
          return new Promise(resolve => {
            setTimeout(() => {
              const result = new collections.Int16Array(chunk.length);
              for (let i = 0; i < chunk.length; i++) {
                result[i] = chunk[i] * 2;
              }
              resolve(result);
            }, 10);
          });
        };

        const data = new collections.Int16Array([1, 2, 3, 4, 5, 6, 7, 8]);
        const chunkSize = 3;
        const chunks: collections.Int16Array[] = [];


        for (let i = 0; i < data.length; i += chunkSize) {
          chunks.push(data.subarray(i, i + chunkSize));
        }

        const processedChunks = await Promise.all(chunks.map(processChunk));


        const result = new collections.Int16Array(data.length);
        let offset = 0;
        processedChunks.forEach(chunk => {
          result.set(chunk, offset);
          offset += chunk.length;
        });
        expect(result.toString()).assertEqual('2,4,6,8,10,12,14,16');
        Done();
      })

    /**
     * @tc.name   TypeArrayInt16Array0081
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0064
     * @tc.desc   Verify Int16Array with buffer alignment checks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const buffer = new collections.ArrayBuffer(10);


      const arr1 = new collections.Int16Array(buffer, 0);
      const arr2 = new collections.Int16Array(buffer, 2);
      const arr3 = new collections.Int16Array(buffer, 8);

      expect(arr1.byteOffset % 2).assertEqual(0);
      expect(arr2.byteOffset % 2).assertEqual(0);
      expect(arr3.byteOffset % 2).assertEqual(0);


      let errorThrown = false;
      try {
        new collections.Int16Array(buffer, 1);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertEqual(true);
    })

    /**
     * @tc.name   TypeArrayInt16Array0082
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0065
     * @tc.desc   Verify Int16Array with data compression simulation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const encodeDelta = (data: collections.Int16Array): collections.Int16Array => {
        const encoded = new collections.Int16Array(data.length);
        encoded[0] = data[0];

        for (let i = 1; i < data.length; i++) {
          encoded[i] = data[i] - data[i - 1];
        }
        return encoded;
      };

      const decodeDelta = (encoded: collections.Int16Array): collections.Int16Array => {
        const decoded = new collections.Int16Array(encoded.length);
        decoded[0] = encoded[0];

        for (let i = 1; i < encoded.length; i++) {
          decoded[i] = decoded[i - 1] + encoded[i];
        }
        return decoded;
      };

      const original = new collections.Int16Array([10, 12, 15, 14, 16, 20]);
      const encoded = encodeDelta(original);
      const decoded = decodeDelta(encoded);

      expect(encoded.toString()).assertEqual('10,2,3,-1,2,4');
      expect(decoded.toString()).assertEqual(original.toString());
    })
    /**
     * @tc.name   TypeArrayInt16Array0085
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0066
     * @tc.desc   Verify Int16Array with mathematical operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new collections.Int16Array([1, 2, 3, 4, 5]);

      const sum = arr.reduce((a, b) => a + b, 0);
      expect(sum).assertEqual(15);

      const avg = sum / arr.length;
      expect(avg).assertEqual(3);

      const min = arr.reduce((a, b) => Math.min(a, b), Infinity);
      const max = arr.reduce((a, b) => Math.max(a, b), -Infinity);

      expect(min).assertEqual(1);
      expect(max).assertEqual(5);


      const variance = arr.reduce((acc, val) => acc + Math.pow(val - avg, 2), 0) / arr.length;
      const stdDev = Math.sqrt(variance);
      expect(Math.round(stdDev * 100) / 100).assertEqual(1.41);
    })

    /**
     * @tc.name   TypeArrayInt16Array0086
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0067
     * @tc.desc   Verify Int16Array with matrix multiplication simulation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const matrixA = new collections.Int16Array([1, 2, 3, 4]);

      const matrixB = new collections.Int16Array([5, 6, 7, 8]);


      const result = new collections.Int16Array(4);


      result[0] = matrixA[0] * matrixB[0] + matrixA[1] * matrixB[2];
      result[1] = matrixA[0] * matrixB[1] + matrixA[1] * matrixB[3];
      result[2] = matrixA[2] * matrixB[0] + matrixA[3] * matrixB[2];
      result[3] = matrixA[2] * matrixB[1] + matrixA[3] * matrixB[3];

      expect(result.toString()).assertEqual('19,22,43,50');
    })

    /**
     * @tc.name   TypeArrayInt16Array0087
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0068
     * @tc.desc   Verify Int16Array with data encryption simulation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const encrypt = (data: collections.Int16Array, key: number): collections.Int16Array => {
        const encrypted = new collections.Int16Array(data.length);
        for (let i = 0; i < data.length; i++) {
          encrypted[i] = data[i] ^ key;
        }
        return encrypted;
      };

      const original = new collections.Int16Array([10, 20, 30, 40, 50]);
      const key = 0xABCD;

      const encrypted = encrypt(original, key);
      const decrypted = encrypt(encrypted, key);
      expect(encrypted.toString()).assertEqual('-21561,-21543,-21549,-21531,-21505');
      expect(decrypted.toString()).assertEqual(original.toString());
    })

    /**
     * @tc.name   TypeArrayInt16Array0088
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0069
     * @tc.desc   Verify Int16Array with data interpolation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const interpolate = (data: collections.Int16Array, factor: number): collections.Int16Array => {
        const result = new collections.Int16Array(data.length * factor);

        for (let i = 0; i < data.length - 1; i++) {
          result[i * factor] = data[i];
          const step = (data[i + 1] - data[i]) / factor;

          for (let j = 1; j < factor; j++) {
            result[i * factor + j] = Math.round(data[i] + step * j);
          }
        }

        result[result.length - 1] = data[data.length - 1];
        return result;
      };

      const original = new collections.Int16Array([0, 10, 20, 30]);
      const interpolated = interpolate(original, 2);

      expect(interpolated.toString()).assertEqual('0,5,10,15,20,25,0,30');
    })

    /**
     * @tc.name   TypeArrayInt16Array0089
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0070
     * @tc.desc   Verify Int16Array with custom serialization/deserialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const serialize = (arr: collections.Int16Array): string => {
        return arr.length + '|' + arr.join(',');
      };


      const deserialize = (str: string): collections.Int16Array => {
        const arr: string[] = str.split('|');
        const data = arr[1].split(',').map(Number);
        return new collections.Int16Array(data);
      };

      const original = new collections.Int16Array([1, 2, 3, 4, 5]);
      const serialized = serialize(original);
      const deserialized = deserialize(serialized);

      expect(serialized).assertEqual('5|1,2,3,4,5');
      expect(deserialized.toString()).assertEqual(original.toString());
    })

    /**
     * @tc.name   TypeArrayInt16Array0090
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0071
     * @tc.desc   Verify Int16Array with data validation and sanitization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const sanitize = (data: number[]): collections.Int16Array => {
        return new collections.Int16Array(data.map(val => {
          if (val > 32767) {
            return 32767;
          }
          if (val < -32768) {
            return -32768;
          }
          return Math.round(val);
        }));
      };

      const rawData = [32768, -32769, 123.45, -67.89, 0, 32767];
      const sanitized = sanitize(rawData);

      expect(sanitized.toString()).assertEqual('32767,-32768,123,-68,0,32767');
    })
    /**
     * @tc.name   TypeArrayInt16Array0091
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0072
     * @tc.desc   Verify Int16Array with sliding window operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const movingAverage = (data: collections.Int16Array, windowSize: number): collections.Int16Array => {
        const result = new collections.Int16Array(data.length - windowSize + 1);

        for (let i = 0; i < result.length; i++) {
          let sum = 0;
          for (let j = 0; j < windowSize; j++) {
            sum += data[i + j];
          }
          result[i] = Math.round(sum / windowSize);
        }

        return result;
      };

      const data = new collections.Int16Array([10, 20, 30, 40, 50, 60, 70]);
      const averages = movingAverage(data, 3);

      expect(averages.toString()).assertEqual('20,30,40,50,60');
    })

    /**
     * @tc.name   TypeArrayInt16Array0092
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0073
     * @tc.desc   Verify Int16Array with bitwise rotation operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const rotateLeft = (value: number, bits: number): number => {
        const mask = 0xFFFF;
        value = value & mask;
        return ((value << bits) | (value >>> (16 - bits))) & mask;
      };


      const rotateRight = (value: number, bits: number): number => {
        const mask = 0xFFFF;
        value = value & mask;
        return ((value >>> bits) | (value << (16 - bits))) & mask;
      };

      const original = new collections.Int16Array([0b0000000000000001, 0b1000000000000000]);
      const rotatedLeft = new collections.Int16Array(original.map(val => rotateLeft(val, 1)));
      const rotatedRight = new collections.Int16Array(original.map(val => rotateRight(val, 1)));

      expect(rotatedLeft[0]).assertEqual(0b0000000000000010);
      expect(rotatedLeft[1]).assertEqual(0b0000000000000001);
      expect(rotatedRight[0]).assertEqual(-0b1000000000000000);
      expect(rotatedRight[1]).assertEqual(0b0100000000000000);
    })

    /**
     * @tc.name   TypeArrayInt16Array0093
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0074
     * @tc.desc   Verify Int16Array with data normalization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const normalize = (data: number[]): collections.Int16Array => {
        const min = Math.min(...data);
        const max = Math.max(...data);
        const range = max - min || 1;

        return new collections.Int16Array(data.map(val => {

          const normalized = (val - min) / range;
          return Math.round(normalized * 65535 - 32768);
        }));
      };

      const rawData = [10, 20, 30, 40, 50];
      const normalized = normalize(rawData);

      expect(normalized[0]).assertEqual(-32768);
      expect(normalized[4]).assertEqual(32767);
      expect(normalized[2]).assertEqual(0);
    })

    /**
     * @tc.name   TypeArrayInt16Array0094
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0075
     * @tc.desc   Verify Int16Array with time series differencing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const difference = (data: collections.Int16Array): collections.Int16Array => {
        const result = new collections.Int16Array(data.length - 1);
        for (let i = 0; i < result.length; i++) {
          result[i] = data[i + 1] - data[i];
        }
        return result;
      };


      const reconstruct = (differences: collections.Int16Array, initial: number): collections.Int16Array => {
        const result = new collections.Int16Array(differences.length + 1);
        result[0] = initial;
        for (let i = 0; i < differences.length; i++) {
          result[i + 1] = result[i] + differences[i];
        }
        return result;
      };

      const original = new collections.Int16Array([100, 150, 130, 180, 200]);
      const diffs = difference(original);
      const reconstructed = reconstruct(diffs, original[0]);

      expect(diffs.toString()).assertEqual('50,-20,50,20');
      expect(reconstructed.toString()).assertEqual(original.toString());
    })

    /**
     * @tc.name   TypeArrayInt16Array0095
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0076
     * @tc.desc   Verify Int16Array with bitwise mask operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const extractHighByte = (value: number): number => (value >> 8) & 0xFF;
      const extractLowByte = (value: number): number => value & 0xFF;

      const arr = new collections.Int16Array([0x1234, 0xABCD, 0xF00F]);

      const highBytes = arr.map(extractHighByte);
      const lowBytes = arr.map(extractLowByte);

      expect(highBytes.toString()).assertEqual([0x12, 0xAB, 0xF0].toString());
      expect(lowBytes.toString()).assertEqual([0x34, 0xCD, 0x0F].toString());


      const combined = new collections.Int16Array(highBytes.map((high, i) =>
      (high << 8) | lowBytes[i]
      ));

      expect(combined.toString()).assertEqual(arr.toString());
    })

    /**
     * @tc.name   TypeArrayInt16Array0096
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0077
     * @tc.desc   Verify Int16Array with run-length encoding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const encodeRLE = (data: collections.Int16Array): collections.Int16Array => {
        if (data.length === 0) {
          return new collections.Int16Array(0);
        }

        const result: number[] = [];
        let current = data[0];
        let count = 1;

        for (let i = 1; i < data.length; i++) {
          if (data[i] === current && count < 32767) {
            count++;
          } else {
            result.push(current, count);
            current = data[i];
            count = 1;
          }
        }

        result.push(current, count);
        return new collections.Int16Array(result);
      };


      const decodeRLE = (encoded: collections.Int16Array): collections.Int16Array => {
        const result: number[] = [];

        for (let i = 0; i < encoded.length; i += 2) {
          const value = encoded[i];
          const count = encoded[i + 1];

          for (let j = 0; j < count; j++) {
            result.push(value);
          }
        }

        return new collections.Int16Array(result);
      };

      const original = new collections.Int16Array([5, 5, 5, 3, 3, 7, 7, 7, 7]);
      const encoded = encodeRLE(original);
      const decoded = decodeRLE(encoded);

      expect(encoded.toString()).assertEqual('5,3,3,2,7,4');
      expect(decoded.toString()).assertEqual(original.toString());
    })

    /**
     * @tc.name   TypeArrayInt16Array0097
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0078
     * @tc.desc   Verify Int16Array with endianness conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const swapEndianness = (value: number): number => {
        return ((value & 0xFF) << 8) | ((value >> 8) & 0xFF);
      };

      const original = new collections.Int16Array([0x1234, 0xABCD, 0xF00F]);
      const swapped = new collections.Int16Array(original.map(swapEndianness));
      const swappedBack = new collections.Int16Array(swapped.map(swapEndianness));

      expect(swapped[0]).assertEqual(0x3412);
      expect(swapped[1]).assertEqual(-0x3255);
      expect(swapped[2]).assertEqual(0x0FF0);
      expect(swappedBack.toString()).assertEqual(original.toString());
    })

    /**
     * @tc.name   TypeArrayInt16Array0098
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0079
     * @tc.desc   Verify Int16Array with sparse data handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
     const sparseIndices = [0, 5, 10, 15];
      const sparseValues = [100, 200, 300, 400];
      const size = 20;

      const arr = new collections.Int16Array(size);
      sparseIndices.forEach((index, i) => {
        arr[index] = sparseValues[i];
      });


      const collected: [number, number][] = [];
      for (let i = 0; i < arr.length; i++) {
        if (arr[i] !== 0) {
          collected.push([i, arr[i]]);
        }
      }

      expect(collected.toString()).assertEqual([
        [0, 100],
        [5, 200],
        [10, 300],
        [15, 400]
      ].toString());


      expect(arr[3]).assertEqual(0);
      expect(arr.length).assertEqual(size);
    })

    /**
     * @tc.name   TypeArrayInt16Array0099
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0080
     * @tc.desc   Verify Int16Array with custom sorting algorithms
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const bubbleSort = (arr: collections.Int16Array): collections.Int16Array => {
        const sorted = new collections.Int16Array(arr);
        let swapped: boolean;

        do {
          swapped = false;
          for (let i = 0; i < sorted.length - 1; i++) {
            if (sorted[i] > sorted[i + 1]) {

              const temp = sorted[i];
              sorted[i] = sorted[i + 1];
              sorted[i + 1] = temp;
              swapped = true;
            }
          }
        } while (swapped);

        return sorted;
      };

      const original = new collections.Int16Array([5, 2, 9, 1, 5, 6]);
      const sorted = bubbleSort(original);

      expect(original.toString()).assertEqual('5,2,9,1,5,6');
      expect(sorted.toString()).assertEqual('1,2,5,5,6,9');
    })

    /**
     * @tc.name   TypeArrayInt16Array0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0081
     * @tc.desc   Verify Int16Array with data chunking and reassembly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const chunkArray = (arr: collections.Int16Array, chunkSize: number): collections.Int16Array[] => {
        const chunks: collections.Int16Array[] = [];
        for (let i = 0; i < arr.length; i += chunkSize) {
          chunks.push(arr.subarray(i, i + chunkSize));
        }
        return chunks;
      };


      const reassembleChunks = (chunks: collections.Int16Array[]): collections.Int16Array => {
        const totalLength = chunks.reduce((sum, chunk) => sum + chunk.length, 0);
        const result = new collections.Int16Array(totalLength);

        let offset = 0;
        chunks.forEach(chunk => {
          result.set(chunk, offset);
          offset += chunk.length;
        });

        return result;
      };

      const original = new collections.Int16Array([1, 2, 3, 4, 5, 6, 7, 8, 9]);
      const chunks = chunkArray(original, 3);
      const reassembled = reassembleChunks(chunks);

      expect(chunks.length).assertEqual(3);
      expect(chunks[0].toString()).assertEqual('1,2,3');
      expect(reassembled.toString()).assertEqual(original.toString());
    })
    /**
     * @tc.name   TypeArrayInt16Array0101
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0082
     * @tc.desc   Verify Int16Array with bitwise parity calculation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const calculateParity = (value: number): number => {
        let parity = 0;
        value = value & 0xFFFF;
        while (value) {
          parity ^= value & 1;
          value >>>= 1;
        }
        return parity;
      };

      const arr = new collections.Int16Array([0b1010, 0b1111, 0b0000, 0b110011]);
      const parityBits = arr.map(calculateParity);

      expect(parityBits.toString()).assertEqual([0, 0, 0, 0].toString());
    })

    /**
     * @tc.name   TypeArrayInt16Array0102
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0083
     * @tc.desc   Verify Int16Array with data interpolation using different methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const nearestNeighbor = (data: collections.Int16Array, newLength: number): collections.Int16Array => {
        const result = new collections.Int16Array(newLength);
        const ratio = data.length / newLength;

        for (let i = 0; i < newLength; i++) {
          const index = Math.round(i * ratio);
          result[i] = data[Math.min(index, data.length - 1)];
        }

        return result;
      };

      const original = new collections.Int16Array([0, 100, 200, 300]);
      const expanded = nearestNeighbor(original, 10);

      expect(expanded.toString()).assertEqual('0,0,100,100,200,200,200,300,300,300');
    })

    /**
     * @tc.name   TypeArrayInt16Array0103
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0084
     * @tc.desc   Verify Int16Array with convolution operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const convolve = (data: collections.Int16Array, kernel: number[]): collections.Int16Array => {
        const kernelSize = kernel.length;
        const halfKernel = Math.floor(kernelSize / 2);
        const result = new collections.Int16Array(data.length);

        for (let i = 0; i < data.length; i++) {
          let sum = 0;
          for (let j = 0; j < kernelSize; j++) {
            const index = i + j - halfKernel;
            const value = index >= 0 && index < data.length ? data[index] : 0;
            sum += value * kernel[j];
          }
          result[i] = Math.round(sum);
        }

        return result;
      };


      const kernel = [0.25, 0.5, 0.25];
      const original = new collections.Int16Array([10, 20, 30, 100, 50, 60, 70]);
      const smoothed = convolve(original, kernel);

      expect(smoothed.toString()).assertEqual('10,20,45,70,65,60,50');
    })

    /**
     * @tc.name   TypeArrayInt16Array0105
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0085
     * @tc.desc   Verify Int16Array with data validation using regular expressions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const validatePattern = (arr: collections.Int16Array, pattern: RegExp): boolean[] => {
        return Array.from(arr).map(num => pattern.test(num.toString()));
      };

      const arr = new collections.Int16Array([123, 45, 6789, 12, 3456, 78]);
      const threeDigitNumbers = validatePattern(arr, /^\d{3}$/);
      const evenNumbers = validatePattern(arr, /^\d*[02468]$/);

      expect(threeDigitNumbers.toString()).assertEqual([true, false, false, false, false, false].toString());
      expect(evenNumbers.toString()).assertEqual([false, false, false, true, true, true].toString());
    })

    /**
     * @tc.name   TypeArrayInt16Array0106
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0086
     * @tc.desc   Verify Int16Array with bit field extraction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const extractBitField = (value: number, start: number, length: number): number => {
        const mask = (1 << length) - 1;
        return (value >> start) & mask;
      };


      const arr = new collections.Int16Array([0b1010110010110101]);

      const field1 = extractBitField(arr[0], 0, 4);
      const field2 = extractBitField(arr[0], 4, 5);
      const field3 = extractBitField(arr[0], 9, 7);

      expect(field1).assertEqual(0b0101);
      expect(field2).assertEqual(0b1011);
      expect(field3).assertEqual(0b1010110);
    })

    /**
     * @tc.name   TypeArrayInt16Array0107
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0087
     * @tc.desc   Verify Int16Array with data transformation pipeline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const transformPipeline = (data: collections.Int16Array, transforms: ((x: number) => number)[]): collections.Int16Array => {
        let result = new collections.Int16Array(data);

        for (const transform of transforms) {
          const newResult = new collections.Int16Array(result.length);
          for (let i = 0; i < result.length; i++) {
            newResult[i] = transform(result[i]);
          }
          result = newResult;
        }

        return result;
      };


      const double = (x: number) => x * 2;
      const add10 = (x: number) => x + 10;
      const clamp = (x: number) => Math.max(-32768, Math.min(32767, x));

      const original = new collections.Int16Array([100, 2000, 32000]);
      const transformed = transformPipeline(original, [double, add10, clamp]);

      expect(transformed.toString()).assertEqual('210,4010,-1526');
    })

    /**
     * @tc.name   TypeArrayInt16Array0108
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0088
     * @tc.desc   Verify Int16Array with data deduplication
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const deduplicate = (data: collections.Int16Array): collections.Int16Array => {
        const seen = new Set<number>();
        const result: number[] = [];

        for (const val of data) {
          if (!seen.has(val)) {
            seen.add(val);
            result.push(val);
          }
        }

        return new collections.Int16Array(result);
      };

      const original = new collections.Int16Array([5, 3, 5, 1, 3, 2, 2, 4, 1]);
      const unique = deduplicate(original);

      expect(unique.toString()).assertEqual('5,3,1,2,4');
    })

    /**
     * @tc.name   TypeArrayInt16Array0109
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0089
     * @tc.desc   Verify Int16Array with histogram calculation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const calculateHistogram = (data: collections.Int16Array): Map<number, number> => {
        const histogram = new Map<number, number>();

        for (const val of data) {
          histogram.set(val, (histogram.get(val) || 0) + 1);
        }

        return histogram;
      };

      const data = new collections.Int16Array([1, 2, 2, 3, 3, 3, 4, 4, 4, 4]);
      const histogram = calculateHistogram(data);

      expect(histogram.get(1)).assertEqual(1);
      expect(histogram.get(2)).assertEqual(2);
      expect(histogram.get(3)).assertEqual(3);
      expect(histogram.get(4)).assertEqual(4);
      expect(histogram.get(5)).assertUndefined();
    })

    /**
     * @tc.name   TypeArrayInt16Array0110
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0090
     * @tc.desc   Verify Int16Array with bitwise XOR checksum
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const calculateChecksum = (data: collections.Int16Array): number => {
        return data.reduce((checksum, val) => checksum ^ val, 0);
      };

      const data1 = new collections.Int16Array([1, 2, 3, 4, 5]);
      const checksum1 = calculateChecksum(data1);

      const data2 = new collections.Int16Array([1, 2, 3, 4, 5]);
      const checksum2 = calculateChecksum(data2);


      expect(checksum1).assertEqual(checksum2);


      data2[2] = 6;
      const checksum3 = calculateChecksum(data2);
      expect(checksum3.toString()).assertEqual('4');
    })

    /**
     * @tc.name   TypeArrayInt16Array0111
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0091
     * @tc.desc   Verify Int16Array with data scaling and shifting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const scaleAndShift = (data: number[], scale: number, shift: number): collections.Int16Array => {
        return new collections.Int16Array(data.map(val => {
          const transformed = val * scale + shift;
          return Math.max(-32768, Math.min(32767, Math.round(transformed)));
        }));
      };

      const rawData = [1.5, 2.5, 3.5, 4.5, 5.5];
      const scaled = scaleAndShift(rawData, 1000, 500);

      expect(scaled.toString()).assertEqual('2000,3000,4000,5000,6000');
    })

    /**
     * @tc.name   TypeArrayInt16Array0112
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0092
     * @tc.desc   Verify Int16Array with polynomial evaluation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const evaluatePolynomial = (x: number, coefficients: collections.Int16Array): number => {
        return coefficients.reduce((result, coeff, power) => {
          return result + coeff * Math.pow(x, power);
        }, 0);
      };


      const coefficients = new collections.Int16Array([5, 2, 3]);

      expect(Math.round(evaluatePolynomial(0, coefficients))).assertEqual(5);
      expect(Math.round(evaluatePolynomial(1, coefficients))).assertEqual(10);
      expect(Math.round(evaluatePolynomial(2, coefficients))).assertEqual(21);
      expect(Math.round(evaluatePolynomial(3, coefficients))).assertEqual(38);
    })

    /**
     * @tc.name   TypeArrayInt16Array0113
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0093
     * @tc.desc   Verify Int16Array with custom bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const countLeadingZeros = (value: number): number => {
        if (value === 0) {
          return 16;
        }

        value = value & 0xFFFF;
        let count = 0;

        while ((value & 0x8000) === 0) {
          count++;
          value <<= 1;
        }

        return count;
      };

      const arr = new collections.Int16Array([0, 0b1000000000000000, 0b0001000000000000, 0b0000000000000001]);
      const leadingZeros = arr.map(countLeadingZeros);

      expect(leadingZeros.toString()).assertEqual([16, 0, 3, 15].toString());
    })

    /**
     * @tc.name   TypeArrayInt16Array0114
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0094
     * @tc.desc   Verify Int16Array with data encryption using Caesar cipher
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const caesarCipher = (data: collections.Int16Array, shift: number): collections.Int16Array => {
        const result = new collections.Int16Array(data.length);
        const range = 65536;
        for (let i = 0; i < data.length; i++) {

          let value = data[i] + 32768;
          value = (value + shift) % range;
          result[i] = value - 32768;
        }

        return result;
      };

      const original = new collections.Int16Array([10, 20, 30, 32767, -32768]);
      const encrypted = caesarCipher(original, 5);
      const decrypted = caesarCipher(encrypted, -5);

      expect(encrypted.toString()).assertEqual('15,25,35,-32764,-32763');
      expect(decrypted.toString()).assertEqual(original.toString());
    })

    /**
     * @tc.name   TypeArrayInt16Array0115
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0095
     * @tc.desc   Verify Int16Array with custom serialization using binary format
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const serializeBinary = (data: collections.Int16Array): Uint8Array => {
        const buffer = new ArrayBuffer(2 + data.length * 2);
        const view = new DataView(buffer);

        view.setUint16(0, data.length, true);

        for (let i = 0; i < data.length; i++) {
          view.setInt16(2 + i * 2, data[i], true);
        }

        return new Uint8Array(buffer);
      };

      const deserializeBinary = (bytes: Uint8Array): collections.Int16Array => {
        const view = new DataView(bytes.buffer);
        const length = view.getUint16(0, true);
        const result = new collections.Int16Array(length);

        for (let i = 0; i < length; i++) {
          result[i] = view.getInt16(2 + i * 2, true);
        }

        return result;
      };

      const original = new collections.Int16Array([1, 2, 3, 32767, -32768]);
      const serialized = serializeBinary(original);
      const deserialized = deserializeBinary(serialized);

      expect(serialized.byteLength).assertEqual(2 + original.length * 2);
      expect(deserialized.toString()).assertEqual(original.toString());
    })
    /**
     * @tc.name   TypeArrayInt16Array0116
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0096
     * @tc.desc   Verify Int16Array with data masking and unmasking
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const applyMask = (data: collections.Int16Array, mask: number): collections.Int16Array => {
        return new collections.Int16Array(data.map(val => val & mask));
      };

      const mask = 0x00F0;
      const original = new collections.Int16Array([0x1234, 0xABCD, 0xF00F]);
      const masked = applyMask(original, mask);

      expect(masked[0]).assertEqual(0x0030);
      expect(masked[1]).assertEqual(0x00C0);
      expect(masked[2]).assertEqual(0x0000);
    })

    /**
     * @tc.name   TypeArrayInt16Array0117
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0097
     * @tc.desc   Verify Int16Array with data interpolation using cubic approximation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const cubicInterpolate = (p0: number, p1: number, p2: number, p3: number, t: number): number => {

        return Math.round(
          p1 + 0.5 * t * (p2 - p0 + t * (2 * p0 - 5 * p1 + 4 * p2 - p3 + t * (3 * (p1 - p2) + p3 - p0)))
        );
      };

      const data = new collections.Int16Array([0, 100, 300, 600]);
      const interpolated: number[] = [];

      for (let t = 0; t <= 1; t += 0.25) {
        interpolated.push(cubicInterpolate(data[0], data[1], data[2], data[3], t));
      }

      expect(interpolated.toString()).assertEqual('100,141,188,241,300');
    })

    /**
     * @tc.name   TypeArrayInt16Array0118
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0098
     * @tc.desc   Verify Int16Array with cumulative sum calculation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const cumulativeSum = (data: collections.Int16Array): collections.Int16Array => {
        const result = new collections.Int16Array(data.length);
        let sum = 0;

        for (let i = 0; i < data.length; i++) {
          sum += data[i];
          result[i] = Math.max(-32768, Math.min(32767, sum));
        }

        return result;
      };

      const data = new collections.Int16Array([10, 20, 30, 40, 50]);
      const sums = cumulativeSum(data);

      expect(sums.toString()).assertEqual('10,30,60,100,150');

      const overflowData = new collections.Int16Array([32767, 1, 1, 1]);
      const overflowSums = cumulativeSum(overflowData);

      expect(overflowSums.toString()).assertEqual('32767,32767,32767,32767');
    })

    /**
     * @tc.name   TypeArrayInt16Array0119
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0099
     * @tc.desc   Verify Int16Array with data validation using custom rules
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const validateData = (data: collections.Int16Array, rules: ((v: number) => boolean)[]): boolean[] => {
        return Array.from(data).map(val =>
        rules.every(rule => rule(val))
        );
      };

      const isEven = (v: number) => v % 2 === 0;
      const isPositive = (v: number) => v > 0;
      const isLessThan100 = (v: number) => v < 100;

      const data = new collections.Int16Array([10, 25, -4, 100, 50, 75]);
      const valid = validateData(data, [isEven, isPositive, isLessThan100]);

      expect(valid.toString()).assertEqual([true, false, false, false, true, false].toString());
    })

    /**
     * @tc.name   TypeArrayInt16Array0120
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0100
     * @tc.desc   Verify Int16Array with bitwise bit count operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const countOnes = (value: number): number => {
        let count = 0;
        let val = value & 0xFFFF;

        while (val) {
          count += val & 1;
          val >>>= 1;
        }

        return count;
      };

      const arr = new collections.Int16Array([0, 1, 3, 0b1010, -1]);
      const onesCount = arr.map(countOnes);

      expect(onesCount.toString()).assertEqual([0, 1, 2, 2, 16].toString());
    })

    /**
     * @tc.name   TypeArrayInt16Array0121
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0101
     * @tc.desc   Verify Int16Array with data normalization to zero mean
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const zeroMeanNormalize = (data: collections.Int16Array): collections.Int16Array => {
        const mean = data.reduce((sum, val) => sum + val, 0) / data.length;
        return new collections.Int16Array(data.map(val => Math.round(val - mean)));
      };

      const data = new collections.Int16Array([10, 20, 30, 40, 50]);
      const normalized = zeroMeanNormalize(data);


      const sum = normalized.reduce((a, b) => a + b, 0);
      expect(Math.abs(sum)).assertEqual(0);

      expect(normalized.toString()).assertEqual('-20,-10,0,10,20');
    })

    /**
     * @tc.name   TypeArrayInt16Array0122
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0102
     * @tc.desc   Verify Int16Array with sliding window maximum
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const slidingWindowMax = (data: collections.Int16Array, windowSize: number): collections.Int16Array => {
        const result = new collections.Int16Array(data.length - windowSize + 1);

        for (let i = 0; i < result.length; i++) {
          let max = data[i];
          for (let j = 1; j < windowSize; j++) {
            if (data[i + j] > max) {
              max = data[i + j];
            }
          }
          result[i] = max;
        }

        return result;
      };

      const data = new collections.Int16Array([3, 1, 4, 1, 5, 9, 2, 6]);
      const maxValues = slidingWindowMax(data, 3);

      expect(maxValues.toString()).assertEqual('4,4,5,9,9,9');
    })

    /**
     * @tc.name   TypeArrayInt16Array0123
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0103
     * @tc.desc   Verify Int16Array with bitwise bit reversal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const reverseBits = (value: number): number => {
        let reversed = 0;
        let val = value & 0xFFFF;

        for (let i = 0; i < 16; i++) {
          reversed = (reversed << 1) | (val & 1);
          val >>>= 1;
        }

        return reversed << 16 >> 16;
      };

      const arr = new collections.Int16Array([0b0000000000000001, 0b1000000000000000, 0b1010101010101010]);
      const reversed = arr.map(reverseBits);

      expect(reversed[0]).assertEqual(-0b1000000000000000);
      expect(reversed[1]).assertEqual(0b0000000000000001);
      expect(reversed[2]).assertEqual(0b0101010101010101);
    })

    /**
     * @tc.name   TypeArrayInt16Array0124
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0104
     * @tc.desc   Verify Int16Array with data transformation using lookup table
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const createLookupTable = (size: number, func: (i: number) => number): collections.Int16Array => {
        const table = new collections.Int16Array(size);
        for (let i = 0; i < size; i++) {
          table[i] = Math.max(-32768, Math.min(32767, Math.round(func(i))));
        }
        return table;
      };


      const transformWithLUT = (data: collections.Int16Array, lut: collections.Int16Array): collections.Int16Array => {
        return new collections.Int16Array(data.map(val => {
          const index = Math.max(0, Math.min(lut.length - 1, val));
          return lut[index];
        }));
      };


      const sinLUT = createLookupTable(100, i => Math.sin(i / 10) * 1000);


      const data = new collections.Int16Array([0, 10, 20, 30, 40, 50]);
      const transformed = transformWithLUT(data, sinLUT);

      expect(transformed[0]).assertEqual(0);
      expect(transformed[10]).assertUndefined();
      expect(transformed.length).assertEqual(6);
    })

    /**
     * @tc.name   TypeArrayInt16Array0125
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_ALL_0105
     * @tc.desc   Verify Int16Array with data encryption using additive cipher
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayInt16Array0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const additiveCipher = (data: collections.Int16Array, key: number): collections.Int16Array => {
        const result = new collections.Int16Array(data.length);
        const range = 65536;

        for (let i = 0; i < data.length; i++) {

          let value = (data[i] + 32768 + key) % range;
          if (value < 0) {
            value += range;
          }
          result[i] = value - 32768;
        }

        return result;
