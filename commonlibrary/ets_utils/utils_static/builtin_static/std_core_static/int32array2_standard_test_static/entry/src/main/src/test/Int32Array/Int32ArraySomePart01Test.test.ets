'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int32ArraySomePart01Test(): void {
  describe('Int32ArraySomePart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_0100
     * @tc.name int32ArraySomePart01Test001
     * @tc.desc Verify some predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = Int32Array.of(1, 2, 3);
      let result: boolean = values.some((value: number): boolean => value === 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_0200
     * @tc.name int32ArraySomePart01Test002
     * @tc.desc Verify 1 predicate boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_0300
     * @tc.name int32ArraySomePart01Test003
     * @tc.desc Verify 1 predicate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e > 100);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_0400
     * @tc.name int32ArraySomePart01Test004
     * @tc.desc Verify 2 predicate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e === 20);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_0500
     * @tc.name int32ArraySomePart01Test005
     * @tc.desc Verify predicate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let received: number = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        received = e;
        return false;
      });
      expect(received).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_0600
     * @tc.name int32ArraySomePart01Test006
     * @tc.desc Verify predicate element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let received: number = 999;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        received = e;
        return false;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_0700
     * @tc.name int32ArraySomePart01Test007
     * @tc.desc Verify predicate element INT_MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let received: number = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        received = e;
        return false;
      });
      expect(received).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_0800
     * @tc.name int32ArraySomePart01Test008
     * @tc.desc Verify predicate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let first: number = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        first = e;
        return true;
      });
      expect(first).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_0900
     * @tc.name int32ArraySomePart01Test009
     * @tc.desc Verify 0 predicate element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let allZero: boolean = true;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        if (e !== 0) {
          allZero = false;
        }
        return false;
      });
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_1000
     * @tc.name int32ArraySomePart01Test010
     * @tc.desc Verify predicate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
      let expected: number = 7;
      let mismatch: boolean = false;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        if (e !== expected) {
          mismatch = true;
        }
        return false;
      });
      expect(mismatch).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_1100
     * @tc.name int32ArraySomePart01Test011
     * @tc.desc Verify predicate element -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      let received: number = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        received = e;
        return false;
      });
      expect(received).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_1200
     * @tc.name int32ArraySomePart01Test012
     * @tc.desc Verify predicate element INT_MIN -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let received: number = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        received = e;
        return false;
      });
      expect(received).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_1300
     * @tc.name int32ArraySomePart01Test013
     * @tc.desc Verify predicate element -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-100, -200]);
      let first: number = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        first = e;
        return true;
      });
      expect(first).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_1400
     * @tc.name int32ArraySomePart01Test014
     * @tc.desc Verify predicate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -1, 2, -2]);
      let seq: string = '';
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        seq = seq + e.toString() + ',';
        return e === -2;
      });
      expect(seq).assertEqual('1,-1,2,-2,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_1500
     * @tc.name int32ArraySomePart01Test015
     * @tc.desc Verify predicate element -2 MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2]);
      let received: number = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        received = e;
        return false;
      });
      expect(received).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_1600
     * @tc.name int32ArraySomePart01Test016
     * @tc.desc Verify Number.NaN ToInt32 predicate element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([Number.NaN]);
      let received: number = 999;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        received = e;
        return false;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_1700
     * @tc.name int32ArraySomePart01Test017
     * @tc.desc Verify 0.5 predicate element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0.5]);
      let received: number = 999;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        received = e;
        return false;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_1800
     * @tc.name int32ArraySomePart01Test018
     * @tc.desc Verify -0.9 predicate element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-0.9]);
      let received: number = 999;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        received = e;
        return false;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_1900
     * @tc.name int32ArraySomePart01Test019
     * @tc.desc Verify 2147483647.9 predicate element INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647.9]);
      let received: number = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        received = e;
        return false;
      });
      expect(received).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_2000
     * @tc.name int32ArraySomePart01Test020
     * @tc.desc Verify 4294967296 2^32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4294967296);
      let received: number = 999;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        received = e;
        return false;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_2100
     * @tc.name int32ArraySomePart01Test021
     * @tc.desc Verify 4294967297 2^32+1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4294967297);
      let received: number = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        received = e;
        return false;
      });
      expect(received).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_2200
     * @tc.name int32ArraySomePart01Test022
     * @tc.desc Verify predicate index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let receivedIdx: int = -1;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        receivedIdx = i;
        return false;
      });
      expect(receivedIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_2300
     * @tc.name int32ArraySomePart01Test023
     * @tc.desc Verify predicate index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20]);
      let firstIdx: int = -1;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        firstIdx = i;
        return true;
      });
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_2400
     * @tc.name int32ArraySomePart01Test024
     * @tc.desc Verify index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let secondIdx: int = -1;
      let callCnt: int = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        callCnt++;
        if (callCnt === 2) {
          secondIdx = i;
        }
        return e === 30;
      });
      expect(secondIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_2500
     * @tc.name int32ArraySomePart01Test025
     * @tc.desc Verify predicate index length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let lastIdx: int = -1;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        lastIdx = i;
        return false;
      });
      expect(lastIdx).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_2600
     * @tc.name int32ArraySomePart01Test026
     * @tc.desc Verify predicate index 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let expected: int = 0;
      let ordered: boolean = true;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        if (i !== expected) {
          ordered = false;
        }
        expected++;
        return false;
      });
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_2700
     * @tc.name int32ArraySomePart01Test027
     * @tc.desc Verify predicate index element a.$_get(i)===e
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 10, 15, 20]);
      let consistent: boolean = true;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        if (a.$_get(i) !== e) {
          consistent = false;
        }
        return false;
      });
      expect(consistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_2800
     * @tc.name int32ArraySomePart01Test028
     * @tc.desc Verify predicate index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let hitIdx: int = -1;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        if (e === 30) {
          hitIdx = i;
          return true;
        }
        return false;
      });
      expect(hitIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_2900
     * @tc.name int32ArraySomePart01Test029
     * @tc.desc Verify predicate array some Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sameRef: boolean = false;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        if (a === arr) {
          sameRef = true;
        }
        return true;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_3000
     * @tc.name int32ArraySomePart01Test030
     * @tc.desc Verify predicate array.length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let reportedLen: int = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        reportedLen = a.length;
        return true;
      });
      expect(reportedLen).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_3100
     * @tc.name int32ArraySomePart01Test031
     * @tc.desc Verify predicate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let callbackCount: int = 0;
      let values: FixedArray<number> = [10, 20, 30];
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        expect(e).assertEqual(values[i]);
        expect(i).assertEqual(callbackCount);
        expect(a.$_get(i)).assertEqual(values[i]);
        expect(a).assertEqual(arr);
        callbackCount++;
        return false;
      });
      expect(callbackCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_3200
     * @tc.name int32ArraySomePart01Test032
     * @tc.desc Verify some predicate receives the first element and stops after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let callbackCount: int = 0;
      let callbackValue: number = 0;
      let callbackIndex: int = -1;
      let sameArray: boolean = false;
      let result: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        callbackCount++;
        callbackValue = e;
        callbackIndex = i;
        sameArray = a === arr;
        return true;
      });
      expect(result).assertTrue();
      expect(callbackCount).assertEqual(1);
      expect(callbackValue).assertEqual(1);
      expect(callbackIndex).assertEqual(0);
      expect(sameArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_3300
     * @tc.name int32ArraySomePart01Test033
     * @tc.desc Verify predicate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let observed: number = -1;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, 99);
          return false;
        }
        if (i === 1) {
          observed = e;
          return true;
        }
        return false;
      });
      expect(observed).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_3400
     * @tc.name int32ArraySomePart01Test034
     * @tc.desc Verify some returns true when an element is greater than 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let bpe: int = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        bpe = a.BYTES_PER_ELEMENT;
        return true;
      });
      expect(bpe).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_3500
     * @tc.name int32ArraySomePart01Test035
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e > 2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_3600
     * @tc.name int32ArraySomePart01Test036
     * @tc.desc Verify predicate false false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return false;
      });
      expect(r).assertFalse();
      expect(cnt).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_3700
     * @tc.name int32ArraySomePart01Test037
     * @tc.desc Verify predicate true true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return true;
      });
      expect(r).assertTrue();
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_3800
     * @tc.name int32ArraySomePart01Test038
     * @tc.desc Verify some invokes the predicate for all five elements when none matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let target: number = 30;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e === target);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_3900
     * @tc.name int32ArraySomePart01Test039
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let calls: int = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        calls++;
        return e === 999;
      });
      expect(calls).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_4000
     * @tc.name int32ArraySomePart01Test040
     * @tc.desc Verify predicate element index array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = arr.some((e: number): boolean => e === 2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_4100
     * @tc.name int32ArraySomePart01Test041
     * @tc.desc Verify predicate index index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: boolean = arr.some((e: number, i: int): boolean => i === 2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_4200
     * @tc.name int32ArraySomePart01Test042
     * @tc.desc Verify predicate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          return false;
        }
        return a.$_get(i - 1) === 2;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_4300
     * @tc.name int32ArraySomePart01Test043
     * @tc.desc Verify predicate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 4, 6, 7, 8]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e % 2 !== 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_4400
     * @tc.name int32ArraySomePart01Test044
     * @tc.desc Verify predicate element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, -3, 4]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_4500
     * @tc.name int32ArraySomePart01Test045
     * @tc.desc Verify Int32Array.of predicate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      let first: number = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        first = e;
        return true;
      });
      expect(first).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_4600
     * @tc.name int32ArraySomePart01Test046
     * @tc.desc Verify Int32Array.from predicate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([5, 15, 25]);
      let first: number = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        first = e;
        return true;
      });
      expect(first).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_4700
     * @tc.name int32ArraySomePart01Test047
     * @tc.desc Verify ArrayBuffer Int32Array predicate element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf, 0, 3);
      let received: number = -1;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        received = e;
        return true;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_4800
     * @tc.name int32ArraySomePart01Test048
     * @tc.desc Verify predicate 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let cnt: int = 0;
      arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return false;
      });
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART01_4900
     * @tc.name int32ArraySomePart01Test049
     * @tc.desc Verify predicate 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let cnt: int = 0;
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        cnt++;
        return false;
      });
      expect(r).assertFalse();
      expect(cnt).assertEqual(2);
    });
  });
}
