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

class CustomError001 extends Error {
  constructor(msg: string) {
    super(msg);
  }
}

function reducerSum004(p: number, c: number, i: int, a: Int8Array): number {
  return p + c;
}

function fn073(p: number, c: number, i: int, a: Int8Array): number {
  return p + c;
}

export default function int8ArrayReduceRightPart02Test(): void {
  describe('Int8ArrayReduceRightPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_0100
     * @tc.name int8ArrayReduceRightPart02Test001
     * @tc.desc Verify reduceRight arity=1 (callbackfn only), sum three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_0300
     * @tc.name int8ArrayReduceRightPart02Test003
     * @tc.desc Verify reduceRight arrow function inline product callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 3, 4]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p * c;
      });
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_0400
     * @tc.name int8ArrayReduceRightPart02Test004
     * @tc.desc Verify reduceRight named function reference sums to sixty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result = arr.reduceRight(reducerSum004);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_0500
     * @tc.name int8ArrayReduceRightPart02Test005
     * @tc.desc Verify reduceRight closure capturing external variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: number = 100;
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c + base;
      });
      expect(result).assertEqual(206);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_0600
     * @tc.name int8ArrayReduceRightPart02Test006
     * @tc.desc Verify reduceRight max accumulation via Math max returns fifty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([30, 10, 50, 20]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return Math.max(p, c);
      });
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_0700
     * @tc.name int8ArrayReduceRightPart02Test007
     * @tc.desc Verify reduceRight min accumulation via Math min returns ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([30, 10, 50, 20]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return Math.min(p, c);
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_0800
     * @tc.name int8ArrayReduceRightPart02Test008
     * @tc.desc Verify subtraction non-commutative, right-to-left order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([100, 10, 1]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p - c;
      });
      expect(result).assertEqual(-109);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_0900
     * @tc.name int8ArrayReduceRightPart02Test009
     * @tc.desc Verify reduceRight count accumulation adds one per iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 10, 15, 20]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + 1;
      });
      expect(result).assertEqual(23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_1000
     * @tc.name int8ArrayReduceRightPart02Test010
     * @tc.desc Verify reduceRight sum of squares returns eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c * c;
      });
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_1100
     * @tc.name int8ArrayReduceRightPart02Test011
     * @tc.desc Verify digit concatenation prev*10+cur, right-to-left construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p * 10 + c;
      });
      expect(result).assertEqual(321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_1200
     * @tc.name int8ArrayReduceRightPart02Test012
     * @tc.desc Verify reduceRight callback constant one hundred twenty seven propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return 127;
      });
      expect(result).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_1300
     * @tc.name int8ArrayReduceRightPart02Test013
     * @tc.desc Verify reduceRight callback constant negative one hundred twenty eight propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return -128;
      });
      expect(result).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_1400
     * @tc.name int8ArrayReduceRightPart02Test014
     * @tc.desc Verify reduceRight callback constant zero propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_1500
     * @tc.name int8ArrayReduceRightPart02Test015
     * @tc.desc Verify reduceRight callback NaN return propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return Number.NaN;
      });
      let resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_1600
     * @tc.name int8ArrayReduceRightPart02Test016
     * @tc.desc Verify reduceRight callback positive infinity propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return Number.POSITIVE_INFINITY;
      });
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_1700
     * @tc.name int8ArrayReduceRightPart02Test017
     * @tc.desc Verify reduceRight callback negative infinity propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return Number.NEGATIVE_INFINITY;
      });
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_1800
     * @tc.name int8ArrayReduceRightPart02Test018
     * @tc.desc Verify reduceRight callback float 1.5 propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return 1.5;
      });
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_1900
     * @tc.name int8ArrayReduceRightPart02Test019
     * @tc.desc Verify reduceRight callback one thousand not truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return 1000;
      });
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_2000
     * @tc.name int8ArrayReduceRightPart02Test020
     * @tc.desc Verify reduceRight callback negative one thousand not truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return -1000;
      });
      expect(result).assertEqual(-1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_2100
     * @tc.name int8ArrayReduceRightPart02Test021
     * @tc.desc Verify reduceRight previousValue first equals last element, no initialValue semantic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let firstPrev: number = 0;
      let captured: boolean = false;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        if (!captured) {
          firstPrev = p;
          captured = true;
        }
        return p + c;
      });
      let expectedVal1: number = 60;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstPrev).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_2200
     * @tc.name int8ArrayReduceRightPart02Test022
     * @tc.desc Verify reduceRight second iteration previous equals first return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let step: int = 0;
      let ret1: number = 0;
      let prev2: number = 0;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        step = step + 1;
        let r = p + c;
        if (step === 1) {
          ret1 = r;
        }
        if (step === 2) {
          prev2 = p;
        }
        return r;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(prev2).assertEqual(ret1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_2300
     * @tc.name int8ArrayReduceRightPart02Test023
     * @tc.desc Verify reduceRight previous chain builds three five sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let prevChain: string = '';
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        prevChain = prevChain + p.toString() + ',';
        return p + c;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(prevChain).assertEqual('3,5,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_2400
     * @tc.name int8ArrayReduceRightPart02Test024
     * @tc.desc Verify reduceRight currentValue sequence right-to-left, second-to-last to first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let curSeq: string = '';
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        curSeq = curSeq + c.toString() + ',';
        return p + c;
      });
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(curSeq).assertEqual('30,20,10,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_2500
     * @tc.name int8ArrayReduceRightPart02Test025
     * @tc.desc Verify reduceRight last element NOT as currentValue, consumed as initial prev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let lastAsCur: int = 0;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        if (c === 30) {
          lastAsCur = lastAsCur + 1;
        }
        return p + c;
      });
      let expectedVal1: number = 60;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(lastAsCur).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_2600
     * @tc.name int8ArrayReduceRightPart02Test026
     * @tc.desc Verify reduceRight currentValue shows truncated two hundred
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(3);
      arr[0] = 200;
      arr[1] = 0;
      arr[2] = 1;
      let seen: number = 0;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        seen = c;
        return p + c;
      });
      let expectedVal1: number = -55;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(seen).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_2700
     * @tc.name int8ArrayReduceRightPart02Test027
     * @tc.desc Verify reduceRight first callback index length minus two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let firstIdx: int = 0;
      let captured: boolean = false;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        if (!captured) {
          firstIdx = i;
          captured = true;
        }
        return p + c;
      });
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_2800
     * @tc.name int8ArrayReduceRightPart02Test028
     * @tc.desc Verify reduceRight currentIndex last is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let lastIdx: int = 0;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        lastIdx = i;
        return p + c;
      });
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(lastIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_2900
     * @tc.name int8ArrayReduceRightPart02Test029
     * @tc.desc Verify reduceRight currentIndex corresponds to currentValue position a[idx]===cur
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let mismatches: int = 0;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        if (a[i] !== c) {
          mismatches = mismatches + 1;
        }
        return p + c;
      });
      let expectedVal1: number = 100;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(mismatches).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_3000
     * @tc.name int8ArrayReduceRightPart02Test030
     * @tc.desc Verify reduceRight array reference equals original via ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let matchCount: int = 0;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        if (a === arr) {
          matchCount = matchCount + 1;
        }
        return p + c;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(matchCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_3100
     * @tc.name int8ArrayReduceRightPart02Test031
     * @tc.desc Verify reduceRight array parameter length equals four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let len: int = 0;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        len = a.length;
        return p + c;
      });
      let expectedVal1: number = 10;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(len).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_3200
     * @tc.name int8ArrayReduceRightPart02Test032
     * @tc.desc Verify reduceRight array parameter is Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let isInt8: int = 0;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        if (a.BYTES_PER_ELEMENT === 1) {
          isInt8 = isInt8 + 1;
        }
        return p + c;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(isInt8).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_3300
     * @tc.name int8ArrayReduceRightPart02Test033
     * @tc.desc Verify reduceRight reading other elements via array parameter in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 10, 15, 20]);
      let firstElem: number = 0;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        firstElem = a[0];
        return p + c;
      });
      let expectedVal1: number = 50;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(firstElem).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_3400
     * @tc.name int8ArrayReduceRightPart02Test034
     * @tc.desc Verify reduceRight three element callback called twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let calls: int = 0;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        calls = calls + 1;
        return p + c;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_3500
     * @tc.name int8ArrayReduceRightPart02Test035
     * @tc.desc Verify reduceRight two element callback called once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let calls: int = 0;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        calls = calls + 1;
        return p + c;
      });
      let expectedVal1: number = 3;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_3600
     * @tc.name int8ArrayReduceRightPart02Test036
     * @tc.desc Verify reduceRight always-return-prev, result equals last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p;
      });
      expect(result).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_3700
     * @tc.name int8ArrayReduceRightPart02Test037
     * @tc.desc Verify reduceRight always-return-cur, result equals first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33, 44]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return c;
      });
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_3800
     * @tc.name int8ArrayReduceRightPart02Test038
     * @tc.desc Verify reduceRight callback reads external multiplier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let multiplier: number = 3;
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c * multiplier;
      });
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_3900
     * @tc.name int8ArrayReduceRightPart02Test039
     * @tc.desc Verify reduceRight callback modifies external variable, side effect write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: number = 0;
      let arr = new Int8Array([5, 10, 15]);
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        collected = collected + c;
        return p + c;
      });
      let expectedVal1: number = 30;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(collected).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_4000
     * @tc.name int8ArrayReduceRightPart02Test040
     * @tc.desc Verify reduceRight callback accumulates array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let lenSum: int = 0;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        lenSum = lenSum + a.length;
        return p + c;
      });
      let expectedVal1: number = 10;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(lenSum).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_4100
     * @tc.name int8ArrayReduceRightPart02Test041
     * @tc.desc Verify reduceRight no initial consumes last element as previous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 4, 6]);
      let calls: int = 0;
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        calls = calls + 1;
        return p + c;
      });
      expect(result).assertEqual(12);
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_4200
     * @tc.name int8ArrayReduceRightPart02Test042
     * @tc.desc Verify modifying original array after reduceRight does not affect result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      arr[0] = 99;
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_4300
     * @tc.name int8ArrayReduceRightPart02Test043
     * @tc.desc Verify reduceRight single-element array result equals element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([99]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_4400
     * @tc.name int8ArrayReduceRightPart02Test044
     * @tc.desc Verify reduceRight does not modify original array, toString unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualStr: string = arr.toString();
      let expectedStr: string = '1,2,3';
      expect(actualStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_4500
     * @tc.name int8ArrayReduceRightPart02Test045
     * @tc.desc Verify reduceRight result participates in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      let doubled: number = result * 2;
      let expected: int = 60;
      expect(doubled).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_4600
     * @tc.name int8ArrayReduceRightPart02Test046
     * @tc.desc Verify non-commutative reduceRight vs reduce, order verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let rr = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p - c;
      });
      let r = arr.reduce((p: number, c: number, i: int, a: Int8Array) => {
        return p - c;
      });
      expect(rr).assertEqual(0);
      expect(r).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_4700
     * @tc.name int8ArrayReduceRightPart02Test047
     * @tc.desc Verify reduceRight empty array without initial throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty = new Int8Array(0);
      try {
        empty.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_4800
     * @tc.name int8ArrayReduceRightPart02Test048
     * @tc.desc Verify reduceRight propagates callback Error message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
          throw new Error('first-call');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('first-call');
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_4900
     * @tc.name int8ArrayReduceRightPart02Test049
     * @tc.desc Verify reduceRight propagates callback RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
          throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_5000
     * @tc.name int8ArrayReduceRightPart02Test050
     * @tc.desc Verify reduceRight propagates callback TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
          throw new TypeError('type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_5100
     * @tc.name int8ArrayReduceRightPart02Test051
     * @tc.desc Verify reduceRight propagates custom error subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
          throw new CustomError001('custom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('custom');
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_5200
     * @tc.name int8ArrayReduceRightPart02Test052
     * @tc.desc Verify reduceRight propagates Error with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
          throw new Error('my-message-123');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('my-message-123');
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_5300
     * @tc.name int8ArrayReduceRightPart02Test053
     * @tc.desc Verify reduceRight side effects before throw are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let acc: number = 0;
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
          acc = acc + c;
          if (acc > 5) {
            throw new Error('overflow');
          }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(acc).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_5400
     * @tc.name int8ArrayReduceRightPart02Test054
     * @tc.desc Verify reduceRight truncated one hundred twenty eight element sums
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([128, 1]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(result).assertEqual(-127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_5500
     * @tc.name int8ArrayReduceRightPart02Test055
     * @tc.desc Verify reduceRight truncated two hundred fifty five element sums
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([255, 1]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_5600
     * @tc.name int8ArrayReduceRightPart02Test056
     * @tc.desc Verify reduceRight all-zero array sum returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, 0]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_5700
     * @tc.name int8ArrayReduceRightPart02Test057
     * @tc.desc Verify reduceRight all max elements sum 381
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(result).assertEqual(381);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_5800
     * @tc.name int8ArrayReduceRightPart02Test058
     * @tc.desc Verify reduceRight all min elements sum -384
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN, INT8_MIN, INT8_MIN]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(result).assertEqual(-384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_5900
     * @tc.name int8ArrayReduceRightPart02Test059
     * @tc.desc Verify reduceRight mixed signs sum to negative twenty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, -20, 30, -40]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(result).assertEqual(-20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_6000
     * @tc.name int8ArrayReduceRightPart02Test060
     * @tc.desc Verify subarray view reduceRight only accumulates view range elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3, 4, 5]);
      let view = base.subarray(1, 4);
      let result = view.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_6100
     * @tc.name int8ArrayReduceRightPart02Test061
     * @tc.desc Verify slice copy reduceRight accumulates copy elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30, 40]);
      let copy = base.slice(1, 3);
      let result = copy.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_6200
     * @tc.name int8ArrayReduceRightPart02Test062
     * @tc.desc Verify nested reduceRight call within callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer = new Int8Array([1, 2, 3]);
      let inner = new Int8Array([10, 20]);
      let result = outer.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        let innerSum = inner.reduceRight((ip: number, ic: number, ii: int, ia: Int8Array) => {
          return ip + ic;
        });
        return p + c + innerSum;
      });
      expect(result).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_6300
     * @tc.name int8ArrayReduceRightPart02Test063
     * @tc.desc Verify reduceRight result as new Int8Array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let sum = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      let derived = new Int8Array([sum]);
      let derivedVal: number = derived[0];
      let expected: int = 60;
      expect(derivedVal).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_6400
     * @tc.name int8ArrayReduceRightPart02Test064
     * @tc.desc Verify reduceRight two element subtraction yields negative thirty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([50, 20]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p - c;
      });
      expect(result).assertEqual(-30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_6500
     * @tc.name int8ArrayReduceRightPart02Test065
     * @tc.desc Verify reduceRight boundary element mixed sum [-128, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN, INT8_MAX]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_6600
     * @tc.name int8ArrayReduceRightPart02Test066
     * @tc.desc Verify reduceRight boundary element subtraction [127, -128], last is initial prev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MIN]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p - c;
      });
      expect(result).assertEqual(-255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_6700
     * @tc.name int8ArrayReduceRightPart02Test067
     * @tc.desc Verify reduceRight hundred element array sums to one hundred
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big = new Int8Array(100);
      big.fill(1);
      let result = big.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p + c;
      });
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_6800
     * @tc.name int8ArrayReduceRightPart02Test068
     * @tc.desc Verify reduceRight callback set modifies source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        a[2] = 99;
        return p + c;
      });
      let expectedVal1: number = 6;
      expect(resultVal1).assertEqual(expectedVal1);
      let modifiedVal: number = arr[2];
      let expected: int = 99;
      expect(modifiedVal).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_6900
     * @tc.name int8ArrayReduceRightPart02Test069
     * @tc.desc Verify same array same callback multiple reduceRight results consistent, determinism
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let r1 = arr.reduceRight(fn073);
      let r2 = arr.reduceRight(fn073);
      expect(r1).assertEqual(10);
      expect(r2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_7000
     * @tc.name int8ArrayReduceRightPart02Test070
     * @tc.desc Verify reduceRight product with negative element yields negative six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, 2, 3]);
      let result = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        return p * c;
      });
      expect(result).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCERIGHT_PART02_7100
     * @tc.name int8ArrayReduceRightPart02Test071
     * @tc.desc Verify reduceRight two-element boundary comprehensive, prev is last element, cur is first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReduceRightPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7, 9]);
      let seenPrev: number = 0;
      let seenCur: number = 0;
      let resultVal1: number = arr.reduceRight((p: number, c: number, i: int, a: Int8Array) => {
        seenPrev = p;
        seenCur = c;
        return p + c;
      });
      let expectedVal1: number = 16;
      expect(resultVal1).assertEqual(expectedVal1);
      expect(seenPrev).assertEqual(9);
      expect(seenCur).assertEqual(7);
    });
  });
}
