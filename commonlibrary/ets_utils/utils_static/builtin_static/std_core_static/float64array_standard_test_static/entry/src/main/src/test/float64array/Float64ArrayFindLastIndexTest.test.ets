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
import Utils, { predFn005, setFlagFn } from '../Util.test';

export default function Float64ArrayFindLastIndexTest(): void {
  describe('Float64ArrayFindLastIndexTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0010
     * @tc.name testFloat64ArrayFindLastIndex001
     * @tc.desc Verify findLastIndex with three-parameter callback using value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 1.0;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0020
     * @tc.name testFloat64ArrayFindLastIndex002
     * @tc.desc Verify findLastIndex with two-parameter callback using index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return index > 1;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0030
     * @tc.name testFloat64ArrayFindLastIndex003
     * @tc.desc Verify findLastIndex with three-parameter callback using array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return array.$_get(index) > 1.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0040
     * @tc.name testFloat64ArrayFindLastIndex004
     * @tc.desc Verify findLastIndex with arrow function predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value > 3.0;
      })

      const expectVal = fourValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0050
     * @tc.name testFloat64ArrayFindLastIndex005
     * @tc.desc Verify findLastIndex with named function predicate from helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const result = arr.findLastIndex(predFn005);
      const expectVal = threeValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0060
     * @tc.name testFloat64ArrayFindLastIndex006
     * @tc.desc Verify findLastIndex with predicate always returning true returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value > 0.0;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0070
     * @tc.name testFloat64ArrayFindLastIndex007
     * @tc.desc Verify findLastIndex with predicate always returning false returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 100.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0080
     * @tc.name testFloat64ArrayFindLastIndex008
     * @tc.desc Verify findLastIndex returns last matching index with duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value > 4.0;
      })

      const expectVal = fourValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0090
     * @tc.name testFloat64ArrayFindLastIndex009
     * @tc.desc Verify findLastIndex with index parameter condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return index >= 3;
      })

      const expectVal = fourValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0100
     * @tc.name testFloat64ArrayFindLastIndex010
     * @tc.desc Verify findLastIndex callback throws RangeError and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
          throw new RangeError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0110
     * @tc.name testFloat64ArrayFindLastIndex011
     * @tc.desc Verify findLastIndex callback throws TypeError and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      try {
        arr.findLastIndex((value: number): boolean => {
          throw new TypeError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0120
     * @tc.name testFloat64ArrayFindLastIndex012
     * @tc.desc Verify findLastIndex callback throws Error and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      try {
        arr.findLastIndex((value: number, index: int): boolean => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0130
     * @tc.name testFloat64ArrayFindLastIndex013
     * @tc.desc Verify findLastIndex callback throws SyntaxError and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      try {
        arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
          throw new SyntaxError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("SyntaxError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0140
     * @tc.name testFloat64ArrayFindLastIndex014
     * @tc.desc Verify findLastIndex callback throws ReferenceError and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.findLastIndex((value: number): boolean => {
          throw new ReferenceError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ReferenceError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0150
     * @tc.name testFloat64ArrayFindLastIndex015
     * @tc.desc Verify findLastIndex callback throws URIError and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      try {
        arr.findLastIndex((value: number, index: int): boolean => {
          throw new URIError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("URIError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0160
     * @tc.name testFloat64ArrayFindLastIndex016
     * @tc.desc Verify findLastIndex callback throws EvalError and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      try {
        arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
          throw new EvalError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("EvalError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0170
     * @tc.name testFloat64ArrayFindLastIndex017
     * @tc.desc Verify findLastIndex callback throws Error at last element first checked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      try {
        arr.findLastIndex((value: number, index: int): boolean => {
          if (index === 2) {
            throw new Error("last");
          }
          return false;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0180
     * @tc.name testFloat64ArrayFindLastIndex018
     * @tc.desc Verify findLastIndex callback throws Error at middle element and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      try {
        arr.findLastIndex((value: number, index: int): boolean => {
          if (index === 2) {
            throw new Error("mid");
          }
          return false;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0190
     * @tc.name testFloat64ArrayFindLastIndex019
     * @tc.desc Verify findLastIndex callback throws Error at first element searched to start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      try {
        arr.findLastIndex((value: number, index: int): boolean => {
          if (index === 0) {
            throw new Error("first");
          }
          return false;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0200
     * @tc.name testFloat64ArrayFindLastIndex020
     * @tc.desc Verify findLastIndex callback throws Error with string message and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      try {
        arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
          throw new Error("string err");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0210
     * @tc.name testFloat64ArrayFindLastIndex021
     * @tc.desc Verify findLastIndex callback throws Error with numeric string message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      try {
        arr.findLastIndex((value: number): boolean => {
          throw new Error("42");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0220
     * @tc.name testFloat64ArrayFindLastIndex022
     * @tc.desc Verify findLastIndex on empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array(0);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value > 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0230
     * @tc.name testFloat64ArrayFindLastIndex023
     * @tc.desc Verify findLastIndex on empty array callback not executed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      let called: boolean = false;
      arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        called = true;
        return false;
      })

      const expectVal = false;
      expect(called).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0240
     * @tc.name testFloat64ArrayFindLastIndex024
     * @tc.desc Verify findLastIndex on empty array returns int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array(0);
      const result = arr.findLastIndex((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0250
     * @tc.name testFloat64ArrayFindLastIndex025
     * @tc.desc Verify findLastIndex returns correct index for last matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value > 4.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0260
     * @tc.name testFloat64ArrayFindLastIndex026
     * @tc.desc Verify findLastIndex returns -1 with three-argument callback when no values match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0270
     * @tc.name testFloat64ArrayFindLastIndex027
     * @tc.desc Verify findlastindex((value: number) with [-2147483648, -1, 0, 1] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-2147483648, -1, 0, 1]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value > 4.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0280
     * @tc.name testFloat64ArrayFindLastIndex028
     * @tc.desc Verify findLastIndex returns -1 when no element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value > 100.0;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0290
     * @tc.name testFloat64ArrayFindLastIndex029
     * @tc.desc Verify findLastIndex returns -1 for all negative array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0300
     * @tc.name testFloat64ArrayFindLastIndex030
     * @tc.desc Verify findLastIndex on single element found returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value === 42.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0310
     * @tc.name testFloat64ArrayFindLastIndex031
     * @tc.desc Verify findLastIndex on single element not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value > 100.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0320
     * @tc.name testFloat64ArrayFindLastIndex032
     * @tc.desc Verify findLastIndex on three identical values returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0330
     * @tc.name testFloat64ArrayFindLastIndex033
     * @tc.desc Verify findLastIndex finds MAX_VALUE element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value > 1.0e+300;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0340
     * @tc.name testFloat64ArrayFindLastIndex034
     * @tc.desc Verify findLastIndex finds MIN_VALUE element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value === 5e-324;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0350
     * @tc.name testFloat64ArrayFindLastIndex035
     * @tc.desc Verify findLastIndex finds Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === Infinity;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0360
     * @tc.name testFloat64ArrayFindLastIndex036
     * @tc.desc Verify findLastIndex finds negative Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value === -Infinity;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0370
     * @tc.name testFloat64ArrayFindLastIndex037
     * @tc.desc Verify findLastIndex NaN not found via equality returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return Number.isNaN(value);
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0380
     * @tc.name testFloat64ArrayFindLastIndex038
     * @tc.desc Verify findLastIndex finds NaN via self-inequality check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value !== value;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0390
     * @tc.name testFloat64ArrayFindLastIndex039
     * @tc.desc Verify findLastIndex finds negative zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.findLastIndex((value: number): boolean => {
        return value === -0.0;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0400
     * @tc.name testFloat64ArrayFindLastIndex040
     * @tc.desc Verify findLastIndex finds scientific notation element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value === 1.0e-308;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0410
     * @tc.name testFloat64ArrayFindLastIndex041
     * @tc.desc Verify findLastIndex finds large scientific notation element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === 1.0e+308;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0420
     * @tc.name testFloat64ArrayFindLastIndex042
     * @tc.desc Verify findLastIndex does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MaxValue: number = 32767;
      const arr = new Float64Array([-32768, -128, 0, 127, int16MaxValue]);
      const origLen: int = arr.length;
      arr.findLastIndex((value: number): boolean => {
        return value > 3.0;
      })

      expect(arr.length).assertEqual(origLen);
      const actVal1 = arr.$_get(4);
      const expectVal = int16MaxValue;
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0430
     * @tc.name testFloat64ArrayFindLastIndex043
     * @tc.desc Verify findLastIndex searches from last element backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      let firstChecked: int = -1;
      arr.findLastIndex((value: number, index: int): boolean => {
        if (firstChecked === -1) {
          firstChecked = index;
        }
        return value === 3.0;
      })

      const expectVal = fourValue;
      expect(firstChecked).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0440
     * @tc.name testFloat64ArrayFindLastIndex044
     * @tc.desc Verify findLastIndex returns last matching among duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tinyNegativeValue: number = -1e-100;
      const negativeOne: number = -1;
      const arr = new Float64Array([tinyNegativeValue, 9007199254740991, tinyNegativeValue, 3.141592653589793, tinyNegativeValue]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0450
     * @tc.name testFloat64ArrayFindLastIndex045
     * @tc.desc Verify findLastIndex finds only middle matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value === 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0460
     * @tc.name testFloat64ArrayFindLastIndex046
     * @tc.desc Verify findlastindex((value: number, index: int) with [-32768, -128, 0, 127, 32767] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value === 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0470
     * @tc.name testFloat64ArrayFindLastIndex047
     * @tc.desc Verify findLastIndex returns last when only last element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0480
     * @tc.name testFloat64ArrayFindLastIndex048
     * @tc.desc Verify findLastIndex finds larger index among adjacent matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.1, zeroValue, zeroValue, 3.141592653589793, -1e-100]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value === 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0490
     * @tc.name testFloat64ArrayFindLastIndex049
     * @tc.desc Verify findLastIndex callback modifies external counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      let callCount: int = 0;
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        callCount = callCount + 1;
        return value > 3.0;
      })

      const expectVal = fiveValue;
      expect(callCount).assertEqual(expectVal);
      const expectVal2 = negativeOne;
      expect(result).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0500
     * @tc.name testFloat64ArrayFindLastIndex050
     * @tc.desc Verify findLastIndex callback reads external array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const ext = Float64Array.of(-2147483648, -1, zeroValue);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === ext.$_get(index);
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0510
     * @tc.name testFloat64ArrayFindLastIndex051
     * @tc.desc Verify findLastIndex callback calls external function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      let flag: boolean = false;
      const result = arr.findLastIndex((value: number): boolean => {
        if (value > 3.0) {
          flag = true;
        }
        return value > 4.0;
      })

      const expectVal = true;
      expect(flag).assertEqual(expectVal);
      const expectVal2 = oneValue;
      expect(result).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0520
     * @tc.name testFloat64ArrayFindLastIndex052
     * @tc.desc Verify findLastIndex modifies original array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      arr.findLastIndex((value: number, index: int): boolean => {
        if (index === 4) {
          arr.$_set(4, fillValue99);
        }
        return value > 3.0;
      })

      const actVal2 = arr.$_get(4);
      const expectVal = fillValue99;
      expect(actVal2).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0530
     * @tc.name testFloat64ArrayFindLastIndex053
     * @tc.desc Verify findLastIndex on length 0 array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array(0);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0540
     * @tc.name testFloat64ArrayFindLastIndex054
     * @tc.desc Verify findLastIndex on length 1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const zeroValue: number = 0;
      const arr = new Float64Array(1);
      arr.$_set(0, fillValue42);
      const result = arr.findLastIndex((value: number): boolean => {
        return value === 42.0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0550
     * @tc.name testFloat64ArrayFindLastIndex055
     * @tc.desc Verify findLastIndex on length 2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const oneValue: number = 1;
      const arr = new Float64Array(2);
      arr.$_set(0, onePointZero);
      arr.$_set(1, twoPointZero);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value === 2.0;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0560
     * @tc.name testFloat64ArrayFindLastIndex056
     * @tc.desc Verify findLastIndex on length 100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninetynineValue: number = 99;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      const result = arr.findLastIndex((value: number): boolean => {
        return value === 99.0;
      })

      const expectVal = ninetynineValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0570
     * @tc.name testFloat64ArrayFindLastIndex057
     * @tc.desc Verify findLastIndex on length 1000 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Value: number = 999;
      const arr = new Float64Array(1000);
      for (let i: int = 0; i < 1000; i++) {
        arr.$_set(i, i);
      }
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === 999.0;
      })

      const expectVal = num999Value;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0580
     * @tc.name testFloat64ArrayFindLastIndex058
     * @tc.desc Verify findLastIndex on all identical elements returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MaxValue: number = 32767;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MaxValue, int16MaxValue, int16MaxValue, int16MaxValue, int16MaxValue);
      const result = arr.findLastIndex((value: number): boolean => {
        return value === 7.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0590
     * @tc.name testFloat64ArrayFindLastIndex059
     * @tc.desc Verify findLastIndex on all zero elements returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MaxValue: number = 2147483647;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MaxValue, int32MaxValue, int32MaxValue, int32MaxValue, int32MaxValue);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value === 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0600
     * @tc.name testFloat64ArrayFindLastIndex060
     * @tc.desc Verify findLastIndex on all negative elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value < -2.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0610
     * @tc.name testFloat64ArrayFindLastIndex061
     * @tc.desc Verify findLastIndex on increasing sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr =
        new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625, zeroValue,
          zeroValue, zeroValue, zeroValue, zeroValue]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value > 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0620
     * @tc.name testFloat64ArrayFindLastIndex062
     * @tc.desc Verify findLastIndex on decreasing sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const fourValue: number = 4;
      const arr =
        new Float64Array([-32768, -128, zeroValue, 127, 32767, zeroValue, zeroValue, zeroValue,
          zeroValue, zeroValue]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value > 5.0;
      })

      const expectVal = fourValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0630
     * @tc.name testFloat64ArrayFindLastIndex063
     * @tc.desc Verify findLastIndex on alternating positive negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const fourValue: number = 4;
      const arr =
        new Float64Array([-2147483648, -1, zeroValue, 1, 2147483647, zeroValue, zeroValue, zeroValue,
          zeroValue, zeroValue]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = fourValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0640
     * @tc.name testFloat64ArrayFindLastIndex064
     * @tc.desc Verify findLastIndex on mixed integer float format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const result = arr.findLastIndex((value: number): boolean => {
        return value === 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0650
     * @tc.name testFloat64ArrayFindLastIndex065
     * @tc.desc Verify findLastIndex with hex literal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value === 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0660
     * @tc.name testFloat64ArrayFindLastIndex066
     * @tc.desc Verify findLastIndex with octal literal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0670
     * @tc.name testFloat64ArrayFindLastIndex067
     * @tc.desc Verify findLastIndex with strict equality comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.findLastIndex((value: number): boolean => {
        return value === 2.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0680
     * @tc.name testFloat64ArrayFindLastIndex068
     * @tc.desc Verify findLastIndex with greater-than comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value > 3.0;
      })

      const expectVal = threeValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0690
     * @tc.name testFloat64ArrayFindLastIndex069
     * @tc.desc Verify findLastIndex with greater-equal comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value >= 3.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0700
     * @tc.name testFloat64ArrayFindLastIndex070
     * @tc.desc Verify findLastIndex with less-than comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value < 3.0;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0710
     * @tc.name testFloat64ArrayFindLastIndex071
     * @tc.desc Verify findLastIndex with less-equal comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value <= 3.0;
      })

      const expectVal = threeValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0720
     * @tc.name testFloat64ArrayFindLastIndex072
     * @tc.desc Verify findLastIndex with not-equal comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value !== 3.0;
      })

      const expectVal = fourValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0730
     * @tc.name testFloat64ArrayFindLastIndex073
     * @tc.desc Verify findLastIndex with logical AND
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value > 2.0 && value < 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0740
     * @tc.name testFloat64ArrayFindLastIndex074
     * @tc.desc Verify findLastIndex with logical OR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value < 2.0 || value > 4.0;
      })

      const expectVal = fourValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0750
     * @tc.name testFloat64ArrayFindLastIndex075
     * @tc.desc Verify findLastIndex with logical NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        let cond: boolean = value > 3.0;
        return !cond;
      })

      const expectVal = threeValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0760
     * @tc.name testFloat64ArrayFindLastIndex076
     * @tc.desc Verify findLastIndex with ternary expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const result = arr.findLastIndex((value: number): boolean => {
        return value > 3.0 ? true : false;
      })

      const expectVal = threeValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0770
     * @tc.name testFloat64ArrayFindLastIndex077
     * @tc.desc Verify findLastIndex with if-else in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        if (index === 0) {
          return true;
        }
        return false;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0780
     * @tc.name testFloat64ArrayFindLastIndex078
     * @tc.desc Verify findLastIndex with for loop in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        let found: boolean = value === 3.0;
        return found;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0790
     * @tc.name testFloat64ArrayFindLastIndex079
     * @tc.desc Verify findLastIndex with while loop in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const result = arr.findLastIndex((value: number): boolean => {
        let found: boolean = value === 4.0;
        return found;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0800
     * @tc.name testFloat64ArrayFindLastIndex080
     * @tc.desc Verify findLastIndex with float precision 0.1+0.2 not equal 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([0.1 + 0.2, 0.3, 0.5]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value === 0.3;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0810
     * @tc.name testFloat64ArrayFindLastIndex081
     * @tc.desc Verify findLastIndex followed by $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piValue: number = 3.141592653589793;
      const arr = new Float64Array([0.1, 9007199254740991, 0, piValue, -1e-100]);
      const idx = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 3.0;
      })

      if (idx >= 0) {
        const actVal3 = arr.$_get(idx);
        const expectVal = piValue;
        expect(actVal3).assertEqual(expectVal);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0820
     * @tc.name testFloat64ArrayFindLastIndex082
     * @tc.desc Verify findLastIndex followed by $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointZeroSixTwoFive: number = 0.0625;
      const fillValue99: number = 99.0;
      const arr = Float64Array.of(0.5, 1.5, 0.25, 0.125, pointZeroSixTwoFive);
      const idx = arr.findLastIndex((value: number): boolean => {
        return value > 3.0;
      })

      if (idx >= 0) {
        arr.$_set(idx, fillValue99);
      }
      const actVal4 = arr.$_get(4);
      const expectVal = pointZeroSixTwoFive;
      expect(actVal4).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0830
     * @tc.name testFloat64ArrayFindLastIndex083
     * @tc.desc Verify findLastIndex with some combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const idx = arr.findLastIndex((value: number, index: int): boolean => {
        return value > 3.0;
      })

      const expectVal = fourValue;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0840
     * @tc.name testFloat64ArrayFindLastIndex084
     * @tc.desc Verify findLastIndex with every combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const idx = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = fourValue;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0850
     * @tc.name testFloat64ArrayFindLastIndex085
     * @tc.desc Verify findLastIndex from copy of Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const original = new Float64Array([0.1, 9007199254740991, 0, 3.141592653589793, -1e-100]);
      const copy = new Float64Array(original);
      const idx = copy.findLastIndex((value: number): boolean => {
        return value > 3.0;
      })

      const expectVal = threeValue;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0860
     * @tc.name testFloat64ArrayFindLastIndex086
     * @tc.desc Verify findLastIndex with int type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const a: int = 10;
      const b: int = 20;
      const c: int = 30;
      const arr = new Float64Array([a, b, c]);
      const result = arr.findLastIndex((value: number, index: int): boolean => {
        return value > 10;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0870
     * @tc.name testFloat64ArrayFindLastIndex087
     * @tc.desc Verify findLastIndex with float type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const a: double = 1.5;
      const b: double = 2.5;
      const c: double = 3.5;
      const arr = new Float64Array([a, b, c]);
      const result = arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 2.5;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0880
     * @tc.name testFloat64ArrayFindLastIndex088
     * @tc.desc Verify findLastIndex with double type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const a: double = 1.234;
      const b: double = 2.345;
      const c: double = 3.456;
      const arr = new Float64Array([a, b, c]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value > 2.0;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0890
     * @tc.name testFloat64ArrayFindLastIndex089
     * @tc.desc Verify findLastIndex callback receives all positive values in reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const receivedValues: number[] = [];
      arr.findLastIndex((value: number): boolean => {
        receivedValues.push(value);
        return false;
      })

      const expectVal = threeValue;
      expect(receivedValues.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0900
     * @tc.name testFloat64ArrayFindLastIndex090
     * @tc.desc Verify findLastIndex callback receives negative values starting from last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const receivedValues: number[] = [];
      arr.findLastIndex((value: number): boolean => {
        receivedValues.push(value);
        return false;
      })

      const expectVal = zeroValue;
      expect(receivedValues[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0910
     * @tc.name testFloat64ArrayFindLastIndex091
     * @tc.desc Verify findLastIndex callback receives zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([zeroValue, -1, zeroValue]);
      const receivedValues: number[] = [];
      arr.findLastIndex((value: number): boolean => {
        receivedValues.push(value);
        return false;
      })

      const expectVal = zeroValue;
      expect(receivedValues[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0920
     * @tc.name testFloat64ArrayFindLastIndex092
     * @tc.desc Verify findLastIndex callback receives negative zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(zeroValue, 9007199254740991, zeroValue);
      const receivedValues: number[] = [];
      arr.findLastIndex((value: number): boolean => {
        receivedValues.push(value);
        return false;
      })

      const expectVal = zeroValue;
      expect(receivedValues[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0930
     * @tc.name testFloat64ArrayFindLastIndex093
     * @tc.desc Verify findLastIndex callback receives NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const receivedValues: number[] = [];
      arr.findLastIndex((value: number): boolean => {
        receivedValues.push(value);
        return false;
      })

      const actVal5 = Number.isNaN(receivedValues[1]);
      const expectVal = false;
      expect(actVal5).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0940
     * @tc.name testFloat64ArrayFindLastIndex094
     * @tc.desc Verify findLastIndex callback receives Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const arr = new Float64Array([-32768, -128, 0]);
      const receivedValues: number[] = [];
      arr.findLastIndex((value: number): boolean => {
        receivedValues.push(value);
        return false;
      })

      const expectVal = int8MinValue;
      expect(receivedValues[1]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0950
     * @tc.name testFloat64ArrayFindLastIndex095
     * @tc.desc Verify findLastIndex callback receives -Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const receivedValues: number[] = [];
      arr.findLastIndex((value: number): boolean => {
        receivedValues.push(value);
        return false;
      })

      const expectVal = negativeOne;
      expect(receivedValues[1]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0960
     * @tc.name testFloat64ArrayFindLastIndex096
     * @tc.desc Verify findLastIndex callback receives MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const receivedValues: number[] = [];
      arr.findLastIndex((value: number): boolean => {
        receivedValues.push(value);
        return false;
      })

      const expectVal = maxSafeInteger;
      expect(receivedValues[1]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0970
     * @tc.name testFloat64ArrayFindLastIndex097
     * @tc.desc Verify findLastIndex callback receives MIN_VALUE 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const arr = new Float64Array([0.5, onePointFive, 0.25]);
      const receivedValues: number[] = [];
      arr.findLastIndex((value: number): boolean => {
        receivedValues.push(value);
        return false;
      })

      const expectVal = onePointFive;
      expect(receivedValues[1]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0980
     * @tc.name testFloat64ArrayFindLastIndex098
     * @tc.desc Verify findLastIndex callback receives indices in descending order from last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const oneValue: number = 1;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const receivedIndices: int[] = [];
      arr.findLastIndex((value: number, index: int): boolean => {
        receivedIndices.push(index);
        return false;
      })

      expect(receivedIndices[0]).assertEqual(twoValue);
      expect(receivedIndices[1]).assertEqual(oneValue);
      expect(receivedIndices[2]).assertEqual(zeroValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_0990
     * @tc.name testFloat64ArrayFindLastIndex099
     * @tc.desc Verify findLastIndex callback receives index 0 for single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([0.5]);
      const receivedIndices: int[] = [];
      arr.findLastIndex((value: number, index: int): boolean => {
        receivedIndices.push(index);
        return false;
      })

      const expectVal = zeroValue;
      expect(receivedIndices[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1000
     * @tc.name testFloat64ArrayFindLastIndex100
     * @tc.desc Verify findLastIndex on empty array does not invoke callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      let called = false;
      arr.findLastIndex((value: number, index: int): boolean => {
        called = true;
        return false;
      })

      const expectVal = false;
      expect(called).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1010
     * @tc.name testFloat64ArrayFindLastIndex101
     * @tc.desc Verify findLastIndex callback array parameter references original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      let receivedArray: Object | null = null;
      arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        receivedArray = array;
        return false;
      })

      const expectVal = arr;
      expect(receivedArray).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1020
     * @tc.name testFloat64ArrayFindLastIndex102
     * @tc.desc Verify findLastIndex callback array length matches original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      let receivedLength: int = -1;
      arr.findLastIndex((value: number, index: int, array: Float64Array): boolean => {
        receivedLength = array.length;
        return false;
      })

      const expectVal = fiveValue;
      expect(receivedLength).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1030
     * @tc.name testFloat64ArrayFindLastIndex103
     * @tc.desc Verify findLastIndex cannot find NaN via equality comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.findLastIndex((value: number): boolean => {
        return Number.isNaN(value);
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1040
     * @tc.name testFloat64ArrayFindLastIndex104
     * @tc.desc Verify findLastIndex finds NaN using Number.isNaN in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.findLastIndex((value: number): boolean => {
        return Number.isNaN(value);
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1050
     * @tc.name testFloat64ArrayFindLastIndex105
     * @tc.desc Verify findLastIndex with negative zero as search target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const arr = new Float64Array([zeroValue, -128, zeroValue]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value === -0.0;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1060
     * @tc.name testFloat64ArrayFindLastIndex106
     * @tc.desc Verify findLastIndex return value is an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.findLastIndex((value: number): boolean => {
        return value > 1.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1070
     * @tc.name testFloat64ArrayFindLastIndex107
     * @tc.desc Verify findLastIndex with all identical elements returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value === 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1080
     * @tc.name testFloat64ArrayFindLastIndex108
     * @tc.desc Verify findLastIndex with integer values in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
      const result = arr.findLastIndex((value: number): boolean => {
        return value > 20;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1090
     * @tc.name testFloat64ArrayFindLastIndex109
     * @tc.desc Verify findLastIndex returns last matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MaxValue: number = 127;
      const negativeOne: number = -1;
      const values = new Float64Array([-32768, int8MaxValue, 0, int8MaxValue]);
      const actVal6 = values.findLastIndex((value) => value === 5.0);
      const expectVal = negativeOne;
      expect(actVal6).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1100
     * @tc.name testFloat64ArrayFindLastIndex110
     * @tc.desc Verify findLastIndex returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const values = new Float64Array([-2147483648, -1, 0]);
      const actVal7 = values.findLastIndex((value) => value > 10);
      const expectVal = negativeOne;
      expect(actVal7).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1110
     * @tc.name testFloat64ArrayFindLastIndex111
     * @tc.desc Verify findLastIndex returns -1 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const values = new Float64Array();
      const actVal8 = values.findLastIndex((value) => value > 0);
      const expectVal = negativeOne;
      expect(actVal8).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1120
     * @tc.name testFloat64ArrayFindLastIndex112
     * @tc.desc Verify findLastIndex with NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const values = Float64Array.of(0.1, 9007199254740991);
      const actVal9 = values.findLastIndex((value) => Number.isNaN(value));
      const expectVal = negativeOne;
      expect(actVal9).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1130
     * @tc.name testFloat64ArrayFindLastIndex113
     * @tc.desc Verify findLastIndex with Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const negativeOne: number = -1;
      const values = Float64Array.of(0.5, pointOneTwoFive, 0.25, pointOneTwoFive);
      const actVal10 = values.findLastIndex((value) => value === Infinity);
      const expectVal = negativeOne;
      expect(actVal10).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1140
     * @tc.name testFloat64ArrayFindLastIndex114
     * @tc.desc Verify findLastIndex returns -1 when no elements satisfy positive predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const values = new Float64Array([-32768, -128, 0]);
      const actVal11 = values.findLastIndex((value) => value > 0);
      const expectVal = negativeOne;
      expect(actVal11).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1150
     * @tc.name testFloat64ArrayFindLastIndex115
     * @tc.desc Verify findLastIndex callback throws Error and propagates it on checked element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1]);
      try {
        values.findLastIndex((value) => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1160
     * @tc.name testFloat64ArrayFindLastIndex116
     * @tc.desc Verify findLastIndex with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const hexValue55: number = 0x55;
      const oneValue: number = 1;
      const arr = new Float64Array([hexValueFF, hexValueAA, hexValue55]);
      const idx = arr.findLastIndex((e: number): boolean => e > 0x55);
      const expectVal = oneValue;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1170
     * @tc.name testFloat64ArrayFindLastIndex117
     * @tc.desc Verify findLastIndex with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const binaryValue01010101: number = 0b01010101;
      const oneValue: number = 1;
      const arr = new Float64Array([binaryValue11111111, binaryValue10101010, binaryValue01010101]);
      const idx = arr.findLastIndex((e: number): boolean => e > 0b01010101);
      const expectVal = oneValue;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1180
     * @tc.name testFloat64ArrayFindLastIndex118
     * @tc.desc Verify findlastindex with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const idx = arr.findLastIndex((e: number): boolean => Number.isNaN(e));
      const expectVal = 0;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1190
     * @tc.name testFloat64ArrayFindLastIndex119
     * @tc.desc Verify findlastindex with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const idx = arr.findLastIndex((e: number): boolean => e < 0.0);
      const expectVal = 1;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLASTINDEX_1200
     * @tc.name testFloat64ArrayFindLastIndex120
     * @tc.desc Verify findlastindex with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLastIndex120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const idx = arr.findLastIndex((e: number): boolean => e === doubleMinValue);
      const expectVal = 0;
      expect(idx).assertEqual(expectVal);
    });

  })
}
