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

export default function uint32ArrayFindTest(): void {
  describe('Uint32ArrayFindTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_0100
     * @tc.name testUint32ArrayFindPartOne001
     * @tc.desc Verify arity-0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.find(() => true);
      expect(r).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_0200
     * @tc.name testUint32ArrayFindPartOne002
     * @tc.desc Verify arity-0 false undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.find(() => false);
      expect(r).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_0300
     * @tc.name testUint32ArrayFindPartOne003
     * @tc.desc Verify arity-1 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.find((value: number) => value === 20);
      expect(r).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_0400
     * @tc.name testUint32ArrayFindPartOne004
     * @tc.desc Verify arity-2 value index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.find((value: number, index: int) => index === 2);
      expect(r).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_0500
     * @tc.name testUint32ArrayFindPartOne005
     * @tc.desc Verify arity-3 array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.find((value: number, index: int, array: Uint32Array) => array.length === 3 && value === 10);
      expect(r).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_0600
     * @tc.name testUint32ArrayFindPartOne006
     * @tc.desc Verify const
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const pred = (value: number, index: int, array: Uint32Array) => value === 20;
      const r = arr.find(pred);
      expect(r).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_0700
     * @tc.name testUint32ArrayFindPartOne007
     * @tc.desc Verify find value > 15 returns 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.find((value: number, index: int, array: Uint32Array) => {
        if (value > 15) {
          return true;
        }
        return false;
      });
      expect(r).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_0800
     * @tc.name testUint32ArrayFindPartOne008
     * @tc.desc Verify arity-3 index value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.find((value: number, index: int, array: Uint32Array) => index === 1 && value === 20);
      expect(r).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_0900
     * @tc.name testUint32ArrayFindPartOne009
     * @tc.desc Verify value=0 uint32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 0);
      expect(r).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_1000
     * @tc.name testUint32ArrayFindPartOne010
     * @tc.desc Verify value=4294967295 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 4294967295);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 4294967295);
      expect(r).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_1100
     * @tc.name testUint32ArrayFindPartOne011
     * @tc.desc Verify value=0xFFFFFFFF 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 4294967295, 2);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 0xFFFFFFFF);
      expect(r).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_1200
     * @tc.name testUint32ArrayFindPartOne012
     * @tc.desc Verify value=0x80000000 2147483648 int32 +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 2147483648, 1);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 0x80000000);
      expect(r).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_1300
     * @tc.name testUint32ArrayFindPartOne013
     * @tc.desc Verify value=2147483647 int32 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 2147483647, 1);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 2147483647);
      expect(r).assertEqual(2147483647);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_1400
     * @tc.name testUint32ArrayFindPartOne014
     * @tc.desc Verify value=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 1);
      expect(r).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_1500
     * @tc.name testUint32ArrayFindPartOne015
     * @tc.desc Verify value=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 100, 200);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 100);
      expect(r).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_1600
     * @tc.name testUint32ArrayFindPartOne016
     * @tc.desc Verify value > 50 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 60, 70);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value > 50);
      expect(r).assertEqual(60);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_1700
     * @tc.name testUint32ArrayFindPartOne017
     * @tc.desc Verify value < 10 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(20, 30, 5);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value < 10);
      expect(r).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_1800
     * @tc.name testUint32ArrayFindPartOne018
     * @tc.desc Verify value !== 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0, 7);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value !== 0);
      expect(r).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_1900
     * @tc.name testUint32ArrayFindPartOne019
     * @tc.desc Verify value <= 0 uint32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 3, 0);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value <= 0);
      expect(r).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_2000
     * @tc.name testUint32ArrayFindPartOne020
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0, 0);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 0);
      expect(r).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_2100
     * @tc.name testUint32ArrayFindPartOne021
     * @tc.desc Verify MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 4294967295, 4294967295);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 4294967295);
      expect(r).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_2200
     * @tc.name testUint32ArrayFindPartOne022
     * @tc.desc Verify find duplicate 20 first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 20, 30);
      let foundIndex = -1;
      const r = arr.find((value: number, index: int, array: Uint32Array) => {
        if (value === 20) {
          foundIndex = index;
          return true;
        }
        return false;
      });
      expect(r).assertEqual(20);
      expect(foundIndex).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_2300
     * @tc.name testUint32ArrayFindPartOne023
     * @tc.desc Verify index === 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.find((value: number, index: int, array: Uint32Array) => index === 2);
      expect(r).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_2400
     * @tc.name testUint32ArrayFindPartOne024
     * @tc.desc Verify index % 2 === 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40);
      const r = arr.find((value: number, index: int, array: Uint32Array) => index % 2 === 1);
      expect(r).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_2500
     * @tc.name testUint32ArrayFindPartOne025
     * @tc.desc Verify index >= 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40);
      const r = arr.find((value: number, index: int, array: Uint32Array) => index >= 2);
      expect(r).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_2600
     * @tc.name testUint32ArrayFindPartOne026
     * @tc.desc Verify index length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let lastIndex = -1;
      const r = arr.find((value: number, index: int, array: Uint32Array) => {
        lastIndex = index;
        return false;
      });
      expect(r).assertUndefined();
      expect(lastIndex).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_2700
     * @tc.name testUint32ArrayFindPartOne027
     * @tc.desc Verify index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let allNonNeg = true;
      const r = arr.find((value: number, index: int, array: Uint32Array) => {
        if (index < 0) {
          allNonNeg = false;
        }
        return false;
      });
      expect(r).assertUndefined();
      expect(allNonNeg).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_2800
     * @tc.name testUint32ArrayFindPartOne028
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let firstIndex = -1;
      const r = arr.find((value: number, index: int, array: Uint32Array) => {
        if (firstIndex === -1) {
          firstIndex = index;
        }
        return false;
      });
      expect(r).assertUndefined();
      expect(firstIndex).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_2900
     * @tc.name testUint32ArrayFindPartOne029
     * @tc.desc Verify array[index] === value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let verified = 0;
      const r = arr.find((value: number, index: int, array: Uint32Array) => {
        if (array[index] === value) {
          verified = verified + 1;
        }
        return false;
      });
      expect(r).assertUndefined();
      expect(verified).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_3000
     * @tc.name testUint32ArrayFindPartOne030
     * @tc.desc Verify array[0] value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.find((value: number, index: int, array: Uint32Array) => array[0] === value);
      expect(r).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_3100
     * @tc.name testUint32ArrayFindPartOne031
     * @tc.desc Verify true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let callCount = 0;
      const r = arr.find((value: number, index: int, array: Uint32Array) => {
        callCount = callCount + 1;
        return true;
      });
      expect(r).assertEqual(10);
      expect(callCount).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_3200
     * @tc.name testUint32ArrayFindPartOne032
     * @tc.desc Verify true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let callCount = 0;
      const r = arr.find((value: number, index: int, array: Uint32Array) => {
        callCount = callCount + 1;
        return value === 20;
      });
      expect(r).assertEqual(20);
      expect(callCount).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_3300
     * @tc.name testUint32ArrayFindPartOne033
     * @tc.desc Verify true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let callCount = 0;
      const r = arr.find((value: number, index: int, array: Uint32Array) => {
        callCount = callCount + 1;
        return value === 30;
      });
      expect(r).assertEqual(30);
      expect(callCount).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_3400
     * @tc.name testUint32ArrayFindPartOne034
     * @tc.desc Verify false undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let callCount = 0;
      const r = arr.find((value: number, index: int, array: Uint32Array) => {
        callCount = callCount + 1;
        return false;
      });
      expect(r).assertUndefined();
      expect(callCount).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_3500
     * @tc.name testUint32ArrayFindPartOne035
     * @tc.desc Verify undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      let callCount = 0;
      const r = arr.find((value: number, index: int, array: Uint32Array) => {
        callCount = callCount + 1;
        return true;
      });
      expect(r).assertUndefined();
      expect(callCount).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_3600
     * @tc.name testUint32ArrayFindPartOne036
     * @tc.desc Verify (value, index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let gotValue: number = 0;
      let gotIndex: number = 0;
      const r = arr.find((value: number, index: int, array: Uint32Array) => {
        gotValue = value;
        gotIndex = index;
        return true;
      });
      expect(r).assertEqual(10);
      expect(gotValue).assertEqual(10);
      expect(gotIndex).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_3700
     * @tc.name testUint32ArrayFindPartOne037
     * @tc.desc Verify value index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let orderCorrect = true;
      const r = arr.find((value: number, index: int, array: Uint32Array) => {
        if (index === 0 && value !== 10) { orderCorrect = false; }
        if (index === 1 && value !== 20) { orderCorrect = false; }
        if (index === 2 && value !== 30) { orderCorrect = false; }
        return false;
      });
      expect(r).assertUndefined();
      expect(orderCorrect).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_3800
     * @tc.name testUint32ArrayFindPartOne038
     * @tc.desc Verify array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let capturedByteLen: number = 0;
      const r = arr.find((value: number, index: int, array: Uint32Array) => {
        capturedByteLen = array.byteLength;
        return true;
      });
      expect(r).assertEqual(10);
      expect(capturedByteLen).assertEqual(12);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_3900
     * @tc.name testUint32ArrayFindPartOne039
     * @tc.desc Verify value === 0xFF 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 255, 1);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 0xFF);
      expect(r).assertEqual(255);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_4000
     * @tc.name testUint32ArrayFindPartOne040
     * @tc.desc Verify value === 0o17 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 15, 1);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 0o17);
      expect(r).assertEqual(15);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_4100
     * @tc.name testUint32ArrayFindPartOne041
     * @tc.desc Verify value === 0b1010 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 10, 1);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 0b1010);
      expect(r).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_4200
     * @tc.name testUint32ArrayFindPartOne042
     * @tc.desc Verify value === 1e3 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1000, 1);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 1e3);
      expect(r).assertEqual(1000);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_4300
     * @tc.name testUint32ArrayFindPartOne043
     * @tc.desc Verify value === 0xFFFFFF 16777215
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 16777215, 1);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 0xFFFFFF);
      expect(r).assertEqual(16777215);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_4400
     * @tc.name testUint32ArrayFindPartOne044
     * @tc.desc Verify value === 4294967296 uint32 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 4294967296);
      expect(r).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_4500
     * @tc.name testUint32ArrayFindPartOne045
     * @tc.desc Verify value === 3.14 3 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 3.14);
      expect(r).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_4600
     * @tc.name testUint32ArrayFindPartOne046
     * @tc.desc Verify value === 9007199254740991 2^53-1 uint32 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 4294967295, 1);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 9007199254740991);
      expect(r).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_4700
     * @tc.name testUint32ArrayFindPartOne047
     * @tc.desc Verify find callback throw first call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let callCount = 0;
      try {
        arr.find((value: number, index: int, array: Uint32Array) => {
          callCount = callCount + 1;
          throw new Error('first call throw'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_4800
     * @tc.name testUint32ArrayFindPartOne048
     * @tc.desc Verify find callback throw middle call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let callCount = 0;
      try {
        arr.find((value: number, index: int, array: Uint32Array) => {
          callCount = callCount + 1;
          if (callCount === 2) {
            throw new Error('second call throw');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_4900
     * @tc.name testUint32ArrayFindPartOne049
     * @tc.desc Verify Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      try {
        arr.find((value: number, index: int, array: Uint32Array) => {
          throw new Error('custom message 12345'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('custom message 12345');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_5000
     * @tc.name testUint32ArrayFindPartOne050
     * @tc.desc Verify false SyntaxError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let callCount = 0;
      try {
        arr.find((value: number, index: int, array: Uint32Array) => {
          callCount = callCount + 1;
          if (callCount === 3) {
            throw new SyntaxError('syntax throw');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
      expect(callCount).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_5100
     * @tc.name testUint32ArrayFindPartOne051
     * @tc.desc Verify undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 99);
      expect(r).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_5200
     * @tc.name testUint32ArrayFindPartOne052
     * @tc.desc Verify find single 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 42);
      expect(r).assertEqual(42);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_5300
     * @tc.name testUint32ArrayFindPartOne053
     * @tc.desc Verify value > 100 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value > 100);
      expect(r).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_5400
     * @tc.name testUint32ArrayFindPartOne054
     * @tc.desc Verify 4294967295 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0, 0);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 4294967295);
      expect(r).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_5500
     * @tc.name testUint32ArrayFindPartOne055
     * @tc.desc Verify 0 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 4294967295, 4294967295);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 0);
      expect(r).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_5600
     * @tc.name testUint32ArrayFindPartOne056
     * @tc.desc Verify 65535 1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(65535);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 1);
      expect(r).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FIND_PARTONE_5700
     * @tc.name testUint32ArrayFindPartOne057
     * @tc.desc Verify 100 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindPartOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 4294967295, 2147483648);
      const r = arr.find((value: number, index: int, array: Uint32Array) => value === 100);
      expect(r).assertUndefined();
    });
  });
}

