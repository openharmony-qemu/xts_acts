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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach,afterEach,afterAll} from '../../../../hypium/index';
import Deque  from '@ohos.util.Deque';
import Utils from '../Util.test';
class TestObject {
  a?: number;
  b?: string;
  c?: number[];
  name?: string;
  age?: string;
  test?: string;
  key?: string;
  small?: string;
  visible?: string;
  simple?: string;
  childProp?: number;
  parentProp?: number;
  first?: boolean;
  original?: string;
  hidden?: string;
  last?: string;
}
class ArrayLikeObject {
  zero?: number;
  one?: number;
  two?: number;
  three?: number;
  four?: number;
  five?: number;
  six?: number;
  seven?: number;
  eight?: number;
  nine?: number;
  abc?: number;
  aaa?: number;
}
class MixedKeyObject {
  a: number = 0;
  b: number = 0;
}
class ComplexObject {
  simple?: string;
  childProp?: number;
  parentProp?: number;
  last?: string;
}
class ObjectWithBuiltins {
  last?: boolean;
  first?: boolean;
}
class DeleteTestObject {
  a?: number;
  b?: number;
  original?: string;
  last?: string;
}
class CallbackContext {
  count: number = 0;
  values: number[] = [];
  indices: number[] = [];

  callback = (value: number, index: number): void => {
    this.count++;
    this.values.push(value);
    this.indices.push(index);
  }
}
type MixedType = string | number;


export default function Deque05Test(): void {
  describe('Deque05Test', () => {
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
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_0100
     * @tc.name      testDeque04ForEach0019
     * @tc.desc      test Deque forEach with Number type - boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0019';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        const boundaryNumbers = [
          Number.MAX_VALUE,
          Number.MIN_VALUE,
          Number.EPSILON,
          Number.MAX_SAFE_INTEGER,
          Math.floor(1.5),
          123.456
        ];
        boundaryNumbers.forEach(num => deque.insertEnd(num));
        let max = -Infinity;
        let min = Infinity;
        deque.forEach((value: number) => {
          if (value > max) max = value;
          if (value < min) min = value;
        });
        expect(max).assertEqual(Number.MAX_VALUE);
        expect(min).assertEqual(Number.MIN_VALUE);
        console.info("forEach Number boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_0200
     * @tc.name      testDeque04ForEach0020
     * @tc.desc      test Deque forEach with Number type - different numeric representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0020';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertEnd(0xDECAFABCDE);
        deque.insertEnd(0x0102);
        deque.insertEnd(0x01020304);
        deque.insertEnd(0o3);
        deque.insertEnd(2 ** 3);
        deque.insertEnd(1e3);
        deque.insertEnd(2.5e-2);
        deque.insertEnd(9007199254740991);
        let sum = 0;
        let count = 0;
        deque.forEach((value: number, index) => {
          sum += value;
          count++;
          console.info(`Index ${index}: ${value}`);
        });
        expect(count).assertEqual(8);
        expect(sum > 0).assertTrue();
        console.info("forEach Number representations test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_0300
     * @tc.name      testDeque04ForEach0021
     * @tc.desc      test Deque forEach with BigInt type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0021';
        console.log(TAG + ' start');
        let deque: Deque<bigint> = new Deque<bigint>();
        deque.insertEnd(BigInt("0xdecafafecacefade"));
        deque.insertEnd(9007199254740991n);
        deque.insertEnd(-9223372036854775808n);
        deque.insertEnd(9223372036854775807n);
        deque.insertEnd(0n);
        let visitedValues: bigint[] = [];
        deque.forEach((value: bigint, index) => {
          visitedValues.push(value);
          console.info(`Index ${index}: ${value}`);
        });
        expect(visitedValues.length).assertEqual(5);
        expect(visitedValues[2]).assertEqual(-9223372036854775808n);
        expect(visitedValues[3]).assertEqual(9223372036854775807n);
        console.info("forEach BigInt test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_0400
     * @tc.name      testDeque04ForEach0022
     * @tc.desc      test Deque forEach with Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0022';
        console.log(TAG + ' start');
        let deque: Deque<boolean> = new Deque<boolean>();
        deque.insertEnd(true);
        deque.insertEnd(false);
        deque.insertEnd(false);
        deque.insertEnd(true);
        deque.insertEnd(true);
        let trueCount = 0;
        let falseCount = 0;
        deque.forEach((value: boolean, index) => {
          if (value) {
            trueCount++;
          } else {
            falseCount++;
          }
        });
        expect(trueCount).assertEqual(3);
        expect(falseCount).assertEqual(2);
        console.info("forEach Boolean test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_0500
     * @tc.name      testDeque04ForEach0023
     * @tc.desc      test Deque forEach with Array type - normal arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0023';
        console.log(TAG + ' start');
        let deque: Deque<number[]> = new Deque<number[]>();
        deque.insertEnd([72, 101, 108, 108, 111]);
        deque.insertEnd([87, 111, 114, 108, 100]);
        deque.insertEnd([49, 50, 51]);
        deque.insertEnd([52, 53, 54]);
        let totalLength = 0;
        let firstChars: string = "";
        deque.forEach((value, index, dq): void => {
          totalLength += value.length;
          if (value.length > 0) {
            let charCode: number = value[0];
            if (charCode != null && charCode >= 32 && charCode <= 126) {
              firstChars += String.fromCharCode(charCode.toInt());
            } else if (charCode != null) {
              firstChars += `[${charCode}]`;
            }
          }
        });
        expect(totalLength).assertEqual(5 + 5 + 3 + 3);
        expect(firstChars).assertEqual("HW14");
        console.info("forEach Array test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_0600
     * @tc.name      testDeque04ForEach0024
     * @tc.desc      test Deque forEach with custom object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0024';
        console.log(TAG + ' start');
        let deque: Deque<ArrayLikeObject> = new Deque<ArrayLikeObject>();
        const obj1 = new ArrayLikeObject();
        obj1.zero = 333;
        obj1.abc = 111;
        obj1.aaa = 222;
        const obj2 = new ArrayLikeObject();
        obj2.zero = 999;
        deque.insertEnd(obj1);
        deque.insertEnd(obj2);
        let totalValue = 0;
        deque.forEach((value: ArrayLikeObject, index, dq) => {
          if (value.zero != null) {
            totalValue += value.zero as number;
          }
        });
        expect(totalValue).assertEqual(333 + 999);
        console.info("forEach custom object test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_0700
     * @tc.name      testDeque04ForEach0025
     * @tc.desc      test Deque forEach with TestObject type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0025';
        console.log(TAG + ' start');
        let deque: Deque<TestObject> = new Deque<TestObject>();
        const obj1 = new TestObject();
        obj1.a = 1;
        obj1.b = "test";
        obj1.c = [1, 2, 3];
        const obj2 = new TestObject();
        obj2.test = "first";
        const obj3 = new TestObject();
        obj3.name = "John";
        obj3.age = "30";
        deque.insertEnd(obj1);
        deque.insertEnd(obj2);
        deque.insertEnd(obj3);
        let objectCount = 0;
        let hasTestProperty = false;
        let hasNameProperty = false;
        deque.forEach((value: TestObject, index) => {
          objectCount++;
          if (value.test) hasTestProperty = true;
          if (value.name) hasNameProperty = true;
          console.info(`Index ${index}: ${JSON.stringify(value)}`);
        });
        expect(objectCount).assertEqual(3);
        expect(hasTestProperty).assertTrue();
        expect(hasNameProperty).assertTrue();
        console.info("forEach TestObject test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_0800
     * @tc.name      testDeque04ForEach0026
     * @tc.desc      test Deque forEach with thisArg parameter using arrow function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0026';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertEnd(10);
        deque.insertEnd(20);
        deque.insertEnd(30);
        const context = new CallbackContext();
        deque.forEach((value: number, index) => {
          context.callback(value, index);
        });
        expect(context.count).assertEqual(3);
        expect(context.values).assertDeepEquals([10.0, 20.0, 30.0]);
        expect(context.indices).assertDeepEquals([0.0, 1.0, 2.0]);
        console.info("forEach with arrow function test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_0900
     * @tc.name      testDeque04ForEach0027
     * @tc.desc      test Deque forEach with empty deque
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0027';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        let callbackCalled = false;
        deque.forEach(() => {
          callbackCalled = true;
        });
        expect(callbackCalled).assertFalse();
        expect(deque.length).assertEqual(0);
        console.info("forEach with empty deque test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_1000
     * @tc.name      testDeque04ForEach0028
     * @tc.desc      test Deque forEach with documentation example
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0028';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertFront(2);
        deque.insertEnd(3);
        deque.insertFront(1);
        deque.insertEnd(4);
        let visitedValues: number[] = [];
        let visitedIndices: number[] = [];
        deque.forEach((value: number, index): void => {
          visitedValues.push(value);
          visitedIndices.push(index);
          console.info("value:" + value, "index:" + index);
        });
        expect(visitedValues).assertDeepEquals([1.0, 2.0, 3.0, 4.0]);
        expect(visitedIndices).assertDeepEquals([0.0, 1.0, 2.0, 3.0]);
        console.info("forEach documentation example test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_1100
     * @tc.name      testDeque04ForEach0029
     * @tc.desc      test Deque forEach with large number of elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0029';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        const largeCount = 100;
        for (let i = 0; i < largeCount; i++) {
          deque.insertEnd(i);
        }
        let sum = 0;
        let count = 0;
        deque.forEach((value: number, index) => {
          sum += value;
          count++;
          expect(index).assertEqual(value);
        });
        expect(count).assertEqual(largeCount);
        expect(sum).assertEqual((largeCount - 1) * largeCount / 2);
        console.info(`forEach large number (${largeCount}) of elements test passed`);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_1200
     * @tc.name      testDeque04ForEach0030
     * @tc.desc      test Deque forEach with treeString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0030';
        console.log(TAG + ' start');
        const createTreeString = (size: number): string => {
          let ans = '[';
          while (ans.length < size) {
            ans += '{"a":1},';
          }
          ans += '{"a":1}]';
          return ans;
        };
        let deque: Deque<string> = new Deque<string>();
        const treeString = createTreeString(500);
        const normalString = "a".repeat(500);
        const controlString = "control";
        const treeStringLength = treeString.length;
        const normalStringLength = normalString.length;
        const controlStringLength = controlString.length;
        console.info(`treeString length: ${treeStringLength}`);
        console.info(`normalString length: ${normalStringLength}`);
        console.info(`controlString length: ${controlStringLength}`);
        deque.insertEnd(treeString);
        deque.insertEnd(normalString);
        deque.insertEnd(controlString);
        let totalLength = 0;
        deque.forEach((value: string) => {
          totalLength += value.length;
        });
        const expectedTotalLength = treeStringLength + normalStringLength + controlStringLength;
        console.info(`Total length: ${totalLength}, Expected: ${expectedTotalLength}`);
        expect(totalLength).assertEqual(expectedTotalLength);
        console.info("forEach treeString test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_1300
     * @tc.name      testDeque04ForEach0031
     * @tc.desc      test Deque forEach with sliceString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0031';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const original = "{k1:value1,k2:value2}";
        let sliceResult = original.substring(0, original.length - 2);
        for (let i = 0; i < 3; i++) {
          sliceResult = sliceResult.substring(0, sliceResult.length - 1);
          deque.insertEnd(sliceResult);
        }
        deque.insertEnd("original");
        let shortestLength = Infinity;
        let longestLength = 0;
        deque.forEach((value: string) => {
          if (value.length < shortestLength) shortestLength = value.length;
          if (value.length > longestLength) longestLength = value.length;
        });
        expect(shortestLength < longestLength).assertTrue();
        console.info("forEach sliceString test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_1400
     * @tc.name      testDeque04ForEach0032
     * @tc.desc      test Deque forEach with illegal Unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0032';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const illegalUnicode = ["\\udc04", "\\ud83d", "\\udff4"];
        for (const code of illegalUnicode) {
          deque.insertEnd(code);
        }
        deque.insertEnd("safe");
        let containsIllegal = false;
        let containsSafe = false;
        deque.forEach((value: string) => {
          if (value.includes("\\u")) containsIllegal = true;
          if (value === "safe") containsSafe = true;
        });
        expect(containsIllegal).assertTrue();
        expect(containsSafe).assertTrue();
        console.info("forEach illegal Unicode test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_1500
     * @tc.name      testDeque04ForEach0033
     * @tc.desc      test Deque forEach with NaN/Infinity arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0033';
        console.log(TAG + ' start');
        let deque: Deque<number[]> = new Deque<number[]>();
        deque.insertEnd([72, 101, NaN, Infinity, 108, 111]);
        deque.insertEnd([]);
        deque.insertEnd([256, 65536, 32768]);
        let totalElements = 0;
        let hasNaN = false;
        let hasInfinity = false;
        deque.forEach((value: number[]) => {
          totalElements += value.length;
          value.forEach(num => {
            if (Number.isNaN(num)) hasNaN = true;
            if (num === Infinity) hasInfinity = true;
          });
        });
        expect(totalElements).assertEqual(6 + 0 + 3);
        expect(hasNaN).assertTrue();
        expect(hasInfinity).assertTrue();
        console.info("forEach special arrays test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_1600
     * @tc.name      testDeque04ForEach0034
     * @tc.desc      test Deque forEach with different numeric ranges
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0034';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        const testNumbers = [
          -128, 127,
          -32768, 32767,
          -2147483648, 2147483647,
          0, 65535,
          1.40129846432481707e-45,
          3.40282346638528860e38,
          123.456,
          0xDECAFABCDE,
          0x0102,
          0x01020304,
          0o3,
          2 ** 3,
          1e3,
          2.5e-2,
          9007199254740991
        ];
        testNumbers.forEach(num => deque.insertEnd(num));
        let count = 0;
        let hasNegative = false;
        let hasHex = false;
        let hasScientific = false;
        deque.forEach((value: number) => {
          count++;
          if (value < 0) hasNegative = true;
          if (value === 0x0102) hasHex = true;
          if (value === 1e3) hasScientific = true;
        });
        expect(count).assertEqual(testNumbers.length);
        expect(hasNegative).assertTrue();
        expect(hasHex).assertTrue();
        expect(hasScientific).assertTrue();
        console.info("forEach different numeric ranges test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_1700
     * @tc.name      testDeque04ForEach0035
     * @tc.desc      test Deque forEach with mixed object types using arrow function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0035';
        console.log(TAG + ' start');
        let deque: Deque<MixedType> = new Deque<MixedType>();
        deque.insertEnd("string value");
        deque.insertEnd(123.456);
        deque.insertEnd("another string");
        deque.insertEnd(789);
        let stringCount = 0;
        let numberCount = 0;
        deque.forEach((value: MixedType) => {
          if (typeof value === 'string') stringCount++;
          else if (typeof value === 'number') numberCount++;
        });
        expect(stringCount).assertEqual(2);
        expect(numberCount).assertEqual(2);
        console.info("forEach mixed object types test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_1800
     * @tc.name      testDeque04ForEach0036
     * @tc.desc      test Deque forEach performance with moderate size strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0036';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const moderateString = "a".repeat(500);
        console.info("Creating and inserting string of length:", moderateString.length);
        for (let i = 0; i < 10; i++) {
          deque.insertEnd(moderateString + i);
        }
        deque.insertEnd("small");
        let totalLength = 0;
        let count = 0;
        deque.forEach((value: string) => {
          totalLength += value.length;
          count++;
        });
        expect(count).assertEqual(11);
        expect(totalLength > 500 * 10).assertTrue();
        console.info("forEach moderate size strings test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_UTIL_DEQUE_TESTFIVE_1900
     * @tc.name      testDeque04ForEach0037
     * @tc.desc      test Deque forEach with arrow function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0037';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertEnd(1);
        deque.insertEnd(2);
        deque.insertEnd(3);
        let arrowFunctionCount = 0;
        deque.forEach((value: number, index) => {
          arrowFunctionCount++;
          expect(value).assertEqual(index + 1);
        });
        expect(arrowFunctionCount).assertEqual(3);
        console.info("forEach with arrow function test passed");
        console.log(TAG + ' done');
        
      });
  })
}