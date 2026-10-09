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

export default function int16ArrayConstructorPart15Test(): void {
  describe("Int16ArrayConstructorPart15Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART15__0200
     * @tc.name int16ArrayConstructorPart15Test002
     * @tc.desc Verify new Int16Array buf ArrayBuffer(0 )
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart15Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Int16Array(buf);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteLength;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART15__0300
     * @tc.name int16ArrayConstructorPart15Test003
     * @tc.desc Verify new Int16Array ArrayBuffer 100 bytes creates length 50 view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart15Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(100);
      const arr = new Int16Array(buf);
      let actual: int = arr.length;
      let expected: int = 50;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART15__0500
     * @tc.name int16ArrayConstructorPart15Test005
     * @tc.desc Verify new Int16Array(ArrayBuffer 1, 0, 0) keeps byteLength as remaining bytes 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart15Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1);
      const arr = new Int16Array(buf, 0, 0);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteLength;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

  });
}
