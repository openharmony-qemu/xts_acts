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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayCopyWithinPart01TestTest(): void {
  describe('Int8ArrayCopyWithinPart01TestTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_0100
     * @tc.name int8ArrayCopyWithinPart01Test001
     * @tc.desc Verify 2-arg call target,start with end defaulting to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 3);
      expect(result.$_get(0)).assertEqual(4);
      expect(result.$_get(1)).assertEqual(5);
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_0200
     * @tc.name int8ArrayCopyWithinPart01Test002
     * @tc.desc Verify 3-arg call target,start,end with explicit end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 3, 5);
      expect(result.$_get(0)).assertEqual(4);
      expect(result.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_0300
     * @tc.name int8ArrayCopyWithinPart01Test003
     * @tc.desc Verify 2-arg call target=0 start=0 end defaults to length, full self-copy no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 0);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_0400
     * @tc.name int8ArrayCopyWithinPart01Test004
     * @tc.desc Verify 3-arg call end equals length, equivalent to 2-arg call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let arr2: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr1.copyWithin(1, 3);
      arr2.copyWithin(1, 3, 5);
      expect(arr1.$_get(1)).assertEqual(arr2.$_get(1));
      expect(arr1.$_get(2)).assertEqual(arr2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_0500
     * @tc.name int8ArrayCopyWithinPart01Test005
     * @tc.desc Verify 2-arg call target and start both negative, end defaults to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(-1, -2);
      expect(result.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_0600
     * @tc.name int8ArrayCopyWithinPart01Test006
     * @tc.desc Verify 3-arg call target/start/end all negative normalized copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(-2, -3, -1);
      expect(result.$_get(3)).assertEqual(3);
      expect(result.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_0700
     * @tc.name int8ArrayCopyWithinPart01Test007
     * @tc.desc Verify target=0 copy from middle to start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 2, 4);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_0800
     * @tc.name int8ArrayCopyWithinPart01Test008
     * @tc.desc Verify target=1 copy to position 1 not start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(1, 3, 5);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_0900
     * @tc.name int8ArrayCopyWithinPart01Test009
     * @tc.desc Verify target=length-1 only 1 element space count limited by target space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(4, 0, 3);
      expect(result.$_get(4)).assertEqual(1);
      expect(result.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_1000
     * @tc.name int8ArrayCopyWithinPart01Test010
     * @tc.desc Verify target=length clipped to length no operation array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(5, 0, 3);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_1100
     * @tc.name int8ArrayCopyWithinPart01Test011
     * @tc.desc Verify target=length+1 clipped to length no operation array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(6, 0, 3);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_1200
     * @tc.name int8ArrayCopyWithinPart01Test012
     * @tc.desc Verify target=-1 normalized to length-1 copy to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(-1, 0, 2);
      expect(result.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_1300
     * @tc.name int8ArrayCopyWithinPart01Test013
     * @tc.desc Verify target=-length normalized to 0 copy to start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(-5, 2, 4);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_1400
     * @tc.name int8ArrayCopyWithinPart01Test014
     * @tc.desc Verify target=-length-1 clipped to 0 copy to start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(-6, 2, 4);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_1500
     * @tc.name int8ArrayCopyWithinPart01Test015
     * @tc.desc Verify target=0x7FFFFFFF int max clipped to length no operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0x7FFFFFFF, 0, 3);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_1600
     * @tc.name int8ArrayCopyWithinPart01Test016
     * @tc.desc Verify target=-0x7FFFFFFF int near min clipped to 0 copy to start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(-0x7FFFFFFF, 2, 4);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_1700
     * @tc.name int8ArrayCopyWithinPart01Test017
     * @tc.desc Verify target=0 start=0 end=1 single element copy only overwrite 1 position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 0, 1);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_1800
     * @tc.name int8ArrayCopyWithinPart01Test018
     * @tc.desc Verify target=2 mid array copy 2 elements from start to mid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(2, 0, 2);
      expect(result.$_get(2)).assertEqual(1);
      expect(result.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_1900
     * @tc.name int8ArrayCopyWithinPart01Test019
     * @tc.desc Verify start=0 copy source elements from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(2, 0, 3);
      expect(result.$_get(2)).assertEqual(1);
      expect(result.$_get(3)).assertEqual(2);
      expect(result.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_2000
     * @tc.name int8ArrayCopyWithinPart01Test020
     * @tc.desc Verify start=1 copy from position 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 1, 3);
      expect(result.$_get(0)).assertEqual(2);
      expect(result.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_2100
     * @tc.name int8ArrayCopyWithinPart01Test021
     * @tc.desc Verify start=length-1 copy from last element only 1 source element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 4, 5);
      expect(result.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_2200
     * @tc.name int8ArrayCopyWithinPart01Test022
     * @tc.desc Verify start=length no source elements no operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 5, 5);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_2300
     * @tc.name int8ArrayCopyWithinPart01Test023
     * @tc.desc Verify start=length+1 clipped to length no source no operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 6, 8);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_2400
     * @tc.name int8ArrayCopyWithinPart01Test024
     * @tc.desc Verify start=-1 normalized to length-1 copy from last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, -1);
      expect(result.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_2500
     * @tc.name int8ArrayCopyWithinPart01Test025
     * @tc.desc Verify start=-length normalized to 0 copy from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(3, -5, 2);
      expect(result.$_get(3)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_2600
     * @tc.name int8ArrayCopyWithinPart01Test026
     * @tc.desc Verify start=-length-1 clipped to 0 copy from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(3, -6, 2);
      expect(result.$_get(3)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_2700
     * @tc.name int8ArrayCopyWithinPart01Test027
     * @tc.desc Verify start=0x7FFFFFFF int max clipped to length no source no operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 0x7FFFFFFF, 0x7FFFFFFF);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_2800
     * @tc.name int8ArrayCopyWithinPart01Test028
     * @tc.desc Verify start=-0x7FFFFFFF int near min clipped to 0 copy from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(3, -0x7FFFFFFF, 2);
      expect(result.$_get(3)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_2900
     * @tc.name int8ArrayCopyWithinPart01Test029
     * @tc.desc Verify start=0 end=length full source range copy to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 0, 5);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_3000
     * @tc.name int8ArrayCopyWithinPart01Test030
     * @tc.desc Verify start=2 end=3 mid section single element copy to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 2, 3);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_3100
     * @tc.name int8ArrayCopyWithinPart01Test031
     * @tc.desc Verify end default 2-arg call to length copy from start to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(1, 2);
      expect(result.$_get(1)).assertEqual(3);
      expect(result.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_3200
     * @tc.name int8ArrayCopyWithinPart01Test032
     * @tc.desc Verify end=0 empty range count negative no operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 0, 0);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_3300
     * @tc.name int8ArrayCopyWithinPart01Test033
     * @tc.desc Verify end=1 only 1 source element range copy single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(3, 0, 1);
      expect(result.$_get(3)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_3400
     * @tc.name int8ArrayCopyWithinPart01Test034
     * @tc.desc Verify end=length full source range from start to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 2, 5);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_3500
     * @tc.name int8ArrayCopyWithinPart01Test035
     * @tc.desc Verify end=length+1 clipped to length equivalent to end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 2, 6);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_3600
     * @tc.name int8ArrayCopyWithinPart01Test036
     * @tc.desc Verify end=-1 normalized to length-1 exclude last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 2, -1);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_3700
     * @tc.name int8ArrayCopyWithinPart01Test037
     * @tc.desc Verify end=-length normalized to 0 empty range no operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 0, -5);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_3800
     * @tc.name int8ArrayCopyWithinPart01Test038
     * @tc.desc Verify end=-length-1 clipped to 0 empty range no operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 0, -6);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_3900
     * @tc.name int8ArrayCopyWithinPart01Test039
     * @tc.desc Verify end=0x7FFFFFFF int max clipped to length copy to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 2, 0x7FFFFFFF);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_4000
     * @tc.name int8ArrayCopyWithinPart01Test040
     * @tc.desc Verify end=-0x7FFFFFFF int near min clipped to 0 empty range no operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 0, -0x7FFFFFFF);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_4100
     * @tc.name int8ArrayCopyWithinPart01Test041
     * @tc.desc Verify end<start negative count no operation array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 3, 2);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_4200
     * @tc.name int8ArrayCopyWithinPart01Test042
     * @tc.desc Verify end equals start zero count no operation array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 2, 2);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_4300
     * @tc.name int8ArrayCopyWithinPart01Test043
     * @tc.desc Verify end=3 start=1 partial range copy 2 elements verify mid section extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 1, 3);
      expect(result.$_get(0)).assertEqual(2);
      expect(result.$_get(1)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_4400
     * @tc.name int8ArrayCopyWithinPart01Test044
     * @tc.desc Verify end=4 start=0 4 elements from start copy near end count limited by target space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(3, 0, 4);
      expect(result.$_get(3)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_4500
     * @tc.name int8ArrayCopyWithinPart01Test045
     * @tc.desc Verify return byteLength equals original array verify Int8Array 1 byte per element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 3);
      expect(result.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_4600
     * @tc.name int8ArrayCopyWithinPart01Test046
     * @tc.desc Verify return value and original array share same reference modify result arr syncs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 3);
      result.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_4700
     * @tc.name int8ArrayCopyWithinPart01Test047
     * @tc.desc Verify length unchanged after copyWithin does not change array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let beforeLength: int = arr.length;
      arr.copyWithin(0, 3);
      expect(arr.length).assertEqual(beforeLength);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_4800
     * @tc.name int8ArrayCopyWithinPart01Test048
     * @tc.desc Verify chained copyWithin returns this for continued call verify accumulated effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 3).copyWithin(0, 2);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_4900
     * @tc.name int8ArrayCopyWithinPart01Test049
     * @tc.desc Verify overlapping copy start<target copy from back to front avoid overwriting source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(1, 0, 4);
      expect(result.$_get(1)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(2);
      expect(result.$_get(3)).assertEqual(3);
      expect(result.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_5000
     * @tc.name int8ArrayCopyWithinPart01Test050
     * @tc.desc Verify overlapping copy target<start copy front to back source not overwritten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 1, 5);
      expect(result.$_get(0)).assertEqual(2);
      expect(result.$_get(1)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(4);
      expect(result.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_5100
     * @tc.name int8ArrayCopyWithinPart01Test051
     * @tc.desc Verify overlapping copy target equals start source and target fully overlap no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(2, 2, 5);
      expect(result.$_get(2)).assertEqual(3);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_5200
     * @tc.name int8ArrayCopyWithinPart01Test052
     * @tc.desc Verify empty array copyWithin length=0 no operation returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.copyWithin(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_5300
     * @tc.name int8ArrayCopyWithinPart01Test053
     * @tc.desc Verify single element array copyWithin length=1 self-copy no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let result: Int8Array = arr.copyWithin(0, 0);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_5400
     * @tc.name int8ArrayCopyWithinPart01Test054
     * @tc.desc Verify start>=end count negative or zero silently no operation no error thrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, 4, 1);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_5500
     * @tc.name int8ArrayCopyWithinPart01Test055
     * @tc.desc Verify all three args near int min neg -0x7FFFFFFF all clipped to 0 no operation no error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(-0x7FFFFFFF, -0x7FFFFFFF, -0x7FFFFFFF);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_5600
     * @tc.name int8ArrayCopyWithinPart01Test056
     * @tc.desc Verify all three args int max 0x7FFFFFFF all clipped to length no operation no error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0x7FFFFFFF, 0x7FFFFFFF, 0x7FFFFFFF);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_5700
     * @tc.name int8ArrayCopyWithinPart01Test057
     * @tc.desc Verify array with -128 int8 min after copyWithin target keeps -128 not corrupted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(0, -128);
      arr.$_set(1, 0);
      arr.$_set(2, 0);
      let result: Int8Array = arr.copyWithin(2, 0, 1);
      expect(result.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_5800
     * @tc.name int8ArrayCopyWithinPart01Test058
     * @tc.desc Verify array with 128 $_set truncates to -128 after copyWithin target keeps -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(0, 128);
      arr.$_set(1, 0);
      arr.$_set(2, 0);
      let result: Int8Array = arr.copyWithin(2, 0, 1);
      expect(result.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_5900
     * @tc.name int8ArrayCopyWithinPart01Test059
     * @tc.desc Verify array with 256 $_set truncates to 0 after copyWithin target keeps 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(0, 256);
      arr.$_set(1, 0);
      arr.$_set(2, 0);
      let result: Int8Array = arr.copyWithin(2, 0, 1);
      expect(result.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_6000
     * @tc.name int8ArrayCopyWithinPart01Test060
     * @tc.desc Verify array with 1.9 constructor truncates to 1 after copyWithin target keeps 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.9, 2.0, 3.0];
      let arr: Int8Array = new Int8Array(src);
      let result: Int8Array = arr.copyWithin(2, 0, 1);
      expect(result.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_6100
     * @tc.name int8ArrayCopyWithinPart01Test061
     * @tc.desc Verify array with 0 int8 zero after copyWithin target keeps 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(0, 0);
      arr.$_set(1, -128);
      arr.$_set(2, -128);
      let result: Int8Array = arr.copyWithin(2, 0, 1);
      expect(result.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_6200
     * @tc.name int8ArrayCopyWithinPart01Test062
     * @tc.desc Verify multi boundary values -128 128 256 0 -128 copyWithin subset boundaries not corrupted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      arr.$_set(0, -128);
      arr.$_set(1, 128);
      arr.$_set(2, 256);
      arr.$_set(3, 0);
      arr.$_set(4, -128);
      let result: Int8Array = arr.copyWithin(3, 0, 2);
      expect(result.$_get(3)).assertEqual(-128);
      expect(result.$_get(4)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_6300
     * @tc.name int8ArrayCopyWithinPart01Test063
     * @tc.desc Verify overlapping copy with boundary values back to front copy not corrupt -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, -128);
      arr.$_set(1, 0);
      arr.$_set(2, 0);
      arr.$_set(3, 0);
      let result: Int8Array = arr.copyWithin(1, 0, 3);
      expect(result.$_get(1)).assertEqual(-128);
      expect(result.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_6400
     * @tc.name int8ArrayCopyWithinPart01Test064
     * @tc.desc Verify 0 from 256 truncation overwrites -128 position verifies truncated value correctly overwrites int8 min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(0, 256);
      arr.$_set(1, 0);
      arr.$_set(2, -128);
      let result: Int8Array = arr.copyWithin(2, 0, 1);
      expect(result.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_6500
     * @tc.name int8ArrayCopyWithinPart01Test065
     * @tc.desc Verify full boundary array self-copy target=0 start=0 end=length no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, -128);
      arr.$_set(1, 128);
      arr.$_set(2, 256);
      arr.$_set(3, 0);
      let result: Int8Array = arr.copyWithin(0, 0, 4);
      expect(result.$_get(0)).assertEqual(-128);
      expect(result.$_get(1)).assertEqual(-128);
      expect(result.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_6600
     * @tc.name int8ArrayCopyWithinPart01Test066
     * @tc.desc Verify -128 overwrites 0 position verifies int8 min correctly overwrites zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.$_set(0, -128);
      arr.$_set(1, 0);
      arr.$_set(2, 0);
      let result: Int8Array = arr.copyWithin(1, 0, 1);
      expect(result.$_get(1)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_6700
     * @tc.name int8ArrayCopyWithinPart01Test067
     * @tc.desc Verify two consecutive copyWithin with boundary values cumulative truncation not corrupted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      arr.$_set(0, -128);
      arr.$_set(1, 128);
      arr.$_set(2, 256);
      arr.$_set(3, 0);
      arr.$_set(4, -128);
      arr.copyWithin(0, 2, 4);
      arr.copyWithin(3, 0, 2);
      expect(arr.$_get(3)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_6800
     * @tc.name int8ArrayCopyWithinPart01Test068
     * @tc.desc Verify truncated float 1.9 to 1 overwrites int8 min -128 truncated value correctly overwrites
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.9, -128, 0];
      let arr: Int8Array = new Int8Array(src);
      let result: Int8Array = arr.copyWithin(1, 0, 1);
      expect(result.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_6900
     * @tc.name int8ArrayCopyWithinPart01Test069
     * @tc.desc Verify target positive start negative end positive mixed sign normalization copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(1, -2, 5);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_7000
     * @tc.name int8ArrayCopyWithinPart01Test070
     * @tc.desc Verify target mid=3 start=0 end=length count limited by target space to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(3, 0, 5);
      expect(result.$_get(3)).assertEqual(1);
      expect(result.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_7100
     * @tc.name int8ArrayCopyWithinPart01Test071
     * @tc.desc Verify target=2 start=0 end=1 single element from start copy to mid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(2, 0, 1);
      expect(result.$_get(2)).assertEqual(1);
      expect(result.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_7200
     * @tc.name int8ArrayCopyWithinPart01Test072
     * @tc.desc Verify start<target overlapping copy target=2 start=0 end=4 copy 3 elements back to front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(2, 0, 4);
      expect(result.$_get(2)).assertEqual(1);
      expect(result.$_get(3)).assertEqual(2);
      expect(result.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_COPY_WITHIN_PART01_TEST_7300
     * @tc.name int8ArrayCopyWithinPart01Test073
     * @tc.desc Verify start negative end oversized positive mixed normalization start to 2 end to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayCopyWithinPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.copyWithin(0, -3, 0x7FFFFFFF);
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(5);
    });

  });
}
