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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__0100
     * @tc.name int16ArrayFindLastIndexPart03Test001
     * @tc.desc Verify findLastIndex on zero-byte ArrayBuffer view returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__0200
     * @tc.name int16ArrayFindLastIndexPart03Test002
     * @tc.desc Verify findLastIndex on zero-byte ArrayBuffer view returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int16Array = new Int16Array(buf);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return value === 1;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__0300
     * @tc.name int16ArrayFindLastIndexPart03Test003
     * @tc.desc Verify findLastIndex on zero-length Int16Array view returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int16Array = new Int16Array(buf, 2, 0);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__0400
     * @tc.name int16ArrayFindLastIndexPart03Test004
     * @tc.desc Verify findLastIndex on zero-length Int16Array view returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: number[] = [];
      let arr: Int16Array = Int16Array.from(source);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return value > 0;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__0500
     * @tc.name int16ArrayFindLastIndexPart03Test005
     * @tc.desc Verify findLastIndex on zero-length Int16Array view returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return true;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__0600
     * @tc.name int16ArrayFindLastIndexPart03Test006
     * @tc.desc Verify findLastIndex on zero-length Int16Array view returns -1
     * @tc.size MediumTest
     * @tc.type Function
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
     * @tc.size MediumTest
     * @tc.type Function
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
     * @tc.size MediumTest
     * @tc.type Function
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
     * @tc.size MediumTest
     * @tc.type Function
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__1000
     * @tc.name int16ArrayFindLastIndexPart03Test010
     * @tc.desc Verify findLastIndex propagates TypeError thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let caught: boolean = false;
      try {
        arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
          throw new Error("predicate failure");
        });
      } catch (e) {
        caught = true;
        let actual: string = e.name;
        let expected: string = "Error";
        expect(actual).assertEqual(expected);
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__1100
     * @tc.name int16ArrayFindLastIndexPart03Test011
     * @tc.desc Verify findLastIndex propagates TypeError thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let caught: boolean = false;
      try {
        arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
          if (index === 2) {
            throw new Error("middle element error");
          }
          return false;
        });
      } catch (e) {
        caught = true;
        let actual: string = e.name;
        let expected: string = "Error";
        expect(actual).assertEqual(expected);
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__1200
     * @tc.name int16ArrayFindLastIndexPart03Test012
     * @tc.desc Verify findLastIndex propagates TypeError thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let caught: boolean = false;
      try {
        arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
          throw new TypeError("type mismatch in predicate");
        });
      } catch (e) {
        caught = true;
        let actual: string = e.name;
        let expected: string = "TypeError";
        expect(actual).assertEqual(expected);
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__1300
     * @tc.name int16ArrayFindLastIndexPart03Test013
     * @tc.desc Verify findLastIndex propagates RangeError thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
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
     * @tc.size MediumTest
     * @tc.type Function
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
     * @tc.size MediumTest
     * @tc.type Function
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__1600
     * @tc.name int16ArrayFindLastIndexPart03Test016
     * @tc.desc Verify findLastIndex on empty array returns -1 without calling throwing predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      try {
        arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
          throw new Error("custom-error-tag-9876");
        });
        expect().assertFail();
      } catch (e) {
        let actual: string = e.message;
        let expected: string = "custom-error-tag-9876";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__1700
     * @tc.name int16ArrayFindLastIndexPart03Test017
     * @tc.desc Verify findLastIndex on empty array returns -1 without calling throwing predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: int = -2;
      result = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        throw new Error("should never be called");
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__1800
     * @tc.name int16ArrayFindLastIndexPart03Test018
     * @tc.desc Verify findLastIndex on empty Int16Array returns -1
     * @tc.size MediumTest
     * @tc.type Function
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__1900
     * @tc.name int16ArrayFindLastIndexPart03Test019
     * @tc.desc Verify findLastIndex propagates Error thrown at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 200, 30, 400, 50);
      try {
        arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
          if (array.$_get(index) > 300) {
            throw new Error("array element too large");
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "Error";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__2000
     * @tc.name int16ArrayFindLastIndexPart03Test020
     * @tc.desc Verify findLastIndex preserves custom Error.name from predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, -10, 20, -30, 40);
      try {
        arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
          if (value < 0) {
            throw new Error("negative branch");
          }
          if (value === 0) {
            return false;
          }
          if (value > 30) {
            throw new Error("large branch");
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "Error";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__2100
     * @tc.name int16ArrayFindLastIndexPart03Test021
     * @tc.desc Verify findLastIndex preserves custom Error.name from predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      let errorName: string = '';
      try {
        arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
          let err: Error = new Error("named check");
          err.name = "CustomPredicateError";
          throw err;
        });
      } catch (e) {
        errorName = e.name;
      }
      expect(errorName).assertEqual("CustomPredicateError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__2200
     * @tc.name int16ArrayFindLastIndexPart03Test022
     * @tc.desc Verify findLastIndex propagates Error thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44);
      try {
        arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
          if (value === 22) {
            throw new Error("value 22 error");
          }
          return false;
        });
      } catch (e) {
        let actual5: string = e.name;
        let expected5: string = "Error";
        expect(actual5).assertEqual(expected5);
      }
      let actual: number = arr.$_get(0);
      let expected: int = 11;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 22;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 33;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: int = 44;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__2300
     * @tc.name int16ArrayFindLastIndexPart03Test023
     * @tc.desc Verify findLastIndex predicate array parameter is same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(2, 4, 6, 8, 10);
      let allReadCorrect: boolean = true;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (array.$_get(index) !== value) {
          allReadCorrect = false;
        }
        return false;
      });
      expect(allReadCorrect).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__2400
     * @tc.name int16ArrayFindLastIndexPart03Test024
     * @tc.desc Verify findLastIndex predicate array parameter is same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        array.$_set(index, 0);
        return false;
      });
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__2500
     * @tc.name int16ArrayFindLastIndexPart03Test025
     * @tc.desc Verify findLastIndex predicate array parameter is same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 14, 21);
      let isSameReference: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        isSameReference = array === arr;
        return true;
      });
      expect(isSameReference).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__2600
     * @tc.name int16ArrayFindLastIndexPart03Test026
     * @tc.desc Verify findLastIndex predicate sees stable array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 12, 5, 20, 5);
      let matched: number[] = [];
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (value === 5) {
          matched.push(index);
          return true;
        }
        return false;
      });
      let actual: int = matched.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = matched[0];
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__2700
     * @tc.name int16ArrayFindLastIndexPart03Test027
     * @tc.desc Verify findLastIndex predicate sees stable array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 6, 9, 12);
      let foundLarge: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (value > 10) {
          foundLarge = true;
          return true;
        }
        return false;
      });
      expect(foundLarge).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__2800
     * @tc.name int16ArrayFindLastIndexPart03Test028
     * @tc.desc Verify findLastIndex first checked index is length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let lengthConsistent: boolean = true;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (array.length !== 5) {
          lengthConsistent = false;
        }
        return false;
      });
      expect(lengthConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__2900
     * @tc.name int16ArrayFindLastIndexPart03Test029
     * @tc.desc Verify findLastIndex first checked index is length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index === 1) {
          array.$_set(index, 99);
          let readBack: number = array.$_get(index);
          return readBack === 99;
        }
        return false;
      });
      let actual: number = arr.$_get(1);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__3000
     * @tc.name int16ArrayFindLastIndexPart03Test030
     * @tc.desc Verify findLastIndex first checked index is length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
      let firstCallCount: int = 0;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        firstCallCount = firstCallCount + 1;
        return false;
      });
      let secondCallCount: int = 0;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        secondCallCount = secondCallCount + 1;
        return false;
      });
      expect(firstCallCount).assertEqual(4);
      expect(secondCallCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__3100
     * @tc.name int16ArrayFindLastIndexPart03Test031
     * @tc.desc Verify findLastIndex visits indices from length-1 down to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 1, 1, 1, 1);
      let anyNegative: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index < 0) {
          anyNegative = true;
        }
        return false;
      });
      expect(anyNegative).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__3200
     * @tc.name int16ArrayFindLastIndexPart03Test032
     * @tc.desc Verify findLastIndex visits indices from length-1 down to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
      let anyOutOfRange: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index >= arr.length) {
          anyOutOfRange = true;
        }
        return false;
      });
      expect(anyOutOfRange).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__3300
     * @tc.name int16ArrayFindLastIndexPart03Test033
     * @tc.desc Verify findLastIndex visits indices from length-1 down to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0, 0);
      let prevIndex: int = arr.length;
      let strictlyDecreasing: boolean = true;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index >= prevIndex) {
          strictlyDecreasing = false;
        }
        prevIndex = index;
        return false;
      });
      expect(strictlyDecreasing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__3400
     * @tc.name int16ArrayFindLastIndexPart03Test034
     * @tc.desc Verify findLastIndex visits indices from length-1 down to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0, 0);
      let visitedIndices: number[] = [];
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        visitedIndices.push(index);
        return false;
      });
      let actual: int = visitedIndices.length;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
      let actual2: number = visitedIndices[0];
      let expected2: int = 5;
      expect(actual2).assertEqual(expected2);
      let actual3: number = visitedIndices[5];
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__3500
     * @tc.name int16ArrayFindLastIndexPart03Test035
     * @tc.desc Verify findLastIndex predicate receives MAX value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = 32767
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
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = -32768
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
     * @tc.size MediumTest
     * @tc.type Function
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
     * @tc.size MediumTest
     * @tc.type Function
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
     * @tc.size MediumTest
     * @tc.type Function
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__4000
     * @tc.name int16ArrayFindLastIndexPart03Test040
     * @tc.desc Verify findLastIndex on Int16Array.from empty source returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([Number.POSITIVE_INFINITY, 60]);
      let infinityConvertedToZero: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0 && value === 0) {
          infinityConvertedToZero = true;
        }
        return false;
      });
      expect(infinityConvertedToZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__4100
     * @tc.name int16ArrayFindLastIndexPart03Test041
     * @tc.desc Verify findLastIndex on Int16Array.from empty source returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([70, Number.NEGATIVE_INFINITY]);
      let negInfinityConvertedToZero: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index === 1 && value === 0) {
          negInfinityConvertedToZero = true;
        }
        return false;
      });
      expect(negInfinityConvertedToZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__4200
     * @tc.name int16ArrayFindLastIndexPart03Test042
     * @tc.desc Verify findLastIndex receives truncated value 3 after $_set(Double.toInt(3.7))
     * @tc.size MediumTest
     * @tc.type Function
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
     * @tc.size MediumTest
     * @tc.type Function
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__4400
     * @tc.name int16ArrayFindLastIndexPart03Test044
     * @tc.desc Verify findLastIndex on Int16Array.from empty source returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200);
      arr.$_set(0, -32769);
      let overflowWrapped: number = 0;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index === 0) {
          overflowWrapped = value;
          return true;
        }
        return false;
      });
      expect(overflowWrapped).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__4500
     * @tc.name int16ArrayFindLastIndexPart03Test045
     * @tc.desc Verify findLastIndex on Int16Array.from empty source returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArr: number[] = [];
      for (let i: int = 0; i < 100; i = i + 1) {
        sourceArr.push(1);
      }
      let arr: Int16Array = Int16Array.from(sourceArr);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return value > 32767;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__4600
     * @tc.name int16ArrayFindLastIndexPart03Test046
     * @tc.desc Verify findLastIndex returns -1 when predicate never matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 3, 3, 3);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return array.length === 4 && value === 3;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART03__4700
     * @tc.name int16ArrayFindLastIndexPart03Test047
     * @tc.desc Verify findLastIndex returns -1 when predicate never matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart03Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15, 20, 25);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return index > 0 && array.$_get(index - 1) < value;
      });
      expect(result).assertEqual(4);
    });

  });
}
