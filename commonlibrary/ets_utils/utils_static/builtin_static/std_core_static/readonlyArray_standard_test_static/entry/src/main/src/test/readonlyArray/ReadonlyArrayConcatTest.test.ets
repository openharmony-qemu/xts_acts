'use static'
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class ReadonlyArrayConcatObject019 {
}

class ConcatItemExt {
  value: int = 0;
  constructor(v: int) { this.value = v; }
}

class OptItem121 {
  id: int = 0;
  name?: string;
}

interface LitItem121 {
  a: int;
  b: string;
}

interface IdItem121 {
  id: int;
}

class IdImpl121 implements IdItem121 {
  id: int = 0;
  constructor(id: int) { this.id = id; }
}

type IntFn121 = (x: int) => int;

class ComboObjarr {
  id: int = 1;
}

export default function ReadonlyArrayConcatTest(): void {
  describe('ReadonlyArrayConcatTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0010
     * @tc.name testReadonlyArrayConcat001
     * @tc.desc Verify ReadonlyArray.concat behavior: calling without parameters when concat returns original array shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.concat();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result === values).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0020
     * @tc.name testReadonlyArrayConcat002
     * @tc.desc Verify ReadonlyArray.concat behavior: passing single ConcatArray parameter verify merge result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const more: ConcatArray<int> = [3, 4];
      const result = values.concat(more);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0030
     * @tc.name testReadonlyArrayConcat003
     * @tc.desc Verify ReadonlyArray.concat behavior: passing multiple ConcatArray parameter verify merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const arr1: ConcatArray<int> = [3, 4];
      const arr2: ConcatArray<int> = [5, 6];
      const arr3: ConcatArray<int> = [7, 8];
      const result = values.concat(arr1, arr2, arr3);
      expect(result.length).assertEqual(8);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(result[5]).assertEqual(6);
      expect(result[6]).assertEqual(7);
      expect(result[7]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0040
     * @tc.name testReadonlyArrayConcat004
     * @tc.desc Verify ReadonlyArray.concat behavior: calling without parameters returns and original array content reference different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20];
      const result = values.concat();
      expect(result.length).assertEqual(values.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[1]).assertEqual(values[1]);
      expect(result === values).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0050
     * @tc.name testReadonlyArrayConcat005
     * @tc.desc Verify ReadonlyArray.concat behavior: passing multiple ConcatArray parameter verify parameter merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["a"];
      const arr1: ConcatArray<string> = ["b"];
      const arr2: ConcatArray<string> = ["c"];
      const result = values.concat(arr1, arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0060
     * @tc.name testReadonlyArrayConcat006
     * @tc.desc Verify ReadonlyArray.concat behavior: passing empty ConcatArray returns original array element new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const empty: ConcatArray<int> = [];
      const result = values.concat(empty);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result === values).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0070
     * @tc.name testReadonlyArrayConcat007
     * @tc.desc Verify ReadonlyArray.concat behavior: passing length is 1 ConcatArray verify element merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const single: ConcatArray<int> = [99];
      const result = values.concat(single);
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0080
     * @tc.name testReadonlyArrayConcat008
     * @tc.desc Verify ReadonlyArray.concat behavior: passing length ConcatArray verify merge result correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const large: Array<int> = [];
      for (let i = 0; i < 1000; i++) {
        large.push(i);
      }
      const largeConcat: ConcatArray<int> = large as ConcatArray<int>;
      const result = values.concat(largeConcat);
      expect(result.length).assertEqual(1002);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(0);
      expect(result[1001]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0090
     * @tc.name testReadonlyArrayConcat009
     * @tc.desc Verify ReadonlyArray.concat behavior: string generic type ReadonlyArray ConcatArray merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["hello", "world"];
      const more: ConcatArray<string> = ["foo", "bar"];
      const result = values.concat(more);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("hello");
      expect(result[2]).assertEqual("foo");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0100
     * @tc.name testReadonlyArrayConcat010
     * @tc.desc Verify ReadonlyArray.concat behavior: double generic type ReadonlyArray ConcatArray merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<double> = [1.1, 2.2];
      const more: ConcatArray<double> = [3.3, 4.4];
      const result = values.concat(more);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertClose(1.1, 0.001);
      expect(result[2]).assertClose(3.3, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0110
     * @tc.name testReadonlyArrayConcat011
     * @tc.desc Verify ReadonlyArray.concat behavior: passing and original array element same ConcatArray verify merge after element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const same: ConcatArray<int> = [1, 2, 3];
      const result = values.concat(same);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0120
     * @tc.name testReadonlyArrayConcat012
     * @tc.desc Verify ReadonlyArray.concat behavior: non - empty array merge result element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const more: ConcatArray<int> = [4, 5, 6];
      const result = values.concat(more);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0130
     * @tc.name testReadonlyArrayConcat013
     * @tc.desc Verify ReadonlyArray.concat behavior: calling without parameters when returns and original array content same new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const result = values.concat();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
      expect(result === values).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0140
     * @tc.name testReadonlyArrayConcat014
     * @tc.desc Verify ReadonlyArray.concat behavior: passing empty ConcatArray returns and original array element new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5, 10, 15];
      const empty: ConcatArray<int> = [];
      const result = values.concat(empty);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(10);
      expect(result[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0150
     * @tc.name testReadonlyArrayConcat015
     * @tc.desc Verify ReadonlyArray.concat behavior: passing multiple ConcatArray parameter by parameter order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1];
      const a: ConcatArray<int> = [2];
      const b: ConcatArray<int> = [3];
      const c: ConcatArray<int> = [4];
      const result = values.concat(a, b, c);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0160
     * @tc.name testReadonlyArrayConcat016
     * @tc.desc Verify ReadonlyArray.concat behavior: merge after length = original array length + parameter length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const arr1: ConcatArray<int> = [3, 4, 5];
      const arr2: ConcatArray<int> = [6, 7];
      const result = values.concat(arr1, arr2);
      expect(result.length).assertEqual(values.length + arr1.length + arr2.length);
      expect(result.length).assertEqual(7);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
      expect(result[5]).assertEqual(6);
      expect(result[6]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0170
     * @tc.name testReadonlyArrayConcat017
     * @tc.desc Verify ReadonlyArray.concat behavior: empty ReadonlyArray merge non - empty ConcatArray result parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const more: ConcatArray<int> = [1, 2, 3];
      const result = values.concat(more);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0180
     * @tc.name testReadonlyArrayConcat018
     * @tc.desc Verify ReadonlyArray.concat behavior: concat return value and original array different reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const more: ConcatArray<int> = [4, 5];
      const result = values.concat(more);
      expect(result === values).assertFalse();
      expect(result === more).assertFalse();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0190
     * @tc.name testReadonlyArrayConcat019
     * @tc.desc Verify ReadonlyArray.concat behavior: modifying concat returns new array original array content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const more: ConcatArray<int> = [4, 5];
      const result: Array<int> = values.concat(more);
      expect(result.length).assertEqual(5);
      result.push(99);
      expect(result.length).assertEqual(6);
      expect(result[5]).assertEqual(99);
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0200
     * @tc.name testReadonlyArrayConcat020
     * @tc.desc Verify ReadonlyArray.concat behavior: merge object element when shallow copy object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ReadonlyArrayConcatObject019 = new ReadonlyArrayConcatObject019();
      const values: ReadonlyArray<Object> = [obj];
      const more: ConcatArray<Object> = [];
      const result = values.concat(more);
      expect(result.length).assertEqual(1);
      expect(result[0] === obj).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0210
     * @tc.name testReadonlyArrayConcat021
     * @tc.desc Verify ReadonlyArray.concat behavior: merge same element result element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 2];
      const more: ConcatArray<int> = [2, 3, 3];
      const result = values.concat(more);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(3);
      expect(result[5]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0220
     * @tc.name testReadonlyArrayConcat022
     * @tc.desc Verify ReadonlyArray.concat behavior: concat returns type is Array<T> modifying
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const more: ConcatArray<int> = [3, 4];
      const result: Array<int> = values.concat(more);
      expect(result.length).assertEqual(4);
      result.push(5);
      expect(result.length).assertEqual(5);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0230
     * @tc.name testReadonlyArrayConcat023
     * @tc.desc Verify ReadonlyArray.concat behavior: returns element type and generic parameter T
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["a", "b"];
      const more: ConcatArray<string> = ["c"];
      const result: Array<string> = values.concat(more);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[2]).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0240
     * @tc.name testReadonlyArrayConcat024
     * @tc.desc Verify ReadonlyArray.concat behavior: verify length result.length = this.length + items 0.length +... + items n.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const arr1: ConcatArray<int> = [3];
      const arr2: ConcatArray<int> = [4, 5, 6];
      const result = values.concat(arr1, arr2);
      const expectedLength = values.length + arr1.length + arr2.length;
      expect(result.length).assertEqual(expectedLength);
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0250
     * @tc.name testReadonlyArrayConcat025
     * @tc.desc Verify ReadonlyArray.concat behavior: merge element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<int> = [];
      const more: Array<int> = [];
      for (let i = 0; i < 10000; i++) {
        values.push(i);
        more.push(i + 10000);
      }
      const roValues: ReadonlyArray<int> = values as ReadonlyArray<int>;
      const concatMore: ConcatArray<int> = more as ConcatArray<int>;
      const result = roValues.concat(concatMore);
      expect(result.length).assertEqual(20000);
      expect(result[0]).assertEqual(0);
      expect(result[9999]).assertEqual(9999);
      expect(result[10000]).assertEqual(10000);
      expect(result[19999]).assertEqual(19999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0260
     * @tc.name testReadonlyArrayConcat026
     * @tc.desc Verify ReadonlyArray.concat behavior: multiple large array when merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<int> = [];
      const arr1: Array<int> = [];
      const arr2: Array<int> = [];
      for (let i = 0; i < 1000; i++) {
        values.push(i);
        arr1.push(i + 1000);
        arr2.push(i + 2000);
      }
      const roValues: ReadonlyArray<int> = values as ReadonlyArray<int>;
      const c1: ConcatArray<int> = arr1 as ConcatArray<int>;
      const c2: ConcatArray<int> = arr2 as ConcatArray<int>;
      const result = roValues.concat(c1, c2);
      expect(result.length).assertEqual(3000);
      expect(result[0]).assertEqual(0);
      expect(result[1000]).assertEqual(1000);
      expect(result[2000]).assertEqual(2000);
      expect(result[2999]).assertEqual(2999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0270
     * @tc.name testReadonlyArrayConcat027
     * @tc.desc Verify ReadonlyArray.concat behavior: element and element merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [42];
      const more: ConcatArray<int> = [99];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(42);
      expect(result[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0280
     * @tc.name testReadonlyArrayConcat028
     * @tc.desc Verify ReadonlyArray.concat behavior: concat after ReadonlyArray content length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const more: ConcatArray<int> = [4, 5];
      const result = values.concat(more);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0290
     * @tc.name testReadonlyArrayConcat029
     * @tc.desc Verify ReadonlyArray.concat behavior: concat returns different reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const more: ConcatArray<int> = [3, 4];
      const result1 = values.concat(more);
      const result2 = values.concat(more);
      expect(result1 === result2).assertFalse();
      expect(result1).assertDeepEquals(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0300
     * @tc.name testReadonlyArrayConcat030
     * @tc.desc Verify ReadonlyArray.concat behavior: concat returns Array<T> push pop modifying
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const more: ConcatArray<int> = [3, 4];
      const result: Array<int> = values.concat(more);
      expect(result.length).assertEqual(4);
      result.push(5);
      expect(result.length).assertEqual(5);
      expect(result[4]).assertEqual(5);
      result.pop();
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0310
     * @tc.name testReadonlyArrayConcat031
     * @tc.desc Verify ReadonlyArray.concat behavior: ReadonlyArray <boolean> and ConcatArray<boolean> merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<boolean> = [true, false];
      const more: ConcatArray<boolean> = [false, true];
      const result = values.concat(more);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
      expect(result[2]).assertFalse();
      expect(result[3]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0320
     * @tc.name testReadonlyArrayConcat032
     * @tc.desc Verify ReadonlyArray.concat behavior: concat merge int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0x10, 0o10];
      const more: ConcatArray<int> = [0b10, 99];
      const result = values.concat(more);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(0x10);
      expect(result[1]).assertEqual(0o10);
      expect(result[2]).assertEqual(0b10);
      expect(result[3]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0330
     * @tc.name testReadonlyArrayConcat033
     * @tc.desc Verify ReadonlyArray.concat behavior: concat merge empty Unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cn: string = "\u4e2d\u6587";
      const values: ReadonlyArray<string> = ["", cn];
      const more: ConcatArray<string> = [" ", "tail"];
      const result = values.concat(more);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual(cn);
      expect(result[2]).assertEqual(" ");
      expect(result[3]).assertEqual("tail");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0340
     * @tc.name testReadonlyArrayConcat034
     * @tc.desc Verify ReadonlyArray.concat behavior: concat after original array length and content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const more: ConcatArray<int> = [3];
      values.concat(more);
      expect(values.length).assertEqual(2);
      expect(values[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0350
     * @tc.name testReadonlyArrayConcat035
     * @tc.desc Verify ReadonlyArray.concat behavior: concat result and ReadonlyArray reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20];
      const result = values.concat();
      expect(result === values).assertFalse();
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0360
     * @tc.name testReadonlyArrayConcat036
     * @tc.desc Verify ReadonlyArray.concat behavior: concat merge byte type ReadonlyArray and ConcatArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<byte> = [10 as byte];
      const more: ConcatArray<byte> = [20 as byte, 30 as byte];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
      expect(result[2]).assertEqual(30 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0370
     * @tc.name testReadonlyArrayConcat037
     * @tc.desc Verify ReadonlyArray.concat behavior: concat merge short type ReadonlyArray and ConcatArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<short> = [100 as short];
      const more: ConcatArray<short> = [200 as short];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0380
     * @tc.name testReadonlyArrayConcat038
     * @tc.desc Verify ReadonlyArray.concat behavior: concat merge long type ReadonlyArray and ConcatArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<long> = [0];
      const more: ConcatArray<long> = [100, 200];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
      expect(result[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0390
     * @tc.name testReadonlyArrayConcat039
     * @tc.desc Verify ReadonlyArray.concat behavior: concat merge float type ReadonlyArray and ConcatArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<float> = [1.0f];
      const more: ConcatArray<float> = [2.0, 3.0];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
      expect(result[2]).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0400
     * @tc.name testReadonlyArrayConcat040
     * @tc.desc Verify ReadonlyArray.concat behavior: concat merge char type ReadonlyArray and ConcatArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<char> = [c'a'];
      const more: ConcatArray<char> = [c'b', c'c'];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
      expect(result[2]).assertEqual(c'c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0410
     * @tc.name testReadonlyArrayConcat041
     * @tc.desc Verify ReadonlyArray.concat behavior: concat merge string type ReadonlyArray and ConcatArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["a"];
      const more: ConcatArray<string> = ["\uD83D\uDE00", "b"];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
      expect(result[2]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0420
     * @tc.name testReadonlyArrayConcat042
     * @tc.desc Verify ReadonlyArray.concat behavior: concat merge boolean type ReadonlyArray and ConcatArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<boolean> = [true];
      const more: ConcatArray<boolean> = [false, true];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
      expect(result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0430
     * @tc.name testReadonlyArrayConcat043
     * @tc.desc Verify ReadonlyArray.concat behavior: 100 element int merge empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 100; i++) { source.push(i); }
      const values: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const more: ConcatArray<int> = [];
      const result = values.concat(more);
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(0);
      expect(result[50]).assertEqual(50);
      expect(result[99]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0440
     * @tc.name testReadonlyArrayConcat044
     * @tc.desc Verify ReadonlyArray.concat behavior: concat - 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2147483647];
      const more: ConcatArray<int> = [-2147483648];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0450
     * @tc.name testReadonlyArrayConcat045
     * @tc.desc Verify ReadonlyArray.concat behavior: single-string concat preserves both elements across special-form string samples (CJK, email, long digits, numeric-literal-like, scientific notation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples: Array<Array<string>> = [
        ["테스트", "en"],
        ["test@example.com", "x"],
        ["310101199001011234", "y"],
        ["0x123", "0o123"],
        ["123.45e6", "plain"],
      ];
      for (let i: int = 0; i < samples.length; i++) {
        const values: ReadonlyArray<string> = [samples[i][0]];
        const more: ConcatArray<string> = [samples[i][1]];
        const result = values.concat(more);
        expect(result.length).assertEqual(values.length + more.length);
        expect(result[0]).assertEqual(values[0]);
        expect(result[values.length]).assertEqual(more[0]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0460
     * @tc.name testReadonlyArrayConcat046
     * @tc.desc Verify ReadonlyArray.concat behavior: concat 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<long> = [9223372036854775807];
      const more: ConcatArray<long> = [0];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0470
     * @tc.name testReadonlyArrayConcat047
     * @tc.desc Verify ReadonlyArray.concat behavior: concat 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<float> = [Double.toFloat(Number.POSITIVE_INFINITY)];
      const more: ConcatArray<float> = [1.0];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0480
     * @tc.name testReadonlyArrayConcat048
     * @tc.desc Verify ReadonlyArray.concat behavior: concat 127 as byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<byte> = [-128 as byte];
      const more: ConcatArray<byte> = [127 as byte];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0490
     * @tc.name testReadonlyArrayConcat049
     * @tc.desc Verify ReadonlyArray.concat behavior: concat 32767 as short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<short> = [-32768 as short];
      const more: ConcatArray<short> = [32767 as short];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0500
     * @tc.name testReadonlyArrayConcat050
     * @tc.desc Verify ReadonlyArray.concat behavior: concat a as char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<char> = [c'\uffff'];
      const more: ConcatArray<char> = [c'a'];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0510
     * @tc.name testReadonlyArrayConcat051
     * @tc.desc Verify ReadonlyArray.concat behavior: concat 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5, 5];
      const more: ConcatArray<int> = [5];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0520
     * @tc.name testReadonlyArrayConcat052
     * @tc.desc Verify ReadonlyArray.concat behavior: concat passing multiple ConcatArray parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1];
      const m1: ConcatArray<int> = [2];
      const m2: ConcatArray<int> = [3, 4];
      const result = values.concat(m1, m2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0530
     * @tc.name testReadonlyArrayConcat053
     * @tc.desc Verify ReadonlyArray.concat behavior: concat merge empty ConcatArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const more: ConcatArray<int> = [];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result === values).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0540
     * @tc.name testReadonlyArrayConcat054
     * @tc.desc Verify ReadonlyArray.concat behavior: empty ReadonlyArray concat non - empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const more: ConcatArray<int> = [1];
      const result = values.concat(more);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0550
     * @tc.name testReadonlyArrayConcat055
     * @tc.desc Verify ReadonlyArray.concat behavior: single-string concat preserves both elements across digit-literal-like string samples (octal-like "0123" vs "123", binary-like "0b1010" vs "1010")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples: Array<Array<string>> = [
        ["0123", "123"],
        ["0b1010", "1010"],
      ];
      for (let i: int = 0; i < samples.length; i++) {
        const values: ReadonlyArray<string> = [samples[i][0]];
        const more: ConcatArray<string> = [samples[i][1]];
        const result = values.concat(more);
        expect(result.length).assertEqual(values.length + more.length);
        expect(result[0]).assertEqual(values[0]);
        expect(result[values.length]).assertEqual(more[0]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0560
     * @tc.name testReadonlyArrayConcat056
     * @tc.desc Verify ReadonlyArray.concat behavior: single-string concat preserves both elements when source is fullwidth em-dash and tail varies (ASCII hyphen / word "dash")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tails: Array<string> = ["-", "dash"];
      for (let i: int = 0; i < tails.length; i++) {
        const values: ReadonlyArray<string> = ["—"];
        const more: ConcatArray<string> = [tails[i]];
        const result = values.concat(more);
        expect(result.length).assertEqual(values.length + more.length);
        expect(result[0]).assertEqual("—");
        expect(result[values.length]).assertEqual(tails[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0570
     * @tc.name testReadonlyArrayConcat057
     * @tc.desc Verify ReadonlyArray.concat behavior: concat a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["path\\to"];
      const more: ConcatArray<string> = ["a"];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0580
     * @tc.name testReadonlyArrayConcat058
     * @tc.desc Verify ReadonlyArray.concat behavior: concat 2, - 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, -1];
      const more: ConcatArray<int> = [2, -2];
      const result = values.concat(more);
      expect(result.length).assertEqual(values.length + more.length);
      expect(result[0]).assertEqual(values[0]);
      expect(result[values.length]).assertEqual(more[0]);
      expect(result[1]).assertEqual(-1);
      expect(result[3]).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0590
     * @tc.name testReadonlyArrayConcat059
     * @tc.desc Verify ReadonlyArray.concat behavior: concat preserves object element reference shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ConcatItemExt = new ConcatItemExt(42);
      const values: ReadonlyArray<ConcatItemExt> = [obj];
      const more: ConcatArray<ConcatItemExt> = [];
      const result = values.concat(more);
      expect(result[0] === values[0]).assertTrue();
      expect(result[0].value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0600
     * @tc.name testReadonlyArrayConcat060
     * @tc.desc Verify ReadonlyArray.concat behavior: concat four ConcatArray arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1];
      const m1: ConcatArray<int> = [2];
      const m2: ConcatArray<int> = [3];
      const m3: ConcatArray<int> = [4];
      const m4: ConcatArray<int> = [5];
      const result = values.concat(m1, m2, m3, m4);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0610
     * @tc.name testReadonlyArrayConcat061
     * @tc.desc Verify ReadonlyArray.concat behavior: concat array containing float NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const values: ReadonlyArray<float> = [nan];
      const more: ConcatArray<float> = [1.0f];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(Number.isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0620
     * @tc.name testReadonlyArrayConcat062
     * @tc.desc Verify ReadonlyArray.concat behavior: single-string concat preserves both elements across multilingual script samples (Japanese, Korean, Cyrillic, Arabic)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples: Array<Array<string>> = [
        ["テスト", "suffix"],
        ["테스트", "ko"],
        ["АБВГД", "ru"],
        ["الاختبار", "ar"],
      ];
      for (let i: int = 0; i < samples.length; i++) {
        const values: ReadonlyArray<string> = [samples[i][0]];
        const more: ConcatArray<string> = [samples[i][1]];
        const result = values.concat(more);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(samples[i][0]);
        expect(result[1]).assertEqual(samples[i][1]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0630
     * @tc.name testReadonlyArrayConcat063
     * @tc.desc Verify ReadonlyArray.concat behavior: single-string concat preserves both elements across numeric / formatted-text string samples (email, phone, hex, octal-like, binary-like, scientific notation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples: Array<Array<string>> = [
        ["test@example.com", "backup@test.com"],
        ["13800138000", "13900139000"],
        ["0x123", "0x456"],
        ["0123", "0456"],
        ["0b1010", "0b1111"],
        ["123.45e6", "9.9e-3"],
      ];
      for (let i: int = 0; i < samples.length; i++) {
        const values: ReadonlyArray<string> = [samples[i][0]];
        const more: ConcatArray<string> = [samples[i][1]];
        const result = values.concat(more);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(samples[i][0]);
        expect(result[1]).assertEqual(samples[i][1]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0640
     * @tc.name testReadonlyArrayConcat064
     * @tc.desc Verify ReadonlyArray.concat behavior: single-string concat preserves both elements across malformed/unusual string samples (mojibake, U+FFFD replacement character, lone low-surrogate U+DC04)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples: Array<Array<string>> = [
        ["æµè¯", "plain"],
        ["�", "ok"],
        ["\udc04", "safe"],
      ];
      for (let i: int = 0; i < samples.length; i++) {
        const values: ReadonlyArray<string> = [samples[i][0]];
        const more: ConcatArray<string> = [samples[i][1]];
        const result = values.concat(more);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(samples[i][0]);
        expect(result[1]).assertEqual(samples[i][1]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0650
     * @tc.name testReadonlyArrayConcat065
     * @tc.desc Verify ReadonlyArray.concat behavior: merge XSS script string element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["<script>alert(1)</script>"];
      const more: ConcatArray<string> = ["tail"];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("<script>alert(1)</script>");
      expect(result[1]).assertEqual("tail");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0660
     * @tc.name testReadonlyArrayConcat066
     * @tc.desc Verify ReadonlyArray.concat behavior: merge 100 character string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "";
      for (let i: int = 0; i < 100; i++) {
        longStr = longStr + "a";
      }
      const values: ReadonlyArray<string> = [longStr];
      const more: ConcatArray<string> = ["b"];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(longStr);
      expect(result[0].length).assertEqual(100);
      expect(result[1]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0670
     * @tc.name testReadonlyArrayConcat067
     * @tc.desc Verify ReadonlyArray.concat behavior: merge mixed language string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["Test 測試"];
      const more: ConcatArray<string> = ["Mix"];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("Test 測試");
      expect(result[1]).assertEqual("Mix");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0680
     * @tc.name testReadonlyArrayConcat068
     * @tc.desc Verify ReadonlyArray.concat behavior: merge byte boundary value zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<byte> = [0 as byte];
      const more: ConcatArray<byte> = [1 as byte];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0 as byte);
      expect(result[1]).assertEqual(1 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0690
     * @tc.name testReadonlyArrayConcat069
     * @tc.desc Verify ReadonlyArray.concat behavior: merge byte boundary value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<byte> = [127 as byte];
      const more: ConcatArray<byte> = [126 as byte];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(127 as byte);
      expect(result[1]).assertEqual(126 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0700
     * @tc.name testReadonlyArrayConcat070
     * @tc.desc Verify ReadonlyArray.concat behavior: merge byte boundary value negative 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<byte> = [-128 as byte];
      const more: ConcatArray<byte> = [-127 as byte];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(-128 as byte);
      expect(result[1]).assertEqual(-127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0710
     * @tc.name testReadonlyArrayConcat071
     * @tc.desc Verify ReadonlyArray.concat behavior: merge byte hex boundary 0x0A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<byte> = [0x0A as byte];
      const more: ConcatArray<byte> = [0x0B as byte];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0x0A as byte);
      expect(result[1]).assertEqual(0x0B as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0720
     * @tc.name testReadonlyArrayConcat072
     * @tc.desc Verify ReadonlyArray.concat behavior: merge short boundary value zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<short> = [0 as short];
      const more: ConcatArray<short> = [1 as short];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0 as short);
      expect(result[1]).assertEqual(1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0730
     * @tc.name testReadonlyArrayConcat073
     * @tc.desc Verify ReadonlyArray.concat behavior: merge short boundary value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<short> = [32767 as short];
      const more: ConcatArray<short> = [32766 as short];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(32767 as short);
      expect(result[1]).assertEqual(32766 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0740
     * @tc.name testReadonlyArrayConcat074
     * @tc.desc Verify ReadonlyArray.concat behavior: merge short boundary value negative 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<short> = [-32768 as short];
      const more: ConcatArray<short> = [-32767 as short];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(-32768 as short);
      expect(result[1]).assertEqual(-32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0750
     * @tc.name testReadonlyArrayConcat075
     * @tc.desc Verify ReadonlyArray.concat behavior: merge int boundary value zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0];
      const more: ConcatArray<int> = [1];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0760
     * @tc.name testReadonlyArrayConcat076
     * @tc.desc Verify ReadonlyArray.concat behavior: merge int boundary value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [2147483647];
      const more: ConcatArray<int> = [2147483646];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2147483647);
      expect(result[1]).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0770
     * @tc.name testReadonlyArrayConcat077
     * @tc.desc Verify ReadonlyArray.concat behavior: merge int boundary value negative 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [-2147483648];
      const more: ConcatArray<int> = [-2147483647];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(-2147483648);
      expect(result[1]).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0780
     * @tc.name testReadonlyArrayConcat078
     * @tc.desc Verify ReadonlyArray.concat behavior: merge int hex literal 0x10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0x10];
      const more: ConcatArray<int> = [0x11];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0x10);
      expect(result[1]).assertEqual(0x11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0790
     * @tc.name testReadonlyArrayConcat079
     * @tc.desc Verify ReadonlyArray.concat behavior: merge int octal literal 0o10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0o10];
      const more: ConcatArray<int> = [0o11];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0o10);
      expect(result[1]).assertEqual(0o11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0800
     * @tc.name testReadonlyArrayConcat080
     * @tc.desc Verify ReadonlyArray.concat behavior: merge int binary literal 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0b1010];
      const more: ConcatArray<int> = [0b1011];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0b1010);
      expect(result[1]).assertEqual(0b1011);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0810
     * @tc.name testReadonlyArrayConcat081
     * @tc.desc Verify ReadonlyArray.concat behavior: merge long boundary value zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<long> = [0];
      const more: ConcatArray<long> = [1];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0820
     * @tc.name testReadonlyArrayConcat082
     * @tc.desc Verify ReadonlyArray.concat behavior: merge long boundary max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<long> = [9223372036854775807];
      const more: ConcatArray<long> = [9223372036854775806];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(9223372036854775807);
      expect(result[1]).assertEqual(9223372036854775806);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0830
     * @tc.name testReadonlyArrayConcat083
     * @tc.desc Verify ReadonlyArray.concat behavior: merge long boundary near minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<long> = [-9223372036854775807];
      const more: ConcatArray<long> = [-9223372036854775806];
      const result = values.concat(more);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(-9223372036854775807);
      expect(result[1]).assertEqual(-9223372036854775806);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0840
     * @tc.name testReadonlyArrayConcat084
     * @tc.desc Verify ReadonlyArray.concat behavior: concat array containing null element preserves null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int | null> = [1, 2];
      const more: ConcatArray<int | null> = [null];
      const result = values.concat(more);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0850
     * @tc.name testReadonlyArrayConcat085
     * @tc.desc Verify ReadonlyArray.concat behavior: concat object element preserves reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ConcatItemExt = new ConcatItemExt(101);
      const values: ReadonlyArray<ConcatItemExt> = [];
      const result = values.concat([obj] as ConcatArray<ConcatItemExt>);
      expect(result.length).assertEqual(1);
      expect(result[0] === obj).assertTrue();
      expect(result[0].value).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0860
     * @tc.name testReadonlyArrayConcat086
     * @tc.desc Verify ReadonlyArray.concat behavior: concat array containing undefined element preserves undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int | undefined> = [1, 2];
      const more: ConcatArray<int | undefined> = [undefined];
      const result = values.concat(more);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0870
     * @tc.name testReadonlyArrayConcat087
     * @tc.desc Verify ReadonlyArray.concat behavior: mixed empty and non - empty ConcatArray arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const empty: ConcatArray<int> = [];
      const one: ConcatArray<int> = [1];
      const result = values.concat(empty, one, empty);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0880
     * @tc.name testReadonlyArrayConcat088
     * @tc.desc Verify ReadonlyArray.concat behavior: concat with single 10000 element ConcatArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0];
      const more: Array<int> = [];
      for (let i: int = 0; i < 10000; i++) {
        more.push(i);
      }
      const result = values.concat(more as ConcatArray<int>);
      expect(result.length).assertEqual(10001);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[10000]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0890
     * @tc.name testReadonlyArrayConcat089
     * @tc.desc Verify ReadonlyArray.concat behavior: concat 100 element arrays to length 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valuesArr: Array<int> = [];
      const moreArr: Array<int> = [];
      for (let i: int = 0; i < 100; i++) {
        valuesArr.push(i);
        moreArr.push(i + 100);
      }
      const values: ReadonlyArray<int> = valuesArr as ReadonlyArray<int>;
      const more: ConcatArray<int> = moreArr as ConcatArray<int>;
      const result = values.concat(more);
      expect(result.length).assertEqual(200);
      expect(result[0]).assertEqual(0);
      expect(result[99]).assertEqual(99);
      expect(result[100]).assertEqual(100);
      expect(result[199]).assertEqual(199);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0900
     * @tc.name testReadonlyArrayConcat090
     * @tc.desc Verify ReadonlyArray.concat behavior: concat result supports push mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const result: Array<int> = values.concat([3] as ConcatArray<int>);
      result.push(4);
      expect(result.length).assertEqual(4);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0910
     * @tc.name testReadonlyArrayConcat091
     * @tc.desc Verify ReadonlyArray.concat behavior: concat result supports pop mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const result: Array<int> = values.concat([3, 4] as ConcatArray<int>);
      const popped = result.pop();
      expect(result.length).assertEqual(3);
      expect(popped).assertEqual(4);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0920
     * @tc.name testReadonlyArrayConcat092
     * @tc.desc Verify ReadonlyArray.concat behavior: concat result supports splice mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2];
      const result: Array<int> = values.concat([3, 4] as ConcatArray<int>);
      result.splice(1, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0930
     * @tc.name testReadonlyArrayConcat093
     * @tc.desc Verify ReadonlyArray.concat behavior: original ReadonlyArray unchanged after concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [42];
      const result = values.concat([99] as ConcatArray<int>);
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual(42);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_CONCAT_0940
     * @tc.name testReadonlyArrayConcat094
     * @tc.desc Verify ReadonlyArray.concat behavior: concat Japanese and Korean string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayConcat094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ja: ConcatArray<string> = ["テスト"];
      const ko: ConcatArray<string> = ["테스트"];
      const values: ReadonlyArray<string> = [];
      const result = values.concat(ja, ko);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("テスト");
      expect(result[1]).assertEqual("테스트");
    });

  });
}
