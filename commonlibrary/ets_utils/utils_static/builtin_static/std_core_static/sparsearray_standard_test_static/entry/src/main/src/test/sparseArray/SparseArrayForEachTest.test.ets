'use static'
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
import Utils from '../Util.test';

type SparseArrayIntForEachCallback = (value: int, index: int, array: SparseArray<int>) => void;

class Point007 {
    x: int = 0;
    y: int = 0;
  }

class CustomError050 extends Error {
    constructor(message: string) {
      super(message);
      this.name = "CustomError050";
    }
  }

class Point059 {
    x: int = 0;
    y: int = 0;
  }

class Counter065 {
    count: int = 0;
    increment(value: int): void {
      this.count++;
    }
  }

class Counter066 {
    count: int = 0;
    process(value: int): void {
      this.count += value;
    }
  }

export default function SparseArrayForEachTest(): void {
  describe('SparseArrayForEachTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_0100
     * @tc.name testSparseArrayForEach001
     * @tc.desc Test SparseArray.forEach, verify method result (arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.forEach((value: int, index: int, array: SparseArray<int>) => {
        });
        expect(arr.length).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_0200
     * @tc.name testSparseArrayForEach002
     * @tc.desc Test SparseArray.forEach, verify method result (typeof value equals "int", arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.forEach((value: int, index: int, array: SparseArray<int>) => {
          expect(typeof value).assertEqual("int");
        });
        expect(arr.length).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_0300
     * @tc.name testSparseArrayForEach003
     * @tc.desc Test SparseArray.forEach, verify method result (typeof value equals "string", arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        arr.forEach((value: string, index: int, array: SparseArray<string>) => {
          expect(typeof value).assertEqual("string");
        });
        expect(arr.length).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_0400
     * @tc.name testSparseArrayForEach004
     * @tc.desc Test SparseArray.forEach, verify method result (typeof value equals "boolean", arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true);
        arr.forEach((value: boolean, index: int, array: SparseArray<boolean>) => {
          expect(typeof value).assertEqual("boolean");
        });
        expect(arr.length).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_0500
     * @tc.name testSparseArrayForEach005
     * @tc.desc Test SparseArray.forEach, verify method result (typeof value equals "object", arr.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Point007>();
        arr[0] = new Point007();
        arr[1] = new Point007();
        arr.forEach((value: Point007, index: int, array: SparseArray<Point007>) => {
          expect(typeof value).assertEqual("object");
        });
        expect(arr.length).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_0600
     * @tc.name testSparseArrayForEach006
     * @tc.desc Test SparseArray.forEach, verify method result (value !== undefined is true, arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>(1, "a", 2);
        arr.forEach((value: int | string, index: int, array: SparseArray<int | string>) => {
          expect(value !== undefined).assertTrue();
        });
        expect(arr.length).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_0700
     * @tc.name testSparseArrayForEach007
     * @tc.desc Test SparseArray.for Each error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
        arr.forEach((null as Object) as SparseArrayIntForEachCallback);
        expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_0800
     * @tc.name testSparseArrayForEach008
     * @tc.desc Test SparseArray.for Each error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
        arr.forEach((undefined as Object) as SparseArrayIntForEachCallback);
        expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_0900
     * @tc.name testSparseArrayForEach009
     * @tc.desc Test SparseArray.for Each error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
        arr.forEach(("not a function" as Object) as SparseArrayIntForEachCallback);
        expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_1000
     * @tc.name testSparseArrayForEach010
     * @tc.desc Test SparseArray.forEach, verify method result (value > 0 is true, arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          expect(value > 0).assertTrue();
        });

        expect(arr.length).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_1100
     * @tc.name testSparseArrayForEach011
     * @tc.desc Test SparseArray.forEach, verify method result (value equals 2147483647 as int, arr.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1);
        arr[0] = (2147483647 as int);
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          expect(value).assertEqual(2147483647 as int);
        });
        expect(arr.length).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_1200
     * @tc.name testSparseArrayForEach012
     * @tc.desc Test SparseArray.forEach, verify method result (value equals "", arr.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("");
        arr.forEach((value: string, _index: int, _array: SparseArray<string>) => {
          expect(value).assertEqual("");
        });

        expect(arr.length).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_1300
     * @tc.name testSparseArrayForEach013
     * @tc.desc Test SparseArray.forEach, verify method result (value.length equals 10000, arr.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let longStr = "a".repeat(10000);
        const arr = new SparseArray<string>(longStr);
        arr.forEach((value: string, _index: int, _array: SparseArray<string>) => {
          expect(value.length).assertEqual(10000);
        });
        expect(arr.length).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_1400
     * @tc.name testSparseArrayForEach014
     * @tc.desc Test SparseArray.forEach, verify method result (index >= 0 is true, arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        arr.forEach((value: int, index: int, _array: SparseArray<int>) => {
          expect(index >= 0).assertTrue();
        });
        expect(arr.length).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_1500
     * @tc.name testSparseArrayForEach015
     * @tc.desc Test SparseArray.forEach, verify method result (index equals currentIndex, currentIndex equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        let currentIndex = 0;
        arr.forEach((value: int, index: int, _array: SparseArray<int>) => {
          expect(index).assertEqual(currentIndex);
          currentIndex++;
        });
        expect(currentIndex).assertEqual(4);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_1600
     * @tc.name testSparseArrayForEach016
     * @tc.desc Test SparseArray.forEach, verify method result (value equals 1, index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(100);
        arr[0] = 1;
        let invoked = false;
        arr.forEach((value: int, index: int, _array: SparseArray<int>) => {
          if (index === 0) {
            invoked = true;
            expect(value).assertEqual(1);
            expect(index).assertEqual(0);
          }
        });
        expect(invoked).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_1700
     * @tc.name testSparseArrayForEach017
     * @tc.desc Test SparseArray.forEach, verify method result (lastIndex equals arr.length - 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        let lastIndex = 0;
        arr.forEach((value: int, index: int, _array: SparseArray<int>) => {
          lastIndex = index;
        });
        expect(lastIndex).assertEqual(arr.length - 1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_1800
     * @tc.name testSparseArrayForEach018
     * @tc.desc Test SparseArray.forEach, verify method result (value equals arr[index], array equals arr)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.forEach((value: int, index: int, array: SparseArray<int>) => {
          expect(value).assertEqual(arr[index]);
          expect(array).assertEqual(arr);
        });
        expect(arr.length).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_1900
     * @tc.name testSparseArrayForEach019
     * @tc.desc Test SparseArray.forEach, verify method result (arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.forEach((_value: int, _index: int, _array: SparseArray<int>): void => {
        });
        expect(arr.length).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_2000
     * @tc.name testSparseArrayForEach020
     * @tc.desc Test SparseArray.forEach, verify method result (callCount equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[2] = 3;
        arr[4] = 5;
        let callCount = 0;
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          callCount++;
        });
        expect(callCount).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_2100
     * @tc.name testSparseArrayForEach021
     * @tc.desc Test SparseArray.forEach, verify method result (lastIndex equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[4] = 5;
        let lastIndex = -1;
        arr.forEach((value: int, index: int, _array: SparseArray<int>) => {
          lastIndex = index;
        });
        expect(lastIndex).assertEqual(4);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_2200
     * @tc.name testSparseArrayForEach022
     * @tc.desc Test SparseArray.forEach, verify method result (callCount equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[0] = 1;
        arr[9] = 9;
        let callCount = 0;
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          callCount++;
        });
        expect(callCount).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_2300
     * @tc.name testSparseArrayForEach023
     * @tc.desc Test SparseArray.forEach, verify method result (callCount equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        let callCount = 0;
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_2400
     * @tc.name testSparseArrayForEach024
     * @tc.desc Test SparseArray.forEach, verify method result (callCount equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        let callCount = 0;
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_2500
     * @tc.name testSparseArrayForEach025
     * @tc.desc Test SparseArray.forEach, verify method result (index > lastIndex is true, lastIndex equals 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[0] = 0;
        arr[5] = 5;
        arr[9] = 9;
        let lastIndex = -1;
        arr.forEach((value: int, index: int, _array: SparseArray<int>) => {
          expect(index > lastIndex).assertTrue();
          lastIndex = index;
        });

        expect(lastIndex).assertEqual(9);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_2600
     * @tc.name testSparseArrayForEach026
     * @tc.desc Test SparseArray.forEach, verify method result (previousIndex equals 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[9] = 9;
        arr[3] = 3;
        arr[6] = 6;
        let previousIndex = -1;
        arr.forEach((value: int, index: int, _array: SparseArray<int>) => {
          expect(index).assertLarger(previousIndex);
          previousIndex = index;
        });

        expect(previousIndex).assertEqual(9);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_2700
     * @tc.name testSparseArrayForEach027
     * @tc.desc Test SparseArray.forEach, verify method result (result equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
        });
        expect(result).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_2800
     * @tc.name testSparseArrayForEach028
     * @tc.desc Test SparseArray.forEach, verify method result (result equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          return;
        });
        expect(result).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_2900
     * @tc.name testSparseArrayForEach029
     * @tc.desc Test SparseArray.forEach, verify method result (arr.length equals originalLength)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const originalLength = arr.length;
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
        });
        expect(arr.length).assertEqual(originalLength);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_3000
     * @tc.name testSparseArrayForEach030
     * @tc.desc Test SparseArray.forEach, verify method result (callCount equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        let callCount = 0;
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          callCount++;
          if (value === 1) {
            return;
          }
        });
        expect(callCount).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_3100
     * @tc.name testSparseArrayForEach031
     * @tc.desc Test SparseArray.forEach, verify method result (arr[0] equals 2, arr[1] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.forEach((value: int, index: int, array: SparseArray<int>) => {
          array[index] = value * 2;
        });
        expect(arr[0]).assertEqual(2);
        expect(arr[1]).assertEqual(4);
        expect(arr[2]).assertEqual(6);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_3200
     * @tc.name testSparseArrayForEach032
     * @tc.desc Test SparseArray.for Each error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
        arr.forEach((123 as Object) as SparseArrayIntForEachCallback);
        expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_3300
     * @tc.name testSparseArrayForEach033
     * @tc.desc Test SparseArray.for Each error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          const badCb: Object = new Object();
        arr.forEach(badCb as SparseArrayIntForEachCallback);
        expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_3400
     * @tc.name testSparseArrayForEach034
     * @tc.desc Test SparseArray.for Each error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          const badCb: Object = new Array<int>();
        arr.forEach(badCb as SparseArrayIntForEachCallback);
        expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_3500
     * @tc.name testSparseArrayForEach035
     * @tc.desc Test SparseArray.forEach, verify method result (visitCount equals 2, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        let visitCount = 0;
        try {
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            visitCount++;
            if (value === 2) {
              throw new Error("test error");
            }
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
          expect(visitCount).assertEqual(2);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_3600
     * @tc.name testSparseArrayForEach036
     * @tc.desc Test SparseArray.for Each error path, verify expected exception is thrown (assertFail is triggered, error.name equals "TypeError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            throw new TypeError("type error");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("TypeError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_3700
     * @tc.name testSparseArrayForEach037
     * @tc.desc Test SparseArray.forEach, verify method result (visitCount equals 1, error instanceof CustomError050 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        let visitCount = 0;
        try {
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            visitCount++;
            throw new CustomError050("custom error");
          });
          expect().assertFail();
        } catch (error) {
          expect(error instanceof CustomError050).assertTrue();
          expect(visitCount).assertEqual(1);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_3800
     * @tc.name testSparseArrayForEach038
     * @tc.desc Test SparseArray.forEach, verify method result (visitCount equals 2, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        let visitCount = 0;
        try {
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            visitCount++;
            if (value === 2) {
              throw new Error("test");
            }
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
          expect(visitCount).assertEqual(2);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_3900
     * @tc.name testSparseArrayForEach039
     * @tc.desc forEach with push in callback; callCount depends on OH length snapshot semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        let callCount = 0;
        // Mutating length inside forEach is implementation-dependent (snapshot vs live length).
        arr.forEach((value: int, index: int, array: SparseArray<int>) => {
          callCount++;
          if (index === 0) {
            array.push(4);
          }
        });
        expect(callCount).assertLargerOrEqual(3);
        expect(arr.length).assertEqual(4);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_4000
     * @tc.name testSparseArrayForEach040
     * @tc.desc Test SparseArray.forEach, verify method result (count equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        let count = 0;
        arr.forEach((_v: int, _i: int, _a: SparseArray<int>) => {
          count++;
        });
        expect(count).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_4100
     * @tc.name testSparseArrayForEach041
     * @tc.desc Verify SparseArray forEach iterates all elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 3);
      let count = 0;
      arr.forEach((value: int, index: int, array: SparseArray<int>) => {
        expect(value).assertEqual(index + 1);
        if (index < array.length - 1) {
          const nextValue = array.$_get(index + 1);
          expect(nextValue).assertEqual(value + 1);
        }
        count++;
      });
      expect(count).assertEqual(3);
      expect(arr instanceof SparseArray).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_4200
     * @tc.name testSparseArrayForEach042
     * @tc.desc Test SparseArray.forEach, verify method result (typeof value equals "string", arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        arr.forEach((value: string, _index: int, _array: SparseArray<string>) => {
          expect(typeof value).assertEqual("string");
        });

        expect(arr.length).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_4300
     * @tc.name testSparseArrayForEach043
     * @tc.desc Test SparseArray.forEach, verify method result (typeof value equals "boolean", arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true);
        arr.forEach((value: boolean, _index: int, _array: SparseArray<boolean>) => {
          expect(typeof value).assertEqual("boolean");
        });

        expect(arr.length).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_4400
     * @tc.name testSparseArrayForEach044
     * @tc.desc Test SparseArray.forEach, verify method result (value !== undefined is true, arr.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>(1, "a", 2, "b");
        arr.forEach((value: int | string, _index: int, _array: SparseArray<int | string>) => {
          expect(value !== undefined).assertTrue();
        });

        expect(arr.length).assertEqual(4);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_4500
     * @tc.name testSparseArrayForEach045
     * @tc.desc Test SparseArray.forEach, verify method result (typeof value equals "object", arr.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Point059>();
        arr[0] = new Point059();
        arr[1] = new Point059();
        arr.forEach((value: Point059, _index: int, _array: SparseArray<Point059>) => {
          expect(typeof value).assertEqual("object");
        });

        expect(arr.length).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_4600
     * @tc.name testSparseArrayForEach046
     * @tc.desc Test SparseArray.forEach, verify method result (callCount equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach046', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr.push(1);
        let callCount = 0;
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          callCount++;
        });
        expect(callCount).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_4700
     * @tc.name testSparseArrayForEach047
     * @tc.desc Test SparseArray.forEach, verify method result (callCount equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach047', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2);
        let callCount = 0;
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          callCount++;
        });
        expect(callCount).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_4800
     * @tc.name testSparseArrayForEach048
     * @tc.desc Test SparseArray.forEach, verify method result (callCount equals 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach048', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
          for (let i = 0; i < 1000; i++) {
          arr.push(i);
        }
        let callCount = 0;
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          callCount++;
        });
        expect(callCount).assertEqual(1000);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_4900
     * @tc.name testSparseArrayForEach049
     * @tc.desc Test SparseArray.forEach, verify method result (arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach049', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
        });

        expect(arr.length).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_5000
     * @tc.name testSparseArrayForEach050
     * @tc.desc Test SparseArray.forEach, verify method result (counter.count equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach050', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const counter = new Counter065();
        const arr = new SparseArray<int>(1, 2, 3);
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          counter.increment(value);
        });
        expect(counter.count).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_5100
     * @tc.name testSparseArrayForEach051
     * @tc.desc Test SparseArray.forEach, verify method result (counter.count equals 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach051', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const counter = new Counter066();
        const arr = new SparseArray<int>(1, 2, 3);
        arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          counter.process(value);
        });
        expect(counter.count).assertEqual(6);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_5200
     * @tc.name testSparseArrayForEach052
     * @tc.desc forEach on SparseArray<byte> accumulates byte values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach052', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let sum: int = 0;
        const arr = new SparseArray<byte>(10 as byte, 20 as byte, 30 as byte);
        arr.forEach((value: byte, index: int, array: SparseArray<byte>) => {
          sum += Byte.toInt(value);
        });
        expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_5300
     * @tc.name testSparseArrayForEach053
     * @tc.desc forEach on SparseArray<short> accumulates short values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach053', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let sum: int = 0;
        const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short);
        arr.forEach((v: short) => {
          sum += Short.toInt(v);
        });
        expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FOR_EACH_5400
     * @tc.name testSparseArrayForEach054
     * @tc.desc forEach visits null element at index 0x1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayForEach054', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let sawNull = false;
        const arr = new SparseArray<string | null>("a", null, "c");
        arr.forEach((value: string | null, index: int, _a: SparseArray<string | null>): void => {
          if (index === 0x1 && value === null) {
            sawNull = true;
          }
        });
        expect(sawNull).assertTrue();
    });

  });
}