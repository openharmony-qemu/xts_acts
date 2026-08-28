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

function matchTarget073(value: number, index: int, array: Int16Array): boolean {
  return value === 42;
}

export default function Int16ArrayFindIndexTest01(): void {
  describe('Int16ArrayFindIndexTest01', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_0100
     * @tc.name testInt16ArrayFindIndexTestOne001
     * @tc.desc Verify findIndex accepts exactly one predicate and returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value > 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_0200
     * @tc.name testInt16ArrayFindIndexTestOne002
     * @tc.desc Verify findIndex returns 0 when predicate always true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => true);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_0300
     * @tc.name testInt16ArrayFindIndexTestOne003
     * @tc.desc Verify findIndex returns -1 when predicate always false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => false);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_0400
     * @tc.name testInt16ArrayFindIndexTestOne004
     * @tc.desc Verify findIndex short-circuits at index 0 when first predicate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 5, 5]);
      let callCount: int = 0;
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        callCount++;
        return value === 5;
      });
      expect(result).assertEqual(0);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_0500
     * @tc.name testInt16ArrayFindIndexTestOne005
     * @tc.desc Verify findIndex returns 1 when predicate first true at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 99, 3]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 99);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_0600
     * @tc.name testInt16ArrayFindIndexTestOne006
     * @tc.desc Verify findIndex returns length-1 when first match is last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 99]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 99);
      expect(result).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_0700
     * @tc.name testInt16ArrayFindIndexTestOne007
     * @tc.desc Verify findIndex short-circuits after third element false/false/true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let visited: int[] = [];
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        visited.push(index);
        return value === 30;
      });
      expect(result).assertEqual(2);
      let r1: int = visited.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_0800
     * @tc.name testInt16ArrayFindIndexTestOne008
     * @tc.desc Verify findIndex predicate value at index 0 equals first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42, 1, 2]);
      let capturedValue: number = 0;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        capturedValue = value;
        return true;
      });
      expect(capturedValue).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_0900
     * @tc.name testInt16ArrayFindIndexTestOne009
     * @tc.desc Verify findIndex predicate value at index 1 equals second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 42, 3]);
      let capturedAt1: number = 0;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index === 1) {
          capturedAt1 = value;
          return true;
        }
        return false;
      });
      expect(capturedAt1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_1000
     * @tc.name testInt16ArrayFindIndexTestOne010
     * @tc.desc Verify findIndex predicate last call value equals last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 99]);
      let lastValue: number = 0;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        lastValue = value;
        return false;
      });
      expect(lastValue).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_1100
     * @tc.name testInt16ArrayFindIndexTestOne011
     * @tc.desc Verify findIndex predicate receives negative signed values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-100, -200, -300]);
      let captured: number = 0;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        captured = value;
        return value === -200;
      });
      expect(captured).assertEqual(-200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_1200
     * @tc.name testInt16ArrayFindIndexTestOne012
     * @tc.desc Verify findIndex predicate receives zero value without loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 0, 3]);
      let zeroValue: number = -1;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        zeroValue = value;
        return value === 0;
      });
      expect(zeroValue).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_1300
     * @tc.name testInt16ArrayFindIndexTestOne013
     * @tc.desc Verify findIndex predicate first call index is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let firstIndex: int = -1;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        firstIndex = index;
        return true;
      });
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_1400
     * @tc.name testInt16ArrayFindIndexTestOne014
     * @tc.desc Verify findIndex predicate index increases strictly 0 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let prevIndex: int = -1;
      let monotonic: boolean = true;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index <= prevIndex) {
          monotonic = false;
        }
        prevIndex = index;
        return false;
      });
      expect(monotonic).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_1500
     * @tc.name testInt16ArrayFindIndexTestOne015
     * @tc.desc Verify findIndex last predicate index equals length-1 when all false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let lastIndex: int = -1;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        lastIndex = index;
        return false;
      });
      expect(lastIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_1600
     * @tc.name testInt16ArrayFindIndexTestOne016
     * @tc.desc Verify findIndex predicate array argument is same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let sameRef: boolean = false;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        sameRef = array === arr;
        return true;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_1700
     * @tc.name testInt16ArrayFindIndexTestOne017
     * @tc.desc Verify findIndex predicate array.length equals original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let arrLen: int = -1;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        arrLen = array.length;
        return true;
      });
      expect(arrLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_1800
     * @tc.name testInt16ArrayFindIndexTestOne018
     * @tc.desc Verify findIndex predicate array.$_get reads other elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let crossCheckOk: boolean = false;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          crossCheckOk = array.$_get(2) === 30;
          return true;
        }
        return false;
      });
      expect(crossCheckOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_1900
     * @tc.name testInt16ArrayFindIndexTestOne019
     * @tc.desc Verify findIndex propagates Error thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      try {
        arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
          throw new Error('predicate error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_2000
     * @tc.name testInt16ArrayFindIndexTestOne020
     * @tc.desc Verify findIndex propagates TypeError thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      try {
        arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
          throw new TypeError('type error in predicate');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_2100
     * @tc.name testInt16ArrayFindIndexTestOne021
     * @tc.desc Verify findIndex propagates RangeError thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      try {
        arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
          throw new RangeError('range error in predicate');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_2200
     * @tc.name testInt16ArrayFindIndexTestOne022
     * @tc.desc Verify findIndex stops after first call when predicate throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      try {
        arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
          callCount++;
          throw new Error('immediate throw');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_2300
     * @tc.name testInt16ArrayFindIndexTestOne023
     * @tc.desc Verify findIndex runs first predicate then propagates second-call Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let firstCallDone: boolean = false;
      try {
        arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
          if (index === 0) {
            firstCallDone = true;
            return false;
          }
          throw new Error('throw at second call');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(firstCallDone).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_2400
     * @tc.name testInt16ArrayFindIndexTestOne024
     * @tc.desc Verify findIndex on new Int16Array(0) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_2500
     * @tc.name testInt16ArrayFindIndexTestOne025
     * @tc.desc Verify findIndex on new Int16Array() returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_2600
     * @tc.name testInt16ArrayFindIndexTestOne026
     * @tc.desc Verify findIndex does not call predicate on empty Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let called: boolean = false;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        called = true;
        return true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_2700
     * @tc.name testInt16ArrayFindIndexTestOne027
     * @tc.desc Verify findIndex on Int16Array.of() empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of();
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_2800
     * @tc.name testInt16ArrayFindIndexTestOne028
     * @tc.desc Verify findIndex on single positive element matching returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_2900
     * @tc.name testInt16ArrayFindIndexTestOne029
     * @tc.desc Verify findIndex on single element non-matching returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_3000
     * @tc.name testInt16ArrayFindIndexTestOne030
     * @tc.desc Verify findIndex on single zero element matching returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_3100
     * @tc.name testInt16ArrayFindIndexTestOne031
     * @tc.desc Verify findIndex on single -1 element matching returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-1]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === -1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_3200
     * @tc.name testInt16ArrayFindIndexTestOne032
     * @tc.desc Verify findIndex on single MAX 32767 matching returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32767]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 32767);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_3300
     * @tc.name testInt16ArrayFindIndexTestOne033
     * @tc.desc Verify findIndex on single MIN -32768 matching returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === -32768);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_3400
     * @tc.name testInt16ArrayFindIndexTestOne034
     * @tc.desc Verify findIndex matches last element in three-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 99]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 99);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_3500
     * @tc.name testInt16ArrayFindIndexTestOne035
     * @tc.desc Verify findIndex returns 0 for first of identical matching elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 7, 7, 7, 7]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_3600
     * @tc.name testInt16ArrayFindIndexTestOne036
     * @tc.desc Verify findIndex returns middle index 2 for matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 99, 4, 5]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 99);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_3700
     * @tc.name testInt16ArrayFindIndexTestOne037
     * @tc.desc Verify findIndex short-circuits at first of multiple potential matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 5, 10, 5]);
      let callCount: int = 0;
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        callCount++;
        return value === 10;
      });
      expect(result).assertEqual(1);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_3800
     * @tc.name testInt16ArrayFindIndexTestOne038
     * @tc.desc Verify findIndex matches MAX 32767 element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 32767, 3]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 32767);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_3900
     * @tc.name testInt16ArrayFindIndexTestOne039
     * @tc.desc Verify findIndex matches MIN -32768 element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, -32768, 3]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === -32768);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_4000
     * @tc.name testInt16ArrayFindIndexTestOne040
     * @tc.desc Verify findIndex matches zero element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 0, 5]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_4100
     * @tc.name testInt16ArrayFindIndexTestOne041
     * @tc.desc Verify findIndex matches -1 element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, -1, 5]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === -1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_4200
     * @tc.name testInt16ArrayFindIndexTestOne042
     * @tc.desc Verify findIndex matches negative value in all-negative array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-5, -10, -15]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === -10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_4300
     * @tc.name testInt16ArrayFindIndexTestOne043
     * @tc.desc Verify findIndex skips leading negatives and matches first positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-3, -2, -1, 5, 6]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value > 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_4400
     * @tc.name testInt16ArrayFindIndexTestOne044
     * @tc.desc Verify findIndex matches truncated float 3.7 stored as 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 3.7, 5]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 3);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_4500
     * @tc.name testInt16ArrayFindIndexTestOne045
     * @tc.desc Verify findIndex matches truncated float -3.7 stored as -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, -3.7, 5]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === -3);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_4600
     * @tc.name testInt16ArrayFindIndexTestOne046
     * @tc.desc Verify findIndex matches 0 after NaN constructor truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, Number.NaN, 5]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_4700
     * @tc.name testInt16ArrayFindIndexTestOne047
     * @tc.desc Verify findIndex matches 0 after +Infinity constructor truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, Number.POSITIVE_INFINITY, 5]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_4800
     * @tc.name testInt16ArrayFindIndexTestOne048
     * @tc.desc Verify findIndex matches 0 after -Infinity constructor truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, Number.NEGATIVE_INFINITY, 5]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_4900
     * @tc.name testInt16ArrayFindIndexTestOne049
     * @tc.desc Verify findIndex matches -32768 after 32768 overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 32768, 5]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === -32768);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_5000
     * @tc.name testInt16ArrayFindIndexTestOne050
     * @tc.desc Verify findIndex matches 32767 after -32769 overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, -32769, 5]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 32767);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_5100
     * @tc.name testInt16ArrayFindIndexTestOne051
     * @tc.desc Verify findIndex with less-than predicate finds first smaller value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 6, 2, 7, 8]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value < 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_5200
     * @tc.name testInt16ArrayFindIndexTestOne052
     * @tc.desc Verify findIndex with greater-or-equal predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value >= 4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_5300
     * @tc.name testInt16ArrayFindIndexTestOne053
     * @tc.desc Verify findIndex with less-or-equal predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 9, 8, 2, 7]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value <= 2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_5400
     * @tc.name testInt16ArrayFindIndexTestOne054
     * @tc.desc Verify findIndex with strict inequality predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 7, 3, 7]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value !== 7);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_5500
     * @tc.name testInt16ArrayFindIndexTestOne055
     * @tc.desc Verify findIndex with AND combination predicate value range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 3, 7, 9, 2]);
      let result: int = arr.findIndex(
        (value: number, index: int, array: Int16Array): boolean => value > 2 && value < 8,
      );
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_5600
     * @tc.name testInt16ArrayFindIndexTestOne056
     * @tc.desc Verify findIndex with OR combination predicate value match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 99, 5]);
      let result: int = arr.findIndex(
        (value: number, index: int, array: Int16Array): boolean => value === 3 || value === 99,
      );
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_5700
     * @tc.name testInt16ArrayFindIndexTestOne057
     * @tc.desc Verify findIndex predicate based only on specific index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => index === 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_5800
     * @tc.name testInt16ArrayFindIndexTestOne058
     * @tc.desc Verify findIndex predicate matches even index values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 11, 12, 13, 14]);
      let result: int = arr.findIndex(
        (value: number, index: int, array: Int16Array): boolean => index % 2 === 0 && value > 12,
      );
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_5900
     * @tc.name testInt16ArrayFindIndexTestOne059
     * @tc.desc Verify findIndex predicate combining value and index conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 5, 5, 5, 5]);
      let result: int = arr.findIndex(
        (value: number, index: int, array: Int16Array): boolean => value === 5 && index === 3,
      );
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_6000
     * @tc.name testInt16ArrayFindIndexTestOne060
     * @tc.desc Verify findIndex predicate mutates external let flag variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let flag = false;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        if (value === 2) {
          flag = true;
          return true;
        }
        return false;
      });
      expect(flag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_6100
     * @tc.name testInt16ArrayFindIndexTestOne061
     * @tc.desc Verify findIndex predicate increments external counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let count = 0;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        count++;
        return false;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_6200
     * @tc.name testInt16ArrayFindIndexTestOne062
     * @tc.desc Verify findIndex predicate $_set mutates current index element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        array.$_set(index, 99);
        return value === 2;
      });
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_6300
     * @tc.name testInt16ArrayFindIndexTestOne063
     * @tc.desc Verify findIndex predicate $_set mutates later unchecked elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 50, 4]);
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(2, 3);
        }
        return value === 3;
      });
      let r1: number = arr.$_get(2);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_6400
     * @tc.name testInt16ArrayFindIndexTestOne064
     * @tc.desc Verify findIndex result unaffected by $_set on already checked elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index > 0) {
          array.$_set(0, 999);
        }
        return false;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_6500
     * @tc.name testInt16ArrayFindIndexTestOne065
     * @tc.desc Verify findIndex predicate $_get reads other positions to decide
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          return array.$_get(3) === 40;
        }
        return false;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_6600
     * @tc.name testInt16ArrayFindIndexTestOne066
     * @tc.desc Verify findIndex predicate uses array.$_get(index+1) lookahead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 99, 2, 3]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index < array.length - 1) {
          return array.$_get(index + 1) === 99;
        }
        return false;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_6700
     * @tc.name testInt16ArrayFindIndexTestOne067
     * @tc.desc Verify findIndex predicate uses array.length in condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        return index === array.length - 1;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_6800
     * @tc.name testInt16ArrayFindIndexTestOne068
     * @tc.desc Verify findIndex accepts module-level named function as predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 42, 3]);
      let result: int = arr.findIndex(matchTarget073);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_6900
     * @tc.name testInt16ArrayFindIndexTestOne069
     * @tc.desc Verify findIndex accepts arrow function as predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 99, 4]);
      const pred = (value: number, index: int, array: Int16Array): boolean => value === 99;
      let result: int = arr.findIndex(pred);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_7000
     * @tc.name testInt16ArrayFindIndexTestOne070
     * @tc.desc Verify findIndex call count equals length when all predicates false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let callCount: int = 0;
      arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
        callCount++;
        return false;
      });
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_7100
     * @tc.name testInt16ArrayFindIndexTestOne071
     * @tc.desc Verify findIndex length-2 match on last element returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 99]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 99);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_7200
     * @tc.name testInt16ArrayFindIndexTestOne072
     * @tc.desc Verify findIndex all-zero array matching 0 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_7300
     * @tc.name testInt16ArrayFindIndexTestOne073
     * @tc.desc Verify findIndex works on Int16Array constructed from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf, 0, 3);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_7400
     * @tc.name testInt16ArrayFindIndexTestOne074
     * @tc.desc Verify findIndex works on Int16Array.from constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: number[] = [4, 8, 12];
      const arr = Int16Array.from(source);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 8);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_7500
     * @tc.name testInt16ArrayFindIndexTestOne075
     * @tc.desc Verify typeof findIndex match result is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const result: int = arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => true);
      let r1: string = typeof result;
      let e1: string = 'int';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_7600
     * @tc.name testInt16ArrayFindIndexTestOne076
     * @tc.desc Verify typeof findIndex empty array result is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      const result: int = arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => true);
      let r1: string = typeof result;
      let e1: string = 'int';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_7700
     * @tc.name testInt16ArrayFindIndexTestOne077
     * @tc.desc Verify findIndex match returns index 1 with strict equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(5, 10, 15);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_7800
     * @tc.name testInt16ArrayFindIndexTestOne078
     * @tc.desc Verify findIndex miss returns -1 with strict equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const result: int = arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => false);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_7900
     * @tc.name testInt16ArrayFindIndexTestOne079
     * @tc.desc Verify findIndex result is defined and equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(7, 8, 9);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_8000
     * @tc.name testInt16ArrayFindIndexTestOne080
     * @tc.desc Verify findIndex result is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(3, 6, 9);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 6);
      let r1: boolean = isNaN(result);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_8100
     * @tc.name testInt16ArrayFindIndexTestOne081
     * @tc.desc Verify findIndex result is finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(2, 4, 6);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 3);
      let r1: boolean = isFinite(result);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_8200
     * @tc.name testInt16ArrayFindIndexTestOne082
     * @tc.desc Verify findIndex result participates in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 20);
      let r1: number = result + 0;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_8300
     * @tc.name testInt16ArrayFindIndexTestOne083
     * @tc.desc Verify findIndex match result typeof is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 200, 300);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 200);
      let r1: string = typeof result;
      let e1: string = 'int';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_8400
     * @tc.name testInt16ArrayFindIndexTestOne084
     * @tc.desc Verify findIndex result assignable to int variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const idx: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_8500
     * @tc.name testInt16ArrayFindIndexTestOne085
     * @tc.desc Verify findIndex multi-element first match returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 0, 0, 0);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_ONE_8600
     * @tc.name testInt16ArrayFindIndexTestOne086
     * @tc.desc Verify findIndex always-true predicate returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(5, 10, 15);
      const result: int = arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => true);
      expect(result).assertEqual(0);
    });

  });
}
