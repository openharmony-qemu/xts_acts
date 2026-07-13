'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class ComboObjarr {
  id: int = 1;
}

class ReadonlyArrayReduceRightGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayReduceRightTest(): void {
  describe('ReadonlyArrayReduceRightTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_0100
     * @tc.name testReadonlyArrayReduceRight001
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: passing callback initialValue reduce Right after element is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.reduceRight((previous: int, current: int): int => {
        return previous + current;
      });
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_0200
     * @tc.name testReadonlyArrayReduceRight002
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: passing callback reduce Right initialValue is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.reduceRight((previous: int, current: int): int => {
          return previous + current;
      }, 10);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_0300
     * @tc.name testReadonlyArrayReduceRight003
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: callbackfn callback previous current parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.reduceRight((previous: int, current: int): int => {
        return previous - current;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_0400
     * @tc.name testReadonlyArrayReduceRight004
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: callbackfn callback parameter previousValue, currentValue, currentIndex, array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.reduceRight((previous: int, current: int, currentIndex: int, array: ReadonlyArray<int>): int => {
          return previous + current + currentIndex;
      }, 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_0500
     * @tc.name testReadonlyArrayReduceRight005
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: verify callback previous parameter is callback return value or initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const collected: Array<int> = [];
      values.reduceRight((previous: int, current: int): int => {
        collected.push(previous);
        return previous + current;
      }, 0);
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(3);
      expect(collected[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_0600
     * @tc.name testReadonlyArrayReduceRight006
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: verify callback current parameter is before iteration element iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const collected: Array<int> = [];
      values.reduceRight((previous: int, current: int): int => {
        collected.push(current);
        return previous + current;
      }, 0);
      expect(collected[0]).assertEqual(30);
      expect(collected[1]).assertEqual(20);
      expect(collected[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_0700
     * @tc.name testReadonlyArrayReduceRight007
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: verify callback currentIndex parameter is before element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const indices: Array<int> = [];
      values.reduceRight((previous: int, current: int, currentIndex: int): int => {
        indices.push(currentIndex);
        return previous + current;
      }, 0);
      expect(indices[0]).assertEqual(2);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_0800
     * @tc.name testReadonlyArrayReduceRight008
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: verify callback array parameter is original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let arrayMatch = false;
      values.reduceRight((previous: int, current: int, currentIndex: int, array: ReadonlyArray<int>): int => {
        if (currentIndex === 2) {
          arrayMatch = (array.length === values.length && array[0] === values[0]);
        }
        return previous + current;
      }, 0);
      expect(arrayMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_0900
     * @tc.name testReadonlyArrayReduceRight009
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: initialValue passing verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.reduceRight((previous: int, current: int): int => {
          return previous + current;
      }, -10);
      expect(result).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_1000
     * @tc.name testReadonlyArrayReduceRight010
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: verify result correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.reduceRight((previous: int, current: int): int => {
          return previous + current;
      }, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_1100
     * @tc.name testReadonlyArrayReduceRight011
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: initialValue when initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.reduceRight((previous: int, current: int): int => {
          return previous * 10 + current;
      }, 0);
      expect(result).assertEqual(321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_1200
     * @tc.name testReadonlyArrayReduceRight012
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: initialValue when reduce Right after element is element iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4];
      const result = values.reduceRight((previous: int, current: int): int => {
        return previous - current;
      });
      expect(result).assertEqual(((4 - 3) - 2) - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_1300
     * @tc.name testReadonlyArrayReduceRight013
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: string result and reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<String> = ["a", "b", "c"];
      const reduceRightResult = values.reduceRight((previous: String, current: String): String => {
          return previous + current;
      }, "");
      expect(reduceRightResult).assertEqual("cba");
      const reduceResult = values.reduce((previous: String, current: String): String => {
          return previous + current;
      }, "");
      expect(reduceResult).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_1400
     * @tc.name testReadonlyArrayReduceRight014
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: empty array reduce Right and passing initialValue returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const result = values.reduceRight((previous: int, current: int): int => {
          return previous + current;
      }, 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_1500
     * @tc.name testReadonlyArrayReduceRight015
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: element initialValue returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [99];
      const result = values.reduceRight((previous: int, current: int): int => {
        return previous + current;
      });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_1600
     * @tc.name testReadonlyArrayReduceRight016
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: element passing initialValue callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5];
      const result = values.reduceRight((previous: int, current: int): int => {
          return previous + current;
      }, 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_1700
     * @tc.name testReadonlyArrayReduceRight017
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: verify reduce Right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4];
      const result = values.reduceRight((previous: int, current: int): int => {
        return previous - current;
      });
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_1800
     * @tc.name testReadonlyArrayReduceRight018
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: verify reduce Right return value is callback after return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const result = values.reduceRight((previous: int, current: int): int => {
          return previous + current;
      }, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_1900
     * @tc.name testReadonlyArrayReduceRight019
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduce Right reduce verify result different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const reduceRightResult = values.reduceRight((previous: int, current: int): int => {
        return previous - current;
      });
      const reduceResult = values.reduce((previous: int, current: int): int => {
        return previous - current;
      });
      expect(reduceRightResult).assertEqual(0);
      expect(reduceResult).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_2000
     * @tc.name testReadonlyArrayReduceRight020
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: empty array initialValue reduce Right throws an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      try {
        values.reduceRight((previous: int, current: int): int => {
          return previous + current;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_2100
     * @tc.name testReadonlyArrayReduceRight021
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: 0 when verify reduce Right result correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0, -1, 5, -3];
      const result = values.reduceRight((previous: int, current: int): int => {
          return previous + current;
      }, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_2200
     * @tc.name testReadonlyArrayReduceRight022
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: verify reduce Right return value type and element type T
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.reduceRight((previous: int, current: int): int => {
          return previous + current;
      }, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_2300
     * @tc.name testReadonlyArrayReduceRight023
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: ReadonlyArray <String> type reduce Right return value is String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<String> = ["a", "b", "c"];
      const result = values.reduceRight((previous: String, current: String): String => {
          return previous + current;
      }, "");
      expect(result).assertEqual("cba");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_2400
     * @tc.name testReadonlyArrayReduceRight024
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: large array 100 element verify result correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<int> = [];
      for (let i = 1; i <= 100; i++) {
        values.push(i);
      }
      const result = values.reduceRight((previous: int, current: int): int => {
          return previous + current;
      }, 0);
      expect(result).assertEqual(5050);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_2500
     * @tc.name testReadonlyArrayReduceRight025
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: element is 0 verify reduce Right result is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0, 0, 0, 0, 0];
      const result = values.reduceRight((previous: int, current: int): int => {
          return previous + current;
      }, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_2600
     * @tc.name testReadonlyArrayReduceRight026
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduce Right after original array length content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const originalLength = values.length;
      values.reduceRight((previous: int, current: int): int => {
          return previous + current;
      }, 0);
      expect(values.length).assertEqual(originalLength);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_2700
     * @tc.name testReadonlyArrayReduceRight027
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: callbackfn callback throws an exception when reduce Right break and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      try {
        values.reduceRight((previous: int, current: int): int => {
          if (current === 2) {
            throw new Error("Test error in callback");
          }
          return previous + current;
        }, 0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_2800
     * @tc.name testReadonlyArrayReduceRight028
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: verify initialValue when callbackfn length initialValue when length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4];
      let callCount: int = 0;
      values.reduceRight((previous: int, current: int): int => {
        callCount++;
        return previous + current;
      }, 0);
      expect(callCount).assertEqual(4);
      let callCount2: int = 0;
      values.reduceRight((previous: int, current: int): int => {
        callCount2++;
        return previous + current;
      });
      expect(callCount2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_2900
     * @tc.name testReadonlyArrayReduceRight029
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: non - verify reduce Right reduce different result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2, 3, 4];
      const reduceRightResult = values.reduceRight((previous: int, current: int): int => {
        return previous - current;
      });
      const reduceResult = values.reduce((previous: int, current: int): int => {
        return previous - current;
      });
      expect(reduceRightResult).assertEqual(-1);
      expect(reduceResult).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_3000
     * @tc.name testReadonlyArrayReduceRight030
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: and API a, b, c. reduce Right returns cba
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<String> = ["a", "b", "c"];
      const result = values.reduceRight((previous: String, current: String): String => {
          return previous + current;
      }, "");
      expect(result).assertEqual("cba");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_3100
     * @tc.name testReadonlyArrayReduceRight031
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: ReadonlyArray <boolean> reduce Right or
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const allFalse: ReadonlyArray<boolean> = [false, false, false];
      const mixed: ReadonlyArray<boolean> = [false, true, false];
      const orAll = allFalse.reduceRight((prev: boolean, cur: boolean): boolean => {
          return prev || cur;
      }, false);
      const orMixed = mixed.reduceRight((prev: boolean, cur: boolean): boolean => {
          return prev || cur;
      }, false);
      expect(orAll).assertFalse();
      expect(orMixed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_3200
     * @tc.name testReadonlyArrayReduceRight032
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduce int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.reduceRight((prev: int, cur: int): int => {
          return prev + cur;
      }, 0);
      expect(result).assertEqual(0x10 + 0o10 + 0b10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_3300
     * @tc.name testReadonlyArrayReduceRight033
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduce empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["", "mid", ""];
      const result = arr.reduceRight((prev: string, cur: string): string => {
          return prev + cur;
      }, "x");
      expect(result).assertEqual("xmid");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_3400
     * @tc.name testReadonlyArrayReduceRight034
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduce Right byte type ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte];
      const result = arr.reduceRight((p: int, c: byte, index: int, array: ReadonlyArray<byte>): int => {
          return p + c;
      }, 0);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_3500
     * @tc.name testReadonlyArrayReduceRight035
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduce Right short type ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [100 as short, 200 as short];
      const result = arr.reduceRight((p: int, c: short, index: int, array: ReadonlyArray<short>): int => {
          return p + c;
      }, 0);
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_3600
     * @tc.name testReadonlyArrayReduceRight036
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduce Right long type ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [100, 200];
      const result = arr.reduceRight((p: long, c: long): long => {
          return p + c;
      }, 0);
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_3700
     * @tc.name testReadonlyArrayReduceRight037
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduce Right float type ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, 2.0f, 3.0f];
      const result = arr.reduceRight((p: float, c: float, index: int, array: ReadonlyArray<float>): float => {
          return p + c;
      }, 0.0f);
      expect(result).assertClose(6.0, 0.0001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_3800
     * @tc.name testReadonlyArrayReduceRight038
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduce Right string - emoji type ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "\uD83D\uDE00"];
      const result = arr.reduceRight((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("\uD83D\uDE00x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_3900
     * @tc.name testReadonlyArrayReduceRight039
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduce Right string - jp type ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["テスト", "!"];
      const result = arr.reduceRight((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("!テスト");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_4000
     * @tc.name testReadonlyArrayReduceRight040
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduce Right boolean type ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const result = arr.reduceRight((p: int, c: boolean, index: int, array: ReadonlyArray<boolean>): int => {
          return p + (c ? 1 : 0);
      }, 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_4100
     * @tc.name testReadonlyArrayReduceRight041
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: 100 element int reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      for (let i: int = 1; i <= 100; i++) { (arr as Array<int>).push(i); }
      const result = arr.reduceRight((p: int, c: int): int => {
          return p + c;
      }, 0);
      expect(result).assertEqual(5050);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_4200
     * @tc.name testReadonlyArrayReduceRight042
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: long reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [0, 9223372036854775807];
      const result = arr.reduceRight((p: long, c: long): long => {
          return p + c;
      }, 0);
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_4300
     * @tc.name testReadonlyArrayReduceRight043
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: float reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, Double.toFloat(Number.POSITIVE_INFINITY)];
      const result = arr.reduceRight((p: float, c: float, index: int, array: ReadonlyArray<float>): float => {
          return p + c;
      }, 0.0f);
      expect(result).assertEqual(Double.toFloat(Number.POSITIVE_INFINITY));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_4400
     * @tc.name testReadonlyArrayReduceRight044
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["13800138000", "x"];
      const result = arr.reduceRight((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("x13800138000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_4500
     * @tc.name testReadonlyArrayReduceRight045
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["@", "test@example.com"];
      const result = arr.reduceRight((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("test@example.com@");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_4600
     * @tc.name testReadonlyArrayReduceRight046
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: tab string reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\t", "\n"];
      const result = arr.reduceRight((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("\n\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_4700
     * @tc.name testReadonlyArrayReduceRight047
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: long reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [-9223372036854775808, 0];
      const result = arr.reduceRight((p: long, c: long): long => {
          return p + c;
      }, 0);
      expect(result).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_4800
     * @tc.name testReadonlyArrayReduceRight048
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: string reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "АБВГД"];
      const result = arr.reduceRight((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("АБВГДx");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_4900
     * @tc.name testReadonlyArrayReduceRight049
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: string reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["y", "Test 測試"];
      const result = arr.reduceRight((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("Test 測試y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_5000
     * @tc.name testReadonlyArrayReduceRight050
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduce element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.reduceRight((p: int, c: int): int => {
        return p + c;
      });
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_5100
     * @tc.name testReadonlyArrayReduceRight051
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: 8 string reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["0x", "0123"];
      const result = arr.reduceRight((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("01230x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_5200
     * @tc.name testReadonlyArrayReduceRight052
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: 2 string reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["bin:", "0b1010"];
      const result = arr.reduceRight((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("0b1010bin:");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_5300
     * @tc.name testReadonlyArrayReduceRight053
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: string reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["—", "-"];
      const result = arr.reduceRight((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("-—");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_5400
     * @tc.name testReadonlyArrayReduceRight054
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduceRight float NaN without initial on single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [nan];
      const result = arr.reduceRight((prev: float, cur: float): float => {
        return prev + cur;
      });
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_5500
     * @tc.name testReadonlyArrayReduceRight055
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduceRight double NaN accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, 2.0f];
      const nanF: float = Double.toFloat(Number.NaN);
      const result = arr.reduceRight((prev: float, cur: float, index: int, array: ReadonlyArray<float>): float => {
          return prev + cur;
      }, nanF);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_5600
     * @tc.name testReadonlyArrayReduceRight056
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: string reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["—", "-"];
      const result = arr.reduceRight((p: string, c: string): string => p + c, "");
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_5700
     * @tc.name testReadonlyArrayReduceRight057
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduceRight float NaN without initial on single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [nan];
      const result = arr.reduceRight((prev: float, cur: float): float => prev + cur);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_5800
     * @tc.name testReadonlyArrayReduceRight058
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: reduceRight double NaN accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<float> = [1.0f, 2.0f];
      const nanF: float = Double.toFloat(Number.NaN);
      const result = arr.reduceRight((prev: float, cur: float, index: int, array: ReadonlyArray<float>): float => prev + cur, nanF);
      expect(Number.isNaN(result)).assertTrue();
    });











    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_5900
     * @tc.name testReadonlyArrayReduceRight059
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: initialValue empty array - Error ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      try {
        arr.reduceRight((prev: int, cur: int): int => prev + cur);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_6000
     * @tc.name testReadonlyArrayReduceRight060
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      arr.reduceRight((prev: int, cur: int): int => prev + cur, 0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_6100
     * @tc.name testReadonlyArrayReduceRight061
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      const order: Array<int> = [];
      const result = arr.reduceRight((prev: int, cur: int): int => {
        order.push(cur);
        return prev + cur;
      }, 0);
      expect(result).assertEqual(30);
      expect(order.length).assertEqual(2);
      expect(order[0]).assertEqual(20);
      expect(order[1]).assertEqual(10);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_6200
     * @tc.name testReadonlyArrayReduceRight062
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      const result = arr.reduceRight((prev: int, cur: int): int => prev + 1, 0);
      expect(result).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_6300
     * @tc.name testReadonlyArrayReduceRight063
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const order: Array<int> = [];
      const result = arr.reduceRight((prev: int, cur: int): int => {
        order.push(cur);
        return prev + cur;
      }, 0);
      expect(result).assertEqual(6);
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual(3);
      expect(order[1]).assertEqual(2);
      expect(order[2]).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_6400
     * @tc.name testReadonlyArrayReduceRight064
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.reduceRight((prev: int, cur: string): int => prev + cur.length, 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_6500
     * @tc.name testReadonlyArrayReduceRight065
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.reduceRight((prev: int, cur: string): int => prev + cur.length, 0);
      expect(result).assertEqual(arr[0].length + arr[1].length + arr[2].length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_6600
     * @tc.name testReadonlyArrayReduceRight066
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.reduceRight((prev: int, cur: boolean): int => prev + (cur ? 1 : 0), 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_6700
     * @tc.name testReadonlyArrayReduceRight067
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.reduceRight((prev: int, cur: double): int => prev + 1, 0);
      expect(result).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_6800
     * @tc.name testReadonlyArrayReduceRight068
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.reduceRight((prev: int, cur: ComboObjarr): int => prev + cur.id, 0);
      expect(result).assertEqual(obj1.id + obj2.id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_6900
     * @tc.name testReadonlyArrayReduceRight069
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.reduceRight<int>((previous: int, _current: Array<int>): int => previous + 1, 0);
      expect(result).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_7000
     * @tc.name testReadonlyArrayReduceRight070
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const result = arr.reduceRight<int>((previous: int, _current: int): int => previous + 1, 0);
      expect(result).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_7100
     * @tc.name testReadonlyArrayReduceRight071
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: combination coverage - int sequence 1, 2, 3 group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.reduceRight<int>((previous: int, _current: int): int => previous + 1, 0);
      expect(result).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_7200
     * @tc.name testReadonlyArrayReduceRight072
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: combination coverage - string values with empty string group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.reduceRight<int>((previous: int, _current: string): int => previous + 1, 0);
      expect(result).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_7300
     * @tc.name testReadonlyArrayReduceRight073
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: combination coverage - Unicode string values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.reduceRight<int>((previous: int, _current: string): int => previous + 1, 0);
      expect(result).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_7400
     * @tc.name testReadonlyArrayReduceRight074
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: combination coverage - boolean true false values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.reduceRight<int>((previous: int, _current: boolean): int => previous + 1, 0);
      expect(result).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_7500
     * @tc.name testReadonlyArrayReduceRight075
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const result = arr.reduceRight<int>((previous: int, _current: double): int => previous + 1, 0);
      expect(result).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_7600
     * @tc.name testReadonlyArrayReduceRight076
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayReduceRightGeneratedItem = new ReadonlyArrayReduceRightGeneratedItem(1);
      const obj2: ReadonlyArrayReduceRightGeneratedItem = new ReadonlyArrayReduceRightGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayReduceRightGeneratedItem> = [obj1, obj2];
      const result = arr.reduceRight<int>((previous: int, _current: ReadonlyArrayReduceRightGeneratedItem): int => previous + 1, 0);
      expect(result).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_7700
     * @tc.name testReadonlyArrayReduceRight077
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: callback fourth parameter array is the same reference as the source ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 8, 9];
      let sameRefCount: int = 0;
      arr.reduceRight((prev: int, cur: int, idx: int, array: ReadonlyArray<int>): int => {
        if ((array as Object) === (arr as Object)) {
          sameRefCount++;
        }
        return prev + cur;
      }, 0);
      expect(sameRefCount).assertEqual(3);
    });

  });
}
