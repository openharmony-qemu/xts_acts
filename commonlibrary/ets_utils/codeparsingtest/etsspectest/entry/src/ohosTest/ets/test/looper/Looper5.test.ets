/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  getLooper5Fn1,
  getLooper5Fn10,
  getLooper5Fn11,
  getLooper5Fn12,
  getLooper5Fn13,
  getLooper5Fn2,
  getLooper5Fn3,
  getLooper5Fn4,
  getLooper5Fn5,
  getLooper5Fn6,
  getLooper5Fn7,
  getLooper5Fn8,
  getLooper5Fn8_1,
  getLooper5Fn9
} from './looper5';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function looper5Test() {
  describe('looper5Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_0100
     * @tc.name: testLoop5_001
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const numbers = [1, 2, 3, 4, 5, 6];
      const evenNums = numbers.filter(num => num % 2 === 0);
      for (let i = 0; i < evenNums.length; i++) {
        list.push(evenNums[i]**2);
      }
      expect(list.toString()).assertEqual('4,16,36');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_0200
     * @tc.name: testLoop5_002
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper5Fn1();
      expect(list.toString()).assertEqual('2,1,2,3,2,5,2,7,2,9');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_0300
     * @tc.name: testLoop5_003
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper5Fn2();
      expect(list.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_0500
     * @tc.name: testLoop5_005
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30, 40];
      const first = arr[0];
      for (let i = 0; i < arr.length - 1; i++) {
        arr[i] = arr[i + 1];
      }
      arr[arr.length - 1] = first;
      expect(arr.toString()).assertEqual('20,30,40,10');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_0600
     * @tc.name: testLoop5_006
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper5Fn3();
      expect(list.toString()).assertEqual('1,1 1,1 2 1,1 2 4 1,1 2 4 8 1');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_0700
     * @tc.name: testLoop5_007
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const arr = [1, 2, 3];
      for (let i = 0; i <= arr.length; i++) {
        try {
          list.push(i);
          list.push(arr[i]);
        } catch (e) {
          list.push(i);
          list.push(e.message);
          break;
        }
      }
      expect(list.toString()).assertEqual('0,1,1,2,2,3,3,');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_0800
     * @tc.name: testLoop5_008
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper5Fn4();
      expect(list.toString()).assertEqual('7,8,9,10');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_0900
     * @tc.name: testLoop5_009
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper5Fn4();
      expect(list.toString()).assertEqual('7,8,9,10');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_1000
     * @tc.name: testLoop5_010
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      for (let i = 0, j = 10; i <= 5; i++, j -= 2) {
        list.push(i);
        list.push(j);
        list.push(i + j);
      }
      expect(list.toString()).assertEqual('0,10,10,1,8,9,2,6,8,3,4,7,4,2,6,5,0,5');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_1100
     * @tc.name: testLoop5_011
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper5Fn5();
      expect(list.toString()).assertEqual('85,90');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_1200
     * @tc.name: testLoop5_012
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper5Fn6();
      expect(list.toString()).assertEqual('Alice');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_1300
     * @tc.name: testLoop5_013
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string[]>();
      const target = 'apple';
      const fruits = ['banana', 'apple', 'orange', 'grape'];
      for (let i = 0; fruits.includes(target) && i < fruits.length; i++) {
        if (fruits[i] === target) {
          fruits.splice(i, 1);
          i--;
        }
        list.push(fruits);
      }
      expect(list.toString()).assertEqual('banana,orange,grape,banana,orange,grape');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_1400
     * @tc.name: testLoop5_014
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper5Fn7();
      expect(list.toString()).assertEqual('dlrow olleh');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_1500
     * @tc.name: testLoop5_015
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let count = 0;
      for (let i = 0; i <= 10; i += getStep(count++)) {
        list.push(i);
        list.push(count);
      }
      expect(list.toString()).assertEqual('0,0,1,1,3,2,4,3,6,4,7,5,9,6,10,7');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_1800
     * @tc.name: testLoop5_018
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper5Fn8();
      expect(list.toString()).assertEqual('2');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_1900
     * @tc.name: testLoop5_019
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper5Fn8_1();
      expect(list.toString()).assertEqual('1,4,7,2,5,8,3,6,9');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_2000
     * @tc.name: testLoop5_020
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper5Fn9();
      expect(list.toString()).assertEqual('electronics,1,phone,clothes,2,shirt,electronics,3,laptop');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_2100
     * @tc.name: testLoop5_021
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper5Fn10();
      expect(list.toString()).assertEqual('123,Error,12345,Error,123456,successfully');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_2200
     * @tc.name: testLoop5_022
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper5Fn11();
      expect(list.toString()).assertEqual('0,1,1,2,3,5,8,13,21,34');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_2400
     * @tc.name: testLoop5_024
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper5Fn12();
      expect(list.toString()).assertEqual('2,4');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_2600
     * @tc.name: testLoop5_026
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sum = 0;
      let num = 1;
      do {
        sum += num;
        console.log(`Adding ${num}, current sum: ${sum}`);
        num++;
      } while (sum <= 100);
      console.log(`Sum exceeded 100, final sum: ${sum}, final num: ${num - 1}`);
      expect(num).assertEqual(15);
      expect(sum).assertEqual(105);
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_LOOPER5_2700
     * @tc.name: testLoop5_027
     * @tc.desc: Test looper
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testLoop5_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper5Fn13();
      expect(list.toString()).assertEqual('el1,el3,[object Object],[object Object],[object Object]');
    });

  })
}

function getStep(count: number) {
  return count % 2 === 0 ? 1 : 2;
}