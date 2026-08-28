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

class StaticValueMatcher001 {
  static target: number = 30;
  static matches(value: number, index: int, array: Int8Array): boolean {
    return value === StaticValueMatcher001.target;
  }
}

class ValueMatcher001 {
  target: number;
  constructor(t: number) {
    this.target = t;
  }
  matches(value: number, index: int, array: Int8Array): boolean {
    return value === this.target;
  }
}

class CustomFindError extends Error {
  errorCode: int;
  constructor(msg: string, c: int) {
    super(msg);
    this.name = 'CustomFindError';
    this.errorCode = c;
  }
}

export default function int8ArrayFindIndexPart01Test(): void {
  describe('Int8ArrayFindIndexPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_0100
     * @tc.name int8ArrayFindIndexPart01Test001
     * @tc.desc Verify findIndex expects 0 when callback always returns true, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_0200
     * @tc.name int8ArrayFindIndexPart01Test002
     * @tc.desc Verify findIndex expects -1, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_0300
     * @tc.name int8ArrayFindIndexPart01Test003
     * @tc.desc Verify findIndex expects 0 when callback matches value 10, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 10;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_0400
     * @tc.name int8ArrayFindIndexPart01Test004
     * @tc.desc Verify findIndex expects 2 when callback matches value 30, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 30;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_0500
     * @tc.name int8ArrayFindIndexPart01Test005
     * @tc.desc Verify findIndex expects 1 when callback matches value 20, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 20;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_0600
     * @tc.name int8ArrayFindIndexPart01Test006
     * @tc.desc Verify findIndex expects 1 when value > 15, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value > 15;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_0700
     * @tc.name int8ArrayFindIndexPart01Test007
     * @tc.desc Verify findIndex returns -1 when no element matches predicate (all elements <= 100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value > 100;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_0800
     * @tc.name int8ArrayFindIndexPart01Test008
     * @tc.desc Verify findIndex callback captures first element value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstValue: number = 0;
      let rIdx: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        firstValue = value;
        return true;
      });
      expect(rIdx).assertEqual(0);
      expect(firstValue).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_0900
     * @tc.name int8ArrayFindIndexPart01Test009
     * @tc.desc Verify findIndex callback captures last visited element value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let lastValue: number = 0;
      let rIdx: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        lastValue = value;
        return value === 30;
      });
      expect(rIdx).assertEqual(2);
      expect(lastValue).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_1000
     * @tc.name int8ArrayFindIndexPart01Test010
     * @tc.desc Verify findIndex visits all elements when predicate always returns false, visited.length equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let visited: Array<number> = [];
      let rIdx: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        visited.push(value);
        return false;
      });
      expect(rIdx).assertEqual(-1);
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(10);
      expect(visited[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_1100
     * @tc.name int8ArrayFindIndexPart01Test011
     * @tc.desc Verify findIndex with predicate element == -56 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(1, 200);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === -56;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_1200
     * @tc.name int8ArrayFindIndexPart01Test012
     * @tc.desc Verify findIndex expects 0 with first callback index captured as 0, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstIndex: int = -1;
      let rIdx: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        firstIndex = index;
        return true;
      });
      expect(rIdx).assertEqual(0);
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_1300
     * @tc.name int8ArrayFindIndexPart01Test013
     * @tc.desc Verify findIndex expects 2 with last callback index captured as 2, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let lastIndex: int = -1;
      let rIdx: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        lastIndex = index;
        return value === 30;
      });
      expect(rIdx).assertEqual(2);
      expect(lastIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_1400
     * @tc.name int8ArrayFindIndexPart01Test014
     * @tc.desc Verify findIndex expects 0 with callback returning false for all elements, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let indices: Array<int> = [];
      let rIdx: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        indices.push(index);
        return false;
      });
      expect(rIdx).assertEqual(-1);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_1500
     * @tc.name int8ArrayFindIndexPart01Test015
     * @tc.desc Verify findIndex expects 2 when value === 30, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let maxIndex: int = -1;
      let result: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        maxIndex = index;
        return value === 30;
      });
      expect(maxIndex).assertEqual(2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_1600
     * @tc.name int8ArrayFindIndexPart01Test016
     * @tc.desc Verify findIndex callback index is always within [0, length) bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let outOfRange: int = 0;
      let rIdx: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        if (index < 0 || index >= arr.length) {
          outOfRange = outOfRange + 1;
        }
        return false;
      });
      expect(rIdx).assertEqual(-1);
      expect(outOfRange).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_1700
     * @tc.name int8ArrayFindIndexPart01Test017
     * @tc.desc Verify findIndex callback array parameter is source array with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let capturedArray: Int8Array = new Int8Array(1);
      let rIdx: int = arr.findIndex((value: number, _index: int, array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        capturedArray = array;
        return true;
      });
      expect(rIdx).assertEqual(0);
      let r1: int = capturedArray.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_1800
     * @tc.name int8ArrayFindIndexPart01Test018
     * @tc.desc Verify findIndex callback captures array.length 3, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let capturedLength: int = 0;
      let rIdx: int = arr.findIndex((value: number, _index: int, array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        capturedLength = array.length;
        return true;
      });
      expect(rIdx).assertEqual(0);
      expect(capturedLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_1900
     * @tc.name int8ArrayFindIndexPart01Test019
     * @tc.desc Verify findIndex expects 0, with $_get(index), on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let mismatchCount: int = 0;
      let rIdx: int = arr.findIndex((value: number, index: int, array: Int8Array): boolean => {
        if (array.$_get(index) !== value) {
          mismatchCount = mismatchCount + 1;
        }
        return false;
      });
      expect(rIdx).assertEqual(-1);
      expect(mismatchCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_2000
     * @tc.name int8ArrayFindIndexPart01Test020
     * @tc.desc Verify findIndex callback receives Int8Array instance as the array argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let isInstance: boolean = false;
      let rIdx: int = arr.findIndex((value: number, _index: int, array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        isInstance = array.BYTES_PER_ELEMENT === 1;
        return true;
      });
      expect(rIdx).assertEqual(0);
      expect(isInstance).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_2100
     * @tc.name int8ArrayFindIndexPart01Test021
     * @tc.desc Verify findIndex callback can access last element via array.at(-1) and capture it as lastElement=30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let lastElement: number = 0;
      let rIdx: int = arr.findIndex((value: number, _index: int, array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        let v = array.at(-1);
        if (v !== undefined) {
          lastElement = v;
        }
        return true;
      });
      expect(rIdx).assertEqual(0);
      expect(lastElement).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_2200
     * @tc.name int8ArrayFindIndexPart01Test022
     * @tc.desc Verify findIndex callback invoked 3 times when always false, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let callCount: int = 0;
      let rIdx: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        callCount = callCount + 1;
        return false;
      });
      expect(rIdx).assertEqual(-1);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_2300
     * @tc.name int8ArrayFindIndexPart01Test023
     * @tc.desc Verify findIndex callback stops after first match, callCount 1, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let callCount: int = 0;
      let rIdx: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        callCount = callCount + 1;
        return value === 10;
      });
      expect(rIdx).assertEqual(0);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_2400
     * @tc.name int8ArrayFindIndexPart01Test024
     * @tc.desc Verify findIndex callback invoked 3 times before matching value 30, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let callCount: int = 0;
      let rIdx: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        callCount = callCount + 1;
        return value === 30;
      });
      expect(rIdx).assertEqual(2);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_2500
     * @tc.name int8ArrayFindIndexPart01Test025
     * @tc.desc Verify findIndex expects 3, on new Int8Array([10, 20, 30, 40, 50])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let callCount: int = 0;
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        callCount = callCount + 1;
        return value === 40;
      });
      expect(result).assertEqual(3);
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_2600
     * @tc.name int8ArrayFindIndexPart01Test026
     * @tc.desc Verify findIndex expects -1, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_2700
     * @tc.name int8ArrayFindIndexPart01Test027
     * @tc.desc Verify findIndex callback not invoked on empty array, callCount 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let callCount: int = 0;
      let rIdx: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        callCount = callCount + 1;
        return true;
      });
      expect(rIdx).assertEqual(-1);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_2800
     * @tc.name int8ArrayFindIndexPart01Test028
     * @tc.desc Verify findIndex expects 0 when value === 42, on new Int8Array([42])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 42;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_2900
     * @tc.name int8ArrayFindIndexPart01Test029
     * @tc.desc Verify findIndex expects -1, on new Int8Array([42])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 99;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_3000
     * @tc.name int8ArrayFindIndexPart01Test030
     * @tc.desc Verify findIndex throws Error on first callback call, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      try {
        let rIdx: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new Error('callback error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_3100
     * @tc.name int8ArrayFindIndexPart01Test031
     * @tc.desc Verify findIndex expects RangeError throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      try {
        let rIdx: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          if (index === 1) {
            throw new RangeError('range error');
          }
          return false;
        });
        expect(rIdx).assertEqual(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_3200
     * @tc.name int8ArrayFindIndexPart01Test032
     * @tc.desc Verify findIndex expects TypeError throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      try {
        let rIdx: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new TypeError('type error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_3300
     * @tc.name int8ArrayFindIndexPart01Test033
     * @tc.desc Verify findIndex expects CustomFindError throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      try {
        let rIdx: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new CustomFindError('custom', 42);
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('CustomFindError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_3400
     * @tc.name int8ArrayFindIndexPart01Test034
     * @tc.desc Verify findIndex expects 0 when callback matches value 10 on first call, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let callCount: int = 0;
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        callCount = callCount + 1;
        return value === 10;
      });
      expect(result).assertEqual(0);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_3500
     * @tc.name int8ArrayFindIndexPart01Test035
     * @tc.desc Verify findIndex throws Error on second callback call, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let callCount: int = 0;
      try {
        let rIdx: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          callCount = callCount + 1;
          if (index === 1) {
            throw new Error('stop');
          }
          return false;
        });
        expect(rIdx).assertEqual(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_3600
     * @tc.name int8ArrayFindIndexPart01Test036
     * @tc.desc Verify findIndex expects 1 when value === 20, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: number = 20;
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === target;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_3700
     * @tc.name int8ArrayFindIndexPart01Test037
     * @tc.desc Verify findIndex returns -1 and counter hits 3 on always-false callback, new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counter: int = 0;
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let rIdx: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        counter = counter + 1;
        return false;
      });
      expect(rIdx).assertEqual(-1);
      expect(counter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_3800
     * @tc.name int8ArrayFindIndexPart01Test038
     * @tc.desc Verify findIndex expects 2 when validValues.includes(value), on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let validValues: Array<number> = [30, 50, 70];
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return validValues.includes(value);
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_3900
     * @tc.name int8ArrayFindIndexPart01Test039
     * @tc.desc Verify findIndex expects 2 when targetSet.has(value), on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetSet: Set<number> = new Set<number>();
      targetSet.add(30);
      targetSet.add(50);
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return targetSet.has(value);
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_4000
     * @tc.name int8ArrayFindIndexPart01Test040
     * @tc.desc Verify findIndex expects 2 when index === targetIndex, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetIndex: int = 2;
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let result: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === targetIndex;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_4100
     * @tc.name int8ArrayFindIndexPart01Test041
     * @tc.desc Verify findIndex callback accumulates sum of all element values equals 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0;
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let rIdx: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        sum = sum + value;
        return false;
      });
      expect(rIdx).assertEqual(-1);
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_4200
     * @tc.name int8ArrayFindIndexPart01Test042
     * @tc.desc Verify findIndex callback collects positive indices 1 and 3, on new Int8Array([-10, 20, -30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveIndices: Array<int> = [];
      let arr: Int8Array = new Int8Array([-10, 20, -30, 40]);
      let rIdx: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (value > 0) {
          positiveIndices.push(index);
        }
        return value > 100;
      });
      expect(rIdx).assertEqual(-1);
      expect(positiveIndices.length).assertEqual(2);
      expect(positiveIndices[0]).assertEqual(1);
      expect(positiveIndices[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_4300
     * @tc.name int8ArrayFindIndexPart01Test043
     * @tc.desc Verify findIndex expects 2 when value > 0, on new Int8Array([-10, -20, 5, -30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundPositive: boolean = false;
      let arr: Int8Array = new Int8Array([-10, -20, 5, -30]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        if (value > 0) {
          foundPositive = true;
          return true;
        }
        return false;
      });
      expect(result).assertEqual(2);
      expect(foundPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_4400
     * @tc.name int8ArrayFindIndexPart01Test044
     * @tc.desc Verify findIndex reflects in-place $_set modification - visited[2] equals 99 after $_set(2,99) during traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let visited: Array<number> = [];
      let rIdx: int = arr.findIndex((value: number, index: int, array: Int8Array): boolean => {
        if (index === 0) {
          array.$_set(2, 99);
        }
        visited.push(value);
        return false;
      });
      expect(rIdx).assertEqual(-1);
      expect(visited[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_4500
     * @tc.name int8ArrayFindIndexPart01Test045
     * @tc.desc Verify findIndex expects 10, with $_get(0), on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstValue: number = 0;
      let rIdx: int = arr.findIndex((value: number, index: int, array: Int8Array): boolean => {
        if (index === 0) {
          firstValue = value;
          array.$_set(0, 99);
        }
        return false;
      });
      expect(rIdx).assertEqual(-1);
      expect(firstValue).assertEqual(10);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_4600
     * @tc.name int8ArrayFindIndexPart01Test046
     * @tc.desc Verify findIndex callback increments each element - arr[0]=11, arr[2]=31 after traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let rIdx: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        arr.$_set(index, value + 1);
        return false;
      });
      expect(rIdx).assertEqual(-1);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(2)).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_4700
     * @tc.name int8ArrayFindIndexPart01Test047
     * @tc.desc Verify findIndex expects 1 with single-line callback value === 20, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => value === 20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_4800
     * @tc.name int8ArrayFindIndexPart01Test048
     * @tc.desc Verify findIndex with named predicate isValueTwenty (value === 20) returns 1, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isValueTwenty = (value: number, index: int, array: Int8Array): boolean => {
        return value === 20;
      };
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex(isValueTwenty);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_4900
     * @tc.name int8ArrayFindIndexPart01Test049
     * @tc.desc Verify findIndex expects 1 with ValueMatcher001(20), on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let matcher: ValueMatcher001 = new ValueMatcher001(20);
      let result: int = arr.findIndex((value: number, index: int, array: Int8Array): boolean => {
        return matcher.matches(value, index, array);
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_5000
     * @tc.name int8ArrayFindIndexPart01Test050
     * @tc.desc Verify findIndex expects 2 with StaticValueMatcher001, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, index: int, array: Int8Array): boolean => {
        return StaticValueMatcher001.matches(value, index, array);
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_5100
     * @tc.name int8ArrayFindIndexPart01Test051
     * @tc.desc Verify findIndex expects 0 when value === -128, on new Int8Array([-128, 0, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, INT8_MAX]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === -128;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_5200
     * @tc.name int8ArrayFindIndexPart01Test052
     * @tc.desc Verify findIndex with predicate element == INT8_MAX returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, INT8_MAX]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === INT8_MAX;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_5300
     * @tc.name int8ArrayFindIndexPart01Test053
     * @tc.desc Verify findIndex expects 1 when value === 0, on new Int8Array([-1, 0, 1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 0, 1]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_5400
     * @tc.name int8ArrayFindIndexPart01Test054
     * @tc.desc Verify findIndex expects 1 when value === -1, on new Int8Array([0, -1, 1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, -1, 1]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === -1;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_5500
     * @tc.name int8ArrayFindIndexPart01Test055
     * @tc.desc Verify findIndex expects 0, with $_set(0, 128), on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(0, 128);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === -128;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_5600
     * @tc.name int8ArrayFindIndexPart01Test056
     * @tc.desc Verify findIndex expects 2, with $_set(2, 255), on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(2, 255);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === -1;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_5700
     * @tc.name int8ArrayFindIndexPart01Test057
     * @tc.desc Verify findIndex with predicate value === 42 returns 0, on new Int8Array([42, 42, 42])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42, 42, 42]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 42;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_5800
     * @tc.name int8ArrayFindIndexPart01Test058
     * @tc.desc Verify findIndex expects 1 when value === -128, on new Int8Array([INT8_MAX, -128, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, -128, 0]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === -128;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_5900
     * @tc.name int8ArrayFindIndexPart01Test059
     * @tc.desc Verify findIndex expects 2 when value > 0, on new Int8Array([-1, 0, 5, -3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 0, 5, -3]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value > 0;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_6000
     * @tc.name int8ArrayFindIndexPart01Test060
     * @tc.desc Verify findIndex expects 2 when value < 0, on new Int8Array([0, 5, -3, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 5, -3, 2]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value < 0;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_6100
     * @tc.name int8ArrayFindIndexPart01Test061
     * @tc.desc Verify findIndex expects 2 when value === 0, on new Int8Array([5, 3, 0, -1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 0, -1]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_6200
     * @tc.name int8ArrayFindIndexPart01Test062
     * @tc.desc Verify findIndex with predicate element != 0 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 5, 0]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value !== 0;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_6300
     * @tc.name int8ArrayFindIndexPart01Test063
     * @tc.desc Verify findIndex with predicate element >= 100 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 50, 100, INT8_MAX]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value >= 100;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_6400
     * @tc.name int8ArrayFindIndexPart01Test064
     * @tc.desc Verify findIndex with predicate element <= -100 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -50, -100, -128]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value <= -100;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_6500
     * @tc.name int8ArrayFindIndexPart01Test065
     * @tc.desc Verify findIndex expects 2 when callback index equals length - 1, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, index: int, array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === array.length - 1;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_6600
     * @tc.name int8ArrayFindIndexPart01Test066
     * @tc.desc Verify findIndex with predicate index % 2 === 0 returns 0, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let result: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index % 2 === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_6700
     * @tc.name int8ArrayFindIndexPart01Test067
     * @tc.desc Verify findIndex expects 1 when callback index > 0, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index > 0;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_6800
     * @tc.name int8ArrayFindIndexPart01Test068
     * @tc.desc Verify findIndex expects 0 when value === -1 after $_set(0, 0xff), on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(0, 0xff);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === -1;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_6900
     * @tc.name int8ArrayFindIndexPart01Test069
     * @tc.desc Verify findIndex with predicate element == 0x7F returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, INT8_MAX, -128]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 0x7f;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_7000
     * @tc.name int8ArrayFindIndexPart01Test070
     * @tc.desc Verify findIndex expects 1, with $_get(0), on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let first: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 20;
      });
      let second: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 30;
      });
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_7100
     * @tc.name int8ArrayFindIndexPart01Test071
     * @tc.desc Verify findIndex expects 0 when callback matches value 10, and 2 for index 2, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let byValue: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 10;
      });
      let byIndex: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === 2;
      });
      expect(byValue).assertEqual(0);
      expect(byIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_7200
     * @tc.name int8ArrayFindIndexPart01Test072
     * @tc.desc Verify findIndex expects 1 when value === 20, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let innerResult: int = -1;
      let outerResult: int = arr.findIndex((value: number, _index: int, array: Int8Array): boolean => {
        innerResult = array.findIndex((v: number, _i: int, _a: Int8Array): boolean => v === 40);
        return value === 20;
      });
      expect(outerResult).assertEqual(1);
      expect(innerResult).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_7300
     * @tc.name int8ArrayFindIndexPart01Test073
     * @tc.desc Verify findIndex with predicate element = array.at(0) returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstElement: number = 0;
      let rIdx: int = arr.findIndex((value: number, _index: int, array: Int8Array): boolean => {
        let v = array.at(0);
        if (v !== undefined) {
          firstElement = v;
        }
        return value === 30;
      });
      expect(rIdx).assertEqual(2);
      expect(firstElement).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_7400
     * @tc.name int8ArrayFindIndexPart01Test074
     * @tc.desc Verify findIndex expects 3, on new Int8Array([10, 20, 30, 20])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 20]);
      let result: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        return value === 20 && index === 3;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_7500
     * @tc.name int8ArrayFindIndexPart01Test075
     * @tc.desc Verify findIndex with predicate element == 50 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let result: int = arr.findIndex((value: number, index: int, array: Int8Array): boolean => {
        return index === array.length - 1 && value === 50;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_7600
     * @tc.name int8ArrayFindIndexPart01Test076
     * @tc.desc Verify findIndex - all Int8Array elements are within [-128, 127] range (outOfRange count = 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, INT8_MAX]);
      let outOfRange: int = 0;
      let rIdx: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        if (value < -128 || value > INT8_MAX) {
          outOfRange = outOfRange + 1;
        }
        return false;
      });
      expect(rIdx).assertEqual(-1);
      expect(outOfRange).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_7700
     * @tc.name int8ArrayFindIndexPart01Test077
     * @tc.desc Verify findIndex expects 1 when value < 0, on new Int8Array([10, -50, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, -50, 30]);
      let firstNegative: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value < 0;
      });
      expect(firstNegative).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_7800
     * @tc.name int8ArrayFindIndexPart01Test078
     * @tc.desc Verify findIndex expects 1 when value === 20, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 20;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_7900
     * @tc.name int8ArrayFindIndexPart01Test079
     * @tc.desc Verify findIndex expects 2 when value === 30, on Int8Array.from(source)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [10, 20, 30];
      let arr: Int8Array = Int8Array.from(source);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 30;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_8000
     * @tc.name int8ArrayFindIndexPart01Test080
     * @tc.desc Verify findIndex expects 0 when callback matches value 10 at index 0, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        return index === 0 ? value === 10 : value === 30;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_8100
     * @tc.name int8ArrayFindIndexPart01Test081
     * @tc.desc Verify findIndex with predicate element < 20 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value < 20 ? false : value === 30;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_8200
     * @tc.name int8ArrayFindIndexPart01Test082
     * @tc.desc Verify findIndex expects 1 when callback matches value 99 or 20, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value === 99 || value === 20;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_8300
     * @tc.name int8ArrayFindIndexPart01Test083
     * @tc.desc Verify findIndex expects 2 when value > 15 && index >= 2, on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let result: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        return value > 15 && index >= 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_8400
     * @tc.name int8ArrayFindIndexPart01Test084
     * @tc.desc Verify findIndex with predicate !(value === 10) returns 2, on new Int8Array([10, 10, 20])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 10, 20]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return !(value === 10);
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_8500
     * @tc.name int8ArrayFindIndexPart01Test085
     * @tc.desc Verify findIndex expects 2 when callback matches value 30 at index 2, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, index: int, _array: Int8Array): boolean => {
        return !(index < 2) && value === 30;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_INDEX_PART01_TEST_8600
     * @tc.name int8ArrayFindIndexPart01Test086
     * @tc.desc Verify findIndex with predicate element > threshold returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindIndexPart01Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threshold: number = 25;
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: int = arr.findIndex((value: number, _index: int, _array: Int8Array): boolean => {
        return value > threshold;
      });
      expect(result).assertEqual(2);
    });
  });
}
