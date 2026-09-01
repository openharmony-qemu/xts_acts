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

export default function int16ArrayIndexOfPart03Test(): void {
  describe("Int16ArrayIndexOfPart03Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__0100
     * @tc.name int16ArrayIndexOfPart03Test001
     * @tc.desc Verify indexOf(42) on Int16Array([42]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let result = arr.indexOf(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__0200
     * @tc.name int16ArrayIndexOfPart03Test002
     * @tc.desc Verify indexOf(Number.NaN, 0) on Int16Array([5, 10, 15]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 10, 15]);
      let result = arr.indexOf(Number.NaN, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__0300
     * @tc.name int16ArrayIndexOfPart03Test003
     * @tc.desc Verify indexOf(Number.NaN, 1) on Int16Array([5, 10, 15]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 10, 15]);
      let result = arr.indexOf(Number.NaN, 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__0400
     * @tc.name int16ArrayIndexOfPart03Test004
     * @tc.desc Verify indexOf(Number.NaN, -1) on Int16Array([5, 10, 15]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 10, 15]);
      let result = arr.indexOf(Number.NaN, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__0500
     * @tc.name int16ArrayIndexOfPart03Test005
     * @tc.desc Verify indexOf(Number.NaN, 3) on Int16Array([5, 10, 15]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 10, 15]);
      let result = arr.indexOf(Number.NaN, 3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__0600
     * @tc.name int16ArrayIndexOfPart03Test006
     * @tc.desc Verify indexOf(Number.NaN) on Int16Array([100]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([100]);
      let result = arr.indexOf(Number.NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__0700
     * @tc.name int16ArrayIndexOfPart03Test007
     * @tc.desc Verify indexOf(Number.NaN) on Int16Array([8, 8, 8, 8]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([8, 8, 8, 8]);
      let result = arr.indexOf(Number.NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__0800
     * @tc.name int16ArrayIndexOfPart03Test008
     * @tc.desc Verify indexOf(Number.NaN) on Int16Array([0, 0, 0]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      let result = arr.indexOf(Number.NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__0900
     * @tc.name int16ArrayIndexOfPart03Test009
     * @tc.desc Verify indexOf(Number.NaN) on Int16Array([32767, 0, 1]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = 32767
      let arr = new Int16Array([val, 0, 1]);
      let result = arr.indexOf(Number.NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__1000
     * @tc.name int16ArrayIndexOfPart03Test010
     * @tc.desc Verify indexOf(Number.POSITIVE_INFINITY, 0) on Int16Array([5, 0, 10]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 0, 10]);
      let result = arr.indexOf(Number.POSITIVE_INFINITY, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__1100
     * @tc.name int16ArrayIndexOfPart03Test011
     * @tc.desc Verify indexOf(Number.POSITIVE_INFINITY, 2) on Int16Array([5, 0, 10]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 0, 10]);
      let result = arr.indexOf(Number.POSITIVE_INFINITY, 2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__1200
     * @tc.name int16ArrayIndexOfPart03Test012
     * @tc.desc Verify indexOf(-Number.POSITIVE_INFINITY, -1) on Int16Array([0, 5, 10]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 5, 10]);
      let result = arr.indexOf(-Number.POSITIVE_INFINITY, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__1300
     * @tc.name int16ArrayIndexOfPart03Test013
     * @tc.desc Verify indexOf(Number.POSITIVE_INFINITY) on Int16Array([0]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      let result = arr.indexOf(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__1400
     * @tc.name int16ArrayIndexOfPart03Test014
     * @tc.desc Verify indexOf(-Number.POSITIVE_INFINITY) on Int16Array([0, 0, 0, 0]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0, 0]);
      let result = arr.indexOf(-Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__1500
     * @tc.name int16ArrayIndexOfPart03Test015
     * @tc.desc Verify indexOf(Number.POSITIVE_INFINITY, 2) on Int16Array([0, 0, 0, 0]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0, 0]);
      let result = arr.indexOf(Number.POSITIVE_INFINITY, 2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__1600
     * @tc.name int16ArrayIndexOfPart03Test016
     * @tc.desc Verify indexOf(-Number.POSITIVE_INFINITY) on Int16Array([]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([]);
      let result = arr.indexOf(-Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__1700
     * @tc.name int16ArrayIndexOfPart03Test017
     * @tc.desc Verify indexOf(Number.POSITIVE_INFINITY) on Int16Array([0, 0, 0, 0, 0]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0, 0, 0]);
      let result = arr.indexOf(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

  });
}
