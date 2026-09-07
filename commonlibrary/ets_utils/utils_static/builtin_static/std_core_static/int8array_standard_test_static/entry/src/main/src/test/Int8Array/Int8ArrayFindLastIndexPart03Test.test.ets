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
} from '../../../../hypium/index';
import Utils from './../Util.test';

class CustomError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'CustomError';
  }
}

export default function int8ArrayFindLastIndexPart03Test(): void {
  describe('Int8ArrayFindLastIndexPart03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_0100
     * @tc.name int8ArrayFindLastIndexPart03Test001
     * @tc.desc Verify findLastIndex throws RangeError propagates name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new RangeError('range trigger');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_0200
     * @tc.name int8ArrayFindLastIndexPart03Test002
     * @tc.desc Verify findLastIndex throws TypeError propagates name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new TypeError('type trigger');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_0300
     * @tc.name int8ArrayFindLastIndexPart03Test003
     * @tc.desc Verify findLastIndex throws SyntaxError propagates name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new SyntaxError('syntax trigger');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_0400
     * @tc.name int8ArrayFindLastIndexPart03Test004
     * @tc.desc Verify findLastIndex throws Error propagates name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new Error('plain trigger');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_0500
     * @tc.name int8ArrayFindLastIndexPart03Test005
     * @tc.desc Verify findLastIndex throws RangeError propagates message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new RangeError('range message body');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(e.message).assertEqual('range message body');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_0600
     * @tc.name int8ArrayFindLastIndexPart03Test006
     * @tc.desc Verify findLastIndex throws custom Error subclass propagates name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new CustomError('custom trigger');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('CustomError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_0700
     * @tc.name int8ArrayFindLastIndexPart03Test007
     * @tc.desc Verify findLastIndex throws URIError propagates name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new URIError('uri trigger');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('URIError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_0800
     * @tc.name int8ArrayFindLastIndexPart03Test008
     * @tc.desc Verify findLastIndex throws Error on first access, count 1, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let count: int = 0;
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          count = count + 1;
          throw new Error('first access');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('first access');
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_0900
     * @tc.name int8ArrayFindLastIndexPart03Test009
     * @tc.desc Verify findLastIndex throws Error on second access, count 2, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let count: int = 0;
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          count = count + 1;
          if (count === 2) {
            throw new Error('second access');
          }
          return false;
        });
        expect(rIdx).assertEqual(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('second access');
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_1000
     * @tc.name int8ArrayFindLastIndexPart03Test010
     * @tc.desc Verify findLastIndex throws Error at index 0 after full traversal, count 4, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let count: int = 0;
      try {
        let rIdx: int = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          count = count + 1;
          if (index === 0) {
            throw new Error('last access');
          }
          return false;
        });
        expect(rIdx).assertEqual(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('last access');
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_1100
     * @tc.name int8ArrayFindLastIndexPart03Test011
     * @tc.desc Verify findLastIndex traverses from last index 4 first, on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let firstIndex: int = -1;
      try {
        let rIdx: int = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          if (firstIndex === -1) {
            firstIndex = index;
          }
          if (index === 2) {
            throw new Error('idx two');
          }
          return false;
        });
        expect(rIdx).assertEqual(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('idx two');
      }
      expect(firstIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_1200
     * @tc.name int8ArrayFindLastIndexPart03Test012
     * @tc.desc Verify findLastIndex throws Error on second access, count 2, on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let count: int = 0;
      try {
        let rIdx: int = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          count = count + 1;
          if (index === 3) {
            throw new Error('partial stop');
          }
          return false;
        });
        expect(rIdx).assertEqual(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('partial stop');
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_1300
     * @tc.name int8ArrayFindLastIndexPart03Test013
     * @tc.desc Verify findLastIndex expects Error throws exception, with $_get(2), on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new Error('content check');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('content check');
      }
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_1400
     * @tc.name int8ArrayFindLastIndexPart03Test014
     * @tc.desc Verify findLastIndex propagates Error from predicate and length stays 3, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new Error('length check');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('length check');
      }
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_1500
     * @tc.name int8ArrayFindLastIndexPart03Test015
     * @tc.desc Verify findLastIndex propagates Error from predicate, no result returned, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          throw new Error('no return value');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('no return value');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_1600
     * @tc.name int8ArrayFindLastIndexPart03Test016
     * @tc.desc Verify findLastIndex callback throwing Error propagates and captures value 20 on Int8Array.of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let capturedValue: number = 0;
      try {
        let rIdx: int = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
          if (index === 1) {
            capturedValue = value;
            throw new Error('value capture');
          }
          return false;
        });
        expect(rIdx).assertEqual(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('value capture');
      }
      expect(capturedValue).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_1700
     * @tc.name int8ArrayFindLastIndexPart03Test017
     * @tc.desc Verify findLastIndex propagates Error thrown at index 2 after capturing value 3, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let capturedValue: number = 0;
      try {
        let rIdx: int = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
          if (index === 2) {
            capturedValue = value;
            throw new Error('ref capture');
          }
          return false;
        });
        expect(rIdx).assertEqual(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('ref capture');
      }
      expect(capturedValue).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_1800
     * @tc.name int8ArrayFindLastIndexPart03Test018
     * @tc.desc Verify re-call findLastIndex after throw works normally no side effects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new Error('first call');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('first call');
      }
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_1900
     * @tc.name int8ArrayFindLastIndexPart03Test019
     * @tc.desc Verify findLastIndex expects -1 when callback matches value 99, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_2000
     * @tc.name int8ArrayFindLastIndexPart03Test020
     * @tc.desc Verify empty array findLastIndex returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_2100
     * @tc.name int8ArrayFindLastIndexPart03Test021
     * @tc.desc Verify findLastIndex expects -1, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_2200
     * @tc.name int8ArrayFindLastIndexPart03Test022
     * @tc.desc Verify findLastIndex expects -1, on Int8Array.of(42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_2300
     * @tc.name int8ArrayFindLastIndexPart03Test023
     * @tc.desc Verify findLastIndex with predicate element == 8 returns -1 (not found)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 7, 7, 7);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 8);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_2400
     * @tc.name int8ArrayFindLastIndexPart03Test024
     * @tc.desc Verify findLastIndex with predicate element != 0 returns -1 on all-zero array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(5);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value !== 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_2500
     * @tc.name int8ArrayFindLastIndexPart03Test025
     * @tc.desc Verify findLastIndex expects -1, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value < 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_2600
     * @tc.name int8ArrayFindLastIndexPart03Test026
     * @tc.desc Verify findLastIndex expects -1, on Int8Array.of(-10, -20, -30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-10, -20, -30);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_2700
     * @tc.name int8ArrayFindLastIndexPart03Test027
     * @tc.desc Verify findLastIndex with predicate element == 200 returns -1 (out-of-range, not found)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 0, INT8_MAX);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 200);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_2800
     * @tc.name int8ArrayFindLastIndexPart03Test028
     * @tc.desc Verify findLastIndex with predicate element > 50 returns -1 on all-zero array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value > 50);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_2900
     * @tc.name int8ArrayFindLastIndexPart03Test029
     * @tc.desc Verify findLastIndex with predicate element == 51 returns -1 (not found)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(50, 50, 50);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 51);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_3000
     * @tc.name int8ArrayFindLastIndexPart03Test030
     * @tc.desc Verify findLastIndex returns -1 on empty new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let count: int = 0;
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return true;
      });
      expect(count).assertEqual(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_3100
     * @tc.name int8ArrayFindLastIndexPart03Test031
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_3200
     * @tc.name int8ArrayFindLastIndexPart03Test032
     * @tc.desc Verify findLastIndex expects 0 and invokes callback once, on Int8Array.of(42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let count: int = 0;
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
        count = count + 1;
        return value === 42;
      });
      expect(count).assertEqual(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_3300
     * @tc.name int8ArrayFindLastIndexPart03Test033
     * @tc.desc Verify findLastIndex expects 3, on Int8Array.of(7, 7, 7, 7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 7, 7, 7);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 7);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_3400
     * @tc.name int8ArrayFindLastIndexPart03Test034
     * @tc.desc Verify findLastIndex expects 3 and invokes callback once, on Int8Array.of(7, 7, 7, 7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 7, 7, 7);
      let callCount: int = 0;
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
        callCount = callCount + 1;
        return value === 7;
      });
      expect(callCount).assertEqual(1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_3500
     * @tc.name int8ArrayFindLastIndexPart03Test035
     * @tc.desc Verify findLastIndex expects 1, on Int8Array.of(5, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 5);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 5);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_3600
     * @tc.name int8ArrayFindLastIndexPart03Test036
     * @tc.desc Verify findLastIndex with predicate element == 6 returns -1 (not found)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 5);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 6);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_3700
     * @tc.name int8ArrayFindLastIndexPart03Test037
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MAX);
      const result: int = arr.findLastIndex(
        (value: number, index: int, array: Int8Array): boolean => value === INT8_MAX,
      );
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_3800
     * @tc.name int8ArrayFindLastIndexPart03Test038
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(-128)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === -128);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_3900
     * @tc.name int8ArrayFindLastIndexPart03Test039
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(99, 1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(99, 1, 2, 3);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 99);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_4000
     * @tc.name int8ArrayFindLastIndexPart03Test040
     * @tc.desc Verify findLastIndex expects 3, on Int8Array.of(1, 2, 3, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 99);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 99);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_4100
     * @tc.name int8ArrayFindLastIndexPart03Test041
     * @tc.desc Verify findLastIndex expects 4, on Int8Array.of(99, 1, 99, 2, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(99, 1, 99, 2, 99);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 99);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_4200
     * @tc.name int8ArrayFindLastIndexPart03Test042
     * @tc.desc Verify findLastIndex expects 3, on Int8Array.of(99, 1, 2, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(99, 1, 2, 99);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 99);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_4300
     * @tc.name int8ArrayFindLastIndexPart03Test043
     * @tc.desc Verify findLastIndex expects 2, on Int8Array.of(1, 99, 99, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 99, 99, 2);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 99);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_4400
     * @tc.name int8ArrayFindLastIndexPart03Test044
     * @tc.desc Verify findLastIndex expects 1, on Int8Array.of(1, 99, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 99, 2);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 99);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_4500
     * @tc.name int8ArrayFindLastIndexPart03Test045
     * @tc.desc Verify findLastIndex expects 2, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let indices: int[] = [];
      const result: int = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        indices.push(index);
        return false;
      });
      expect(indices[0]).assertEqual(2);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_4600
     * @tc.name int8ArrayFindLastIndexPart03Test046
     * @tc.desc Verify findLastIndex callback captures value 30 at index 2 during reverse traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let firstValue: number = 0;
      const result: int = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (index === 2) {
          firstValue = value;
        }
        return false;
      });
      expect(firstValue).assertEqual(30);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_4700
     * @tc.name int8ArrayFindLastIndexPart03Test047
     * @tc.desc Verify findLastIndex callback captures first visited value 1 and returns -1 when predicate always false, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let capturedFirst: number = 0;
      const result: int = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (index === 0) {
          capturedFirst = value;
        }
        return false;
      });
      expect(capturedFirst).assertEqual(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_4800
     * @tc.name int8ArrayFindLastIndexPart03Test048
     * @tc.desc Verify findLastIndex callback captures array.length 5, on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let arrLength: int = 0;
      const result: int = arr.findLastIndex((value: number, index: int, array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        if (index === 4) {
          arrLength = array.length;
        }
        return false;
      });
      expect(arrLength).assertEqual(5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_4900
     * @tc.name int8ArrayFindLastIndexPart03Test049
     * @tc.desc Verify findLastIndex callback invoked 5 times, on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let count: int = 0;
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return false;
      });
      expect(count).assertEqual(5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_5000
     * @tc.name int8ArrayFindLastIndexPart03Test050
     * @tc.desc Verify findLastIndex expects 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let sum: number = 0;
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
        sum = sum + value;
        return false;
      });
      expect(sum).assertEqual(60);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_5100
     * @tc.name int8ArrayFindLastIndexPart03Test051
     * @tc.desc Verify findLastIndex with predicate element > threshold returns last matching index 4, on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let threshold: number = 3;
      const result: int = arr.findLastIndex(
        (value: number, index: int, array: Int8Array): boolean => value > threshold,
      );
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_5200
     * @tc.name int8ArrayFindLastIndexPart03Test052
     * @tc.desc Verify findLastIndex with predicate element == 100 returns last matching index 0 after $_set(0, 100), on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      const result: int = arr.findLastIndex((value: number, index: int, array: Int8Array): boolean => {
        if (index === 1) {
          array.$_set(0, 100);
        }
        return value === 100;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_5300
     * @tc.name int8ArrayFindLastIndexPart03Test053
     * @tc.desc Verify nested findLastIndex call inner on another array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Int8Array = Int8Array.of(1, 2, 3);
      let inner: Int8Array = Int8Array.of(10, 20, 30);
      const result: int = outer.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
        const innerResult: int = inner.findLastIndex((v: number, _i: int, _a: Int8Array): boolean => v === 20);
        return value === 3 && innerResult === 1;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_5400
     * @tc.name int8ArrayFindLastIndexPart03Test054
     * @tc.desc Verify findLastIndex expects 3, on Int8Array.of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let firstIdx: int = -1;
      let lastIdx: int = -1;
      const result: int = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        if (firstIdx === -1) {
          firstIdx = index;
        }
        lastIdx = index;
        return false;
      });
      expect(firstIdx).assertEqual(3);
      expect(lastIdx).assertEqual(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_5500
     * @tc.name int8ArrayFindLastIndexPart03Test055
     * @tc.desc Verify findLastIndex with predicate element == 2 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_5600
     * @tc.name int8ArrayFindLastIndexPart03Test056
     * @tc.desc Verify findLastIndex expects 4, on Int8Array.of(1, 2, 3, 4, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 5);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_5700
     * @tc.name int8ArrayFindLastIndexPart03Test057
     * @tc.desc Verify findLastIndex callback captures value 3 at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let capturedValue: number = 0;
      let rIdx: int = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (index === 2) {
          capturedValue = value;
        }
        return false;
      });
      expect(rIdx).assertEqual(-1);
      expect(capturedValue).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_5800
     * @tc.name int8ArrayFindLastIndexPart03Test058
     * @tc.desc Verify findLastIndex expects SyntaxError throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new SyntaxError('syntax message body');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
        expect(e.message).assertEqual('syntax message body');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_5900
     * @tc.name int8ArrayFindLastIndexPart03Test059
     * @tc.desc Verify findLastIndex expects CustomError throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new CustomError('custom message body');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('CustomError');
        expect(e.message).assertEqual('custom message body');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_6000
     * @tc.name int8ArrayFindLastIndexPart03Test060
     * @tc.desc Verify findLastIndex expects ReferenceError throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new ReferenceError('ref trigger');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ReferenceError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_6100
     * @tc.name int8ArrayFindLastIndexPart03Test061
     * @tc.desc Verify findLastIndex throws Error with direct call and e.message assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        let rIdx: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          throw new Error('error message body');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('error message body');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_6200
     * @tc.name int8ArrayFindLastIndexPart03Test062
     * @tc.desc Verify findLastIndex expects 2, on Int8Array.of(INT8_MAX, 1, INT8_MAX, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MAX, 1, INT8_MAX, 2);
      const result: int = arr.findLastIndex(
        (value: number, index: int, array: Int8Array): boolean => value === INT8_MAX,
      );
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_6300
     * @tc.name int8ArrayFindLastIndexPart03Test063
     * @tc.desc Verify findLastIndex expects 2, on Int8Array.of(-128, 1, -128, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 1, -128, 2);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === -128);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_6400
     * @tc.name int8ArrayFindLastIndexPart03Test064
     * @tc.desc Verify findLastIndex with predicate element == 0 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_6500
     * @tc.name int8ArrayFindLastIndexPart03Test065
     * @tc.desc Verify findLastIndex expects -1, on Int8Array.of(-1, -2, -3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1, -2, -3);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_6600
     * @tc.name int8ArrayFindLastIndexPart03Test066
     * @tc.desc Verify findLastIndex expects -1 when callback value < 0, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value < 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_6700
     * @tc.name int8ArrayFindLastIndexPart03Test067
     * @tc.desc Verify findLastIndex expects 3 with always-true callback, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_6800
     * @tc.name int8ArrayFindLastIndexPart03Test068
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      const result: int = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_6900
     * @tc.name int8ArrayFindLastIndexPart03Test069
     * @tc.desc Verify findLastIndex expects 3 when callback index === 3, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      const result: int = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (value < INT8_MIN || value > INT8_MAX) {
          return false;
        }
        return index === 3;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_7000
     * @tc.name int8ArrayFindLastIndexPart03Test070
     * @tc.desc Verify findLastIndex throws Error at index 2, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      try {
        let rIdx: int = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
          if (value < INT8_MIN || value > INT8_MAX) {
            return false;
          }
          if (index === 2) {
            throw new Error('idx trigger');
          }
          return false;
        });
        expect(rIdx).assertEqual(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('idx trigger');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_7100
     * @tc.name int8ArrayFindLastIndexPart03Test071
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FINDLASTINDEX_PART03_7200
     * @tc.name int8ArrayFindLastIndexPart03Test072
     * @tc.desc Verify findLastIndex expects -1, on Int8Array.of(1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2);
      const result: int = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 99);
      expect(result).assertEqual(-1);
    });
  });
}
