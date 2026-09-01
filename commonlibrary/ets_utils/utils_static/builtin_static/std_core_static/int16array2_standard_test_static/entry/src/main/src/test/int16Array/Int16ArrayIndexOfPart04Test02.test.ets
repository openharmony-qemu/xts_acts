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

export default function int16ArrayIndexOfPart04Test02Test(): void {
  describe("Int16ArrayIndexOfPart04Test02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_02_0100
     * @tc.name int16ArrayIndexOfPart04Test02001
     * @tc.desc Verify indexOf after $_set with from()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test02001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = [10, 20, 30] as number[];
      let arr = Int16Array.from(source);
      arr.$_set(2, 99);
      let result = arr.indexOf(99);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_02_0200
     * @tc.name int16ArrayIndexOfPart04Test02002
     * @tc.desc Verify indexOf with from()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test02002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = [1, 2, 3] as number[];
      let arr = Int16Array.from(source, (v: number): number => { return v * 2; });
      let result = arr.indexOf(4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_02_0300
     * @tc.name int16ArrayIndexOfPart04Test02003
     * @tc.desc Verify indexOf after reverse after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test02003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4]);
      arr.reverse();
      arr.copyWithin(0, 2);
      let result = arr.indexOf(2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_02_0400
     * @tc.name int16ArrayIndexOfPart04Test02004
     * @tc.desc Verify indexOf after fill after set with of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test02004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0, 0, 0]);
      arr.fill(5);
      let src = Int16Array.of(9, 9);
      arr.set(src, 1);
      let resultFill = arr.indexOf(5);
      expect(resultFill).assertEqual(0);
      let resultSet = arr.indexOf(9);
      expect(resultSet).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_02_0500
     * @tc.name int16ArrayIndexOfPart04Test02005
     * @tc.desc Verify indexOf after fill after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test02005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      arr.copyWithin(0, 2);
      arr.fill(7, 3);
      let result = arr.indexOf(7);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_02_0600
     * @tc.name int16ArrayIndexOfPart04Test02006
     * @tc.desc Verify indexOf after fill with from() with overflow truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test02006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = [1, 2, 3] as number[];
      let arr = Int16Array.from(source);
      arr.fill(32768);
      let val:short = -32768
      let result = arr.indexOf(val);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_02_0700
     * @tc.name int16ArrayIndexOfPart04Test02007
     * @tc.desc Verify indexOf after $_set out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test02007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      try {
        arr.$_set(5, 99);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_02_0800
     * @tc.name int16ArrayIndexOfPart04Test02008
     * @tc.desc Verify indexOf after $_set out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test02008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      try {
        arr.$_set(-1, 77);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_02_0900
     * @tc.name int16ArrayIndexOfPart04Test02009
     * @tc.desc Verify indexOf after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test02009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.fill(-0);
      let result = arr.indexOf(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_02_1000
     * @tc.name int16ArrayIndexOfPart04Test02010
     * @tc.desc Verify indexOf with of() nested/chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test02010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(7, 14, 21, 28);
      let index0 = arr.indexOf(7);
      let index1 = arr.indexOf(14);
      let index2 = arr.indexOf(21);
      let index3 = arr.indexOf(28);
      expect(index0).assertEqual(0);
      expect(index1).assertEqual(1);
      expect(index2).assertEqual(2);
      expect(index3).assertEqual(3);
    });

  });
}
