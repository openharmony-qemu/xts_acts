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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class ReadonlyArrayEntriesItem129 {
  id: int = 0;
  constructor(id: int) { this.id = id; }
}

class ReadonlyArrayEntriesCustom133 {
  tag: string = "x";
}

class ComboObjarr {
  id: int = 1;
}

class ReadonlyArrayEntriesGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayEntriesTest002(): void {
  describe('ReadonlyArrayEntriesTest002', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0600
     * @tc.name testReadonlyArrayEntries060
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix double middle index entries element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.1, 2.2, 3.3];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0610
     * @tc.name testReadonlyArrayEntries061
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix char middle index entries element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'b', c'c'];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0620
     * @tc.name testReadonlyArrayEntries062
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix boolean middle index entries element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0630
     * @tc.name testReadonlyArrayEntries063
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix int middle index entries element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0640
     * @tc.name testReadonlyArrayEntries064
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix Korean string last element entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["테스트", "en"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0650
     * @tc.name testReadonlyArrayEntries065
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix Russian string last element entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["АБВГД", "en"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0660
     * @tc.name testReadonlyArrayEntries066
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix ID card string last element entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["310101199001011234", "x"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0670
     * @tc.name testReadonlyArrayEntries067
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix masked card string last element entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["622202********1234", "x"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0680
     * @tc.name testReadonlyArrayEntries068
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix replacement character string last element entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["�", "x"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0690
     * @tc.name testReadonlyArrayEntries069
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix CRLF string last element entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\r\n", "x"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0700
     * @tc.name testReadonlyArrayEntries070
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix hex format string last element entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["0x123", "y"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0710
     * @tc.name testReadonlyArrayEntries071
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix octal format string last element entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["0123", "y"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0720
     * @tc.name testReadonlyArrayEntries072
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix binary format string last element entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["0b1010", "y"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0730
     * @tc.name testReadonlyArrayEntries073
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix scientific notation string last element entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["123.45e6", "y"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0740
     * @tc.name testReadonlyArrayEntries074
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix date string last element entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["2026-03-05", "y"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0750
     * @tc.name testReadonlyArrayEntries075
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix mixed script string last element entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["Test 測試", "z"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0760
     * @tc.name testReadonlyArrayEntries076
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix repeated elements entries index increments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 7, 7, 7];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(7);
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0770
     * @tc.name testReadonlyArrayEntries077
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix collect all values entries preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [3, 1, 4, 1, 5];
      const collected: Array<int> = [];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        collected.push(entry[1]);
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(collected[0]).assertEqual(3);
      expect(collected[1]).assertEqual(1);
      expect(collected[2]).assertEqual(4);
      expect(collected[3]).assertEqual(1);
      expect(collected[4]).assertEqual(5);
      expect(collected.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0780
     * @tc.name testReadonlyArrayEntries078
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix int business values entries sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 1000000];
      let sum: int = 0;
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        sum += entry[1];
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(sum).assertEqual(999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0790
     * @tc.name testReadonlyArrayEntries079
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix float negative zero at index 1 entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, -0.0f, 2.0f];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0800
     * @tc.name testReadonlyArrayEntries080
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix independent second entries call returns Chinese first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["中文", "b"];
      const firstIter = arr.entries();
      const firstStep = firstIter.next();
      expect(firstStep.done).assertFalse();
      expect(firstStep.value![0]).assertEqual(0);
      expect(firstStep.value![1]).assertEqual("中文");
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0810
     * @tc.name testReadonlyArrayEntries081
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix 100 elements entries middle index 49 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 100; i++) {
        source.push(i * 2);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(arr[49]).assertEqual(98);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0820
     * @tc.name testReadonlyArrayEntries082
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix entries break leaves array length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
        if (entry[0] === 2) {
          break;
        }
      }
      expect(count).assertEqual(3);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0830
     * @tc.name testReadonlyArrayEntries083
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix float NaN second entries call element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 3.0f];
      const firstIter = arr.entries();
      const firstStep = firstIter.next();
      expect(firstStep.done).assertFalse();
      expect(firstStep.value![0]).assertEqual(0);
      expect(firstStep.value![1]).assertEqual(1.0f);
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        if (count === 1) {
          expect(Number.isNaN(entry[1])).assertTrue();
        } else {
          expect(entry[1]).assertEqual(arr[count]);
        }
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0840
     * @tc.name testReadonlyArrayEntries084
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix float positive infinity second entries call element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, Double.toFloat(Number.POSITIVE_INFINITY), 3.0f];
      const firstIter = arr.entries();
      const firstStep = firstIter.next();
      expect(firstStep.done).assertFalse();
      expect(firstStep.value![0]).assertEqual(0);
      expect(firstStep.value![1]).assertEqual(1.0f);
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0850
     * @tc.name testReadonlyArrayEntries085
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix float negative infinity second entries call element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, Double.toFloat(Number.NEGATIVE_INFINITY), 3.0f];
      const firstIter = arr.entries();
      const firstStep = firstIter.next();
      expect(firstStep.done).assertFalse();
      expect(firstStep.value![0]).assertEqual(0);
      expect(firstStep.value![1]).assertEqual(1.0f);
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0860
     * @tc.name testReadonlyArrayEntries086
     * @tc.desc Verify ReadonlyArray.entries behavior: iteration matrix float MIN_VALUE second entries call element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [Double.toFloat(Number.MIN_VALUE), 1.0f];
      const firstIter = arr.entries();
      const firstStep = firstIter.next();
      expect(firstStep.done).assertFalse();
      expect(firstStep.value![0]).assertEqual(0);
      expect(firstStep.value![1]).assertEqual(Double.toFloat(Number.MIN_VALUE));
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0870
     * @tc.name testReadonlyArrayEntries087
     * @tc.desc Verify ReadonlyArray.entries behavior: array with null element returns null at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int | null> = [1, null, 2];
      let found: boolean = false;
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        if (count === 1) {
          expect(entry[1]).assertEqual(null);
          found = true;
        }
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0880
     * @tc.name testReadonlyArrayEntries088
     * @tc.desc Verify ReadonlyArray.entries behavior: array with undefined element returns undefined at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int | undefined> = [1, undefined];
      let found: boolean = false;
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        if (count === 1) {
          expect(entry[1]).assertEqual(undefined);
          found = true;
        }
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0890
     * @tc.name testReadonlyArrayEntries089
     * @tc.desc Verify ReadonlyArray.entries behavior: object array entries returns same object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: ReadonlyArrayEntriesItem129 = new ReadonlyArrayEntriesItem129(1);
      const o2: ReadonlyArrayEntriesItem129 = new ReadonlyArrayEntriesItem129(2);
      const arr: ReadonlyArray<ReadonlyArrayEntriesItem129> = [o1, o2];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1] === arr[count]).assertTrue();
        expect(entry[1].id).assertEqual(count + 1);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0900
     * @tc.name testReadonlyArrayEntries090
     * @tc.desc Verify ReadonlyArray.entries behavior: mixed type array entries returns typed index value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Object> = [1 as Object, "str" as Object, true as Object];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1] === arr[count]).assertTrue();
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0910
     * @tc.name testReadonlyArrayEntries091
     * @tc.desc Verify ReadonlyArray.entries behavior: Date array entries returns Date object at index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(0);
      const arr: ReadonlyArray<Date> = [d];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1] === d).assertTrue();
        expect(entry[1].getTime()).assertEqual(0);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0920
     * @tc.name testReadonlyArrayEntries092
     * @tc.desc Verify ReadonlyArray.entries behavior: RegExp array entries returns RegExp object at index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const re: RegExp = new RegExp("abc");
      const arr: ReadonlyArray<RegExp> = [re];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1] === re).assertTrue();
        expect(entry[1].source).assertEqual("abc");
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0930
     * @tc.name testReadonlyArrayEntries093
     * @tc.desc Verify ReadonlyArray.entries behavior: custom class array entries returns class instance reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item: ReadonlyArrayEntriesCustom133 = new ReadonlyArrayEntriesCustom133();
      const arr: ReadonlyArray<ReadonlyArrayEntriesCustom133> = [item];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(item);
        expect(entry[1].tag).assertEqual("x");
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0940
     * @tc.name testReadonlyArrayEntries094
     * @tc.desc Verify ReadonlyArray.entries behavior: length 2 int array entries full index value traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0950
     * @tc.name testReadonlyArrayEntries095
     * @tc.desc Verify ReadonlyArray.entries behavior: length 5 int array entries full index value traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0960
     * @tc.name testReadonlyArrayEntries096
     * @tc.desc Verify ReadonlyArray.entries behavior: length 10 int array entries full index value traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 10; i++) {
        source.push(i * 10);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(count * 10);
        count++;
      }
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0970
     * @tc.name testReadonlyArrayEntries097
     * @tc.desc Verify ReadonlyArray.entries behavior: three element array entries iterator done true after three next calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const iter = arr.entries();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value![0]).assertEqual(0);
      expect(first.value![1]).assertEqual(1);
      const second = iter.next();
      expect(second.done).assertFalse();
      expect(second.value![0]).assertEqual(1);
      expect(second.value![1]).assertEqual(2);
      const third = iter.next();
      expect(third.done).assertFalse();
      expect(third.value![0]).assertEqual(2);
      expect(third.value![1]).assertEqual(3);
      const doneStep = iter.next();
      expect(doneStep.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0980
     * @tc.name testReadonlyArrayEntries098
     * @tc.desc Verify ReadonlyArray.entries behavior: entries for - of break exits iteration early and new iterator traverses fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(0);
        expect(entry[1]).assertEqual(1);
        count++;
        break;
      }
      expect(count).assertEqual(1);
      let resumed: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(resumed);
        expect(entry[1]).assertEqual(arr[resumed]);
        resumed++;
      }
      expect(resumed).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_0990
     * @tc.name testReadonlyArrayEntries099
     * @tc.desc Verify ReadonlyArray.entries behavior: entries for - of throw during iteration propagates error and array remains iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      let threw: boolean = false;
      let visited: int = 0;
      try {
        for (const entry of arr.entries()) {
          expect(entry[0]).assertEqual(visited);
          expect(entry[1]).assertEqual(arr[visited]);
          visited++;
          if (entry[0] === 1) {
            throw new Error("stop");
          }
        }
      } catch (_e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(visited).assertEqual(2);
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1000
     * @tc.name testReadonlyArrayEntries100
     * @tc.desc Verify ReadonlyArray.entries behavior: special elements - Unicode - Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["中文"];
      const collected: string[] = [];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        collected.push(entry[1]);
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(collected.length).assertEqual(1);
      expect(collected[0]).assertEqual("中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1010
     * @tc.name testReadonlyArrayEntries101
     * @tc.desc Verify ReadonlyArray.entries behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(arr.length).assertEqual(before);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1020
     * @tc.name testReadonlyArrayEntries102
     * @tc.desc Verify ReadonlyArray.entries behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1030
     * @tc.name testReadonlyArrayEntries103
     * @tc.desc Verify ReadonlyArray.entries behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1040
     * @tc.name testReadonlyArrayEntries104
     * @tc.desc Verify ReadonlyArray.entries behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(source[count]);
        count++;
      }
      expect(count).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1050
     * @tc.name testReadonlyArrayEntries105
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const collected: Array<int> = [];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        collected.push(entry[1]);
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(2);
      expect(collected[arr.length - 1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1060
     * @tc.name testReadonlyArrayEntries106
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const collected: string[] = [];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        collected.push(entry[1]);
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual("a");
      expect(collected[1]).assertEqual("b");
      expect(collected[arr.length - 1]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1070
     * @tc.name testReadonlyArrayEntries107
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["中文", "😀", "long-text"];
      const collected: string[] = [];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        collected.push(entry[1]);
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual("中文");
      expect(collected[1]).assertEqual("😀");
      expect(collected[arr.length - 1]).assertEqual("long-text");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1080
     * @tc.name testReadonlyArrayEntries108
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const collected: boolean[] = [];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        collected.push(entry[1]);
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(true);
      expect(collected[arr.length - 1]).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1090
     * @tc.name testReadonlyArrayEntries109
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const collected: double[] = [];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        if (count === 0) {
          expect(Number.isNaN(entry[1])).assertTrue();
        } else {
          expect(entry[1]).assertEqual(arr[count]);
        }
        collected.push(entry[1]);
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(Number.isNaN(collected[0])).assertTrue();
      expect(collected[1]).assertEqual(0.0);
      expect(collected[arr.length - 1]).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1100
     * @tc.name testReadonlyArrayEntries110
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const collected: ComboObjarr[] = [];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1] === arr[count]).assertTrue();
        collected.push(entry[1]);
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0] === obj1).assertTrue();
      expect(collected[arr.length - 1] === obj2).assertTrue();
      expect(collected[1].id).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1110
     * @tc.name testReadonlyArrayEntries111
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1] === arr[count]).assertTrue();
        expect(entry[1].length).assertEqual(arr[count].length);
        expect(entry[1][0]).assertEqual(arr[count][0]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1120
     * @tc.name testReadonlyArrayEntries112
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const collected: Array<int> = [];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        collected.push(entry[1]);
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(1);
      expect(collected[arr.length - 1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1130
     * @tc.name testReadonlyArrayEntries113
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - int sequence 1, 2, 3 group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1140
     * @tc.name testReadonlyArrayEntries114
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - nested int array values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1] === arr[count]).assertTrue();
        expect(entry[1].length).assertEqual(arr[count].length);
        expect(entry[1][0]).assertEqual(arr[count][0]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1150
     * @tc.name testReadonlyArrayEntries115
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - repeated int elements group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1160
     * @tc.name testReadonlyArrayEntries116
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - string values with empty string group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1170
     * @tc.name testReadonlyArrayEntries117
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - Unicode string values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["中文", "😀", "long-text"];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1180
     * @tc.name testReadonlyArrayEntries118
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - boolean true false values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1190
     * @tc.name testReadonlyArrayEntries119
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        if (count === 0) {
          expect(Number.isNaN(entry[1])).assertTrue();
        } else {
          expect(entry[1]).assertEqual(arr[count]);
        }
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1200
     * @tc.name testReadonlyArrayEntries120
     * @tc.desc Verify ReadonlyArray.entries behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayEntriesGeneratedItem = new ReadonlyArrayEntriesGeneratedItem(1);
      const obj2: ReadonlyArrayEntriesGeneratedItem = new ReadonlyArrayEntriesGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayEntriesGeneratedItem> = [obj1, obj2];
      let count: int = 0;
      for (const entry of arr.entries()) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1] === arr[count]).assertTrue();
        expect(entry[1].id).assertEqual(count + 1);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1210
     * @tc.name testReadonlyArrayEntries121
     * @tc.desc Verify ReadonlyArray.entries behavior: empty array entries iterator first next call returns done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      const iter = arr.entries();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1220
     * @tc.name testReadonlyArrayEntries122
     * @tc.desc Verify ReadonlyArray.entries behavior: continuing to call next after done keeps returning done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1];
      const iter = arr.entries();
      const first = iter.next();
      expect(first.done).assertFalse();
      const r1 = iter.next();
      expect(r1.done).assertTrue();
      const r2 = iter.next();
      expect(r2.done).assertTrue();
      const r3 = iter.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1230
     * @tc.name testReadonlyArrayEntries123
     * @tc.desc Verify ReadonlyArray.entries behavior: two independent iterators alternating next calls have independent state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const iterA = arr.entries();
      const iterB = arr.entries();
      const a1 = iterA.next();
      const b1 = iterB.next();
      expect(a1.value![0]).assertEqual(0);
      expect(b1.value![0]).assertEqual(0);
      const a2 = iterA.next();
      expect(a2.value![0]).assertEqual(1);
      expect(a2.value![1]).assertEqual(20);
      const b2 = iterB.next();
      expect(b2.value![0]).assertEqual(1);
      expect(b2.value![1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1240
     * @tc.name testReadonlyArrayEntries124
     * @tc.desc Verify ReadonlyArray.entries behavior: saved entry tuple reference value not affected by subsequent iterator next calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [100, 200, 300];
      const iter = arr.entries();
      const first = iter.next();
      const savedIndex: int = first.value![0];
      const savedValue: int = first.value![1];
      iter.next();
      iter.next();
      iter.next();
      expect(savedIndex).assertEqual(0);
      expect(savedValue).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1250
     * @tc.name testReadonlyArrayEntries125
     * @tc.desc Verify ReadonlyArray.entries behavior: returned iterator object satisfies iterable protocol via Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 6];
      const iter = arr.entries();
      let count: int = 0;
      for (const entry of iter) {
        expect(entry[0]).assertEqual(count);
        expect(entry[1]).assertEqual(arr[count]);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1260
     * @tc.name testReadonlyArrayEntries126
     * @tc.desc Verify ReadonlyArray.entries behavior: nested for-of loops with separate entries iterators do not interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2];
      let pairs: int = 0;
      for (const outer of arr.entries()) {
        for (const inner of arr.entries()) {
          expect(inner[1]).assertEqual(arr[inner[0]]);
          pairs++;
        }
        expect(outer[1]).assertEqual(arr[outer[0]]);
      }
      expect(pairs).assertEqual(arr.length * arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1270
     * @tc.name testReadonlyArrayEntries127
     * @tc.desc Verify ReadonlyArray.entries behavior: object element references in original array remain unchanged after entries call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: ReadonlyArrayEntriesGeneratedItem = new ReadonlyArrayEntriesGeneratedItem(1);
      const b: ReadonlyArrayEntriesGeneratedItem = new ReadonlyArrayEntriesGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayEntriesGeneratedItem> = [a, b];
      for (const entry of arr.entries()) {
        expect(entry[1] === arr[entry[0]]).assertTrue();
      }
      expect(arr[0] === a).assertTrue();
      expect(arr[1] === b).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1280
     * @tc.name testReadonlyArrayEntries128
     * @tc.desc Verify ReadonlyArray.entries behavior: iterator next value structure exposes index and value via tuple access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "y"];
      const iter = arr.entries();
      const r = iter.next();
      expect(r.done).assertFalse();
      expect(r.value != null).assertTrue();
      expect(r.value![0]).assertEqual(0);
      expect(r.value![1]).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1290
     * @tc.name testReadonlyArrayEntries129
     * @tc.desc Verify ReadonlyArray.entries behavior: collected entries match manual indexed loop output element by element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [9, 8, 7, 6, 5];
      const fromIter: Array<int> = [];
      for (const entry of arr.entries()) {
        fromIter.push(entry[1]);
      }
      const fromManual: Array<int> = [];
      for (let i: int = 0; i < arr.length; i++) {
        fromManual.push(arr[i]);
      }
      expect(fromIter.length).assertEqual(fromManual.length);
      for (let i: int = 0; i < fromIter.length; i++) {
        expect(fromIter[i]).assertEqual(fromManual[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1300
     * @tc.name testReadonlyArrayEntries130
     * @tc.desc Verify ReadonlyArray.entries behavior: stopping iterator consumption mid-way leaves original ReadonlyArray length and elements intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [11, 22, 33, 44];
      const iter = arr.entries();
      iter.next();
      iter.next();
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(11);
      expect(arr[1]).assertEqual(22);
      expect(arr[2]).assertEqual(33);
      expect(arr[3]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1310
     * @tc.name testReadonlyArrayEntries131
     * @tc.desc Verify ReadonlyArray.entries behavior: large array of length 1024 last index 1023 entry exposes correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        source.push(i + 1);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let lastIndex: int = -1;
      let lastValue: int = -1;
      for (const entry of arr.entries()) {
        lastIndex = entry[0];
        lastValue = entry[1];
      }
      expect(lastIndex).assertEqual(1023);
      expect(lastValue).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1320
     * @tc.name testReadonlyArrayEntries132
     * @tc.desc Verify ReadonlyArray.entries behavior: two consecutive entries calls each yield identical sequences without hidden shared state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [4, 5, 6];
      const r1: Array<int> = [];
      for (const entry of arr.entries()) {
        r1.push(entry[0]);
        r1.push(entry[1]);
      }
      const r2: Array<int> = [];
      for (const entry of arr.entries()) {
        r2.push(entry[0]);
        r2.push(entry[1]);
      }
      expect(r1.length).assertEqual(r2.length);
      for (let i: int = 0; i < r1.length; i++) {
        expect(r1[i]).assertEqual(r2[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_ENTRIES_1330
     * @tc.name testReadonlyArrayEntries133
     * @tc.desc Verify ReadonlyArray.entries behavior: iterator manual next consumed first then for-of resumes from current position not from beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayEntries133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40];
      const iter = arr.entries();
      const first = iter.next();
      expect(first.value![0]).assertEqual(0);
      expect(first.value![1]).assertEqual(10);
      const remaining: Array<int> = [];
      for (const entry of iter) {
        remaining.push(entry[0]);
        remaining.push(entry[1]);
      }
      expect(remaining.length).assertEqual(6);
      expect(remaining[0]).assertEqual(1);
      expect(remaining[1]).assertEqual(20);
      expect(remaining[4]).assertEqual(3);
      expect(remaining[5]).assertEqual(40);
    });

  });
}
