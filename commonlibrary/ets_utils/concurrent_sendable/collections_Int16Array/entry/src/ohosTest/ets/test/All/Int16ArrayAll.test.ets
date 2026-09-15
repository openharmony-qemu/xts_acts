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
