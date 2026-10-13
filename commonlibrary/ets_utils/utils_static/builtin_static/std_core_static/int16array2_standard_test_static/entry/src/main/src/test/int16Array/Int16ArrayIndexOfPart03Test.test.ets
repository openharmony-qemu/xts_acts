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
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 10, 15]);
      let result = arr.indexOf(Number.NaN, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART03__1000
     * @tc.name int16ArrayIndexOfPart03Test010
     * @tc.desc Verify indexOf(Number.POSITIVE_INFINITY, 0) on Int16Array([5, 0, 10]) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart03Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 0, 10]);
      let result = arr.indexOf(Number.POSITIVE_INFINITY, 0);
      expect(result).assertEqual(-1);
    });

  });
}
