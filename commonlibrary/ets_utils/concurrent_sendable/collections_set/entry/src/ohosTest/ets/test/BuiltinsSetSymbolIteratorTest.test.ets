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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import Utils from './Util.test';

@Sendable
class TestClass {
  public name: string;
  constructor(name: string) {
    this.name = name;
  }
}

export default function BuiltinsSetSymbolIteratorTest() {
  describe('BuiltinsSetSymbolIteratorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name    builtinsSetSymbolIteratorTest0100
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_0100
     * @tc.desc    Verify Array constructor creates array with multiple number elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest0100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<number>(1, 2, 3, 4);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[3]).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest0200
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_0200
     * @tc.desc    Verify Array constructor creates array with multiple string elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest0200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<string>('a', 'b', 'c');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('a');
      expect(arr[2]).assertEqual('c');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest0300
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_0300
     * @tc.desc    Verify Array constructor creates array with multiple boolean elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest0300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<boolean>(true, false, true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(true);
      expect(arr[2]).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest0400
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_0400
     * @tc.desc    Verify Array constructor creates array with null elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest0400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<null | number>(null, 2, null);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(null);
      expect(arr[2]).assertEqual(null);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest0500
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_0500
     * @tc.desc    Verify Array constructor creates array with undefined elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest0500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<undefined | string>(undefined, 'test', undefined);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[2]).assertEqual(undefined);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest0600
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_0600
     * @tc.desc    Verify Array constructor creates array with object elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest0600';
      console.info(`${caseName}, test start`);
      const arr1 = collections.Array.of<number>(1, 2);
      const arr2 = collections.Array.of<number>(3, 4);
      const arr = collections.Array.of<collections.Array<number>>(arr1, arr2);
      expect(arr.length).assertEqual(2);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][1]).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest0700
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_0700
     * @tc.desc    Verify Array constructor creates array with function elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest0700';
      console.info(`${caseName}, test start`);
      const big1 = 10n;
      const big2 = 20n;
      const arr = collections.Array.of<bigint>(big1, big2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest0800
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_0800
     * @tc.desc    Verify Array constructor without new keyword creates array
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest0800';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr instanceof Array).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest0900
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_0900
     * @tc.desc    Verify Array constructor without arguments creates empty array
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest0900';
      console.info(`${caseName}, test start`);
      const arr = new collections.Array<string>();
      expect(arr.length).assertEqual(0);
      expect(arr instanceof Array).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest1000
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_1000
     * @tc.desc    Verify Array constructor with max safe integer length
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetSymbolIteratorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest1000';
      console.info(`${caseName}, test start`);
      const maxSafeInt = 1000000;
      const arr = collections.Array.create<number>(maxSafeInt, 0);
      expect(arr.length).assertEqual(maxSafeInt);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest1100
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_1100
     * @tc.desc    Verify Array constructor with single element that is an array
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest1100';
      console.info(`${caseName}, test start`);
      const element = collections.Array.of<number>(1, 2, 3);
      const arr = collections.Array.of<collections.Array<number>>(element);
      expect(arr.length).assertEqual(1);
      expect(arr[0][1]).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest1200
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_1200
     * @tc.desc    Verify Array constructor with negative zero treated as zero
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetSymbolIteratorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest1200';
      console.info(`${caseName}, test start`);
      const arr = new collections.Array<number>();
      expect(arr.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest1300
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_1300
     * @tc.desc    Verify Array constructor creates array with class instances
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest1300';
      console.info(`${caseName}, test start`);
      const instance1 = new TestClass('first');
      const instance2 = new TestClass('second');
      const arr = new collections.Array<TestClass>(instance1, instance2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].name).assertEqual('first');
      expect(arr[1].name).assertEqual('second');
      expect(arr[1] instanceof TestClass).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest1400
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_1400
     * @tc.desc    Verify Array constructor with length and then filled
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest1400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.create<number>(3, 5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest1500
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_1500
     * @tc.desc    Verify Array constructor with length is instanceof Array
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest1500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.create<number>(5, 0);
      expect(arr.length).assertEqual(5);
      expect(arr instanceof Array).assertEqual(false);
      expect(Array.isArray(arr)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest1600
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_1600
     * @tc.desc    Verify Array constructor with elements is instanceof Array
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest1600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr instanceof Array).assertEqual(false);
      expect(Array.isArray(arr)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest1700
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_1700
     * @tc.desc    Verify Array constructor creates array with empty string elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest1700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<string>('', '', '');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('');
      expect(arr[2].length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest1800
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_1800
     * @tc.desc    Verify Array constructor creates array with multi-line string elements
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest1800';
      console.info(`${caseName}, test start`);
      const str1 = 'line1\nline2';
      const str2 = 'a\nb\nc';
      const arr = collections.Array.of<string>(str1, str2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].split('\n').length).assertEqual(2);
      expect(arr[1].split('\n')[1]).assertEqual('b');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest1900
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_1900
     * @tc.desc    Verify Array constructor with elements and then unshift
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest1900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<number>(2, 3);
      arr.unshift(1);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest2000
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_2000
     * @tc.desc    Verify Array constructor with length is not frozen
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetSymbolIteratorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest2000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.create<number>(3, 0);
      arr[0] = 1;
      expect(arr[0]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest2100
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_2100
     * @tc.desc    Verify Array constructor with length and then join
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest2100';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.create<number | undefined>(3, undefined);
      arr[0] = 1;
      arr[2] = 3;
      expect(arr.join(',')).assertEqual('1,,3');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest2200
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_2200
     * @tc.desc    Verify Array constructor with elements and then join
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest2200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<string>('a', 'b', 'c');
      expect(arr.join('')).assertEqual('abc');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest2300
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_2300
     * @tc.desc    Verify Array constructor with length and then indexOf
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest2300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.create<number | undefined>(5, undefined);
      arr[2] = 10;
      expect(arr.indexOf(10)).assertEqual(2);
      expect(arr.indexOf(20)).assertEqual(-1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest2400
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_2400
     * @tc.desc    Verify Array constructor with elements and then includes
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest2400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<boolean>(true, false, true);
      expect(arr.includes(true)).assertEqual(true);
      expect(arr.includes(false)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest2500
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_2500
     * @tc.desc    Verify Array constructor with length and then map function
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetSymbolIteratorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest2500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.create<number>(3, 2);
      const mapped = arr.map(x => x * 3);
      expect(mapped.length).assertEqual(3);
      expect(mapped[0]).assertEqual(6);
      expect(mapped[2]).assertEqual(6);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest2600
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_2600
     * @tc.desc    Verify Array constructor with elements and then filter function
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetSymbolIteratorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest2600';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<number>(1, 2, 3, 4, 5);
      const filtered = arr.filter(x => x % 2 === 0);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(2);
      expect(filtered[1]).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest2700
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_2700
     * @tc.desc    Verify Array constructor with elements and then reduce function
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetSymbolIteratorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest2700';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<number>(1, 2, 3, 4);
      const sum = arr.reduce((acc: number, curr: number) => acc + curr, 0);
      expect(sum).assertEqual(10);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest2800
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_2800
     * @tc.desc    Verify Array constructor with length 1 and element that is zero
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetSymbolIteratorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest2800';
      console.info(`${caseName}, test start`);
      const arr = new collections.Array<number>();
      expect(arr.length).assertEqual(0);

      const arr2 = collections.Array.of<number>(0, 1);
      expect(arr2.length).assertEqual(2);
      expect(arr2[0]).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest2900
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_2900
     * @tc.desc    Verify Array constructor with length and then sorted
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetSymbolIteratorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest2900';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.create<number>(3, 0);
      arr[0] = 3;
      arr[1] = 1;
      arr[2] = 2;
      const sorted = arr.sort((a: number, b: number) => (a - b) > 0 ? 1 : ((a - b) < 0 ? -1 : 0));
      expect(sorted[0]).assertEqual(1);
      expect(sorted[2]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest3000
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_3000
     * @tc.desc    Verify Array constructor with elements and then reversed
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetSymbolIteratorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest3000';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<number>(1, 2, 3);
      const reversed = arr.reverse();
      expect(reversed[0]).assertEqual(3);
      expect(reversed[2]).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest3100
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_3100
     * @tc.desc    Verify Array constructor with large number of elements (1000)
     * @tc.type    Function
     * @tc.size    LargeTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetSymbolIteratorTest3100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest3100';
      console.info(`${caseName}, test start`);
      const elements: number[] = [];
      for (let i = 0; i < 1000; i++) {
        elements.push(i);
      }
      const arr: collections.Array<number> = new collections.Array<number>(...elements);
      expect(arr.length).assertEqual(1000);
      expect(arr[0]).assertEqual(0);
      expect(arr[999]).assertEqual(999);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest3200
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_3200
     * @tc.desc    Verify Array constructor with elements and then spread operator
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetSymbolIteratorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest3200';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<number>(1, 2, 3);
      const newArr = collections.Array.of<number>(...Array.from(arr), 4, 5);
      expect(newArr.length).assertEqual(5);
      expect(newArr[3]).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest3300
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_3300
     * @tc.desc    Verify Array constructor with elements and then JSON stringify
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL2
     */
    it('builtinsSetSymbolIteratorTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest3300';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<number | string>(1, 'two', 3);
      const json = JSON.stringify(Array.from(arr));
      expect(json).assertEqual('[1,"two",3]');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest3400
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_3400
     * @tc.desc    Verify Array constructor with elements and then isArray check
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest3400';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.of<number>(1, 2, 3);
      expect(Array.isArray(arr)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name    builtinsSetSymbolIteratorTest3500
     * @tc.number  SUB_BUILTINS_SET_SYMBOL_ITERATOR_TEST_3500
     * @tc.desc    Verify Array constructor with length and then isArray check
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   LEVEL1
     */
    it('builtinsSetSymbolIteratorTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'builtinsSetSymbolIteratorTest3500';
      console.info(`${caseName}, test start`);
      const arr = collections.Array.create<number>(5, 0);
      expect(Array.isArray(arr)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

  });
}
