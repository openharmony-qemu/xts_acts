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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

class ComboObjarr {
  id: int = 1;
}

class ReadonlyArrayValuesGeneratedItem {
  id: int = 0;

  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayValuesTest(): void {
  describe('ReadonlyArrayValuesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0010
     * @tc.name testReadonlyArrayValues001
     * @tc.desc Verify ReadonlyArray.values behavior: values calling without parameters returns element iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const iter = arr.values();
      expect(iter != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0020
     * @tc.name testReadonlyArrayValues002
     * @tc.desc Verify ReadonlyArray.values behavior: values returns IterableIterator<T> for...of iteration element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const iter = arr.values();
      let count = 0;
      for (const val of iter) {
        expect(val).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0030
     * @tc.name testReadonlyArrayValues003
     * @tc.desc Verify ReadonlyArray.values behavior: empty array values returns empty iterator iteration is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      let count = 0;
      for (const val of arr.values()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0040
     * @tc.name testReadonlyArrayValues004
     * @tc.desc Verify ReadonlyArray.values behavior: element values returns element iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [42];
      for (const val of arr.values()) {
        expect(val).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0050
     * @tc.name testReadonlyArrayValues005
     * @tc.desc Verify ReadonlyArray.values behavior: iteration values iterator when break break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      for (const val of arr.values()) {
        expect(val).assertEqual(1);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0060
     * @tc.name testReadonlyArrayValues006
     * @tc.desc Verify ReadonlyArray.values behavior: ReadonlyArray <string> values returns string iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["hello", "world"];
      let index: int = 0;
      for (const val of arr.values()) {
        expect(val).assertEqual(arr[index]);
        index++;
      }
      expect(index).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0070
     * @tc.name testReadonlyArrayValues007
     * @tc.desc Verify ReadonlyArray.values behavior: ReadonlyArray <double> values returns double iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.1, 2.2, 3.3];
      let index: int = 0;
      for (const val of arr.values()) {
        expect(val).assertClose(arr[index], 0.001);
        index++;
      }
      expect(index).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0080
     * @tc.name testReadonlyArrayValues008
     * @tc.desc Verify ReadonlyArray.values behavior: returns iterator next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      const iter = arr.values();
      const first = iter.next();
      expect(first.value).assertEqual(10);
      expect(first.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0090
     * @tc.name testReadonlyArrayValues009
     * @tc.desc Verify ReadonlyArray.values behavior: iterator iteration after next returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1];
      const iter = arr.values();
      iter.next();
      const second = iter.next();
      expect(second.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0100
     * @tc.name testReadonlyArrayValues010
     * @tc.desc Verify ReadonlyArray.values behavior: verify values return value is IterableIterator type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2];
      const iter = arr.values();
      const r = iter.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0110
     * @tc.name testReadonlyArrayValues011
     * @tc.desc Verify ReadonlyArray.values behavior: large array values iterator iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) {
        source.push(i);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let count = 0;
      for (const val of arr.values()) {
        expect(val).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0120
     * @tc.name testReadonlyArrayValues012
     * @tc.desc Verify ReadonlyArray.values behavior: values returns iterator modifying original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      for (const val of arr.values()) {
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0130
     * @tc.name testReadonlyArrayValues013
     * @tc.desc Verify ReadonlyArray.values behavior: values returns iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2];
      const iter1 = arr.values();
      const iter2 = arr.values();
      const r1 = iter1.next();
      const r2 = iter2.next();
      expect(r1.value).assertEqual(r2.value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0140
     * @tc.name testReadonlyArrayValues014
     * @tc.desc Verify ReadonlyArray.values behavior: ReadonlyArray <boolean> values returns boolean element iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const collected: boolean[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(true);
      expect(collected[1]).assertEqual(false);
      expect(collected[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0150
     * @tc.name testReadonlyArrayValues015
     * @tc.desc Verify ReadonlyArray.values behavior: 0 when values by order returns element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 5];
      const expected: Array<int> = [0, -1, 5];
      let idx: int = 0;
      for (const val of arr.values()) {
        expect(val).assertEqual(expected[idx]);
        idx++;
      }
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0160
     * @tc.name testReadonlyArrayValues016
     * @tc.desc Verify ReadonlyArray.values behavior: iteration values iterator when continue element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      let sum: int = 0;
      for (const val of arr.values()) {
        if (val === 2) {
          continue;
        }
        sum += val;
      }
      expect(sum).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0170
     * @tc.name testReadonlyArrayValues017
     * @tc.desc Verify ReadonlyArray.values behavior: while next values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const iter = arr.values();
      let step = iter.next();
      expect(step.done).assertFalse();
      expect(step.value).assertEqual(10);
      step = iter.next();
      expect(step.value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0180
     * @tc.name testReadonlyArrayValues018
     * @tc.desc Verify ReadonlyArray.values behavior: 16/8/2 int ReadonlyArray values returns correctly element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      let idx: int = 0;
      for (const val of arr.values()) {
        expect(val).assertEqual(arr[idx]);
        idx++;
      }
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0190
     * @tc.name testReadonlyArrayValues019
     * @tc.desc Verify ReadonlyArray.values behavior: 0 - 1 int values iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 1000000];
      let sum: int = 0;
      for (const val of arr.values()) {
        sum += val;
      }
      expect(sum).assertEqual(999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0200
     * @tc.name testReadonlyArrayValues020
     * @tc.desc Verify ReadonlyArray.values behavior: empty empty element string values iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["", " ", "text"];
      const collected: string[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual("");
      expect(collected[2]).assertEqual("text");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0210
     * @tc.name testReadonlyArrayValues021
     * @tc.desc Verify ReadonlyArray.values behavior: Unicode element string values iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cn: string = "\u4e2d\u6587";
      const arr: ReadonlyArray<string> = ["a", cn, "b"];
      let found: boolean = false;
      for (const val of arr.values()) {
        if (val === cn) {
          found = true;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0220
     * @tc.name testReadonlyArrayValues022
     * @tc.desc Verify ReadonlyArray.values behavior: empty element string values iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zwsp: string = "\u200B";
      const arr: ReadonlyArray<string> = ["a", zwsp, "c"];
      const collected: string[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual("a");
      expect(collected[1]).assertEqual(zwsp);
      expect(collected[2]).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0230
     * @tc.name testReadonlyArrayValues023
     * @tc.desc Verify ReadonlyArray.values behavior: by API verify values element is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let firstValue: int = -1;
      for (const value of values.values()) {
        firstValue = value;
        break;
      }
      expect(firstValue).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0240
     * @tc.name testReadonlyArrayValues024
     * @tc.desc Verify ReadonlyArray.values behavior: byte values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 30 as byte];
      const collected: byte[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(10 as byte);
      expect(collected[arr.length - 1]).assertEqual(30 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0250
     * @tc.name testReadonlyArrayValues025
     * @tc.desc Verify ReadonlyArray.values behavior: float ReadonlyArray values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [-0.0f, 1.0f];
      const collected: float[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(-0.0f);
      expect(collected[arr.length - 1]).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0260
     * @tc.name testReadonlyArrayValues026
     * @tc.desc Verify ReadonlyArray.values behavior: byte ReadonlyArray values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 0 as byte, 127 as byte];
      const collected: byte[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(-128 as byte);
      expect(collected[arr.length - 1]).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0270
     * @tc.name testReadonlyArrayValues027
     * @tc.desc Verify ReadonlyArray.values behavior: short ReadonlyArray values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [0 as short, 100 as short, 200 as short];
      const collected: short[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(0 as short);
      expect(collected[arr.length - 1]).assertEqual(200 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0280
     * @tc.name testReadonlyArrayValues028
     * @tc.desc Verify ReadonlyArray.values behavior: long ReadonlyArray values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [0, 100, -1];
      const collected: long[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(0 as long);
      expect(collected[arr.length - 1]).assertEqual(-1 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0290
     * @tc.name testReadonlyArrayValues029
     * @tc.desc Verify ReadonlyArray.values behavior: char ReadonlyArray values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\uffff', c'a', c'b'];
      const collected: char[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(c'\uffff');
      expect(collected[arr.length - 1]).assertEqual(c'b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0300
     * @tc.name testReadonlyArrayValues030
     * @tc.desc Verify ReadonlyArray.values behavior: 8 ReadonlyArray values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["0123", "123"];
      const collected: string[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual("0123");
      expect(collected[arr.length - 1]).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0310
     * @tc.name testReadonlyArrayValues031
     * @tc.desc Verify ReadonlyArray.values behavior: 2 ReadonlyArray values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["0b1010", "1010"];
      const collected: string[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual("0b1010");
      expect(collected[arr.length - 1]).assertEqual("1010");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0320
     * @tc.name testReadonlyArrayValues032
     * @tc.desc Verify ReadonlyArray.values behavior: ReadonlyArray values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["path\\to", "a"];
      const collected: string[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual("path\\to");
      expect(collected[arr.length - 1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0330
     * @tc.name testReadonlyArrayValues033
     * @tc.desc Verify ReadonlyArray.values behavior: whitespace and plain string values iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["  test \t", "plain"];
      const collected: string[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual("  test \t");
      expect(collected[arr.length - 1]).assertEqual("plain");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0340
     * @tc.name testReadonlyArrayValues034
     * @tc.desc Verify ReadonlyArray.values behavior: ReadonlyArray values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, -1, 2, -2];
      const collected: int[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(1);
      expect(collected[arr.length - 1]).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0350
     * @tc.name testReadonlyArrayValues035
     * @tc.desc Verify ReadonlyArray.values behavior: XSS ReadonlyArray values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["safe", "<script>alert(1)</script>"];
      const collected: string[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual("safe");
      expect(collected[arr.length - 1]).assertEqual("<script>alert(1)</script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0360
     * @tc.name testReadonlyArrayValues036
     * @tc.desc Verify ReadonlyArray.values behavior: false boolean ReadonlyArray values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [false, false];
      const collected: boolean[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(false);
      expect(collected[arr.length - 1]).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0370
     * @tc.name testReadonlyArrayValues037
     * @tc.desc Verify ReadonlyArray.values behavior: element int ReadonlyArray values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [42];
      const collected: int[] = [];
      for (const val of arr.values()) {
        collected.push(val);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0380
     * @tc.name testReadonlyArrayValues038
     * @tc.desc Verify ReadonlyArray.values behavior: values iterator yields float NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan];
      const iter = arr.values();
      iter.next();
      const second = iter.next();
      expect(second.value !== undefined).assertTrue();
      expect(Number.isNaN(second.value!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0390
     * @tc.name testReadonlyArrayValues039
     * @tc.desc Verify ReadonlyArray.values behavior: iteration matrix - byte boundary - values element value matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 0 as byte, 127 as byte];
      let count: int = 0;
      for (const value of arr.values()) {
        expect(value).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0400
     * @tc.name testReadonlyArrayValues040
     * @tc.desc Verify ReadonlyArray.values behavior: iteration matrix - string - Unicode Chinese - values extended case elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "tail"];
      let count: int = 0;
      for (const value of arr.values()) {
        expect(value).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0410
     * @tc.name testReadonlyArrayValues041
     * @tc.desc Verify ReadonlyArray.values behavior: iteration matrix - double NaN - values floating point elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [1.1, nan, 3.3];
      let count: int = 0;
      for (const value of arr.values()) {
        if (count === 1) {
          expect(Number.isNaN(value)).assertTrue();
        }
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0420
     * @tc.name testReadonlyArrayValues042
     * @tc.desc Verify ReadonlyArray.values behavior: iteration matrix - 1000 elements - values last value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) {
        source.push(i);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let last: int = -1;
      for (const value of arr.values()) {
        last = value;
      }
      expect(last).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0430
     * @tc.name testReadonlyArrayValues043
     * @tc.desc Verify ReadonlyArray.values behavior: special elements - Unicode - Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587"];
      const collected: string[] = [];
      for (const item of arr.values()) {
        collected.push(item);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual("\u4e2d\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0440
     * @tc.name testReadonlyArrayValues044
     * @tc.desc Verify ReadonlyArray.values behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      arr.values();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0450
     * @tc.name testReadonlyArrayValues045
     * @tc.desc Verify ReadonlyArray.values behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      let count: int = 0;
      let sum: int = 0;
      for (const value of arr.values()) {
        sum += value;
        count++;
      }
      expect(count).assertEqual(2);
      expect(sum).assertEqual(30);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0460
     * @tc.name testReadonlyArrayValues046
     * @tc.desc Verify ReadonlyArray.values behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      let count: int = 0;
      let firstValue: int = -1;
      let lastValue: int = -1;
      for (const value of arr.values()) {
        if (count === 0) {
          firstValue = value;
        }
        lastValue = value;
        count++;
      }
      expect(count).assertEqual(1024);
      expect(firstValue).assertEqual(0);
      expect(lastValue).assertEqual(1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0470
     * @tc.name testReadonlyArrayValues047
     * @tc.desc Verify ReadonlyArray.values behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let count: int = 0;
      for (const value of arr.values()) {
        expect(value).assertEqual(source[count]);
        count++;
      }
      expect(count).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0480
     * @tc.name testReadonlyArrayValues048
     * @tc.desc Verify ReadonlyArray.values behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const collected: int[] = [];
      for (const item of arr.values()) {
        collected.push(item);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0490
     * @tc.name testReadonlyArrayValues049
     * @tc.desc Verify ReadonlyArray.values behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const collected: string[] = [];
      for (const item of arr.values()) {
        collected.push(item);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0500
     * @tc.name testReadonlyArrayValues050
     * @tc.desc Verify ReadonlyArray.values behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const collected: string[] = [];
      for (const item of arr.values()) {
        collected.push(item);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(arr[0]);
      expect(collected[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0510
     * @tc.name testReadonlyArrayValues051
     * @tc.desc Verify ReadonlyArray.values behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const collected: boolean[] = [];
      for (const item of arr.values()) {
        collected.push(item);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(true);
      expect(collected[arr.length - 1]).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0520
     * @tc.name testReadonlyArrayValues052
     * @tc.desc Verify ReadonlyArray.values behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const collected: double[] = [];
      for (const item of arr.values()) {
        collected.push(item);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(Number.isNaN(collected[0])).assertTrue();
      expect(collected[1]).assertEqual(0.0);
      expect(collected[2]).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0530
     * @tc.name testReadonlyArrayValues053
     * @tc.desc Verify ReadonlyArray.values behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const collected: ComboObjarr[] = [];
      for (const item of arr.values()) {
        collected.push(item);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0] === arr[0]).assertTrue();
      expect(collected[arr.length - 1] === arr[arr.length - 1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0540
     * @tc.name testReadonlyArrayValues054
     * @tc.desc Verify ReadonlyArray.values behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const collected: Array<int>[] = [];
      for (const value of arr.values()) {
        collected.push(value);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0] === arr[0]).assertTrue();
      expect(collected[arr.length - 1] === arr[arr.length - 1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0550
     * @tc.name testReadonlyArrayValues055
     * @tc.desc Verify ReadonlyArray.values behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const collected: int[] = [];
      for (const value of arr.values()) {
        collected.push(value);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(1);
      expect(collected[arr.length - 1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0560
     * @tc.name testReadonlyArrayValues056
     * @tc.desc Verify ReadonlyArray.values behavior: iterator after exhaustion next() repeatedly continues to return done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 8];
      const iter = arr.values();
      iter.next();
      iter.next();
      const after1 = iter.next();
      const after2 = iter.next();
      const after3 = iter.next();
      expect(after1.done).assertTrue();
      expect(after2.done).assertTrue();
      expect(after3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0570
     * @tc.name testReadonlyArrayValues057
     * @tc.desc Verify ReadonlyArray.values behavior: two independent iterators alternating next() do not share state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const iter1 = arr.values();
      const iter2 = arr.values();
      expect(iter1.next().value).assertEqual(10);
      expect(iter2.next().value).assertEqual(10);
      expect(iter1.next().value).assertEqual(20);
      expect(iter2.next().value).assertEqual(20);
      expect(iter1.next().value).assertEqual(30);
      expect(iter2.next().value).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0580
     * @tc.name testReadonlyArrayValues058
     * @tc.desc Verify ReadonlyArray.values behavior: spread operator on values iterator collects all elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [11, 22, 33];
      const collected: Array<int> = [...arr.values()];
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(11);
      expect(collected[1]).assertEqual(22);
      expect(collected[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0590
     * @tc.name testReadonlyArrayValues059
     * @tc.desc Verify ReadonlyArray.values behavior: returned object supports Symbol.iterator iterable protocol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 6, 7];
      const iter = arr.values();
      const collected: Array<int> = [];
      for (const v of iter) {
        collected.push(v);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(5);
      expect(collected[1]).assertEqual(6);
      expect(collected[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0600
     * @tc.name testReadonlyArrayValues060
     * @tc.desc Verify ReadonlyArray.values behavior: nested for-of loops with separate iterators do not interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const expected: ReadonlyArray<string> = ["1,1", "1,2", "1,3", "2,1", "2,2", "2,3", "3,1", "3,2", "3,3"];
      let idx: int = 0;
      for (const a of arr.values()) {
        for (const b of arr.values()) {
          expect(a.toString() + "," + b.toString()).assertEqual(expected[idx]);
          idx++;
        }
      }
      expect(idx).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0610
     * @tc.name testReadonlyArrayValues061
     * @tc.desc Verify ReadonlyArray.values behavior: iteration of ReadonlyArray<int | undefined> yields undefined as a valid value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int | undefined> = [1, undefined, 3];
      const collected: Array<int | undefined> = [];
      for (const v of arr.values()) {
        collected.push(v);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(undefined);
      expect(collected[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0620
     * @tc.name testReadonlyArrayValues062
     * @tc.desc Verify ReadonlyArray.values behavior: iteration of ReadonlyArray<string | null> yields null as a valid value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string | null> = ["a", null, "c"];
      const collected: Array<string | null> = [];
      for (const v of arr.values()) {
        collected.push(v);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual("a");
      expect(collected[1]).assertEqual(null);
      expect(collected[2]).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0630
     * @tc.name testReadonlyArrayValues063
     * @tc.desc Verify ReadonlyArray.values behavior: object element mutated via iterator reflects in original array (same reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: ComboObjarr = new ComboObjarr();
      const b: ComboObjarr = new ComboObjarr();
      a.id = 100;
      b.id = 200;
      const arr: ReadonlyArray<ComboObjarr> = [a, b];
      for (const o of arr.values()) {
        o.id = o.id + 1;
      }
      expect(arr[0].id).assertEqual(101);
      expect(arr[1].id).assertEqual(201);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0640
     * @tc.name testReadonlyArrayValues064
     * @tc.desc Verify ReadonlyArray.values behavior: modifying a derived collected Array does not affect the original ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const collected: Array<int> = [];
      for (const v of arr.values()) {
        collected.push(v);
      }
      collected.push(99);
      collected[0] = 0;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0650
     * @tc.name testReadonlyArrayValues065
     * @tc.desc Verify ReadonlyArray.values behavior: two consecutive values() calls yield identical element sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [4, 5, 6];
      const c1: Array<int> = [];
      for (const v of arr.values()) {
        c1.push(v);
      }
      const c2: Array<int> = [];
      for (const v of arr.values()) {
        c2.push(v);
      }
      expect(c2.length).assertEqual(c1.length);
      expect(c2[0]).assertEqual(c1[0]);
      expect(c2[1]).assertEqual(c1[1]);
      expect(c2[2]).assertEqual(c1[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0660
     * @tc.name testReadonlyArrayValues066
     * @tc.desc Verify ReadonlyArray.values behavior: empty ReadonlyArray<int> first next() returns done=true immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      const iter = arr.values();
      const r = iter.next();
      expect(r.done).assertTrue();
      const r2 = iter.next();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0670
     * @tc.name testReadonlyArrayValues067
     * @tc.desc Verify ReadonlyArray.values behavior: IteratorResult next() reports done=false and correct value before exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [100, 200, 300];
      const iter = arr.values();
      const r1 = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value).assertEqual(100);
      const r2 = iter.next();
      expect(r2.done).assertFalse();
      expect(r2.value).assertEqual(200);
      const r3 = iter.next();
      expect(r3.done).assertFalse();
      expect(r3.value).assertEqual(300);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0680
     * @tc.name testReadonlyArrayValues068
     * @tc.desc Verify ReadonlyArray.values behavior: iterating after partial consumption with break leaves original array intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let seen: int = 0;
      for (const v of arr.values()) {
        seen++;
        if (v === 2) {
          break;
        }
      }
      expect(seen).assertEqual(2);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0690
     * @tc.name testReadonlyArrayValues069
     * @tc.desc Verify ReadonlyArray.values behavior: collected values via iterator equal direct index access for every position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [9, 8, 7, 6, 5];
      const collected: Array<int> = [];
      for (const v of arr.values()) {
        collected.push(v);
      }
      expect(collected.length).assertEqual(arr.length);
      for (let i: int = 0; i < arr.length; i++) {
        expect(collected[i]).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_VALUES_0700
     * @tc.name testReadonlyArrayValues070
     * @tc.desc Verify ReadonlyArray.values behavior: after breaking early from a partially consumed iterator, new iterators are completely independent and traverse fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayValues070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let partial: int = 0;
      for (const v of arr.values()) {
        partial++;
        if (v === 2) {
          break;
        }
      }
      expect(partial).assertEqual(2);
      const iter1 = arr.values();
      const iter2 = arr.values();
      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
      expect(iter1.next().value).assertEqual(2);
      expect(iter2.next().value).assertEqual(2);
      expect(iter1.next().value).assertEqual(3);
      expect(iter2.next().value).assertEqual(3);
    });

  });
}
