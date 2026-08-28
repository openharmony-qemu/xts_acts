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
import Utils from '../Util.test';

class FilterTestErrorForFilterPart03 extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'FilterTestErrorForFilterPart03';
  }
}

export default function int8ArrayFilterPart03Test(): void {
  describe('Int8ArrayFilterPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_0100
     * @tc.name int8ArrayFilterPart03Test001
     * @tc.desc Verify filter propagates RangeError thrown in predicate on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        const result: Int8Array = arr.filter((_val: number): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          throw new RangeError('range error');
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_0200
     * @tc.name int8ArrayFilterPart03Test002
     * @tc.desc Verify filter propagates TypeError thrown in predicate on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        const result: Int8Array = arr.filter((_val: number): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          throw new TypeError('type error');
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_0300
     * @tc.name int8ArrayFilterPart03Test003
     * @tc.desc Verify filter propagates base Error thrown in predicate on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        const result: Int8Array = arr.filter((_val: number): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          throw new Error('base error');
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_0400
     * @tc.name int8ArrayFilterPart03Test004
     * @tc.desc Verify filter propagates EvalError thrown in predicate on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        const result: Int8Array = arr.filter((_val: number): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          throw new EvalError('eval error');
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('EvalError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_0500
     * @tc.name int8ArrayFilterPart03Test005
     * @tc.desc Verify filter propagates SyntaxError thrown in predicate on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        const result: Int8Array = arr.filter((_val: number): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          throw new SyntaxError('syntax error');
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_0600
     * @tc.name int8ArrayFilterPart03Test006
     * @tc.desc Verify filter propagates URIError thrown in predicate on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        const result: Int8Array = arr.filter((_val: number): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          throw new URIError('uri error');
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('URIError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_0700
     * @tc.name int8ArrayFilterPart03Test007
     * @tc.desc Verify filter propagates ReferenceError thrown in predicate on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        const result: Int8Array = arr.filter((_val: number): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          throw new ReferenceError('ref error');
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ReferenceError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_0800
     * @tc.name int8ArrayFilterPart03Test008
     * @tc.desc Verify filter propagates custom exception name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        const result: Int8Array = arr.filter((_val: number): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          throw new FilterTestErrorForFilterPart03('custom error');
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FilterTestErrorForFilterPart03');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_0900
     * @tc.name int8ArrayFilterPart03Test009
     * @tc.desc Verify filter propagates Error with message 'filter-msg-9981' on Int8Array.of(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1);
      try {
        const result: Int8Array = arr.filter((_val: number): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          throw new Error('filter-msg-9981');
        });
        let r1: int = result.length;
        let e1: int = 1;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('filter-msg-9981');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_1000
     * @tc.name int8ArrayFilterPart03Test010
     * @tc.desc Verify filter throws Error at index 0, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let lastIndex: int = -1;
      try {
        const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          lastIndex = index;
          if (index === 0) {
            throw new Error('first');
          }
          return true;
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(lastIndex).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_1100
     * @tc.name int8ArrayFilterPart03Test011
     * @tc.desc Verify filter throws Error when predicate reaches index 2 on Int8Array.of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let lastIndex: int = -1;
      try {
        const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          lastIndex = index;
          if (index === 2) {
            throw new Error('mid');
          }
          return true;
        });
        let r1: int = result.length;
        let e1: int = 4;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(lastIndex).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_1200
     * @tc.name int8ArrayFilterPart03Test012
     * @tc.desc Verify filter throws Error at index 2, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let lastIndex: int = -1;
      try {
        const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          lastIndex = index;
          if (index === 2) {
            throw new Error('last');
          }
          return true;
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(lastIndex).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_1300
     * @tc.name int8ArrayFilterPart03Test013
     * @tc.desc Verify filter propagates Error from predicate on first call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      try {
        const result: Int8Array = arr.filter((_val: number): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          throw new Error('noop');
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_1400
     * @tc.name int8ArrayFilterPart03Test014
     * @tc.desc Verify after callback throws, filter returns no partial result and caller cannot get return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let gotResult: boolean = false;
      try {
        const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          if (index === 1) {
            throw new Error('partial');
          }
          return true;
        });
        let r1: int = result.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        gotResult = true;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(gotResult).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_1500
     * @tc.name int8ArrayFilterPart03Test015
     * @tc.desc Verify filter propagates TypeError thrown in predicate on single-element Int8Array.of(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1);
      try {
        const result: Int8Array = arr.filter((_val: number): boolean => {
          if (_val < INT8_MIN || _val > INT8_MAX) {
            return false;
          }
          throw new TypeError('type');
        });
        let r1: int = result.length;
        let e1: int = 1;
        expect(r1).assertEqual(e1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_1600
     * @tc.name int8ArrayFilterPart03Test016
     * @tc.desc Verify empty array filter callback execution count is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let count: int = 0;
      let result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        count = count + 1;
        return true;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_1700
     * @tc.name int8ArrayFilterPart03Test017
     * @tc.desc Verify empty array filter returns new Int8Array instance, not original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_1800
     * @tc.name int8ArrayFilterPart03Test018
     * @tc.desc Verify empty array filter result byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return true;
      });
      let r1: int = result.byteLength;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: int = result.buffer.byteLength;
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_1900
     * @tc.name int8ArrayFilterPart03Test019
     * @tc.desc Verify filter with always false predicate returns length 0 on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_2000
     * @tc.name int8ArrayFilterPart03Test020
     * @tc.desc Verify filter val > INT8_MAX matches nothing returning length 0 on Int8Array.of(1, 50, INT8_MAX, -128)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 50, INT8_MAX, -128);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > INT8_MAX;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_2100
     * @tc.name int8ArrayFilterPart03Test021
     * @tc.desc Verify filter val < -128 matches nothing returning length 0 on Int8Array.of(1, -50, -128, INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, -50, -128, INT8_MAX);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val < -128;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_2200
     * @tc.name int8ArrayFilterPart03Test022
     * @tc.desc Verify filter val !== 42 matches nothing returning length 0 on Int8Array.of(42, 42, 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42, 42, 42);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val !== 42;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_2300
     * @tc.name int8ArrayFilterPart03Test023
     * @tc.desc Verify filter with always true predicate keeps single element 5 on Int8Array.of(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_2400
     * @tc.name int8ArrayFilterPart03Test024
     * @tc.desc Verify filter with always false predicate returns length 0 on Int8Array.of(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_2500
     * @tc.name int8ArrayFilterPart03Test025
     * @tc.desc Verify filter val === -128 keeps -128 at $_get(0) on Int8Array.of(-128)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === -128;
      });
      expect(result.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_2600
     * @tc.name int8ArrayFilterPart03Test026
     * @tc.desc Verify filter val === INT8_MAX keeps INT8_MAX at $_get(0) on Int8Array.of(INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MAX);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === INT8_MAX;
      });
      expect(result.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_2700
     * @tc.name int8ArrayFilterPart03Test027
     * @tc.desc Verify filter val === 0 keeps 0 at $_get(0) on Int8Array.of(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === 0;
      });
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_2800
     * @tc.name int8ArrayFilterPart03Test028
     * @tc.desc Verify filter val === 0 keeps all 4 zero elements of new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === 0;
      });
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_2900
     * @tc.name int8ArrayFilterPart03Test029
     * @tc.desc Verify filter val === INT8_MAX keeps all 4 elements on Int8Array.of(INT8_MAX, INT8_MAX, INT8_MAX, INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MAX, INT8_MAX, INT8_MAX, INT8_MAX);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === INT8_MAX;
      });
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_3000
     * @tc.name int8ArrayFilterPart03Test030
     * @tc.desc Verify filter val === -128 keeps all 3 elements on Int8Array.of(-128, -128, -128)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, -128, -128);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === -128;
      });
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_3100
     * @tc.name int8ArrayFilterPart03Test031
     * @tc.desc Verify filter val === 1 keeps all 5 elements on Int8Array.of(1, 1, 1, 1, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 1, 1, 1, 1);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === 1;
      });
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_3200
     * @tc.name int8ArrayFilterPart03Test032
     * @tc.desc Verify all-same collection with condition val greater than that value, all elements filtered out
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 7, 7);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > 7;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_3300
     * @tc.name int8ArrayFilterPart03Test033
     * @tc.desc Verify filter callback reads arr.$_get(0) as 10 during index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let got: number | undefined = -999;
      const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        if (index === 1) {
          got = arr.$_get(0);
        }
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(got).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_3400
     * @tc.name int8ArrayFilterPart03Test034
     * @tc.desc Verify filter callback reads arr.$_get(2) as 30 during index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let got: number | undefined = -999;
      const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        if (index === 0) {
          got = arr.$_get(2);
        }
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(got).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_3500
     * @tc.name int8ArrayFilterPart03Test035
     * @tc.desc Verify filter callback reads arr.at(-1) as 30 during index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let got: number | undefined = -999;
      const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        if (index === 0) {
          got = arr.at(-1);
        }
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(got).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_3600
     * @tc.name int8ArrayFilterPart03Test036
     * @tc.desc Verify filter callback reads arr.at(-3) as 10 during index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let got: number | undefined = -999;
      const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        if (index === 0) {
          got = arr.at(-3);
        }
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(got).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_3700
     * @tc.name int8ArrayFilterPart03Test037
     * @tc.desc Verify filter callback at(-4) returns undefined, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let got: number | undefined = -999;
      const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        if (index === 0) {
          got = arr.at(-4);
        }
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(got).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_3800
     * @tc.name int8ArrayFilterPart03Test038
     * @tc.desc Verify filter callback at(3) returns undefined, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let got: number | undefined = -999;
      const result = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        if (index === 0) {
          got = arr.at(3);
        }
        return false;
      });
      expect(got).assertUndefined();
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_3900
     * @tc.name int8ArrayFilterPart03Test039
     * @tc.desc Verify filter callback receives first index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let firstIndex: int = -1;
      const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        if (firstIndex === -1) {
          firstIndex = index;
        }
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_4000
     * @tc.name int8ArrayFilterPart03Test040
     * @tc.desc Verify filter callback last index is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let lastIndex: int = -1;
      const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        lastIndex = index;
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(lastIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_4100
     * @tc.name int8ArrayFilterPart03Test041
     * @tc.desc Verify callback index is strictly increasing during filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let monotonic: boolean = true;
      let prev: int = -1;
      const result: Int8Array = arr.filter((_val: number, index: int): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        if (index !== prev + 1) {
          monotonic = false;
        }
        prev = index;
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(monotonic).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_4200
     * @tc.name int8ArrayFilterPart03Test042
     * @tc.desc Verify filter callback visits val -128, on Int8Array.of(-128, 0, INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 0, INT8_MAX);
      let foundMin: boolean = false;
      const result: Int8Array = arr.filter((val: number): boolean => {
        if (val === -128) {
          foundMin = true;
        }
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(foundMin).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_4300
     * @tc.name int8ArrayFilterPart03Test043
     * @tc.desc Verify filter callback visits val INT8_MAX, on Int8Array.of(-128, 0, INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 0, INT8_MAX);
      let foundMax: boolean = false;
      const result: Int8Array = arr.filter((val: number): boolean => {
        if (val === INT8_MAX) {
          foundMax = true;
        }
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(foundMax).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_4400
     * @tc.name int8ArrayFilterPart03Test044
     * @tc.desc Verify filter callback visits val 0, on Int8Array.of(-128, 0, INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 0, INT8_MAX);
      let foundZero: boolean = false;
      const result: Int8Array = arr.filter((val: number): boolean => {
        if (val === 0) {
          foundZero = true;
        }
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(foundZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_4500
     * @tc.name int8ArrayFilterPart03Test045
     * @tc.desc Verify callback third parameter array is same reference as original array calling filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let seenLength: int = 0;
      const result: Int8Array = arr.filter((_val: number, _index: int, array: Int8Array): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        seenLength = array.length;
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(seenLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_4600
     * @tc.name int8ArrayFilterPart03Test046
     * @tc.desc Verify filter callback array param length is 3 on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let arrLen: int = 0;
      const result: Int8Array = arr.filter((_val: number, _index: int, array: Int8Array): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        arrLen = array.length;
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(arrLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_4700
     * @tc.name int8ArrayFilterPart03Test047
     * @tc.desc Verify filter callback sums values to 60 on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let total: number = 0;
      const result: Int8Array = arr.filter((val: number): boolean => {
        total = total + val;
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(total).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_4800
     * @tc.name int8ArrayFilterPart03Test048
     * @tc.desc Verify filter callback array.$_get(index) equals val for all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let consistent: boolean = true;
      const result: Int8Array = arr.filter((val: number, index: int, array: Int8Array): boolean => {
        if (array.$_get(index) !== val) {
          consistent = false;
        }
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(consistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_4900
     * @tc.name int8ArrayFilterPart03Test049
     * @tc.desc Verify filter callback reads mutated $_set(1, 99) value at index 1 on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let secondVal: number = 0;
      const result: Int8Array = arr.filter((val: number, index: int, array: Int8Array): boolean => {
        if (index === 0) {
          array.$_set(1, 99);
        }
        if (index === 1) {
          secondVal = val;
        }
        return false;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(secondVal).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_5000
     * @tc.name int8ArrayFilterPart03Test050
     * @tc.desc Verify filter val > 0 keeps 2 elements on Int8Array.of(-2, 0, 3, -1, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-2, 0, 3, -1, 5);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > 0;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_5100
     * @tc.name int8ArrayFilterPart03Test051
     * @tc.desc Verify filter val < 0 keeps 2 elements on Int8Array.of(-2, 0, 3, -1, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-2, 0, 3, -1, 5);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val < 0;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_5200
     * @tc.name int8ArrayFilterPart03Test052
     * @tc.desc Verify filter val === 0 keeps 2 elements on Int8Array.of(-2, 0, 3, 0, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-2, 0, 3, 0, 5);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val === 0;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_5300
     * @tc.name int8ArrayFilterPart03Test053
     * @tc.desc Verify filter val % 2 === 0 keeps 3 elements on Int8Array.of(1, 2, 3, 4, 5, 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5, 6);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val % 2 === 0;
      });
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_5400
     * @tc.name int8ArrayFilterPart03Test054
     * @tc.desc Verify filter return value has fresh buffer, not shared with source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result.length).assertEqual(3);
      expect(result.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_5500
     * @tc.name int8ArrayFilterPart03Test055
     * @tc.desc Verify filter returns new instance, modifying result does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.filter((_val: number): boolean => {
        if (_val < INT8_MIN || _val > INT8_MAX) {
          return false;
        }
        return true;
      });
      result.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_5600
     * @tc.name int8ArrayFilterPart03Test056
     * @tc.desc Verify filter val > 1 returns 2 elements, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > 1;
      });
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_5700
     * @tc.name int8ArrayFilterPart03Test057
     * @tc.desc Verify filter val >= 3 keeps 2 elements on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val >= 3;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_5800
     * @tc.name int8ArrayFilterPart03Test058
     * @tc.desc Verify filter val % 2 === 0 keeps 2 and 4 on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val % 2 === 0;
      });
      expect(result.$_get(0)).assertEqual(2);
      expect(result.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_5900
     * @tc.name int8ArrayFilterPart03Test059
     * @tc.desc Verify filter val < 0 keeps -128 at $_get(0) on Int8Array.of(-128, 0, INT8_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128, 0, INT8_MAX);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val < 0;
      });
      expect(result.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_6000
     * @tc.name int8ArrayFilterPart03Test060
     * @tc.desc Verify filter returns result whose byteLength matches 3 elements, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > 1;
      });
      let r1: int = result.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_6100
     * @tc.name int8ArrayFilterPart03Test061
     * @tc.desc Verify filter chain call, two filters result is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let result: Int8Array = arr
        .filter((val: number): boolean => {
          return val > 1;
        })
        .filter((val: number): boolean => {
          return val < 5;
        });
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_6200
     * @tc.name int8ArrayFilterPart03Test062
     * @tc.desc Verify filter followed by toReversed returns reversed new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let result: Int8Array = arr
        .filter((val: number): boolean => {
          return val > 1;
        })
        .toReversed();
      expect(result.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILTER_PART03_6300
     * @tc.name int8ArrayFilterPart03Test063
     * @tc.desc Verify filter val > 0 && val % 2 === 0 keeps 2 elements on Int8Array.of(-2, -1, 0, 1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFilterPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-2, -1, 0, 1, 2, 3, 4);
      let result: Int8Array = arr.filter((val: number): boolean => {
        return val > 0 && val % 2 === 0;
      });
      expect(result.length).assertEqual(2);
    });
  });
}
