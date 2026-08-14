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

interface Accumulator {
  total: number;
  count: number;
}

export default function int8ArrayForEachPart01Test(): void {
  describe('Int8ArrayForEachPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_0100
     * @tc.name int8ArrayForEachPart01Test001
     * @tc.desc Verify forEach expects 3, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let count: number = 0;
      arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_0200
     * @tc.name int8ArrayForEachPart01Test002
     * @tc.desc Verify forEach expects 0, on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let received: number = 999;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        received = value;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_0300
     * @tc.name int8ArrayForEachPart01Test003
     * @tc.desc Verify forEach expects INT8_MAX, on new Int8Array([INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let received: number = 999;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        received = value;
      });
      expect(received).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_0400
     * @tc.name int8ArrayForEachPart01Test004
     * @tc.desc Verify forEach expects -128, on new Int8Array([-128])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128]);
      let received: number = 999;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        received = value;
      });
      expect(received).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_0500
     * @tc.name int8ArrayForEachPart01Test005
     * @tc.desc Verify forEach expects -1, on new Int8Array([-1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1]);
      let received: number = 999;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        received = value;
      });
      expect(received).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_0600
     * @tc.name int8ArrayForEachPart01Test006
     * @tc.desc Verify forEach expects -128, on new Int8Array([128])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([128]);
      let received: number = 0;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        received = value;
      });
      expect(received).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_0700
     * @tc.name int8ArrayForEachPart01Test007
     * @tc.desc Verify forEach expects INT8_MAX, on new Int8Array([-129])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-129]);
      let received: number = 0;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        received = value;
      });
      expect(received).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_0800
     * @tc.name int8ArrayForEachPart01Test008
     * @tc.desc Verify forEach passes truncated value -1 for constructor input 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([255]);
      let received: number = 0;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        received = value;
      });
      expect(received).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_0900
     * @tc.name int8ArrayForEachPart01Test009
     * @tc.desc Verify forEach expects 0, on new Int8Array([256])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([256]);
      let received: number = 999;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        received = value;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_1000
     * @tc.name int8ArrayForEachPart01Test010
     * @tc.desc Verify forEach passes value 0 for constructor input Number.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([Number.NaN]);
      let received: number = 999;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        received = value;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_1100
     * @tc.name int8ArrayForEachPart01Test011
     * @tc.desc Verify forEach expects 1, on new Int8Array([1.9])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1.9]);
      let received: number = 0;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        received = value;
      });
      expect(received).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_1200
     * @tc.name int8ArrayForEachPart01Test012
     * @tc.desc Verify forEach expects -1, on new Int8Array([-1.9])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1.9]);
      let received: number = 0;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        received = value;
      });
      expect(received).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_1300
     * @tc.name int8ArrayForEachPart01Test013
     * @tc.desc Verify forEach passes value 0 for constructor input -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-0.0]);
      let received: number = 999;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        received = value;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_1400
     * @tc.name int8ArrayForEachPart01Test014
     * @tc.desc Verify forEach passes ascending index 0, on new Int8Array([42])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let receivedIndex: int = -1;
      arr.forEach((_value: number, index: int, _array: Int8Array): void => {
        receivedIndex = index;
      });
      expect(receivedIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_1500
     * @tc.name int8ArrayForEachPart01Test015
     * @tc.desc Verify forEach passes ascending indices 0, 1, 2, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let indices: Array<int> = [];
      arr.forEach((_value: number, index: int, _array: Int8Array): void => {
        indices.push(index);
      });
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_1600
     * @tc.name int8ArrayForEachPart01Test016
     * @tc.desc Verify forEach passes ascending indices 0-3, on new Int8Array([5, 6, 7, 8])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6, 7, 8]);
      let prevIndex: int = -1;
      let isIncrementing: boolean = true;
      arr.forEach((_value: number, index: int, _array: Int8Array): void => {
        if (prevIndex >= 0) {
          if (index != prevIndex + 1) {
            isIncrementing = false;
          }
        }
        prevIndex = index;
      });
      expect(isIncrementing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_1700
     * @tc.name int8ArrayForEachPart01Test017
     * @tc.desc Verify forEach passes last index 3, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let lastIndex: int = -1;
      arr.forEach((_value: number, index: int, _array: Int8Array): void => {
        lastIndex = index;
      });
      expect(lastIndex).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_1800
     * @tc.name int8ArrayForEachPart01Test018
     * @tc.desc Verify forEach expects 100, on new Int8Array([100, 110, 120])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([100, 110, 120]);
      let pairs: Array<number> = [];
      arr.forEach((value: number, index: int, _array: Int8Array): void => {
        pairs.push(value - index);
      });
      expect(pairs[0]).assertEqual(100);
      expect(pairs[1]).assertEqual(109);
      expect(pairs[2]).assertEqual(118);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_1900
     * @tc.name int8ArrayForEachPart01Test019
     * @tc.desc Verify forEach passes array argument with length 3, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let receivedLength: number = 0;
      arr.forEach((_value: number, _index: int, array: Int8Array): void => {
        receivedLength = array.length;
      });
      expect(receivedLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_2000
     * @tc.name int8ArrayForEachPart01Test020
     * @tc.desc Verify forEach expects 4, on new Int8Array([7, 8, 9, 10])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8, 9, 10]);
      let receivedLength: number = 0;
      arr.forEach((_value: number, _index: int, array: Int8Array): void => {
        receivedLength = array.length;
      });
      expect(receivedLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_2100
     * @tc.name int8ArrayForEachPart01Test021
     * @tc.desc Verify forEach instanceof check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let isInt8Array: boolean = false;
      arr.forEach((_value: number, _index: int, array: Int8Array): void => {
        if (array instanceof Int8Array) {
          isInt8Array = true;
        }
      });
      expect(isInt8Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_2200
     * @tc.name int8ArrayForEachPart01Test022
     * @tc.desc Verify forEach invokes callback once per element, 3 times, on new Int8Array([15, 25, 35])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([15, 25, 35]);
      let matchCount: number = 0;
      arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
        matchCount = matchCount + 1;
      });
      expect(matchCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_2300
     * @tc.name int8ArrayForEachPart01Test023
     * @tc.desc Verify forEach passes array argument with length 4, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let receivedLength: number = 0;
      arr.forEach((_value: number, _index: int, array: Int8Array): void => {
        receivedLength = array.length;
      });
      expect(receivedLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_2400
     * @tc.name int8ArrayForEachPart01Test024
     * @tc.desc Verify forEach expects 0, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let callCount: number = 0;
      arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
        callCount = callCount + 1;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_2500
     * @tc.name int8ArrayForEachPart01Test025
     * @tc.desc Verify forEach expects 1, on new Int8Array([1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let callCount: number = 0;
      arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
        callCount = callCount + 1;
      });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_2600
     * @tc.name int8ArrayForEachPart01Test026
     * @tc.desc Verify forEach expects 100, on new Int8Array(100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      let callCount: number = 0;
      arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
        callCount = callCount + 1;
      });
      expect(callCount).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_2700
     * @tc.name int8ArrayForEachPart01Test027
     * @tc.desc Verify forEach returns undefined, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result = arr.forEach((_value: number, _index: int, _array: Int8Array): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_2800
     * @tc.name int8ArrayForEachPart01Test028
     * @tc.desc Verify forEach expects 4, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let count: number = 0;
      arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_2900
     * @tc.name int8ArrayForEachPart01Test029
     * @tc.desc Verify forEach callback invoked 5 times, on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let count: number = 0;
      arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
        count = count + 1;
        return;
      });
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_3000
     * @tc.name int8ArrayForEachPart01Test030
     * @tc.desc Verify forEach on [1, 2, 3] accumulates sum 6 and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sum: number = 0;
      let result = arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        sum = sum + value;
      });
      expect(sum).assertEqual(6);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_3100
     * @tc.name int8ArrayForEachPart01Test031
     * @tc.desc Verify forEach invokes named callback 4 times, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let count: number = 0;
      let returningCb = (_value: number, _index: int, _array: Int8Array): void => {
        count = count + 1;
      };
      arr.forEach(returningCb);
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_3200
     * @tc.name int8ArrayForEachPart01Test032
     * @tc.desc Verify forEach callback throws RangeError and exception type is correctly asserted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
          throw new RangeError('range error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_3300
     * @tc.name int8ArrayForEachPart01Test033
     * @tc.desc Verify forEach callback throws TypeError and exception type is correctly asserted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
          throw new TypeError('type error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_3400
     * @tc.name int8ArrayForEachPart01Test034
     * @tc.desc Verify forEach throws Error with message preserved, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
          throw new Error('custom error message');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('custom error message');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_3500
     * @tc.name int8ArrayForEachPart01Test035
     * @tc.desc Verify forEach throws bare Error, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
          throw new Error();
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_3600
     * @tc.name int8ArrayForEachPart01Test036
     * @tc.desc Verify forEach expects Error throws exception, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let callCount: number = 0;
      try {
        arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
          callCount = callCount + 1;
          throw new Error('first element');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_3700
     * @tc.name int8ArrayForEachPart01Test037
     * @tc.desc Verify forEach callback throws Error when index == 2 and counter equals 30 after processing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let sum: number = 0;
      try {
        arr.forEach((value: number, index: int, _array: Int8Array): void => {
          if (index == 2) {
            throw new Error('middle');
          }
          sum = sum + value;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(sum).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_3800
     * @tc.name int8ArrayForEachPart01Test038
     * @tc.desc Verify forEach callback throws Error when index == 3 and counter equals 4 after processing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let count: number = 0;
      try {
        arr.forEach((_value: number, index: int, _array: Int8Array): void => {
          count = count + 1;
          if (index == 3) {
            throw new Error('last');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_3900
     * @tc.name int8ArrayForEachPart01Test039
     * @tc.desc Verify forEach callback throws Error when index == 1 and counter equals 2 after processing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let collected: Array<number> = [];
      try {
        arr.forEach((value: number, index: int, _array: Int8Array): void => {
          collected.push(value);
          if (index == 1) {
            throw new Error('partial');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(collected.length).assertEqual(2);
        expect(collected[0]).assertEqual(1);
        expect(collected[1]).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_4000
     * @tc.name int8ArrayForEachPart01Test040
     * @tc.desc Verify forEach callback throws Error when index == 1 and counter equals 1 after processing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let processed: Array<number> = [];
      try {
        arr.forEach((value: number, index: int, _array: Int8Array): void => {
          if (index == 1) {
            throw new Error('stop');
          }
          processed.push(value);
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(processed.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_4100
     * @tc.name int8ArrayForEachPart01Test041
     * @tc.desc Verify forEach concatenates value,index,length as '10,0,2;20,1,2;'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let result: string = '';
      arr.forEach((value: number, index: int, array: Int8Array): void => {
        result = result + value + ',' + index + ',' + array.length + ';';
      });
      expect(result).assertEqual('10,0,2;20,1,2;');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_4200
     * @tc.name int8ArrayForEachPart01Test042
     * @tc.desc Verify forEach callback sums values 1, 2, 3 to 6, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sum: number = 0;
      arr.forEach((value: number): void => {
        sum = sum + value;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_4300
     * @tc.name int8ArrayForEachPart01Test043
     * @tc.desc Verify forEach invokes callback 4 times, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let count: number = 0;
      arr.forEach((): void => {
        count = count + 1;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_4400
     * @tc.name int8ArrayForEachPart01Test044
     * @tc.desc Verify forEach expects 10, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let multiplier: number = 10;
      let results: Array<number> = [];
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        results.push(value * multiplier);
      });
      expect(results[0]).assertEqual(10);
      expect(results[1]).assertEqual(20);
      expect(results[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_4500
     * @tc.name int8ArrayForEachPart01Test045
     * @tc.desc Verify forEach collects elements 1, 2, 3 via named callback, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let collected: Array<number> = [];
      let callback = (v: number, i: int, a: Int8Array): void => {
        collected.push(v);
      };
      arr.forEach(callback);
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1);
      expect(collected[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_4600
     * @tc.name int8ArrayForEachPart01Test046
     * @tc.desc Verify forEach expects 1, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let threshold: number = 2;
      let aboveThreshold: number = 0;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        if (value > threshold) {
          aboveThreshold = aboveThreshold + 1;
        }
      });
      expect(aboveThreshold).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_4700
     * @tc.name int8ArrayForEachPart01Test047
     * @tc.desc Verify forEach expects 100, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let sum: number = 0;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        sum = sum + value;
      });
      expect(sum).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_4800
     * @tc.name int8ArrayForEachPart01Test048
     * @tc.desc Verify forEach expects 4, on new Int8Array([5, 6, 7, 8])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6, 7, 8]);
      let collected: Array<number> = [];
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        collected.push(value);
      });
      expect(collected.length).assertEqual(4);
      expect(collected[0]).assertEqual(5);
      expect(collected[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_4900
     * @tc.name int8ArrayForEachPart01Test049
     * @tc.desc Verify forEach expects 6, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let acc: Accumulator = { total: 0, count: 0 };
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        acc.total = acc.total + value;
        acc.count = acc.count + 1;
      });
      expect(acc.total).assertEqual(6);
      expect(acc.count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_5000
     * @tc.name int8ArrayForEachPart01Test050
     * @tc.desc Verify forEach passes first element 11, on new Int8Array([11, 22, 33])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([11, 22, 33]);
      let first: number = 0;
      arr.forEach((value: number, index: int, _array: Int8Array): void => {
        if (index == 0) {
          first = value;
        }
      });
      expect(first).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_5100
     * @tc.name int8ArrayForEachPart01Test051
     * @tc.desc Verify forEach expects 10, with $_get(0), on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstElement: number = 0;
      arr.forEach((_value: number, index: int, array: Int8Array): void => {
        if (index == 2) {
          firstElement = array.$_get(0);
        }
      });
      expect(firstElement).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_5200
     * @tc.name int8ArrayForEachPart01Test052
     * @tc.desc Verify forEach callback receives array.length 5, on new Int8Array([1, 2, 3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let lengths: Array<number> = [];
      arr.forEach((_value: number, _index: int, array: Int8Array): void => {
        lengths.push(array.length);
      });
      expect(lengths[0]).assertEqual(5);
      expect(lengths[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_5300
     * @tc.name int8ArrayForEachPart01Test053
     * @tc.desc Verify forEach sees value 99 after $_set(2, 99) in callback, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let values: Array<number> = [];
      arr.forEach((value: number, index: int, array: Int8Array): void => {
        values.push(value);
        if (index == 0) {
          array.$_set(2, 99);
        }
      });
      expect(values[0]).assertEqual(1);
      expect(values[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_5400
     * @tc.name int8ArrayForEachPart01Test054
     * @tc.desc Verify forEach callback not invoked on empty array, called false, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let called: boolean = false;
      arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_5500
     * @tc.name int8ArrayForEachPart01Test055
     * @tc.desc Verify forEach does not invoke callback on empty Int8Array([])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([]);
      let called: boolean = false;
      arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_5600
     * @tc.name int8ArrayForEachPart01Test056
     * @tc.desc Verify forEach returns undefined, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result = arr.forEach((_value: number, _index: int, _array: Int8Array): void => {});
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_5700
     * @tc.name int8ArrayForEachPart01Test057
     * @tc.desc Verify forEach sees all zero elements on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      let allZero: boolean = true;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        if (value !== 0) {
          allZero = false;
        }
      });
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_5800
     * @tc.name int8ArrayForEachPart01Test058
     * @tc.desc Verify forEach sees all INT8_MAX elements on new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX]);
      let allMax: boolean = true;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        if (value !== INT8_MAX) {
          allMax = false;
        }
      });
      expect(allMax).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_5900
     * @tc.name int8ArrayForEachPart01Test059
     * @tc.desc Verify forEach collects all 4 elements [-50, 50, -1, 1] from Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-50, 50, -1, 1]);
      let collected: Array<number> = [];
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        collected.push(value);
      });
      expect(collected[0]).assertEqual(-50);
      expect(collected[1]).assertEqual(50);
      expect(collected[2]).assertEqual(-1);
      expect(collected[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_6000
     * @tc.name int8ArrayForEachPart01Test060
     * @tc.desc Verify forEach expects -128, on new Int8Array([-128, 0, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, INT8_MAX]);
      let collected: Array<number> = [];
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        collected.push(value);
      });
      expect(collected[0]).assertEqual(-128);
      expect(collected[1]).assertEqual(0);
      expect(collected[2]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_6100
     * @tc.name int8ArrayForEachPart01Test061
     * @tc.desc Verify forEach passes original values 1, 2, 3 despite $_set(index, 99) in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let receivedValues: Array<number> = [];
      arr.forEach((value: number, index: int, array: Int8Array): void => {
        receivedValues.push(value);
        array.$_set(index, 99);
      });
      expect(receivedValues[0]).assertEqual(1);
      expect(receivedValues[1]).assertEqual(2);
      expect(receivedValues[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_6200
     * @tc.name int8ArrayForEachPart01Test062
     * @tc.desc Verify forEach expects 1, with $_get(0), on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let firstValue: number = 0;
      arr.forEach((value: number, index: int, array: Int8Array): void => {
        if (index == 0) {
          firstValue = value;
          array.$_set(0, 77);
        }
      });
      expect(firstValue).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_6300
     * @tc.name int8ArrayForEachPart01Test063
     * @tc.desc Verify forEach expects -55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let thirdValue: number = 0;
      arr.forEach((value: number, index: int, array: Int8Array): void => {
        if (index == 0) {
          array.$_set(2, -55);
        }
        if (index == 2) {
          thirdValue = value;
        }
      });
      expect(thirdValue).assertEqual(-55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_6400
     * @tc.name int8ArrayForEachPart01Test064
     * @tc.desc Verify nested forEach on Int8Array([1,2,3]) accumulates total === 18 via inner forEach sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let total: number = 0;
      arr.forEach((_value: number, _index: int, array: Int8Array): void => {
        array.forEach((innerVal: number, _i2: int, _a2: Int8Array): void => {
          total = total + innerVal;
        });
      });
      expect(total).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_6500
     * @tc.name int8ArrayForEachPart01Test065
     * @tc.desc Verify forEach reads last element via $_get(length-1) returns 30 on Int8Array([10,20,30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let lastValue: number = 0;
      arr.forEach((_value: number, _index: int, array: Int8Array): void => {
        lastValue = array.$_get(array.length - 1);
      });
      expect(lastValue).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_6600
     * @tc.name int8ArrayForEachPart01Test066
     * @tc.desc Verify forEach expects Error throws exception, on new Int8Array([42])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let callCount: number = 0;
      try {
        arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
          callCount = callCount + 1;
          throw new Error('single');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(1);
        expect(e.message).assertEqual('single');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_6700
     * @tc.name int8ArrayForEachPart01Test067
     * @tc.desc Verify forEach empty array, callback assertFail never triggers, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      arr.forEach((_value: number, _index: int, _array: Int8Array): void => {
        expect().assertFail();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_6800
     * @tc.name int8ArrayForEachPart01Test068
     * @tc.desc Verify forEach expects 100, with $_set(i, 1), on new Int8Array(100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, 1);
      }
      let sum: number = 0;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        sum = sum + value;
      });
      expect(sum).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_6900
     * @tc.name int8ArrayForEachPart01Test069
     * @tc.desc Verify forEach concatenates index:value pairs '0:-128' to '4:127', on new Int8Array([-128, -1, 0, 1, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 0, 1, INT8_MAX]);
      let pairs: Array<string> = [];
      arr.forEach((value: number, index: int, _array: Int8Array): void => {
        pairs.push(index + ':' + value);
      });
      expect(pairs[0]).assertEqual('0:-128');
      expect(pairs[1]).assertEqual('1:-1');
      expect(pairs[2]).assertEqual('2:0');
      expect(pairs[3]).assertEqual('3:1');
      expect(pairs[4]).assertEqual('4:127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_7000
     * @tc.name int8ArrayForEachPart01Test070
     * @tc.desc Verify Number.POSITIVE_INFINITY forEach value 0 (infinity converts to 0 in Int8Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([Number.POSITIVE_INFINITY]);
      let received: number = 0;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        received = value;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_7100
     * @tc.name int8ArrayForEachPart01Test071
     * @tc.desc Verify Number.NEGATIVE_INFINITY forEach value 0 (negative infinity converts to 0 in Int8Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([Number.NEGATIVE_INFINITY]);
      let received: number = 0;
      arr.forEach((value: number, _index: int, _array: Int8Array): void => {
        received = value;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART01_7200
     * @tc.name int8ArrayForEachPart01Test072
     * @tc.desc Verify forEach on Int8Array([5,6,7]) accumulates sum of (value+index) === 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6, 7]);
      let sum: number = 0;
      arr.forEach((value: number, index: int): void => {
        sum = sum + value + index;
      });
      expect(sum).assertEqual(21);
    });
  });
}
