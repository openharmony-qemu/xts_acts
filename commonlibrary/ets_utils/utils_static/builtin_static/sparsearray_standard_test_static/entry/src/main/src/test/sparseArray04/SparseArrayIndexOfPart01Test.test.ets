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
interface SparseArrayIndexOfPart01ObjVal {
  id: int;
}
export default function sparseArrayIndexOfPart01Test(): void {
  describe('SparseArrayIndexOfPart01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_PART01_0100
     * @tc.name sparseArrayIndexOfPart01Test001
     * @tc.desc indexOf found returns first index (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIndexOfPart01Test001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. indexOf(10,0) on (10,20,30) -> 0
      const arr1 = new SparseArray<int>(10, 20, 30);
      expect(arr1.indexOf(10, 0)).assertEqual(0);
      // 2. indexOf('\t') on ('a','\t','b') -> 1
      const arr2 = new SparseArray<string>('a', '\t', 'b');
      expect(arr2.indexOf('\t')).assertEqual(1);
      // 3. indexOf('中文') on ('hello','中文','world') -> 1
      const arr3 = new SparseArray<string>('hello', '中文', 'world');
      expect(arr3.indexOf('中文')).assertEqual(1);
      // 4. indexOf('😀') on ('a','😀','b') -> 1
      const arr4 = new SparseArray<string>('a', '😀', 'b');
      expect(arr4.indexOf('😀')).assertEqual(1);
      // 5. indexOf(longStr 1000) on ('x',longStr,'y') -> 1
      let longStr5: string = '';
      for (let i = 0; i < 1000; i++) {
        longStr5 = longStr5 + 'A';
      }
      const arr5 = new SparseArray<string>('x', longStr5, 'y');
      expect(arr5.indexOf(longStr5)).assertEqual(1);
      // 6. indexOf('<script>...') on ('a','<script>alert(1)</script>','b') -> 1
      const arr6 = new SparseArray<string>('a', '<script>alert(1)</script>', 'b');
      expect(arr6.indexOf('<script>alert(1)</script>')).assertEqual(1);
      // 7. indexOf(true) on (false,true,false) -> 1
      const arr7 = new SparseArray<boolean>(false, true, false);
      expect(arr7.indexOf(true)).assertEqual(1);
      // 8. indexOf(false) on (true,false,true) -> 1
      const arr8 = new SparseArray<boolean>(true, false, true);
      expect(arr8.indexOf(false)).assertEqual(1);
      // 9. indexOf(MAX_BIGINT) on (1,MAX,2) -> 1
      const MAX_BIGINT9: bigint = 9223372036854775807n;
      const arr9 = new SparseArray<bigint>(BigInt(1), MAX_BIGINT9, BigInt(2));
      expect(arr9.indexOf(MAX_BIGINT9)).assertEqual(1);
      // 10. indexOf(MIN_BIGINT) on (1,MIN,2) -> 1
      const MIN_BIGINT10: bigint = -9223372036854775808n;
      const arr10 = new SparseArray<bigint>(BigInt(1), MIN_BIGINT10, BigInt(2));
      expect(arr10.indexOf(MIN_BIGINT10)).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_PART01_0200
     * @tc.name sparseArrayIndexOfPart01Test002
     * @tc.desc not-found returns -1 & typed/special values (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIndexOfPart01Test002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. indexOf('') on ('x','y','z') -> -1
      const arr1 = new SparseArray<string>('x', 'y', 'z');
      expect(arr1.indexOf('')).assertEqual(-1);
      // 2. indexOf(zwsp) on ('a',zwsp,'b') -> 1
      const zws2: string = '​';
      const arr2 = new SparseArray<string>('a', zws2, 'b');
      expect(arr2.indexOf(zws2)).assertEqual(1);
      // 3. indexOf('a\0b') on ('x','a\0b','y') -> 1
      const s3: string = 'a\0b';
      const arr3 = new SparseArray<string>('x', s3, 'y');
      expect(arr3.indexOf(s3)).assertEqual(1);
      // 4. indexOf('grape') on ('apple','banana','cherry') -> -1
      const arr4 = new SparseArray<string>('apple', 'banana', 'cherry');
      expect(arr4.indexOf('grape')).assertEqual(-1);
      // 5. indexOf(true) on (false,false,false) -> -1
      const arr5 = new SparseArray<boolean>(false, false, false);
      expect(arr5.indexOf(true)).assertEqual(-1);
      // 6. indexOf(NaN) on (1.0,NaN,2.0) SameValueZero -> -1
      const arr6 = new SparseArray<double>(1.0, Double.NaN, 2.0);
      expect(arr6.indexOf(Double.NaN)).assertEqual(-1);
      // 7. indexOf(POSITIVE_INFINITY) on (0.0,+Inf,1.0) -> 1
      const arr7 = new SparseArray<double>(0.0, Double.POSITIVE_INFINITY, 1.0);
      expect(arr7.indexOf(Double.POSITIVE_INFINITY)).assertEqual(1);
      // 8. indexOf(NEGATIVE_INFINITY) on (0.0,-Inf,1.0) -> 1
      const arr8 = new SparseArray<double>(0.0, Double.NEGATIVE_INFINITY, 1.0);
      expect(arr8.indexOf(Double.NEGATIVE_INFINITY)).assertEqual(1);
      // 9. indexOf(Number.MAX_VALUE) on (0.0,MAX_VALUE,1.0) -> 1
      const arr9 = new SparseArray<double>(0.0, Number.MAX_VALUE, 1.0);
      expect(arr9.indexOf(Number.MAX_VALUE)).assertEqual(1);
      // 10. indexOf(Number.EPSILON) on (0.0,EPSILON,1.0) -> 1
      const arr10 = new SparseArray<double>(0.0, Number.EPSILON, 1.0);
      expect(arr10.indexOf(Number.EPSILON)).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_PART01_0300
     * @tc.name sparseArrayIndexOfPart01Test003
     * @tc.desc object/Date/null refs & fromIndex parameter (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIndexOfPart01Test003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. indexOf(obj same ref) on (obj) -> 0
      const obj1: SparseArrayIndexOfPart01ObjVal = { id: 1 };
      const arr1 = new SparseArray<SparseArrayIndexOfPart01ObjVal>(obj1);
      expect(arr1.indexOf(obj1)).assertEqual(0);
      // 2. indexOf(obj2 diff ref) on (obj1) -> -1
      const obj2a: SparseArrayIndexOfPart01ObjVal = { id: 1 };
      const obj2b: SparseArrayIndexOfPart01ObjVal = { id: 1 };
      const arr2 = new SparseArray<SparseArrayIndexOfPart01ObjVal>(obj2a);
      expect(arr2.indexOf(obj2b)).assertEqual(-1);
      // 3. indexOf(null) on (null,obj) -> 0
      const obj3: SparseArrayIndexOfPart01ObjVal = { id: 1 };
      const arr3 = new SparseArray<SparseArrayIndexOfPart01ObjVal | null>(null, obj3);
      expect(arr3.indexOf(null)).assertEqual(0);
      // 4. indexOf(d same ref) on (d) -> 0
      const dateA: Date = new Date(0);
      const arr4 = new SparseArray<Date>(dateA);
      expect(arr4.indexOf(dateA)).assertEqual(0);
      // 5. indexOf(d2 diff ref) on (d1) -> -1
      const dateB: Date = new Date(0);
      const dateC: Date = new Date(0);
      const arr5 = new SparseArray<Date>(dateB);
      expect(arr5.indexOf(dateC)).assertEqual(-1);
      // 6. indexOf(5,2) on (1,2,3,4,5) -> 4
      const arr6 = new SparseArray<int>(1, 2, 3, 4, 5);
      expect(arr6.indexOf(5, 2)).assertEqual(4);
      // 7. indexOf(1,0) on empty -> -1
      const arr7 = new SparseArray<int>();
      expect(arr7.indexOf(1, 0)).assertEqual(-1);
    });
  });
}
