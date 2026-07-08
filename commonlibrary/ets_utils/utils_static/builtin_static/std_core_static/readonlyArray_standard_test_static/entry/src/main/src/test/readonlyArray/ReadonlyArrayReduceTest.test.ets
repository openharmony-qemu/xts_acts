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

class ReadonlyArrayReduceGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayReduceTest(): void {
  describe('ReadonlyArrayReduceTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_0100
     * @tc.name testReadonlyArrayReduce001
     * @tc.desc Verify ReadonlyArray.reduce behavior: initialValue when reduce element is element callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.reduce((prev: int, cur: int): int => {
        return prev + cur;
      });
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_0200
     * @tc.name testReadonlyArrayReduce002
     * @tc.desc Verify ReadonlyArray.reduce behavior: when passing callback element callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.reduce((prev: int, cur: int): int => {
          return prev + cur;
      }, 10);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_0300
     * @tc.name testReadonlyArrayReduce003
     * @tc.desc Verify ReadonlyArray.reduce behavior: is callback element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.reduce((previous: int, current: int): int => {
          return previous + current;
      }, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_0400
     * @tc.name testReadonlyArrayReduce004
     * @tc.desc Verify ReadonlyArray.reduce behavior: callback before parameter previousValue, currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 10, 15];
      const result = arr.reduce((prev: int, cur: int): int => {
          return prev * cur;
      }, 1);
      expect(result).assertEqual(750);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_0500
     * @tc.name testReadonlyArrayReduce005
     * @tc.desc Verify ReadonlyArray.reduce behavior: callback parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.reduce((prev: int, cur: int, index: int, array: ReadonlyArray<int>): int => {
          expect(array.length).assertEqual(3);
          return prev + cur;
      }, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_0600
     * @tc.name testReadonlyArrayReduce006
     * @tc.desc Verify ReadonlyArray.reduce behavior: verify callback parameter previousValue is result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const accResults: Array<int> = [];
      arr.reduce((prev: int, cur: int): int => {
          accResults.push(prev);
          return prev + cur;
      }, 0);
      expect(accResults[0]).assertEqual(0);
      expect(accResults[1]).assertEqual(1);
      expect(accResults[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_0700
     * @tc.name testReadonlyArrayReduce007
     * @tc.desc Verify ReadonlyArray.reduce behavior: verify callback parameter currentValue is before iteration element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const curResults: Array<int> = [];
      arr.reduce((prev: int, cur: int): int => {
          curResults.push(cur);
          return prev + cur;
      }, 0);
      expect(curResults[0]).assertEqual(10);
      expect(curResults[1]).assertEqual(20);
      expect(curResults[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_0800
     * @tc.name testReadonlyArrayReduce008
     * @tc.desc Verify ReadonlyArray.reduce behavior: verify callback parameter currentIndex is before element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [100, 200, 300];
      const indexResults: Array<int> = [];
      arr.reduce((prev: int, cur: int, idx: int): int => {
          indexResults.push(idx);
          return prev + cur;
      }, 0);
      expect(indexResults[0]).assertEqual(0);
      expect(indexResults[1]).assertEqual(1);
      expect(indexResults[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_0900
     * @tc.name testReadonlyArrayReduce009
     * @tc.desc Verify ReadonlyArray.reduce behavior: initialValue is non - when
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.reduce((prev: int, cur: int): int => {
          return prev + cur;
      }, 100);
      expect(result).assertEqual(106);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_1000
     * @tc.name testReadonlyArrayReduce010
     * @tc.desc Verify ReadonlyArray.reduce behavior: initialValue is string when string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", "c"];
      const result = arr.reduce((prev: string, cur: string): string => {
          return prev + cur;
      }, "start-");
      expect(result).assertEqual("start-abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_1100
     * @tc.name testReadonlyArrayReduce011
     * @tc.desc Verify ReadonlyArray.reduce behavior: initialValue is int type when is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1];
      const maxVal: int = 2147483647;
      const result = arr.reduce((prev: int, cur: int): int => {
          return prev + cur;
      }, maxVal);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_1200
     * @tc.name testReadonlyArrayReduce012
     * @tc.desc Verify ReadonlyArray.reduce behavior: initialValue is when and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.reduce((prev: int, cur: int): int => {
          return prev + cur;
      }, -5);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_1300
     * @tc.name testReadonlyArrayReduce013
     * @tc.desc Verify ReadonlyArray.reduce behavior: initialValue when element is element callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const result = arr.reduce((prev: int, cur: int): int => {
        return prev + cur;
      });
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_1400
     * @tc.name testReadonlyArrayReduce014
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["Hello", " ", "World", "!"];
      const result = arr.reduce((prev: string, cur: string): string => {
        return prev + cur;
      });
      expect(result).assertEqual("Hello World!");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_1500
     * @tc.name testReadonlyArrayReduce015
     * @tc.desc Verify ReadonlyArray.reduce behavior: empty array reduce initialValue when returns initialValue callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      const result = arr.reduce((prev: int, cur: int): int => {
          return prev + cur;
      }, 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_1600
     * @tc.name testReadonlyArrayReduce016
     * @tc.desc Verify ReadonlyArray.reduce behavior: element initialValue when returns element callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [99];
      const result = arr.reduce((prev: int, cur: int): int => {
        return prev + cur;
      });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_1700
     * @tc.name testReadonlyArrayReduce017
     * @tc.desc Verify ReadonlyArray.reduce behavior: element initialValue when callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5];
      const result = arr.reduce((prev: int, cur: int): int => {
          return prev + cur;
      }, 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_1800
     * @tc.name testReadonlyArrayReduce018
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [3, 7, 1, 9, 4];
      const result = arr.reduce((prev: int, cur: int): int => {
        return prev > cur ? prev : cur;
      });
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_1900
     * @tc.name testReadonlyArrayReduce019
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [3, 7, 1, 9, 4];
      const result = arr.reduce((prev: int, cur: int): int => {
        return prev < cur ? prev : cur;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_2000
     * @tc.name testReadonlyArrayReduce020
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce return value is after callback return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2, 3, 4];
      const result = arr.reduce((prev: int, cur: int): int => {
          return prev * cur;
      }, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_2100
     * @tc.name testReadonlyArrayReduce021
     * @tc.desc Verify ReadonlyArray.reduce behavior: type and element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "y", "z"];
      const result = arr.reduce((prev: string, cur: string): string => {
        return prev + cur;
      });
      expect(result).assertEqual("xyz");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_2200
     * @tc.name testReadonlyArrayReduce022
     * @tc.desc Verify ReadonlyArray.reduce behavior: empty array initialValue reduce throws an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      try {
        arr.reduce((prev: int, cur: int): int => {
            return prev + cur;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_2300
     * @tc.name testReadonlyArrayReduce023
     * @tc.desc Verify ReadonlyArray.reduce behavior: 0 when
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 5, -3, 0];
      const result = arr.reduce((prev: int, cur: int): int => {
          return prev + cur;
      }, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_2400
     * @tc.name testReadonlyArrayReduce024
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce return value type is generic T and element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result: int = arr.reduce((prev: int, cur: int): int => {
          return prev + cur;
      }, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_2500
     * @tc.name testReadonlyArrayReduce025
     * @tc.desc Verify ReadonlyArray.reduce behavior: verify different type reduce return value type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strArr: ReadonlyArray<string> = ["a", "b"];
      const strResult: string = strArr.reduce((prev: string, cur: string): string => {
        return prev + cur;
      });
      expect(strResult).assertEqual("ab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_2600
     * @tc.name testReadonlyArrayReduce026
     * @tc.desc Verify ReadonlyArray.reduce behavior: large array reduce result correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int> = [];
      for (let i = 1; i <= 1000; i++) {
          arr.push(i);
      }
      const readonlyArr: ReadonlyArray<int> = arr;
      const result = readonlyArr.reduce((prev: int, cur: int): int => {
          return prev + cur;
      }, 0);
      expect(result).assertEqual(500500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_2700
     * @tc.name testReadonlyArrayReduce027
     * @tc.desc Verify ReadonlyArray.reduce behavior: element is 0 when result is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, 0, 0, 0];
      const result = arr.reduce((prev: int, cur: int): int => {
          return prev + cur;
      }, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_2800
     * @tc.name testReadonlyArrayReduce028
     * @tc.desc Verify ReadonlyArray.reduce behavior: callback throws an exception when reduce and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      try {
        arr.reduce((prev: int, cur: int): int => {
            if (cur === 2) {
                throw new Error("test error");
            }
            return prev + cur;
        }, 0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_2900
     * @tc.name testReadonlyArrayReduce029
     * @tc.desc Verify ReadonlyArray.reduce behavior: initialValue when callback n n is length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      let callCount: int = 0;
      arr.reduce((prev: int, cur: int): int => {
          callCount++;
          return prev + cur;
      }, 0);
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_3000
     * @tc.name testReadonlyArrayReduce030
     * @tc.desc Verify ReadonlyArray.reduce behavior: and API 1,2,3. reduce initialValue=0 returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.reduce((previous: int, current: int): int => {
          return previous + current;
      }, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_3100
     * @tc.name testReadonlyArrayReduce031
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce 0 - 1 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 5, 10];
      const result = arr.reduce((prev: int, cur: int): int => {
          return prev + cur;
      }, 0);
      expect(result).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_3200
     * @tc.name testReadonlyArrayReduce032
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      const result = arr.reduce((prev: int, cur: int): int => {
          return prev + cur;
      }, 0);
      expect(result).assertEqual(0x10 + 0o10 + 0b10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_3300
     * @tc.name testReadonlyArrayReduce033
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce byte type ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte];
      const result = arr.reduce((p: int, c: byte, index: int, array: ReadonlyArray<byte>): int => {
          return p + c;
      }, 0);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_3400
     * @tc.name testReadonlyArrayReduce034
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce long type ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [100, 200];
      const result = arr.reduce((p: long, c: long): long => {
          return p + c;
      }, 0);
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_3500
     * @tc.name testReadonlyArrayReduce035
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce float type ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, 2.0f, 3.0f];
      const result = arr.reduce((p: float, c: float, index: int, array: ReadonlyArray<float>): float => {
          return p + c;
      }, 0.0f);
      expect(result).assertClose(6.0, 0.0001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_3600
     * @tc.name testReadonlyArrayReduce036
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce string type ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", "c"];
      const result = arr.reduce((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_3700
     * @tc.name testReadonlyArrayReduce037
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce string - emoji type ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "😀"];
      const result = arr.reduce((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("x😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_3800
     * @tc.name testReadonlyArrayReduce038
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce string - jp type ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["テスト", "!"];
      const result = arr.reduce((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("テスト!");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_3900
     * @tc.name testReadonlyArrayReduce039
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce boolean type ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const result = arr.reduce((p: int, c: boolean, index: int, array: ReadonlyArray<boolean>): int => {
          return p + (c ? 1 : 0);
      }, 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_4000
     * @tc.name testReadonlyArrayReduce040
     * @tc.desc Verify ReadonlyArray.reduce behavior: 100 element int reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      for (let i: int = 1; i <= 100; i++) { (arr as Array<int>).push(i); }
      const result = arr.reduce((p: int, c: int): int => {
          return p + c;
      }, 0);
      expect(result).assertEqual(5050);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_4100
     * @tc.name testReadonlyArrayReduce041
     * @tc.desc Verify ReadonlyArray.reduce behavior: long reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [0, 9223372036854775807];
      const result = arr.reduce((p: long, c: long): long => {
          return p + c;
      }, 0);
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_4200
     * @tc.name testReadonlyArrayReduce042
     * @tc.desc Verify ReadonlyArray.reduce behavior: float reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, Double.toFloat(Number.POSITIVE_INFINITY)];
      const result = arr.reduce((p: float, c: float, index: int, array: ReadonlyArray<float>): float => {
          return p + c;
      }, 0.0f);
      expect(result).assertEqual(Double.toFloat(Number.POSITIVE_INFINITY));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_4300
     * @tc.name testReadonlyArrayReduce043
     * @tc.desc Verify ReadonlyArray.reduce behavior: string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["13800138000", "x"];
      const result = arr.reduce((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("13800138000x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_4400
     * @tc.name testReadonlyArrayReduce044
     * @tc.desc Verify ReadonlyArray.reduce behavior: string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["test@example.com"];
      const result = arr.reduce((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("test@example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_4500
     * @tc.name testReadonlyArrayReduce045
     * @tc.desc Verify ReadonlyArray.reduce behavior: tab string reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\t", "\n"];
      const result = arr.reduce((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("\t\n");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_4600
     * @tc.name testReadonlyArrayReduce046
     * @tc.desc Verify ReadonlyArray.reduce behavior: int reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [-2147483648, 1];
      const result = arr.reduce((p: int, c: int): int => {
          return p + c;
      }, 0);
      expect(result).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_4700
     * @tc.name testReadonlyArrayReduce047
     * @tc.desc Verify ReadonlyArray.reduce behavior: long reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [-9223372036854775808, 0];
      const result = arr.reduce((p: long, c: long): long => {
          return p + c;
      }, 0);
      expect(result).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_4800
     * @tc.name testReadonlyArrayReduce048
     * @tc.desc Verify ReadonlyArray.reduce behavior: string reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["АБВГД"];
      const result = arr.reduce((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("АБВГД");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_4900
     * @tc.name testReadonlyArrayReduce049
     * @tc.desc Verify ReadonlyArray.reduce behavior: string reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["Test 測試"];
      const result = arr.reduce((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("Test 測試");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_5000
     * @tc.name testReadonlyArrayReduce050
     * @tc.desc Verify ReadonlyArray.reduce behavior: 8 string reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["0123"];
      const result = arr.reduce((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("0123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_5100
     * @tc.name testReadonlyArrayReduce051
     * @tc.desc Verify ReadonlyArray.reduce behavior: 2 string reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["0b1010"];
      const result = arr.reduce((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("0b1010");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_5200
     * @tc.name testReadonlyArrayReduce052
     * @tc.desc Verify ReadonlyArray.reduce behavior: string reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["—", "-"];
      const result = arr.reduce((p: string, c: string): string => {
          return p + c;
      }, "");
      expect(result).assertEqual("—-");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_5300
     * @tc.name testReadonlyArrayReduce053
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce with float NaN accumulator propagates NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, 2.0f];
      const result = arr.reduce((prev: float, cur: float, index: int, array: ReadonlyArray<float>): float => {
          return prev + cur;
      }, nan);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_5400
     * @tc.name testReadonlyArrayReduce054
     * @tc.desc Verify ReadonlyArray.reduce behavior: reduce double NaN without initial value on single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan];
      const result = arr.reduce((prev: double, cur: double): double => {
        return prev + cur;
      });
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_5500
     * @tc.name testReadonlyArrayReduce055
     * @tc.desc Verify ReadonlyArray.reduce behavior: without initialValue callback is invoked length minus one times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      let callCount: int = 0;
      const result = arr.reduce((prev: int, cur: int): int => {
        callCount++;
        return prev + cur;
      });
      expect(callCount).assertEqual(3);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_5600
     * @tc.name testReadonlyArrayReduce056
     * @tc.desc Verify ReadonlyArray.reduce behavior: initialValue empty array - Error ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      try {
        arr.reduce((prev: int, cur: int): int => prev + cur);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_5700
     * @tc.name testReadonlyArrayReduce057
     * @tc.desc Verify ReadonlyArray.reduce behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      arr.reduce((prev: int, cur: int): int => prev + cur, 0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_5800
     * @tc.name testReadonlyArrayReduce058
     * @tc.desc Verify ReadonlyArray.reduce behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      const result = arr.reduce((prev: int, cur: int): int => prev + cur, 0);
      expect(result).assertEqual(30);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_5900
     * @tc.name testReadonlyArrayReduce059
     * @tc.desc Verify ReadonlyArray.reduce behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      const result = arr.reduce((prev: int, cur: int): int => prev + 1, 0);
      expect(result).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_6000
     * @tc.name testReadonlyArrayReduce060
     * @tc.desc Verify ReadonlyArray.reduce behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.reduce((prev: int, cur: int): int => prev + cur, 0);
      expect(result).assertEqual(6);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_6100
     * @tc.name testReadonlyArrayReduce061
     * @tc.desc Verify ReadonlyArray.reduce behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.reduce((prev: int, cur: int): int => prev + cur, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_6200
     * @tc.name testReadonlyArrayReduce062
     * @tc.desc Verify ReadonlyArray.reduce behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.reduce((prev: int, cur: string): int => prev + cur.length, 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_6300
     * @tc.name testReadonlyArrayReduce063
     * @tc.desc Verify ReadonlyArray.reduce behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["中文", "😀", "long-text"];
      const expected: int = arr[0].length + arr[1].length + arr[2].length;
      const result = arr.reduce((prev: int, cur: string): int => prev + cur.length, 0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_6400
     * @tc.name testReadonlyArrayReduce064
     * @tc.desc Verify ReadonlyArray.reduce behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.reduce((prev: int, cur: boolean): int => prev + (cur ? 1 : 0), 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_6500
     * @tc.name testReadonlyArrayReduce065
     * @tc.desc Verify ReadonlyArray.reduce behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.reduce((prev: int, cur: double): int => prev + 1, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_6600
     * @tc.name testReadonlyArrayReduce066
     * @tc.desc Verify ReadonlyArray.reduce behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.reduce((prev: int, cur: ComboObjarr): int => prev + cur.id, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_6700
     * @tc.name testReadonlyArrayReduce067
     * @tc.desc Verify ReadonlyArray.reduce behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const collected: Array<Array<int>> = [];
      const result = arr.reduce<int>((previous: int, current: Array<int>): int => {
        collected.push(current);
        return previous + 1;
      }, 0);
      expect(result).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0] === arr[0]).assertTrue();
      expect(collected[arr.length - 1] === arr[arr.length - 1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_6800
     * @tc.name testReadonlyArrayReduce068
     * @tc.desc Verify ReadonlyArray.reduce behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const collected: Array<int> = [];
      const result = arr.reduce<int>((previous: int, current: int): int => {
        collected.push(current);
        return previous + 1;
      }, 0);
      expect(result).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_6900
     * @tc.name testReadonlyArrayReduce069
     * @tc.desc Verify ReadonlyArray.reduce behavior: combination coverage - int sequence 1, 2, 3 group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const collected: Array<int> = [];
      const result = arr.reduce<int>((previous: int, current: int): int => {
        collected.push(current);
        return previous + 1;
      }, 0);
      expect(result).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_7000
     * @tc.name testReadonlyArrayReduce070
     * @tc.desc Verify ReadonlyArray.reduce behavior: combination coverage - string values with empty string group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const collected: Array<string> = [];
      const result = arr.reduce<int>((previous: int, current: string): int => {
        collected.push(current);
        return previous + 1;
      }, 0);
      expect(result).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_7100
     * @tc.name testReadonlyArrayReduce071
     * @tc.desc Verify ReadonlyArray.reduce behavior: combination coverage - Unicode string values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["中文", "😀", "long-text"];
      const collected: Array<string> = [];
      const result = arr.reduce<int>((previous: int, current: string): int => {
        collected.push(current);
        return previous + 1;
      }, 0);
      expect(result).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_7200
     * @tc.name testReadonlyArrayReduce072
     * @tc.desc Verify ReadonlyArray.reduce behavior: combination coverage - boolean true false values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const collected: Array<boolean> = [];
      const result = arr.reduce<int>((previous: int, current: boolean): int => {
        collected.push(current);
        return previous + 1;
      }, 0);
      expect(result).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_7300
     * @tc.name testReadonlyArrayReduce073
     * @tc.desc Verify ReadonlyArray.reduce behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const collected: Array<double> = [];
      const result = arr.reduce<int>((previous: int, current: double): int => {
        collected.push(current);
        return previous + 1;
      }, 0);
      expect(result).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(collected[1]).assertEqual(arr[1]);
      expect(collected[2]).assertEqual(arr[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_7400
     * @tc.name testReadonlyArrayReduce074
     * @tc.desc Verify ReadonlyArray.reduce behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayReduceGeneratedItem = new ReadonlyArrayReduceGeneratedItem(1);
      const obj2: ReadonlyArrayReduceGeneratedItem = new ReadonlyArrayReduceGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayReduceGeneratedItem> = [obj1, obj2];
      const collected: Array<ReadonlyArrayReduceGeneratedItem> = [];
      const result = arr.reduce<int>((previous: int, current: ReadonlyArrayReduceGeneratedItem): int => {
        collected.push(current);
        return previous + 1;
      }, 0);
      expect(result).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0] === arr[0]).assertTrue();
      expect(collected[arr.length - 1] === arr[arr.length - 1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_7500
     * @tc.name testReadonlyArrayReduce075
     * @tc.desc Verify ReadonlyArray.reduce behavior: callback fourth parameter array is the same reference as the source ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 8, 9];
      let sameRefCount: int = 0;
      arr.reduce((prev: int, cur: int, idx: int, array: ReadonlyArray<int>): int => {
        if ((array as Object) === (arr as Object)) {
          sameRefCount++;
        }
        return prev + cur;
      }, 0);
      expect(sameRefCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_7600
     * @tc.name testReadonlyArrayReduce076
     * @tc.desc Verify ReadonlyArray.reduce behavior: without initialValue currentIndex starts at 1 not 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const indexes: Array<int> = [];
      arr.reduce((prev: int, cur: int, idx: int): int => {
        indexes.push(idx);
        return prev + cur;
      });
      expect(indexes.length).assertEqual(2);
      expect(indexes[0]).assertEqual(1);
      expect(indexes[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_7700
     * @tc.name testReadonlyArrayReduce077
     * @tc.desc Verify ReadonlyArray.reduce behavior: ReadonlyArray<boolean> reduces to boolean via logical AND with mixed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const allTrue: ReadonlyArray<boolean> = [true, true, true];
      const mixed: ReadonlyArray<boolean> = [true, false, true];
      const andAll = allTrue.reduce((p: boolean, c: boolean): boolean => p && c, true);
      const andMixed = mixed.reduce((p: boolean, c: boolean): boolean => p && c, true);
      expect(andAll).assertTrue();
      expect(andMixed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_7800
     * @tc.name testReadonlyArrayReduce078
     * @tc.desc Verify ReadonlyArray.reduce behavior: T accumulates into U object aggregating sum and count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [4, 8, 12];
      const initial: ComboObjarr = new ComboObjarr();
      initial.id = 0;
      const result = arr.reduce<ComboObjarr>((prev: ComboObjarr, cur: int): ComboObjarr => {
        const next: ComboObjarr = new ComboObjarr();
        next.id = prev.id + cur;
        return next;
      }, initial);
      expect(result.id).assertEqual(24);
      expect(result === initial).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_7900
     * @tc.name testReadonlyArrayReduce079
     * @tc.desc Verify ReadonlyArray.reduce behavior: callback throws midway and elements after the trigger are not visited
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const visited: Array<int> = [];
      try {
        arr.reduce((prev: int, cur: int): int => {
          visited.push(cur);
          if (cur === 3) {
            throw new Error("stop");
          }
          return prev + cur;
        }, 0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
      expect(visited.length).assertEqual(3);
      expect(visited[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_8000
     * @tc.name testReadonlyArrayReduce080
     * @tc.desc Verify ReadonlyArray.reduce behavior: two consecutive calls on the same array yield identical results without hidden state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2, 4, 6, 8];
      const r1 = arr.reduce((p: int, c: int): int => p + c, 0);
      const r2 = arr.reduce((p: int, c: int): int => p + c, 0);
      expect(r1).assertEqual(20);
      expect(r2).assertEqual(20);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_8100
     * @tc.name testReadonlyArrayReduce081
     * @tc.desc Verify ReadonlyArray.reduce behavior: original array element references are not replaced after reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: ReadonlyArrayReduceGeneratedItem = new ReadonlyArrayReduceGeneratedItem(11);
      const b: ReadonlyArrayReduceGeneratedItem = new ReadonlyArrayReduceGeneratedItem(22);
      const arr: ReadonlyArray<ReadonlyArrayReduceGeneratedItem> = [a, b];
      arr.reduce<int>((prev: int, cur: ReadonlyArrayReduceGeneratedItem): int => prev + cur.id, 0);
      expect(arr[0] === a).assertTrue();
      expect(arr[1] === b).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_8200
     * @tc.name testReadonlyArrayReduce082
     * @tc.desc Verify ReadonlyArray.reduce behavior: int element accumulates into string typed result via U generic argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.reduce<string>((prev: string, cur: int): string => prev + cur.toString(), "v=");
      expect(result).assertEqual("v=123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_8300
     * @tc.name testReadonlyArrayReduce083
     * @tc.desc Verify ReadonlyArray.reduce behavior: two-element array without initialValue invokes callback exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [50, 70];
      let calls: int = 0;
      const result = arr.reduce((prev: int, cur: int): int => {
        calls++;
        return prev + cur;
      });
      expect(calls).assertEqual(1);
      expect(result).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_8400
     * @tc.name testReadonlyArrayReduce084
     * @tc.desc Verify ReadonlyArray.reduce behavior: previousValue trace without initialValue starts from first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [4, 5, 6];
      const prevTrace: Array<int> = [];
      arr.reduce((prev: int, cur: int): int => {
        prevTrace.push(prev);
        return prev + cur;
      });
      expect(prevTrace.length).assertEqual(2);
      expect(prevTrace[0]).assertEqual(4);
      expect(prevTrace[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_8500
     * @tc.name testReadonlyArrayReduce085
     * @tc.desc Verify ReadonlyArray.reduce behavior: array containing positive and negative zero sums to zero with both signs equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [0.0, -0.0, 0.0];
      const result = arr.reduce((prev: double, cur: double): double => prev + cur, 0.0);
      expect(result).assertEqual(0.0);
      expect(result === 0.0).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_8600
     * @tc.name testReadonlyArrayReduce086
     * @tc.desc Verify ReadonlyArray.reduce behavior: empty array with initialValue returns initialValue without invoking callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduce086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      let calls: int = 0;
      const result = arr.reduce((prev: int, cur: int): int => {
        calls++;
        return prev + cur;
      }, 99);
      expect(calls).assertEqual(0);
      expect(result).assertEqual(99);
    });

  });
}
