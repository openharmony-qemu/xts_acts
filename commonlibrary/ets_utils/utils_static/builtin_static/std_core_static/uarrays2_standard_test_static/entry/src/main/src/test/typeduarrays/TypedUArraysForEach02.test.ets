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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysForEach02(): void {
  describe('TypedUArraysForEach02', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_4200
     * @tc.name testTypedUArraysForEach042
     * @tc.desc Verify 4294967295 forEach Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0]);
      let maxVal: number = 0;
      arr.forEach((v) => {
        if (v > maxVal) maxVal = v;
      });
      expect(maxVal).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_4300
     * @tc.name testTypedUArraysForEach043
     * @tc.desc Verify Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([300, 400, 500]);
      let all255 = true;
      arr.forEach((v) => {
        if (v !== 255) all255 = false;
      });
      expect(all255).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_4400
     * @tc.name testTypedUArraysForEach044
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 0n, 1n]);
      let found = false;
      arr.forEach((v) => {
        if (v === 100n) {
          found = true;
        }
      });
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_4500
     * @tc.name testTypedUArraysForEach045
     * @tc.desc Verify BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let sum = 0n;
      arr.forEach((v) => {
        sum += v;
      });
      expect(sum).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_4600
     * @tc.name testTypedUArraysForEach046
     * @tc.desc Verify BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let allBigInt = true;
      arr.forEach((v) => {
        if (typeof v !== 'bigint') allBigInt = false;
      });
      expect(allBigInt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_4700
     * @tc.name testTypedUArraysForEach047
     * @tc.desc Verify forEach Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let val: number = 0;
      arr.forEach((v) => {
        val = v;
      });
      expect(val).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_4800
     * @tc.name testTypedUArraysForEach048
     * @tc.desc Verify forEach Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      let count = 0;
      arr.forEach((v) => {
        if (v >= 0) {
          count++;
        }
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_4900
     * @tc.name testTypedUArraysForEach049
     * @tc.desc Verify thisArg callbackfn Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const values: number[] = [];
      arr.forEach((v) => {
        values.push(v * 2);
      });
      expect(values[0]).assertEqual(2);
      expect(values[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_5000
     * @tc.name testTypedUArraysForEach050
     * @tc.desc Verify thisArg Double callbackfn this Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let thisType = '';
      arr.forEach((v) => {
        thisType = typeof v;
      });
      expect(thisType).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_5100
     * @tc.name testTypedUArraysForEach051
     * @tc.desc Verify callbackfn Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      let count = 0;
      arr.forEach((v) => {
        if (v >= 0) {
          count++;
        }
      });
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_5200
     * @tc.name testTypedUArraysForEach052
     * @tc.desc Verify forEach Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1000);
      let found = false;
      arr.forEach((v) => {
        if (v !== 0) found = true;
      });
      expect(found).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_5300
     * @tc.name testTypedUArraysForEach053
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 3, 3]);
      let count = 0;
      arr.forEach((v) => {
        if (v >= 0) {
          count++;
        }
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_5400
     * @tc.name testTypedUArraysForEach054
     * @tc.desc Verify callbackfn Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([5, 10, 15]);
      let total: number = 0;
      arr.forEach((v) => {
        total += v * 2;
      });
      expect(total).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_5500
     * @tc.name testTypedUArraysForEach055
     * @tc.desc Verify Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, -2, -3]);
      arr.forEach((v) => {
        expect(v).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_5600
     * @tc.name testTypedUArraysForEach056
     * @tc.desc Verify callbackfn forEach Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      try {
        arr.forEach((v) => {
          if (v >= 0) {
            throw new TypeError('error in callback');
          }
        });
        expect(true).assertFail();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_5700
     * @tc.name testTypedUArraysForEach057
     * @tc.desc Verify callbackfn forEach Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      try {
        arr.forEach((v) => {
          if (v === 2) throw new RangeError('range');
        });
        expect(true).assertFail();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_5800
     * @tc.name testTypedUArraysForEach058
     * @tc.desc Verify callbackfn forEach BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      try {
        arr.forEach((v) => {
          if (v === 2n) throw new TypeError('type');
        });
        expect(true).assertFail();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_5900
     * @tc.name testTypedUArraysForEach059
     * @tc.desc Verify callbackfn forEach Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.forEach((v) => {
          if (v === 2) throw new SyntaxError('syntax');
        });
        expect(true).assertFail();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_6000
     * @tc.name testTypedUArraysForEach060
     * @tc.desc Verify callbackfn void forEach Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let count = 0;
      arr.forEach((v) => {
        if (v >= 0) {
          count++;
        }
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_6100
     * @tc.name testTypedUArraysForEach061
     * @tc.desc Verify 0 TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.forEach((v) => {
          if (v >= 0) {
            throw new TypeError('not a function');
          }
        });
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_6200
     * @tc.name testTypedUArraysForEach062
     * @tc.desc Verify Uint8ClampedArray 255 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([300, 400, 500]);
      arr.forEach((v) => {
        expect(v).assertEqual(255);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_6300
     * @tc.name testTypedUArraysForEach063
     * @tc.desc Verify Uint8ClampedArray 0 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-100, -200]);
      arr.forEach((v) => {
        expect(v).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_6400
     * @tc.name testTypedUArraysForEach064
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-50, 128, 300]);
      const expected = [0, 128, 255];
      let idx = 0;
      arr.forEach((v) => {
        expect(v).assertEqual(expected[idx]);
        idx++;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_6500
     * @tc.name testTypedUArraysForEach065
     * @tc.desc Verify Uint8Array 256 0 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([256, 257]);
      arr.forEach((v) => {
        expect(v === 0 || v === 1).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_6600
     * @tc.name testTypedUArraysForEach066
     * @tc.desc Verify Uint16Array 65536 0 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65536, 65537]);
      arr.forEach((v) => {
        expect(v === 0 || v === 1).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_6700
     * @tc.name testTypedUArraysForEach067
     * @tc.desc Verify Uint32Array 4294967296 0 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967296]);
      arr.forEach((v) => {
        expect(v).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_6800
     * @tc.name testTypedUArraysForEach068
     * @tc.desc Verify BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n]);
      arr.forEach((v) => {
        expect(v).assertEqual(100n);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_6900
     * @tc.name testTypedUArraysForEach069
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255.9, 256.1, -0.5]);
      arr.forEach((v) => {
        expect(v === 255 || v === 0).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_7000
     * @tc.name testTypedUArraysForEach070
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3.9, 2.1]);
      const expected = [3, 2];
      let idx = 0;
      arr.forEach((v) => {
        expect(v).assertEqual(expected[idx]);
        idx++;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_7100
     * @tc.name testTypedUArraysForEach071
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([99.9, 100.1]);
      const expected = [99, 100];
      let idx = 0;
      arr.forEach((v) => {
        expect(v).assertEqual(expected[idx]);
        idx++;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_7200
     * @tc.name testTypedUArraysForEach072
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000000.9, 2000000.1]);
      arr.forEach((v) => {
        expect(Number.isInteger(v)).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_7300
     * @tc.name testTypedUArraysForEach073
     * @tc.desc Verify BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // BigUint64ArrayDoesNotAcceptFloatDemo
      const arr = new BigUint64Array([1n, 2n, 3n]);
      arr.forEach((v) => {
        expect(typeof v === 'bigint').assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_7400
     * @tc.name testTypedUArraysForEach074
     * @tc.desc Verify subarray forEach Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const full = new Uint8Array([1, 2, 3, 4, 5]);
      const view = full.subarray(1, 4);
      const collected: number[] = [];
      view.forEach((v) => { collected.push(v); });
      expect(collected.length).assertEqual(3);
      const val15 = collected[0];
      expect(val15).assertEqual(2);
      const val16 = collected[2];
      expect(val16).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_7500
     * @tc.name testTypedUArraysForEach075
     * @tc.desc Verify BigUint64Array forEach 32 BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([4294967296n, 4294967297n]);
      let sum = 0n;
      arr.forEach((v) => {
        sum += v;
      });
      expect(sum).assertEqual(8589934593n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_7600

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_7700
     * @tc.name testTypedUArraysForEach077
     * @tc.desc Verify forEach thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let sum: number = 0;
      arr.forEach((v) => {
        sum += v;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_7800
     * @tc.name testTypedUArraysForEach078
     * @tc.desc Verify Uint8ClampedArray forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-50, 0, 128, 200, 300]);
      let min: number = 255;
      let max: number = 0;
      arr.forEach((v) => {
        if (v < min) min = v;
        if (v > max) max = v;
      });
      expect(min).assertEqual(0);
      expect(max).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_7900
     * @tc.name testTypedUArraysForEach079
     * @tc.desc Verify BigUint64Array forEach typeof BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 100n, BigInt('18446744073709551615')]);
      arr.forEach((v) => {
        expect(typeof v === 'bigint').assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_8000
     * @tc.name testTypedUArraysForEach080
     * @tc.desc Verify 10000 forEach Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(10000);
      let found = false;
      arr.forEach((v) => {
        if (v !== 0) found = true;
      });
      expect(found).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_8100
     * @tc.name testTypedUArraysForEach081
     * @tc.desc Verify forEach value Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 65535]);
      const values: number[] = [];
      arr.forEach((v) => { values.push(v); });
      const val17 = values[0];
      expect(val17).assertEqual(0);
      const val18 = values[1];
      expect(val18).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_8200
     * @tc.name testTypedUArraysForEach082
     * @tc.desc Verify forEach value Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 4294967295]);
      const values: number[] = [];
      arr.forEach((v) => { values.push(v); });
      const val19 = values[0];
      expect(val19).assertEqual(0);
      const val20 = values[1];
      expect(val20).assertEqual(4294967295);
    });

  });
}
