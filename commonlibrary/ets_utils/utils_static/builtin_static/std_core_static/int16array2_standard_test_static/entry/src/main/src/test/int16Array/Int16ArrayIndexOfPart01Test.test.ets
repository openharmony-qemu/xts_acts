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
} from "../../../../hypium/index";
import Utils from "../Util.test";

export default function int16ArrayIndexOfPart01Test(): void {
  describe("Int16ArrayIndexOfPart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART01__0100
     * @tc.name int16ArrayIndexOfPart01Test001
     * @tc.desc Verify arr.indexOf(10) on new Int16Array([10, 20, 30]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart01Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let actual: int = arr.indexOf(10);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART01__0200
     * @tc.name int16ArrayIndexOfPart01Test002
     * @tc.desc Verify arr.indexOf(Number.NaN) on new Int16Array([1, 2, 3]) with NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart01Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let actual: int = arr.indexOf(Number.NaN);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART01__0300
     * @tc.name int16ArrayIndexOfPart01Test003
     * @tc.desc Verify arr.indexOf(Number.NaN) on new Int16Array([]) with NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart01Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      let actual: int = arr.indexOf(Number.NaN);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART01__0400
     * @tc.name int16ArrayIndexOfPart01Test004
     * @tc.desc Verify arr.indexOf(Number.POSITIVE_INFINITY) on new Int16Array([10, 0, 20]) with Infinity returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart01Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 0, 20]);
      let actual: int = arr.indexOf(Number.POSITIVE_INFINITY);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART01__0500
     * @tc.name int16ArrayIndexOfPart01Test005
     * @tc.desc Verify arr.indexOf(Number.NEGATIVE_INFINITY) on new Int16Array([10, 0, 20]) with -Infinity returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart01Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 0, 20]);
      let actual: int = arr.indexOf(Number.NEGATIVE_INFINITY);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

  });
}
