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
} from '../../../../hypium/index';
import Utils from '../Util.test';

interface SparseArrayFilterPartItem {
  id: int;
}
interface SparseArrayFilterPartNamedItem {
  id: int;
  name: string;
}

// Merged from SparseArrayFilterPart01Test + SparseArrayFilterPart03Test (50 scenarios -> 5 cases, each <=10)
export default function sparseArrayFilterPartTest(): void {
  describe('SparseArrayFilterPartTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_PART_0100
     * @tc.name sparseArrayFilterPartTest001
     * @tc.desc filter-all/filter-none numeric predicates & invocation (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFilterPartTest001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. filter(-1,0,1,2) v>0 -> length 2
      const arr1 = new SparseArray<int>(-1, 0, 1, 2);
      const result1 = arr1.filter((v: int, i: int, a: SparseArray<int>): boolean => v > 0);
      expect(result1.length).assertEqual(2);
      // 2. filter(1,2,3,4) v%2===0 -> length 2
      const arr2 = new SparseArray<int>(1, 2, 3, 4);
      const result2 = arr2.filter((v: int, i: int, a: SparseArray<int>): boolean => v % 2 === 0);
      expect(result2.length).assertEqual(2);
      // 3. filter(1,2,3,4,5) v>3 -> length 2
      const arr3 = new SparseArray<int>(1, 2, 3, 4, 5);
      const result3 = arr3.filter((v: int, i: int, a: SparseArray<int>): boolean => v > 3);
      expect(result3.length).assertEqual(2);
      // 4. filter(1,2,3,4,5,6) v>2&&v<5 -> length 2
      const arr4 = new SparseArray<int>(1, 2, 3, 4, 5, 6);
      const result4 = arr4.filter((v: int, i: int, a: SparseArray<int>): boolean => v > 2 && v < 5);
      expect(result4.length).assertEqual(2);
      // 5. filter(-5,-3,-1) v<0 -> length 3
      const arr5 = new SparseArray<int>(-5, -3, -1);
      const result5 = arr5.filter((v: int, i: int, a: SparseArray<int>): boolean => v < 0);
      expect(result5.length).assertEqual(3);
      // 6. filter(1,2,3,4,5,6) (v%2===0&&v>2)||v===1 -> length 3
      const arr6 = new SparseArray<int>(1, 2, 3, 4, 5, 6);
      const result6 = arr6.filter((v: int, i: int, a: SparseArray<int>): boolean => (v % 2 === 0 && v > 2) || v === 1);
      expect(result6.length).assertEqual(3);
      // 7. filter(0,0,0) value===0 -> length 3
      const arr7 = new SparseArray<int>(0, 0, 0);
      const result7 = arr7.filter((value: int): boolean => value === 0);
      expect(result7.length).assertEqual(3);
      // 8. filter(1,2,3,4) v>0&&i>=0&&a.length===4 -> length 4 (filter-all, 3 params)
      const arr8 = new SparseArray<int>(1, 2, 3, 4);
      const result8 = arr8.filter((v: int, i: int, a: SparseArray<int>): boolean => {
        return v > 0 && i >= 0 && a.length === 4;
      });
      expect(result8.length).assertEqual(4);
      // 9. filter(1,2,3,4,5) a.includes(v*2) -> length 2 (predicate uses array method)
      const arr9 = new SparseArray<int>(1, 2, 3, 4, 5);
      const result9 = arr9.filter((v: int, i: int, a: SparseArray<int>): boolean => {
        return a.includes(v * 2);
      });
      expect(result9.length).assertEqual(2);
      // 10. filter(5,5,5) callCount++ -> 3 (invocation count equals length)
      let callCount10: int = 0;
      const arr10 = new SparseArray<int>(5, 5, 5);
      arr10.filter((v: int, i: int, a: SparseArray<int>): boolean => {
        callCount10 = callCount10 + 1;
        return v === 5;
      });
      expect(callCount10).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_PART_0200
     * @tc.name sparseArrayFilterPartTest002
     * @tc.desc predicate value/index/array params & sparse index traversal (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFilterPartTest002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. filter(100,200,300) capture firstIdx -> 0
      const arr1 = new SparseArray<int>(100, 200, 300);
      let firstIdx1: int = -1;
      arr1.filter((v: int, i: int, a: SparseArray<int>): boolean => {
        if (firstIdx1 === -1) {
          firstIdx1 = i;
        }
        return true;
      });
      expect(firstIdx1).assertEqual(0);
      // 2. filter(11,22,33) capture lastIdx -> 2
      const arr2 = new SparseArray<int>(11, 22, 33);
      let lastIdx2: int = -1;
      arr2.filter((v: int, i: int, a: SparseArray<int>): boolean => {
        lastIdx2 = i;
        return true;
      });
      expect(lastIdx2).assertEqual(2);
      // 3. filter(1,2,3,4,5) monotonic index -> true
      const arr3 = new SparseArray<int>(1, 2, 3, 4, 5);
      let prevIdx3: int = -1;
      let monotonic3: boolean = true;
      arr3.filter((v: int, i: int, a: SparseArray<int>): boolean => {
        if (i <= prevIdx3) {
          monotonic3 = false;
        }
        prevIdx3 = i;
        return true;
      });
      expect(monotonic3).assertTrue();
      // 4. filter sparse len=5 {0,3} capture indices -> [0,3]
      const arr4 = new SparseArray<int>(5);
      arr4[0] = 10;
      arr4[3] = 40;
      let indices4: int[] = [];
      arr4.filter((v: int, i: int, a: SparseArray<int>): boolean => {
        indices4.push(i);
        return true;
      });
      expect(indices4[0]).assertEqual(0);
      expect(indices4[1]).assertEqual(3);
      // 5. filter len=5 sparse@{3} capturedIdx -> 3
      const arr5 = new SparseArray<int>(5);
      arr5[3] = 99;
      let capturedIdx5: int = -1;
      arr5.filter((v: int, i: int, a: SparseArray<int>): boolean => {
        capturedIdx5 = i;
        return true;
      });
      expect(capturedIdx5).assertEqual(3);
      // 6. filter len=100 sparse@{99} value===999 -> length 1, result[0]=999
      const arr6 = new SparseArray<int>(100);
      arr6[99] = 999;
      const result6 = arr6.filter((value: int): boolean => value === 999);
      expect(result6.length).assertEqual(1);
      expect(result6[0]).assertEqual(999);
      // 7. filter(1,2,3) sameRef a===arr -> true
      const arr7 = new SparseArray<int>(1, 2, 3);
      let sameRef7: boolean = false;
      arr7.filter((v: int, i: int, a: SparseArray<int>): boolean => {
        sameRef7 = a === arr7;
        return true;
      });
      expect(sameRef7).assertTrue();
      // 8. filter(10 sparse{0,9}) a.length===10 -> lenMatch true
      const arr8 = new SparseArray<int>(10);
      arr8[0] = 1;
      arr8[9] = 10;
      let lenMatch8: boolean = true;
      arr8.filter((v: int, i: int, a: SparseArray<int>): boolean => {
        if (a.length !== 10) {
          lenMatch8 = false;
        }
        return true;
      });
      expect(lenMatch8).assertTrue();
      // 9. filter(5,10,15) a[i]===v -> allMatch true
      const arr9 = new SparseArray<int>(5, 10, 15);
      let allMatch9: boolean = true;
      arr9.filter((v: int, i: int, a: SparseArray<int>): boolean => {
        if (a[i] !== v) {
          allMatch9 = false;
        }
        return true;
      });
      expect(allMatch9).assertTrue();
      // 10. filter(10,20,30) a[0]&&a[2] at i===1 -> canAccess true
      const arr10 = new SparseArray<int>(10, 20, 30);
      let canAccess10: boolean = false;
      arr10.filter((v: int, i: int, a: SparseArray<int>): boolean => {
        if (i === 1) {
          canAccess10 = a[0] === 10 && a[2] === 30;
        }
        return true;
      });
      expect(canAccess10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_PART_0300
     * @tc.name sparseArrayFilterPartTest003
     * @tc.desc result new instance & live source mutation during traversal (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFilterPartTest003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. filter(1,2,3,2,4) v===2 -> result[0]=2,result[1]=2; result[0]=99 keeps arr[0]=1; length 2
      const arr1 = new SparseArray<int>(1, 2, 3, 2, 4);
      const result1 = arr1.filter((v: int, i: int, a: SparseArray<int>): boolean => v === 2);
      expect(result1[0]!).assertEqual(2);
      expect(result1[1]!).assertEqual(2);
      result1[0] = 99;
      expect(arr1[0]!).assertEqual(1);
      expect(result1.length).assertEqual(2);
      // 2. filter(1,2,3) a[i]=v*10 -> arr becomes 10,20,30
      const arr2 = new SparseArray<int>(1, 2, 3);
      arr2.filter((v: int, i: int, a: SparseArray<int>): boolean => {
        a[i] = v * 10;
        return true;
      });
      expect(arr2[0]).assertEqual(10);
      expect(arr2[1]).assertEqual(20);
      expect(arr2[2]).assertEqual(30);
      // 3. filter(1,2,3) read array[-1] as undefined, preserves all -> length 3
      const arr3 = new SparseArray<int>(1, 2, 3);
      const result3 = arr3.filter((value: int, index: int, array: SparseArray<int>): boolean => {
        const v: int | undefined = array[-1];
        expect(v).assertUndefined();
        return true;
      });
      expect(result3.length).assertEqual(3);
      // 4. filter(1,2,3) read array[length] as undefined, preserves all -> length 3
      const arr4 = new SparseArray<int>(1, 2, 3);
      const result4 = arr4.filter((value: int, index: int, array: SparseArray<int>): boolean => {
        const v: int | undefined = array[arr4.length];
        expect(v).assertUndefined();
        return true;
      });
      expect(result4.length).assertEqual(3);
      // 5. filter(1,2,3) array[-1]=0 ignored -> result 3, arr 3, arr[-1] undefined
      const arr5 = new SparseArray<int>(1, 2, 3);
      const result5 = arr5.filter((_value: int, _index: int, array: SparseArray<int>): boolean => {
        array[-1] = 0;
        return true;
      });
      expect(result5.length).assertEqual(3);
      expect(arr5.length).assertEqual(3);
      expect(arr5[-1]).assertUndefined();
      // 6. filter(1,2) array[5]=999 observes appended -> length 3
      const arr6 = new SparseArray<int>(1, 2);
      const result6 = arr6.filter((value: int, index: int, array: SparseArray<int>): boolean => {
        array[5] = 999;
        return true;
      });
      expect(result6.length).assertEqual(3);
      // 7. filter(10,20,30,40) prev!==undefined -> length 4
      const arr7 = new SparseArray<int>(10, 20, 30, 40);
      const result7 = arr7.filter((value: int, index: int, array: SparseArray<int>): boolean => {
        if (index > 0) {
          const prev: int | undefined = array[index - 1];
          return prev !== undefined;
        }
        return true;
      });
      expect(result7.length).assertEqual(4);
      // 8. filter(1,2,3) array[10]=999 at idx 0 -> length 4
      const arr8 = new SparseArray<int>(1, 2, 3);
      const result8 = arr8.filter((value: int, index: int, array: SparseArray<int>): boolean => {
        if (index === 0) {
          array[10] = 999;
        }
        return true;
      });
      expect(result8.length).assertEqual(4);
      // 9. filter(1,2,3,4,5) length=10 then array.length=2 at idx 2 -> length 3
      const arr9 = new SparseArray<int>(1, 2, 3, 4, 5);
      arr9.length = 10;
      const result9 = arr9.filter((value: int, index: int, array: SparseArray<int>): boolean => {
        if (index === 2) {
          array.length = 2;
        }
        return true;
      });
      expect(result9.length).assertEqual(3);
      // 10. filter(1,2,3) array[2]=999 at idx 1, v>1 -> length 2
      const arr10 = new SparseArray<int>(1, 2, 3);
      const result10 = arr10.filter((value: int, index: int, array: SparseArray<int>): boolean => {
        if (index === 1) {
          array[2] = 999;
        }
        return value > 1;
      });
      expect(result10.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_PART_0400
     * @tc.name sparseArrayFilterPartTest004
     * @tc.desc typed elements primitive & reference (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFilterPartTest004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. T=boolean filter(true,false,true) v -> length 2
      const arr1 = new SparseArray<boolean>(true, false, true);
      const result1 = arr1.filter((v: boolean, i: int, a: SparseArray<boolean>): boolean => v);
      expect(result1.length).assertEqual(2);
      // 2. T=double filter(NaN,1.0,2.0) isNaN(v) -> length 1
      const arr2 = new SparseArray<double>(Double.NaN, 1.0, 2.0);
      const result2 = arr2.filter((v: double, i: int, a: SparseArray<double>): boolean => isNaN(v));
      expect(result2.length).assertEqual(1);
      // 3. T=double filter(POSITIVE_INFINITY,1.0) !isFinite(v) -> length 1
      const arr3 = new SparseArray<double>(Double.POSITIVE_INFINITY, 1.0);
      const result3 = arr3.filter((v: double, i: int, a: SparseArray<double>): boolean => !isFinite(v));
      expect(result3.length).assertEqual(1);
      // 4. T=double filter(-0.0,0.0,1.0) v>=0 -> length 3
      const arr4 = new SparseArray<double>(-0.0, 0.0, 1.0);
      const result4 = arr4.filter((value: double): boolean => value >= 0.0);
      expect(result4.length).assertEqual(3);
      // 5. T=bigint filter(9223372036854775807n,1n,2n) v>100n -> length 1
      const arr5 = new SparseArray<bigint>(9223372036854775807n, 1n, 2n);
      const result5 = arr5.filter((value: bigint): boolean => value > 100n);
      expect(result5.length).assertEqual(1);
      // 6. T=double filter(Number.MAX_VALUE,0.5) v>100 -> length 1
      const arr6 = new SparseArray<double>(Number.MAX_VALUE, 0.5);
      const result6 = arr6.filter((value: double): boolean => value > 100.0);
      expect(result6.length).assertEqual(1);
      // 7. T=object filter(obj1,obj2) v.id>1 -> length 1
      const obj7a: SparseArrayFilterPartItem = { id: 1 };
      const obj7b: SparseArrayFilterPartItem = { id: 2 };
      const arr7 = new SparseArray<SparseArrayFilterPartItem>(obj7a, obj7b);
      const result7 = arr7.filter((v: SparseArrayFilterPartItem, i: int, a: SparseArray<SparseArrayFilterPartItem>): boolean => v.id > 1);
      expect(result7.length).assertEqual(1);
      // 8. T=Date filter(d1,d2) v.getTime()>0 -> length 1
      const d8a = new Date(0);
      const d8b = new Date(1000);
      const arr8 = new SparseArray<Date>(d8a, d8b);
      const result8 = arr8.filter((v: Date, i: int, a: SparseArray<Date>): boolean => v.getTime() > 0);
      expect(result8.length).assertEqual(1);
      // 9. T=RegExp filter(r1,r2) v.source==='abc' -> length 1
      const r9a = new RegExp('abc');
      const r9b = new RegExp('def');
      const arr9 = new SparseArray<RegExp>(r9a, r9b);
      const result9 = arr9.filter((v: RegExp, i: int, a: SparseArray<RegExp>): boolean => v.source === 'abc');
      expect(result9.length).assertEqual(1);
      // 10. T=string filter('a','ab','abc','abcd') v.length>2 -> length 2, result[0]='abc', result[1]='abcd'
      const arr10 = new SparseArray<string>('a', 'ab', 'abc', 'abcd');
      const result10 = arr10.filter((value: string): boolean => value.length > 2);
      expect(result10.length).assertEqual(2);
      expect(result10[0]).assertEqual('abc');
      expect(result10[1]).assertEqual('abcd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_PART_0500
     * @tc.name sparseArrayFilterPartTest005
     * @tc.desc reference typed elements & throw propagation error paths (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFilterPartTest005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. T=Date filter(2020,2021,2022) getFullYear>2020 -> length 2
      const d1a: Date = new Date(2020, 0, 1);
      const d1b: Date = new Date(2021, 0, 1);
      const d1c: Date = new Date(2022, 0, 1);
      const arr1 = new SparseArray<Date>(d1a, d1b, d1c);
      const result1 = arr1.filter((value: Date): boolean => value.getFullYear() > 2020);
      expect(result1.length).assertEqual(2);
      // 2. T=RegExp filter('abc','\\d+','xyz') source.length>2 -> length 3
      const r2a: RegExp = new RegExp('abc');
      const r2b: RegExp = new RegExp('\\d+');
      const r2c: RegExp = new RegExp('xyz');
      const arr2 = new SparseArray<RegExp>(r2a, r2b, r2c);
      const result2 = arr2.filter((value: RegExp): boolean => value.source.length > 2);
      expect(result2.length).assertEqual(3);
      // 3. T=object filter(a,b,c) id%2===1 -> length 2
      const o3a: SparseArrayFilterPartNamedItem = { id: 1, name: 'alpha' } as SparseArrayFilterPartNamedItem;
      const o3b: SparseArrayFilterPartNamedItem = { id: 2, name: 'beta' } as SparseArrayFilterPartNamedItem;
      const o3c: SparseArrayFilterPartNamedItem = { id: 3, name: 'gamma' } as SparseArrayFilterPartNamedItem;
      const arr3 = new SparseArray<SparseArrayFilterPartNamedItem>(o3a, o3b, o3c);
      const result3 = arr3.filter((value: SparseArrayFilterPartNamedItem): boolean => value.id % 2 === 1);
      expect(result3.length).assertEqual(2);
      // 4. T=Array<int> filter(sub1,sub2,sub3) length>=2 -> length 2
      const sub4a: Array<int> = [1, 2];
      const sub4b: Array<int> = [3];
      const sub4c: Array<int> = [4, 5, 6];
      const arr4 = new SparseArray<Array<int>>(sub4a, sub4b, sub4c);
      const result4 = arr4.filter((value: Array<int>): boolean => value.length >= 2);
      expect(result4.length).assertEqual(2);
      // 5. filter(1,2,3) predicate throws TypeError -> propagated
      const arr5 = new SparseArray<int>(1, 2, 3);
      try {
        arr5.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          throw new TypeError('type error in predicate');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(e.message).assertEqual('type error in predicate');
      }
      // 6. filter(1,2,3) predicate throws RangeError -> propagated
      const arr6 = new SparseArray<int>(1, 2, 3);
      try {
        arr6.filter((v: int, i: int, a: SparseArray<int>): boolean => {
          throw new RangeError('range error in predicate');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(e.message).assertEqual('range error in predicate');
      }
      // 7. filter(1,2,3,4,5) throw RangeError on value===3, arr unchanged
      const arr7 = new SparseArray<int>(1, 2, 3, 4, 5);
      try {
        arr7.filter((value: int): boolean => {
          if (value === 3) {
            throw new RangeError('err');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(arr7[0]).assertEqual(1);
        expect(arr7[1]).assertEqual(2);
        expect(arr7[2]).assertEqual(3);
        expect(arr7[3]).assertEqual(4);
        expect(arr7[4]).assertEqual(5);
      }
      // 8. filter sparse len=5 {0,1,3,4} throw TypeError on value===40
      const arr8 = new SparseArray<int>(5);
      arr8[0] = 10;
      arr8[1] = 20;
      arr8[3] = 30;
      arr8[4] = 40;
      try {
        arr8.filter((value: int): boolean => {
          if (value === 40) {
            throw new TypeError('sparse last');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      // 9. filter(1,2,3,4,5) undefined result, throw RangeError on value===3, result undefined
      const arr9 = new SparseArray<int>(1, 2, 3, 4, 5);
      let result9: SparseArray<int> | undefined = undefined;
      try {
        result9 = arr9.filter((value: int): boolean => {
          if (value === 3) {
            throw new RangeError('half way');
          }
          return value > 0;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(result9).assertUndefined();
      }
      // 10. filter sparse len=5 {0,2,4} throw RangeError on value===30, arr unchanged
      const arr10 = new SparseArray<int>(5);
      arr10[0] = 10;
      arr10[2] = 30;
      arr10[4] = 50;
      try {
        arr10.filter((value: int): boolean => {
          if (value === 30) {
            throw new RangeError('hole test');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(arr10[0]).assertEqual(10);
        expect(arr10[1]).assertUndefined();
        expect(arr10[2]).assertEqual(30);
        expect(arr10[3]).assertUndefined();
        expect(arr10[4]).assertEqual(50);
      }
    });
  });
}
