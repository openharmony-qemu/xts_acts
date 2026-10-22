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

interface Item01402 {
  id: int;
  label: string;
}
interface Box03502 {
  id: int;
}

// Merged from SparseArrayMapPart01Test (26 scenarios -> 3 cases, each <=10)
export default function sparseArrayMapTestPart01(): void {
  describe('SparseArrayMapPart01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_PART01_0100
     * @tc.name sparseArrayMapTestPart01001
     * @tc.desc map returns new SparseArray with mapped values (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayMapTestPart01001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. map triple v*3 on [1,2,3] -> result [3,6,9]
      const arr1 = new SparseArray<int>(1, 2, 3);
      const r1 = arr1.map((v: int, i: int, a: SparseArray<int>): int => v * 3);
      expect(r1[0]!).assertEqual(3);
      expect(r1[1]!).assertEqual(6);
      expect(r1[2]!).assertEqual(9);
      // 2. map int->double v.toDouble()*1.5 on [1,2,3] -> [1.5,3.0,4.5]
      const arr2 = new SparseArray<int>(1, 2, 3);
      const r2 = arr2.map((v: int, i: int, a: SparseArray<int>): double => v.toDouble() * 1.5);
      expect(r2[0]!).assertEqual(1.5);
      expect(r2[1]!).assertEqual(3.0);
      expect(r2[2]!).assertEqual(4.5);
      // 3. map int->Item01402 on [1,2,3] -> ids 1,2,3 and label "item1"
      const arr3 = new SparseArray<int>(1, 2, 3);
      const r3 = arr3.map((v: int, i: int, a: SparseArray<int>): Item01402 => {
        return { id: v, label: 'item' + v.toString() } as Item01402;
      });
      expect(r3[0]!.id).assertEqual(1);
      expect(r3[0]!.label).assertEqual('item1');
      expect(r3[1]!.id).assertEqual(2);
      expect(r3[2]!.id).assertEqual(3);
      // 4. map -> nested SparseArray(v, v*10) on [1,2] -> [1,10] and [2,20]
      const arr4 = new SparseArray<int>(1, 2);
      const r4 = arr4.map((v: int, i: int, a: SparseArray<int>): SparseArray<int> => {
        return new SparseArray<int>(v, v * 10);
      });
      expect(r4[0]![0]!).assertEqual(1);
      expect(r4[0]![1]!).assertEqual(10);
      expect(r4[1]![0]!).assertEqual(2);
      expect(r4[1]![1]!).assertEqual(20);
      // 5. map wraps empty string with brackets on ['','a','b'] -> result[0]="[]"
      const arr5 = new SparseArray<string>('', 'a', 'b');
      const r5 = arr5.map((v: string, i: int, a: SparseArray<string>): string => '[' + v + ']');
      expect(r5[0]!).assertEqual('[]');
      // 6. map wraps newline/tab with 'X' on ['\n','\t','normal'] -> "X\nX" and "X\tX"
      const arr6 = new SparseArray<string>('\n', '\t', 'normal');
      const r6 = arr6.map((v: string, i: int, a: SparseArray<string>): string => 'X' + v + 'X');
      expect(r6[0]!).assertEqual('X\nX');
      expect(r6[1]!).assertEqual('X\tX');
      // 7. map<string> boolean->yes/no on [T,F,T] -> length 3, [0]="yes", [1]="no"
      const arr7 = new SparseArray<boolean>(true, false, true);
      const r7: SparseArray<string> = arr7.map<string>((value: boolean) => (value ? 'yes' : 'no'));
      expect(r7.length).assertEqual(3);
      expect(r7[0]!).assertEqual('yes');
      expect(r7[1]!).assertEqual('no');
      // 8. map<boolean> string->non-empty on ["hello","","world"] -> [0]=true, [1]=false
      const arr8 = new SparseArray<string>('hello', '', 'world');
      const r8: SparseArray<boolean> = arr8.map<boolean>((value: string) => value.length > 0);
      expect(r8[0]!).assertTrue();
      expect(r8[1]!).assertFalse();
      // 9. map<int> on empty SparseArray<string> -> length 0, callCount 0, arr.length 0
      const arr9 = new SparseArray<string>();
      let cc9: int = 0;
      const r9: SparseArray<int> = arr9.map<int>((value: string): int => {
        cc9 = cc9 + 1;
        return value.length;
      });
      expect(r9.length).assertEqual(0);
      expect(cc9).assertEqual(0);
      expect(arr9.length).assertEqual(0);
      // 10. map int->Box03502|null on [1,2,3] -> [0].id=1, [1]=null, [2].id=3
      const arr10 = new SparseArray<int>(1, 2, 3);
      const r10: SparseArray<Box03502 | null> = arr10.map((v: int, i: int, a: SparseArray<int>): Box03502 | null => {
        if (v === 2) {
          return null;
        }
        return { id: v } as Box03502;
      });
      expect(r10[0]!.id).assertEqual(1);
      expect(r10[1]).assertNull();
      expect(r10[2]!.id).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_PART01_0200
     * @tc.name sparseArrayMapTestPart01002
     * @tc.desc typed elements & callback args (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayMapTestPart01002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. map<bigint> int*100 on [42,99] -> result[0]=4200n
      const arr1 = new SparseArray<int>(42, 99);
      const r1: SparseArray<bigint> = arr1.map<bigint>((value: int) => BigInt(value * 100));
      expect(r1[0]!).assertEqual(4200n);
      // 2. map<string> prepend '$' on [5,-3,8] -> result[1]="$-3"
      const arr2 = new SparseArray<int>(5, -3, 8);
      const r2: SparseArray<string> = arr2.map<string>((value: int) => '$' + value.toString());
      expect(r2[1]!).assertEqual('$-3');
      // 3. map<int> boolean->1/0 on [T,F,T] -> result[0]=1
      const arr3 = new SparseArray<boolean>(true, false, true);
      const r3: SparseArray<int> = arr3.map<int>((value: boolean) => (value ? 1 : 0));
      expect(r3[0]!).assertEqual(1);
      // 4. map<double> int/3.0 on [5,10,15] -> result[0]=5.0/3.0
      const arr4 = new SparseArray<int>(5, 10, 15);
      const r4: SparseArray<double> = arr4.map<double>((value: int) => value / 3.0);
      expect(r4[0]!).assertEqual(5.0 / 3.0);
      // 5. map<int> MIN_INT+1 on [-2147483648] -> result[0]=-2147483647
      const arr5 = SparseArray.of<int>(-2147483648);
      const r5: SparseArray<int> = arr5.map<int>((value: int) => value + 1);
      expect(r5[0]!).assertEqual(-2147483647);
      // 6. map<double> int*1.1 on [1,2,3,4] -> length 4, [0..3]=1.1,2.2,3.3,4.4
      const arr6 = new SparseArray<int>(1, 2, 3, 4);
      const r6: SparseArray<double> = arr6.map<double>((value: int) => value * 1.1);
      expect(r6.length).assertEqual(4);
      expect(r6[0]!).assertClose(1.1, 0.0001);
      expect(r6[1]!).assertClose(2.2, 0.0001);
      expect(r6[2]!).assertClose(3.3, 0.0001);
      expect(r6[3]!).assertClose(4.4, 0.0001);
      // 7. map<int> bigint->int on [10n,20n,30n] -> length 3, [0..2]=10,20,30
      const arr7 = new SparseArray<bigint>(10n, 20n, 30n);
      const r7: SparseArray<int> = arr7.map<int>((value: bigint): int => Number(value).toInt());
      expect(r7.length).assertEqual(3);
      expect(r7[0]!).assertEqual(10);
      expect(r7[1]!).assertEqual(20);
      expect(r7[2]!).assertEqual(30);
      // 8. map v>5 on sparse {1:10,3:30} -> holes undefined, [1] and [3] true
      const arr8 = new SparseArray<int>(4);
      arr8[1] = 10;
      arr8[3] = 30;
      const r8: SparseArray<boolean> = arr8.map((v: int, i: int, a: SparseArray<int>): boolean => v > 5);
      expect(r8[0]).assertUndefined();
      expect(r8[1]!).assertTrue();
      expect(r8[2]).assertUndefined();
      expect(r8[3]!).assertTrue();
      // 9. callback reads a[-(len+1)] at i=0 on [5,10,15] -> undefined
      const arr9 = new SparseArray<int>(5, 10, 15);
      let negBeyond9: Object | undefined = undefined;
      arr9.map((v: int, i: int, a: SparseArray<int>): int => {
        if (i === 0) {
          negBeyond9 = a[-(arr9.length + 1)];
        }
        return v;
      });
      expect(negBeyond9).assertUndefined();
      // 10. callback writes a[3]=99 at i=2 on [1,2,3] -> arr.length grows to 4, arr[3]=99
      const arr10 = new SparseArray<int>(1, 2, 3);
      arr10.map((v: int, i: int, a: SparseArray<int>): int => {
        if (i === 2) {
          a[3] = 99;
        }
        return v;
      });
      expect(arr10.length).assertEqual(4);
      expect(arr10[3]!).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_PART01_0300
     * @tc.name sparseArrayMapTestPart01003
     * @tc.desc throw propagation (6 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayMapTestPart01003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. map throws URIError on [1,2,3] -> caught name "URIError"
      const arr1 = new SparseArray<int>(1, 2, 3);
      try {
        arr1.map((v: int, i: int, a: SparseArray<int>): int => {
          throw new URIError('uri error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('URIError');
      }
      // 2. map throws AggregateError on [1,2,3] -> caught name "AggregateError"
      const arr2 = new SparseArray<int>(1, 2, 3);
      try {
        arr2.map((v: int, i: int, a: SparseArray<int>): int => {
          let errs: Error[] = [new Error('e1'), new Error('e2')];
          throw new AggregateError(errs, 'aggregate');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('AggregateError');
      }
      // 3. map throws EvalError at i=2 on [100,200,300,400,500] -> caught "EvalError"
      const arr3 = new SparseArray<int>(100, 200, 300, 400, 500);
      try {
        arr3.map((v: int, i: int, a: SparseArray<int>): int => {
          if (i === 2) {
            throw new EvalError('eval at idx 2');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('EvalError');
      }
      // 4. map throws Error at i=3 on [1..7] -> caught "Error", count=4
      const arr4 = new SparseArray<int>(1, 2, 3, 4, 5, 6, 7);
      let count4: int = 0;
      try {
        arr4.map((v: int, i: int, a: SparseArray<int>): int => {
          count4 = count4 + 1;
          if (i === 3) {
            throw new Error('middle');
          }
          return v * 10;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count4).assertEqual(4);
      }
      // 5. map on empty 5-length array never runs throwing callback -> result length 5, [0] undefined
      const arr5 = new SparseArray<int>(5);
      const r5: SparseArray<int> = arr5.map((v: int, i: int, a: SparseArray<int>): int => {
        throw new Error('should never execute');
      });
      expect(r5.length).assertEqual(5);
      expect(r5[0]).assertUndefined();
      // 6. map on sparse {0:10,1:20,4:50} throws at i=4 -> caught "Error", count=3
      const arr6 = new SparseArray<int>(5);
      arr6[0] = 10;
      arr6[1] = 20;
      arr6[4] = 50;
      let count6: int = 0;
      try {
        arr6.map((v: int, i: int, a: SparseArray<int>): int => {
          count6 = count6 + 1;
          if (i === 4) {
            throw new Error('after hole');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count6).assertEqual(3);
      }
    });
  });
}
