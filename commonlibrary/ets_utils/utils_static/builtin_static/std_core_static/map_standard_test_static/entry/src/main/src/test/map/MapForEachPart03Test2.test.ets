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
  TestType
} from '../../../../hypium/index';
import Utils from "../Util.test";
class KeyObj {
}
class AccStats {
  sum: double;
  count: double;
  constructor(sum: double, count: double) {
    this.sum = sum;
    this.count = count;
  }
}
class Payload {
  code: int = 0;
  constructor(code: int) {
    this.code = code;
  }
}
const LONG_MAX: long = 9223372036854775807;
const LONG_MIN: long = -9223372036854775807 - 1;
const POS_INF: double = Number.POSITIVE_INFINITY;
const NEG_INF: double = -Number.POSITIVE_INFINITY;
const FLOAT_NAN: float = Double.toFloat(Number.NaN);
const FLOAT_POS_INF: float = Double.toFloat(Number.POSITIVE_INFINITY);
const FLOAT_NEG_INF: float = -Double.toFloat(Number.POSITIVE_INFINITY);
const INT_MAX: int = 2147483647;
const INT_MIN: int = -2147483647 - 1;

export default function MapForEachPart03Test(): void {
  describe('MapForEachPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_0100
     * @tc.name mapForEachPart03Test001
     * @tc.desc Verify forEach passes the byte.MAX key 127 to its callback and the captured key equals 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<byte, int> = new Map<byte, int>();
      map.set(127 as byte, 10);
      map.set(0 as byte, 20);
      let boundaryKey: byte = 0 as byte;
      map.forEach((value: int, key: byte, m: Map<byte, int>): void => {
        if (key === 127 as byte) { boundaryKey = key; }
      });
      expect(boundaryKey).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_0200
     * @tc.name mapForEachPart03Test002
     * @tc.desc Verify forEach passes the byte.MIN key -128 to its callback and the captured key equals -128
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<byte, int> = new Map<byte, int>();
      map.set(-128 as byte, 10);
      map.set(0 as byte, 20);
      let boundaryKey: byte = 0 as byte;
      map.forEach((value: int, key: byte, m: Map<byte, int>): void => {
        if (key === -128 as byte) { boundaryKey = key; }
      });
      expect(boundaryKey).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_0300
     * @tc.name mapForEachPart03Test003
     * @tc.desc Verify forEach passes the short.MAX key 32767 to its callback and the captured key equals 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<short, int> = new Map<short, int>();
      map.set(32767 as short, 100);
      map.set(0 as short, 200);
      let maxSeen: short = 0 as short;
      map.forEach((value: int, key: short, m: Map<short, int>): void => {
        if (key === 32767 as short) { maxSeen = key; }
      });
      expect(maxSeen).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_0400
     * @tc.name mapForEachPart03Test004
     * @tc.desc Verify forEach passes the long.MAX key LONG_MAX to its callback and the callback detects it via key === LONG_MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<long, int> = new Map<long, int>();
      map.set(LONG_MAX, 100);
      map.set(0, 200);
      let maxSeen: boolean = false;
      map.forEach((value: int, key: long, m: Map<long, int>): void => {
        if (key === LONG_MAX) { maxSeen = true; }
      });
      expect(maxSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_0500
     * @tc.name mapForEachPart03Test005
     * @tc.desc Verify forEach passes the long.MIN key LONG_MIN to its callback and the callback detects it via key === LONG_MIN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<long, int> = new Map<long, int>();
      map.set(LONG_MIN, 100);
      map.set(0, 200);
      let minSeen: boolean = false;
      map.forEach((value: int, key: long, m: Map<long, int>): void => {
        if (key === LONG_MIN) { minSeen = true; }
      });
      expect(minSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_0600
     * @tc.name mapForEachPart03Test006
     * @tc.desc Verify forEach passes a NaN float key to its callback and the callback detects it via key !== key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<float, int> = new Map<float, int>();
      map.set(FLOAT_NAN, 1);
      map.set(1.0 as float, 2);
      let nanSeen: boolean = false;
      map.forEach((value: int, key: float, m: Map<float, int>): void => {
        if (key !== key) { nanSeen = true; }
      });
      expect(nanSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_0700
     * @tc.name mapForEachPart03Test007
     * @tc.desc Verify forEach passes the float +Infinity key to its callback and the callback detects it via key === FLOAT_POS_INF
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<float, int> = new Map<float, int>();
      map.set(FLOAT_POS_INF, 1);
      map.set(0.0 as float, 2);
      let infSeen: boolean = false;
      map.forEach((value: int, key: float, m: Map<float, int>): void => {
        if (key === FLOAT_POS_INF) { infSeen = true; }
      });
      expect(infSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_0800
     * @tc.name mapForEachPart03Test008
     * @tc.desc Verify forEach passes the float -Infinity key to its callback and the callback detects it via key === FLOAT_NEG_INF
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<float, int> = new Map<float, int>();
      map.set(FLOAT_NEG_INF, 1);
      map.set(0.0 as float, 2);
      let negInfSeen: boolean = false;
      map.forEach((value: int, key: float, m: Map<float, int>): void => {
        if (key === FLOAT_NEG_INF) { negInfSeen = true; }
      });
      expect(negInfSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_0900
     * @tc.name mapForEachPart03Test009
     * @tc.desc Verify forEach passes the float -0.0 key to its callback and the callback detects it via 1.0 / key === -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<float, int> = new Map<float, int>();
      map.set(-0.0 as float, 1);
      map.set(1.0 as float, 2);
      let negZeroSeen: boolean = false;
      map.forEach((value: int, key: float, m: Map<float, int>): void => {
        if (1.0 / key === NEG_INF) { negZeroSeen = true; }
      });
      expect(negZeroSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_1000
     * @tc.name mapForEachPart03Test010
     * @tc.desc Verify forEach passes a NaN double key to its callback and the callback detects it via key !== key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<double, int> = new Map<double, int>();
      map.set(Number.NaN, 1);
      map.set(1.0, 2);
      let nanSeen: boolean = false;
      map.forEach((value: int, key: double, m: Map<double, int>): void => {
        if (key !== key) { nanSeen = true; }
      });
      expect(nanSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_1100
     * @tc.name mapForEachPart03Test011
     * @tc.desc Verify forEach passes the double +Infinity key to its callback and the callback detects it via key === POS_INF
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<double, int> = new Map<double, int>();
      map.set(POS_INF, 1);
      map.set(0.0, 2);
      let infSeen: boolean = false;
      map.forEach((value: int, key: double, m: Map<double, int>): void => {
        if (key === POS_INF) { infSeen = true; }
      });
      expect(infSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_1200
     * @tc.name mapForEachPart03Test012
     * @tc.desc Verify forEach passes the double -Infinity key to its callback and the callback detects it via key === NEG_INF
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<double, int> = new Map<double, int>();
      map.set(NEG_INF, 1);
      map.set(0.0, 2);
      let negInfSeen: boolean = false;
      map.forEach((value: int, key: double, m: Map<double, int>): void => {
        if (key === NEG_INF) { negInfSeen = true; }
      });
      expect(negInfSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_1300
     * @tc.name mapForEachPart03Test013
     * @tc.desc Verify forEach passes the double -0.0 key to its callback and the callback detects it via 1.0 / key === -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<double, int> = new Map<double, int>();
      map.set(-0.0, 1);
      map.set(1.0, 2);
      let negZeroSeen: boolean = false;
      map.forEach((value: int, key: double, m: Map<double, int>): void => {
        if (1.0 / key === NEG_INF) { negZeroSeen = true; }
      });
      expect(negZeroSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_1400
     * @tc.name mapForEachPart03Test014
     * @tc.desc Verify forEach passes the double key Number.EPSILON to its callback and the callback detects it via key === Number.EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<double, int> = new Map<double, int>();
      map.set(Number.EPSILON, 1);
      map.set(1.0, 2);
      let epsSeen: boolean = false;
      map.forEach((value: int, key: double, m: Map<double, int>): void => {
        if (key === Number.EPSILON) { epsSeen = true; }
      });
      expect(epsSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_1500
     * @tc.name mapForEachPart03Test015
     * @tc.desc Verify forEach passes the double key Number.NEGATIVE_INFINITY to its callback and the callback detects it via key === Number.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<double, int> = new Map<double, int>();
      map.set(Number.NEGATIVE_INFINITY, 1);
      map.set(3.14, 2);
      let negInfSeen: boolean = false;
      map.forEach((value: int, key: double, m: Map<double, int>): void => {
        if (key === Number.NEGATIVE_INFINITY) { negInfSeen = true; }
      });
      expect(negInfSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_1600
     * @tc.name mapForEachPart03Test016
     * @tc.desc Verify forEach does not treat +0.0 as -0.0: with only 0.0 stored, 1.0 / key never equals -Infinity so negZeroSeen stays false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<double, int> = new Map<double, int>();
      map.set(0.0, 1);
      map.set(1.0, 2);
      let negZeroSeen: boolean = false;
      map.forEach((value: int, key: double, m: Map<double, int>): void => {
        if (1.0 / key === NEG_INF) { negZeroSeen = true; }
      });
      expect(negZeroSeen).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_1700
     * @tc.name mapForEachPart03Test017
     * @tc.desc Verify forEach runs twice for a Map<double, int> whose NaN key is set twice and deduplicated into one entry alongside 3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<double, int> = new Map<double, int>();
      map.set(Number.NaN, 1);
      map.set(Number.NaN, 2);
      map.set(3.14, 3);
      let callCount: int = 0;
      map.forEach((value: int, key: double, m: Map<double, int>): void => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_1800
     * @tc.name mapForEachPart03Test018
     * @tc.desc Verify forEach passes the zero-width-space string key to its callback and the callback detects it via key comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('​', 1);
      map.set('normal', 2);
      let zwspSeen: boolean = false;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        if (key === '​') { zwspSeen = true; }
      });
      expect(zwspSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_1900
     * @tc.name mapForEachPart03Test019
     * @tc.desc Verify forEach visits the entry whose 10000-character string key is captured by the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = '';
      for (let i: int = 0; i < 10000; i++) {
        longKey = longKey + 'a';
      }
      let map: Map<string, int> = new Map<string, int>();
      map.set(longKey, 1);
      map.set('short', 2);
      let longSeen: boolean = false;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        if (key === longKey) { longSeen = true; }
      });
      expect(longSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_2000
     * @tc.name mapForEachPart03Test020
     * @tc.desc Verify forEach passes the SQL-injection-style string key to its callback and the callback detects it via key comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('\'; DROP TABLE users; --', 1);
      map.set('normal', 2);
      let sqlSeen: boolean = false;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        if (key === '\'; DROP TABLE users; --') { sqlSeen = true; }
      });
      expect(sqlSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_2100
     * @tc.name mapForEachPart03Test021
     * @tc.desc Verify forEach passes the byte.MAX value 127 to its callback and the captured value equals 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, byte> = new Map<string, byte>();
      map.set('max', 127 as byte);
      map.set('norm', 0 as byte);
      let captured: byte = 0 as byte;
      map.forEach((value: byte, key: string, m: Map<string, byte>): void => {
        if (key === 'max') { captured = value; }
      });
      expect(captured).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_2200
     * @tc.name mapForEachPart03Test022
     * @tc.desc Verify forEach passes the short.MAX value 32767 to its callback and the captured value equals 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, short> = new Map<string, short>();
      map.set('max', 32767 as short);
      map.set('norm', 0 as short);
      let captured: short = 0 as short;
      map.forEach((value: short, key: string, m: Map<string, short>): void => {
        if (key === 'max') { captured = value; }
      });
      expect(captured).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_2300
     * @tc.name mapForEachPart03Test023
     * @tc.desc Verify forEach passes the long.MAX value LONG_MAX to its callback and the captured value equals LONG_MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, long> = new Map<string, long>();
      map.set('max', LONG_MAX);
      map.set('norm', 0);
      let captured: long = 0;
      map.forEach((value: long, key: string, m: Map<string, long>): void => {
        if (key === 'max') { captured = value; }
      });
      expect(captured).assertEqual(LONG_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_2400
     * @tc.name mapForEachPart03Test024
     * @tc.desc Verify forEach passes a NaN float value to its callback and the callback detects it via value !== value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, float> = new Map<string, float>();
      map.set('nan', FLOAT_NAN);
      map.set('norm', 1.0 as float);
      let nanSeen: boolean = false;
      map.forEach((value: float, key: string, m: Map<string, float>): void => {
        if (value !== value) { nanSeen = true; }
      });
      expect(nanSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_2500
     * @tc.name mapForEachPart03Test025
     * @tc.desc Verify forEach passes a NaN double value to its callback and the callback detects it via value !== value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, double> = new Map<string, double>();
      map.set('nan', Number.NaN);
      map.set('norm', 1.0);
      let nanSeen: boolean = false;
      map.forEach((value: double, key: string, m: Map<string, double>): void => {
        if (value !== value) { nanSeen = true; }
      });
      expect(nanSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_2600
     * @tc.name mapForEachPart03Test026
     * @tc.desc Verify forEach passes the double +Infinity value to its callback and the captured value equals Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, double> = new Map<string, double>();
      map.set('inf', POS_INF);
      map.set('norm', 0.0);
      let captured: double = 0.0;
      map.forEach((value: double, key: string, m: Map<string, double>): void => {
        if (key === 'inf') { captured = value; }
      });
      expect(captured).assertEqual(POS_INF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_2700
     * @tc.name mapForEachPart03Test027
     * @tc.desc Verify forEach passes the double value Number.EPSILON to its callback and the captured value equals Number.EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, double> = new Map<string, double>();
      map.set('eps', Number.EPSILON);
      map.set('norm', 1.0);
      let captured: double = 0.0;
      map.forEach((value: double, key: string, m: Map<string, double>): void => {
        if (key === 'eps') { captured = value; }
      });
      expect(captured).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_2800
     * @tc.name mapForEachPart03Test028
     * @tc.desc Verify forEach visits both entries keyed by boolean true and false and is invoked twice
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 10);
      map.set(false, 20);
      let callCount: int = 0;
      map.forEach((value: int, key: boolean, m: Map<boolean, int>): void => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_2900
     * @tc.name mapForEachPart03Test029
     * @tc.desc Verify forEach runs once for an entry whose value is null and the callback detects value === null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, string | null> = new Map<string, string | null>();
      map.set('only', null);
      let callCount: int = 0;
      let valIsNull: boolean = false;
      map.forEach((value: string | null, key: string, m: Map<string, string | null>): void => {
        callCount++;
        if (value === null) { valIsNull = true; }
      });
      expect(callCount).assertEqual(1);
      expect(valIsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_3000
     * @tc.name mapForEachPart03Test030
     * @tc.desc Verify forEach runs once for an entry whose value is undefined and the callback detects value === undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, string | undefined> = new Map<string, string | undefined>();
      map.set('only', undefined);
      let callCount: int = 0;
      let valIsUndef: boolean = false;
      map.forEach((value: string | undefined, key: string, m: Map<string, string | undefined>): void => {
        callCount++;
        if (value === undefined) { valIsUndef = true; }
      });
      expect(callCount).assertEqual(1);
      expect(valIsUndef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_3100
     * @tc.name mapForEachPart03Test031
     * @tc.desc Verify forEach is invoked twice for two distinct Date keys even though both Date instances hold the same time value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1000, 0, 1);
      let d2: Date = new Date(1000, 0, 1);
      let map: Map<Date, int> = new Map<Date, int>();
      map.set(d1, 10);
      map.set(d2, 20);
      let callCount: int = 0;
      map.forEach((value: int, key: Date, m: Map<Date, int>): void => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_3200
     * @tc.name mapForEachPart03Test032
     * @tc.desc Verify forEach runs once per distinct object key instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: KeyObj = new KeyObj();
      let k2: KeyObj = new KeyObj();
      let map: Map<KeyObj, int> = new Map<KeyObj, int>();
      map.set(k1, 100);
      map.set(k2, 200);
      let callCount: int = 0;
      map.forEach((value: int, key: KeyObj, m: Map<KeyObj, int>): void => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_3300
     * @tc.name mapForEachPart03Test033
     * @tc.desc Verify forEach is invoked twice for two distinct RegExp keys even though both patterns are equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: RegExp = new RegExp('abc', 'g');
      let r2: RegExp = new RegExp('abc', 'g');
      let map: Map<RegExp, int> = new Map<RegExp, int>();
      map.set(r1, 10);
      map.set(r2, 20);
      let callCount: int = 0;
      map.forEach((value: int, key: RegExp, m: Map<RegExp, int>): void => {
        callCount++;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_3400
     * @tc.name mapForEachPart03Test034
     * @tc.desc Verify forEach visits the single deduplicated +0.0/-0.0 key as +0.0 and passes the last set value 20
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<double, int> = new Map<double, int>();
      map.set(0.0, 10);
      map.set(-0.0, 20);
      expect(map.size).assertEqual(1);
      let posZeroVal: int = -1;
      let negZeroVal: int = -1;
      map.forEach((value: int, key: double, m: Map<double, int>): void => {
        if (1.0 / key === POS_INF) { posZeroVal = value; }
        if (1.0 / key === NEG_INF) { negZeroVal = value; }
      });
      expect(posZeroVal).assertEqual(20);
      expect(negZeroVal).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_3500
     * @tc.name mapForEachPart03Test035
     * @tc.desc Verify forEach visits the null key of a Map<string | null, int> and the callback detects key === null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string | null, int> = new Map<string | null, int>();
      map.set(null, 10);
      map.set('good', 20);
      let nullKeySeen: boolean = false;
      map.forEach((value: int, key: string | null, m: Map<string | null, int>): void => {
        if (key === null) { nullKeySeen = true; }
      });
      expect(nullKeySeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_3600
     * @tc.name mapForEachPart03Test036
     * @tc.desc Verify forEach runs once for a Map<string | null, int> whose only key is null and the callback receives the value 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string | null, int> = new Map<string | null, int>();
      map.set(null, 100);
      let callCount: int = 0;
      let valNull: int = -1;
      map.forEach((value: int, key: string | null, m: Map<string | null, int>): void => {
        callCount++;
        if (key === null) { valNull = value; }
      });
      expect(callCount).assertEqual(1);
      expect(valNull).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_3700
     * @tc.name mapForEachPart03Test037
     * @tc.desc Verify forEach detects value === null for all three entries whose values are null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, string | null> = new Map<string, string | null>();
      map.set('a', null);
      map.set('b', null);
      map.set('c', null);
      let nullCount: int = 0;
      map.forEach((value: string | null, key: string, m: Map<string, string | null>): void => {
        if (value === null) { nullCount++; }
      });
      expect(nullCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_3800
     * @tc.name mapForEachPart03Test038
     * @tc.desc Verify the map passed as the third argument to the forEach callback returns the matching value for every visited Date key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(2020, 0, 1);
      let d2: Date = new Date(2021, 6, 15);
      let map: Map<Date, int> = new Map<Date, int>();
      map.set(d1, 100);
      map.set(d2, 200);
      let allMatch: boolean = true;
      let callCount: int = 0;
      map.forEach((value: int, key: Date, m: Map<Date, int>): void => {
        callCount = callCount + 1;
        if (m.get(key) !== value) { allMatch = false; }
      });
      expect(callCount).assertEqual(2);
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_3900
     * @tc.name mapForEachPart03Test039
     * @tc.desc Verify return inside callback skips the current entry only
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('skip', 1);
      map.set('process', 2);
      map.set('final', 3);
      let processed: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        if (key === 'skip') { return; }
        processed.push(key);
      });
      expect(processed.length).assertEqual(2);
      expect(processed[0]).assertEqual('process');
      expect(processed[1]).assertEqual('final');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_4000
     * @tc.name mapForEachPart03Test040
     * @tc.desc Verify return inside callback does not stop iteration over remaining entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('early', 5);
      map.set('later', 10);
      let accumulated: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        accumulated = accumulated + value;
        if (key === 'early') { return; }
      });
      expect(accumulated).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_4100
     * @tc.name mapForEachPart03Test041
     * @tc.desc Verify an error thrown in callback halts iteration at the failing entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('pre', 10);
      map.set('fail', 20);
      map.set('post', 30);
      let preData: string[] = [];
      try {
        map.forEach((value: int, key: string, m: Map<string, int>): void => {
          preData.push(key);
          if (key === 'fail') { throw new Error('midpoint failure'); }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(preData.length).assertEqual(2);
      expect(preData[0]).assertEqual('pre');
      expect(preData[1]).assertEqual('fail');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_4200
     * @tc.name mapForEachPart03Test042
     * @tc.desc Verify map entries stay intact after callback throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('keep1', 100);
      map.set('keep2', 200);
      map.set('keep3', 300);
      try {
        map.forEach((value: int, key: string, m: Map<string, int>): void => {
          if (key === 'keep2') { throw new Error('interrupt'); }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(map.size).assertEqual(3);
      expect(map.get('keep1')).assertEqual(100);
      expect(map.get('keep2')).assertEqual(200);
      expect(map.get('keep3')).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_4300
     * @tc.name mapForEachPart03Test043
     * @tc.desc Verify an error thrown inside the forEach callback propagates out of forEach and is caught by the caller with name "Error"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>([['boom', 99]]);
      try {
        map.forEach((value: int, key: string, m: Map<string, int>): void => {
          throw new Error('callback failure');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_4400
     * @tc.name mapForEachPart03Test044
     * @tc.desc Verify forEach does not change the map size, so size stays equal before and after the call for a map with an Infinity key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<double, int> = new Map<double, int>();
      map.set(POS_INF, 1);
      map.set(3.14, 2);
      let sizeBefore: int = map.size;
      map.forEach((value: int, key: double, m: Map<double, int>): void => {});
      expect(map.size).assertEqual(2);
      expect(sizeBefore).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_4500
     * @tc.name mapForEachPart03Test045
     * @tc.desc Verify forEach over a 5-entry Map invokes the callback 5 times and keeps map size 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('v1', 10);
      map.set('v2', 20);
      map.set('v3', 30);
      map.set('v4', 40);
      map.set('v5', 50);
      let callCount: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        callCount = callCount + 1;
      });
      expect(callCount).assertEqual(5);
      expect(map.size).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_4600
     * @tc.name mapForEachPart03Test046
     * @tc.desc Verify forEach over a 3-entry map matches the entries() iterator, visiting first/1, second/2 and third/3 in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('first', 1);
      map.set('second', 2);
      map.set('third', 3);
      let forEachKeys: string[] = [];
      let forEachVals: int[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        forEachKeys.push(key);
        forEachVals.push(value);
      });
      expect(forEachKeys.length).assertEqual(3);
      expect(forEachKeys[0]).assertEqual('first');
      expect(forEachKeys[1]).assertEqual('second');
      expect(forEachKeys[2]).assertEqual('third');
      expect(forEachVals[0]).assertEqual(1);
      expect(forEachVals[1]).assertEqual(2);
      expect(forEachVals[2]).assertEqual(3);
      let iter: IterableIterator<[string, int]> = map.entries();
      let e1: IteratorResult<[string, int]> = iter.next();
      let e2: IteratorResult<[string, int]> = iter.next();
      let e3: IteratorResult<[string, int]> = iter.next();
      expect(e1.value![0]).assertEqual('first');
      expect(e1.value![1]).assertEqual(1);
      expect(e2.value![0]).assertEqual('second');
      expect(e2.value![1]).assertEqual(2);
      expect(e3.value![0]).assertEqual('third');
      expect(e3.value![1]).assertEqual(3);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_4700
     * @tc.name mapForEachPart03Test047
     * @tc.desc Verify forEach over a 3-entry map visits keys kA, kB and kC in the same order as the keys() iterator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('kA', 10);
      map.set('kB', 20);
      map.set('kC', 30);
      let forEachKeys: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        forEachKeys.push(key);
      });
      expect(forEachKeys.length).assertEqual(3);
      expect(forEachKeys[0]).assertEqual('kA');
      expect(forEachKeys[1]).assertEqual('kB');
      expect(forEachKeys[2]).assertEqual('kC');
      let keyIter: IterableIterator<string> = map.keys();
      expect(keyIter.next().value!).assertEqual('kA');
      expect(keyIter.next().value!).assertEqual('kB');
      expect(keyIter.next().value!).assertEqual('kC');
      expect(keyIter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_4800
     * @tc.name mapForEachPart03Test048
     * @tc.desc Verify re-setting pos_b to 888 does not change traversal order (pos_a, pos_b, pos_c) and forEach yields the overwritten value 888 for pos_b
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('pos_a', 1);
      map.set('pos_b', 2);
      map.set('pos_c', 3);
      map.set('pos_b', 888);
      let order: string[] = [];
      let vals: int[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        order.push(key);
        vals.push(value);
      });
      expect(order[0]).assertEqual('pos_a');
      expect(order[1]).assertEqual('pos_b');
      expect(order[2]).assertEqual('pos_c');
      expect(vals[0]).assertEqual(1);
      expect(vals[1]).assertEqual(888);
      expect(vals[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_4900
     * @tc.name mapForEachPart03Test049
     * @tc.desc Verify building a map from entries with a duplicate key keeps size 2 and forEach yields the latest value 999 for the duplicate key followed by 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, int][] = [['dup', 1], ['unique', 2], ['dup', 999]];
      let map: Map<string, int> = new Map<string, int>(entries);
      let foundValues: int[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        foundValues.push(value);
      });
      expect(map.size).assertEqual(2);
      expect(foundValues[0]).assertEqual(999);
      expect(foundValues[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_5000
     * @tc.name mapForEachPart03Test050
     * @tc.desc Verify mutations through a map alias (delete b, add d, update a) are reflected in forEach traversal order a=111, c=3, d=4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      let ref: Map<string, int> = map;
      ref.delete('b');
      ref.set('d', 4);
      ref.set('a', 111);
      let collected: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        collected.push(key + '=' + value.toString());
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual('a=111');
      expect(collected[1]).assertEqual('c=3');
      expect(collected[2]).assertEqual('d=4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_5100
     * @tc.name mapForEachPart03Test051
     * @tc.desc Verify nested forEach invokes inner callbacks 9 times in total (3 x 3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('n1', 1);
      map.set('n2', 2);
      map.set('n3', 3);
      let outerCnt: int = 0;
      let innerCnt: int = 0;
      map.forEach((outerVal: int, outerKey: string, outerMap: Map<string, int>): void => {
        outerCnt++;
        map.forEach((innerVal: int, innerKey: string, innerMap: Map<string, int>): void => {
          innerCnt++;
        });
      });
      expect(outerCnt).assertEqual(3);
      expect(innerCnt).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_5200
     * @tc.name mapForEachPart03Test052
     * @tc.desc Verify three-level nested forEach multiplies call count up to 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('depth1', 1);
      map.set('depth2', 2);
      let l1Cnt: int = 0;
      let l2Cnt: int = 0;
      let l3Cnt: int = 0;
      map.forEach((level1Val: int, level1Key: string, level1Map: Map<string, int>): void => {
        l1Cnt++;
        map.forEach((level2Val: int, level2Key: string, level2Map: Map<string, int>): void => {
          l2Cnt++;
          map.forEach((level3Val: int, level3Key: string, level3Map: Map<string, int>): void => {
            l3Cnt++;
          });
        });
      });
      expect(l1Cnt).assertEqual(2);
      expect(l2Cnt).assertEqual(4);
      expect(l3Cnt).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_5300
     * @tc.name mapForEachPart03Test053
     * @tc.desc Verify forEach over an empty inner map never invokes its callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Map<string, int> = new Map<string, int>();
      outer.set('o1', 10);
      outer.set('o2', 20);
      let inner: Map<string, int> = new Map<string, int>();
      let outerCnt: int = 0;
      let innerInvoked: boolean = false;
      outer.forEach((v: int, k: string, m: Map<string, int>): void => {
        outerCnt++;
        inner.forEach((iv: int, ik: string, im: Map<string, int>): void => {
          innerInvoked = true;
        });
      });
      expect(outerCnt).assertEqual(2);
      expect(innerInvoked).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_5400
     * @tc.name mapForEachPart03Test054
     * @tc.desc Verify an inner forEach invoked from the outer callback captures the outer key once per outer entry in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Map<string, int> = new Map<string, int>();
      outer.set('alpha', 5);
      outer.set('beta', 10);
      let inner: Map<string, int> = new Map<string, int>();
      inner.set('sub', 1);
      let capturedOuterKeys: string[] = [];
      outer.forEach((v: int, k: string, m: Map<string, int>): void => {
        inner.forEach((iv: int, ik: string, im: Map<string, int>): void => {
          capturedOuterKeys.push(k);
        });
      });
      expect(capturedOuterKeys[0]).assertEqual('alpha');
      expect(capturedOuterKeys[1]).assertEqual('beta');
      expect(capturedOuterKeys.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_5500
     * @tc.name mapForEachPart03Test055
     * @tc.desc Verify nested forEach over two maps yields the 4 cross pairs abc+ten, abc+twenty, def+ten, def+twenty in order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapStrInt: Map<string, int> = new Map<string, int>();
      mapStrInt.set('abc', 1);
      mapStrInt.set('def', 2);
      let mapIntStr: Map<int, string> = new Map<int, string>();
      mapIntStr.set(10, 'ten');
      mapIntStr.set(20, 'twenty');
      let crossPairs: string[] = [];
      mapStrInt.forEach((outerVal: int, outerKey: string, outerMap: Map<string, int>): void => {
        mapIntStr.forEach((innerVal: string, innerKey: int, innerMap: Map<int, string>): void => {
          crossPairs.push(outerKey + '+' + innerVal);
        });
      });
      expect(crossPairs.length).assertEqual(4);
      expect(crossPairs[0]).assertEqual('abc+ten');
      expect(crossPairs[1]).assertEqual('abc+twenty');
      expect(crossPairs[2]).assertEqual('def+ten');
      expect(crossPairs[3]).assertEqual('def+twenty');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_5600
     * @tc.name mapForEachPart03Test056
     * @tc.desc Verify nested forEach over the same map does not disturb the outer traversal order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('C', 3);
      map.set('A', 1);
      map.set('B', 2);
      let outerOrder: string[] = [];
      map.forEach((v: int, k: string, m: Map<string, int>): void => {
        outerOrder.push(k);
        map.forEach((iv: int, ik: string, im: Map<string, int>): void => {});
      });
      expect(outerOrder[0]).assertEqual('C');
      expect(outerOrder[1]).assertEqual('A');
      expect(outerOrder[2]).assertEqual('B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_5700
     * @tc.name mapForEachPart03Test057
     * @tc.desc Verify forEach visits keys in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('first', 10);
      map.set('second', 20);
      map.set('third', 30);
      let index: int = 0;
      let positions: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        positions.push(key);
        index++;
      });
      expect(index).assertEqual(3);
      expect(positions[0]).assertEqual('first');
      expect(positions[1]).assertEqual('second');
      expect(positions[2]).assertEqual('third');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_5800
     * @tc.name mapForEachPart03Test058
     * @tc.desc Verify forEach can build a reversed Map from key-value pairs, mapping 111 to dog and 222 to cat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Map<string, int> = new Map<string, int>();
      src.set('dog', 111);
      src.set('cat', 222);
      let reversed: Map<int, string> = new Map<int, string>();
      src.forEach((value: int, key: string, m: Map<string, int>): void => {
        reversed.set(value, key);
      });
      expect(reversed.size).assertEqual(2);
      expect(reversed.get(111)).assertEqual('dog');
      expect(reversed.get(222)).assertEqual('cat');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_5900
     * @tc.name mapForEachPart03Test059
     * @tc.desc Verify forEach accumulates every entry's value into a shared stats object, yielding sum 45 over 3 entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('p1', 5);
      map.set('p2', 15);
      map.set('p3', 25);
      const stats: AccStats = new AccStats(0, 0);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        stats.sum = stats.sum + value;
        stats.count = stats.count + 1;
      });
      expect(stats.sum).assertEqual(45);
      expect(stats.count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_6000
     * @tc.name mapForEachPart03Test060
     * @tc.desc Verify 4 chained set calls produce 4 forEach callbacks yielding values 100, 200, 300, 400 in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('ch1', 100).set('ch2', 200).set('ch3', 300).set('ch4', 400);
      let keys: string[] = [];
      let vals: int[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        keys.push(key);
        vals.push(value);
      });
      expect(keys.length).assertEqual(4);
      expect(vals[0]).assertEqual(100);
      expect(vals[1]).assertEqual(200);
      expect(vals[2]).assertEqual(300);
      expect(vals[3]).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_6100
     * @tc.name mapForEachPart03Test061
     * @tc.desc Verify an overwritten key (target changed from 10 to 999) is visited once by forEach and yields the latest value 999
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('target', 10);
      map.set('other', 20);
      map.set('target', 999);
      let capturedVal: int = 0;
      let targetSeenCount: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        if (key === 'target') {
          targetSeenCount++;
          capturedVal = value;
        }
      });
      expect(targetSeenCount).assertEqual(1);
      expect(capturedVal).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_6200
     * @tc.name mapForEachPart03Test062
     * @tc.desc Verify forEach reflects deleted and re-added keys in traversal order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('x', 10);
      map.set('y', 20);
      map.set('z', 30);
      map.delete('y');
      map.set('w', 40);
      let results: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        results.push(key + ':' + value.toString());
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual('x:10');
      expect(results[1]).assertEqual('z:30');
      expect(results[2]).assertEqual('w:40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_6300
     * @tc.name mapForEachPart03Test063
     * @tc.desc Verify a key added inside the forEach callback is visited later in the same traversal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      let newKeySeen: boolean = false;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        if (key === 'a') { m.set('injected', 999); }
        if (key === 'injected') { newKeySeen = true; }
      });
      expect(map.has('injected')).assertTrue();
      expect(newKeySeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_6400
     * @tc.name mapForEachPart03Test064
     * @tc.desc Verify deleting an unvisited predecessor key (victim) inside the callback skips it, traversing only leader and survivor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('leader', 1);
      map.set('victim', 2);
      map.set('survivor', 3);
      let seen: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        seen.push(key);
        if (key === 'leader') { m.delete('victim'); }
      });
      expect(seen.length).assertEqual(2);
      expect(seen[0]).assertEqual('leader');
      expect(seen[1]).assertEqual('survivor');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_6500
     * @tc.name mapForEachPart03Test065
     * @tc.desc Verify clear() inside the callback stops traversal after the first key (c1) and leaves size 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('c1', 10);
      map.set('c2', 20);
      map.set('c3', 30);
      let visited: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        visited.push(key);
        if (key === 'c1') { m.clear(); }
      });
      expect(visited.length).assertEqual(1);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_6600
     * @tc.name mapForEachPart03Test066
     * @tc.desc Verify keys added inside the callback (bonus1, bonus2) are visited during the same traversal, ending with size 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('base', 0);
      let extraKeySeen: boolean = false;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        m.set('bonus1', 101);
        m.set('bonus2', 202);
        if (key === 'bonus1' || key === 'bonus2') { extraKeySeen = true; }
      });
      expect(map.size).assertEqual(3);
      expect(extraKeySeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_6700
     * @tc.name mapForEachPart03Test067
     * @tc.desc Verify clear in forEach skips remaining old keys but visits keys added after clear
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('snap1', 100);
      map.set('snap2', 200);
      let snapshot: string[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        snapshot.push(key);
        if (key === 'snap1') {
          m.clear();
          m.set('postClear', 999);
        }
      });
      expect(snapshot.length).assertEqual(2);
      expect(snapshot[0]).assertEqual('snap1');
      expect(snapshot[1]).assertEqual('postClear');
      expect(map.has('postClear')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_6800
     * @tc.name mapForEachPart03Test068
     * @tc.desc Verify setting an int.MAX_VALUE value INT_MAX inside a forEach callback makes map.get("maxValue") return it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('trigger', 1);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        m.set('maxValue', INT_MAX);
      });
      expect(map.get('maxValue')).assertEqual(INT_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_6900
     * @tc.name mapForEachPart03Test069
     * @tc.desc Verify forEach delivers the long.MAX_VALUE value 9223372036854775807 to the callback unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, long> = new Map<string, long>();
      map.set('longMax', LONG_MAX);
      let captured: long = 0;
      map.forEach((value: long, key: string, m: Map<string, long>): void => {
        captured = value;
      });
      expect(captured).assertEqual(LONG_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_7000
     * @tc.name mapForEachPart03Test070
     * @tc.desc Verify the map parameter m passed to each callback still has() every visited key across 3 entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('hk1', 10);
      map.set('hk2', 20);
      map.set('hk3', 30);
      let allExist: boolean = true;
      let callCount: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        callCount = callCount + 1;
        if (!m.has(key)) { allExist = false; }
      });
      expect(callCount).assertEqual(3);
      expect(allExist).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_7100
     * @tc.name mapForEachPart03Test071
     * @tc.desc Verify setting an int.MAX_VALUE key INT_MAX inside a forEach callback makes map.get(INT_MAX) return "maxKey"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<int, string> = new Map<int, string>();
      map.set(0, 'start');
      map.forEach((value: string, key: int, m: Map<int, string>): void => {
        m.set(INT_MAX, 'maxKey');
      });
      expect(map.has(INT_MAX)).assertTrue();
      expect(map.get(INT_MAX)).assertEqual('maxKey');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_7200
     * @tc.name mapForEachPart03Test072
     * @tc.desc Verify setting an int.MIN_VALUE key INT_MIN inside a forEach callback makes map.has(INT_MIN) return true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<int, string> = new Map<int, string>();
      map.set(1, 'one');
      map.forEach((value: string, key: int, m: Map<int, string>): void => {
        m.set(INT_MIN, 'minKey');
      });
      expect(map.has(INT_MIN)).assertTrue();
      expect(map.get(INT_MIN)).assertEqual('minKey');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_7300
     * @tc.name mapForEachPart03Test073
     * @tc.desc Verify int.MAX+1 value wraps to INT_MIN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('start', 0);
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        let a: int = INT_MAX;
        let b: int = 1;
        let c: int = a + b;
        m.set('overflow', c);
      });
      expect(map.has('overflow')).assertTrue();
      expect(map.get('overflow')).assertEqual(INT_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_7400
     * @tc.name mapForEachPart03Test074
     * @tc.desc Verify forEach visits the int.MAX_VALUE key INT_MAX and map.has(INT_MAX) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<int, string> = new Map<int, string>();
      map.set(INT_MAX, 'maxVal');
      map.set(0, 'zeroVal');
      let foundMax: boolean = false;
      map.forEach((value: string, key: int, m: Map<int, string>): void => {
        if (key === INT_MAX) { foundMax = true; }
      });
      expect(foundMax).assertTrue();
      expect(map.has(INT_MAX)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_7500
     * @tc.name mapForEachPart03Test075
     * @tc.desc Verify deleting one key from a 3-entry map reduces size to 2 and forEach traverses exactly the remaining 2 entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('keep1', 10);
      map.set('remove', 999);
      map.set('keep2', 30);
      let sizeBefore: int = map.size;
      map.delete('remove');
      let traverseCount: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        traverseCount++;
      });
      expect(map.size).assertEqual(sizeBefore - 1);
      expect(traverseCount).assertEqual(map.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_7600
     * @tc.name mapForEachPart03Test076
     * @tc.desc Verify forEach filters entries by key prefix, counting only the "proc"-prefixed key once
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('process', 10);
      map.set('skip', 20);
      let processedCnt: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        if (key.startsWith('proc')) { processedCnt++; }
      });
      expect(processedCnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_7700
     * @tc.name mapForEachPart03Test077
     * @tc.desc Verify forEach filters entries by a threshold, collecting only values greater than 5 (8 and 12)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 3);
      map.set('b', 8);
      map.set('c', 12);
      let threshold: int = 5;
      let aboveThreshold: int[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        if (value > threshold) { aboveThreshold.push(value); }
      });
      expect(aboveThreshold.length).assertEqual(2);
      expect(aboveThreshold[0]).assertEqual(8);
      expect(aboveThreshold[1]).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_7800
     * @tc.name mapForEachPart03Test078
     * @tc.desc Verify forEach delivers class-typed Payload values, collecting codes 101 and 202 in order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Payload = new Payload(101);
      let p2: Payload = new Payload(202);
      let map: Map<string, Payload> = new Map<string, Payload>();
      map.set('a', p1);
      map.set('b', p2);
      let codes: int[] = [];
      map.forEach((value: Payload, key: string, m: Map<string, Payload>): void => {
        codes.push(value.code);
      });
      expect(codes[0]).assertEqual(101);
      expect(codes[1]).assertEqual(202);
      expect(codes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_7900
     * @tc.name mapForEachPart03Test079
     * @tc.desc Verify forEach over a 3-entry map visits values 7, 14 and 21 in the same order as the values() iterator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('va', 7);
      map.set('vb', 14);
      map.set('vc', 21);
      let forEachVals: int[] = [];
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        forEachVals.push(value);
      });
      expect(forEachVals.length).assertEqual(3);
      expect(forEachVals[0]).assertEqual(7);
      expect(forEachVals[1]).assertEqual(14);
      expect(forEachVals[2]).assertEqual(21);
      let valIter: IterableIterator<int> = map.values();
      expect(valIter.next().value!).assertEqual(7);
      expect(valIter.next().value!).assertEqual(14);
      expect(valIter.next().value!).assertEqual(21);
      expect(valIter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_8000
     * @tc.name mapForEachPart03Test080
     * @tc.desc Verify forEach invokes its callback twice for a 2-entry map and leaves map.toString() unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('ts_a', 5);
      map.set('ts_b', 25);
      const beforeStr: string = map.toString();
      let callCount: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        callCount = callCount + 1;
      });
      expect(callCount).assertEqual(2);
      expect(map.toString()).assertEqual(beforeStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_8100
     * @tc.name mapForEachPart03Test081
     * @tc.desc Verify forEach visits the int.MIN_VALUE key INT_MIN and map.get(INT_MIN) returns the stored value "minVal"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<int, string> = new Map<int, string>();
      map.set(INT_MIN, 'minVal');
      map.set(1, 'oneVal');
      let foundMin: boolean = false;
      map.forEach((value: string, key: int, m: Map<int, string>): void => {
        if (key === INT_MIN) { foundMin = true; }
      });
      expect(foundMin).assertTrue();
      expect(map.get(INT_MIN)).assertEqual('minVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_8200
     * @tc.name mapForEachPart03Test082
     * @tc.desc Verify a key toggled by set, delete and set again yields its latest value 500 in forEach and keeps size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('toggle', 100);
      map.delete('toggle');
      map.set('toggle', 500);
      let finalVal: int = 0;
      map.forEach((value: int, key: string, m: Map<string, int>): void => {
        if (key === 'toggle') { finalVal = value; }
      });
      expect(finalVal).assertEqual(500);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_FOREACH_PART03_TEST_8300
     * @tc.name mapForEachPart03Test083
     * @tc.desc Verify nested forEach across two maps runs 6 inner callbacks
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapForEachPart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapA: Map<string, int> = new Map<string, int>();
      mapA.set('A1', 1);
      mapA.set('A2', 2);
      let mapB: Map<string, int> = new Map<string, int>();
      mapB.set('B1', 10);
      mapB.set('B2', 20);
      mapB.set('B3', 30);
      let cntA: int = 0;
      let cntB: int = 0;
      mapA.forEach((v: int, k: string, m: Map<string, int>): void => {
        cntA++;
        mapB.forEach((bv: int, bk: string, bm: Map<string, int>): void => {
          cntB++;
        });
      });
      expect(cntA).assertEqual(2);
      expect(cntB).assertEqual(6);
    });

  });
}