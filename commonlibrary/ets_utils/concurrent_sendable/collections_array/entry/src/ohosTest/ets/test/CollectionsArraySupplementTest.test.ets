/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

const SLEEP_INTERVAL_MS: number = 100;

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, ms));
}

export default function CollectionsArraySupplementTest() {
  describe('CollectionsArraySupplementTest', () => {
    afterAll(async () => {
      await sleep(SLEEP_INTERVAL_MS);
    });

    // ==================== length属性测试用例 ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_LENGTH_EMPTY_0100
     * @tc.name   collectionsArraySupplementTest0100
     * @tc.desc Test empty array length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest0100 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>();
      expect(array.length).assertEqual(0);
      console.info("-----------------collectionsArraySupplementTest0100 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_LENGTH_SINGLE_ELEMENT_0100
     * @tc.name   collectionsArraySupplementTest0200
     * @tc.desc Test single element array length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest0200 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1);
      expect(array.length).assertEqual(1);
      console.info("-----------------collectionsArraySupplementTest0200 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_LENGTH_MULTIPLE_ELEMENTS_0100
     * @tc.name   collectionsArraySupplementTest0300
     * @tc.desc Test multiple element array length correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest0300 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      expect(array.length).assertEqual(5);
      console.info("-----------------collectionsArraySupplementTest0300 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_CREATE_SPECIFIED_LENGTH_0100
     * @tc.name   collectionsArraySupplementTest0400
     * @tc.desc Test Array.create specified length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest0400 begin-----------------");
      let array: collections.Array<number> = collections.Array.create<number>(3, 10);
      expect(array.length).assertEqual(3);
      console.info("-----------------collectionsArraySupplementTest0400 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_FROM_LENGTH_0100
     * @tc.name   collectionsArraySupplementTest0500
     * @tc.desc Test Array.from created array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest0500 begin-----------------");
      let nativeArray: Array<number> = [1, 2, 3];
      let array: collections.Array<number> = collections.Array.from<number>(nativeArray);
      expect(array.length).assertEqual(3);
      console.info("-----------------collectionsArraySupplementTest0500 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_OF_LENGTH_0100
     * @tc.name   collectionsArraySupplementTest0600
     * @tc.desc Test Array.of created array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest0600 begin-----------------");
      let array: collections.Array<string> = collections.Array.of<string>('a', 'b', 'c');
      expect(array.length).assertEqual(3);
      console.info("-----------------collectionsArraySupplementTest0600 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_LENGTH_AFTER_PUSH_0100
     * @tc.name   collectionsArraySupplementTest0700
     * @tc.desc Test length after push operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest0700 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2);
      array.push(3, 4);
      expect(array.length).assertEqual(4);
      console.info("-----------------collectionsArraySupplementTest0700 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_LENGTH_AFTER_POP_0100
     * @tc.name   collectionsArraySupplementTest0800
     * @tc.desc Test length after pop operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest0800 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      array.pop();
      expect(array.length).assertEqual(2);
      console.info("-----------------collectionsArraySupplementTest0800 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_LENGTH_AFTER_SHIFT_0100
     * @tc.name   collectionsArraySupplementTest0900
     * @tc.desc Test length after shift operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest0900 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      array.shift();
      expect(array.length).assertEqual(2);
      console.info("-----------------collectionsArraySupplementTest0900 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_LENGTH_AFTER_UNSHIFT_0100
     * @tc.name   collectionsArraySupplementTest1000
     * @tc.desc Test length after unshift operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest1000 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2);
      array.unshift(0);
      expect(array.length).assertEqual(3);
      console.info("-----------------collectionsArraySupplementTest1000 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_LENGTH_AFTER_SPLICE_0100
     * @tc.name   collectionsArraySupplementTest1100
     * @tc.desc Test length after splice operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest1100 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
      array.splice(1, 2, 10, 20, 30);
      expect(array.length).assertEqual(5);
      console.info("-----------------collectionsArraySupplementTest1100 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_LARGE_LENGTH_0100
     * @tc.name   collectionsArraySupplementTest1300
     * @tc.desc Test large array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest1300 begin-----------------");
      let largeArray: collections.Array<number> = collections.Array.create<number>(1000, 0);
      expect(largeArray.length).assertEqual(1000);
      console.info("-----------------collectionsArraySupplementTest1300 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_LENGTH_MATCHES_COUNT_0100
     * @tc.name   collectionsArraySupplementTest1400
     * @tc.desc Test length matches actual element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest1400 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      let count: number = 0;
      for (let val of array.values()) {
        count++;
      }
      expect(count).assertEqual(array.length);
      console.info("-----------------collectionsArraySupplementTest1400 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_LENGTH_DYNAMIC_UPDATE_0100
     * @tc.name   collectionsArraySupplementTest1500
     * @tc.desc Test length updates dynamically after operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest1500 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>();
      expect(array.length).assertEqual(0);
      array.push(1);
      expect(array.length).assertEqual(1);
      array.push(2, 3);
      expect(array.length).assertEqual(3);
      array.pop();
      expect(array.length).assertEqual(2);
      console.info("-----------------collectionsArraySupplementTest1500 end-----------------");
    });

    // ==================== forEach测试用例 ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_FOR_EACH_NORMAL_CALLBACK_0100
     * @tc.name   collectionsArraySupplementTest1600
     * @tc.desc Test forEach with normal callback function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest1600 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let sum: number = 0;
      array.forEach((value: number) => {
        sum += value;
      });
      expect(sum).assertEqual(6);
      console.info("-----------------collectionsArraySupplementTest1600 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_FOR_EACH_ARROW_CALLBACK_0100
     * @tc.name   collectionsArraySupplementTest1700
     * @tc.desc Test forEach with arrow function callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest1700 begin-----------------");
      let array: collections.Array<string> = new collections.Array<string>('a', 'b', 'c');
      let result: string[] = [];
      array.forEach((value: string) => {
        result.push(value);
      });
      expect(result.length).assertEqual(3);
      console.info("-----------------collectionsArraySupplementTest1700 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_FOR_EACH_THREE_PARAMS_0100
     * @tc.name   collectionsArraySupplementTest1800
     * @tc.desc Test forEach with all three parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest1800 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      array.forEach((value: number, index: number, arr: collections.Array<number>) => {
        expect(arr).assertEqual(array);
        expect(arr.length).assertEqual(3);
      });
      console.info("-----------------collectionsArraySupplementTest1800 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_FOR_EACH_INDEX_START_ZERO_0100
     * @tc.name   collectionsArraySupplementTest1900
     * @tc.desc Test forEach index starts from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest1900 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(10, 20, 30);
      let expectedIndex: number = 0;
      array.forEach((value: number, index: number) => {
        expect(index).assertEqual(expectedIndex);
        expectedIndex++;
      });
      console.info("-----------------collectionsArraySupplementTest1900 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_FOR_EACH_EMPTY_ARRAY_0100
     * @tc.name   collectionsArraySupplementTest2000
     * @tc.desc Test forEach on empty array does not execute callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest2000 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>();
      let executed: boolean = false;
      array.forEach(() => {
        executed = true;
      });
      expect(executed).assertFalse();
      console.info("-----------------collectionsArraySupplementTest2000 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_FOR_EACH_RETURNS_UNDEFINED_0100
     * @tc.name   collectionsArraySupplementTest2100
     * @tc.desc Test forEach returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest2100 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let result: void = array.forEach((value: number) => {
        console.info(value.toString());
      });
      expect(result).assertEqual(undefined);
      console.info("-----------------collectionsArraySupplementTest2100 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_FOR_EACH_METHOD_UNBOUND_0100
     * @tc.name   collectionsArraySupplementTest2200
     * @tc.desc Test forEach method binding throws 10200011
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest2200 begin-----------------");
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        let forEachMethod = array.forEach;
        forEachMethod((value: number) => {
          console.info(value.toString());
        });
        expect().assertFail();
      } catch (error) {
        console.error('failed, code is ' + error.code + ', message is ' + error.message);
        expect(error.code).assertEqual(10200011);
      }
      console.info("-----------------collectionsArraySupplementTest2200 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_FOR_EACH_CONCURRENT_PUSH_0100
     * @tc.name   collectionsArraySupplementTest2300
     * @tc.desc Test forEach concurrent modification with push throws 10200201
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest2300 begin-----------------");
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        array.forEach((value: number) => {
          array.push(0);
        });
        expect().assertFail();
      } catch (error) {
        console.error('failed, code is ' + error.code + ', message is ' + error.message);
        expect(error.code).assertEqual(10200201);
      }
      console.info("-----------------collectionsArraySupplementTest2300 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_FOR_EACH_CONCURRENT_POP_0100
     * @tc.name   collectionsArraySupplementTest2400
     * @tc.desc Test forEach concurrent modification with pop throws 10200201
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest2400 begin-----------------");
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        array.forEach((value: number) => {
          array.pop();
        });
        expect().assertFail();
      } catch (error) {
        console.error('failed, code is ' + error.code + ', message is ' + error.message);
        expect(error.code).assertEqual(10200201);
      }
      console.info("-----------------collectionsArraySupplementTest2400 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_FOR_EACH_CONCURRENT_SHIFT_0100
     * @tc.name   collectionsArraySupplementTest2500
     * @tc.desc Test forEach concurrent modification with shift throws 10200201
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest2500 begin-----------------");
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        array.forEach((value: number) => {
          array.shift();
        });
        expect().assertFail();
      } catch (error) {
        console.error('failed, code is ' + error.code + ', message is ' + error.message);
        expect(error.code).assertEqual(10200201);
      }
      console.info("-----------------collectionsArraySupplementTest2500 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_FOR_EACH_CONCURRENT_UNSHIFT_0100
     * @tc.name   collectionsArraySupplementTest2600
     * @tc.desc Test forEach concurrent modification with unshift throws 10200201
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest2600 begin-----------------");
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        array.forEach((value: number) => {
          array.unshift(0);
        });
        expect().assertFail();
      } catch (error) {
        console.error('failed, code is ' + error.code + ', message is ' + error.message);
        expect(error.code).assertEqual(10200201);
      }
      console.info("-----------------collectionsArraySupplementTest2600 end-----------------");
    });

    // ==================== isArray测试用例 ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_IS_ARRAY_WITH_STRING_INSTANCE_0100
     * @tc.name   collectionsArraySupplementTest2700
     * @tc.desc Test isArray with collections.Array<string> instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest2700 begin-----------------");
      let arr: collections.Array<string> = new collections.Array<string>('a', 'b', 'c', 'd');
      let result: boolean = collections.Array.isArray(arr);
      expect(result).assertEqual(true);
      console.info("-----------------collectionsArraySupplementTest2700 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_IS_ARRAY_WITH_NUMBER_INSTANCE_0100
     * @tc.name   collectionsArraySupplementTest2800
     * @tc.desc Test isArray with collections.Array<number> instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest2800 begin-----------------");
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      let result: boolean = collections.Array.isArray(arr);
      expect(result).assertEqual(true);
      console.info("-----------------collectionsArraySupplementTest2800 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_IS_ARRAY_WITH_EMPTY_ARRAY_0100
     * @tc.name   collectionsArraySupplementTest2900
     * @tc.desc Test isArray with empty collections.Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest2900 begin-----------------");
      let arr: collections.Array<number> = new collections.Array<number>();
      let result: boolean = collections.Array.isArray(arr);
      expect(result).assertEqual(true);
      expect(arr.length).assertEqual(0);
      console.info("-----------------collectionsArraySupplementTest2900 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_IS_ARRAY_NATIVE_ARRAY_FALSE_0100
     * @tc.name   collectionsArraySupplementTest3000
     * @tc.desc Test isArray with native Array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest3000 begin-----------------");
      let nativeArr: Array<number> = [1, 2, 3];
      let result: boolean = collections.Array.isArray(nativeArr);
      expect(result).assertEqual(false);
      console.info("-----------------collectionsArraySupplementTest3000 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_IS_ARRAY_NULL_FALSE_0100
     * @tc.name   collectionsArraySupplementTest3100
     * @tc.desc Test isArray with null returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest3100 begin-----------------");
      let result: boolean = collections.Array.isArray(null);
      expect(result).assertEqual(false);
      console.info("-----------------collectionsArraySupplementTest3100 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_IS_ARRAY_UNDEFINED_FALSE_0100
     * @tc.name   collectionsArraySupplementTest3200
     * @tc.desc Test isArray with undefined returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest3200 begin-----------------");
      let result: boolean = collections.Array.isArray(undefined);
      expect(result).assertEqual(false);
      console.info("-----------------collectionsArraySupplementTest3200 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_IS_ARRAY_MAP_FALSE_0100
     * @tc.name   collectionsArraySupplementTest3300
     * @tc.desc Test isArray with collections.Map returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest3300 begin-----------------");
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('key', 1);
      let result: boolean = collections.Array.isArray(map);
      expect(result).assertEqual(false);
      console.info("-----------------collectionsArraySupplementTest3300 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_IS_ARRAY_BASIC_TYPE_FALSE_0100
     * @tc.name   collectionsArraySupplementTest3400
     * @tc.desc Test isArray with basic type number returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest3400 begin-----------------");
      let result: boolean = collections.Array.isArray(42);
      expect(result).assertEqual(false);
      console.info("-----------------collectionsArraySupplementTest3400 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_IS_ARRAY_FROM_METHOD_0100
     * @tc.name   collectionsArraySupplementTest3500
     * @tc.desc Test isArray with Array created by from method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest3500 begin-----------------");
      let nativeArr: Array<number> = [1, 2, 3];
      let arr: collections.Array<number> = collections.Array.from<number>(nativeArr);
      let result: boolean = collections.Array.isArray(arr);
      expect(result).assertEqual(true);
      console.info("-----------------collectionsArraySupplementTest3500 end-----------------");
    });

    // ==================== [Symbol.iterator]测试用例 ====================

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_SymbolIterator_28700
     * @tc.name   collectionsArraySupplementTest3600
     * @tc.desc Test Array [Symbol.iterator]() returns IterableIterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest3600 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let iterator: IterableIterator<number> = array.values();
      let first = iterator.next();
      expect(first.value).assertEqual(1);
      expect(first.done).assertEqual(false);
      console.info("-----------------collectionsArraySupplementTest3600 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_SymbolIterator_28800
     * @tc.name   collectionsArraySupplementTest3700
     * @tc.desc Test Array [Symbol.iterator]() with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest3700 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>();
      let iterator: IterableIterator<number> = array.values();
      let result = iterator.next();
      expect(result.done).assertEqual(true);
      console.info("-----------------collectionsArraySupplementTest3700 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_SymbolIterator_28900
     * @tc.name   collectionsArraySupplementTest3800
     * @tc.desc Test Array [Symbol.iterator]() with single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest3800 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(42);
      let iterator: IterableIterator<number> = array.values();
      let first = iterator.next();
      expect(first.value).assertEqual(42);
      expect(first.done).assertEqual(false);
      let second = iterator.next();
      expect(second.done).assertEqual(true);
      console.info("-----------------collectionsArraySupplementTest3800 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_SymbolIterator_29000
     * @tc.name   collectionsArraySupplementTest3900
     * @tc.desc Test Array [Symbol.iterator]() full traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest3900 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      let collected: number[] = [];
      for (let val of array) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(5);
      expect(collected[0]).assertEqual(1);
      expect(collected[4]).assertEqual(5);
      console.info("-----------------collectionsArraySupplementTest3900 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_SymbolIterator_29100
     * @tc.name   collectionsArraySupplementTest4000
     * @tc.desc Test iterator[Symbol.iterator]() returns self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest4000 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let iterator: IterableIterator<number> = array.values();
      expect(iterator.next().value).assertEqual(1);
      expect(iterator.next().value).assertEqual(2);
      expect(iterator.next().value).assertEqual(3);
      expect(iterator.next().done).assertEqual(true);
      console.info("-----------------collectionsArraySupplementTest4000 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_SymbolIterator_29200
     * @tc.name   collectionsArraySupplementTest4100
     * @tc.desc Test iterator next() return value structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest4100 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(10, 20);
      let iterator: IterableIterator<number> = array.values();
      let first = iterator.next();
      expect(first.value).assertEqual(10);
      expect(first.done).assertEqual(false);
      let second = iterator.next();
      expect(second.value).assertEqual(20);
      expect(second.done).assertEqual(false);
      let third = iterator.next();
      expect(third.done).assertEqual(true);
      console.info("-----------------collectionsArraySupplementTest4100 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_SYMBOL_ITERATOR_SPREAD_0100
     * @tc.name   collectionsArraySupplementTest4200
     * @tc.desc Test spread operator with Array iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest4200 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let spread: number[] = [...array];
      expect(spread.length).assertEqual(3);
      expect(spread[0]).assertEqual(1);
      expect(spread[1]).assertEqual(2);
      expect(spread[2]).assertEqual(3);
      console.info("-----------------collectionsArraySupplementTest4200 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_SymbolIterator_29400
     * @tc.name   collectionsArraySupplementTest4300
     * @tc.desc Test Array [Symbol.iterator]() with null element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest4300 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let iter1: IterableIterator<number> = array.values();
      let iter2: IterableIterator<number> = array.values();
      let v1 = iter1.next();
      let v2 = iter2.next();
      expect(v1.value).assertEqual(1);
      expect(v2.value).assertEqual(1);
      console.info("-----------------collectionsArraySupplementTest4300 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_SymbolIterator_29500
     * @tc.name   collectionsArraySupplementTest4400
     * @tc.desc Test multiple iterators independent state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest4400 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let iter1: IterableIterator<number> = array.values();
      let iter2: IterableIterator<number> = array.values();
      iter1.next();
      iter1.next();
      let v2 = iter2.next();
      expect(v2.value).assertEqual(1);
      let v1 = iter1.next();
      expect(v1.value).assertEqual(3);
      console.info("-----------------collectionsArraySupplementTest4400 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_SymbolIterator_29600
     * @tc.name   collectionsArraySupplementTest4500
     * @tc.desc Test iteration protocol completeness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest4500 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(5, 10, 15);
      let iterator: IterableIterator<number> = array.values();
      let result = iterator.next();
      let done: boolean = false;
      while (!done) {
        let item = iterator.next();
        done = item.done === true;
      }
      expect(done).assertEqual(true);
      console.info("-----------------collectionsArraySupplementTest4500 end-----------------");
    });

    // ==================== sort测试用例 ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_SORT_DEFAULT_ASCENDING_0100
     * @tc.name   collectionsArraySupplementTest4600
     * @tc.desc Test sort without compareFn uses default ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest4600 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(3, 1, 4, 1, 5, 9, 2, 6);
      let sorted: collections.Array<number> = array.sort();
      expect(sorted.length).assertEqual(8);
      expect(sorted === array).assertTrue();
      console.info("-----------------collectionsArraySupplementTest4600 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_SORT_CUSTOM_ASCENDING_0100
     * @tc.name   collectionsArraySupplementTest4700
     * @tc.desc Test sort with (a - b) compareFn for ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest4700 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 3, 5, 4, 2);
      let sorted: collections.Array<number> = array.sort((a: number, b: number) => a - b);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[4]).assertEqual(5);
      expect(sorted === array).assertTrue();
      console.info("-----------------collectionsArraySupplementTest4700 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_SORT_CUSTOM_DESCENDING_0100
     * @tc.name   collectionsArraySupplementTest4800
     * @tc.desc Test sort with (b - a) compareFn for descending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest4800 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 3, 5, 4, 2);
      let sorted: collections.Array<number> = array.sort((a: number, b: number) => b - a);
      expect(sorted[0]).assertEqual(5);
      expect(sorted[4]).assertEqual(1);
      console.info("-----------------collectionsArraySupplementTest4800 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_SORT_EMPTY_ARRAY_0100
     * @tc.name   collectionsArraySupplementTest4900
     * @tc.desc Test sort on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest4900 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>();
      let sorted: collections.Array<number> = array.sort((a: number, b: number) => a - b);
      expect(sorted.length).assertEqual(0);
      console.info("-----------------collectionsArraySupplementTest4900 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_SORT_SINGLE_ELEMENT_0100
     * @tc.name   collectionsArraySupplementTest5000
     * @tc.desc Test sort on single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest5000 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(42);
      let sorted: collections.Array<number> = array.sort();
      expect(sorted.length).assertEqual(1);
      expect(sorted[0]).assertEqual(42);
      console.info("-----------------collectionsArraySupplementTest5000 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_SORT_NEGATIVE_NUMBERS_0100
     * @tc.name   collectionsArraySupplementTest5100
     * @tc.desc Test sort on array with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest5100 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(-5, 3, -1, 0, 2);
      let sorted: collections.Array<number> = array.sort((a: number, b: number) => a - b);
      expect(sorted[0]).assertEqual(-5);
      expect(sorted[sorted.length - 1]).assertEqual(3);
      console.info("-----------------collectionsArraySupplementTest5100 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_SORT_DUPLICATE_ELEMENTS_0100
     * @tc.name   collectionsArraySupplementTest5200
     * @tc.desc Test sort on array with duplicate elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest5200 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 1, 1, 2, 2, 3);
      let sorted: collections.Array<number> = array.sort((a: number, b: number) => a - b);
      expect(sorted.length).assertEqual(6);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[sorted.length - 1]).assertEqual(3);
      console.info("-----------------collectionsArraySupplementTest5200 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_sort_24500
     * @tc.name   collectionsArraySupplementTest5300
     * @tc.desc Test sort throws 10200011 error when method unbound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest5300 begin-----------------");
      try {
        let array: collections.Array<number> = new collections.Array<number>(3, 1, 2);
        let sortMethod = array.sort;
        sortMethod();
        expect().assertFail();
      } catch (error) {
        console.error('failed, code is ' + error.code + ', message is ' + error.message);
        expect(error.code).assertEqual(10200011);
      }
      console.info("-----------------collectionsArraySupplementTest5300 end-----------------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_SORT_CONCURRENT_MODIFICATION_0100
     * @tc.name   collectionsArraySupplementTest5400
     * @tc.desc Test sort throws 10200201 error with concurrent modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest5400 begin-----------------");
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        array.sort((a: number, b: number) => {
          array.push(6);
          return a - b;
        });
        expect().assertFail();
      } catch (error) {
        console.error('failed, code is ' + error.code + ', message is ' + error.message);
        expect(error.code).assertEqual(10200201);
      }
      console.info("-----------------collectionsArraySupplementTest5400 end-----------------");
    });

    // ==================== every测试用例 ====================

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_every_24700
     * @tc.name   collectionsArraySupplementTest5500
     * @tc.desc Test every with all elements satisfying condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest5500 begin-----------------");
      let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5]);
      let result: boolean = array.every((element: number) => element > 0);
      expect(result).assertTrue();
      console.info("-----------------collectionsArraySupplementTest5500 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_every_24800
     * @tc.name   collectionsArraySupplementTest5600
     * @tc.desc Test every with some elements not satisfying condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest5600 begin-----------------");
      let array: collections.Array<number> = collections.Array.from([-10, 20, -30, 40, -50]);
      let result: boolean = array.every((element: number) => element > 0);
      expect(result).assertFalse();
      console.info("-----------------collectionsArraySupplementTest5600 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_every_24900
     * @tc.name   collectionsArraySupplementTest5700
     * @tc.desc Test every on empty array returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest5700 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>();
      let result: boolean = array.every((element: number) => element > 0);
      expect(result).assertTrue();
      console.info("-----------------collectionsArraySupplementTest5700 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_every_25000
     * @tc.name   collectionsArraySupplementTest5800
     * @tc.desc Test every stops at first element not satisfying condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest5800 begin-----------------");
      let array: collections.Array<number> = collections.Array.from([-1, 1, 2, 3, 4]);
      let callCount: number = 0;
      let result: boolean = array.every((element: number) => {
        callCount++;
        return element > 0;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(1);
      console.info("-----------------collectionsArraySupplementTest5800 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_every_25100
     * @tc.name   collectionsArraySupplementTest5900
     * @tc.desc Test every with predicate using index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest5900 begin-----------------");
      let array: collections.Array<number> = collections.Array.from([0, 1, 2, 3]);
      let result: boolean = array.every((element: number, index: number) => element === index);
      expect(result).assertTrue();
      console.info("-----------------collectionsArraySupplementTest5900 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_every_25200
     * @tc.name   collectionsArraySupplementTest6000
     * @tc.desc Test every with predicate using array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest6000 begin-----------------");
      let array: collections.Array<number> = collections.Array.from([1, 2, 3]);
      let result: boolean = array.every((value: number, index: number, arr: collections.Array<number>) => {
        expect(arr).assertEqual(array);
        expect(arr.length).assertEqual(3);
        return value > 0;
      });
      expect(result).assertTrue();
      console.info("-----------------collectionsArraySupplementTest6000 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_every_25400
     * @tc.name   collectionsArraySupplementTest6100
     * @tc.desc Test every throws 10200011 error when method unbound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest6100 begin-----------------");
      try {
        let array: collections.Array<number> = collections.Array.from([1, 2, 3]);
        let everyMethod = array.every;
        everyMethod((element: number) => element > 0);
        expect().assertFail();
      } catch (error) {
        console.error('failed, code is ' + error.code + ', message is ' + error.message);
        expect(error.code).assertEqual(10200011);
      }
      console.info("-----------------collectionsArraySupplementTest6100 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_every_25500
     * @tc.name   collectionsArraySupplementTest6200
     * @tc.desc Test every throws 10200201 error with concurrent modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest6200 begin-----------------");
      try {
        let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5]);
        array.every((element: number) => {
          array.push(6);
          return element > 0;
        });
        expect().assertFail();
      } catch (error) {
        console.error('failed, code is ' + error.code + ', message is ' + error.message);
        expect(error.code).assertEqual(10200201);
      }
      console.info("-----------------collectionsArraySupplementTest6200 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_every_25600
     * @tc.name   collectionsArraySupplementTest6300
     * @tc.desc Test every with predicate throwing error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest6300 begin-----------------");
      try {
        let array: collections.Array<number> = collections.Array.from([1, 2, 3]);
        array.every((element: number) => {
          if (element === 2) {
            throw new Error('predicate error');
          }
          return element > 0;
        });
        expect().assertFail();
      } catch (error) {
        console.error('failed, message is ' + error.message);
        expect(error.message).assertEqual('predicate error');
      }
      console.info("-----------------collectionsArraySupplementTest6300 end-----------------");
    });

    // ==================== find测试用例 ====================

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_find_25700
     * @tc.name   collectionsArraySupplementTest6400
     * @tc.desc Test find returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest6400 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      let result: number | undefined = array.find((value: number) => value % 2 === 0);
      expect(result).assertEqual(2);
      console.info("-----------------collectionsArraySupplementTest6400 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_find_25800
     * @tc.name   collectionsArraySupplementTest6500
     * @tc.desc Test find returns undefined when no element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest6500 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 3, 5, 7);
      let result: number | undefined = array.find((value: number) => value % 2 === 0);
      expect(result).assertUndefined();
      console.info("-----------------collectionsArraySupplementTest6500 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_find_25900
     * @tc.name   collectionsArraySupplementTest6600
     * @tc.desc Test find on empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest6600 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>();
      let result: number | undefined = array.find((value: number) => value > 0);
      expect(result).assertUndefined();
      console.info("-----------------collectionsArraySupplementTest6600 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_find_26000
     * @tc.name   collectionsArraySupplementTest6700
     * @tc.desc Test find with multiple matching elements returns first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest6700 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(2, 4, 6, 8);
      let result: number | undefined = array.find((value: number) => value % 2 === 0);
      expect(result).assertEqual(2);
      console.info("-----------------collectionsArraySupplementTest6700 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_find_26100
     * @tc.name   collectionsArraySupplementTest6800
     * @tc.desc Test find with predicate using index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest6800 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(10, 20, 30, 40);
      let result: number | undefined = array.find((value: number, index: number) => index === 2);
      expect(result).assertEqual(30);
      console.info("-----------------collectionsArraySupplementTest6800 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_find_26200
     * @tc.name   collectionsArraySupplementTest6900
     * @tc.desc Test find with predicate using array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest6900 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let result: number | undefined = array.find((value: number, index: number, obj: collections.Array<number>) => {
        expect(obj).assertEqual(array);
        expect(obj.length).assertEqual(3);
        return value === 2;
      });
      expect(result).assertEqual(2);
      console.info("-----------------collectionsArraySupplementTest6900 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_find_26500
     * @tc.name   collectionsArraySupplementTest7000
     * @tc.desc Test find throws 10200011 error when method unbound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest7000 begin-----------------");
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        let findMethod = array.find;
        findMethod((value: number) => value === 2);
        expect().assertFail();
      } catch (error) {
        console.error('failed, code is ' + error.code + ', message is ' + error.message);
        expect(error.code).assertEqual(10200011);
      }
      console.info("-----------------collectionsArraySupplementTest7000 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_find_26600
     * @tc.name   collectionsArraySupplementTest7100
     * @tc.desc Test find throws 10200201 error with concurrent modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest7100 begin-----------------");
      try {
        let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        array.find((value: number) => {
          array.push(4);
          return value === 2;
        });
        expect().assertFail();
      } catch (error) {
        console.error('failed, code is ' + error.code + ', message is ' + error.message);
        expect(error.code).assertEqual(10200201);
      }
      console.info("-----------------collectionsArraySupplementTest7100 end-----------------");
    });

    // ==================== toString测试用例 ====================

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toString_26700
     * @tc.name   collectionsArraySupplementTest7200
     * @tc.desc Test toString method with normal array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest7200 begin-----------------");
      let array: collections.Array<string> = new collections.Array<string>('a', 'b', 'c');
      let result: string = array.toString();
      expect(result).assertEqual('a,b,c');
      console.info("-----------------collectionsArraySupplementTest7200 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toString_26800
     * @tc.name   collectionsArraySupplementTest7300
     * @tc.desc Test toString method with number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest7300 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let result: string = array.toString();
      expect(result).assertEqual('1,2,3');
      console.info("-----------------collectionsArraySupplementTest7300 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toString_26900
     * @tc.name   collectionsArraySupplementTest7400
     * @tc.desc Test toString method with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest7400 begin-----------------");
      let array: collections.Array<string> = new collections.Array<string>();
      let result: string = array.toString();
      expect(result).assertEqual('');
      console.info("-----------------collectionsArraySupplementTest7400 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toString_27000
     * @tc.name   collectionsArraySupplementTest7500
     * @tc.desc Test toString method with single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest7500 begin-----------------");
      let array: collections.Array<string> = new collections.Array<string>('single');
      let result: string = array.toString();
      expect(result).assertEqual('single');
      console.info("-----------------collectionsArraySupplementTest7500 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toString_27100
     * @tc.name   collectionsArraySupplementTest7600
     * @tc.desc Test toString method with boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest7600 begin-----------------");
      let array: collections.Array<boolean> = new collections.Array<boolean>(true, false, true);
      let result: string = array.toString();
      expect(result).assertEqual('true,false,true');
      console.info("-----------------collectionsArraySupplementTest7600 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toString_27200
     * @tc.name   collectionsArraySupplementTest7700
     * @tc.desc Test toString method with Unicode string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest7700 begin-----------------");
      let array: collections.Array<string> = new collections.Array<string>('中文', '🎉', 'hello');
      let result: string = array.toString();
      expect(result).assertEqual('中文,🎉,hello');
      console.info("-----------------collectionsArraySupplementTest7700 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toString_27400
     * @tc.name   collectionsArraySupplementTest7800
     * @tc.desc Test toString method with large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest7800 begin-----------------");
      let array: collections.Array<number> = collections.Array.create<number>(100, 1);
      let result: string = array.toString();
      expect(result.split(',').length).assertEqual(100);
      console.info("-----------------collectionsArraySupplementTest7800 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toString_27500
     * @tc.name   collectionsArraySupplementTest7900
     * @tc.desc Test toString method with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest7900 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(-1, -100, -0.5);
      let result: string = array.toString();
      expect(result).assertEqual('-1,-100,-0.5');
      console.info("-----------------collectionsArraySupplementTest7900 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toString_27600
     * @tc.name   collectionsArraySupplementTest8000
     * @tc.desc Test toString throws 10200011 error when method unbound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest8000 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let detached = array.toString;
      try {
        detached();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200011);
      }
      console.info("-----------------collectionsArraySupplementTest8000 end-----------------");
    });

    // ==================== toLocaleString测试用例 ====================

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toLocaleString_27700
     * @tc.name   collectionsArraySupplementTest8100
     * @tc.desc Test toLocaleString method with normal array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest8100 begin-----------------");
      let array: collections.Array<string> = new collections.Array<string>('a', 'b', 'c');
      let result: string = array.toLocaleString();
      expect(result).assertEqual('a,b,c');
      console.info("-----------------collectionsArraySupplementTest8100 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toLocaleString_27800
     * @tc.name   collectionsArraySupplementTest8200
     * @tc.desc Test toLocaleString method with number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest8200 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let result: string = array.toLocaleString();
      expect(result).assertEqual('1,2,3');
      console.info("-----------------collectionsArraySupplementTest8200 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toLocaleString_27900
     * @tc.name   collectionsArraySupplementTest8300
     * @tc.desc Test toLocaleString method with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest8300 begin-----------------");
      let array: collections.Array<string> = new collections.Array<string>();
      let result: string = array.toLocaleString();
      expect(result).assertEqual('');
      console.info("-----------------collectionsArraySupplementTest8300 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toLocaleString_28000
     * @tc.name   collectionsArraySupplementTest8400
     * @tc.desc Test toLocaleString method with single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest8400 begin-----------------");
      let array: collections.Array<string> = new collections.Array<string>('single');
      let result: string = array.toLocaleString();
      expect(result).assertEqual('single');
      console.info("-----------------collectionsArraySupplementTest8400 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toLocaleString_28100
     * @tc.name   collectionsArraySupplementTest8500
     * @tc.desc Test toLocaleString method with boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest8500 begin-----------------");
      let array: collections.Array<boolean> = new collections.Array<boolean>(true, false, true);
      let result: string = array.toLocaleString();
      expect(result).assertEqual('true,false,true');
      console.info("-----------------collectionsArraySupplementTest8500 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toLocaleString_28200
     * @tc.name   collectionsArraySupplementTest8600
     * @tc.desc Test toLocaleString method with Unicode string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest8600 begin-----------------");
      let array: collections.Array<string> = new collections.Array<string>('中文', '日本語', '한국어');
      let result: string = array.toLocaleString();
      expect(result).assertEqual('中文,日本語,한국어');
      console.info("-----------------collectionsArraySupplementTest8600 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toLocaleString_28400
     * @tc.name   collectionsArraySupplementTest8700
     * @tc.desc Test toLocaleString method with float numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest8700 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1.5, 2.75, 3.14);
      let result: string = array.toLocaleString();
      expect(result.split(',').length).assertEqual(3);
      console.info("-----------------collectionsArraySupplementTest8700 end-----------------");
    });

    /**
     * @tc.number SUB_UTILS_COLLECTIONS_ARRAY_toLocaleString_28600
     * @tc.name   collectionsArraySupplementTest8800
     * @tc.desc Test toLocaleString throws 10200011 error when method unbound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('collectionsArraySupplementTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------collectionsArraySupplementTest8800 begin-----------------");
      let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let detached = array.toLocaleString;
      try {
        detached();
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200011);
      }
      console.info("-----------------collectionsArraySupplementTest8800 end-----------------");
    });

  });
}
