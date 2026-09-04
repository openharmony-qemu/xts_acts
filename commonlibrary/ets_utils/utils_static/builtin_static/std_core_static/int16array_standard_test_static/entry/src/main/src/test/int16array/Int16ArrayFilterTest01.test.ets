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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Int16ArrayFilterTest01(): void {
  describe('Int16ArrayFilterTest01', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_0100
     * @tc.name testInt16ArrayFilterTestOne001
     * @tc.desc Verify filter with one callback returns an independent Int16Array with expected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: Int16Array = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 0;
      });
      let resultLength: int = result.length;
      let expectedResultLength: int = 3;
      expect(resultLength).assertEqual(expectedResultLength);
      let resultElement0: number = result.$_get(0);
      let expectedResultElement0: int = 1;
      expect(resultElement0).assertEqual(expectedResultElement0);
      let resultElement1: number = result.$_get(1);
      let expectedResultElement1: int = 2;
      expect(resultElement1).assertEqual(expectedResultElement1);
      let resultElement2: number = result.$_get(2);
      let expectedResultElement2: int = 3;
      expect(resultElement2).assertEqual(expectedResultElement2);
      expect(result.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_0200
     * @tc.name testInt16ArrayFilterTestOne002
     * @tc.desc Verify filter arrow using all three params keeps values above first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, 10, 15);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > array.$_get(0);
      });
      let resultLength: int = result.length;
      let expectedResultLength: int = 2;
      expect(resultLength).assertEqual(expectedResultLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_0300
     * @tc.name testInt16ArrayFilterTestOne003
     * @tc.desc Verify filter always-true returns all elements including MIN/MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-32768, -1, 0, 1, 32767);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return true;
      });
      let resultLength: int = result.length;
      let expectedResultLength: int = 5;
      expect(resultLength).assertEqual(expectedResultLength);
      let resultElement0: number = result.$_get(0);
      let expectedResultElement0: int = -32768;
      expect(resultElement0).assertEqual(expectedResultElement0);
      let resultElement4: number = result.$_get(4);
      let expectedResultElement4: int = 32767;
      expect(resultElement4).assertEqual(expectedResultElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_0400
     * @tc.name testInt16ArrayFilterTestOne004
     * @tc.desc Verify filter keeps only positive elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-3, -1, 0, 2, 5);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > 0;
      });
      let resultLength: int = result.length;
      let expectedResultLength: int = 2;
      expect(resultLength).assertEqual(expectedResultLength);
      let resultElement0: number = result.$_get(0);
      let expectedResultElement0: int = 2;
      expect(resultElement0).assertEqual(expectedResultElement0);
      let resultElement1: number = result.$_get(1);
      let expectedResultElement1: int = 5;
      expect(resultElement1).assertEqual(expectedResultElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_0500
     * @tc.name testInt16ArrayFilterTestOne005
     * @tc.desc Verify filter keeps only negative elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-5, -1, 0, 1, 5);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val < 0;
      });
      let resultLength: int = result.length;
      let expectedResultLength: int = 2;
      expect(resultLength).assertEqual(expectedResultLength);
      let resultElement0: number = result.$_get(0);
      let expectedResultElement0: int = -5;
      expect(resultElement0).assertEqual(expectedResultElement0);
      let resultElement1: number = result.$_get(1);
      let expectedResultElement1: int = -1;
      expect(resultElement1).assertEqual(expectedResultElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_0600
     * @tc.name testInt16ArrayFilterTestOne006
     * @tc.desc Verify filter callback val receives int16 MIN -32768 from single-element Int16Array.of source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = -32768;
      let arr: Int16Array = Int16Array.of(inputValue);
      let receivedVal: number = 0;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        receivedVal = val;
        return true;
      });
      expect(receivedVal).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_0700
     * @tc.name testInt16ArrayFilterTestOne007
     * @tc.desc Verify filter callback captures vals [-32768, 0, 32767] from Int16Array.of three-element source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-32768, 0, 32767);
      let receivedVals: number[] = [];
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        receivedVals.push(val);
        return true;
      });
      let receivedValsLength: int = receivedVals.length;
      let expectedReceivedValsLength: int = 3;
      expect(receivedValsLength).assertEqual(expectedReceivedValsLength);
      let receivedValsElement0: number = receivedVals[0];
      let expectedReceivedValsElement0: int = -32768;
      expect(receivedValsElement0).assertEqual(expectedReceivedValsElement0);
      let receivedValsElement1: number = receivedVals[1];
      let expectedReceivedValsElement1: int = 0;
      expect(receivedValsElement1).assertEqual(expectedReceivedValsElement1);
      let receivedValsElement2: number = receivedVals[2];
      let expectedReceivedValsElement2: int = 32767;
      expect(receivedValsElement2).assertEqual(expectedReceivedValsElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_0800
     * @tc.name testInt16ArrayFilterTestOne008
     * @tc.desc Verify filter callback vals are all negative for negative source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-100, -50, -1);
      let allNegative: boolean = true;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (val >= 0) {
          allNegative = false;
        }
        return true;
      });
      expect(allNegative).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_0900
     * @tc.name testInt16ArrayFilterTestOne009
     * @tc.desc Verify filter callback val is truncated overflow 32768 to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(1);
      arr.$_set(0, 32768);
      let receivedVal: number = 0;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        receivedVal = val;
        return true;
      });
      expect(receivedVal).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_1000
     * @tc.name testInt16ArrayFilterTestOne010
     * @tc.desc Verify filter first index 0 and last index length-1 on five elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      let firstIdx: number = -1;
      let lastIdx: number = -1;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (firstIdx === -1) {
          firstIdx = index;
        }
        lastIdx = index;
        return true;
      });
      expect(firstIdx).assertEqual(0);
      expect(lastIdx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_1100
     * @tc.name testInt16ArrayFilterTestOne011
     * @tc.desc Verify filter callback indexes increase strictly by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40);
      let prevIndex: number = -1;
      let isMonotonic: boolean = true;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (prevIndex !== -1 && index !== prevIndex + 1) {
          isMonotonic = false;
        }
        prevIndex = index;
        return true;
      });
      expect(isMonotonic).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_1200
     * @tc.name testInt16ArrayFilterTestOne012
     * @tc.desc Verify filter callback array.length equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40);
      let arrayLenMatches: boolean = true;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (array.length !== 4) {
          arrayLenMatches = false;
        }
        return true;
      });
      expect(arrayLenMatches).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_1300
     * @tc.name testInt16ArrayFilterTestOne013
     * @tc.desc Verify filter callback array.$_get(0) matches source first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(77, 88, 99);
      let firstElemMatch: boolean = false;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (array.$_get(0) === 77 && array.$_get(0) === arr.$_get(0)) {
          firstElemMatch = true;
        }
        return true;
      });
      expect(firstElemMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_1400
     * @tc.name testInt16ArrayFilterTestOne014
     * @tc.desc Verify filter callback array BYTES_PER_ELEMENT equals source value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 1;
      let arr: Int16Array = Int16Array.of(inputValue);
      let bytesPerElement: number = 0;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        bytesPerElement = array.BYTES_PER_ELEMENT;
        return true;
      });
      let expectedBytesPerElement: int = 2;
      expect(bytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_1500
     * @tc.name testInt16ArrayFilterTestOne015
     * @tc.desc Verify filter callback values on new Int16Array array-like source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([-1, 0, 1]);
      let vals: number[] = [];
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        vals.push(val);
        return true;
      });
      let valsElement0: number = vals[0];
      let expectedValsElement0: int = -1;
      expect(valsElement0).assertEqual(expectedValsElement0);
      let valsElement1: number = vals[1];
      let expectedValsElement1: int = 0;
      expect(valsElement1).assertEqual(expectedValsElement1);
      let valsElement2: number = vals[2];
      let expectedValsElement2: int = 1;
      expect(valsElement2).assertEqual(expectedValsElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_1600
     * @tc.name testInt16ArrayFilterTestOne016
     * @tc.desc Verify filter callback values on Int16Array.from constructed source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.from([50, -50, 0]);
      let vals: number[] = [];
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        vals.push(val);
        return true;
      });
      let valsElement0: number = vals[0];
      let expectedValsElement0: int = 50;
      expect(valsElement0).assertEqual(expectedValsElement0);
      let valsElement1: number = vals[1];
      let expectedValsElement1: int = -50;
      expect(valsElement1).assertEqual(expectedValsElement1);
      let valsElement2: number = vals[2];
      let expectedValsElement2: int = 0;
      expect(valsElement2).assertEqual(expectedValsElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_1700
     * @tc.name testInt16ArrayFilterTestOne017
     * @tc.desc Verify filter callback values on Int16Array from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let view: Int16Array = new Int16Array(buf);
      view.$_set(0, 7);
      view.$_set(1, 14);
      view.$_set(2, 21);
      let vals: number[] = [];
      view.filter((val: number, index: int, array: Int16Array): boolean => {
        vals.push(val);
        return true;
      });
      let valsElement0: number = vals[0];
      let expectedValsElement0: int = 7;
      expect(valsElement0).assertEqual(expectedValsElement0);
      let valsElement1: number = vals[1];
      let expectedValsElement1: int = 14;
      expect(valsElement1).assertEqual(expectedValsElement1);
      let valsElement2: number = vals[2];
      let expectedValsElement2: int = 21;
      expect(valsElement2).assertEqual(expectedValsElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_1800
     * @tc.name testInt16ArrayFilterTestOne018
     * @tc.desc Verify filter uses updated closure variable after modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let limit: number = 0;
      let arr = Int16Array.of(-5, 0, 5, 10);
      limit = 3;
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val > limit;
      });
      let resultLength: int = result.length;
      let expectedResultLength: int = 2;
      expect(resultLength).assertEqual(expectedResultLength);
      let resultElement0: number = result.$_get(0);
      let expectedResultElement0: int = 5;
      expect(resultElement0).assertEqual(expectedResultElement0);
      let resultElement1: number = result.$_get(1);
      let expectedResultElement1: int = 10;
      expect(resultElement1).assertEqual(expectedResultElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_1900
     * @tc.name testInt16ArrayFilterTestOne019
     * @tc.desc Verify filter callback pushes each element to external array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let pushed: number[] = [];
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        pushed.push(val);
        return true;
      });
      let pushedLength: int = pushed.length;
      let expectedPushedLength: int = 3;
      expect(pushedLength).assertEqual(expectedPushedLength);
      let pushedElement0: number = pushed[0];
      let expectedPushedElement0: int = 10;
      expect(pushedElement0).assertEqual(expectedPushedElement0);
      let pushedElement2: number = pushed[2];
      let expectedPushedElement2: int = 30;
      expect(pushedElement2).assertEqual(expectedPushedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_2000
     * @tc.name testInt16ArrayFilterTestOne020
     * @tc.desc Verify filter callback sets external boolean flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wasCalled: boolean = false;
      let inputValue: int = 7;
      let arr: Int16Array = Int16Array.of(inputValue);
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        wasCalled = true;
        return true;
      });
      expect(wasCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_2100
     * @tc.name testInt16ArrayFilterTestOne021
     * @tc.desc Verify filter callback side-effect accumulation and even filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4);
      let total: number = 0;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        total = total + val;
        return val % 2 === 0;
      });
      expect(total).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_2200
     * @tc.name testInt16ArrayFilterTestOne022
     * @tc.desc Verify filter callback throw propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3);
      try {
        arr.filter((val: number, index: int, array: Int16Array): boolean => {
          throw new TypeError('callback error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_2300
     * @tc.name testInt16ArrayFilterTestOne023
     * @tc.desc Verify filter callback throw on first element propagates immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let callCount: number = 0;
      try {
        arr.filter((val: number, index: int, array: Int16Array): boolean => {
          callCount = callCount + 1;
          if (index === 0) {
            throw new TypeError('error at first');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_2400
     * @tc.name testInt16ArrayFilterTestOne024
     * @tc.desc Verify filter callback throw on middle element propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      try {
        arr.filter((val: number, index: int, array: Int16Array): boolean => {
          if (index === 2) {
            throw new TypeError('error at middle');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_2500
     * @tc.name testInt16ArrayFilterTestOne025
     * @tc.desc Verify filter callback throw on last element propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100, 200);
      try {
        arr.filter((val: number, index: int, array: Int16Array): boolean => {
          if (index === 1) {
            throw new TypeError('error at last');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_2600
     * @tc.name testInt16ArrayFilterTestOne026
     * @tc.desc Verify filter throw aborts and does not return partial result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, 10, 15);
      let result: Int16Array | null = null;
      try {
        result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
          if (index === 1) {
            throw new TypeError('abort');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_2700
     * @tc.name testInt16ArrayFilterTestOne027
     * @tc.desc Verify filter callback array.$_set mutates source for later callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3);
      let secondValSeen: number = 0;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          array.$_set(0, 99);
        }
        if (index === 1) {
          secondValSeen = array.$_get(0);
        }
        return true;
      });
      expect(secondValSeen).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_2800
     * @tc.name testInt16ArrayFilterTestOne028
     * @tc.desc Verify filter callback array.$_set next element visible later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let modifiedValSeen: number = 0;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        if (index === 1) {
          array.$_set(2, 0);
        }
        if (index === 2) {
          modifiedValSeen = val;
        }
        return true;
      });
      expect(modifiedValSeen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_2900
     * @tc.name testInt16ArrayFilterTestOne029
     * @tc.desc Verify filter current val unaffected after array.$_set on same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, 10, 15);
      let originalVals: number[] = [];
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        originalVals.push(val);
        array.$_set(index, 0);
        return true;
      });
      let originalValsElement0: number = originalVals[0];
      let expectedOriginalValsElement0: int = 5;
      expect(originalValsElement0).assertEqual(expectedOriginalValsElement0);
      let originalValsElement1: number = originalVals[1];
      let expectedOriginalValsElement1: int = 10;
      expect(originalValsElement1).assertEqual(expectedOriginalValsElement1);
      let originalValsElement2: number = originalVals[2];
      let expectedOriginalValsElement2: int = 15;
      expect(originalValsElement2).assertEqual(expectedOriginalValsElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_3000
     * @tc.name testInt16ArrayFilterTestOne030
     * @tc.desc Verify filter on empty Int16Array never invokes callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let called: boolean = false;
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        called = true;
        return true;
      });
      expect(called).assertFalse();
      let resultLength: int = result.length;
      let expectedResultLength: int = 0;
      expect(resultLength).assertEqual(expectedResultLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_3100
     * @tc.name testInt16ArrayFilterTestOne031
     * @tc.desc Verify filter on empty Int16Array returns empty non-null result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return true;
      });
      let resultLength: int = result.length;
      let expectedResultLength: int = 0;
      expect(resultLength).assertEqual(expectedResultLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_3200
     * @tc.name testInt16ArrayFilterTestOne032
     * @tc.desc Verify filter keeps single matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 42;
      let arr: Int16Array = Int16Array.of(inputValue);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val === 42;
      });
      let resultLength: int = result.length;
      let expectedResultLength: int = 1;
      expect(resultLength).assertEqual(expectedResultLength);
      let resultElement0: number = result.$_get(0);
      let expectedResultElement0: int = 42;
      expect(resultElement0).assertEqual(expectedResultElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_3300
     * @tc.name testInt16ArrayFilterTestOne033
     * @tc.desc Verify filter returns empty for non-matching single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 99;
      let arr: Int16Array = Int16Array.of(inputValue);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val < 0;
      });
      let resultLength: int = result.length;
      let expectedResultLength: int = 0;
      expect(resultLength).assertEqual(expectedResultLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_3400
     * @tc.name testInt16ArrayFilterTestOne034
     * @tc.desc Verify filter callback called 100 times for length-100 source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 100;
      let arr = new Int16Array(len.toInt());
      for (let i: number = 0; i < len; i = i + 1) {
        arr.$_set(i.toInt(), i.toInt());
      }
      let callCount: number = 0;
      arr.filter((val: number, index: int, array: Int16Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(callCount).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_3500
     * @tc.name testInt16ArrayFilterTestOne035
     * @tc.desc Verify filter even values on length-500 Int16Array returns 250
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 500;
      let arr = new Int16Array(len.toInt());
      for (let i: number = 0; i < len; i = i + 1) {
        arr.$_set(i.toInt(), i.toInt());
      }
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val % 2 === 0;
      });
      let resultLength: int = result.length;
      let expectedResultLength: int = 250;
      expect(resultLength).assertEqual(expectedResultLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_3600
     * @tc.name testInt16ArrayFilterTestOne036
     * @tc.desc Verify filter keeps -1 elements when predicate is val===-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-1, 0, 1, -1);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val === -1;
      });
      let resultLength: int = result.length;
      let expectedResultLength: int = 2;
      expect(resultLength).assertEqual(expectedResultLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_3700
     * @tc.name testInt16ArrayFilterTestOne037
     * @tc.desc Verify filter keeps non-negative values including 0 and MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-32768, -1, 0, 1, 32767);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val >= 0;
      });
      let resultLength: int = result.length;
      let expectedResultLength: int = 3;
      expect(resultLength).assertEqual(expectedResultLength);
      let resultElement0: number = result.$_get(0);
      let expectedResultElement0: int = 0;
      expect(resultElement0).assertEqual(expectedResultElement0);
      let resultElement1: number = result.$_get(1);
      let expectedResultElement1: int = 1;
      expect(resultElement1).assertEqual(expectedResultElement1);
      let resultElement2: number = result.$_get(2);
      let expectedResultElement2: int = 32767;
      expect(resultElement2).assertEqual(expectedResultElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_3800
     * @tc.name testInt16ArrayFilterTestOne038
     * @tc.desc Verify filter keeps values within closed range [-100,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-200, -100, -1, 0, 1, 100, 200);
      let result = arr.filter((val: number, index: int, array: Int16Array): boolean => {
        return val >= -100 && val <= 100;
      });
      let resultLength: int = result.length;
      let expectedResultLength: int = 5;
      expect(resultLength).assertEqual(expectedResultLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_3900
     * @tc.name testInt16ArrayFilterTestOne039
     * @tc.desc Verify filter() result element at index 0 equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15, 20]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value >= 10;
      });
      let actualFirst: number = result.$_get(0);
      let expectedFirst: int = 10;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_4000
     * @tc.name testInt16ArrayFilterTestOne040
     * @tc.desc Verify filter() with constant false callback yields empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return false;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_4100
     * @tc.name testInt16ArrayFilterTestOne041
     * @tc.desc Verify filter(true) result.$_get(lastIdx) equals original.$_get(lastIdx)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let lastIdx: int = arr.length - 1;
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return true;
      });
      let actualFirst: number = result.$_get(lastIdx);
      let expectedFirst: int = 30;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_4200
     * @tc.name testInt16ArrayFilterTestOne042
     * @tc.desc Verify filter(true) result equals original values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 15, 25, 35]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return true;
      });
      let allMatch: boolean = true;
      for (let i: int = 0; i < result.length; i++) {
        if (result.$_get(i) !== arr.$_get(i)) {
          allMatch = false;
          break;
        }
      }
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_4300
     * @tc.name testInt16ArrayFilterTestOne043
     * @tc.desc Verify filter() via $_get iteration keeps only positive values from mixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-5, -1, 0, 3, 8, -2]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 0;
      });
      let allPositive: boolean = true;
      for (let i: int = 0; i < result.length; i++) {
        if (result.$_get(i) <= 0) {
          allPositive = false;
          break;
        }
      }
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_4400
     * @tc.name testInt16ArrayFilterTestOne044
     * @tc.desc Verify filter() result $_get values equal expected sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, -3, 0, -8, 1, -2]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value < 0;
      });
      let actualFirst: number = result.$_get(0);
      let expectedFirst: int = -3;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = result.$_get(1);
      let expectedSecond: int = -8;
      expect(actualSecond).assertEqual(expectedSecond);
      let actualThird: number = result.$_get(2);
      let expectedThird: int = -2;
      expect(actualThird).assertEqual(expectedThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_4500
     * @tc.name testInt16ArrayFilterTestOne045
     * @tc.desc Verify filter() result length equals expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, -1, 0, 5, 0, 3]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value === 0;
      });
      let actualFirst: int = result.length;
      let expectedFirst: int = 3;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_4600
     * @tc.name testInt16ArrayFilterTestOne046
     * @tc.desc Verify filter() keeps Int16.MAX 32767 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32767, -100, 32767, 0, 32767]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value === 32767;
      });
      let allMax: boolean = true;
      for (let i: int = 0; i < result.length; i++) {
        if (result.$_get(i) !== 32767) {
          allMax = false;
          break;
        }
      }
      expect(allMax).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_4700
     * @tc.name testInt16ArrayFilterTestOne047
     * @tc.desc Verify filter() result supports $_set then $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 2;
      });
      result.$_set(0, 99);
      let actualFirst: number = result.$_get(0);
      let expectedFirst: int = 99;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_4800
     * @tc.name testInt16ArrayFilterTestOne048
     * @tc.desc Verify filter() with false callback gives empty result.length on 5-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return false;
      });
      let actualFirst: int = result.length;
      let expectedFirst: int = 0;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_4900
     * @tc.name testInt16ArrayFilterTestOne049
     * @tc.desc Verify filter() on empty Int16Array with true callback keeps length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return true;
      });
      let actualString: string = result.toString();
      let expectedString: string = '';
      expect(actualString).assertEqual(expectedString);
      let actualFirst: int = result.length;
      let expectedFirst: int = 0;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_5000
     * @tc.name testInt16ArrayFilterTestOne050
     * @tc.desc Verify filter() with false callback yields empty result.byteLength of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return false;
      });
      let actualString: string = result.toString();
      let expectedString: string = '';
      expect(actualString).assertEqual(expectedString);
      let actualFirst: int = result.byteLength;
      let expectedFirst: int = 0;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_5100
     * @tc.name testInt16ArrayFilterTestOne051
     * @tc.desc Verify filter() on buffer view returns byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf, 2, 3);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 5;
      });
      let actualString: string = result.toString();
      let expectedString: string = '10,20,30';
      expect(actualString).assertEqual(expectedString);
      let actualFirst: int = result.byteOffset;
      let expectedFirst: int = 0;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_5200
     * @tc.name testInt16ArrayFilterTestOne052
     * @tc.desc Verify filter() result.buffer is independent from original.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 2;
      });
      let actualString: string = result.toString();
      let expectedString: string = '3,4';
      expect(actualString).assertEqual(expectedString);
      expect(result.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_5300
     * @tc.name testInt16ArrayFilterTestOne053
     * @tc.desc Verify filter() result $_set does not alter original $_get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return true;
      });
      result.$_set(0, 999);
      let actualString: string = result.toString();
      let expectedString: string = '999,20,30';
      expect(actualString).assertEqual(expectedString);
      let actualFirst: number = arr.$_get(0);
      let expectedFirst: int = 10;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_5400
     * @tc.name testInt16ArrayFilterTestOne054
     * @tc.desc Verify two filter() results share independent buffers via $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      let evenResultA: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value % 2 === 0;
      });
      let evenResultB: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value % 2 === 0;
      });
      let actualStringA: string = evenResultA.toString();
      let expectedStringA: string = '2,4,6';
      expect(actualStringA).assertEqual(expectedStringA);
      let actualStringB: string = evenResultB.toString();
      let expectedStringB: string = '2,4,6';
      expect(actualStringB).assertEqual(expectedStringB);
      evenResultA.$_set(0, 999);
      let actualFirst: number = evenResultB.$_get(0);
      let expectedFirst: int = 2;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_5500
     * @tc.name testInt16ArrayFilterTestOne055
     * @tc.desc Verify filter().filter() intermediate buffer independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      let intermediate: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 1;
      });
      let filled: Int16Array = intermediate.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 3;
      });
      let actualIntermediate: string = intermediate.toString();
      let expectedIntermediate: string = '2,3,4,5,6';
      expect(actualIntermediate).assertEqual(expectedIntermediate);
      let actualFilled: string = filled.toString();
      let expectedFilled: string = '4,5,6';
      expect(actualFilled).assertEqual(expectedFilled);
      intermediate.$_set(0, 999);
      let actualFirst: number = filled.$_get(0);
      let expectedFirst: int = 4;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_5600
     * @tc.name testInt16ArrayFilterTestOne056
     * @tc.desc Verify filter() does not change original.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let origLen: int = arr.length;
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 2;
      });
      let actualString: string = result.toString();
      let expectedString: string = '3,4,5';
      expect(actualString).assertEqual(expectedString);
      let actualFirst: int = arr.length;
      let expectedFirst: number = origLen;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_5700
     * @tc.name testInt16ArrayFilterTestOne057
     * @tc.desc Verify filter() does not change original.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let origByteLen: int = arr.byteLength;
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 3;
      });
      let actualFirst: int = arr.byteLength;
      let expectedFirst: number = origByteLen;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_5800
     * @tc.name testInt16ArrayFilterTestOne058
     * @tc.desc Verify filter() original array unchanged after filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14, 21, 28, 35]);
      let snapshot: Int16Array = new Int16Array([7, 14, 21, 28, 35]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 15;
      });
      let unchanged: boolean = true;
      for (let i: int = 0; i < arr.length; i++) {
        if (arr.$_get(i) !== snapshot.$_get(i)) {
          unchanged = false;
          break;
        }
      }
      expect(unchanged).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_5900
     * @tc.name testInt16ArrayFilterTestOne059
     * @tc.desc Verify chained filter().fill(0) sets element at index 0 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let filtered: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 2;
      });
      let result: Int16Array = filtered.fill(0);
      let actualFirst: number = result.$_get(0);
      let expectedFirst: int = 0;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_6000
     * @tc.name testInt16ArrayFilterTestOne060
     * @tc.desc Verify chained filter().sort() result element at index 0 equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 3, 1, 4, 2]);
      let filtered: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 1;
      });
      let result: Int16Array = filtered.sort();
      let actualFirst: number = result.$_get(0);
      let expectedFirst: int = 2;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_6100
     * @tc.name testInt16ArrayFilterTestOne061
     * @tc.desc Verify chained filter().map(fn) result element at index 0 equals 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let filtered: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 2;
      });
      let result: Int16Array = filtered.map((value: number, index: int, array: Int16Array): number => {
        return value * 2;
      });
      let actualFirst: number = result.$_get(0);
      let expectedFirst: int = 6;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_6200
     * @tc.name testInt16ArrayFilterTestOne062
     * @tc.desc Verify chained filter().filter() equals single filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      let chainTmp: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 2;
      });
      let chainResult: Int16Array = chainTmp.filter((value: number, index: int, array: Int16Array): boolean => {
        return value < 6;
      });
      let singleResult: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 2 && value < 6;
      });
      let equivalent: boolean = true;
      for (let i: int = 0; i < chainResult.length; i++) {
        if (chainResult.$_get(i) !== singleResult.$_get(i)) {
          equivalent = false;
          break;
        }
      }
      expect(equivalent).assertTrue();
      let actualFirst: int = chainResult.length;
      let expectedFirst: number = singleResult.length;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_6300
     * @tc.name testInt16ArrayFilterTestOne063
     * @tc.desc Verify chained filter().fill(0) sets all elements to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      let filtered: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 2;
      });
      let result: Int16Array = filtered.fill(0);
      let allZero: boolean = true;
      for (let i: int = 0; i < result.length; i++) {
        if (result.$_get(i) !== 0) {
          allZero = false;
          break;
        }
      }
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_6400
     * @tc.name testInt16ArrayFilterTestOne064
     * @tc.desc Verify chained filter().reverse() reverses element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let filtered: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return true;
      });
      let result: Int16Array = filtered.reverse();
      let actualFirst: number = result.$_get(0);
      let expectedFirst: int = 50;
      expect(actualFirst).assertEqual(expectedFirst);
      let actualSecond: number = result.$_get(4);
      let expectedSecond: int = 10;
      expect(actualSecond).assertEqual(expectedSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_6500
     * @tc.name testInt16ArrayFilterTestOne065
     * @tc.desc Verify chained filter().sort() sorts elements in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([30, 10, 50, 20, 40]);
      let filtered: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return true;
      });
      let result: Int16Array = filtered.sort();
      let sorted: boolean = true;
      for (let i: int = 1; i < result.length; i++) {
        if (result.$_get(i - 1) > result.$_get(i)) {
          sorted = false;
          break;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_6600
     * @tc.name testInt16ArrayFilterTestOne066
     * @tc.desc Verify filter() callback throws RangeError at index=0 and source array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      try {
        arr.filter((value: number, index: int, array: Int16Array): boolean => {
          throw new RangeError('range error at start');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualFirstElement: number = arr.$_get(0);
      let expectedFirstElement: int = 1;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualFourthElement: number = arr.$_get(3);
      let expectedFourthElement: int = 4;
      expect(actualFourthElement).assertEqual(expectedFourthElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_6700
     * @tc.name testInt16ArrayFilterTestOne067
     * @tc.desc Verify filter() callback throws TypeError at index=0 and error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      try {
        arr.filter((value: number, index: int, array: Int16Array): boolean => {
          throw new TypeError('type error at first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_6800
     * @tc.name testInt16ArrayFilterTestOne068
     * @tc.desc Verify filter() callback throws TypeError at last index and source array remains intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([50, 60, 70, 80]);
      try {
        arr.filter((value: number, index: int, array: Int16Array): boolean => {
          if (index === arr.length - 1) {
            throw new TypeError('last element error');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      let actualFirstElement: number = arr.$_get(0);
      let expectedFirstElement: int = 50;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualFourthElement: number = arr.$_get(3);
      let expectedFourthElement: int = 80;
      expect(actualFourthElement).assertEqual(expectedFourthElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_6900
     * @tc.name testInt16ArrayFilterTestOne069
     * @tc.desc Verify filter() callback throws TypeError at middle index=2 and error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      try {
        arr.filter((value: number, index: int, array: Int16Array): boolean => {
          if (index === 2) {
            throw new TypeError('middle iteration abort');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_7000
     * @tc.name testInt16ArrayFilterTestOne070
     * @tc.desc Verify filter() callback throws TypeError on single-element array and error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      try {
        arr.filter((value: number, index: int, array: Int16Array): boolean => {
          throw new TypeError('single element throw');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_7100
     * @tc.name testInt16ArrayFilterTestOne071
     * @tc.desc Verify filter() external counter keeps pre-throw increment after callback throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let callCount: int = 0;
      try {
        arr.filter((value: number, index: int, array: Int16Array): boolean => {
          callCount = callCount + 1;
          if (index === 2) {
            throw new TypeError('third call fails');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_7200
     * @tc.name testInt16ArrayFilterTestOne072
     * @tc.desc Verify filter() external boolean flag stays true after callback throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15]);
      let entered: boolean = false;
      try {
        arr.filter((value: number, index: int, array: Int16Array): boolean => {
          entered = true;
          if (index === 1) {
            throw new TypeError('second call abort');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(entered).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_7300
     * @tc.name testInt16ArrayFilterTestOne073
     * @tc.desc Verify filter() side Int16Array mutation before throw remains visible after catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3]);
      let side: Int16Array = new Int16Array([0, 0, 0]);
      try {
        src.filter((value: number, index: int, array: Int16Array): boolean => {
          side.$_set(0, 999);
          if (index === 0) {
            throw new TypeError('immediate throw');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      let actualFirstElement: number = side.$_get(0);
      let expectedFirstElement: int = 999;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_7400
     * @tc.name testInt16ArrayFilterTestOne074
     * @tc.desc Verify filter() nested try-catch rethrows and outer catch still observes the error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 6, 9]);
      try {
        try {
          arr.filter((value: number, index: int, array: Int16Array): boolean => {
            throw new TypeError('inner error');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
          throw e;
        }
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_7500
     * @tc.name testInt16ArrayFilterTestOne075
     * @tc.desc Verify filter() second call succeeds after first filter() threw TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 8, 9]);
      try {
        arr.filter((value: number, index: int, array: Int16Array): boolean => {
          throw new TypeError('first filter fails');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      let result: Int16Array = arr.filter((value: number): boolean => value > 7);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = 8;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualSecondElement: number = result.$_get(1);
      let expectedSecondElement: int = 9;
      expect(actualSecondElement).assertEqual(expectedSecondElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_7600
     * @tc.name testInt16ArrayFilterTestOne076
     * @tc.desc Verify filter() throws when specific value appears and remaining elements are not processed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 100, 200]);
      try {
        arr.filter((value: number, index: int, array: Int16Array): boolean => {
          if (value === 100) {
            throw new TypeError('triggered by value 100');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_7700
     * @tc.name testInt16ArrayFilterTestOne077
     * @tc.desc Verify filter() on empty array never calls callback and returns empty Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let called: boolean = false;
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        called = true;
        throw new TypeError('should never execute');
      });
      expect(called).assertFalse();
      let actualLength: int = result.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILTER_ONE_7800
     * @tc.name testInt16ArrayFilterTestOne078
     * @tc.desc Verify filter() explicit boolean predicate keeps elements above 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFilterTestOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let result: Int16Array = arr.filter((value: number, index: int, array: Int16Array): boolean => {
        return value > 25;
      });
      let actualLength: int = result.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = 30;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualSecondElement: number = result.$_get(1);
      let expectedSecondElement: int = 40;
      expect(actualSecondElement).assertEqual(expectedSecondElement);
    });

  });
}
