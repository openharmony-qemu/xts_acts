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
import { Deque } from '@kit.ArkTS';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@ohos.base';
import Utils from '../Util.test';


interface Person {
  name: string;
  age: number;
}

interface SimpleObject {
  key: string;
  value: number;
}

interface Data {
  value: number;
}

export default function Deque01Test(): void {
  describe('Deque01Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (): Promise<void> => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await Utils.msSleep(10)
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_0100
     * @tc.name      testDeque01Has0001
     * @tc.desc      Check if Deque contains existing number element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0001';
        console.log(TAG + ' start');
        const deque = new Deque<number>();
        deque.insertFront(1);
        deque.insertEnd(2);
        deque.insertFront(3);
        const result = deque.has(2);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_0200
     * @tc.name      testDeque01Has0002
     * @tc.desc      Check if Deque contains non-existent number element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0002';
        console.log(TAG + ' start');
        const deque = new Deque<number>();
        deque.insertFront(1);
        deque.insertEnd(2);
        const result = deque.has(99);
        expect(result).assertFalse();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_0300
     * @tc.name      testDeque01Has0003
     * @tc.desc      Check if Deque contains string element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0003';
        console.log(TAG + ' start');
        const deque = new Deque<string>();
        deque.insertFront("squirrel");
        deque.insertEnd("rabbit");
        const result = deque.has("squirrel");
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_0400
     * @tc.name      testDeque01Has0004
     * @tc.desc      Check if Deque contains empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0004';
        console.log(TAG + ' start');
        const deque = new Deque<string>();
        deque.insertFront("");
        deque.insertEnd("text");
        const result = deque.has("");
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_0500
     * @tc.name      testDeque01Has0005
     * @tc.desc      Check if Deque contains boolean element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0005';
        console.log(TAG + ' start');
        const deque = new Deque<boolean>();
        deque.insertFront(true);
        deque.insertEnd(false);
        const result1 = deque.has(true);
        const result2 = deque.has(false);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_0600
     * @tc.name      testDeque01Has0006
     * @tc.desc      Check if Deque contains number special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0006';
        console.log(TAG + ' start');
        const deque = new Deque<number>();
        deque.insertFront(NaN);
        deque.insertEnd(Infinity);
        deque.insertFront(-Infinity);
        deque.insertEnd(Number.MAX_VALUE);
        let hasNaN = false;
        deque.forEach((value: number) => {
          if (Number.isNaN(value)) {
            hasNaN = true;
          }
        });
        const result2 = deque.has(Infinity);
        const result3 = deque.has(-Infinity);
        const result4 = deque.has(Number.MAX_VALUE);
        expect(hasNaN).assertTrue();
        expect(result2).assertTrue();
        expect(result3).assertTrue();
        expect(result4).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_0700
     * @tc.name      testDeque01Has0007
     * @tc.desc      Check if Deque contains number boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0007';
        console.log(TAG + ' start');
        const deque = new Deque<number>();
        deque.insertFront(0);
        deque.insertEnd(-0);
        deque.insertFront(Number.MIN_VALUE);
        deque.insertEnd(Number.EPSILON);
        deque.insertFront(Number.MAX_SAFE_INTEGER);
        const result1 = deque.has(0);
        const result2 = deque.has(-0);
        const result3 = deque.has(Number.MIN_VALUE);
        const result4 = deque.has(Number.EPSILON);
        const result5 = deque.has(Number.MAX_SAFE_INTEGER);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
        expect(result3).assertTrue();
        expect(result4).assertTrue();
        expect(result5).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_0800
     * @tc.name      testDeque01Has0008
     * @tc.desc      Check if Deque contains numbers in various formats
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0008';
        console.log(TAG + ' start');
        const deque = new Deque<number>();
        deque.insertFront(123.456);
        deque.insertEnd(0xcafebabe);
        deque.insertFront(0x0102);
        deque.insertEnd(0o777);
        deque.insertFront(2 ** 10);
        deque.insertEnd(1e6);
        const result1 = deque.has(123.456);
        const result2 = deque.has(0xcafebabe);
        const result3 = deque.has(0x0102);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
        expect(result3).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_0900
     * @tc.name      testDeque01Has0009
     * @tc.desc      Check if Deque contains BigInt element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0009';
        console.log(TAG + ' start');
        const deque = new Deque<bigint>();
        deque.insertFront(BigInt(9007199254740991));
        deque.insertEnd(16053919793946753758n);
        const result = deque.has(BigInt(9007199254740991));
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_1000
     * @tc.name      testDeque01Has0010
     * @tc.desc      Check if Deque contains string with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0010';
        console.log(TAG + ' start');
        const deque = new Deque<string>();
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        deque.insertFront(specialChars);
        const result = deque.has(specialChars);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_1100
     * @tc.name      testDeque01Has0011
     * @tc.desc      Check if Deque contains string with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0011';
        console.log(TAG + ' start');
        const deque = new Deque<string>();
        const emojis = "👆👿👀💯🎅";
        deque.insertFront(emojis);
        const result = deque.has(emojis);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_1200
     * @tc.name      testDeque01Has0012
     * @tc.desc      Check if Deque contains array element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0012';
        console.log(TAG + ' start');
        const deque = new Deque<number[]>();
        const array: number[] = [1, 2, 3];
        deque.insertFront(array);
        const result = deque.has(array);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_1300
     * @tc.name      testDeque01Has0013
     * @tc.desc      Check if Deque contains TypedArray element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0013';
        console.log(TAG + ' start');
        const deque = new Deque<Int8Array>();
        const typedArray = new Int8Array([-128, 0, 127]);
        deque.insertFront(typedArray);
        const result = deque.has(typedArray);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_1400
     * @tc.name      testDeque01Has0014
     * @tc.desc      Check if Deque contains null element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0014';
        console.log(TAG + ' start');
        const deque = new Deque<number | null>();
        deque.insertFront(null);
        deque.insertEnd(1);
        const result = deque.has(null);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_1500
     * @tc.name      testDeque01Has0015
     * @tc.desc      Check if Deque contains undefined element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0015';
        console.log(TAG + ' start');
        const deque = new Deque<number | undefined>();
        deque.insertFront(undefined);
        deque.insertEnd(1);
        const result = deque.has(undefined);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_1600
     * @tc.name      testDeque01Has0016
     * @tc.desc      Check if Deque contains custom object element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0016';
        console.log(TAG + ' start');
        const deque = new Deque<Person>();
        const person: Person = { name: "Alice", age: 25 };
        deque.insertFront(person);
        const result = deque.has(person);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_1700
     * @tc.name      testDeque01Has0017
     * @tc.desc      Check if Deque contains elements of multiple types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0017';
        console.log(TAG + ' start');
        const deque = new Deque<number | string | boolean | Object>();
        deque.insertFront(1);
        deque.insertEnd("text");
        deque.insertFront(true);
        const obj: SimpleObject = { key: "test", value: 100 };
        deque.insertEnd(obj);
        const result1 = deque.has(1);
        const result2 = deque.has("text");
        const result3 = deque.has(true);
        const result4 = deque.has(obj);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
        expect(result3).assertTrue();
        expect(result4).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_1800
     * @tc.name      testDeque01Has0018
     * @tc.desc      Check if Deque contains duplicate elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0018';
        console.log(TAG + ' start');
        const deque = new Deque<number>();
        deque.insertFront(1);
        deque.insertEnd(2);
        deque.insertFront(1); // 重复元素
        const result = deque.has(1);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_1900
     * @tc.name      testDeque01Has0019
     * @tc.desc      Check if empty Deque contains element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0019';
        console.log(TAG + ' start');
        const deque = new Deque<number>();
        const result = deque.has(1);
        expect(result).assertFalse();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_2000
     * @tc.name      testDeque01Has0020
     * @tc.desc      Check has method uses reference equality for objects in Deque
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0020';
        console.log(TAG + ' start');
        const deque = new Deque<Data>();
        const obj1: Data = { value: 1 };
        const obj2: Data = { value: 1 };
        deque.insertFront(obj1);
        const result1 = deque.has(obj1);
        const result2 = deque.has(obj2);
        expect(result1).assertTrue();
        expect(result2).assertFalse();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_2100
     * @tc.name      testDeque01Has0021
     * @tc.desc      Check if Deque contains element after removal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0021';
        console.log(TAG + ' start');
        const deque = new Deque<number>();
        deque.insertFront(1);
        deque.insertEnd(2);
        deque.insertFront(3);
        deque.popFirst();
        const result1 = deque.has(3);
        const result2 = deque.has(1);
        const result3 = deque.has(2);
        expect(result1).assertFalse();
        expect(result2).assertTrue();
        expect(result3).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTONE_2200
     * @tc.name      testDeque01Has0022
     * @tc.desc      Check has for elements inserted from both ends
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeque01Has0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01Has0022';
        console.log(TAG + ' start');
        const deque = new Deque<number>();
        deque.insertFront(1);
        deque.insertEnd(2);
        deque.insertFront(3);
        deque.insertEnd(4);
        const result1 = deque.has(1);
        const result2 = deque.has(2);
        const result3 = deque.has(3);
        const result4 = deque.has(4);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
        expect(result3).assertTrue();
        expect(result4).assertTrue();
        console.log(TAG + ' done');

      });

  })
}