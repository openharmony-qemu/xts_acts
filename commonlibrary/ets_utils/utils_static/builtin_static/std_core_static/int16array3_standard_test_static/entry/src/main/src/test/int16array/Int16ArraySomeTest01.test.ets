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

function isMatchInt16SomePart01(element: number, index: int, array: Int16Array): boolean {
  return element === 9;
}

export default function Int16ArraySomeTest01(): void {
  describe('Int16ArraySomeTest01', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_0100
     * @tc.name testInt16ArraySomeTestOne001
     * @tc.desc Verify some() with single predicate arg returns true for match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 2;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_0200
     * @tc.name testInt16ArraySomeTestOne002
     * @tc.desc Verify some() with typed arrow predicate element>8 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 8;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_0300
     * @tc.name testInt16ArraySomeTestOne003
     * @tc.desc Verify some() accepts named function predicate and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 6, 9]);
      let result: boolean = arr.some(isMatchInt16SomePart01);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_0400
     * @tc.name testInt16ArraySomeTestOne004
     * @tc.desc Verify some() predicate index=0 true true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 8, 9, 10]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return index === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_0500
     * @tc.name testInt16ArraySomeTestOne005
     * @tc.desc Verify some() predicate true index=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300, 400, 500]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return index === 2;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_0600
     * @tc.name testInt16ArraySomeTestOne006
     * @tc.desc Verify some() predicate index=length-2 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return index === 3;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_0700
     * @tc.name testInt16ArraySomeTestOne007
     * @tc.desc Verify predicate true some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_0800
     * @tc.name testInt16ArraySomeTestOne008
     * @tc.desc Verify predicate false some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14, 21]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return false;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_0900
     * @tc.name testInt16ArraySomeTestOne009
     * @tc.desc Verify predicate element=0 some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 0, 3]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_1000
     * @tc.name testInt16ArraySomeTestOne010
     * @tc.desc Verify predicate element=-1 some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([4, -1, 2]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === -1;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_1100
     * @tc.name testInt16ArraySomeTestOne011
     * @tc.desc Verify predicate element=32767 int16.MAX some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 32767, 200]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 32767;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_1200
     * @tc.name testInt16ArraySomeTestOne012
     * @tc.desc Verify predicate element=-32768 int16.MIN some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([50, -32768, 75]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === -32768;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_1300
     * @tc.name testInt16ArraySomeTestOne013
     * @tc.desc Verify some() NaN 0 predicate element=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([Number.NaN, 5, 10]);
      let captured: number = -999;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        captured = element;
        return true;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_1400
     * @tc.name testInt16ArraySomeTestOne014
     * @tc.desc Verify some() +Infinity 0 predicate element=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([Number.POSITIVE_INFINITY, 3, 7]);
      let captured: number = -999;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        captured = element;
        return true;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_1500
     * @tc.name testInt16ArraySomeTestOne015
     * @tc.desc Verify some() -Infinity 0 predicate element=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([Number.NEGATIVE_INFINITY, 8, 12]);
      let captured: number = -999;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        captured = element;
        return true;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_1600
     * @tc.name testInt16ArraySomeTestOne016
     * @tc.desc Verify some() 3.7 3 predicate element=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3.7, 6, 9]);
      let captured: number = -999;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        captured = element;
        return true;
      });
      expect(captured).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_1700
     * @tc.name testInt16ArraySomeTestOne017
     * @tc.desc Verify some() -3.7 -3 predicate element=-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-3.7, 4, 8]);
      let captured: number = -999;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        captured = element;
        return true;
      });
      expect(captured).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_1800
     * @tc.name testInt16ArraySomeTestOne018
     * @tc.desc Verify some() first predicate call has index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([25, 50, 75]);
      let capturedIndex: int = -1;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        capturedIndex = index;
        return true;
      });
      expect(capturedIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_1900
     * @tc.name testInt16ArraySomeTestOne019
     * @tc.desc Verify some() predicate index=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([12, 24, 36, 48]);
      let capturedIndex: int = -1;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        capturedIndex = index;
        return index === 3;
      });
      expect(capturedIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_2000
     * @tc.name testInt16ArraySomeTestOne020
     * @tc.desc Verify some() index values increase by 1 each call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let prevIndex: int = -1;
      let ok: boolean = true;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        if (index !== prevIndex + 1) {
          ok = false;
        }
        prevIndex = index;
        return false;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_2100
     * @tc.name testInt16ArraySomeTestOne021
     * @tc.desc Verify some() predicate array Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15]);
      let sameRef: boolean = false;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        sameRef = array === arr;
        return true;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_2200
     * @tc.name testInt16ArraySomeTestOne022
     * @tc.desc Verify some() predicate array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([2, 4, 6, 8]);
      let arrayLen: int = 0;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        arrayLen = array.length;
        return true;
      });
      expect(arrayLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_2300
     * @tc.name testInt16ArraySomeTestOne023
     * @tc.desc Verify some() predicate array[index] element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([17, 34, 51]);
      let valuesMatch: boolean = true;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        if (array.$_get(index) !== element) {
          valuesMatch = false;
        }
        return false;
      });
      expect(valuesMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_2400
     * @tc.name testInt16ArraySomeTestOne024
     * @tc.desc Verify some() predicate array predicate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let firstElement: number = 0;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          firstElement = element;
          array.$_set(0, 999);
        }
        return false;
      });
      expect(firstElement).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_2500
     * @tc.name testInt16ArraySomeTestOne025
     * @tc.desc Verify some() predicate predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let receivedAt1: number = -999;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(1, 88);
          return false;
        }
        if (index === 1) {
          receivedAt1 = element;
          return false;
        }
        return false;
      });
      expect(receivedAt1).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_2600
     * @tc.name testInt16ArraySomeTestOne026
     * @tc.desc Verify some() with true returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([60, 70, 80]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        if (element === 60) {
          array.$_set(0, 999);
          return true;
        }
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_2700
     * @tc.name testInt16ArraySomeTestOne027
     * @tc.desc Verify some() returns true when predicate mutates future index to match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(2, 777);
          return false;
        }
        if (element === 777) {
          return true;
        }
        return false;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_2800
     * @tc.name testInt16ArraySomeTestOne028
     * @tc.desc Verify some() rethrows Error thrown by predicate at first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([4, 8, 12]);
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          throw new Error('fail at first');
        });
        expect().assertFail();
      } catch (e) {
        let r1: boolean = e !== null;
        expect(r1).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_2900
     * @tc.name testInt16ArraySomeTestOne029
     * @tc.desc Verify some() rethrows Error thrown by predicate at last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          if (index === 2) {
            throw new Error('fail at last');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        let r1: boolean = e !== null;
        expect(r1).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_3000
     * @tc.name testInt16ArraySomeTestOne030
     * @tc.desc Verify some() on empty array never invokes predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      let called: boolean = false;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        called = true;
        return true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_3100
     * @tc.name testInt16ArraySomeTestOne031
     * @tc.desc Verify element=8 predicate 8 some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([8]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 8;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_3200
     * @tc.name testInt16ArraySomeTestOne032
     * @tc.desc Verify element=9 predicate 9 some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([9]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 99;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_3300
     * @tc.name testInt16ArraySomeTestOne033
     * @tc.desc Verify element=0 predicate 0 some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_3400
     * @tc.name testInt16ArraySomeTestOne034
     * @tc.desc Verify some() 0 predicate 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_3500
     * @tc.name testInt16ArraySomeTestOne035
     * @tc.desc Verify some() 0 predicate 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element !== 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_3600
     * @tc.name testInt16ArraySomeTestOne036
     * @tc.desc Verify some() [-32768,-1,0,1,32767] predicate -32768 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -1, 0, 1, 32767]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === -32768;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_3700
     * @tc.name testInt16ArraySomeTestOne037
     * @tc.desc Verify some() [-32768,-1,0,1,32767] predicate 32767 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -1, 0, 1, 32767]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 32767;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_3800
     * @tc.name testInt16ArraySomeTestOne038
     * @tc.desc Verify some() [-32768,-1,0,1,32767] predicate 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -1, 0, 1, 32767]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_3900
     * @tc.name testInt16ArraySomeTestOne039
     * @tc.desc Verify some() [-32768,-1,0,1,32767] predicate -1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -1, 0, 1, 32767]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === -1;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_4000
     * @tc.name testInt16ArraySomeTestOne040
     * @tc.desc Verify some() [-32768,-1,0,1,32767] predicate 1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -1, 0, 1, 32767]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 1;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_4100
     * @tc.name testInt16ArraySomeTestOne041
     * @tc.desc Verify some() [-32768,-1,0,1,32767] predicate false false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -1, 0, 1, 32767]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return false;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_4200
     * @tc.name testInt16ArraySomeTestOne042
     * @tc.desc Verify some() index=2 predicate 3 index 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 33, 44, 55]);
      let callCount: int = 0;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        callCount++;
        return index === 2;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_4300
     * @tc.name testInt16ArraySomeTestOne043
     * @tc.desc Verify some() calls predicate length times when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15, 20]);
      let callCount: int = 0;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        callCount++;
        return false;
      });
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_4400
     * @tc.name testInt16ArraySomeTestOne044
     * @tc.desc Verify some() predicate increments external counter each call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let counter: int = 0;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        counter++;
        return false;
      });
      expect(counter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_4500
     * @tc.name testInt16ArraySomeTestOne045
     * @tc.desc Verify some() predicate can read external boolean to decide match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14, 21]);
      let shouldMatch: boolean = false;
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        if (index === 1) {
          shouldMatch = true;
        }
        return shouldMatch;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_4600
     * @tc.name testInt16ArraySomeTestOne046
     * @tc.desc Verify some() predicate can collect visited elements into external array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([33, 66, 99]);
      let collected: number[] = [];
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        collected.push(element);
        return false;
      });
      let r1: number = collected[0];
      let e1: number = 33;
      expect(r1).assertEqual(e1);
      let r2: number = collected[1];
      let e2: number = 66;
      expect(r2).assertEqual(e2);
      let r3: number = collected[2];
      let e3: number = 99;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_4700
     * @tc.name testInt16ArraySomeTestOne047
     * @tc.desc Verify some() predicate index>= 1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([70, 80, 90]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return index >= 1;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_4800
     * @tc.name testInt16ArraySomeTestOne048
     * @tc.desc Verify some() predicate element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 7, 11, 15]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 6 && index < 3;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_4900
     * @tc.name testInt16ArraySomeTestOne049
     * @tc.desc Verify some() predicate element index array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([9, 18, 27, 36]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === array.$_get(index) && index === 2;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_5000
     * @tc.name testInt16ArraySomeTestOne050
     * @tc.desc Verify some() with element !== 0 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 1, 0, 1]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element !== 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_5100
     * @tc.name testInt16ArraySomeTestOne051
     * @tc.desc Verify some() with element === -15 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-5, -10, -15, -20]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === -15;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_5200
     * @tc.name testInt16ArraySomeTestOne052
     * @tc.desc Verify some() with element === 165 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([55, 110, 165, 220]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 165;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_5300
     * @tc.name testInt16ArraySomeTestOne053
     * @tc.desc Verify some() with element === 99 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([99, 1]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 99;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_5400
     * @tc.name testInt16ArraySomeTestOne054
     * @tc.desc Verify some() short-circuits on first duplicate match callCount=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 5, 5, 5]);
      let callCount: int = 0;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        callCount++;
        return element === 5;
      });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_5500
     * @tc.name testInt16ArraySomeTestOne055
     * @tc.desc Verify some() on length-100 array matches last index with 100 calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      let callCount: int = 0;
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        callCount++;
        return index === 99;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_5600
     * @tc.name testInt16ArraySomeTestOne056
     * @tc.desc Verify some() on length-100 array short-circuits at first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i + 1);
      }
      let callCount: int = 0;
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        callCount++;
        return element === 1;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_5700
     * @tc.name testInt16ArraySomeTestOne057
     * @tc.desc Verify some() with element < 8 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([20, 15, 10, 5]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element < 8;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_5800
     * @tc.name testInt16ArraySomeTestOne058
     * @tc.desc Verify some() with element >= 36 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([12, 24, 36, 48]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element >= 36;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_5900
     * @tc.name testInt16ArraySomeTestOne059
     * @tc.desc Verify some() with element <= 30 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([50, 40, 30, 20]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element <= 30;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_6000
     * @tc.name testInt16ArraySomeTestOne060
     * @tc.desc Verify some() with element > 3 && element < 10 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 4, 9, 16]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 3 && element < 10;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_6100
     * @tc.name testInt16ArraySomeTestOne061
     * @tc.desc Verify some() with element === 25 || element === 100 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([25, 50, 75, 100]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 25 || element === 100;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_6200
     * @tc.name testInt16ArraySomeTestOne062
     * @tc.desc Verify some() reflects multi-index mutations on later iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let receivedAt2: number = 0;
      let receivedAt3: number = 0;
      arr.some((element: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(2, 200);
          array.$_set(3, 300);
          return false;
        }
        if (index === 2) {
          receivedAt2 = element;
        }
        if (index === 3) {
          receivedAt3 = element;
        }
        return false;
      });
      expect(receivedAt2).assertEqual(200);
      expect(receivedAt3).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_6300
     * @tc.name testInt16ArraySomeTestOne063
     * @tc.desc Verify some() processes elements before predicate throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([20, 40, 60, 80]);
      let visited: number[] = [];
      try {
        arr.some((element: number, index: int, array: Int16Array): boolean => {
          visited.push(element);
          if (index === 2) {
            throw new Error('stop');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        let r4: boolean = e !== null;
        expect(r4).assertTrue();
      }
      let r1: number = visited[0];
      let e1: number = 20;
      expect(r1).assertEqual(e1);
      let r2: number = visited[1];
      let e2: number = 40;
      expect(r2).assertEqual(e2);
      let r3: number = visited[2];
      let e3: number = 60;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_6400
     * @tc.name testInt16ArraySomeTestOne064
     * @tc.desc Verify some() works after length ctor and  fills
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      arr.$_set(0, 33);
      arr.$_set(1, 66);
      arr.$_set(2, 99);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 66;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_6500
     * @tc.name testInt16ArraySomeTestOne065
     * @tc.desc Verify some() return typeof is boolean when match succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 2;
      });
      let r1: string = typeof result;
      let e1: string = 'boolean';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_6600
     * @tc.name testInt16ArraySomeTestOne066
     * @tc.desc Verify some() return typeof is boolean when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 999;
      });
      let r1: string = typeof result;
      let e1: string = 'boolean';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_6700
     * @tc.name testInt16ArraySomeTestOne067
     * @tc.desc Verify some() return typeof is boolean on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 0;
      });
      let r1: string = typeof result;
      let e1: string = 'boolean';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_6800
     * @tc.name testInt16ArraySomeTestOne068
     * @tc.desc Verify some() returns true when match succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 10;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_6900
     * @tc.name testInt16ArraySomeTestOne069
     * @tc.desc Verify some() returns false when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element < 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_7000
     * @tc.name testInt16ArraySomeTestOne070
     * @tc.desc Verify some() returns false on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_7100
     * @tc.name testInt16ArraySomeTestOne071
     * @tc.desc Verify some() return is not null when match succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 0;
      });
      let r1: boolean = result === null;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_7200
     * @tc.name testInt16ArraySomeTestOne072
     * @tc.desc Verify some() return is not undefined when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element < 0;
      });
      let r1: boolean = result === undefined;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_7300
     * @tc.name testInt16ArraySomeTestOne073
     * @tc.desc Verify some() return typeof is not number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element > 0;
      });
      let r1: boolean = typeof result === 'number';
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_7400
     * @tc.name testInt16ArraySomeTestOne074
     * @tc.desc Verify some() return typeof is not object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element < 0;
      });
      let r1: boolean = typeof result === 'object';
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_7500
     * @tc.name testInt16ArraySomeTestOne075
     * @tc.desc Verify some() assertFalse works when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 999;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SOME_ONE_7600
     * @tc.name testInt16ArraySomeTestOne076
     * @tc.desc Verify some() matches single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArraySomeTestOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      let result: boolean = arr.some((element: number, index: int, array: Int16Array): boolean => {
        return element === 42;
      });
      expect(result).assertTrue();
    });
  });
}
