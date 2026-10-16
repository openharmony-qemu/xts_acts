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

class Box42 {
  v: number = 0;
}
class Box43 {
  v: number = 0;
}

export default function int8ArrayReduceRightPart04Test(): void {
  describe('Int8ArrayReduceRightPart04Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_0100
     * @tc.name int8ArrayReduceRightPart04Test001
     * @tc.desc Verify reduceRight single-element 2-arg overload: callback executes once, returns cb(init, elem)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let called: int = 0;
      let r = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        called = called + 1;
        return p + c;
      }, 100);
      expect(r).assertEqual(142);
      expect(called).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_0200
     * @tc.name int8ArrayReduceRightPart04Test002
     * @tc.desc Verify reduceRight empty array 2-arg overload: returns initialValue, no callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let called: int = 0;
      let r = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        called = called + 1;
        return p + c;
      }, 7);
      expect(r).assertEqual(7);
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_0300
     * @tc.name int8ArrayReduceRightPart04Test003
     * @tc.desc Verify reduceRight 2-element 1-arg overload: callback executes 1 time (N-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let called: int = 0;
      let r = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        called = called + 1;
        return p + c;
      });
      expect(r).assertEqual(30);
      expect(called).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_0400
     * @tc.name int8ArrayReduceRightPart04Test004
     * @tc.desc Verify reduceRight 2-element 2-arg overload: callback executes 2 times (N)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let called: int = 0;
      let r = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        called = called + 1;
        return p + c;
      }, 0);
      expect(r).assertEqual(30);
      expect(called).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_0500
     * @tc.name int8ArrayReduceRightPart04Test005
     * @tc.desc Verify reduceRight consecutive overload calls independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1 = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      let r2 = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      }, 0);
      expect(r1).assertEqual(6);
      expect(r2).assertEqual(6);
      let actual1: number = arr[0];
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr[2];
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_0600
     * @tc.name int8ArrayReduceRightPart04Test006
     * @tc.desc Verify reduceRight one arg first index length minus two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstIdx: number = -1;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        if (firstIdx === -1) {
          firstIdx = i;
        }
        return p + c;
      });
      let expectedVal1: number = 60;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_0700
     * @tc.name int8ArrayReduceRightPart04Test007
     * @tc.desc Verify reduceRight dual arg first index length minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstIdx: number = -1;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (firstIdx === -1) {
          firstIdx = i;
        }
        return p + c;
      }, 0);
      expect(firstIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_0800
     * @tc.name int8ArrayReduceRightPart04Test008
     * @tc.desc Verify reduceRight 2-arg overload first previousValue = explicit initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstPrev: number = 0;
      let seen: boolean = false;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (!seen) {
          firstPrev = p;
          seen = true;
        }
        return p + c;
      }, 100);
      expect(firstPrev).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_0900
     * @tc.name int8ArrayReduceRightPart04Test009
     * @tc.desc Verify reduceRight dual arg first current last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstCur: number = 0;
      let seen: boolean = false;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (!seen) {
          firstCur = c;
          seen = true;
        }
        return p + c;
      }, 0);
      expect(firstCur).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_1000
     * @tc.name int8ArrayReduceRightPart04Test010
     * @tc.desc Verify reduceRight both overloads last index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let lastIdx1: number = -1;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        lastIdx1 = i;
        return p + c;
      });
      let expectedVal1: number = 60;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(lastIdx1).assertEqual(0);
      let lastIdx2: number = -1;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        lastIdx2 = i;
        return p + c;
      }, 0);
      expect(lastIdx2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_1100
     * @tc.name int8ArrayReduceRightPart04Test011
     * @tc.desc Verify both overloads iterate right-to-left (first index > last index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let firstIdx: number = -1;
      let lastIdx: number = -1;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (firstIdx === -1) {
          firstIdx = i;
        }
        lastIdx = i;
        return p + c;
      }, 0);
      expect(firstIdx).assertEqual(3);
      expect(lastIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_1200
     * @tc.name int8ArrayReduceRightPart04Test012
     * @tc.desc Verify reduceRight one arg throw keeps length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
          if (i === 1) {
            throw new Error('stop');
          }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let actual2: int = arr.length;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_1300
     * @tc.name int8ArrayReduceRightPart04Test013
     * @tc.desc Verify reduceRight 1-arg overload callback throw error: original array content unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
          if (i === 1) {
            throw new Error('stop');
          }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let actual2: number = arr[0];
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr[3];
      let expected3: int = 4;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_1400
     * @tc.name int8ArrayReduceRightPart04Test014
     * @tc.desc Verify reduceRight dual arg throw keeps length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
          if (i === 1) {
            throw new Error('stop');
          }
          return p + c;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let actual2: int = arr.length;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_1500
     * @tc.name int8ArrayReduceRightPart04Test015
     * @tc.desc Verify reduceRight 2-arg overload callback throw error: original array content unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
          if (i === 1) {
            throw new Error('stop');
          }
          return p + c;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let actual2: number = arr[0];
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr[3];
      let expected3: int = 4;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_1600
     * @tc.name int8ArrayReduceRightPart04Test016
     * @tc.desc Verify reduceRight one arg propagates callback Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_1700
     * @tc.name int8ArrayReduceRightPart04Test017
     * @tc.desc Verify reduceRight dual arg propagates callback Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
          throw new Error('boom');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_1800
     * @tc.name int8ArrayReduceRightPart04Test018
     * @tc.desc Verify reduceRight one arg propagates RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
          throw new RangeError('r');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_1900
     * @tc.name int8ArrayReduceRightPart04Test019
     * @tc.desc Verify reduceRight dual arg propagates TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
          throw new TypeError('t');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_2000
     * @tc.name int8ArrayReduceRightPart04Test020
     * @tc.desc Verify reduceRight 1-arg overload throw error: exception message field preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
          throw new Error('mymsg');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('mymsg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_2100
     * @tc.name int8ArrayReduceRightPart04Test021
     * @tc.desc Verify reduceRight 2-arg overload throw error: exception message field preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
          throw new Error('mymsg');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('mymsg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_2200
     * @tc.name int8ArrayReduceRightPart04Test022
     * @tc.desc Verify reduceRight 1-arg overload callback throw error: instance still usable, re-execute sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
          if (i === 0) {
            throw new Error('stop');
          }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let sum = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_2300
     * @tc.name int8ArrayReduceRightPart04Test023
     * @tc.desc Verify reduceRight 2-arg overload callback throw error: instance still usable, re-execute sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
          if (i === 0) {
            throw new Error('stop');
          }
          return p + c;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let sum = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      }, 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_2400
     * @tc.name int8ArrayReduceRightPart04Test024
     * @tc.desc Verify reduceRight one arg result type number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      let reducedResult = r;
      let actual1: string = typeof reducedResult;
      let expected1: string = 'number';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_2500
     * @tc.name int8ArrayReduceRightPart04Test025
     * @tc.desc Verify reduceRight dual arg number result type number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      }, 0);
      let reducedResult = r;
      let actual1: string = typeof reducedResult;
      let expected1: string = 'number';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_2600
     * @tc.name int8ArrayReduceRightPart04Test026
     * @tc.desc Verify reduceRight one arg result supports toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let r = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      let actual1: string = r.toFixed(0);
      let expected1: string = '10';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_2700
     * @tc.name int8ArrayReduceRightPart04Test027
     * @tc.desc Verify reduceRight string result length three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r = arr.reduceRight<string>((p: string, c: number, i: int, a: Int8Array): string => {
        return p + c.toString();
      }, '');
      let actual1: int = r.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_2800
     * @tc.name int8ArrayReduceRightPart04Test028
     * @tc.desc Verify reduceRight string result toString identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r = arr.reduceRight<string>((p: string, c: number, i: int, a: Int8Array): string => {
        return p + c.toString();
      }, '');
      let actual1: string = r.toString();
      let expected1 = r;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_2900
     * @tc.name int8ArrayReduceRightPart04Test029
     * @tc.desc Verify reduceRight one arg result toString numeric
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let r = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      let actual1: string = r.toString();
      let expected1: string = '10';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_3000
     * @tc.name int8ArrayReduceRightPart04Test030
     * @tc.desc Verify reduceRight sum equivalence: 1-arg result === 2-arg(init=0) result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let r1 = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      let r2 = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      }, 0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_3100
     * @tc.name int8ArrayReduceRightPart04Test031
     * @tc.desc Verify reduceRight product equivalence: 1-arg result === 2-arg(init=1) result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let r1 = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p * c;
      });
      let r2 = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p * c;
      }, 1);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_3200
     * @tc.name int8ArrayReduceRightPart04Test032
     * @tc.desc Verify reduceRight sum divergence: 2-arg(init=last elem) = 1-arg result + last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let r1 = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      let r2 = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      }, 4);
      expect(r2).assertEqual(r1 + 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_3300
     * @tc.name int8ArrayReduceRightPart04Test033
     * @tc.desc Verify reduceRight init=first vs init=last element: sum results differ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let rFirst = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      }, 1);
      let rLast = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      }, 4);
      expect(rFirst).assertEqual(11);
      expect(rLast).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_3400
     * @tc.name int8ArrayReduceRightPart04Test034
     * @tc.desc Verify reduceRight one arg callback shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let captured: Int8Array | undefined = undefined;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        if (captured === undefined) {
          captured = a;
        }
        return p + c;
      });
      let expectedVal1: number = 10;
      expect(resultVal1).assertEqual(expectedVal1);
      captured![0] = 77;
      let actual1: number = arr[0];
      let expected1: int = 77;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_3500
     * @tc.name int8ArrayReduceRightPart04Test035
     * @tc.desc Verify reduceRight dual arg callback shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let captured: Int8Array | undefined = undefined;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (captured === undefined) {
          captured = a;
        }
        return p + c;
      }, 0);
      captured![0] = 77;
      let actual1: number = arr[0];
      let expected1: int = 77;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_3600
     * @tc.name int8ArrayReduceRightPart04Test036
     * @tc.desc Verify reduceRight 2-arg overload U=Box: previousValue and external init share same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let init: Box42 = new Box42();
      arr.reduceRight<Box42>((p: Box42, c: number, i: int, a: Int8Array): Box42 => {
        p.v = p.v + c;
        return p;
      }, init);
      let actual1: number = init.v;
      let expected1: int = 6;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_3700
     * @tc.name int8ArrayReduceRightPart04Test037
     * @tc.desc Verify reduceRight 2-arg overload return value same reference as passed init object (no deep copy)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let init: Box43 = new Box43();
      let r: Box43 = arr.reduceRight<Box43>((p: Box43, c: number, i: int, a: Int8Array): Box43 => {
        p.v = p.v + c;
        return p;
      }, init);
      r.v = 999;
      let actual1: number = init.v;
      let expected1: int = 999;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_3800
     * @tc.name int8ArrayReduceRightPart04Test038
     * @tc.desc Verify reduceRight 2-arg overload number initialValue is value semantics: rebinding p doesn't affect init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let init: number = 100;
      let r = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      }, init);
      expect(init).assertEqual(100);
      expect(r).assertEqual(106);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_3900
     * @tc.name int8ArrayReduceRightPart04Test039
     * @tc.desc Verify reduceRight one arg accumulator not truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([100, 100]);
      let r = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(r).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_4000
     * @tc.name int8ArrayReduceRightPart04Test040
     * @tc.desc Verify reduceRight dual arg accumulator not truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([100, 100]);
      let r = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      }, 0);
      expect(r).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_4100
     * @tc.name int8ArrayReduceRightPart04Test041
     * @tc.desc Verify reduceRight 2-arg overload initialValue exceeds int8 range(1000): result = 1006
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      }, 1000);
      expect(r).assertEqual(1006);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_4200
     * @tc.name int8ArrayReduceRightPart04Test042
     * @tc.desc Verify reduceRight 1-arg overload no init: first previousValue must be int8 last element (in -128~127)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([50, 60, INT8_MAX]);
      let firstPrev: number = 0;
      let seen: boolean = false;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        if (!seen) {
          firstPrev = p;
          seen = true;
        }
        return p + c;
      });
      let expectedVal1: number = 237;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstPrev).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_4300
     * @tc.name int8ArrayReduceRightPart04Test043
     * @tc.desc Verify reduceRight accumulator versus subscript truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([100, 100]);
      arr[0] = 200;
      let actual1: number = arr[0];
      let expected1: int = -56;
      expect(actual1).assertEqual(expected1);
      let arr2: Int8Array = new Int8Array([100, 100]);
      let sum = arr2.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(sum).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_4400
     * @tc.name int8ArrayReduceRightPart04Test044
     * @tc.desc Verify reduceRight empty array cross-overload divergence: 1-arg throws TypeError vs 2-arg(init=5) returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      let r2 = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      }, 5);
      expect(r2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_4500
     * @tc.name int8ArrayReduceRightPart04Test045
     * @tc.desc Verify reduceRight single-element cross-overload divergence: 1-arg returns element(0 callbacks) vs 2-arg cb(init,elem)(1 cb)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let called1: int = 0;
      let r1 = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        called1 = called1 + 1;
        return p + c;
      });
      expect(r1).assertEqual(42);
      expect(called1).assertEqual(0);
      let called2: int = 0;
      let r2 = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        called2 = called2 + 1;
        return p + c;
      }, 100);
      expect(r2).assertEqual(142);
      expect(called2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_4600
     * @tc.name int8ArrayReduceRightPart04Test046
     * @tc.desc Verify reduceRight single-element 1-arg: return value strictly equals arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let r = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(r).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_4700
     * @tc.name int8ArrayReduceRightPart04Test047
     * @tc.desc Verify reduceRight single-element 2-arg: return value = callback(initialValue, arr[0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let r = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p * c;
      }, 2);
      expect(r).assertEqual(84);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_4800
     * @tc.name int8ArrayReduceRightPart04Test048
     * @tc.desc Verify reduceRight on empty array with 2-arg and initialValue="empty" returns "empty" with 0 callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let called: int = 0;
      let r = arr.reduceRight<string>((p: string, c: number, i: int, a: Int8Array): string => {
        called = called + 1;
        return p;
      }, 'empty');
      expect(r).assertEqual('empty');
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_4900
     * @tc.name int8ArrayReduceRightPart04Test049
     * @tc.desc Verify reduceRight dual arg array parameter length four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let arrLen: number = 0;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        arrLen = a.length;
        return p + c;
      }, 0);
      expect(arrLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_5000
     * @tc.name int8ArrayReduceRightPart04Test050
     * @tc.desc Verify reduceRight string previous length four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let firstPLen: number = 0;
      let seen: boolean = false;
      arr.reduceRight<string>((p: string, c: number, i: int, a: Int8Array): string => {
        if (!seen) {
          firstPLen = p.length;
          seen = true;
        }
        return p + c.toString();
      }, 'init');
      expect(firstPLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_5100
     * @tc.name int8ArrayReduceRightPart04Test051
     * @tc.desc Verify reduceRight one arg current supports toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let firstCurStr: string = '';
      let seen: boolean = false;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        if (!seen) {
          firstCurStr = c.toFixed(0);
          seen = true;
        }
        return p + c;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstCurStr).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_5200
     * @tc.name int8ArrayReduceRightPart04Test052
     * @tc.desc Verify reduceRight dual arg current supports toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let firstCurStr: string = '';
      let seen: boolean = false;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (!seen) {
          firstCurStr = c.toFixed(0);
          seen = true;
        }
        return p + c;
      }, 0);
      expect(firstCurStr).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_5300
     * @tc.name int8ArrayReduceRightPart04Test053
     * @tc.desc Verify reduceRight callback index stays valid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let minIdx: number = 99;
      let maxIdx: number = -1;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (i < minIdx) {
          minIdx = i;
        }
        if (i > maxIdx) {
          maxIdx = i;
        }
        return p + c;
      }, 0);
      expect(minIdx).assertEqual(0);
      expect(maxIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_5400
     * @tc.name int8ArrayReduceRightPart04Test054
     * @tc.desc Verify reduceRight 1-arg overload callback modify unread element: affects subsequent currentValue (live read)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let sum = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 2) {
          a[0] = 99;
        }
        return p + c;
      });
      expect(sum).assertEqual(108);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_5500
     * @tc.name int8ArrayReduceRightPart04Test055
     * @tc.desc Verify reduceRight 2-arg overload callback modify unread element: affects subsequent currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let sum = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 3) {
          a[0] = 99;
        }
        return p + c;
      }, 0);
      expect(sum).assertEqual(108);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_5600
     * @tc.name int8ArrayReduceRightPart04Test056
     * @tc.desc Verify reduceRight 1-arg overload callback modify already-read element: doesn't affect prev (already snapshotted)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let sum = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 2) {
          a[3] = 99;
        }
        return p + c;
      });
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_5700
     * @tc.name int8ArrayReduceRightPart04Test057
     * @tc.desc Verify reduceRight 2-arg overload callback modify already-read element: doesn't affect prev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let sum = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 3) {
          a[3] = 99;
        }
        return p + c;
      }, 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_5800
     * @tc.name int8ArrayReduceRightPart04Test058
     * @tc.desc Verify reduceRight 1-arg result used as 2-arg initialValue (cross-overload chaining)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int8Array = new Int8Array([1, 2, 3]);
      let r1 = arr1.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      let arr2: Int8Array = new Int8Array([10, 20]);
      let r2 = arr2.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      }, r1);
      expect(r2).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_5900
     * @tc.name int8ArrayReduceRightPart04Test059
     * @tc.desc Verify reduceRight negative initial offsets result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let r1 = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      let r2 = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      }, -50);
      expect(r2).assertEqual(r1 + -50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_6000
     * @tc.name int8ArrayReduceRightPart04Test060
     * @tc.desc Verify reduceRight 2-arg overload callback returns constant: both overloads result = constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1 = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return 5;
      });
      let r2 = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return 5;
      }, 0);
      expect(r1).assertEqual(5);
      expect(r2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_6100
     * @tc.name int8ArrayReduceRightPart04Test061
     * @tc.desc Verify reduceRight one arg no initial sums elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 10, 15]);
      let r = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_6200
     * @tc.name int8ArrayReduceRightPart04Test062
     * @tc.desc Verify reduceRight int8 max element [127] cross-overload: 1-arg returns 127(0 cb); 2-arg init=0 returns 127(1 cb)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let called1: int = 0;
      let r1 = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        called1 = called1 + 1;
        return p + c;
      });
      expect(r1).assertEqual(INT8_MAX);
      expect(called1).assertEqual(0);
      let called2: int = 0;
      let r2 = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        called2 = called2 + 1;
        return p + c;
      }, 0);
      expect(r2).assertEqual(INT8_MAX);
      expect(called2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_6300
     * @tc.name int8ArrayReduceRightPart04Test063
     * @tc.desc Verify reduceRight int8 min element [-128] cross-overload: 1-arg returns -128; 2-arg init=0 returns -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      let called1: int = 0;
      let r1 = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        called1 = called1 + 1;
        return p + c;
      });
      expect(r1).assertEqual(INT8_MIN);
      expect(called1).assertEqual(0);
      let called2: int = 0;
      let r2 = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        called2 = called2 + 1;
        return p + c;
      }, 0);
      expect(r2).assertEqual(INT8_MIN);
      expect(called2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART04_6400
     * @tc.name int8ArrayReduceRightPart04Test064
     * @tc.desc Verify reduceRight int8 extreme mix [127,-128] sum cross-overload equivalence: both = -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN]);
      let r1 = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      let r2 = arr.reduceRight<number>((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      }, 0);
      expect(r1).assertEqual(-1);
      expect(r2).assertEqual(-1);
    });
  });
}
