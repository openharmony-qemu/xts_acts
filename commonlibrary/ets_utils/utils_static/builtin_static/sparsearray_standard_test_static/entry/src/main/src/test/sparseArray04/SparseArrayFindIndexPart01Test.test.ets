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
interface ItemData {
  id: int;
  name: string;
}
// Merged from 43 findIndex scenarios -> 5 cases, each <=10
export default function sparseArrayFindIndexPart01Test(): void {
  describe('SparseArrayFindIndexPart01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_PART01_0100
     * @tc.name sparseArrayFindIndexPart01Test001
     * @tc.desc find-with-match returns first matching index (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindIndexPart01Test001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. findIndex index===2 on (10,20,30) -> 2
      const arr1 = new SparseArray<int>(10, 20, 30);
      const r1 = arr1.findIndex((value: int, index: int): boolean => index === 2);
      expect(r1).assertEqual(2);
      // 2. findIndex predicate true on (5,6,7) -> 0
      const arr2 = new SparseArray<int>(5, 6, 7);
      const r2 = arr2.findIndex((value: int): boolean => true);
      expect(r2).assertEqual(0);
      // 3. findIndex value===42 on (1,2,42,3,4) -> 2
      const arr3 = new SparseArray<int>(1, 2, 42, 3, 4);
      const r3 = arr3.findIndex((value: int): boolean => value === 42);
      expect(r3).assertEqual(2);
      // 4. findIndex value>0 on (5,-1,-2) -> 0
      const arr4 = new SparseArray<int>(5, -1, -2);
      const r4 = arr4.findIndex((value: int): boolean => value > 0);
      expect(r4).assertEqual(0);
      // 5. findIndex value.name==='x' first-match on (objA,objC,objB) -> 0
      const objA: ItemData = { id: 1, name: 'x' } as ItemData;
      const objC: ItemData = { id: 2, name: 'y' } as ItemData;
      const objB: ItemData = { id: 1, name: 'x' } as ItemData;
      const arr5 = new SparseArray<ItemData>(objA, objC, objB);
      const r5 = arr5.findIndex((value: ItemData): boolean => value.name === 'x');
      expect(r5).assertEqual(0);
      // 6. findIndex value>15 && index===1 on (10,20,30) -> 1
      const arr6 = new SparseArray<int>(10, 20, 30);
      const r6 = arr6.findIndex((value: int, index: int): boolean => {
        return value > 15 && index === 1;
      });
      expect(r6).assertEqual(1);
      // 7. findIndex typeof index==='int' on (100,200) -> 0
      const arr7 = new SparseArray<int>(100, 200);
      const r7 = arr7.findIndex((value: int, index: int): boolean => {
        return typeof index === 'int';
      });
      expect(r7).assertEqual(0);
      // 8. findIndex value===100 on sparse {2,4} len=5 -> 2
      const arr8 = new SparseArray<int>(5);
      arr8[2] = 100;
      arr8[4] = 200;
      const r8 = arr8.findIndex((value: int): boolean => value === 100);
      expect(r8).assertEqual(2);
      // 9. findIndex value===42 after arr[0]=42 -> 0
      const arr9 = new SparseArray<int>();
      arr9[0] = 42;
      const r9 = arr9.findIndex((value: int): boolean => value === 42);
      expect(r9).assertEqual(0);
      // 10. findIndex value>3 on (1,5,3,8,2) -> 1
      const arr10 = new SparseArray<int>(1, 5, 3, 8, 2);
      const r10 = arr10.findIndex((value: int): boolean => value > 3);
      expect(r10).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_PART01_0200
     * @tc.name sparseArrayFindIndexPart01Test002
     * @tc.desc typed elements int & string & boolean match (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindIndexPart01Test002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. findIndex string==='banana' on (apple,banana,cherry) -> 1
      const arr1 = new SparseArray<string>('apple', 'banana', 'cherry');
      const r1 = arr1.findIndex((value: string): boolean => value === 'banana');
      expect(r1).assertEqual(1);
      // 2. findIndex string==='' on (a,'',b) -> 1
      const arr2 = new SparseArray<string>('a', '', 'b');
      const r2 = arr2.findIndex((value: string): boolean => value === '');
      expect(r2).assertEqual(1);
      // 3. findIndex string Unicode '中文测试' on (hello,中文测试,world) -> 1
      const arr3 = new SparseArray<string>('hello', '中文测试', 'world');
      const r3 = arr3.findIndex((value: string): boolean => value === '中文测试');
      expect(r3).assertEqual(1);
      // 4. findIndex string case-sensitive 'hello' on (Hello,hello) -> 1
      const arr4 = new SparseArray<string>('Hello', 'hello');
      const r4 = arr4.findIndex((value: string): boolean => value === 'hello');
      expect(r4).assertEqual(1);
      // 5. findIndex string===' ' on (a,' ',b) -> 1
      const arr5 = new SparseArray<string>('a', ' ', 'b');
      const r5 = arr5.findIndex((value: string): boolean => value === ' ');
      expect(r5).assertEqual(1);
      // 6. findIndex string length===10 on (x,abcdefghij,y) -> 1
      const arr6 = new SparseArray<string>('x', 'abcdefghij', 'y');
      const r6 = arr6.findIndex((value: string): boolean => value.length === 10);
      expect(r6).assertEqual(1);
      // 7. findIndex boolean===true on (false,true,false) -> 1
      const arr7 = new SparseArray<boolean>(false, true, false);
      const r7 = arr7.findIndex((value: boolean): boolean => value === true);
      expect(r7).assertEqual(1);
      // 8. findIndex boolean===false on (true,false,true) -> 1
      const arr8 = new SparseArray<boolean>(true, false, true);
      const r8 = arr8.findIndex((value: boolean): boolean => value === false);
      expect(r8).assertEqual(1);
      // 9. findIndex boolean===true all-true on (true,true,true) -> 0
      const arr9 = new SparseArray<boolean>(true, true, true);
      const r9 = arr9.findIndex((value: boolean): boolean => value === true);
      expect(r9).assertEqual(0);
      // 10. findIndex boolean===true all-false on (false,false,false) -> -1
      const arr10 = new SparseArray<boolean>(false, false, false);
      const r10 = arr10.findIndex((value: boolean): boolean => value === true);
      expect(r10).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_PART01_0300
     * @tc.name sparseArrayFindIndexPart01Test003
     * @tc.desc typed elements double & bigint & object & Date (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindIndexPart01Test003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. findIndex double===0.0 on (1.5,0.0,3.5) -> 1
      const arr1 = new SparseArray<double>(1.5, 0.0, 3.5);
      const r1 = arr1.findIndex((value: double): boolean => value === 0.0);
      expect(r1).assertEqual(1);
      // 2. findIndex double isNaN on (1.0,NaN,3.0) -> 1
      const arr2 = new SparseArray<double>(1.0, Double.NaN, 3.0);
      const r2 = arr2.findIndex((value: double): boolean => isNaN(value));
      expect(r2).assertEqual(1);
      // 3. findIndex double===Infinity on (1.0,Infinity,2.0) -> 1
      const arr3 = new SparseArray<double>(1.0, Double.POSITIVE_INFINITY, 2.0);
      const r3 = arr3.findIndex((value: double): boolean => value === Double.POSITIVE_INFINITY);
      expect(r3).assertEqual(1);
      // 4. findIndex double isFinite on (Infinity,3.14,2.72) -> 1
      const arr4 = new SparseArray<double>(Double.POSITIVE_INFINITY, 3.14, 2.72);
      const r4 = arr4.findIndex((value: double): boolean => isFinite(value));
      expect(r4).assertEqual(1);
      // 5. findIndex bigint===0n on (1n,0n,2n) -> 1
      const arr5 = new SparseArray<bigint>(1n, 0n, 2n);
      const r5 = arr5.findIndex((value: bigint): boolean => value === 0n);
      expect(r5).assertEqual(1);
      // 6. findIndex bigint===MAX on (1n,MAX,2n) -> 1
      const MAX_BIGINT: bigint = 9223372036854775807n;
      const arr6 = new SparseArray<bigint>(1n, MAX_BIGINT, 2n);
      const r6 = arr6.findIndex((value: bigint): boolean => value === MAX_BIGINT);
      expect(r6).assertEqual(1);
      // 7. findIndex object id===2 on (o1,o2,o3) -> 1
      const o1: ItemData = { id: 1, name: 'a' } as ItemData;
      const o2: ItemData = { id: 2, name: 'b' } as ItemData;
      const o3: ItemData = { id: 3, name: 'c' } as ItemData;
      const arr7 = new SparseArray<ItemData>(o1, o2, o3);
      const r7 = arr7.findIndex((value: ItemData): boolean => value.id === 2);
      expect(r7).assertEqual(1);
      // 8. findIndex object|null ===null on (oNull,null) -> 1
      const oNull: ItemData = { id: 1, name: 'a' } as ItemData;
      const arr8 = new SparseArray<ItemData | null>(oNull, null);
      const r8 = arr8.findIndex((value: ItemData | null): boolean => value === null);
      expect(r8).assertEqual(1);
      // 9. findIndex object id===99 no-match on (oNo1,oNo2) -> -1
      const oNo1: ItemData = { id: 1, name: 'a' } as ItemData;
      const oNo2: ItemData = { id: 2, name: 'b' } as ItemData;
      const arr9 = new SparseArray<ItemData>(oNo1, oNo2);
      const r9 = arr9.findIndex((value: ItemData): boolean => value.id === 99);
      expect(r9).assertEqual(-1);
      const dateA: Date = new Date(5000);
      const dateB: Date = new Date(5000);
      const arr10 = new SparseArray<Date>(dateA, dateB);
      const r10 = arr10.findIndex((value: Date): boolean => value.getTime() === 5000);
      expect(r10).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_PART01_0400
     * @tc.name sparseArrayFindIndexPart01Test004
     * @tc.desc no-match returns -1 & empty array & throw propagation (6 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindIndexPart01Test004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. findIndex index>99 on (10,20,30) -> -1
      const arr1 = new SparseArray<int>(10, 20, 30);
      const r1 = arr1.findIndex((value: int, index: int): boolean => index > 99);
      expect(r1).assertEqual(-1);
      // 2. findIndex array.length>999 on (10,20,30) -> -1
      const arr2 = new SparseArray<int>(10, 20, 30);
      const r2 = arr2.findIndex((value: int, index: int, array: SparseArray<int>): boolean => {
        return array.length > 999;
      });
      expect(r2).assertEqual(-1);
      // 3. findIndex predicate false on (1,2,3) -> -1
      const arr3 = new SparseArray<int>(1, 2, 3);
      const r3 = arr3.findIndex((value: int): boolean => false);
      expect(r3).assertEqual(-1);
      // 4. findIndex predicate true on empty len=5 -> -1
      const arr4 = new SparseArray<int>(5);
      const r4 = arr4.findIndex((value: int): boolean => true);
      expect(r4).assertEqual(-1);
      // 5. findIndex throw at first -> callCount 1
      let callCount1: int = 0;
      const arr5 = new SparseArray<int>(1, 2, 3);
      try {
        arr5.findIndex((value: int): boolean => {
          callCount1 = callCount1 + 1;
          throw new Error('fail at first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount1).assertEqual(1);
      }
      // 6. findIndex throw at middle -> callCount 3
      let callCount2: int = 0;
      const arr6 = new SparseArray<int>(10, 20, 30, 40);
      try {
        arr6.findIndex((value: int): boolean => {
          callCount2 = callCount2 + 1;
          if (value === 30) {
            throw new Error('fail at middle');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount2).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_PART01_0500
     * @tc.name sparseArrayFindIndexPart01Test005
     * @tc.desc callback args (value/index/array) & sparse traversal (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindIndexPart01Test005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. findIndex array.length===3 on (10,20,30) -> 0
      const arr1 = new SparseArray<int>(10, 20, 30);
      const r1 = arr1.findIndex((value: int, index: int, array: SparseArray<int>): boolean => {
        return array.length === 3;
      });
      expect(r1).assertEqual(0);
      // 2. findIndex index===3 on sparse {0,3} len=5 -> 3
      const arr2 = new SparseArray<int>(5);
      arr2[0] = 10;
      arr2[3] = 40;
      const r2 = arr2.findIndex((value: int, index: int): boolean => index === 3);
      expect(r2).assertEqual(3);
      // 3. findIndex predicate true on sparse {1,3} len=4 -> 1
      const arr3 = new SparseArray<int>(4);
      arr3[1] = 10;
      arr3[3] = 30;
      const r3 = arr3.findIndex((value: int): boolean => true);
      expect(r3).assertEqual(1);
      // 4. findIndex index===4 on sparse {0,1,4} len=5 -> 4
      const arr4 = new SparseArray<int>(5);
      arr4[0] = 1;
      arr4[1] = 2;
      arr4[4] = 5;
      const r4 = arr4.findIndex((value: int, index: int): boolean => index === 4);
      expect(r4).assertEqual(4);
      // 5. findIndex array===arr on (1,2,3) -> 0
      const arr5 = new SparseArray<int>(1, 2, 3);
      const r5 = arr5.findIndex((value: int, index: int, array: SparseArray<int>): boolean => {
        return array === arr5;
      });
      expect(r5).assertEqual(0);
      // 6. findIndex array.length===4 on (1,2,3,4) -> 0
      const arr6 = new SparseArray<int>(1, 2, 3, 4);
      const r6 = arr6.findIndex((value: int, index: int, array: SparseArray<int>): boolean => {
        return array.length === 4;
      });
      expect(r6).assertEqual(0);
      // 7. findIndex array[2]===3 on (1,2,3) -> 0
      const arr7 = new SparseArray<int>(1, 2, 3);
      const r7 = arr7.findIndex((value: int, index: int, array: SparseArray<int>): boolean => {
        return array[2] === 3;
      });
      expect(r7).assertEqual(0);
    });
  });
}
