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
  TestType
} from '@ohos/hypium-static/src/main/indexStatic';

import Utils from './../Util.test';

export default function Int16ArrayFindLastTest(): void {
  describe('Int16ArrayFindLastTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDLAST_0100
     * @tc.name testFindLastGeneral001
     * @tc.desc Verify findLast returns the rightmost matched element for normal arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFindLastGeneral001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([50, 60, 70, 80, 90]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          return value === 80;
        });
        expect(result).assertEqual(80);

      }
      {
        let arr: Int16Array = new Int16Array([5, 10, 5, 20, 5]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          return value === 5;
        });
        expect(result).assertEqual(5);

      }
      {
        let arr: Int16Array = Int16Array.of(-5, -10, 1, 32767, -32768);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value > 0);
        expect(result).assertEqual(32767);

      }
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300);
        let prevValAtIdx0: number = 0;
        try {
          arr.findLast((_value: number, index: int, array: Int16Array): boolean => {
            if (index === 2) {
              prevValAtIdx0 = array.$_get(0);
              return false;
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(prevValAtIdx0).assertEqual(100);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let externalCount: int = 0;
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            externalCount = externalCount + 1;
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(externalCount).assertEqual(5);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20);
        let flag: boolean = false;
        try {
          arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
            if (value === 20) {
              flag = true;
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(flag).assertTrue();

      }
      {
        let src = Int16Array.of(7, 14, 21);
        let sideArr: int[] = [0, 0, 0];
        try {
          src.findLast((_value: number, index: int, _array: Int16Array): boolean => {
            sideArr[index] = 1;
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let resultValue1: number = sideArr[0];
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = sideArr[1];
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = sideArr[2];
        let expectedValue3: int = 1;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(30, 40, 50);
        let directReadAtIdx2: number = 0;
        try {
          arr.findLast((value: number, index: int, array: Int16Array): boolean => {
            if (index === 2) {
              array.$_set(2, 99);
              directReadAtIdx2 = array.$_get(2);
              return false;
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(directReadAtIdx2).assertEqual(99);

      }
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33);
        try {
          arr.findLast((_value: number, index: int, array: Int16Array): boolean => {
            array.$_set(index, 0);
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
            return value > 5;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 3;
        expect(resultValue3).assertEqual(expectedValue3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDLAST_0200
     * @tc.name testFindLastGeneral002
     * @tc.desc Verify findLast returns the rightmost matched element for normal arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFindLastGeneral002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(6, 7, 8, 9);
        let lenBefore: int = arr.length;
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let resultValue1: int = arr.length;
        let expectedValue1: number = lenBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(2, 4);
        let isSameRef: boolean = false;
        try {
          arr.findLast((_value: number, _index: int, array: Int16Array): boolean => {
            if (array === arr) {
              isSameRef = true;
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(isSameRef).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array(50);
        for (let i: int = 0; i < 50; i++) {
          arr.$_set(i, i);
        }
        let callCount: int = 0;
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            callCount = callCount + 1;
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(callCount).assertEqual(50);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 3, 1, 3);
        let findResult = arr.find((value: number, _index: int, _array: Int16Array): boolean => {
          return value === 3;
        });
        let findLastResult = arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
          return value === 3;
        });
        expect(findResult).assertEqual(3);
        expect(findLastResult).assertEqual(3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDLAST_0300
     * @tc.name testFindLastCallback001
     * @tc.desc Verify findLast predicate callback parameters side effects and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFindLastCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          return value > 3;
        });
        expect(result).assertEqual(5);

      }
      {
        let arr: Int16Array = new Int16Array([7, 14, 21, 28, 35]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          return true;
        });
        expect(result).assertEqual(35);

      }
      {
        let arr: Int16Array = new Int16Array([40, 80, 120, 160]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          return value === array.$_get(0) * 4;
        });
        expect(result).assertEqual(160);

      }
      {
        let arr: Int16Array = new Int16Array([2, 4, 8, 16, 32]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          return value === array.$_get(index) && index >= 0;
        });
        expect(result).assertEqual(32);

      }
      {
        let arr: Int16Array = new Int16Array([4, 8, 12, 16, 20]);
        let sideCounter: number = 0;
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          sideCounter = value;
          return value === 12;
        });
        expect(result).assertEqual(12);
        expect(sideCounter).assertEqual(12);

      }
      {
        let arr: Int16Array = new Int16Array([6, 12, 18, 24, 30]);
        let callCount: int = 0;
        arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          callCount++;
          return value > 20;
        });
        expect(callCount).assertEqual(1);

      }
      {
        let arr: Int16Array = new Int16Array([14, 28, 42, 56]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          if (value === 56) {
            array.$_set(index, 0);
            return false;
          }
          return value === 42;
        });
        expect(result).assertEqual(42);
        expect(arr[3]).assertEqual(0);

      }
      {
        let arr: Int16Array = new Int16Array([6, 15, 24, 33, 42]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          return value > 10 && value % 3 === 0;
        });
        expect(result).assertEqual(42);

      }
      {
        let arr: Int16Array = new Int16Array([2, 9, 4, 7, 6]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          return !(value % 2 !== 0);
        });
        expect(result).assertEqual(6);

      }
      {
        let arr: Int16Array = Int16Array.of(42, 99, 7);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => true);
        expect(result).assertEqual(7);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDLAST_0400
     * @tc.name testFindLastCallback002
     * @tc.desc Verify findLast predicate callback parameters side effects and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFindLastCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(5, 15, 25, 35, 45);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => index % 2 === 0);
        expect(result).assertEqual(45);

      }
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300, 400, 500);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => index < 2);
        expect(result).assertEqual(200);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let callCount: int = 0;
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          callCount = callCount + 1;
          return value === 2;
        });
        expect(result).assertEqual(2);
        expect(callCount).assertEqual(4);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.findLast((value: number, index: int, _array: Int16Array): boolean => {
            if (index === 1) {
              throw new Error("throw at second reverse call");
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(7, 8, 9);
        try {
          arr.findLast((value: number, index: int, _array: Int16Array): boolean => {
            if (index === 0) {
              throw new Error("throw at last reverse call");
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let callCount: int = 0;
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            callCount = callCount + 1;
            throw new Error("immediate throw");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(callCount).assertEqual(1);

      }
      {
        let callCount: int = 0;
        let buf: ArrayBuffer = new ArrayBuffer(0);
        let arr: Int16Array = new Int16Array(buf);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            callCount = callCount + 1;
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(callCount).assertEqual(0);

      }
      {
        let arr: Int16Array = Int16Array.of(99);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(-32768);
        let result: number | undefined = arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
          return value === -32768;
        });
        expect(result).assertEqual(-32768);

      }
      {
        let arr: Int16Array = new Int16Array(5);
        arr.$_set(0, 0);
        arr.$_set(1, 0);
        arr.$_set(2, 0);
        arr.$_set(3, 0);
        arr.$_set(4, 0);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDLAST_0500
     * @tc.name testFindLastCallback003
     * @tc.desc Verify findLast predicate callback parameters side effects and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFindLastCallback003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array(4);
        arr.$_set(0, 7);
        arr.$_set(1, 7);
        arr.$_set(2, 7);
        arr.$_set(3, 7);
        let result: number | undefined = arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
          return true;
        });
        expect(result).assertEqual(7);

      }
      {
        let arr: Int16Array = new Int16Array(5);
        arr.$_set(0, 100);
        arr.$_set(1, 100);
        arr.$_set(2, 100);
        arr.$_set(3, 100);
        arr.$_set(4, 100);
        let result: number | undefined = arr.findLast((_value: number, index: int, _array: Int16Array): boolean => {
          return index <= 1;
        });
        expect(result).assertEqual(100);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 10, 10, 10);
        try {
          arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
            return value > 100;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.findLast((_value: number, _index: int, array: Int16Array): boolean => {
            return array.$_get(-1) === undefined;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7, 8);
        try {
          arr.findLast((_value: number, _index: int, array: Int16Array): boolean => {
            return array.$_get(4) === undefined;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(11, 22);
        try {
          arr.findLast((_value: number, _index: int, array: Int16Array): boolean => {
            return array.$_get(3) === undefined;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(14, 15, 16);
        try {
          arr.findLast((_value: number, _index: int, array: Int16Array): boolean => {
            return array.$_get(-3) === undefined;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(7, 8);
        try {
          arr.findLast((_value: number, _index: int, array: Int16Array): boolean => {
            return array.$_get(10000) === undefined;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(13, 14);
        try {
          arr.findLast((_value: number, _index: int, array: Int16Array): boolean => {
            return array.$_get(-9999) === undefined;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(88, 99);
        try {
          arr.findLast((_value: number, _index: int, array: Int16Array): boolean => {
            return array.$_get(4) === undefined;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDLAST_0600
     * @tc.name testFindLastCallback004
     * @tc.desc Verify findLast predicate callback parameters side effects and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFindLastCallback004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
            return value === null;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15);
        try {
          arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
            return value === undefined;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(7, 14, 21);
        try {
          arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
            return value !== value;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(33, 66);
        let typeChecked: boolean = false;
        try {
          arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
            if (typeof value === 'number') {
              typeChecked = true;
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(typeChecked).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(9, 18, 27);
        let indexSum: int = 0;
        let callCount: int = 0;
        try {
          arr.findLast((_value: number, index: int, _array: Int16Array): boolean => {
            indexSum = indexSum + index;
            callCount = callCount + 1;
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(callCount).assertEqual(3);
        expect(indexSum).assertEqual(3);

      }
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let lengthChecked: int = 0;
        try {
          arr.findLast((_value: number, _index: int, array: Int16Array): boolean => {
            if (array.length === 3) {
              lengthChecked = lengthChecked + 1;
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(lengthChecked).assertEqual(3);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let capturedAtIdx1: number = 0;
        try {
          arr.findLast((value: number, index: int, array: Int16Array): boolean => {
            if (index === 2) {
              array.$_set(1, 999);
              return false;
            }
            if (index === 1) {
              capturedAtIdx1 = value;
              return false;
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(capturedAtIdx1).assertEqual(999);

      }
      {
        let arr: Int16Array = Int16Array.of(5, 15, 25);
        let capturedAtIdx2: number = 0;
        try {
          arr.findLast((value: number, index: int, array: Int16Array): boolean => {
            if (index === 2) {
              array.$_set(2, 888);
              capturedAtIdx2 = value;
              return false;
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(capturedAtIdx2).assertEqual(25);

      }
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9);
        let callCount: int = 0;
        try {
          arr.findLast((_value: number, index: int, array: Int16Array): boolean => {
            callCount = callCount + 1;
            if (index === 0) {
              array.$_set(2, 777);
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(callCount).assertEqual(3);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let finalValueAtIdx0: number = 0;
        try {
          arr.findLast((value: number, index: int, array: Int16Array): boolean => {
            if (index === 2) {
              array.$_set(0, 999);
              return false;
            }
            if (index === 0) {
              finalValueAtIdx0 = value;
              return false;
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(finalValueAtIdx0).assertEqual(999);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDLAST_0700
     * @tc.name testFindLastCallback005
     * @tc.desc Verify findLast predicate callback parameters side effects and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFindLastCallback005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let lengthMatch: boolean = true;
        try {
          arr.findLast((_value: number, _index: int, array: Int16Array): boolean => {
            if (array.length !== 4) {
              lengthMatch = false;
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(lengthMatch).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let indices: int[] = [0, 0, 0];
        try {
          arr.findLast((_value: number, index: int, _array: Int16Array): boolean => {
            indices[index] = 1;
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let resultValue1: number = indices[0];
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = indices[1];
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = indices[2];
        let expectedValue3: int = 1;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(17, 34, 51);
        let allMatch: boolean = true;
        try {
          arr.findLast((value: number, index: int, array: Int16Array): boolean => {
            if (value !== array.$_get(index)) {
              allMatch = false;
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(allMatch).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(5, 5, 5);
        let indexSum: int = 0;
        try {
          arr.findLast((_value: number, index: int, _array: Int16Array): boolean => {
            indexSum = indexSum + index;
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(indexSum).assertEqual(3);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let firstIndex: int = -1;
        arr.findLast((_value: number, index: int, _array: Int16Array): boolean => {
          firstIndex = index;
          return true;
        });
        expect(firstIndex).assertEqual(3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDLAST_0800
     * @tc.name testFindLastBoundary001
     * @tc.desc Verify findLast with Int16 boundary and special element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFindLastBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([0]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          return value === 0;
        });
        expect(result).assertEqual(0);

      }
      {
        let arr: Int16Array = new Int16Array([32767]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          return value === 32767;
        });
        expect(result).assertEqual(32767);

      }
      {
        let arr: Int16Array = new Int16Array([-32768]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          return value === -32768;
        });
        expect(result).assertEqual(-32768);

      }
      {
        let arr: Int16Array = new Int16Array([0, -100, -32768, 50]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          return value === -32768;
        });
        expect(result).assertEqual(-32768);

      }
      {
        let arr: Int16Array = new Int16Array([50, -75, 25, -50, 100]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          return value < 0;
        });
        expect(result).assertEqual(-50);

      }
      {
        let arr: Int16Array = Int16Array.of(100, -32768, 50);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value < 0);
        if (result !== undefined) {
          let resultValue1: boolean = (result as number) < 0;
          expect(resultValue1).assertTrue();
        }

      }
      {
        let arr: Int16Array = Int16Array.of(0, -32768, 10, -32768, -100);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value === -32768);
        expect(result).assertEqual(-32768);

      }
      {
        let arr: Int16Array = Int16Array.of(100, -1, 32767, -32768, 50);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value < 0);
        expect(result).assertEqual(-32768);

      }
      {
        let arr: Int16Array = Int16Array.of(-32768, 0, 100);
        let result: number | undefined = arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
          return value === -32768;
        });
        expect(result).assertEqual(-32768);

      }
      {
        let arr: Int16Array = Int16Array.of(0, 32767, 1);
        let result: number | undefined = arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
          return value === 32767;
        });
        expect(result).assertEqual(32767);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDLAST_0900
     * @tc.name testFindLastBoundary002
     * @tc.desc Verify findLast with Int16 boundary and special element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFindLastBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(-32768, 0, 32767);
        let result: number | undefined = arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
          return value === 32767;
        });
        expect(result).assertEqual(32767);

      }
      {
        let arr: Int16Array = Int16Array.of(32767, 0, -32768);
        let result: number | undefined = arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
          return value === -32768;
        });
        expect(result).assertEqual(-32768);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDLAST_1000
     * @tc.name testFindLastNoMatch001
     * @tc.desc Verify findLast returns undefined when no element matches or array is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFindLastNoMatch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(0);
        let arr: Int16Array = new Int16Array(buf);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = new Int16Array(0);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = new Int16Array(0);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(42, 43);
        try {
          arr.findLast((_value: number, _index: int, array: Int16Array): boolean => {
            let validGet = array.$_get(1);
            let oobGet = array.$_get(2);
            return validGet !== undefined && oobGet === undefined;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDLAST_1100
     * @tc.name testFindLastImmunity001
     * @tc.desc Verify findLast does not mutate the source array and keeps its properties unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFindLastImmunity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => {
          return value === 20;
        });
        expect(result).assertEqual(20);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        let lenBefore: number = arr.length;
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value > 25);
        expect(result).assertEqual(50);
        let resultValue1: int = arr.length;
        let expectedValue1: number = lenBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(42);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value === 42);
        expect(result).assertEqual(42);
        let resultValue1: int = arr.length;
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
        let blBefore: number = arr.byteLength;
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value > 3);
        expect(result).assertEqual(6);
        let resultValue1: int = arr.byteLength;
        let expectedValue1: number = blBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(50, 60, 70, 80, 90);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value > 65);
        expect(result).assertEqual(90);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 50;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 3, 5, 7, 9);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value > 4);
        expect(result).assertEqual(9);
        let resultValue1: number = arr.$_get(4);
        let expectedValue1: int = 9;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value === 44);
        expect(result).assertEqual(44);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 11;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9, 12, 15);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value > 10);
        expect(result).assertEqual(15);
        let allMatch: boolean = true;
        let expected: number[] = [3, 6, 9, 12, 15];
        for (let i = 0; i < arr.length; i++) {
          if (arr.$_get(i) !== expected[i]) {
            allMatch = false;
            break;
          }
        }
        expect(allMatch).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let bufBefore: ArrayBuffer = arr.buffer;
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value > 3);
        expect(result).assertEqual(5);
        let resultValue1: boolean = arr.buffer === bufBefore;
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(8, 16, 24, 32);
        let bufBlBefore: number = arr.buffer.byteLength;
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value > 15);
        expect(result).assertEqual(32);
        let resultValue1: int = arr.buffer.byteLength;
        let expectedValue1: number = bufBlBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDLAST_1200
     * @tc.name testFindLastImmunity002
     * @tc.desc Verify findLast does not mutate the source array and keeps its properties unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFindLastImmunity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let buf: ArrayBuffer = new ArrayBuffer(20);
        let arr: Int16Array = new Int16Array(buf, 2, 5);
        arr.$_set(0, 10);
        arr.$_set(1, 20);
        arr.$_set(2, 30);
        arr.$_set(3, 40);
        arr.$_set(4, 50);
        let offsetBefore: number = arr.byteOffset;
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value > 25);
        expect(result).assertEqual(50);
        let resultValue1: int = arr.byteOffset;
        let expectedValue1: number = offsetBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let isViewBefore: boolean = ArrayBuffer.isView(arr);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value > 2);
        expect(result).assertEqual(5);
        let resultValue1: boolean = ArrayBuffer.isView(arr);
        let expectedValue1: boolean = isViewBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(55);
        let result: number | undefined = arr.findLast((value: number, index: int, array: Int16Array): boolean => value > 30);
        expect(result).assertEqual(55);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 55;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDLAST_1300
     * @tc.name testFindLastError001
     * @tc.desc Verify findLast propagates errors thrown by the predicate callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFindLastError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        try {
          arr.findLast((value: number, index: int, array: Int16Array): boolean => {
            throw new Error('predicate error');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = new Int16Array([9, 18, 27, 36]);
        try {
          arr.findLast((value: number, index: int, array: Int16Array): boolean => {
            throw new RangeError('out of range in predicate');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let arr: Int16Array = new Int16Array([2, 4, 6, 8, 10]);
        let checkCount: int = 0;
        try {
          arr.findLast((value: number, index: int, array: Int16Array): boolean => {
            checkCount++;
            if (value === 6) {
              throw new Error('stop at middle');
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(checkCount).assertEqual(3);

      }
      {
        let arr: Int16Array = new Int16Array([3, 6, 9, 12, 15]);
        let called: boolean = false;
        try {
          arr.findLast((value: number, index: int, array: Int16Array): boolean => {
            called = true;
            throw new Error('fail immediately');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(called).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            throw new Error("predicate failure at last");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            throw new TypeError("type error at reverse first");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            throw new RangeError("range error at reverse first");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        try {
          arr.findLast((value: number, index: int, _array: Int16Array): boolean => {
            if (index === 2) {
              throw new Error("throw at middle reverse call");
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300);
        try {
          arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
            if (value === 300) {
              throw new Error("throw on reverse first match");
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            throw new Error('custom error in findLast');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDLAST_1400
     * @tc.name testFindLastError002
     * @tc.desc Verify findLast propagates errors thrown by the predicate callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFindLastError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33);
        try {
          arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
            if (value === 22) {
              throw new Error("abort at middle");
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 11;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 22;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 33;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            throw new Error("first attempt fails");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let result: number | undefined = arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
          return value > 7;
        });
        expect(result).assertEqual(15);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            throw new Error("must be caught");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let progress: int = 0;
        try {
          arr.findLast((_value: number, index: int, _array: Int16Array): boolean => {
            progress = index;
            if (index === 2) {
              throw new Error("stop at index 2");
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(progress).assertEqual(2);

      }
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            throw new SyntaxError("syntax error in predicate");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('SyntaxError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(50, 60, 70);
        try {
          arr.findLast((_value: number, index: int, array: Int16Array): boolean => {
            array.$_set(index, 0);
            if (index === 0) {
              throw new Error("throw after modifying all");
            }
            return false;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15, 20);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            throw new Error("fail");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let result: number | undefined = arr.findLast((value: number, _index: int, _array: Int16Array): boolean => {
          return value > 12;
        });
        expect(result).assertEqual(20);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            throw new Error("uncaught in findLast");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
        let lenBefore: int = arr.length;
        try {
          arr.findLast((_value: number, _index: int, _array: Int16Array): boolean => {
            throw new Error("abort");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let resultValue1: int = arr.length;
        let expectedValue1: number = lenBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

  });
}
