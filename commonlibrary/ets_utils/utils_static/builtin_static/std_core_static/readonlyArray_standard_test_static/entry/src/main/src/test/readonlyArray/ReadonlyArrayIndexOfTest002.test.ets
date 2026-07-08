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

class ReadonlyArrayIndexOfGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayIndexOfTest002(): void {
  describe('ReadonlyArrayIndexOfTest002', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1360
     * @tc.name testReadonlyArrayIndexOf136
     * @tc.desc Verify ReadonlyArray.indexOf behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      expect(arr.indexOf(10)).assertEqual(0);
      expect(arr.indexOf(20)).assertEqual(1);
      expect(arr.indexOf(30)).assertEqual(-1);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1370
     * @tc.name testReadonlyArrayIndexOf137
     * @tc.desc Verify ReadonlyArray.indexOf behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      const result = arr.indexOf(1023);
      expect(result).assertEqual(1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1380
     * @tc.name testReadonlyArrayIndexOf138
     * @tc.desc Verify ReadonlyArray.indexOf behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      expect(arr.indexOf(2)).assertEqual(1);
      expect(arr.indexOf(4)).assertEqual(-1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1390
     * @tc.name testReadonlyArrayIndexOf139
     * @tc.desc Verify ReadonlyArray.indexOf behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.indexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1400
     * @tc.name testReadonlyArrayIndexOf140
     * @tc.desc Verify ReadonlyArray.indexOf behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.indexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1410
     * @tc.name testReadonlyArrayIndexOf141
     * @tc.desc Verify ReadonlyArray.indexOf behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.indexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1420
     * @tc.name testReadonlyArrayIndexOf142
     * @tc.desc Verify ReadonlyArray.indexOf behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.indexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1430
     * @tc.name testReadonlyArrayIndexOf143
     * @tc.desc Verify ReadonlyArray.indexOf behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.indexOf(arr[0]);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1440
     * @tc.name testReadonlyArrayIndexOf144
     * @tc.desc Verify ReadonlyArray.indexOf behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.indexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1450
     * @tc.name testReadonlyArrayIndexOf145
     * @tc.desc Verify ReadonlyArray.indexOf behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.indexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1460
     * @tc.name testReadonlyArrayIndexOf146
     * @tc.desc Verify ReadonlyArray.indexOf behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const result = arr.indexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1470
     * @tc.name testReadonlyArrayIndexOf147
     * @tc.desc Verify ReadonlyArray.indexOf behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const result = arr.indexOf(0.0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1480
     * @tc.name testReadonlyArrayIndexOf148
     * @tc.desc Verify ReadonlyArray.indexOf behavior: structurally equal but different object reference returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: ComboObjarr = new ComboObjarr();
      const b: ComboObjarr = new ComboObjarr();
      const arr: ReadonlyArray<ComboObjarr> = [a];
      expect(arr.indexOf(b)).assertEqual(-1);
      expect(arr.indexOf(a)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1490
     * @tc.name testReadonlyArrayIndexOf149
     * @tc.desc Verify ReadonlyArray.indexOf behavior: tail element hit returns length minus one in multi element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [11, 22, 33, 44, 55];
      const result: int = arr.indexOf(55);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1500
     * @tc.name testReadonlyArrayIndexOf150
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex equal to length returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 8, 9];
      expect(arr.indexOf(9, arr.length)).assertEqual(-1);
      expect(arr.indexOf(7, arr.length)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1510
     * @tc.name testReadonlyArrayIndexOf151
     * @tc.desc Verify ReadonlyArray.indexOf behavior: two consecutive calls return identical result without side effects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [4, 5, 6, 5];
      const r1: int = arr.indexOf(5);
      const r2: int = arr.indexOf(5);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(1);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1520
     * @tc.name testReadonlyArrayIndexOf152
     * @tc.desc Verify ReadonlyArray.indexOf behavior: source element order preserved after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [3, 1, 4, 1, 5];
      arr.indexOf(4);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1530
     * @tc.name testReadonlyArrayIndexOf153
     * @tc.desc Verify ReadonlyArray.indexOf behavior: source object references unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: ComboObjarr = new ComboObjarr();
      const o2: ComboObjarr = new ComboObjarr();
      const arr: ReadonlyArray<ComboObjarr> = [o1, o2];
      arr.indexOf(o2);
      expect(arr[0] === o1).assertTrue();
      expect(arr[1] === o2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1540
     * @tc.name testReadonlyArrayIndexOf154
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search positive infinity double element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inf: double = Number.POSITIVE_INFINITY;
      const arr: ReadonlyArray<double> = [1.0, inf, 2.0];
      expect(arr.indexOf(inf)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1550
     * @tc.name testReadonlyArrayIndexOf155
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search negative infinity double element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninf: double = Number.NEGATIVE_INFINITY;
      const arr: ReadonlyArray<double> = [ninf, 0.0, 1.0];
      expect(arr.indexOf(ninf)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1560
     * @tc.name testReadonlyArrayIndexOf156
     * @tc.desc Verify ReadonlyArray.indexOf behavior: independent calls with different searchElements unaffected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      expect(arr.indexOf(10)).assertEqual(0);
      expect(arr.indexOf(20)).assertEqual(1);
      expect(arr.indexOf(30)).assertEqual(2);
      expect(arr.indexOf(40)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1570
     * @tc.name testReadonlyArrayIndexOf157
     * @tc.desc Verify ReadonlyArray.indexOf behavior: same fromIndex value reused across calls returns consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 1, 2, 1];
      const fi: int = 2;
      expect(arr.indexOf(1, fi)).assertEqual(2);
      expect(arr.indexOf(1, fi)).assertEqual(2);
      expect(arr.indexOf(2, fi)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1580
     * @tc.name testReadonlyArrayIndexOf158
     * @tc.desc Verify ReadonlyArray.indexOf behavior: long string element search in multi element string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: string = "";
      for (let i: int = 0; i < 200; i++) { big = big + "x"; }
      const arr: ReadonlyArray<string> = ["a", big, "b"];
      expect(arr.indexOf(big)).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1590
     * @tc.name testReadonlyArrayIndexOf159
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search returns int that can be used in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [100, 200, 300];
      const idx: int = arr.indexOf(200);
      expect(idx + 1).assertEqual(2);
      expect(idx * 2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1600
     * @tc.name testReadonlyArrayIndexOf160
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex exactly at last valid index hits only that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 5, 5];
      expect(arr.indexOf(5, arr.length - 1)).assertEqual(2);
      expect(arr.indexOf(99, arr.length - 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1610
     * @tc.name testReadonlyArrayIndexOf161
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search using element retrieved via index returns same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["alpha", "beta", "gamma"];
      const target: string = arr[1];
      expect(arr.indexOf(target)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1620
     * @tc.name testReadonlyArrayIndexOf162
     * @tc.desc Verify ReadonlyArray.indexOf behavior: strict-equality semantics — NaN element cannot be located via NaN search since NaN !== NaN, returns -1
     * @knownIssue NaN search semantics for double element arrays not explicitly specified in arkts-sta-readonly-array.md; documented canary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, Number.NaN, 3.0];
      expect(arr.indexOf(Number.NaN)).assertEqual(-1);
      expect(arr.indexOf(1.0)).assertEqual(0);
      expect(arr.indexOf(3.0)).assertEqual(2);
    });


  });
}
