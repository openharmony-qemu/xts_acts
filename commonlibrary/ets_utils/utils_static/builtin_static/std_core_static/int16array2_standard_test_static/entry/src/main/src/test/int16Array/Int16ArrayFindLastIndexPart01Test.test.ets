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

function isPositive(value: number, index: int, array: Int16Array): boolean {
  return value > 0;
}

class PredicateHelper_007 {
  static isLarge(value: number, index: int, array: Int16Array): boolean {
    return value > 1000;
  }
}

class Matcher_008 {
  target: number = 0;
  constructor(t: number) {
    this.target = t;
  }
  matches(value: number, index: int, array: Int16Array): boolean {
    return value === this.target;
  }
}

function createPredicate(threshold: number): (value: number, index: int, array: Int16Array) => boolean {
  return (value: number, index: int, array: Int16Array): boolean => value > threshold;
}

function getMatcher(target: number): (value: number, index: int, array: Int16Array) => boolean {
  return (value: number, index: int, array: Int16Array): boolean => {
    return value === target;
  };
}

export default function int16ArrayFindLastIndexPart01Test(): void {
  describe("Int16ArrayFindLastIndexPart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__0100
     * @tc.name int16ArrayFindLastIndexPart01Test001
     * @tc.desc Verify findLastIndex with 1 param predicate returns int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return value === 20;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__0200
     * @tc.name int16ArrayFindLastIndexPart01Test002
     * @tc.desc Verify findLastIndex with class static method predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([500, 1500, 800]);
      let result: int = arr.findLastIndex(PredicateHelper_007.isLarge);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__0300
     * @tc.name int16ArrayFindLastIndexPart01Test003
     * @tc.desc Verify findLastIndex with class instance method via arrow predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 9, 7, 11]);
      let m: Matcher_008 = new Matcher_008(7);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return m.matches(value, index, array);
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__0400
     * @tc.name int16ArrayFindLastIndexPart01Test004
     * @tc.desc Verify findLastIndex predicate using only array length parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15, 20]);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => array.length > 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__0500
     * @tc.name int16ArrayFindLastIndexPart01Test005
     * @tc.desc Verify findLastIndex predicate using value and array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14, 21]);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return value === array.$_get(index);
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__0600
     * @tc.name int16ArrayFindLastIndexPart01Test006
     * @tc.desc Verify findLastIndex predicate using index and array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([8, 16, 24, 32]);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return index === array.length - 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__0700
     * @tc.name int16ArrayFindLastIndexPart01Test007
     * @tc.desc Verify findLastIndex predicate using value index and array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 6, 9, 12, 15]);
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return value === array.$_get(index) && index >= 2 && array.length === 5;
      });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__0800
     * @tc.name int16ArrayFindLastIndexPart01Test008
     * @tc.desc Verify findLastIndex predicate ignores params but updates external callCount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let callCount: int = 0;
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        callCount = callCount + 1;
        return false;
      });
      expect(result).assertEqual(-1);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__0900
     * @tc.name int16ArrayFindLastIndexPart01Test009
     * @tc.desc Verify findLastIndex value equals array.$_get(index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([12, 24, 36, 48]);
      let allMatch: boolean = true;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (value !== array.$_get(index)) {
          allMatch = false;
        }
        return false;
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__1000
     * @tc.name int16ArrayFindLastIndexPart01Test010
     * @tc.desc Verify findLastIndex array parameter is same Int16Array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14, 21]);
      let isSameRef: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        isSameRef = (array === arr);
        return false;
      });
      expect(isSameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__1100
     * @tc.name int16ArrayFindLastIndexPart01Test011
     * @tc.desc Verify findLastIndex array parameter readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([2, 4, 6, 8]);
      let canRead: boolean = true;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (array.$_get(0) !== 2) {
          canRead = false;
        }
        return false;
      });
      expect(canRead).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__1200
     * @tc.name int16ArrayFindLastIndexPart01Test012
     * @tc.desc Verify findLastIndex array parameter length matches source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6]);
      let lengthInPred: int = 0;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        lengthInPred = array.length;
        return false;
      });
      expect(lengthInPred).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__1300
     * @tc.name int16ArrayFindLastIndexPart01Test013
     * @tc.desc Verify findLastIndex value equals array.$_get at matched index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-5, 0, 5, 10]);
      let matchAtIndex2: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (index === 2) {
          matchAtIndex2 = (value === array.$_get(2));
        }
        return false;
      });
      expect(matchAtIndex2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__1400
     * @tc.name int16ArrayFindLastIndexPart01Test014
     * @tc.desc Verify findLastIndex propagates Error thrown inside predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      try {
        arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
          throw new Error("predicate error");
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__1500
     * @tc.name int16ArrayFindLastIndexPart01Test015
     * @tc.desc Verify findLastIndex preserves Error message thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20]);
      let caughtMsg: string = "";
      try {
        arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
          throw new Error("custom-message-xyz");
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
        caughtMsg = e.message;
      }
      expect(caughtMsg).assertEqual("custom-message-xyz");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__1600
     * @tc.name int16ArrayFindLastIndexPart01Test016
     * @tc.desc Verify findLastIndex read-only traversal leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let originalLength: int = arr.length;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        return value > 0;
      });
      let actual: int = arr.length;
      let expected: number = originalLength;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(0);
      let expected2: int = 10;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(1);
      let expected3: int = 20;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(2);
      let expected4: int = 30;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__1700
     * @tc.name int16ArrayFindLastIndexPart01Test017
     * @tc.desc Verify findLastIndex nested call inside predicate returns correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15, 20]);
      let outerIndex: int = -1;
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        outerIndex = index;
        let innerResult: int = arr.findLastIndex((v: number, i: int, a: Int16Array): boolean => v === 5);
        return innerResult === 0 && value > 10;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__1800
     * @tc.name int16ArrayFindLastIndexPart01Test018
     * @tc.desc Verify findLastIndex predicate captures external string variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let tag: string = "found";
      let matched: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (value === 20 && tag === "found") {
          matched = true;
        }
        return value === 20;
      });
      expect(matched).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__1900
     * @tc.name int16ArrayFindLastIndexPart01Test019
     * @tc.desc Verify findLastIndex on empty array never calls predicate returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      let called: boolean = false;
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        called = true;
        return true;
      });
      expect(result).assertEqual(-1);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__2000
     * @tc.name int16ArrayFindLastIndexPart01Test020
     * @tc.desc Verify findLastIndex on single-element array calls predicate once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      let callCount: int = 0;
      let result: int = arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(result).assertEqual(0);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__2100
     * @tc.name int16ArrayFindLastIndexPart01Test021
     * @tc.desc Verify findLastIndex on two-element array iterates reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20]);
      let visitedIndices: number[] = [];
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        visitedIndices.push(index);
        return false;
      });
      let actual: number = visitedIndices[0];
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = visitedIndices[1];
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_LAST_INDEX_PART01__2200
     * @tc.name int16ArrayFindLastIndexPart01Test022
     * @tc.desc Verify findLastIndex on all-zero array passes zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayFindLastIndexPart01Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0]);
      let allZero: boolean = true;
      arr.findLastIndex((value: number, index: int, array: Int16Array): boolean => {
        if (value !== 0) {
          allZero = false;
        }
        return false;
      });
      expect(allZero).assertTrue();
    });

  });
}
