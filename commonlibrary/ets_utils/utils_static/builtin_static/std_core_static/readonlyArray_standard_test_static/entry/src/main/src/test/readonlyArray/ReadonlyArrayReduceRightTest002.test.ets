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

class ReadonlyArrayReduceRightGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayReduceRightTest002(): void {
  describe('ReadonlyArrayReduceRightTest002', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_7800
     * @tc.name testReadonlyArrayReduceRight078
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: order distinguishing - nested int array values right-to-left index visiting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.reduceRight<string>(
        (previous: string, _current: Array<int>, index: int): string => previous + index.toString(),
        ""
      );
      expect(result).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_7900
     * @tc.name testReadonlyArrayReduceRight079
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: order distinguishing - repeated int elements right-to-left index visiting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const result = arr.reduceRight<string>(
        (previous: string, _current: int, index: int): string => previous + index.toString(),
        ""
      );
      expect(result).assertEqual("210");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_8000
     * @tc.name testReadonlyArrayReduceRight080
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: order distinguishing - string concat verifies right-to-left iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.reduceRight<string>(
        (previous: string, current: string): string => previous + current,
        ""
      );
      expect(result).assertEqual("ba");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_8100
     * @tc.name testReadonlyArrayReduceRight081
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: order distinguishing - Unicode string values right-to-left index visiting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["中文", "😀", "long-text"];
      const result = arr.reduceRight<string>(
        (previous: string, _current: string, index: int): string => previous + index.toString(),
        ""
      );
      expect(result).assertEqual("210");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_8200
     * @tc.name testReadonlyArrayReduceRight082
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: order distinguishing - boolean values right-to-left index visiting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.reduceRight<string>(
        (previous: string, _current: boolean, index: int): string => previous + index.toString(),
        ""
      );
      expect(result).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_8300
     * @tc.name testReadonlyArrayReduceRight083
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: order distinguishing - NaN zero negative-zero right-to-left index visiting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const result = arr.reduceRight<string>(
        (previous: string, _current: double, index: int): string => previous + index.toString(),
        ""
      );
      expect(result).assertEqual("210");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_8400
     * @tc.name testReadonlyArrayReduceRight084
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: order distinguishing - object reference values right-to-left index visiting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayReduceRightGeneratedItem = new ReadonlyArrayReduceRightGeneratedItem(1);
      const obj2: ReadonlyArrayReduceRightGeneratedItem = new ReadonlyArrayReduceRightGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayReduceRightGeneratedItem> = [obj1, obj2];
      const result = arr.reduceRight<string>(
        (previous: string, _current: ReadonlyArrayReduceRightGeneratedItem, index: int): string => previous + index.toString(),
        ""
      );
      expect(result).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_8500
     * @tc.name testReadonlyArrayReduceRight085
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: T to U accumulation - int array reduced to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.reduceRight<string>(
        (previous: string, current: int): string => previous + current.toString(),
        ""
      );
      expect(result).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_8600
     * @tc.name testReadonlyArrayReduceRight086
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: T to U accumulation - int array reduced to boolean all-positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [3, 5, 7];
      const result = arr.reduceRight<boolean>(
        (previous: boolean, current: int): boolean => previous && current > 0,
        true
      );
      expect(result).assertTrue();
      const arr2: ReadonlyArray<int> = [3, -1, 7];
      const result2 = arr2.reduceRight<boolean>(
        (previous: boolean, current: int): boolean => previous && current > 0,
        true
      );
      expect(result2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_8700
     * @tc.name testReadonlyArrayReduceRight087
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: find maximum value via reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [3, 9, 1, 7, 5];
      const result = arr.reduceRight((prev: int, cur: int): int => prev > cur ? prev : cur);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_8800
     * @tc.name testReadonlyArrayReduceRight088
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: aggregate object id properties via reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: ReadonlyArrayReduceRightGeneratedItem = new ReadonlyArrayReduceRightGeneratedItem(10);
      const b: ReadonlyArrayReduceRightGeneratedItem = new ReadonlyArrayReduceRightGeneratedItem(20);
      const c: ReadonlyArrayReduceRightGeneratedItem = new ReadonlyArrayReduceRightGeneratedItem(30);
      const arr: ReadonlyArray<ReadonlyArrayReduceRightGeneratedItem> = [a, b, c];
      const sum = arr.reduceRight<int>(
        (prev: int, cur: ReadonlyArrayReduceRightGeneratedItem): int => prev + cur.id,
        0
      );
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_8900
     * @tc.name testReadonlyArrayReduceRight089
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: callback throws mid-iteration - elements before throw point not processed (right-to-left)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let callCount: int = 0;
      try {
        arr.reduceRight((prev: int, cur: int, idx: int): int => {
          callCount++;
          if (cur === 3) {
            throw new Error("stop");
          }
          return prev + cur;
        }, 0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_9000
     * @tc.name testReadonlyArrayReduceRight090
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: +0 and -0 both processed without skipping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [0.0, -0.0, 0.0];
      let callCount: int = 0;
      const result = arr.reduceRight<int>((prev: int, cur: double): int => {
        callCount++;
        return prev + 1;
      }, 0);
      expect(callCount).assertEqual(3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_9100
     * @tc.name testReadonlyArrayReduceRight091
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: object element references in original array preserved after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: ReadonlyArrayReduceRightGeneratedItem = new ReadonlyArrayReduceRightGeneratedItem(1);
      const b: ReadonlyArrayReduceRightGeneratedItem = new ReadonlyArrayReduceRightGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayReduceRightGeneratedItem> = [a, b];
      arr.reduceRight<int>((prev: int, cur: ReadonlyArrayReduceRightGeneratedItem): int => prev + cur.id, 0);
      expect(arr[0] === a).assertTrue();
      expect(arr[1] === b).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_9200
     * @tc.name testReadonlyArrayReduceRight092
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: consecutive calls produce identical results (no hidden state)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      const r1 = arr.reduceRight((prev: int, cur: int): int => prev * 10 + cur, 0);
      const r2 = arr.reduceRight((prev: int, cur: int): int => prev * 10 + cur, 0);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(4321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_9300
     * @tc.name testReadonlyArrayReduceRight093
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: callback receives ReadonlyArray with same length and elements at every step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      let lengthMatches: int = 0;
      let elementMatches: int = 0;
      arr.reduceRight((prev: int, cur: int, idx: int, a: ReadonlyArray<int>): int => {
        if (a.length === 3) lengthMatches++;
        if (a[idx] === cur) elementMatches++;
        return prev + cur;
      }, 0);
      expect(lengthMatches).assertEqual(3);
      expect(elementMatches).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_9400
     * @tc.name testReadonlyArrayReduceRight094
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: union type number with undefined - all elements visited including undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int | undefined> = [1, undefined, 2];
      let visited: int = 0;
      let undefinedSeen: boolean = false;
      const sum = arr.reduceRight<int>((prev: int, cur: int | undefined): int => {
        visited++;
        if (cur === undefined) {
          undefinedSeen = true;
          return prev;
        }
        return prev + (cur as int);
      }, 0);
      expect(visited).assertEqual(3);
      expect(undefinedSeen).assertTrue();
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_9500
     * @tc.name testReadonlyArrayReduceRight095
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: union type string with null - null element processed as element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string | null> = ["a", null, "b"];
      let nullSeen: boolean = false;
      const out = arr.reduceRight<string>((prev: string, cur: string | null): string => {
        if (cur === null) {
          nullSeen = true;
          return prev + "N";
        }
        return prev + (cur as string);
      }, "");
      expect(nullSeen).assertTrue();
      expect(out).assertEqual("bNa");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_REDUCE_RIGHT_9600
     * @tc.name testReadonlyArrayReduceRight096
     * @tc.desc Verify ReadonlyArray.reduceRight behavior: char element type accumulation right-to-left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayReduceRight096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'b', c'c'];
      const result = arr.reduceRight<string>(
        (prev: string, cur: char): string => prev + cur.toString(),
        ""
      );
      expect(result).assertEqual("cba");
    });

  });
}
