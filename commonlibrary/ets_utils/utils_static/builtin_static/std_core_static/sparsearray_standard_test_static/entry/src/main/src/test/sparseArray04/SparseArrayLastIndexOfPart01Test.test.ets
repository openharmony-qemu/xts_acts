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
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';
interface SparseArrayLastIndexOfPart01ObjVal {
  id: number;
}
// Consolidated SparseArrayLastIndexOfPart01Test (38 scenarios -> 4 cases, each <=10)
export default function sparseArrayLastIndexOfPart01Test(): void {
  describe('SparseArrayLastIndexOfPart01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_PART01_0100
     * @tc.name sparseArrayLastIndexOfPart01Test001
     * @tc.desc lastIndexOf() found returns last index on int (basic, repeated, negative, sparse) (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayLastIndexOfPart01Test001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. lastIndexOf(0) on len=0 sparse@{0} -> 0
      const arr1 = new SparseArray<int>(0);
      arr1[0] = 0;
      expect(arr1.lastIndexOf(0)).assertEqual(0);
      // 2. lastIndexOf(3) on (1,2,3) -> 2
      const arr2 = new SparseArray<int>(1, 2, 3);
      expect(arr2.lastIndexOf(3)).assertEqual(2);
      // 3. lastIndexOf(1) on (1,2,1,3,1) -> 4
      const arr3 = new SparseArray<int>(1, 2, 1, 3, 1);
      expect(arr3.lastIndexOf(1)).assertEqual(4);
      // 4. lastIndexOf(-1) on (5,-1,3,-1) -> 3
      const arr4 = new SparseArray<int>(5, -1, 3, -1);
      expect(arr4.lastIndexOf(-1)).assertEqual(3);
      // 5. lastIndexOf(1) on ten 1s -> 9
      const arr5 = new SparseArray<int>(1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
      expect(arr5.lastIndexOf(1)).assertEqual(9);
      // 6. lastIndexOf(1) on (9,8,7,6,5,4,3,2,1,3,2,1) -> 11
      const arr6 = new SparseArray<int>(9, 8, 7, 6, 5, 4, 3, 2, 1, 3, 2, 1);
      expect(arr6.lastIndexOf(1)).assertEqual(11);
      // 7. lastIndexOf(20) on (10,20,30,20) -> 3
      const arr7 = new SparseArray<int>(10, 20, 30, 20);
      expect(arr7.lastIndexOf(20)).assertEqual(3);
      // 8. lastIndexOf(10) on (5,10,15) -> 1
      const arr8 = new SparseArray<int>(5, 10, 15);
      expect(arr8.lastIndexOf(10)).assertEqual(1);
      // 9. lastIndexOf(1)->0 and lastIndexOf(3)->2 on (1,2,3)
      const arr9 = new SparseArray<int>(1, 2, 3);
      expect(arr9.lastIndexOf(1)).assertEqual(0);
      expect(arr9.lastIndexOf(3)).assertEqual(2);
      // 10. lastIndexOf(1) on len=3 sparse@{0,2} -> 2
      const arr10 = new SparseArray<int>(3);
      arr10[0] = 1;
      arr10[2] = 1;
      expect(arr10.lastIndexOf(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_PART01_0200
     * @tc.name sparseArrayLastIndexOfPart01Test002
     * @tc.desc lastIndexOf() not-found -1, sparse hole, and string found (special chars) (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayLastIndexOfPart01Test002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. lastIndexOf(0) on empty -> -1
      const arr1 = new SparseArray<int>();
      expect(arr1.lastIndexOf(0)).assertEqual(-1);
      // 2. lastIndexOf(1) on single (6) -> -1
      const arr2 = new SparseArray<int>(6);
      expect(arr2.lastIndexOf(1)).assertEqual(-1);
      // 3. lastIndexOf(9) on len=5 sparse@{2} -> 2
      const arr3 = new SparseArray<int>(5);
      arr3[2] = 9;
      expect(arr3.lastIndexOf(9)).assertEqual(2);
      // 4. lastIndexOf('') on ('','a','','b') -> 2
      const arr4 = new SparseArray<string>('', 'a', '', 'b');
      expect(arr4.lastIndexOf('')).assertEqual(2);
      // 5. lastIndexOf('hello') on ('hello','world','hello') -> 2
      const arr5 = new SparseArray<string>('hello', 'world', 'hello');
      expect(arr5.lastIndexOf('hello')).assertEqual(2);
      // 6. lastIndexOf('你好') on ('你好','世界','你好') -> 2
      const arr6 = new SparseArray<string>('你好', '世界', '你好');
      expect(arr6.lastIndexOf('你好')).assertEqual(2);
      // 7. lastIndexOf('😀') on ('😀','abc','😀','xyz') -> 2
      const arr7 = new SparseArray<string>('😀', 'abc', '😀', 'xyz');
      expect(arr7.lastIndexOf('😀')).assertEqual(2);
      // 8. lastIndexOf('\t') on ('\t','x','\t','y') -> 2
      const arr8 = new SparseArray<string>('\t', 'x', '\t', 'y');
      expect(arr8.lastIndexOf('\t')).assertEqual(2);
      // 9. lastIndexOf('\n') on ('\n','x','\n') -> 2
      const arr9 = new SparseArray<string>('\n', 'x', '\n');
      expect(arr9.lastIndexOf('\n')).assertEqual(2);
      // 10. lastIndexOf('\0') on ('\0','a','\0') -> 2
      const arr10 = new SparseArray<string>('\0', 'a', '\0');
      expect(arr10.lastIndexOf('\0')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_PART01_0300
     * @tc.name sparseArrayLastIndexOfPart01Test003
     * @tc.desc lastIndexOf() on boolean, double special values, and bigint (found & not-found) (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayLastIndexOfPart01Test003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. lastIndexOf(true) on (true,false,true,false) -> 2
      const arr1 = new SparseArray<boolean>(true, false, true, false);
      expect(arr1.lastIndexOf(true)).assertEqual(2);
      // 2. lastIndexOf(false) on (false,true,false,true) -> 2
      const arr2 = new SparseArray<boolean>(false, true, false, true);
      expect(arr2.lastIndexOf(false)).assertEqual(2);
      // 3. lastIndexOf(0.0) on (0.0,1.5,0.0,2.5) -> 2
      const arr3 = new SparseArray<double>(0.0, 1.5, 0.0, 2.5);
      expect(arr3.lastIndexOf(0.0)).assertEqual(2);
      // 4. lastIndexOf(-0.0) on (-0.0,1.5,-0.0) -> 2
      const arr4 = new SparseArray<double>(-0.0, 1.5, -0.0);
      expect(arr4.lastIndexOf(-0.0)).assertEqual(2);
      // 5. lastIndexOf(Number.NaN) on (NaN,1.0,NaN) -> -1
      const arr5 = new SparseArray<double>(Number.NaN, 1.0, Number.NaN);
      expect(arr5.lastIndexOf(Number.NaN)).assertEqual(-1);
      // 6. lastIndexOf(Number.POSITIVE_INFINITY) -> 2
      const arr6 = new SparseArray<double>(Number.POSITIVE_INFINITY, 1.0, Number.POSITIVE_INFINITY);
      expect(arr6.lastIndexOf(Number.POSITIVE_INFINITY)).assertEqual(2);
      // 7. lastIndexOf(-Number.POSITIVE_INFINITY) -> 2
      const arr7 = new SparseArray<double>(-Number.POSITIVE_INFINITY, 1.0, -Number.POSITIVE_INFINITY);
      expect(arr7.lastIndexOf(-Number.POSITIVE_INFINITY)).assertEqual(2);
      // 8. lastIndexOf(0n) on (0n,1n,0n,2n) -> 2
      const arr8 = new SparseArray<bigint>(0n, 1n, 0n, 2n);
      expect(arr8.lastIndexOf(0n)).assertEqual(2);
      // 9. lastIndexOf(100n) on (0n,1n,2n) -> -1
      const arr9 = new SparseArray<bigint>(0n, 1n, 2n);
      expect(arr9.lastIndexOf(100n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_PART01_0400
     * @tc.name sparseArrayLastIndexOfPart01Test004
     * @tc.desc lastIndexOf() on object reference, Date, and RegExp (found & not-found) (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayLastIndexOfPart01Test004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. lastIndexOf(obj) on ({id:0},obj,{id:2}) -> 1
      const obj1: SparseArrayLastIndexOfPart01ObjVal = { id: 1 };
      const arr1 = new SparseArray<SparseArrayLastIndexOfPart01ObjVal>(
        { id: 0 } as SparseArrayLastIndexOfPart01ObjVal,
        obj1,
        { id: 2 } as SparseArrayLastIndexOfPart01ObjVal,
      );
      expect(arr1.lastIndexOf(obj1)).assertEqual(1);
      // 2. lastIndexOf({id:1} new) on ({id:1},{id:2}) -> -1
      const arr2 = new SparseArray<SparseArrayLastIndexOfPart01ObjVal>(
        { id: 1 } as SparseArrayLastIndexOfPart01ObjVal,
        { id: 2 } as SparseArrayLastIndexOfPart01ObjVal,
      );
      expect(arr2.lastIndexOf({ id: 1 } as SparseArrayLastIndexOfPart01ObjVal)).assertEqual(-1);
      // 3. lastIndexOf(target) on (target,{id:0},target) -> 2
      const target3: SparseArrayLastIndexOfPart01ObjVal = { id: 42 };
      const arr3 = new SparseArray<SparseArrayLastIndexOfPart01ObjVal>(
        target3,
        { id: 0 } as SparseArrayLastIndexOfPart01ObjVal,
        target3,
      );
      expect(arr3.lastIndexOf(target3)).assertEqual(2);
      // 4. lastIndexOf(d) on (Date(1000),d,Date(2000)) -> 1
      const dateA: Date = new Date(0);
      const arr4 = new SparseArray<Date>(new Date(1000), dateA, new Date(2000));
      expect(arr4.lastIndexOf(dateA)).assertEqual(1);
      // 5. lastIndexOf(new Date(1000)) on (Date(1000),Date(2000)) -> -1
      const arr5 = new SparseArray<Date>(new Date(1000), new Date(2000));
      expect(arr5.lastIndexOf(new Date(1000))).assertEqual(-1);
      // 6. lastIndexOf(d) on (Date(0),d,Date(10000),d) -> 3
      const dateB: Date = new Date(5000);
      const arr6 = new SparseArray<Date>(new Date(0), dateB, new Date(10000), dateB);
      expect(arr6.lastIndexOf(dateB)).assertEqual(3);
      // 7. lastIndexOf(re) on (RegExp(xyz),re,RegExp(123)) -> 1
      const re7: RegExp = new RegExp('abc');
      const arr7 = new SparseArray<RegExp>(new RegExp('xyz'), re7, new RegExp('123'));
      expect(arr7.lastIndexOf(re7)).assertEqual(1);
      // 8. lastIndexOf(new RegExp('abc')) on (RegExp(abc),RegExp(def)) -> -1
      const arr8 = new SparseArray<RegExp>(new RegExp('abc'), new RegExp('def'));
      expect(arr8.lastIndexOf(new RegExp('abc'))).assertEqual(-1);
      // 9. lastIndexOf(re) on (re,RegExp(a),re,RegExp(b)) -> 2
      const re9: RegExp = new RegExp('test');
      const arr9 = new SparseArray<RegExp>(re9, new RegExp('a'), re9, new RegExp('b'));
      expect(arr9.lastIndexOf(re9)).assertEqual(2);
    });
  });
}
