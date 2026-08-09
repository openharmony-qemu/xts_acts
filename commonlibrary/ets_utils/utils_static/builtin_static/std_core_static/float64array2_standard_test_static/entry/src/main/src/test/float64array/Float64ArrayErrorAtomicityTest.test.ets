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
import Utils from './../Util.test';

export default function Float64ArrayErrorAtomicityTest(): void {
  describe('Float64ArrayErrorAtomicityTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_0100
     * @tc.name testFloat64ArrayErrorAtomicity001
     * @tc.desc Verify map callback error leaves original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.map((v: number): number => {
          if (v === 2.0) {
            throw new Error('map stop');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'map stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_0200
     * @tc.name testFloat64ArrayErrorAtomicity002
     * @tc.desc Verify filter callback error leaves original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.filter((v: number): boolean => {
          if (v === 3.0) {
            throw new Error('filter stop');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'filter stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_0300
     * @tc.name testFloat64ArrayErrorAtomicity003
     * @tc.desc Verify forEach callback error stops later callback execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      let count: int = 0;
      try {
        arr.forEach((v: number): void => {
          count++;
          if (v === 2.0) {
            throw new Error('forEach stop');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'forEach stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = count;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_0400
     * @tc.name testFloat64ArrayErrorAtomicity004
     * @tc.desc Verify every callback error propagates with stopped count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      let count: int = 0;
      try {
        arr.every((v: number): boolean => {
          count++;
          if (v === 2.0) {
            throw new Error('every stop');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'every stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = count;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_0500
     * @tc.name testFloat64ArrayErrorAtomicity005
     * @tc.desc Verify some callback error propagates with stopped count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      let count: int = 0;
      try {
        arr.some((v: number): boolean => {
          count++;
          if (v === 2.0) {
            throw new Error('some stop');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'some stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = count;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_0600
     * @tc.name testFloat64ArrayErrorAtomicity006
     * @tc.desc Verify reduce callback error propagates after expected calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      let count: int = 0;
      try {
        arr.reduce((a: number, v: number): number => {
          count++;
          if (v === 3.0) {
            throw new Error('reduce stop');
          }
          return a + v;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'reduce stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = count;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_0700
     * @tc.name testFloat64ArrayErrorAtomicity007
     * @tc.desc Verify reduceRight callback error propagates from right side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      let first: number = 0.0;
      try {
        arr.reduceRight((a: number, v: number): number => {
          if (first === 0.0) {
            first = v;
          }
          throw new Error('reduceRight stop');
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'reduceRight stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualResult = first;
      const expectedResult: number = 3.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_0800
     * @tc.name testFloat64ArrayErrorAtomicity008
     * @tc.desc Verify find callback error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      try {
        arr.find((v: number): boolean => {
          throw new Error('find stop');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'find stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_0900
     * @tc.name testFloat64ArrayErrorAtomicity009
     * @tc.desc Verify findIndex callback error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      try {
        arr.findIndex((v: number): boolean => {
          throw new Error('findIndex stop');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'findIndex stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_1000
     * @tc.name testFloat64ArrayErrorAtomicity010
     * @tc.desc Verify findLast predicate exception propagates immediately and keeps original error message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      try {
        arr.findLast((v: number): boolean => {
          throw new Error('findLast stop');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'findLast stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_1100
     * @tc.name testFloat64ArrayErrorAtomicity011
     * @tc.desc Verify findLastIndex callback error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      try {
        arr.findLastIndex((v: number): boolean => {
          throw new Error('findLastIndex stop');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'findLastIndex stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_1200
     * @tc.name testFloat64ArrayErrorAtomicity012
     * @tc.desc Verify sort compare function error leaves array readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 2.0, 1.0);
      try {
        arr.sort((a: number, b: number): int => {
          throw new Error('sort stop');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'sort stop';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualLength = arr.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_1300
     * @tc.name testFloat64ArrayErrorAtomicity013
     * @tc.desc Verify set with too long source preserves target values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = Float64Array.of(1.0, 2.0);
      const src: Float64Array = Float64Array.of(3.0, 4.0, 5.0);
      try {
        target.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        const actualElement0 = target.$_get(0);
        const expectedElement0: number = 1.0;
        expect(actualElement0).assertEqual(expectedElement0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_1400
     * @tc.name testFloat64ArrayErrorAtomicity014
     * @tc.desc Verify with positive out of range leaves original values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      try {
        arr.with(2, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        const actualElement1 = arr.$_get(1);
        const expectedElement1: number = 2.0;
        expect(actualElement1).assertEqual(expectedElement1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_1500
     * @tc.name testFloat64ArrayErrorAtomicity015
     * @tc.desc Verify with negative out of range leaves original values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      try {
        arr.with(-3, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        const actualElement0 = arr.$_get(0);
        const expectedElement0: number = 1.0;
        expect(actualElement0).assertEqual(expectedElement0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_1600
     * @tc.name testFloat64ArrayErrorAtomicity016
     * @tc.desc Verify dollar get negative index throws invalid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_1700
     * @tc.name testFloat64ArrayErrorAtomicity017
     * @tc.desc Verify dollar get length index throws invalid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      try {
        arr.$_get(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_1800
     * @tc.name testFloat64ArrayErrorAtomicity018
     * @tc.desc Verify dollar set negative index preserves original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      try {
        arr.$_set(-1, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_1900
     * @tc.name testFloat64ArrayErrorAtomicity019
     * @tc.desc Verify dollar set length index preserves original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      try {
        arr.$_set(1, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_2000
     * @tc.name testFloat64ArrayErrorAtomicity020
     * @tc.desc Verify callback side effect before throw is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      let total: number = 0.0;
      try {
        arr.forEach((v: number): void => {
          total += v;
          if (v === 2.0) {
            throw new Error('side stop');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualResult = total;
        const expectedResult: number = 3.0;
        expect(actualResult).assertEqual(expectedResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_2100
     * @tc.name testFloat64ArrayErrorAtomicity021
     * @tc.desc Verify map callback explicit source write before throw is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      try {
        arr.map((v: number, i: int): number => {
          if (i === 0) {
            arr.$_set(1, 20.0);
            throw new Error('write stop');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualElement1 = arr.$_get(1);
        const expectedElement1: number = 20.0;
        expect(actualElement1).assertEqual(expectedElement1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_2200
     * @tc.name testFloat64ArrayErrorAtomicity022
     * @tc.desc Verify filter callback explicit source write before throw is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      try {
        arr.filter((v: number, i: int): boolean => {
          if (i === 0) {
            arr.$_set(1, 30.0);
            throw new Error('filter write stop');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualElement1 = arr.$_get(1);
        const expectedElement1: number = 30.0;
        expect(actualElement1).assertEqual(expectedElement1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_2300
     * @tc.name testFloat64ArrayErrorAtomicity023
     * @tc.desc Verify reduce external accumulator record before throw is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      let seen: number = 0.0;
      try {
        arr.reduce((a: number, v: number): number => {
          seen += v;
          if (v === 2.0) {
            throw new Error('record stop');
          }
          return a + v;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualResult = seen;
        const expectedResult: number = 3.0;
        expect(actualResult).assertEqual(expectedResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_2400
     * @tc.name testFloat64ArrayErrorAtomicity024
     * @tc.desc Verify sort compare error does not change length and byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(2.0, 1.0);
      const beforeLength: int = arr.length;
      const beforeByteLength: int = arr.byteLength;
      try {
        arr.sort((a: number, b: number): int => {
          throw new Error('sort size stop');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'sort size stop';
        expect(actualMessage).assertEqual(expectedMessage);
        expect(arr.length).assertEqual(beforeLength);
        expect(arr.byteLength).assertEqual(beforeByteLength);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_2500
     * @tc.name testFloat64ArrayErrorAtomicity025
     * @tc.desc Verify failed set does not change byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = new Float64Array(1);
      const src: Float64Array = Float64Array.of(1.0, 2.0);
      const before: int = target.byteLength;
      try {
        target.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(target.byteLength).assertEqual(before);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_2600
     * @tc.name testFloat64ArrayErrorAtomicity026
     * @tc.desc Verify failed with does not change buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      const buf: ArrayBuffer = arr.buffer;
      try {
        arr.with(1, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(arr.buffer).assertEqual(buf);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_2700
     * @tc.name testFloat64ArrayErrorAtomicity027
     * @tc.desc Verify failed constructor does not affect existing buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const view: Float64Array = new Float64Array(buf);
      view.$_set(0, 5.0);
      try {
        new Float64Array(buf, 8, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        const actualElement0 = view.$_get(0);
        const expectedElement0: number = 5.0;
        expect(actualElement0).assertEqual(expectedElement0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_2800
     * @tc.name testFloat64ArrayErrorAtomicity028
     * @tc.desc Verify some short-circuit true avoids later throwing branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const r: boolean = arr.some((v: number): boolean => {
        if (v === 2.0) {
          throw new Error('should skip');
        }
        return true;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_ERRORATOMICITY_2900
     * @tc.name testFloat64ArrayErrorAtomicity029
     * @tc.desc Verify business critical static chain failure leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayErrorAtomicity029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const telemetry: Float64Array = new Float64Array(0x3);
      telemetry.$_set(0, 1e-308);
      telemetry.$_set(0b1, Number.MAX_VALUE);
      telemetry.$_set(0o2, 3.0);
      try {
        telemetry.filter((v: number): boolean => v > 0.0).map((v: number): number => {
          throw new Error('telemetry transform failed');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'telemetry transform failed';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      const actualElement1 = telemetry.$_get(1);
      const expectedElement1: number = Number.MAX_VALUE;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = telemetry.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });
  })
}
