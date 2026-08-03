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
} from '../../../../hypium/index';
import Utils from '../Util.test';

class Item008 {
  value: number = 0;
}

export default function ArrayCopyWithin1Test(): void {
  describe('ArrayCopyWithin1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0100
     * @tc.name testArrayCopyWithin1001
     * @tc.desc Verify copyWithin accepts target start and end parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd', 'e');
      arr.copyWithin(0, 3, 4);
      expect(arr.toString()).assertEqual('d,b,c,d,e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0200
     * @tc.name testArrayCopyWithin1002
     * @tc.desc Verify copyWithin defaults end to the array length when only target and start are provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 3);
      expect(arr.toString()).assertEqual('4,5,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0300
     * @tc.name testArrayCopyWithin1003
     * @tc.desc Verify the target parameter determines the destination index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(2, 0, 2);
      expect(arr.toString()).assertEqual('1,2,1,2,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0400
     * @tc.name testArrayCopyWithin1004
     * @tc.desc Verify the start parameter determines the source start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2);
      expect(arr.toString()).assertEqual('3,4,5,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0500
     * @tc.name testArrayCopyWithin1005
     * @tc.desc Verify the end parameter limits the copied source range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 1, 3);
      expect(arr.toString()).assertEqual('2,3,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0600
     * @tc.name testArrayCopyWithin1006
     * @tc.desc Verify an undefined end parameter is treated as the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.copyWithin(0, 2, undefined);
      expect(arr.toString()).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0700
     * @tc.name testArrayCopyWithin1007
     * @tc.desc Verify negative target/start/end indices are resolved from the end for copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(-2, 0, 2);
      expect(arr.toString()).assertEqual('1,2,3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0800
     * @tc.name testArrayCopyWithin1008
     * @tc.desc Verify out-of-range parameters are clamped by the runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.copyWithin(10, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_0900
     * @tc.name testArrayCopyWithin1009
     * @tc.desc Verify copyWithin returns the modified array itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.copyWithin(0, 2);
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1000
     * @tc.name testArrayCopyWithin1010
     * @tc.desc Verify copyWithin supports chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.copyWithin(0, 3).copyWithin(3, 0, 2);
      expect(result.length).assertEqual(5);
      expect(result.toString()).assertEqual('4,5,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1100
     * @tc.name testArrayCopyWithin1011
     * @tc.desc Verify copyWithin mutates the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.copyWithin(0, 2);
      expect(arr.toString()).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1200
     * @tc.name testArrayCopyWithin1012
     * @tc.desc Verify copyWithin does not change the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const originalLength = arr.length;
      arr.copyWithin(0, 2);
      expect(arr.length).assertEqual(originalLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1300
     * @tc.name testArrayCopyWithin1013
     * @tc.desc Verify copyWithin uses shallow copies for object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item008>();
      const item = new Item008();
      item.value = 100;
      arr.push(item, new Item008());

      arr.copyWithin(0, 1);
      arr[0].value = 200;

      expect(arr[1].value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1400
     * @tc.name testArrayCopyWithin1014
     * @tc.desc Verify copyWithin on an empty array returns an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.copyWithin(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1500
     * @tc.name testArrayCopyWithin1015
     * @tc.desc Verify copyWithin on a single-element array keeps the element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(100, 200);
      arr.pop();
      arr.copyWithin(0, 0);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_ONE_1600
     * @tc.name testArrayCopyWithin1016
     * @tc.desc Verify copyWithin can duplicate a source segment to another position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr.copyWithin(1, 0);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('a');
      expect(arr[2]).assertEqual('b');
    });
  });
}
