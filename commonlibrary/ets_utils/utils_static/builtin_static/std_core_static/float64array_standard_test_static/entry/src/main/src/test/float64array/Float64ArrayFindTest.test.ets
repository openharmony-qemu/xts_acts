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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

function pred062(value: number, index: int, array: Float64Array): boolean {
  return value > 1.0;
}

class CustomFindError074 extends Error {
  constructor(msg: string) {
    super(msg);
  }
}

export default function float64ArrayFindTest(): void {
  describe('Float64ArrayFindTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0010
     * @tc.name testFloat64ArrayFind001
     * @tc.desc Verify find with 1 callback parameter returns first element matching condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const result = arr.find((value) => value > 1.0);
      const expectVal = maxSafeInteger;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0020
     * @tc.name testFloat64ArrayFind002
     * @tc.desc Verify find callback value parameter receives first element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive, 1.5, 0.25);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 0;
      })

      const expectVal = pointFive;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0030
     * @tc.name testFloat64ArrayFind003
     * @tc.desc Verify find callback value parameter receives middle element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768, -128, zeroValue, 127]);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 2;
      })

      const expectVal = zeroValue;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0040
     * @tc.name testFloat64ArrayFind004
     * @tc.desc Verify find callback value parameter receives last element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 2;
      })

      const expectVal = zeroValue;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0050
     * @tc.name testFloat64ArrayFind005
     * @tc.desc Verify find callback value parameter receives negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const arr = Float64Array.of(negonePointzero, 9007199254740991, -3.0);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 0;
      })

      const expectVal = negonePointzero;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0060
     * @tc.name testFloat64ArrayFind006
     * @tc.desc Verify find callback value parameter receives zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(zeroPointZero, 1.0, 2.0);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 0;
      })

      const expectVal = zeroPointZero;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0070
     * @tc.name testFloat64ArrayFind007
     * @tc.desc Verify find callback value parameter receives negative zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = new Float64Array([-0.0, -128, 2.0]);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 0;
      })

      const expectVal = negativeInfinity;
      expect(1.0 / capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0080
     * @tc.name testFloat64ArrayFind008
     * @tc.desc Verify find callback value parameter receives MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(maxVal, 1.0, 2.0);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 0;
      })

      const expectVal = maxVal;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0090
     * @tc.name testFloat64ArrayFind009
     * @tc.desc Verify find callback value parameter receives MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: number = 5e-324;
      const arr = new Float64Array([minVal, 1.0, 2.0]);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 0;
      })

      const expectVal = minVal;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0100
     * @tc.name testFloat64ArrayFind010
     * @tc.desc Verify find callback value parameter receives Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array([1.0, positiveInfinity, 3.0]);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 1;
      })

      const expectVal = positiveInfinity;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0110
     * @tc.name testFloat64ArrayFind011
     * @tc.desc Verify find callback value parameter receives negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(1.0, -positiveInfinity, 3.0);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 1;
      })

      const expectVal = negativeInfinity;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0120
     * @tc.name testFloat64ArrayFind012
     * @tc.desc Verify find callback value parameter receives NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array([1.0, nanValue, 3.0]);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 1;
      })

      const actVal1 = Number.isNaN(capturedValue);
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0130
     * @tc.name testFloat64ArrayFind013
     * @tc.desc Verify find callback value parameter receives scientific notation positive exponent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e100: number = 1.0e+100;
      const arr = Float64Array.of(sciValue10e100, 2.0, 3.0);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 0;
      })

      const expectVal = sciValue10e100;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0140
     * @tc.name testFloat64ArrayFind014
     * @tc.desc Verify find callback value parameter receives scientific notation negative exponent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e100: number = 1.0e-100;
      const arr = Float64Array.of(sciValue10e100, 2.0, 3.0);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 0;
      })

      const expectVal = sciValue10e100;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0150
     * @tc.name testFloat64ArrayFind015
     * @tc.desc Verify find callback value parameter receives decimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = new Float64Array([0.1, -2147483648, 0.3]);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 1;
      })

      const expectVal = int32MinValue;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0160
     * @tc.name testFloat64ArrayFind016
     * @tc.desc Verify find callback value parameter receives large integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num2147483647Pointzero: number = 2147483647.0;
      const arr = Float64Array.of(num2147483647Pointzero, 2.0, 3.0);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 0;
      })

      const expectVal = num2147483647Pointzero;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0170
     * @tc.name testFloat64ArrayFind017
     * @tc.desc Verify find callback value parameter receives negative large integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483648Pointzero: number = -2147483648.0;
      const arr = new Float64Array([negnum2147483648Pointzero, 2.0, 3.0]);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 0;
      })

      const expectVal = negnum2147483648Pointzero;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0180
     * @tc.name testFloat64ArrayFind018
     * @tc.desc Verify find callback value parameter receives hexadecimal literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const sixteenPointzero: number = 16.0;
      const arr = new Float64Array([hexValue10, 2.0, 3.0]);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 0;
      })

      const expectVal = sixteenPointzero;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0190
     * @tc.name testFloat64ArrayFind019
     * @tc.desc Verify find callback value parameter receives octal literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointZero: number = 8.0;
      const arr = new Float64Array([0o10, 2.0, 3.0]);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 0;
      })

      const expectVal = eightPointZero;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0200
     * @tc.name testFloat64ArrayFind020
     * @tc.desc Verify find callback value parameter receives binary literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1010: number = 0b1010;
      const tenPointZero: number = 10.0;
      const arr = Float64Array.of(binaryValue1010, 2.0, 3.0);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 0;
      })

      const expectVal = tenPointZero;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0210
     * @tc.name testFloat64ArrayFind021
     * @tc.desc Verify find callback value parameter receives floating-point division result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero / threePointZero, 2.0, threePointZero);
      let capturedValue: number = 0.0;
      arr.find((value, index, array) => {
        capturedValue = value;
        return index === 0;
      })

      const expectVal = onePointZero / threePointZero;
      expect(capturedValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0220
     * @tc.name testFloat64ArrayFind022
     * @tc.desc Verify find callback index parameter receives index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(-32768, 2.0, 3.0);
      let capturedIndex: int = -1;
      arr.find((value, index, array) => {
        capturedIndex = index;
        return value === -32768;
      })

      const expectVal = zeroValue;
      expect(capturedIndex).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0230
     * @tc.name testFloat64ArrayFind023
     * @tc.desc Verify find callback index parameter receives middle index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([-2147483648, -1, 0, 1]);
      let capturedIndex: int = -1;
      arr.find((value, index, array) => {
        capturedIndex = index;
        return value === 3.0;
      })

      const expectVal = threeValue;
      expect(capturedIndex).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0240
     * @tc.name testFloat64ArrayFind024
     * @tc.desc Verify find callback index parameter receives last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      let capturedIndex: int = -1;
      arr.find((value, index, array) => {
        capturedIndex = index;
        return value === 3.0;
      })

      const expectVal = twoValue;
      expect(capturedIndex).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0250
     * @tc.name testFloat64ArrayFind025
     * @tc.desc Verify find callback index parameter receives index 0 for single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([0.5]);
      let capturedIndex: int = -1;
      arr.find((value, index, array) => {
        capturedIndex = index;
        return value === 42.0;
      })

      const expectVal = zeroValue;
      expect(capturedIndex).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0260
     * @tc.name testFloat64ArrayFind026
     * @tc.desc Verify find callback array parameter references the original array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      let capturedArray: Object | null = null;
      arr.find((value, index, array) => {
        capturedArray = array;
        return value === 1.0;
      })

      const expectVal = arr;
      expect(capturedArray).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0270
     * @tc.name testFloat64ArrayFind027
     * @tc.desc Verify find callback array parameter length matches original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      let capturedLength: int = 0;
      arr.find((value, index, array) => {
        capturedLength = array.length;
        return value === 1.0;
      })

      const expectVal = fiveValue;
      expect(capturedLength).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0280
     * @tc.name testFloat64ArrayFind028
     * @tc.desc Verify find callback can modify the array through array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      arr.find((value, index, array) => {
        array.$_set(0, num999Pointzero);
        return value === 1.0;
      })

      const actVal2 = arr.$_get(0);
      const expectVal = num999Pointzero;
      expect(actVal2).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0290
     * @tc.name testFloat64ArrayFind029
     * @tc.desc Verify find callback returns true first element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive, 1.5, 0.25);
      const result = arr.find((value, index, array) => value > 0.0);
      const expectVal = pointFive;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0300
     * @tc.name testFloat64ArrayFind030
     * @tc.desc Verify find callback returns true middle element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const arr = new Float64Array([-32768, twoPointZero, 0]);
      const result = arr.find((value, index, array) => value > 1.5);
      const expectVal = twoPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0310
     * @tc.name testFloat64ArrayFind031
     * @tc.desc Verify find callback returns true last element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const arr = new Float64Array([-2147483648, -1, threePointZero]);
      const result = arr.find((value, index, array) => value > 2.5);
      const expectVal = threePointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0320
     * @tc.name testFloat64ArrayFind032
     * @tc.desc Verify find callback all return false returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.find((value, index, array) => value > Number.MAX_VALUE);
      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0330
     * @tc.name testFloat64ArrayFind033
     * @tc.desc Verify find((value, index, array) with [] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of();
      const result = arr.find((value, index, array) => true);
      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0340
     * @tc.name testFloat64ArrayFind034
     * @tc.desc Verify find with single element not matching returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5]);
      const result = arr.find((value, index, array) => value > 2.0);
      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0350
     * @tc.name testFloat64ArrayFind035
     * @tc.desc Verify find callback throws Error directly and propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      try {
        arr.find((value, index, array) => {
          throw new Error("test error");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0360
     * @tc.name testFloat64ArrayFind036
     * @tc.desc Verify find callback throws RangeError on first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      try {
        arr.find((value, index, array) => {
          throw new RangeError("index error");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0370
     * @tc.name testFloat64ArrayFind037
     * @tc.desc Verify find callback throws TypeError at second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      try {
        arr.find((value, index, array) => {
          if (index === 1) {
            throw new TypeError("type error");
          }
          return false;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0380
     * @tc.name testFloat64ArrayFind038
     * @tc.desc Verify find callback throws Error at last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.find((value, index, array) => {
          if (index === 2) {
            throw new Error("last element error");
          }
          return false;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0390
     * @tc.name testFloat64ArrayFind039
     * @tc.desc Verify find callback throws Error after condition check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-32768, 2.5, 0);
      try {
        arr.find((value, index, array) => {
          if (value > 1.5) {
            throw new Error("value threshold error");
          }
          return false;
        })
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0400
     * @tc.name testFloat64ArrayFind040
     * @tc.desc Verify find matches NaN element using value not equal to itself semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array([1.0, nanValue, 3.0]);
      const result = arr.find((value, index, array) => {
        return value !== value;
      });

      const actVal3 = Number.isNaN(result as Double);
      const expectVal = true;
      expect(actVal3).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0410
     * @tc.name testFloat64ArrayFind041
     * @tc.desc Verify find matches NaN element at the first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = Float64Array.of(nanValue, 9007199254740991, 0);
      const result = arr.find((value, index, array) => {
        return value !== value;
      });

      const actVal = Number.isNaN(result as Double);
      const expectVal = true;
      expect(actVal).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0420
     * @tc.name testFloat64ArrayFind042
     * @tc.desc Verify find matches NaN element at the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = Float64Array.of(0.5, 1.5, nanValue);
      const result = arr.find((value, index, array) => {
        return value !== value;
      });

      const actVal = Number.isNaN(result as Double);
      const expectVal = true;
      expect(actVal).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0430
     * @tc.name testFloat64ArrayFind043
     * @tc.desc Verify find with multiple NaN elements returns the first one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = Float64Array.of(nanValue, nanValue, 0);
      const result = arr.find((value, index, array) => {
        return value !== value;
      });

      const actVal = Number.isNaN(result as Double);
      const expectVal = true;
      expect(actVal).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0440
     * @tc.name testFloat64ArrayFind044
     * @tc.desc Verify find with only NaN element returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = Float64Array.of(nanValue);
      const result = arr.find((value, index, array) => {
        return value !== value;
      });

      const actVal4 = Number.isNaN(result as Double);
      const expectVal = true;
      expect(actVal4).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0450
     * @tc.name testFloat64ArrayFind045
     * @tc.desc Verify find on single-element array finds matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne]);
      const result = arr.find((value, index, array) => value === 0.1);
      const expectVal = pointOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0460
     * @tc.name testFloat64ArrayFind046
     * @tc.desc Verify find on single-element array not matching returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = new Float64Array([pointFive]);
      const result = arr.find((value, index, array) => value === 42.0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0470
     * @tc.name testFloat64ArrayFind047
     * @tc.desc Verify find on two-element array finds the first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(-32768, twoPointZero);
      const result = arr.find((value, index, array) => value >= 1.0);
      const expectVal = twoPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0480
     * @tc.name testFloat64ArrayFind048
     * @tc.desc Verify find on two-element array finds the second matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const arr = new Float64Array([-2147483648, twoPointZero]);
      const result = arr.find((value, index, array) => value >= 2.0);
      const expectVal = twoPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0490
     * @tc.name testFloat64ArrayFind049
     * @tc.desc Verify find on two-element array with no match returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991]);
      const result = arr.find((value, index, array) => value > Number.MAX_VALUE);
      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0500
     * @tc.name testFloat64ArrayFind050
     * @tc.desc Verify find with all identical elements finds first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const arr = new Float64Array([pointTwoFive, pointTwoFive, pointTwoFive]);
      const result = arr.find((value, index, array) => value === 0.25);
      const expectVal = pointTwoFive;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0510
     * @tc.name testFloat64ArrayFind051
     * @tc.desc Verify find with all identical elements no match returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const arr = new Float64Array([fivePointZero, fivePointZero, fivePointZero]);
      const result = arr.find((value, index, array) => value !== 5.0);
      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0520
     * @tc.name testFloat64ArrayFind052
     * @tc.desc Verify find with all zero elements finds first zero matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const result = arr.find((value, index, array) => value === 0.0);
      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0530
     * @tc.name testFloat64ArrayFind053
     * @tc.desc Verify find with all zero elements no match returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const result = arr.find((value, index, array) => value !== 0.0);
      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0540
     * @tc.name testFloat64ArrayFind054
     * @tc.desc Verify find with negative values finds negative element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negthreePointzero: number = -3.0;
      const arr = Float64Array.of(negthreePointzero, 1.5, 2.0);
      const result = arr.find((value, index, array) => value < 0.0);
      const expectVal = negthreePointzero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0550
     * @tc.name testFloat64ArrayFind055
     * @tc.desc Verify find with negative values finds positive element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(-3.0, -1.0, twoPointZero);
      const result = arr.find((value, index, array) => value > 0.0);
      const expectVal = twoPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0560
     * @tc.name testFloat64ArrayFind056
     * @tc.desc Verify find with NaN element skips NaN when matching normal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const nanValue: number = NaN;
      const arr = Float64Array.of(onePointZero, nanValue, 3.0);
      const result = arr.find((value, index, array) => value > 0.0);
      const expectVal = onePointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0570
     * @tc.name testFloat64ArrayFind057
     * @tc.desc Verify find with array containing MAX_VALUE boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(1.0, maxVal, 3.0);
      const result = arr.find((value, index, array) => value === maxVal);
      const expectVal = maxVal;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0580
     * @tc.name testFloat64ArrayFind058
     * @tc.desc Verify find with array containing MIN_VALUE boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: number = 5e-324;
      const arr = Float64Array.of(minVal, 1.0, 3.0);
      const result = arr.find((value, index, array) => value === minVal);
      const expectVal = minVal;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0590
     * @tc.name testFloat64ArrayFind059
     * @tc.desc Verify find with array containing MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const safeVal: number = 9007199254740991.0;
      const arr = Float64Array.of(1.0, safeVal, 3.0);
      const result = arr.find((value, index, array) => value === safeVal);
      const expectVal = safeVal;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0600
     * @tc.name testFloat64ArrayFind060
     * @tc.desc Verify find with array containing MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeVal: number = -9007199254740991.0;
      const arr = new Float64Array([1.0, minSafeVal, 3.0]);
      const result = arr.find((value, index, array) => value === minSafeVal);
      const expectVal = minSafeVal;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0610
     * @tc.name testFloat64ArrayFind061
     * @tc.desc Verify find with arrow function callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const result = arr.find((value, index, array) => value > 1.0);
      const expectVal = maxSafeInteger;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0620
     * @tc.name testFloat64ArrayFind062
     * @tc.desc Verify find with named function callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const arr = new Float64Array([0.5, onePointFive, 0.25]);
      const result = arr.find(pred062);
      const expectVal = onePointFive;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0630
     * @tc.name testFloat64ArrayFind063
     * @tc.desc Verify find with callback returning constant true finds first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue, -128, 0);
      const result = arr.find((value, index, array) => true);
      const expectVal = int16MinValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0640
     * @tc.name testFloat64ArrayFind064
     * @tc.desc Verify find with callback returning constant false returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.find((value, index, array) => false);
      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0650
     * @tc.name testFloat64ArrayFind065
     * @tc.desc Verify find with callback returning boolean expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(0.1, twoPointZero, 0);
      const result = arr.find((value, index, array) => value === 2.0);
      const expectVal = twoPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0660
     * @tc.name testFloat64ArrayFind066
     * @tc.desc Verify find with callback using ternary expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const arr = new Float64Array([0.5, onePointFive, 0.25]);
      const result = arr.find((value, index, array) => value > 1.0 ? true : false);
      const expectVal = onePointFive;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0670
     * @tc.name testFloat64ArrayFind067
     * @tc.desc Verify find with callback using external variable as threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const threshold: number = 2.0;
      const arr = new Float64Array([-32768, -128, threePointZero]);
      const result = arr.find((value, index, array) => value > threshold);
      const expectVal = threePointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0680
     * @tc.name testFloat64ArrayFind068
     * @tc.desc Verify find callback modifies external call count variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      let callCount: int = 0;
      const arr = Float64Array.of(-2147483648, -1, 0);
      arr.find((value, index, array) => {
        callCount = callCount + 1;
        return value > 2.0;
      })

      const expectVal = threeValue;
      expect(callCount).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0690
     * @tc.name testFloat64ArrayFind069
     * @tc.desc Verify find callback reads from external array state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const externalArr = Float64Array.of(0.1, 9007199254740991, 0);
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.find((value, index, array) => {
        return value === externalArr.$_get(index);
      })

      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0700
     * @tc.name testFloat64ArrayFind070
     * @tc.desc Verify find on large array finds first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const arr = new Float64Array(1000);
      arr.$_set(0, fillValue42);
      const result = arr.find((value, index, array) => value === 42.0);
      const expectVal = fillValue42;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0710
     * @tc.name testFloat64ArrayFind071
     * @tc.desc Verify find on large array with no match returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1000);
      const result = arr.find((value, index, array) => value === 42.0);
      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0720
     * @tc.name testFloat64ArrayFind072
     * @tc.desc Verify find on large array traverses all elements to find last match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const thousandValue: number = 1000;
      const arr = new Float64Array(1000);
      arr.$_set(999, fillValue42);
      let callCount: int = 0;
      arr.find((value, index, array) => {
        callCount = callCount + 1;
        return value === 42.0;
      })

      const expectVal = thousandValue;
      expect(callCount).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0730
     * @tc.name testFloat64ArrayFind073
     * @tc.desc Verify find return value type is number when element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.find((value, index, array) => value > 1.0);
      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0740
     * @tc.name testFloat64ArrayFind074
     * @tc.desc Verify find return value is undefined when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.find((value, index, array) => value > 100.0);
      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0750
     * @tc.name testFloat64ArrayFind075
     * @tc.desc Verify find returns the first matching element when duplicates exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([0.1, zeroValue, zeroValue, 3.141592653589793]);
      const result = arr.find((value, index, array) => value === 2.0);
      const expectVal = undefined;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0760
     * @tc.name testFloat64ArrayFind076
     * @tc.desc Verify find return value equals the original array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.find((value, index, array) => value === 1.5);
      const expectVal = arr.$_get(1);
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0770
     * @tc.name testFloat64ArrayFind077
     * @tc.desc Verify find stops traversal after finding first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([-32768, -128, 0]);
      let callCount: int = 0;
      arr.find((value, index, array) => {
        callCount = callCount + 1;
        return value === 2.0;
      })

      const expectVal = threeValue;
      expect(callCount).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0780
     * @tc.name testFloat64ArrayFind078
     * @tc.desc Verify find traverses all elements when no match found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = Float64Array.of(-2147483648, -1, 0);
      let callCount: int = 0;
      arr.find((value, index, array) => {
        callCount = callCount + 1;
        return false;
      })

      const expectVal = threeValue;
      expect(callCount).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0790
     * @tc.name testFloat64ArrayFind079
     * @tc.desc Verify find on empty array does not invoke callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of();
      let called: boolean = false;
      arr.find((value, index, array) => {
        called = true;
        return false;
      })

      const expectVal = false;
      expect(called).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0800
     * @tc.name testFloat64ArrayFind080
     * @tc.desc Verify find callback throws RangeError and propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      try {
        arr.find((value, index, array) => {
          throw new RangeError("range error");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0810
     * @tc.name testFloat64ArrayFind081
     * @tc.desc Verify find callback throws TypeError and propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.find((value, index, array) => {
          throw new TypeError("type error");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0820
     * @tc.name testFloat64ArrayFind082
     * @tc.desc Verify find callback throws Error and propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      try {
        arr.find((value, index, array) => {
          throw new Error("generic error");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0830
     * @tc.name testFloat64ArrayFind083
     * @tc.desc Verify find callback throws custom error and propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      try {
        arr.find((value, index, array) => {
          throw new CustomFindError074("custom error");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0840
     * @tc.name testFloat64ArrayFind084
     * @tc.desc Verify find callback modifies array during traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.find((value, index, array) => {
        if (index === 0) {
          array.$_set(1, num999Pointzero);
        }
        return value === 999.0;
      })

      const expectVal = num999Pointzero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0850
     * @tc.name testFloat64ArrayFind085
     * @tc.desc Verify original array is unchanged after find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const threeValue: number = 3;
      const arr = new Float64Array([pointFive, onePointFive, pointTwoFive]);
      arr.find((value, index, array) => value > 1.0);
      expect(arr.length).assertEqual(threeValue);
      const actVal5 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal5).assertEqual(expectVal);
      const actVal6 = arr.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal6).assertEqual(expectVal2);
      const actVal7 = arr.$_get(2);
      const expectVal3 = pointTwoFive;
      expect(actVal7).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0860
     * @tc.name testFloat64ArrayFind086
     * @tc.desc Verify nested find call within another find callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const arr = new Float64Array([-32768, -128, 0]);
      const outerResult = arr.find((value, index, array) => {
        return value === array.find((v, i, a) => i === 1);
      })

      const expectVal = int8MinValue;
      expect(outerResult).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0870
     * @tc.name testFloat64ArrayFind087
     * @tc.desc Verify find callback uses indexOf on the array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = new Float64Array([int32MinValue, -1, 0]);
      const result = arr.find((value, index, array) => {
        return array.indexOf(value) === index;
      })

      const expectVal = int32MinValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0880
     * @tc.name testFloat64ArrayFind088
     * @tc.desc Verify find returns first element matching condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const values = new Float64Array([0.1, maxSafeInteger, 0]);
      const actVal8 = values.find((value) => value > 4);
      const expectVal = maxSafeInteger;
      expect(actVal8).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0890
     * @tc.name testFloat64ArrayFind089
     * @tc.desc Verify find returns undefined when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const result = values.find((value) => value > 10);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0900
     * @tc.name testFloat64ArrayFind090
     * @tc.desc Verify find returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128]);
      const actVal9 = values.find((value) => value === 4.0);
      const expectVal = undefined;
      expect(actVal9).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0910
     * @tc.name testFloat64ArrayFind091
     * @tc.desc Verify find returns undefined for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array();
      const result = values.find((value) => value > 0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0920
     * @tc.name testFloat64ArrayFind092
     * @tc.desc Verify find returns undefined when no NaN element exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1]);
      const result = values.find((value): boolean => {
        return Number.isNaN(value);
      });

      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0930
     * @tc.name testFloat64ArrayFind093
     * @tc.desc Verify find with Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.1, 9007199254740991);
      const actVal10 = values.find((value) => value === Infinity);
      const expectVal = undefined;
      expect(actVal10).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0940
     * @tc.name testFloat64ArrayFind094
     * @tc.desc Verify find callback accesses external state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const twoValue: number = 2;
      const values = new Float64Array([0.5, onePointFive, 0.25]);
      let externalSum = 0.0;
      const result = values.find((value) => {
        externalSum += value;
        return value > 1;
      });

      const expectVal = onePointFive;
      expect(result).assertEqual(expectVal);
      const expectVal2 = twoValue;
      expect(externalSum).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0950
     * @tc.name testFloat64ArrayFind095
     * @tc.desc Verify find callback error propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128]);
      try {
        values.find((value) => {
          throw new Error("test");
        });

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0960
     * @tc.name testFloat64ArrayFind096
     * @tc.desc Verify find returns undefined type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1]);
      const result = values.find((value) => value > 100);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0970
     * @tc.name testFloat64ArrayFind097
     * @tc.desc Verify find with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const hexValue55: number = 0x55;
      const num170Pointzero: number = 170.0;
      const arr = new Float64Array([hexValueFF, hexValueAA, hexValue55]);
      const v = arr.find((e: number): boolean => e === 0xAA);
      const expectVal = num170Pointzero;
      expect(v).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0980
     * @tc.name testFloat64ArrayFind098
     * @tc.desc Verify find with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const binaryValue01010101: number = 0b01010101;
      const num170Pointzero: number = 170.0;
      const arr = new Float64Array([binaryValue11111111, binaryValue10101010, binaryValue01010101]);
      const v = arr.find((e: number): boolean => e === 0b10101010);
      const expectVal = num170Pointzero;
      expect(v).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_0990
     * @tc.name testFloat64ArrayFind099
     * @tc.desc Verify find with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const result = arr.find((value: number): boolean => {
        return value !== value;
      });
      const actVal = Number.isNaN(result as Double);
      const expectVal = true;
      expect(actVal).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_1000
     * @tc.name testFloat64ArrayFind100
     * @tc.desc Verify find with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const result = arr.find((value: number): boolean => {
        return value === Double.POSITIVE_INFINITY;
      });
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FIND_1010
     * @tc.name testFloat64ArrayFind101
     * @tc.desc Verify find with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFind101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const result = arr.find((value: number): boolean => {
        return value === Double.MIN_VALUE;
      })
      const expectVal = doubleMinValue;
      expect(result).assertEqual(expectVal);
    });

  })
}
