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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';

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

interface Data001 {
  id: int;
  label: string;
}

interface SparseArrayForEachPart01Obj {
  id: int;
}

class Person006 {
    name: string = ""
    age: int = 0
  }

interface Person007 {
    name: string;
    age: number;
  }

export default function SparseArrayIterationTest(): void {
  describe('SparseArrayIterationTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_0100
     * @tc.name testIterateForEachNormal001
     * @tc.desc Test SparseArray.forEach method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateForEachNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.forEach((value: int, index: int, array: SparseArray<int>) => {
          });
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.forEach((value: int, index: int, array: SparseArray<int>) => {
            expect(typeof value).assertEqual("int");
          });
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          arr.forEach((value: string, index: int, array: SparseArray<string>) => {
            expect(typeof value).assertEqual("string");
          });
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<boolean>(true, false, true);
          arr.forEach((value: boolean, index: int, array: SparseArray<boolean>) => {
            expect(typeof value).assertEqual("boolean");
          });
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<Point007>();
          arr[0] = new Point007();
          arr[1] = new Point007();
          arr.forEach((value: Point007, index: int, array: SparseArray<Point007>) => {
            expect(typeof value).assertEqual("object");
          });
          expect(arr.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int | string>(1, "a", 2);
          arr.forEach((value: int | string, index: int, array: SparseArray<int | string>) => {
            expect(value !== undefined).assertTrue();
          });
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(10, 20, 30);
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            expect(value > 0).assertTrue();
          });

          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1);
          arr[0] = (2147483647 as int);
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            expect(value).assertEqual(2147483647 as int);
          });
          expect(arr.length).assertEqual(1);


      }
      {
          const arr = new SparseArray<string>("");
          arr.forEach((value: string, _index: int, _array: SparseArray<string>) => {
            expect(value).assertEqual("");
          });

          expect(arr.length).assertEqual(1);


      }
      {
          let longStr = "a".repeat(10000);
          const arr = new SparseArray<string>(longStr);
          arr.forEach((value: string, _index: int, _array: SparseArray<string>) => {
            expect(value.length).assertEqual(10000);
          });
          expect(arr.length).assertEqual(1);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_0200
     * @tc.name testIterateForEachNormal002
     * @tc.desc Test SparseArray.forEach method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateForEachNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(10, 20, 30);
          arr.forEach((value: int, index: int, _array: SparseArray<int>) => {
            expect(index >= 0).assertTrue();
          });
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3, 4);
          let currentIndex = 0;
          arr.forEach((value: int, index: int, _array: SparseArray<int>) => {
            expect(index).assertEqual(currentIndex);
            currentIndex++;
          });
          expect(currentIndex).assertEqual(4);


      }
      {
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


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          let lastIndex = 0;
          arr.forEach((value: int, index: int, _array: SparseArray<int>) => {
            lastIndex = index;
          });
          expect(lastIndex).assertEqual(arr.length - 1);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.forEach((value: int, index: int, array: SparseArray<int>) => {
            expect(value).assertEqual(arr[index]);
            expect(array).assertEqual(arr);
          });
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.forEach((_value: int, _index: int, _array: SparseArray<int>): void => {
          });
          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[2] = 3;
          arr[4] = 5;
          let callCount = 0;
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            callCount++;
          });
          expect(callCount).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 1;
          arr[4] = 5;
          let lastIndex = -1;
          arr.forEach((value: int, index: int, _array: SparseArray<int>) => {
            lastIndex = index;
          });
          expect(lastIndex).assertEqual(4);


      }
      {
          const arr = new SparseArray<int>(10);
          arr[0] = 1;
          arr[9] = 9;
          let callCount = 0;
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            callCount++;
          });
          expect(callCount).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>();
          let callCount = 0;
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            callCount++;
          });
          expect(callCount).assertEqual(0);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_0300
     * @tc.name testIterateForEachNormal003
     * @tc.desc Test SparseArray.forEach method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateForEachNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(5);
          let callCount = 0;
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            callCount++;
          });
          expect(callCount).assertEqual(0);


      }
      {
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


      }
      {
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


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          });
          expect(result).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            return;
          });
          expect(result).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const originalLength = arr.length;
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          });
          expect(arr.length).assertEqual(originalLength);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          let callCount = 0;
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            callCount++;
            if (value === 1) {
              return;
            }
          });
          expect(callCount).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.forEach((value: int, index: int, array: SparseArray<int>) => {
            array[index] = value * 2;
          });
          expect(arr[0]).assertEqual(2);
          expect(arr[1]).assertEqual(4);
          expect(arr[2]).assertEqual(6);


      }
      {
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

      }
      {
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

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_0400
     * @tc.name testIterateForEachNormal004
     * @tc.desc Test SparseArray.forEach method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateForEachNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
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


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          let count = 0;
          arr.forEach((_v: int, _i: int, _a: SparseArray<int>) => {
            count++;
          });
          expect(count).assertEqual(3);


      }
      {
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


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          arr.forEach((value: string, _index: int, _array: SparseArray<string>) => {
            expect(typeof value).assertEqual("string");
          });

          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<boolean>(true, false, true);
          arr.forEach((value: boolean, _index: int, _array: SparseArray<boolean>) => {
            expect(typeof value).assertEqual("boolean");
          });

          expect(arr.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int | string>(1, "a", 2, "b");
          arr.forEach((value: int | string, _index: int, _array: SparseArray<int | string>) => {
            expect(value !== undefined).assertTrue();
          });

          expect(arr.length).assertEqual(4);


      }
      {
          const arr = new SparseArray<Point059>();
          arr[0] = new Point059();
          arr[1] = new Point059();
          arr.forEach((value: Point059, _index: int, _array: SparseArray<Point059>) => {
            expect(typeof value).assertEqual("object");
          });

          expect(arr.length).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>();
          arr.push(1);
          let callCount = 0;
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            callCount++;
          });
          expect(callCount).assertEqual(1);


      }
      {
          const arr = new SparseArray<int>(1, 2);
          let callCount = 0;
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            callCount++;
          });
          expect(callCount).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 1000; i++) {
            arr.push(i);
          }
          let callCount = 0;
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            callCount++;
          });
          expect(callCount).assertEqual(1000);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_0500
     * @tc.name testIterateForEachNormal005
     * @tc.desc Test SparseArray.forEach method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateForEachNormal005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
          });

          expect(arr.length).assertEqual(3);


      }
      {
          const counter = new Counter065();
          const arr = new SparseArray<int>(1, 2, 3);
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            counter.increment(value);
          });
          expect(counter.count).assertEqual(3);


      }
      {
          const counter = new Counter066();
          const arr = new SparseArray<int>(1, 2, 3);
          arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
            counter.process(value);
          });
          expect(counter.count).assertEqual(6);


      }
      {
          let sum: int = 0;
          const arr = new SparseArray<byte>(10 as byte, 20 as byte, 30 as byte);
          arr.forEach((value: byte, index: int, array: SparseArray<byte>) => {
            sum += Byte.toInt(value);
          });
          expect(sum).assertEqual(60);

      }
      {
          let sum: int = 0;
          const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short);
          arr.forEach((v: short) => {
            sum += Short.toInt(v);
          });
          expect(sum).assertEqual(60);

      }
      {
          let sawNull = false;
          const arr = new SparseArray<string | null>("a", null, "c");
          arr.forEach((value: string | null, index: int, _a: SparseArray<string | null>): void => {
            if (index === 0x1 && value === null) {
              sawNull = true;
            }
          });
          expect(sawNull).assertTrue();

      }
      {
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

      }
      {
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

      }
      {
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

      }
      {
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
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_0600
     * @tc.name testIterateForEachError001
     * @tc.desc Test SparseArray.forEach method, verify error-path exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateForEachError001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.forEach((null as Object) as SparseArrayIntForEachCallback);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.forEach((undefined as Object) as SparseArrayIntForEachCallback);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.forEach(("not a function" as Object) as SparseArrayIntForEachCallback);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.forEach((123 as Object) as SparseArrayIntForEachCallback);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            const badCb: Object = new Object();
            arr.forEach(badCb as SparseArrayIntForEachCallback);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            const badCb: Object = new Array<int>();
            arr.forEach(badCb as SparseArrayIntForEachCallback);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("ClassCastError");
          }

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          try {
            arr.forEach((value: int, _index: int, _array: SparseArray<int>) => {
              throw new TypeError("type error");
            });
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual("TypeError");
          }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_0700
     * @tc.name testIterateEntriesNormal001
     * @tc.desc Test SparseArray.entries method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateEntriesNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>("a", "b");
          const strIterator = arr.entries();
          expect(strIterator !== null && strIterator !== undefined).assertTrue();

          const empty = new SparseArray<int>();
          const intIterator = empty.entries();
          expect(intIterator !== undefined && intIterator !== null).assertTrue();

      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const iterator = arr.entries();
          let result = iterator.next();
          let pair = result.value as [int, int];
          expect(result.done).assertEqual(false);
          expect(pair[0]).assertEqual(0);
          expect(pair[1]).assertEqual(1);
          result = iterator.next();
          pair = result.value as [int, int];
          expect(result.done).assertEqual(false);
          expect(pair[0]).assertEqual(1);
          expect(pair[1]).assertEqual(2);
          result = iterator.next();
          pair = result.value as [int, int];
          expect(result.done).assertEqual(false);
          expect(pair[0]).assertEqual(2);
          expect(pair[1]).assertEqual(3);
          result = iterator.next();
          expect(result.done).assertEqual(true);


      }
      {
          const arr = new SparseArray<string>("a", "b");
          const iterator = arr.entries();
          const result = iterator.next();
          const pair = result.value as [int, string];
          expect(result!.done).assertEqual(false);
          expect(pair[0]).assertEqual(0);
          expect(pair[1]).assertEqual("a");


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 10;
          arr[2] = 30;
          arr[4] = 50;
          const iterator = arr.entries();
          let pairs: Array<[int, int]> = [];
          let result = iterator.next();
          while (!result.done) {
            const pv = result.value as [int, int];
            pairs.push(pv);
            result = iterator.next();
          }
          expect(pairs.length).assertEqual(3);
          expect(pairs[0][0]).assertEqual(0);
          expect(pairs[0][1]).assertEqual(10);
          expect(pairs[1][0]).assertEqual(2);
          expect(pairs[1][1]).assertEqual(30);
          expect(pairs[2][0]).assertEqual(4);
          expect(pairs[2][1]).assertEqual(50);


      }
      {
          const arr = new SparseArray<int>();
          const iterator = arr.entries();
          const result = iterator.next();
          expect(result!.done).assertEqual(true);


      }
      {
        const arr = new SparseArray<Person006>();
          const p1 = new Person006();
          p1.name = "Alice";
          p1.age = 25;
          arr.push(p1);
          const iterator = arr.entries();
          const result = iterator.next();
          const tup = result.value as [int, Person006];
          expect(tup[1].name).assertEqual("Alice");
          expect(tup[1].age).assertEqual(25);


      }
      {
          const arr = new SparseArray<int>(42);
          const iterator = arr.entries();
          const result1 = iterator.next();
          const result2 = iterator.next();
          expect(result1!.done).assertEqual(true);
          expect(result2!.done).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 1000; i++) {
            arr.push(i);
          }
          const iterator = arr.entries();
          let count = 0;
          let result = iterator.next();
          while (!result.done) {
            count++;
            result = iterator.next();
          }
          expect(count).assertEqual(1000);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const iterator = arr.entries();
          const result1 = iterator.next();
          const result2 = iterator.next();
          const e1 = result1.value as [int, int];
          const e2 = result2.value as [int, int];
          expect(e1[0]).assertEqual(0);
          expect(e1[1]).assertEqual(1);
          expect(e2[0]).assertEqual(1);
          expect(e2[1]).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const iterator1 = arr.entries();
          const iterator2 = arr.entries();
          const result1 = iterator1.next();
          const result2 = iterator2.next();
          const a1 = result1.value as [int, int];
          const a2 = result2.value as [int, int];
          const result3 = iterator1.next();
          const a3 = result3.value as [int, int];
          expect(a1[0]).assertEqual(0);
          expect(a1[1]).assertEqual(1);
          expect(a2[0]).assertEqual(0);
          expect(a2[1]).assertEqual(1);
          expect(a3[0]).assertEqual(1);
          expect(a3[1]).assertEqual(2);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_0800
     * @tc.name testIterateEntriesNormal002
     * @tc.desc Test SparseArray.entries method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateEntriesNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const map = new Map<string, int>();
          map.set("id", 42);
          const arr = new SparseArray<Map<string, int>>(map);
          const iterator = arr.entries();
          const result = iterator.next();
          const ent = result.value as [int, Map<string, int>];
          expect(ent[1].get("id")).assertEqual(42);

      }
      {
          const arr = new SparseArray<long>(100 as long, 200 as long);
          const iterator = arr.entries();
          const first = iterator.next().value as [int, long];
          expect(first[0]).assertEqual(0);
          expect(first[1]).assertEqual(100 as long);

      }
      {
          const arr = new SparseArray<int | null>(0, 0, null);
          const it = arr.entries();
          let pair = it.next().value as [int, int | null];
          pair = it.next().value as [int, int | null];
          pair = it.next().value as [int, int | null];
          expect(pair[0]).assertEqual(0x2);
          expect(pair[1]).assertEqual(null);

      }
      {
          const arr = new SparseArray<boolean>(false, true);
          const iterator = arr.entries();
          const first = iterator.next().value as [int, boolean];
          const second = iterator.next().value as [int, boolean];
          expect(first[0]).assertEqual(0);
          expect(first[1]).assertFalse();
          expect(second[0]).assertEqual(1);
          expect(second[1]).assertTrue();

      }
      {
          const arr = new SparseArray<char>(c'A', c'B');
          const iterator = arr.entries();
          const first = iterator.next().value as [int, char];
          expect(first[0]).assertEqual(0);
          expect(first[1]).assertEqual(c'A');

      }
      {
          const arr = new SparseArray<string>(6);
          arr[5] = "tail";
          const iterator = arr.entries();
          const first = iterator.next().value as [int, string];
          const done = iterator.next();
          expect(first[0]).assertEqual(5);
          expect(first[1]).assertEqual("tail");
          expect(done.done).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_0900
     * @tc.name testIterateKeysNormal001
     * @tc.desc Test SparseArray.keys method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateKeysNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>();
          const iterator = arr.keys();
          const result = iterator.next();
          expect(result!.done).assertEqual(true);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const iterator = arr.keys();
          let result = iterator.next();
          let keys: Array<int> = [];
          while (!result.done) {
            const vk = result.value
            if (vk !== undefined) {
              keys.push(vk)
            }
            result = iterator.next();
          }
          expect(keys.length).assertEqual(3);
          expect(keys[0]).assertEqual(0);
          expect(keys[1]).assertEqual(1);
          expect(keys[2]).assertEqual(2);


      }
      {
          const arr = new SparseArray<string>(3);
          arr[0] = "a";
          arr[2] = "c";
          const iterator = arr.keys();
          let result = iterator.next();
          let keys: Array<int> = [];
          while (!result.done) {
            const vk = result.value
            if (vk !== undefined) {
              keys.push(vk)
            }
            result = iterator.next();
          }
          expect(keys.length).assertEqual(2);
          expect(keys[0]).assertEqual(0);
          expect(keys[1]).assertEqual(2);


      }
      {
          const arr = new SparseArray<string>(2);
          arr[1] = "b";
          const iterator = arr.keys();
          const result = iterator.next();
          expect(result!.value).assertEqual(1);


      }
      {
          const arr = new SparseArray<string>("a");
          const iterator = arr.keys();
          let result = iterator.next();
          // keys() yields int indices; avoid Number.isInteger(... as number) — ClassCastError Int→Double on OHOS
          expect(result!.value).assertEqual(0);
          const v = result.value;
          expect(v !== undefined && v === 0).assertTrue();


      }
      {
          const arr = new SparseArray<string>("a");
          const iterator = arr.keys();
          const result = iterator.next();
          expect(result.hasOwnProperty("done")).assertEqual(true);
          expect(result.hasOwnProperty("value")).assertEqual(true);


      }
      {
          const arr = new SparseArray<string>("a");
          const iterator = arr.keys();
          expect(typeof iterator.next).assertEqual("function");


      }
      {
          const arr = new SparseArray<string>("single");
          const iterator = arr.keys();
          let result = iterator.next();
          expect(result!.done).assertEqual(false);
          expect(result!.value).assertEqual(0);
          result = iterator.next();
          expect(result!.done).assertEqual(true);


      }
      {
          const arr = new SparseArray<string>(1000);
          arr[999] = "last";
          const iterator = arr.keys();
          let result = iterator.next();
          expect(result!.value).assertEqual(999);


      }
      {
          const arr = new SparseArray<string>(5);
          arr[3] = "d";
          arr[1] = "b";
          arr[4] = "e";
          const iterator = arr.keys();
          let result = iterator.next();
          expect(result!.value).assertEqual(1);
          result = iterator.next();
          expect(result!.value).assertEqual(3);
          result = iterator.next();
          expect(result!.value).assertEqual(4);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_1000
     * @tc.name testIterateKeysNormal002
     * @tc.desc Test SparseArray.keys method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateKeysNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>("a", "b");
          const iterator1 = arr.keys();
          const iterator2 = arr.keys();
          const result1 = iterator1.next();
          const result2 = iterator2.next();
          expect(iterator1 !== iterator2).assertEqual(true);


      }
      {
          const arr = new SparseArray<string>("a", "b");
          const iterator1 = arr.keys();
          iterator1.next();
          const iterator2 = arr.keys();
          const result = iterator1.next();
          expect(result!.value).assertEqual(1);


      }
      {
          const arr = new SparseArray<string>("a");
          const iterator1 = arr.keys();
          arr[1] = "b";
          const iterator2 = arr.keys();
          let result1 = iterator1.next();
          let result2 = iterator2.next();
          expect(result1.value).assertEqual(0);
          result1 = iterator1.next();
          expect(result1.done).assertEqual(false);
          expect(result1.value).assertEqual(1);
          result1 = iterator1.next();
          expect(result1.done).assertEqual(true);
          // iterator2: first next() at start was key 0; second next() is key 1
          result2 = iterator2.next();
          expect(result2.value).assertEqual(1);
          result2 = iterator2.next();
          expect(result2.done).assertEqual(true);


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const iterator = arr.keys();
          iterator.next();
          arr[1] = "bb";
          const result = iterator.next();
          expect(result!.value).assertEqual(1);


      }
      {
          const arr = new SparseArray<long>(100 as long, 200 as long);
          const iterator = arr.keys();
          expect(iterator.next().value).assertEqual(0);
          expect(iterator.next().value).assertEqual(1);
          expect(iterator.next().done).assertTrue();

      }
      {
          const arr = new SparseArray<int | null>(0, 0, 0, null);
          const keys: Array<int> = [];
          const it = arr.keys();
          let step = it.next();
          while (!step.done) {
            keys.push(step.value as int);
            step = it.next();
          }
          expect(keys.length).assertEqual(4);
          expect(keys[0x3]).assertEqual(0x3);

      }
      {
          const arr = new SparseArray<boolean>(false, true);
          const iterator = arr.keys();
          expect(iterator.next().value).assertEqual(0);
          expect(iterator.next().value).assertEqual(1);
          expect(iterator.next().done).assertTrue();

      }
      {
          const arr = new SparseArray<char>(3);
          arr[1] = c'B';
          const iterator = arr.keys();
          expect(iterator.next().value).assertEqual(1);
          expect(iterator.next().done).assertTrue();

      }
      {
          const arr = new SparseArray<int>();
          arr[0x10] = 16;
          const iterator = arr.keys();
          expect(iterator.next().value).assertEqual(0x10);
          expect(iterator.next().done).assertTrue();

      }
      {
        // 1. keys() on of(42) -> [0] then done
        const arr1 = SparseArray.of<int>(42);
        const iter1 = arr1.keys();
        expect(iter1.next().value).assertEqual(0);
        expect(iter1.next().done).assertTrue();
        // 2. keys() on (1,2,3) -> [0,1,2] then done
        const arr2 = new SparseArray<int>(1, 2, 3);
        const iter2 = arr2.keys();
        expect(iter2.next().value).assertEqual(0);
        expect(iter2.next().value).assertEqual(1);
        expect(iter2.next().value).assertEqual(2);
        expect(iter2.next().done).assertTrue();
        // 3. keys() after length=3 on (1,2,3,4,5) -> [0,1,2] then done
        const arr3 = new SparseArray<int>(1, 2, 3, 4, 5);
        arr3.length = 3;
        const iter3 = arr3.keys();
        expect(iter3.next().value).assertEqual(0);
        expect(iter3.next().value).assertEqual(1);
        expect(iter3.next().value).assertEqual(2);
        expect(iter3.next().done).assertTrue();
        // 4. keys() after length=10 on (1,2) -> [0,1] then done
        const arr4 = new SparseArray<int>(1, 2);
        arr4.length = 10;
        const iter4 = arr4.keys();
        expect(iter4.next().value).assertEqual(0);
        expect(iter4.next().value).assertEqual(1);
        expect(iter4.next().done).assertTrue();
        // 5. keys() on overwrite arr[0]=1,2,3 -> [0] then done
        const arr5 = new SparseArray<int>();
        arr5[0] = 1;
        arr5[0] = 2;
        arr5[0] = 3;
        const iter5 = arr5.keys();
        expect(iter5.next().value).assertEqual(0);
        expect(iter5.next().done).assertTrue();
        // 6. keys() after push(30) on (10,20) -> [0,1,2] then done
        const arr6 = new SparseArray<int>(10, 20);
        arr6.push(30);
        const iter6 = arr6.keys();
        expect(iter6.next().value).assertEqual(0);
        expect(iter6.next().value).assertEqual(1);
        expect(iter6.next().value).assertEqual(2);
        expect(iter6.next().done).assertTrue();
        // 7. keys() after pop() on (10,20,30) -> [0,1] then done
        const arr7 = new SparseArray<int>(10, 20, 30);
        arr7.pop();
        const iter7 = arr7.keys();
        expect(iter7.next().value).assertEqual(0);
        expect(iter7.next().value).assertEqual(1);
        expect(iter7.next().done).assertTrue();
        // 8. keys() after splice(1,1) on (10,20,30) -> [0,1] then done
        const arr8 = new SparseArray<int>(10, 20, 30);
        arr8.splice(1, 1);
        const iter8 = arr8.keys();
        expect(iter8.next().value).assertEqual(0);
        expect(iter8.next().value).assertEqual(1);
        expect(iter8.next().done).assertTrue();
        // 9. for-of over keys() on (10,20,30) -> 3 keys
        const arr9 = new SparseArray<int>(10, 20, 30);
        const iter9 = arr9.keys();
        let count9 = 0;
        for (let k of iter9) {
          count9++;
        }
        expect(count9).assertEqual(3);
        // 10. keys() on len=100 fully filled -> [0..99] then done
        const arr10 = new SparseArray<int>(100);
        for (let i = 0; i < 100; i++) {
          arr10[i] = i;
        }
        const iter10 = arr10.keys();
        for (let i = 0; i < 100; i++) {
          let expected10: number = i;
          expect(iter10.next().value).assertEqual(expected10);
        }
        expect(iter10.next().done).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_1100
     * @tc.name testIterateKeysNormal003
     * @tc.desc Test SparseArray.keys method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateKeysNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        // 1. keys() on len=10 sparse@{2,5} -> [2,5] then done
        const arr1 = new SparseArray<int>(10);
        arr1[2] = 42;
        arr1[5] = 99;
        const iter1 = arr1.keys();
        expect(iter1.next().value).assertEqual(2);
        expect(iter1.next().value).assertEqual(5);
        expect(iter1.next().done).assertTrue();
        // 2. keys() on len=10 sparse@{9} -> [9] then done
        const arr2 = new SparseArray<int>(10);
        arr2[9] = 42;
        const iter2 = arr2.keys();
        expect(iter2.next().value).assertEqual(9);
        expect(iter2.next().done).assertTrue();
        // 3. keys() on len=10 sparse@{2,5,7} -> [2,5,7] then done
        const arr3 = new SparseArray<int>(10);
        arr3[7] = 1;
        arr3[2] = 2;
        arr3[5] = 3;
        const iter3 = arr3.keys();
        expect(iter3.next().value).assertEqual(2);
        expect(iter3.next().value).assertEqual(5);
        expect(iter3.next().value).assertEqual(7);
        expect(iter3.next().done).assertTrue();
        // 4. keys() on (1,1)+arr[100]=42 -> [0,1,100] then done
        const arr4 = new SparseArray<int>(1, 1);
        arr4[100] = 42;
        const iter4 = arr4.keys();
        expect(iter4.next().value).assertEqual(0);
        expect(iter4.next().value).assertEqual(1);
        expect(iter4.next().value).assertEqual(100);
        expect(iter4.next().done).assertTrue();
        // 5. keys() on empty -> done true, value undefined
        const arr5 = new SparseArray<int>();
        const iter5 = arr5.keys();
        let r5 = iter5.next();
        expect(r5.done).assertTrue();
        expect(r5.value).assertUndefined();
        // 6. exhaust it1 then fresh it2 on (10,20,30) -> [0] not done
        const arr6 = new SparseArray<int>(10, 20, 30);
        const it6a = arr6.keys();
        while (!it6a.next().done) {}
        const it6b = arr6.keys();
        let r6 = it6b.next();
        expect(r6.value).assertEqual(0);
        expect(r6.done).assertFalse();
        // 7. parallel it1+1 / it2+2 on (10,20,30) -> [1] and [2]
        const arr7 = new SparseArray<int>(10, 20, 30);
        const it7a = arr7.keys();
        const it7b = arr7.keys();
        it7a.next();
        it7b.next();
        it7b.next();
        expect(it7a.next().value).assertEqual(1);
        expect(it7b.next().value).assertEqual(2);
        // 8. it1 before & it2 after arr[2]=3 on (1,2) -> both [0]
        const arr8 = new SparseArray<int>(1, 2);
        const it8a = arr8.keys();
        arr8[2] = 3;
        const it8b = arr8.keys();
        expect(it8a.next().value).assertEqual(0);
        expect(it8b.next().value).assertEqual(0);
        // 9. two keys() calls on (1,2) -> distinct iterators
        const arr9 = new SparseArray<int>(1, 2);
        const it9a = arr9.keys();
        const it9b = arr9.keys();
        expect(it9a === it9b).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_1200
     * @tc.name testIterateValuesNormal001
     * @tc.desc Test SparseArray.values method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateValuesNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>();
          const iterator = arr.values();
          const result = iterator.next();
          expect(result!.done).assertEqual(true);
          expect(result!.value).assertEqual(undefined);


      }
      {
          const arr = new SparseArray<string>("x", "y", "z");
          const iterator = arr.values();
          let result = iterator.next();
          expect(result!.value).assertEqual("x");
          result = iterator.next();
          expect(result!.value).assertEqual("y");
          result = iterator.next();
          expect(result!.value).assertEqual("z");
          result = iterator.next();
          expect(result!.done).assertEqual(true);


      }
      {
          const arr = new SparseArray<string>(3);
          arr[0] = "a";
          arr[2] = "c";
          const iterator = arr.values();
          let result = iterator.next();
          expect(result!.value).assertEqual("a");
          result = iterator.next();
          expect(result!.value).assertEqual("c");
          result = iterator.next();
          expect(result!.done).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(1, 2);
          const iterator = arr.values();
          expect(typeof iterator.next).assertEqual("function");


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 1000; i++) {
            arr[i] = i;
          }
          const iterator = arr.values();
          let count = 0;
          let result = iterator.next();
          while (!result.done) {
            count++;
            result = iterator.next();
          }
          expect(count).assertEqual(1000);


      }
      {
          const arr = new SparseArray<int>(10000);
          const iterator = arr.values();
          const result = iterator.next();
          expect(result!.done).assertEqual(true);


      }
      {
          const arr = new SparseArray<int | undefined>();
          arr[0] = 10;
          arr[1] = undefined;
          const iterator = arr.values();
          let result = iterator.next();
          expect(result!.value).assertEqual(10);
          expect(result!.done).assertEqual(false);
          result = iterator.next();
          expect(result!.done).assertEqual(true);


      }
      {
          const arr = new SparseArray<string | null>(null, "a");
          const iterator = arr.values();
          let result = iterator.next();
          expect(result!.value).assertEqual(null);
          result = iterator.next();
          expect(result!.value).assertEqual("a");


      }
      {
          const arr = new SparseArray<string>("a", "b");
          const iter1 = arr.values();
          const iter2 = arr.values();
          const result1 = iter1.next();
          const result2 = iter2.next();
          expect(result1.value).assertEqual("a");
          expect(result2.value).assertEqual("a");
          iter1.next();
          const result3 = iter2.next();
          expect(result3.value).assertEqual("b");


      }
      {
          const arr = new SparseArray<int>(1);
          const iterator = arr.values();
          const result = iterator.next();
          expect(result.hasOwnProperty("value")).assertTrue();
          expect(result.hasOwnProperty("done")).assertTrue();


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_1300
     * @tc.name testIterateValuesNormal002
     * @tc.desc Test SparseArray.values method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateValuesNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const values: int[] = [];
          const iter = arr.values();
          let step = iter.next();
          while (!step.done) {
            values.push(step.value as int);
            step = iter.next();
          }
          expect(values.length).assertEqual(3);
          expect(values[0]).assertEqual(1);
          expect(values[1]).assertEqual(2);
          expect(values[2]).assertEqual(3);


      }
      {
          const arr = new SparseArray<string>("a", "b");
          const iterator = arr.values();
          let result = iterator.next();
          expect(typeof result.value).assertEqual("string");


      }
      {
          const inner = new SparseArray<int>(1, 2);
          const outer = new SparseArray<SparseArray<int>>(inner);
          const iterator = outer.values();
          const result = iterator.next();
          expect(result!.value instanceof SparseArray).assertTrue();


      }
      {
          const arr = new SparseArray<int>(1, 2);
          const iterator = arr.values();
          iterator.next();
          arr.push(3);
          let result = iterator.next();
          expect(result!.value).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const iterator = arr.values();
          arr[0] = 10;
          let result = iterator.next();
          expect(result!.value).assertEqual(10);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const iterator = arr.values();
          iterator.next();
          arr.length = 1;
          let result = iterator.next();
          expect(result!.done).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>();
          arr.push(1);
          const iterator = arr.values();
          iterator.next();
          arr.push(2);
          let result = iterator.next();
          expect(result!.done).assertEqual(false);
          expect(result!.value).assertEqual(2);


      }
      {
          const arr = new SparseArray<int>();
          arr[100] = 1;
          const iterator = arr.values();
          let result = iterator.next();
          expect(result!.value).assertEqual(1);
          result = iterator.next();
          expect(result!.done).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 10000; i++) {
            arr[i] = i;
          }
          const iterator = arr.values();
          let count = 0;
          const startTime = Date.now();
          let result = iterator.next();
          while (!result.done) {
            count++;
            result = iterator.next();
          }
          const endTime = Date.now();
          expect(count).assertEqual(10000);
          expect(endTime - startTime).assertLess(1500);


      }
      {
          const arr = new SparseArray<int>(10000);
          arr[0] = 1;
          arr[9999] = 2;
          const iterator = arr.values();
          let count = 0;
          let result = iterator.next();
          while (!result.done) {
            count++;
            result = iterator.next();
          }
          expect(count).assertEqual(2);


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_1400
     * @tc.name testIterateValuesNormal003
     * @tc.desc Test SparseArray.values method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateValuesNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(10, 20);
          const valIter = arr.values();
          const keyIter = arr.keys();
          expect(valIter.next().value).assertEqual(10);
          expect(keyIter.next().value).assertEqual(0);


      }
      {
          const arr = new SparseArray<int>(10);
          const valIter = arr.values();
          const entIter = arr.entries();
          const v0 = valIter.next();
          expect(v0.done).assertTrue();
          const entStep = entIter.next();
          expect(entStep.done).assertTrue();


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const valuesFromMethod: int[] = [];
          const iterMethod = arr.values();
          let stepM = iterMethod.next();
          while (!stepM.done) {
            const v = stepM.value;
            if (v !== undefined) {
              valuesFromMethod.push(v as int);
            }
            stepM = iterMethod.next();
          }
          const valuesFromDefault: int[] = [];
          arr.forEach((value: int) => {
            valuesFromDefault.push(value);
          });
          expect(valuesFromMethod.length).assertEqual(valuesFromDefault.length);
          for (let i = 0; i < valuesFromMethod.length; i++) {
            expect(valuesFromMethod[i]).assertEqual(valuesFromDefault[i]);
          }

      }
      {
          const arr = new SparseArray<string>("single");
          const iterator = arr.values();
          let result = iterator.next();
          expect(result!.value).assertEqual("single");
          expect(result!.done).assertEqual(false);
          result = iterator.next();
          expect(result!.value).assertEqual(undefined);
          expect(result!.done).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(10);
          arr[0] = 1;
          arr[9] = 10;
          const iterator = arr.values();
          let result = iterator.next();
          expect(result!.value).assertEqual(1);
          result = iterator.next();
          expect(result!.value).assertEqual(10);
          result = iterator.next();
          expect(result!.done).assertEqual(true);


      }
      {
          const arr = new SparseArray<int>(5);
          arr[2] = 5;
          const iterator = arr.values();
          const result = iterator.next();
          expect(result!.value).assertEqual(5);
          expect(result!.done).assertEqual(false);


      }
      {
          const arr = new SparseArray<int | undefined>();
          arr[0] = 1;
          arr[2] = undefined;
          const iterator = arr.values();
          let count = 0;
          let result = iterator.next();
          while (!result.done) {
            if (count === 0) {
              expect(result!.value).assertEqual(1);
            }
            count++;
            result = iterator.next();
          }
          expect(count).assertEqual(1);


      }
      {
          const arr = new SparseArray<char>(c'A', c'B');
          const iterator = arr.values();
          const first = iterator.next();
          expect(first!.value).assertEqual(c'A');
          const second = iterator.next();
          expect(second!.value).assertEqual(c'B');

      }
      {
          const arr = new SparseArray<short>(100 as short, 200 as short);
          const iterator = arr.values();
          expect(iterator.next()!.value).assertEqual(100 as short);
          expect(iterator.next()!.value).assertEqual(200 as short);

      }
      {
          const arr = new SparseArray<string | null>("x", null);
          const it = arr.values();
          expect(it.next().value).assertEqual("x");
          expect(it.next().value).assertEqual(null);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_1500
     * @tc.name testIterateValuesNormal004
     * @tc.desc Test SparseArray.values method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateValuesNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>(0o5, 0b11);
          const it = arr.values();
          expect(it.next().value).assertEqual(0o5);
          expect(it.next().value).assertEqual(0b11);

      }
      {
          const arr = new SparseArray<boolean>(true, false);
          const it = arr.values();
          expect(it.next().value).assertTrue();
          expect(it.next().value).assertFalse();

      }
      {
          const arr = new SparseArray<byte>((-128 as byte), 127 as byte);
          const it = arr.values();
          expect(it.next().value).assertEqual(-128 as byte);
          expect(it.next().value).assertEqual(127 as byte);

      }
      {
          const arr = new SparseArray<long>(1 as long, 10000000000 as long);
          const it = arr.values();
          expect(it.next().value).assertEqual(1 as long);
          expect(it.next().value).assertEqual(10000000000 as long);

      }
      {
          const arr = new SparseArray<float>(1.0f, 2.5f);
          const it = arr.values();
          expect(it.next().value).assertEqual(1.0f);
          expect(it.next().value).assertEqual(2.5f);

      }
      {
          const arr = new SparseArray<double>(1.25, 2.5);
          const it = arr.values();
          expect(it.next().value).assertEqual(1.25);
          expect(it.next().value).assertEqual(2.5);

      }
      {
        // 1. first next on (10,20) yields done=false and value=10
        const arr1 = new SparseArray<int>(10, 20);
        const iter1 = arr1.values();
        const r1 = iter1.next();
        expect(r1.done).assertFalse();
        expect(r1.value!).assertEqual(10);
        // 2. 'a','b','c' yields all three then done=true
        const arr2 = new SparseArray<string>('a', 'b', 'c');
        const iter2 = arr2.values();
        expect(iter2.next().value!).assertEqual('a');
        expect(iter2.next().value!).assertEqual('b');
        expect(iter2.next().value!).assertEqual('c');
        expect(iter2.next().done).assertTrue();
        // 3. count exactly 3 iterations on (10,20,30) until done=true
        const arr3 = new SparseArray<int>(10, 20, 30);
        const iter3 = arr3.values();
        let count3: int = 0;
        let r3 = iter3.next();
        while (!r3.done) {
          count3 = count3 + 1;
          r3 = iter3.next();
        }
        expect(count3).assertEqual(3);
        // 4. drained iter leaves source (10,20) unmodified: length=2 and elements intact
        const arr4 = new SparseArray<int>(10, 20);
        const iter4 = arr4.values();
        iter4.next();
        iter4.next();
        iter4.next();
        expect(arr4.length).assertEqual(2);
        expect(arr4[0]!).assertEqual(10);
        expect(arr4[1]!).assertEqual(20);
        // 5. push(9) then values yields 9 then done=true
        const arr5 = new SparseArray<int>();
        arr5.push(9);
        const iter5 = arr5.values();
        expect(iter5.next().value!).assertEqual(9);
        expect(iter5.next().done).assertTrue();
        // 6. drained (1,2,3,4,5) counts 5 iterations and last value=5
        const arr6 = new SparseArray<int>(1, 2, 3, 4, 5);
        const iter6 = arr6.values();
        let count6: int = 0;
        let last6: int = 0;
        let r6 = iter6.next();
        while (!r6.done) {
          count6 = count6 + 1;
          last6 = r6.value!;
          r6 = iter6.next();
        }
        expect(count6).assertEqual(5);
        expect(last6).assertEqual(5);

      }
      {
        // 1. string with tab and newline characters yielded unchanged
        const arr1 = new SparseArray<string>("line1\tcol2\nline2");
        const iter1 = arr1.values();
        const r1 = iter1.next();
        expect(r1.done).assertFalse();
        expect(r1.value!).assertEqual("line1\tcol2\nline2");
        // 2. boolean false element yields done=false and value=false
        const arr2 = new SparseArray<boolean>(false);
        const iter2 = arr2.values();
        const r2 = iter2.next();
        expect(r2.done).assertFalse();
        expect(r2.value!).assertFalse();
        // 3. single-element string SparseArray yields "hello"
        const arr3 = new SparseArray<string>("hello");
        const iter3 = arr3.values();
        expect(iter3.next().value!).assertEqual("hello");
        // 4. single-element bigint SparseArray yields 0n
        const arr4 = new SparseArray<bigint>(0n);
        const iter4 = arr4.values();
        expect(iter4.next().value!).assertEqual(0n);
        // 5. Error element yields same instance with message "something wrong"
        const e5 = new Error("something wrong");
        const arr5 = new SparseArray<Error>(e5);
        const iter5 = arr5.values();
        const v5 = iter5.next().value;
        expect(v5!.message).assertEqual("something wrong");
        // 6. double elements (1.5, 2.5) yielded in order
        const arr6 = new SparseArray<double>(1.5, 2.5);
        const iter6 = arr6.values();
        expect(iter6.next().value!).assertEqual(1.5);
        expect(iter6.next().value!).assertEqual(2.5);
        // 7. Date element yields the same Date instance that was stored
        const dateA: Date = new Date(0);
        const arr7 = new SparseArray<Date>(dateA);
        const iter7 = arr7.values();
        const actualDate7: Date = iter7.next().value!;
        expect(actualDate7 === dateA).assertTrue();
        // 8. single empty string yields "" rather than undefined
        const arr8 = new SparseArray<string>("");
        const iter8 = arr8.values();
        expect(iter8.next().value!).assertEqual("");
        // 9. negative ints (-5, -6) yielded with signs preserved
        const arr9 = new SparseArray<int>(-5, -6);
        const iter9 = arr9.values();
        expect(iter9.next().value!).assertEqual(-5);
        expect(iter9.next().value!).assertEqual(-6);

      }
      {
        // 1. length-0 int SparseArray yields done=true immediately
        const arr1 = new SparseArray<int>(0);
        const iter1 = arr1.values();
        expect(iter1.next().done).assertTrue();
        // 2. length-42 empty SparseArray yields done=true and value=undefined
        const arr2 = new SparseArray<int>(42);
        const iter2 = arr2.values();
        const r2 = iter2.next();
        expect(r2.done).assertTrue();
        expect(r2.value).assertUndefined();
        // 3. length-42 empty SparseArray stays done=true and value=undefined on second next()
        const arr3 = new SparseArray<int>(42);
        const iter3 = arr3.values();
        iter3.next();
        const r3 = iter3.next();
        expect(r3.done).assertTrue();
        expect(r3.value).assertUndefined();
        // 4. sparse length-4 {0:100, 3:400} yields 100 then 400 then done=true skipping holes
        const arr4 = new SparseArray<int>(4);
        arr4[0] = 100;
        arr4[3] = 400;
        const iter4 = arr4.values();
        expect(iter4.next().value!).assertEqual(100);
        expect(iter4.next().value!).assertEqual(400);
        expect(iter4.next().done).assertTrue();
        // 5. SparseArray<int|undefined>(7, undefined) skips explicit undefined like a hole
        const arr5 = new SparseArray<int | undefined>(7, undefined);
        const iter5 = arr5.values();
        expect(iter5.next().value!).assertEqual(7);
        const r5 = iter5.next();
        expect(r5.value).assertUndefined();
        expect(r5.done).assertTrue();
        // 6. length-2 filled only at index 1 skips leading hole, yields 2 then done=true
        const arr6 = new SparseArray<int>(2);
        arr6[1] = 2;
        const iter6 = arr6.values();
        expect(iter6.next().value!).assertEqual(2);
        expect(iter6.next().done).assertTrue();
        // 7. two independent values iterators over (1,2) advance separately
        const arr7 = new SparseArray<int>(1, 2);
        const it7a = arr7.values();
        const it7b = arr7.values();
        expect(it7a.next().value!).assertEqual(1);
        expect(it7b.next().value!).assertEqual(1);
        expect(it7a.next().value!).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_1600
     * @tc.name testIterateIteratorNormal001
     * @tc.desc Test SparseArray.iterator method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateIteratorNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<string>();
          const iterator = arr.$_iterator();
          let result = iterator.next();
          expect(result!.done).assertTrue();


      }
      {
          const arr = new SparseArray<int>(5);
          arr[0] = 10;
          arr[2] = 30;
          arr[4] = 50;
          const iterator = arr.$_iterator();
          let count = 0;
          let result = iterator.next();
          while (!result.done) {
            count++;
            result = iterator.next();
          }
          expect(count).assertEqual(3);
          expect(result!.done).assertTrue();


      }
      {
          const arr = new SparseArray<string>("apple", "banana");
          const iterator = arr.$_iterator();
          let result = iterator.next();
          expect(result!.value).assertEqual("apple");


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const iterator = arr.$_iterator();
          let result = iterator.next();
          expect(result!.value).assertEqual(1);


      }
      {
          const arr = new SparseArray<number>(1.5, 2.5);
          const iterator = arr.$_iterator();
          let result = iterator.next();
          expect(result!.value).assertEqual(1.5);


      }
      {
          const arr = new SparseArray<boolean>(true, false, true);
          const iterator = arr.$_iterator();
          let result = iterator.next();
          expect(result!.value).assertTrue();


      }
      {
        const arr = new SparseArray<Person007>();
          arr[0] = { name: "Alice", age: 20 };
          const iterator = arr.$_iterator();
          let result = iterator.next();
          expect(result.value!.name).assertEqual("Alice");


      }
      {
          const arr = new SparseArray<string>("a", "b", "c");
          const iterator = arr.$_iterator();
          let result = iterator.next();
          expect(result!.done).assertFalse();
          expect(result!.value).assertEqual("a");
          result = iterator.next();
          expect(result!.done).assertFalse();
          expect(result!.value).assertEqual("b");
          result = iterator.next();
          expect(result!.done).assertFalse();
          expect(result!.value).assertEqual("c");
          result = iterator.next();
          expect(result!.done).assertTrue();


      }
      {
          const arr = new SparseArray<int>(1);
          const iterator = arr.$_iterator();
          expect(typeof iterator.next).assertEqual("function");


      }
      {
          const arr = new SparseArray<int>();
          arr[0] = 42;
          const iterator = arr.$_iterator();
          let result = iterator.next();
          expect(result!.value).assertEqual(42);
          result = iterator.next();
          expect(result!.done).assertTrue();


      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_1700
     * @tc.name testIterateIteratorNormal002
     * @tc.desc Test SparseArray.iterator method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateIteratorNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 1000; i++) {
            arr[i] = i;
          }
          const iterator = arr.$_iterator();
          let count = 0;
          let result = iterator.next();
          while (!result.done) {
            count++;
            result = iterator.next();
          }
          expect(count).assertEqual(1000);


      }
      {
          const arr = new SparseArray<int>(10);
          const iterator = arr.$_iterator();
          let result = iterator.next();
          expect(result!.done).assertTrue();


      }
      {
          const arr = new SparseArray<string>("x", "y", "z");
          const iterator = arr.$_iterator();
          let values: Array<string> = [];
          for (const value of iterator) {
            values.push(value);
          }
          expect(values.length).assertEqual(3);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const iterator = arr.$_iterator();
          let result = iterator.next();
          arr[0] = 100;
          arr[1] = 200;
          while (!result.done) {
            result = iterator.next();
          }

          expect(arr instanceof SparseArray).assertTrue();


      }
      {
          const arr = new SparseArray<int | undefined>(3);
                arr[0] = 1;
                arr.$_set(1, undefined);
                arr[2] = 3;
          expect(arr.$_get(1)).assertUndefined();
          const iterator = arr.$_iterator();
          let result = iterator.next();
          expect(result!.value).assertEqual(1);
          result = iterator.next();
          expect(result!.value).assertEqual(3);
          result = iterator.next();
          expect(result!.done).assertTrue();


      }
      {
          const arr = new SparseArray<string>("a", "b");
          const iter1 = arr.$_iterator();
          const iter2 = arr.values();
          let r1 = iter1.next();
          let r2 = iter2.next();
          expect(r1.value).assertEqual(r2.value);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          let iterValues: Array<int> = [];
          const iterator = arr.$_iterator();
          let result = iterator.next();
          while (!result.done) {
            const v = result.value;
            if (v !== undefined) {
              iterValues.push(v);
            }
            result = iterator.next();
          }

          let forEachValues: Array<int> = [];
          arr.forEach((value) => {
            forEachValues.push(value);
          });
          expect(iterValues.length).assertEqual(forEachValues.length);


      }
      {
          const arr = new SparseArray<int>();
          for (let i = 0; i < 10000; i++) {
            arr[i] = i;
          }
          const startTime = Date.now();
          const iterator = arr.$_iterator();
          let result = iterator.next();
          let steps = 0;
          while (!result.done) {
            result = iterator.next();
            steps++;
          }
          const endTime = Date.now();
          expect(endTime - startTime).assertLess(1000);


      }
      {
          const arr = new SparseArray<int>(1, 2, 3);
          const iter1 = arr.$_iterator();
          const iter2 = arr.$_iterator();
          const iter3 = arr.$_iterator();

          let r1 = iter1.next();
          let r2 = iter2.next();
          let r3 = iter3.next();

          r1 = iter1.next();
          r2 = iter2.next();

          expect(r1.value).assertEqual(2);
          expect(r2.value).assertEqual(2);
          expect(r3.value).assertEqual(1);


      }
      {
          const arr = new SparseArray<long>(100 as long, 200 as long);
          const iter = arr.$_iterator();
          expect(iter.next().value).assertEqual(100 as long);
          expect(iter.next().value).assertEqual(200 as long);
          expect(iter.next().done).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_ITERATION_1800
     * @tc.name testIterateIteratorNormal003
     * @tc.desc Test SparseArray.iterator method, verify normal-path results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterateIteratorNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          const arr = new SparseArray<int | null>(1, null, 3);
          const it = arr.$_iterator();
          expect(it.next().value).assertEqual(1);
          expect(it.next().value).assertEqual(null);
          expect(it.next().value).assertEqual(3);

      }
      {
          const arr = new SparseArray<int>(0xA, 0b101);
          const it = arr.$_iterator();
          expect(it.next().value).assertEqual(0xA);
          expect(it.next().value).assertEqual(0b101);

      }
      {
          const arr = new SparseArray<char>(c'A', c'B');
          const it = arr.$_iterator();
          expect(it.next().value).assertEqual(c'A');
          expect(it.next().value).assertEqual(c'B');
          expect(it.next().done).assertTrue();

      }
      {
          const arr = new SparseArray<string>(8);
          arr[7] = "tail";
          const it = arr.$_iterator();
          expect(it.next().value).assertEqual("tail");
          expect(it.next().done).assertTrue();

      }
    });

  });
}
