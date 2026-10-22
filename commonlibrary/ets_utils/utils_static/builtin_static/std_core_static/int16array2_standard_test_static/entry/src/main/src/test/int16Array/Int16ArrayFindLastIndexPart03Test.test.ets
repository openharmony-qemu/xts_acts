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

export default function int16ArrayFindLastIndexPart03Test(): void {
  describe("Int16ArrayFindLastIndexPart03Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__0600
     * @tc.name int16ArrayFindLastIndexPart03Test006
     * @tc.desc Verify findLastIndex on zero-length Int16Array view returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let callCount: int = 0;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__0700
     * @tc.name int16ArrayFindLastIndexPart03Test007
     * @tc.desc Verify findLastIndex on zero-length Int16Array view returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int16Array = new Int16Array(buf, 4, 0);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return false;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__0800
     * @tc.name int16ArrayFindLastIndexPart03Test008
     * @tc.desc Verify findLastIndex on zero-length Int16Array view returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int16Array = new Int16Array(buf, 0, 0);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return value !== 0;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__0900
     * @tc.name int16ArrayFindLastIndexPart03Test009
     * @tc.desc Verify findLastIndex returns 0 when predicate matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return value === 5;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__1300
     * @tc.name int16ArrayFindLastIndexPart03Test013
     * @tc.desc Verify findLastIndex propagates RangeError thrown by predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let caught: boolean = false;
      try {
        arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
          throw new RangeError("out of range in predicate");
        });
      } catch (e) {
        caught = true;
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__1400
     * @tc.name int16ArrayFindLastIndexPart03Test014
     * @tc.desc Verify findLastIndex preserves Error message from predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      let errorMessage: string = '';
      try {
        arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
          throw new Error("specific-error-msg-12345");
        });
      } catch (e) {
        errorMessage = e.message;
      }
      expect(errorMessage).assertEqual("specific-error-msg-12345");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__1500
     * @tc.name int16ArrayFindLastIndexPart03Test015
     * @tc.desc Verify findLastIndex propagates Error thrown by predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 8, 9);
      try {
        arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
          throw new Error("wrapped throw");
        });
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "Error";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__1800
     * @tc.name int16ArrayFindLastIndexPart03Test018
     * @tc.desc Verify findLastIndex on empty Int16Array returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let threwError: boolean = false;
      try {
        arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
          threwError = true;
          throw new Error("never");
        });
      } catch (e) {
        threwError = true;
      }
      expect(threwError).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__3500
     * @tc.name int16ArrayFindLastIndexPart03Test035
     * @tc.desc Verify findLastIndex predicate receives MAX value 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = 32767;
      let arr: Int16Array = Int16Array.of(val, 100);
      let maxPassedCorrect: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (value === val) {
          maxPassedCorrect = true;
          return true;
        }
        return false;
      });
      expect(maxPassedCorrect).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__3600
     * @tc.name int16ArrayFindLastIndexPart03Test036
     * @tc.desc Verify findLastIndex predicate receives MIN value -32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = -32768;
      let arr: Int16Array = Int16Array.of(val, 200);
      let minPassedCorrect: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (value === val) {
          minPassedCorrect = true;
          return true;
        }
        return false;
      });
      expect(minPassedCorrect).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__3700
     * @tc.name int16ArrayFindLastIndexPart03Test037
     * @tc.desc Verify findLastIndex receives 0 to predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 50);
      let zeroPassedCorrect: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (value === 0) {
          zeroPassedCorrect = true;
          return true;
        }
        return false;
      });
      expect(zeroPassedCorrect).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__3800
     * @tc.name int16ArrayFindLastIndexPart03Test038
     * @tc.desc Verify findLastIndex receives 0 after NaN element conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.$_set(0, 32768);
      let wrappedValue: number = 0;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          wrappedValue = value;
          return true;
        }
        return false;
      });
      expect(wrappedValue).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__3900
     * @tc.name int16ArrayFindLastIndexPart03Test039
     * @tc.desc Verify findLastIndex receives 0 after NaN element conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, Number.NaN]);
      let nanConvertedToZero: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index === 1 && value === 0) {
          nanConvertedToZero = true;
        }
        return false;
      });
      expect(nanConvertedToZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__4200
     * @tc.name int16ArrayFindLastIndexPart03Test042
     * @tc.desc Verify findLastIndex receives truncated value 3 after $_set(Double.toInt(3.7))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      arr.$_set(0, Double.toInt(3.7));
      let truncatedValue: number = 0;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          truncatedValue = value;
          return true;
        }
        return false;
      });
      expect(truncatedValue).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__4300
     * @tc.name int16ArrayFindLastIndexPart03Test043
     * @tc.desc Verify findLastIndex receives truncated value -3 after $_set(Double.toInt(-3.7))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      arr.$_set(1, Double.toInt(-3.7));
      let negTruncatedValue: number = 0;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index === 1) {
          negTruncatedValue = value;
          return true;
        }
        return false;
      });
      expect(negTruncatedValue).assertEqual(-3);
    });

  });
}
