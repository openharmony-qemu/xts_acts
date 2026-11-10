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
interface SparseArrayConcatPart01Object {
  id: int;
}
interface SparseArrayConcatPart01NullableObject {
  id: int;
}
export default function sparseArrayConcatPart01Test(): void {
  describe('SparseArrayConcatPart01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_PART01_0100
     * @tc.name sparseArrayConcatPart01Test001
     * @tc.desc concat() basic int value/length preservation, large/long values, chained & immutability (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayConcatPart01Test001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. concat([]) on (1,2,3) -> length 3, [0]=1
      const arr1 = new SparseArray<int>(1, 2, 3);
      const item1: Array<int> = [];
      const result1 = arr1.concat(item1);
      expect(result1.length).assertEqual(3);
      expect(result1[0]).assertEqual(1);
      // 2. concat([0,99,0]) on (1,2) -> length 5, [0..4]=1,2,0,99,0
      const arr2 = new SparseArray<int>(1, 2);
      const item2: Array<int> = [0, 99, 0];
      const result2 = arr2.concat(item2);
      expect(result2.length).assertEqual(5);
      expect(result2[0]).assertEqual(1);
      expect(result2[1]).assertEqual(2);
      expect(result2[2]).assertEqual(0);
      expect(result2[3]).assertEqual(99);
      expect(result2[4]).assertEqual(0);
      // 3. concat([2147483647]) on (1) -> length 2, [1]=2147483647
      const arr3 = new SparseArray<int>(1);
      const item3: Array<int> = [2147483647];
      const result3 = arr3.concat(item3);
      expect(result3.length).assertEqual(2);
      expect(result3[1]).assertEqual(2147483647);
      // 4. concat([20]) on sparse src [0]=10 (len 2) -> length 3, [0]=10, [1]=hole, [2]=20
      const arr4 = new SparseArray<int>(2);
      arr4[0] = 10;
      const item4: Array<int> = [20];
      const result4 = arr4.concat(item4);
      expect(result4.length).assertEqual(3);
      expect(result4[0]).assertEqual(10);
      expect(result4[1]).assertUndefined();
      expect(result4[2]).assertEqual(20);
      // 5. concat(len-100 Array<int> with 999@50) on [0]=1 -> length 101, [0]=1, [51]=999, [52]=0
      const arr5 = new SparseArray<int>();
      arr5[0] = 1;
      const item5: Array<int> = Array.create<int>(100, 0);
      item5[50] = 999;
      const result5 = arr5.concat(item5);
      expect(result5.length).assertEqual(101);
      expect(result5[0]).assertEqual(1);
      expect(result5[51]).assertEqual(999);
      expect(result5[52]).assertEqual(0);
      // 6. concat([10,20]) on empty src -> length 2, [0]=10, [1]=20
      const arr6 = new SparseArray<int>();
      const item6: Array<int> = [10, 20];
      const result6 = arr6.concat(item6);
      expect(result6.length).assertEqual(2);
      expect(result6[0]).assertEqual(10);
      expect(result6[1]).assertEqual(20);
      // 7. concat([BigInt('99999999999999999999')]) on (1n) -> length 2
      const arr7 = new SparseArray<bigint>(1n);
      const item7: Array<bigint> = [BigInt('99999999999999999999')];
      const result7 = arr7.concat(item7);
      expect(result7.length).assertEqual(2);
      // 8. concat([2048-char 'x...']) on ('start') -> length 2, [1].length=2048
      let longStr8: string = 'x';
      for (let i: int = 0; i < 11; i++) {
        longStr8 = longStr8 + longStr8;
      }
      const arr8 = new SparseArray<string>('start');
      const item8: Array<string> = [longStr8];
      const result8 = arr8.concat(item8);
      expect(result8.length).assertEqual(2);
      expect(result8[1]!.length).assertEqual(2048);
      // 9. concat(shared).concat(shared) on [0]=1 with shared=[99] -> length 3, [0..2]=1,99,99
      const arr9 = new SparseArray<int>();
      arr9[0] = 1;
      const shared9: Array<int> = [99];
      const result9 = arr9.concat(shared9).concat(shared9);
      expect(result9.length).assertEqual(3);
      expect(result9[0]).assertEqual(1);
      expect(result9[1]).assertEqual(99);
      expect(result9[2]).assertEqual(99);
      // 10. concat([10]) then item[0]=999 -> result[1] stays 10 (independence)
      const arr10 = new SparseArray<int>(1);
      const item10: Array<int> = [10];
      const result10 = arr10.concat(item10);
      item10[0] = 999;
      expect(result10.length).assertEqual(2);
      expect(result10[1]).assertEqual(10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_PART01_0200
     * @tc.name sparseArrayConcatPart01Test002
     * @tc.desc concat() primitive typed element append - string/boolean/double/byte/char (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayConcatPart01Test002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. concat(['hello']) on ('a') -> length 2, [1]='hello'
      const arr1 = new SparseArray<string>('a');
      const item1: Array<string> = ['hello'];
      const result1 = arr1.concat(item1);
      expect(result1.length).assertEqual(2);
      expect(result1[1]).assertEqual('hello');
      // 2. concat([true,false]) on (false) -> length 3, [0..2]=false,true,false
      const arr2 = new SparseArray<boolean>(false);
      const item2: Array<boolean> = [true, false];
      const result2 = arr2.concat(item2);
      expect(result2.length).assertEqual(3);
      expect(result2[0]).assertFalse();
      expect(result2[1]).assertTrue();
      expect(result2[2]).assertFalse();
      // 3. concat([NaN]) on (1.0) -> length 2, isNaN([1])
      const arr3 = new SparseArray<double>(1.0);
      const item3: Array<double> = [Number.NaN];
      const result3 = arr3.concat(item3);
      expect(result3.length).assertEqual(2);
      const value3 = result3[1];
      expect(value3 === undefined).assertFalse();
      expect(isNaN(value3!)).assertTrue();
      // 4. concat([+Infinity]) on (1.0) -> length 2, [1]=+Infinity
      const arr4 = new SparseArray<double>(1.0);
      const item4: Array<double> = [Number.POSITIVE_INFINITY];
      const result4 = arr4.concat(item4);
      expect(result4.length).assertEqual(2);
      expect(result4[1]).assertEqual(Number.POSITIVE_INFINITY);
      // 5. concat([-0.0]) on (0.0) -> length 2, [0]=0.0, [1]=-0.0
      const arr5 = new SparseArray<double>(0.0);
      const item5: Array<double> = [-0.0];
      const result5 = arr5.concat(item5);
      expect(result5.length).assertEqual(2);
      expect(result5[0]).assertEqual(0.0);
      expect(result5[1]).assertEqual(-0.0);
      // 6. concat([MAX_VALUE]) on (1.0) -> length 2
      const arr6 = new SparseArray<double>(1.0);
      const item6: Array<double> = [Number.MAX_VALUE];
      const result6 = arr6.concat(item6);
      expect(result6.length).assertEqual(2);
      // 7. concat([127,-128]) on (0x01) byte -> length 3, [1]=127, [2]=-128
      const arr7 = new SparseArray<byte>(0x01);
      const item7: Array<byte> = [127, -128];
      const result7 = arr7.concat(item7);
      expect(result7.length).assertEqual(3);
      expect(result7[1]).assertEqual(127);
      expect(result7[2]).assertEqual(-128);
      // 8. concat([c'Z']) on (c'A') char -> length 2, [0]=A, [1]=Z
      const arr8 = new SparseArray<char>(c'A');
      const item8: Array<char> = [c'Z'];
      const result8 = arr8.concat(item8);
      expect(result8.length).assertEqual(2);
      expect(result8[0]!).assertEqual(c'A');
      expect(result8[1]!).assertEqual(c'Z');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_PART01_0300
     * @tc.name sparseArrayConcatPart01Test003
     * @tc.desc concat() object reference element append - Date/RegExp/interface/nested SparseArray (4 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayConcatPart01Test003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. concat([Date(1000)]) on (Date(0)) -> length 2, [1].getTime()=1000
      const dateB: Date = new Date(1000);
      const arr1 = new SparseArray<Date>(new Date(0));
      const item1: Array<Date> = [dateB];
      const result1 = arr1.concat(item1);
      expect(result1.length).assertEqual(2);
      const appendedDate1 = result1[1];
      expect(appendedDate1 === undefined).assertFalse();
      expect(appendedDate1!.getTime()).assertEqual(1000);
      // 2. concat([/abc/]) on (/def/) RegExp -> length 2, [1].source='abc'
      const re2: RegExp = new RegExp('abc');
      const arr2 = new SparseArray<RegExp>(new RegExp('def'));
      const item2: Array<RegExp> = [re2];
      const result2 = arr2.concat(item2);
      expect(result2.length).assertEqual(2);
      const appendedPattern2 = result2[1];
      expect(appendedPattern2 === undefined).assertFalse();
      expect(appendedPattern2!.source).assertEqual('abc');
      // 3. concat([{id:42}]) on ({id:1}) interface -> length 2, [1].id=42
      const o3: SparseArrayConcatPart01Object = { id: 42 };
      const arr3 = new SparseArray<SparseArrayConcatPart01Object>({ id: 1 });
      const item3: Array<SparseArrayConcatPart01Object> = [o3];
      const result3 = arr3.concat(item3);
      expect(result3.length).assertEqual(2);
      const appendedObject3 = result3[1];
      expect(appendedObject3 === undefined).assertFalse();
      expect(appendedObject3!.id).assertEqual(42);
      // 4. concat([inner(10,20)]) on ((1)) nested SparseArray<int> -> length 2, [1].length=2, [1][0..1]=10,20
      const inner4 = new SparseArray<int>(10, 20);
      const arr4 = new SparseArray<SparseArray<int>>(new SparseArray<int>(1));
      const item4: Array<SparseArray<int>> = [inner4];
      const result4 = arr4.concat(item4);
      expect(result4.length).assertEqual(2);
      expect(result4[1]!.length).assertEqual(2);
      expect(result4[1]![0]).assertEqual(10);
      expect(result4[1]![1]).assertEqual(20);
    });
  });
}
