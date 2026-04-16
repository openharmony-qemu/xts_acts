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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BuiltinsArrayFindLastIndexTest(): void {
  describe('BuiltinsArrayFindLastIndexTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name    builtinsArrayFindLastIndexTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_TEST_0100
     * @tc.desc    Verify findLastIndex with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayFindLastIndexTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>();
      const result = arr.findLastIndex((element: number, index: int, array: Array<number>): boolean => {
        return element > 5;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsArrayFindLastIndexTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_TEST_0200
     * @tc.desc    Verify findLastIndex with non-empty array - find element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayFindLastIndexTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9);
      const result = arr.findLastIndex((element: number, index: int, array: Array<number>): boolean => {
        return element > 5;
      });
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name    builtinsArrayFindLastIndexTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_TEST_0300
     * @tc.desc    Verify findLastIndex with non-empty array - not find element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayFindLastIndexTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.findLastIndex((element: number, index: int, array: Array<number>): boolean => {
        return element > 5;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsArrayFindLastIndexTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_TEST_0400
     * @tc.desc    Verify findLastIndex with first element match
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastIndexTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(10, 2, 3, 4, 5);
      const result = arr.findLastIndex((element: number, index: int, array: Array<number>): boolean => {
        return element > 5;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFindLastIndexTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_TEST_0500
     * @tc.desc    Verify findLastIndex with last element match
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastIndexTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(1, 2, 3, 4, 10);
      const result = arr.findLastIndex((element: number, index: int, array: Array<number>): boolean => {
        return element > 5;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name    builtinsArrayFindLastIndexTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_TEST_0600
     * @tc.desc    Verify findLastIndex with all elements match
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastIndexTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.findLastIndex((element: number, index: int, array: Array<number>): boolean => {
        return element > 5;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name    builtinsArrayFindLastIndexTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_TEST_0700
     * @tc.desc    Verify findLastIndex with string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastIndexTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<string>('apple', 'banana', 'cherry', 'date');
      const result = arr.findLastIndex((element: string, index: int, array: Array<string>): boolean => {
        return element.length > 5;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArrayFindLastIndexTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_TEST_0800
     * @tc.desc    Verify findLastIndex with single element array - match
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastIndexTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(10);
      const result = arr.findLastIndex((element: number, index: int, array: Array<number>): boolean => {
        return element > 5;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFindLastIndexTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_TEST_0900
     * @tc.desc    Verify findLastIndex with single element array - not match
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastIndexTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(3);
      const result = arr.findLastIndex((element: number, index: int, array: Array<number>): boolean => {
        return element > 5;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsArrayFindLastIndexTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_TEST_1000
     * @tc.desc    Verify findLastIndex with index parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFindLastIndexTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.findLastIndex((element: number, index: int, array: Array<number>): boolean => {
        return index === 2;
      });
      expect(result).assertEqual(2);
    });
  });
}