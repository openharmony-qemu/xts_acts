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
class Item001 {
  name: string = 'a';
  value: int = 0;
}
interface Data001 {
  id: int;
  label: string;
}
interface SparseArrayForEachPart01Obj {
  id: int;
}
export default function sparseArrayForEachPart01Test(): void {
  describe('SparseArrayForEachPart01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_PART01_0100
     * @tc.name sparseArrayForEachPart01Test001
     * @tc.desc forEach iterates all & non-mutating length/callCount (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayForEachPart01Test001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. forEach over 7, 14, 21 -> sum 42
      const arr1 = new SparseArray<int>(7, 14, 21);
      let result1: int = 0;
      arr1.forEach((value: int, index: int, array: SparseArray<int>): void => {
        result1 = result1 + value;
      });
      expect(result1).assertEqual(42);
      // 2. forEach over sparse@{0} -> 0 received
      const arr2 = new SparseArray<int>();
      arr2[0] = 0;
      let received2: int = -1;
      arr2.forEach((value: int, index: int, array: SparseArray<int>): void => {
        received2 = value;
      });
      expect(received2).assertEqual(0);
      // 3. forEach over 10, 20, 30, 40, 50 -> indices 0..4
      const arr3 = new SparseArray<int>(10, 20, 30, 40, 50);
      let indices3: int = 0;
      arr3.forEach((value: int, index: int, array: SparseArray<int>): void => {
        indices3 = indices3 + 1;
        expect(index).assertEqual(indices3 - 1);
      });
      expect(indices3).assertEqual(5);
      // 4. forEach over len=6 sparse@{0,2,5} -> indexes 0, 2, 5
      const arr4 = new SparseArray<int>(6);
      arr4[0] = 1;
      arr4[2] = 2;
      arr4[5] = 3;
      let indices4: Array<int> = [];
      arr4.forEach((value: int, index: int, array: SparseArray<int>): void => {
        indices4.push(index);
      });
      expect(indices4[0]).assertEqual(0);
      expect(indices4[1]).assertEqual(2);
      expect(indices4[2]).assertEqual(5);
      // 5. forEach over len=5 sparse@{0,4} -> 2 calls
      const arr5 = new SparseArray<int>(5);
      arr5[0] = 1;
      arr5[4] = 5;
      let callCount5: int = 0;
      arr5.forEach((value: int, index: int, array: SparseArray<int>): void => {
        callCount5++;
      });
      expect(callCount5).assertEqual(2);
      // 6. forEach over len=3 sparse@{1} -> 42
      const arr6 = new SparseArray<int>(3);
      arr6[1] = 42;
      let firstValue6: int = 0;
      let firstCalled6: boolean = false;
      arr6.forEach((value: int, index: int, array: SparseArray<int>): void => {
        if (!firstCalled6) {
          firstValue6 = value;
          firstCalled6 = true;
        }
      });
      expect(firstValue6).assertEqual(42);
      // 7. forEach over len=5 sparse@{4} -> 1 call
      const arr7 = new SparseArray<int>(5);
      arr7[4] = 999;
      let callCount7: int = 0;
      arr7.forEach((value: int, index: int, array: SparseArray<int>): void => {
        callCount7++;
      });
      expect(callCount7).assertEqual(1);
      // 8. forEach over len=1000 sparse@{0,999} -> 2 calls
      const arr8 = new SparseArray<int>(1000);
      arr8[0] = 1;
      arr8[999] = 999;
      let callCount8: int = 0;
      let firstIdx8: int = -1;
      let lastIdx8: int = -1;
      arr8.forEach((value: int, index: int, array: SparseArray<int>): void => {
        if (callCount8 === 0) {
          firstIdx8 = index;
        }
        lastIdx8 = index;
        callCount8++;
      });
      expect(callCount8).assertEqual(2);
      expect(firstIdx8).assertEqual(0);
      expect(lastIdx8).assertEqual(999);
      // 9. SparseArray.from forEach sum 42
      const source9: Array<int> = [7, 14, 21];
      const arr9 = SparseArray.from<int>(source9);
      let sum9: int = 0;
      arr9.forEach((value: int, index: int, array: SparseArray<int>): void => {
        sum9 = sum9 + value;
      });
      expect(sum9).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_PART01_0200
     * @tc.name sparseArrayForEachPart01Test002
     * @tc.desc callback args (value/index/array) & in-callback mutation (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayForEachPart01Test002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. forEach over 1, undefined, 3 -> 3 calls, second value undefined
      const arr1 = new SparseArray<int | undefined>(1, undefined, 3);
      let callCount1: int = 0;
      let secondValue1: int | undefined = 0;
      arr1.forEach((value: int | undefined, index: int, array: SparseArray<int | undefined>): void => {
        if (index === 1) {
          secondValue1 = value;
        }
        callCount1++;
      });
      expect(callCount1).assertEqual(3);
      expect(secondValue1).assertUndefined();
      // 2. forEach over null -> null received
      const arr2 = new SparseArray<SparseArrayForEachPart01Obj | null>(null);
      let received2: SparseArrayForEachPart01Obj | null = { id: 99 } as SparseArrayForEachPart01Obj;
      arr2.forEach((value: SparseArrayForEachPart01Obj | null, index: int, array: SparseArray<SparseArrayForEachPart01Obj | null>): void => {
        received2 = value;
      });
      expect(received2).assertNull();
      // 3. forEach over Data001{id=1,label='hello'} -> id 1, label 'hello'
      const data3: Data001 = { id: 1, label: 'hello' } as Data001;
      const arr3 = new SparseArray<Data001>(data3);
      let received3: Data001 = { id: 0, label: '' } as Data001;
      arr3.forEach((value: Data001, index: int, array: SparseArray<Data001>): void => {
        received3 = value;
      });
      expect(received3.id).assertEqual(1);
      expect(received3.label).assertEqual('hello');
      // 4. forEach over len=3 sparse@{1,2} -> first index 1
      const arr4 = new SparseArray<int>(3);
      arr4[1] = 20;
      arr4[2] = 30;
      let firstIndex4: int = -1;
      arr4.forEach((value: int, index: int, array: SparseArray<int>): void => {
        if (firstIndex4 === -1) {
          firstIndex4 = index;
        }
      });
      expect(firstIndex4).assertEqual(1);
      // 5. forEach over 1, 2, 3 -> array[0]=999 same ref
      const arr5 = new SparseArray<int>(1, 2, 3);
      let sameRef5: boolean = false;
      arr5.forEach((value: int, index: int, array: SparseArray<int>): void => {
        if (index === 0) {
          array[0] = 999;
        }
        if (index === 1) {
          sameRef5 = arr5[0] === 999;
        }
      });
      expect(sameRef5).assertTrue();
      // 6. forEach over 1, 2, 3 -> in-place multiplication -> 10, 20, 30
      const arr6 = new SparseArray<int>(1, 2, 3);
      arr6.forEach((value: int, index: int, array: SparseArray<int>): void => {
        array[index] = value * 10;
      });
      expect(arr6[0]).assertEqual(10);
      expect(arr6[1]).assertEqual(20);
      expect(arr6[2]).assertEqual(30);
      // 7. forEach over 1, 2, 3 -> future value 999 after mutation
      const arr7 = new SparseArray<int>(1, 2, 3);
      let futureValue7: int = 0;
      arr7.forEach((value: int, index: int, array: SparseArray<int>): void => {
        if (index === 0) {
          array[2] = 999;
        }
        if (index === 2) {
          futureValue7 = value;
        }
      });
      expect(futureValue7).assertEqual(999);
      // 8. forEach over 42, 99, -1 -> value === arr[index]
      const arr8 = new SparseArray<int>(42, 99, -1);
      let match8: boolean = true;
      arr8.forEach((value: int, index: int, array: SparseArray<int>): void => {
        const directGet8 = arr8[index];
        if (value !== directGet8) {
          match8 = false;
        }
      });
      expect(match8).assertTrue();
      // 9. forEach T=int value -> 0, -1, INT_MAX, INT_MIN
      const arr9 = new SparseArray<int>(0, -1, 2147483647 as int, (-2147483647 - 1) as int);
      let values9: Array<int> = [];
      arr9.forEach((value: int, index: int, array: SparseArray<int>): void => {
        values9.push(value);
      });
      expect(values9[0]).assertEqual(0);
      expect(values9[1]).assertEqual(-1);
      expect(values9[2]).assertEqual(2147483647);
      expect(values9[3]).assertEqual(-2147483647 - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_PART01_0300
     * @tc.name sparseArrayForEachPart01Test003
     * @tc.desc special values (Unicode/emoji/escape/NaN/Infinity/EPSILON) (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayForEachPart01Test003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. forEach value string Unicode '中文'
      const arr1 = new SparseArray<string>('中文');
      let received1: string = '';
      arr1.forEach((value: string, index: int, array: SparseArray<string>): void => {
        received1 = value;
      });
      expect(received1).assertEqual('中文');
      // 2. forEach over '\t\n' -> '\t\n'
      const arr2 = new SparseArray<string>('\t\n');
      let received2: string = '';
      arr2.forEach((value: string, index: int, array: SparseArray<string>): void => {
        received2 = value;
      });
      expect(received2).assertEqual('\t\n');
      // 3. forEach value string emoji '😀'
      const arr3 = new SparseArray<string>('😀');
      let received3: string = '';
      arr3.forEach((value: string, index: int, array: SparseArray<string>): void => {
        received3 = value;
      });
      expect(received3).assertEqual('😀');
      // 4. forEach over zero-width space (U+200B) -> same
      const arr4 = new SparseArray<string>('\u200B');
      let received4: string = '';
      arr4.forEach((value: string, index: int, array: SparseArray<string>): void => {
        received4 = value;
      });
      expect(received4).assertEqual('\u200B');
      // 5. forEach over '\0' -> '\0'
      const arr5 = new SparseArray<string>('\0');
      let received5: string = '';
      arr5.forEach((value: string, index: int, array: SparseArray<string>): void => {
        received5 = value;
      });
      expect(received5).assertEqual('\0');
      // 6. forEach over -0.0 -> 1.0/received < 0
      const arr6 = new SparseArray<double>(-0.0);
      let received6: double = 0.0;
      arr6.forEach((value: double, index: int, array: SparseArray<double>): void => {
        received6 = value;
      });
      let actualValue6 = 1.0 / received6 < 0;
      expect(actualValue6).assertTrue();
      // 7. forEach over Double.NaN -> isNaN
      const arr7 = new SparseArray<double>(Double.NaN);
      let nanReceived7: boolean = false;
      arr7.forEach((value: double, index: int, array: SparseArray<double>): void => {
        nanReceived7 = isNaN(value);
      });
      expect(nanReceived7).assertTrue();
      // 8. forEach value double Infinity
      const arr8 = new SparseArray<double>(Double.POSITIVE_INFINITY);
      let received8: double = 0.0;
      arr8.forEach((value: double, index: int, array: SparseArray<double>): void => {
        received8 = value;
      });
      let isFinite8: boolean = isFinite(received8);
      expect(isFinite8).assertFalse();
      let positive8: boolean = received8 > 0;
      expect(positive8).assertTrue();
      // 9. forEach value double -Infinity
      const arr9 = new SparseArray<double>(Double.NEGATIVE_INFINITY);
      let received9: double = 0.0;
      arr9.forEach((value: double, index: int, array: SparseArray<double>): void => {
        received9 = value;
      });
      let isFinite9: boolean = isFinite(received9);
      expect(isFinite9).assertFalse();
      let negative9: boolean = received9 < 0;
      expect(negative9).assertTrue();
      // 10. forEach value double Number.EPSILON
      const arr10 = new SparseArray<double>(Number.EPSILON);
      let received10: double = 0.0;
      arr10.forEach((value: double, index: int, array: SparseArray<double>): void => {
        received10 = value;
      });
      let actualValue10 = received10 > 0.0;
      expect(actualValue10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_PART01_0400
     * @tc.name sparseArrayForEachPart01Test004
     * @tc.desc iteration edge (MAX_VALUE/no-exec/mutation-during-iteration/early-return) (6 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayForEachPart01Test004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. forEach value double Number.MAX_VALUE
      const arr1 = new SparseArray<double>(Number.MAX_VALUE);
      let received1: double = 0.0;
      arr1.forEach((value: double, index: int, array: SparseArray<double>): void => {
        received1 = value;
      });
      expect(received1).assertEqual(Number.MAX_VALUE);
      // 2. forEach over length=3 empty -> not executed
      const arr2 = new SparseArray<string>(3);
      let executed2: boolean = false;
      arr2.forEach((value: string, index: int, array: SparseArray<string>): void => {
        executed2 = true;
      });
      expect(executed2).assertFalse();
      // 3. forEach over 1, 2 -> push during iteration -> 3 calls
      const arr3 = new SparseArray<int>(1, 2);
      let callCount3: int = 0;
      arr3.forEach((value: int, index: int, array: SparseArray<int>): void => {
        callCount3++;
        if (callCount3 === 1) {
          array.push(3);
        }
      });
      expect(callCount3).assertEqual(3);
      // 4. forEach over 1, 2, 3, 4 -> splice during iteration -> 2 calls
      const arr4 = new SparseArray<int>(1, 2, 3, 4);
      let callCount4: int = 0;
      arr4.forEach((value: int, index: int, array: SparseArray<int>): void => {
        callCount4++;
        if (index === 0) {
          array.splice(1, 2);
        }
      });
      expect(callCount4).assertEqual(2);
      // 5. forEach over 1, 2, 3, 4, 5 -> length=2 during iteration -> 2 calls
      const arr5 = new SparseArray<int>(1, 2, 3, 4, 5);
      let callCount5: int = 0;
      arr5.forEach((value: int, index: int, array: SparseArray<int>): void => {
        callCount5++;
        if (index === 1) {
          array.length = 2;
        }
      });
      expect(callCount5).assertEqual(2);
      // 6. forEach void return -> early-return doesn't stop -> 5 calls
      const arr6 = new SparseArray<int>(1, 2, 3, 4, 5);
      let callCount6: int = 0;
      arr6.forEach((value: int, index: int, array: SparseArray<int>): void => {
        callCount6++;
        return;
      });
      expect(callCount6).assertEqual(5);
    });
  });
}
