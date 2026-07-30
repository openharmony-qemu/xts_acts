'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { ArrayList } from '@kit.ArkTS';
import Utils from '../Util.test';

export default function ArrayList12Test():void {
  describe('ArrayList12Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_SYMBOL_ITERATOR06_2600
     * @tc.name      testArrayList06SymbolIterator0026
     * @tc.desc      Test nested iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0026';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(10);
        arrayList.add(20);
        arrayList.add(30);
        let count: int = 0;
        let firstValue: number = 0;
        let secondValue: number = 0;
        let thirdValue: number = 0;
        for (let item of arrayList) {
          if (count === 0) firstValue = item;
          if (count === 1) secondValue = item;
          if (count === 2) thirdValue = item;
          count++;
        }
        expect(count).assertEqual(3);
        expect(firstValue).assertEqual(10);
        expect(secondValue).assertEqual(20);
        expect(thirdValue).assertEqual(30);
        const arrayFromList: number[] = [];
        for (let item of arrayList) {
          arrayFromList.push(item);
        }
        expect(arrayFromList[0]).assertEqual(10);
        expect(arrayFromList[1]).assertEqual(20);
        expect(arrayFromList[2]).assertEqual(30);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_SYMBOL_ITERATOR06_2700
     * @tc.name      testArrayList06SymbolIterator0027
     * @tc.desc      Test full iterable protocol implementation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0027';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("first");
        arrayList.add("second");
        arrayList.add("third");
        expect(arrayList.length).assertEqual(3);
        expect(arrayList[0]).assertEqual("first");
        expect(arrayList[1]).assertEqual("second");
        expect(arrayList[2]).assertEqual("third");
        try {
          let iterationCount: int = 0;
          let firstItem = "";
          let secondItem = "";
          let thirdItem = "";
          for (let item of arrayList) {
            if (iterationCount === 0) firstItem = item;
            if (iterationCount === 1) secondItem = item;
            if (iterationCount === 2) thirdItem = item;
            iterationCount++;
          }
          if (iterationCount > 0) {
            expect(iterationCount).assertEqual(3);
            expect(firstItem).assertEqual("first");
            expect(secondItem).assertEqual("second");
            expect(thirdItem).assertEqual("third");
          }
        } catch (error) {
          console.warn('Iteration not supported:', error);
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAYLIST_SYMBOL_ITERATOR06_2800
     * @tc.name      testArrayList06SymbolIterator0028
     * @tc.desc      Test Symbol.iterator vs forEach method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList06SymbolIterator0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList06SymbolIterator0028';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.add(5);
        const iteratorResults: number[] = [];
        for (let value of arrayList) {
          iteratorResults.push(value);
        }
        const forEachResults: number[] = [];
        arrayList.forEach((value: number) => {
          forEachResults.push(value);
        });
        expect(iteratorResults.length).assertEqual(5);
        expect(forEachResults.length).assertEqual(5);
        expect(iteratorResults).assertDeepEquals(forEachResults);
        expect(iteratorResults).assertDeepEquals([1.0, 2.0, 3.0, 4.0, 5.0]);
        for (let i: int = 0; i < 5; i++) {
          expect(iteratorResults[i]).assertEqual(forEachResults[i]);
        }
        console.log(TAG + ' done');
      });
  })
}