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
  afterAll, afterEach, beforeAll, beforeEach, describe,
  expect, it, Level, Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function ArrayCopyWithin3Test(): void {
  describe('ArrayCopyWithin3Test', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    beforeEach(async (): Promise<void> => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
    });

    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });

    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0100
     * @tc.name testArrayCopyWithin001
     * @tc.desc Verify copyWithin accepts target and start int parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd');
      arr.copyWithin(1, 2);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('c');
      expect(arr[2]).assertEqual('d');
      expect(arr[3]).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0200
     * @tc.name testArrayCopyWithin002
     * @tc.desc Verify the omitted end parameter defaults to the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0300
     * @tc.name testArrayCopyWithin003
     * @tc.desc Verify copyWithin returns the array instance itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.copyWithin(1, 2);
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0400
     * @tc.name testArrayCopyWithin004
     * @tc.desc Verify copyWithin mutates the original array in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const originalRef = arr;
      arr.copyWithin(1, 2);
      expect(arr === originalRef).assertTrue();
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0500
     * @tc.name testArrayCopyWithin005
     * @tc.desc Verify no change occurs when start is greater than or equal to the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const original = arr.toString();
      arr.copyWithin(0, 10);
      expect(arr.toString()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0600
     * @tc.name testArrayCopyWithin006
     * @tc.desc Verify no change occurs when target equals start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.copyWithin(2, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_THREE_0700
     * @tc.name testArrayCopyWithin007
     * @tc.desc Verify copyWithin can duplicate a leading segment to the tail of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayCopyWithin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.copyWithin(2, 0);
      expect(arr.toString()).assertEqual('1,2,1,2');
    });
  });
}
