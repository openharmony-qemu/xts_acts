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
export default function sparseArrayFindLastIndexPart01Test(): void {
  describe('SparseArrayFindLastIndexPart01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_PART01_0100
     * @tc.name sparseArrayFindLastIndexPart01Test001
     * @tc.desc findLastIndex returns last matching index on dense arrays (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindLastIndexPart01Test001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. true predicate on single sparse {42} -> 0
      const arr1 = new SparseArray<int>();
      arr1[0] = 42;
      expect(arr1.findLastIndex((_elem: int): boolean => true)).assertEqual(0);
      // 2. true predicate on (5,10,15) -> 2
      const arr2 = new SparseArray<int>(5, 10, 15);
      expect(arr2.findLastIndex((_elem: int): boolean => true)).assertEqual(2);
      // 3. elem>1 on (1,2,3) -> 2
      const arr3 = new SparseArray<int>(1, 2, 3);
      expect(arr3.findLastIndex((elem: int): boolean => elem > 1)).assertEqual(2);
      // 4. elem<15 on (5,10,15,20) -> 1
      const arr4 = new SparseArray<int>(5, 10, 15, 20);
      expect(arr4.findLastIndex((elem: int): boolean => elem < 15)).assertEqual(1);
      // 5. elem!==8 on (8,8,8,9) -> 3
      const arr5 = new SparseArray<int>(8, 8, 8, 9);
      expect(arr5.findLastIndex((elem: int): boolean => elem !== 8)).assertEqual(3);
      // 6. elem>3 && elem<12 on (1,4,7,10,13) -> 3
      const arr6 = new SparseArray<int>(1, 4, 7, 10, 13);
      expect(arr6.findLastIndex((elem: int): boolean => elem > 3 && elem < 12)).assertEqual(3);
      // 7. elem<3 || elem>12 on (2,5,8,11,14) -> 4
      const arr7 = new SparseArray<int>(2, 5, 8, 11, 14);
      expect(arr7.findLastIndex((elem: int): boolean => elem < 3 || elem > 12)).assertEqual(4);
      // 8. elem>3 on (5,4,3,2,1) -> 1
      const arr8 = new SparseArray<int>(5, 4, 3, 2, 1);
      expect(arr8.findLastIndex((elem: int): boolean => elem > 3)).assertEqual(1);
      // 9. elem<4 on (1,2,3,4,5) -> 2
      const arr9 = new SparseArray<int>(1, 2, 3, 4, 5);
      expect(arr9.findLastIndex((elem: int): boolean => elem < 4)).assertEqual(2);
      // 10. elem===7 on (6,7,8,6,7) -> 4 (duplicate, last index)
      const arr10 = new SparseArray<int>(6, 7, 8, 6, 7);
      expect(arr10.findLastIndex((elem: int): boolean => elem === 7)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_PART01_0200
     * @tc.name sparseArrayFindLastIndexPart01Test002
     * @tc.desc findLastIndex returns last matching index on sparse/typed arrays (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindLastIndexPart01Test002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. true predicate on sparse {0,2,4} -> 4 (last assigned index)
      const arr1 = new SparseArray<int>(5);
      arr1[0] = 1;
      arr1[2] = 3;
      arr1[4] = 5;
      expect(arr1.findLastIndex((_elem: int): boolean => true)).assertEqual(4);
      // 2. elem>=0 on sparse {0} -> 0
      const arr2 = new SparseArray<int>();
      arr2[0] = 0;
      expect(arr2.findLastIndex((elem: int): boolean => elem >= 0)).assertEqual(0);
      // 3. elem===INT_MAX on sparse {MAX} -> 0 (typed int max)
      const arr3 = new SparseArray<int>();
      arr3[0] = 2147483647;
      expect(arr3.findLastIndex((elem: int): boolean => elem === 2147483647)).assertEqual(0);
      // 4. elem<0 on sparse {-1} -> 0 (typed negative)
      const arr4 = new SparseArray<int>();
      arr4[0] = -1;
      expect(arr4.findLastIndex((elem: int): boolean => elem < 0)).assertEqual(0);
      // 5. true predicate on sparse {2,4} -> 4
      const arr5 = new SparseArray<int>(5);
      arr5[2] = 10;
      arr5[4] = 20;
      expect(arr5.findLastIndex((_elem: int): boolean => true)).assertEqual(4);
      // 6. elem>10 on sparse {0,2,4} -> 4
      const arr6 = new SparseArray<int>(6);
      arr6[0] = 5;
      arr6[2] = 15;
      arr6[4] = 25;
      expect(arr6.findLastIndex((elem: int): boolean => elem > 10)).assertEqual(4);
      // 7. elem>20 on sparse {0,1} -> 1
      const arr7 = new SparseArray<int>(4);
      arr7[0] = 30;
      arr7[1] = 40;
      expect(arr7.findLastIndex((elem: int): boolean => elem > 20)).assertEqual(1);
      // 8. true predicate on sparse {0} -> 0
      const arr8 = new SparseArray<int>(5);
      arr8[0] = 7;
      expect(arr8.findLastIndex((_elem: int): boolean => true)).assertEqual(0);
      // 9. elem%2===0 on sparse {0,1,3,4} -> 3
      const arr9 = new SparseArray<int>(5);
      arr9[0] = 1;
      arr9[1] = 2;
      arr9[3] = 4;
      arr9[4] = 5;
      expect(arr9.findLastIndex((elem: int): boolean => elem % 2 === 0)).assertEqual(3);
      // 10. elem===888 on sparse {0,50,99} -> 50 (large sparse)
      const arr10 = new SparseArray<int>(100);
      arr10[0] = 999;
      arr10[50] = 888;
      arr10[99] = 777;
      expect(arr10.findLastIndex((elem: int): boolean => elem === 888)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_PART01_0300
     * @tc.name sparseArrayFindLastIndexPart01Test003
     * @tc.desc findLastIndex no-match returns -1 and callback args (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindLastIndexPart01Test003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. false predicate on (42) -> -1 (no-match)
      const arr1 = new SparseArray<int>(42);
      expect(arr1.findLastIndex((_elem: int): boolean => false)).assertEqual(-1);
      // 2. false predicate on sparse {0,2,4} -> -1 (no-match sparse)
      const arr2 = new SparseArray<int>(5);
      arr2[0] = 1;
      arr2[2] = 3;
      arr2[4] = 5;
      expect(arr2.findLastIndex((_elem: int): boolean => false)).assertEqual(-1);
      // 3. elem>0 on (0) -> -1 (no-match single/empty)
      const arr3 = new SparseArray<int>(0);
      expect(arr3.findLastIndex((elem: int): boolean => elem > 0)).assertEqual(-1);
      // 4. elem!==0 on (0,0,0) -> -1 (no-match all-zero)
      const arr4 = new SparseArray<int>(0, 0, 0);
      expect(arr4.findLastIndex((elem: int): boolean => elem !== 0)).assertEqual(-1);
      // 5. callback elem: elem>=10 on (5,10,15) -> 2
      const arr5 = new SparseArray<int>(5, 10, 15);
      expect(arr5.findLastIndex((elem: int, _index: int, _array: SparseArray<int>): boolean => elem >= 10)).assertEqual(2);
      // 6. callback index: index===1 on (100,200,300) -> 1
      const arr6 = new SparseArray<int>(100, 200, 300);
      expect(arr6.findLastIndex((_elem: int, index: int, _array: SparseArray<int>): boolean => index === 1)).assertEqual(1);
      // 7. callback array: array.length===3 on (7,8,9) -> 2
      const arr7 = new SparseArray<int>(7, 8, 9);
      expect(arr7.findLastIndex((_elem: int, _index: int, array: SparseArray<int>): boolean => array.length === 3)).assertEqual(2);
      // 8. callback elem+index: elem===(index+1)*3 on (3,6,9,12) -> 3
      const arr8 = new SparseArray<int>(3, 6, 9, 12);
      expect(arr8.findLastIndex((elem: int, index: int, _array: SparseArray<int>): boolean => elem === (index + 1) * 3)).assertEqual(3);
      // 9. callback elem+array: elem>0 && array.length===arrLen on (1,3,5,7) -> 3
      const arr9 = new SparseArray<int>(1, 3, 5, 7);
      const arrLen9: int = arr9.length;
      expect(arr9.findLastIndex((elem: int, _index: int, array: SparseArray<int>): boolean => elem > 0 && array.length === arrLen9)).assertEqual(3);
      // 10. callback index+array: index===array.length-1 on (2,4,6) -> 2
      const arr10 = new SparseArray<int>(2, 4, 6);
      expect(arr10.findLastIndex((_elem: int, index: int, array: SparseArray<int>): boolean => index === array.length - 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_PART01_0400
     * @tc.name sparseArrayFindLastIndexPart01Test004
     * @tc.desc findLastIndex throw propagation, right-to-left traversal, remaining matches (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindLastIndexPart01Test004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. callback all three: elem%2===1 && index<len && index>=0 on (1,3,5,7) -> 3
      const arr1 = new SparseArray<int>(1, 3, 5, 7);
      const result1 = arr1.findLastIndex((elem: int, index: int, array: SparseArray<int>): boolean => {
        const len1: int = array.length;
        return elem % 2 === 1 && index < len1 && index >= 0;
      });
      expect(result1).assertEqual(3);
      // 2. throw Error on second callback call (right-to-left, second invocation throws)
      const arr2 = new SparseArray<int>(10, 20, 30, 40);
      try {
        let callCount2: int = 0;
        arr2.findLastIndex((_elem: int, _index: int, _array: SparseArray<int>): boolean => {
          callCount2 = callCount2 + 1;
          if (callCount2 >= 2) {
            throw new Error('second call throws');
          }
          return false;
        });
        expect().assertFail();
      } catch (e2) {
        expect(e2.name).assertEqual('Error');
      }
      // 3. throw Error when elem===3 ('stop at 3')
      const arr3 = new SparseArray<int>(1, 2, 3, 4);
      let reached3: boolean = false;
      try {
        arr3.findLastIndex((elem: int, _index: int, _array: SparseArray<int>): boolean => {
          if (elem === 3) {
            throw new Error('stop at 3');
          }
          return false;
        });
        expect().assertFail();
      } catch (e3) {
        expect(e3.name).assertEqual('Error');
        expect(e3.message).assertEqual('stop at 3');
        reached3 = true;
      }
      expect(reached3).assertTrue();
      // 4. throw RangeError in predicate
      const arr4 = new SparseArray<int>(5, 10, 15);
      try {
        arr4.findLastIndex((_elem: int, _index: int, _array: SparseArray<int>): boolean => {
          throw new RangeError('range error in predicate');
        });
        expect().assertFail();
      } catch (e4) {
        expect(e4.name).assertEqual('RangeError');
      }
      // 5. throw TypeError in predicate
      const arr5 = new SparseArray<int>(1, 2, 3);
      try {
        arr5.findLastIndex((_elem: int, _index: int, _array: SparseArray<int>): boolean => {
          throw new TypeError('type error in predicate');
        });
        expect().assertFail();
      } catch (e5) {
        expect(e5.name).assertEqual('TypeError');
      }
      // 6. right-to-left: count===1 on match (stops at first from right)
      const arr6 = new SparseArray<int>(10, 20, 30);
      let count6: int = 0;
      const result6 = arr6.findLastIndex((_elem: int, _index: int, _array: SparseArray<int>): boolean => {
        count6 = count6 + 1;
        return true;
      });
      expect(result6).assertEqual(2);
      expect(count6).assertEqual(1);
      // 7. right-to-left: callCount===1 on no-match sparse {0} -> -1
      const arr7 = new SparseArray<int>();
      arr7[0] = 42;
      let callCount7: int = 0;
      const result7 = arr7.findLastIndex((_elem: int, _index: int, _array: SparseArray<int>): boolean => {
        callCount7 = callCount7 + 1;
        return false;
      });
      expect(result7).assertEqual(-1);
      expect(callCount7).assertEqual(1);
      // 8. elem>threshold(10) on (3,8,15,22) -> 3
      const arr8 = new SparseArray<int>(3, 8, 15, 22);
      const threshold8: int = 10;
      expect(arr8.findLastIndex((elem: int, _index: int, _array: SparseArray<int>): boolean => elem > threshold8)).assertEqual(3);
      // 9. elem%3===0 on (1,2,3,4,5,6) -> 5
      const arr9 = new SparseArray<int>(1, 2, 3, 4, 5, 6);
      expect(arr9.findLastIndex((elem: int, _index: int, _array: SparseArray<int>): boolean => elem % 3 === 0)).assertEqual(5);
      // 10. elem===5||elem===7 on (1,3,5,7,9) -> 3
      const arr10 = new SparseArray<int>(1, 3, 5, 7, 9);
      const values10: int[] = [5, 7];
      const result10 = arr10.findLastIndex((elem: int, _index: int, _array: SparseArray<int>): boolean => {
        const v10a: int = values10[0];
        const v10b: int = values10[1];
        return elem === v10a || elem === v10b;
      });
      expect(result10).assertEqual(3);
    });
  });
}
