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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Int16ArrayFromTest06(): void {
  describe('Int16ArrayFromTest06', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_0100
     * @tc.name testInt16ArrayFromTestSix001
     * @tc.desc Verify Int16Array.from large Set length equals 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      for (let i: number = 0; i < 50; i++) {
        source.add(i);
      }
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_0200
     * @tc.name testInt16ArrayFromTestSix002
     * @tc.desc Verify Int16Array.from source int16.MAX 32767 stays 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(32767);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_0300
     * @tc.name testInt16ArrayFromTestSix003
     * @tc.desc Verify Int16Array.from source int16.MIN -32768 stays -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(-32768);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_0400
     * @tc.name testInt16ArrayFromTestSix004
     * @tc.desc Verify Int16Array.from source 32768 wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(32768);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_0500
     * @tc.name testInt16ArrayFromTestSix005
     * @tc.desc Verify Int16Array.from source -32769 wraps to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(-32769);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_0600
     * @tc.name testInt16ArrayFromTestSix006
     * @tc.desc Verify Int16Array.from source NaN becomes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(Number.NaN);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_0700
     * @tc.name testInt16ArrayFromTestSix007
     * @tc.desc Verify Int16Array.from source +Infinity becomes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(Number.POSITIVE_INFINITY);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_0800
     * @tc.name testInt16ArrayFromTestSix008
     * @tc.desc Verify Int16Array.from source -Infinity becomes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(-Number.POSITIVE_INFINITY);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_0900
     * @tc.name testInt16ArrayFromTestSix009
     * @tc.desc Verify Int16Array.from source 3.7 truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(3.7);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_1000
     * @tc.name testInt16ArrayFromTestSix010
     * @tc.desc Verify Int16Array.from source -3.7 truncates to -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(-3.7);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = -3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_1100
     * @tc.name testInt16ArrayFromTestSix011
     * @tc.desc Verify Int16Array.from source -1 stays -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(-1);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_1200
     * @tc.name testInt16ArrayFromTestSix012
     * @tc.desc Verify Int16Array.from mixed boundary source truncation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(32767);
      source.add(-32768);
      source.add(Number.NaN);
      source.add(3.7);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = 3;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_1300
     * @tc.name testInt16ArrayFromTestSix013
     * @tc.desc Verify Int16Array.from Number.MAX_VALUE source yields defined short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1.7976931348623157e308);
      let result: Int16Array = Int16Array.from(source);
      let r1: boolean = result.$_get(0) !== undefined;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_1400
     * @tc.name testInt16ArrayFromTestSix014
     * @tc.desc Verify Int16Array.from Set insertion order preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(100);
      source.add(200);
      source.add(300);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 200;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 300;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_1500
     * @tc.name testInt16ArrayFromTestSix015
     * @tc.desc Verify Int16Array.from Set reverse insertion order preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(300);
      source.add(200);
      source.add(100);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 300;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 200;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 100;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_1600
     * @tc.name testInt16ArrayFromTestSix016
     * @tc.desc Verify Int16Array.from Set order with zero and negatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(-5);
      source.add(0);
      source.add(5);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = -5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 5;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_1700
     * @tc.name testInt16ArrayFromTestSix017
     * @tc.desc Verify Int16Array.from mapfn v receives source element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(42);
      let captured: number = -1;
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        captured = v;
        return v;
      });
      expect(captured).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_1800
     * @tc.name testInt16ArrayFromTestSix018
     * @tc.desc Verify Int16Array.from mapfn receives k=0 for first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(10);
      source.add(20);
      let captured: number = -1;
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (k === 0) {
          captured = k;
        }
        return v;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_1900
     * @tc.name testInt16ArrayFromTestSix019
     * @tc.desc Verify Int16Array.from mapfn k increments per element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(5);
      source.add(5);
      source.add(5);
      let indices: Array<number> = [];
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        indices.push(k);
        return v;
      });
      let r1: number = indices[0];
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: int = indices.length;
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: int = result.length;
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_2000
     * @tc.name testInt16ArrayFromTestSix020
     * @tc.desc Verify Int16Array.from mapfn return 32767 stays 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 32767;
      });
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_2100
     * @tc.name testInt16ArrayFromTestSix021
     * @tc.desc Verify Int16Array.from mapfn return -32768 stays -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return -32768;
      });
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_2200
     * @tc.name testInt16ArrayFromTestSix022
     * @tc.desc Verify Int16Array.from mapfn return 32768 wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 32768;
      });
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_2300
     * @tc.name testInt16ArrayFromTestSix023
     * @tc.desc Verify Int16Array.from mapfn return -32769 wraps to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return -32769;
      });
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_2400
     * @tc.name testInt16ArrayFromTestSix024
     * @tc.desc Verify Int16Array.from mapfn return NaN becomes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return Number.NaN;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_2500
     * @tc.name testInt16ArrayFromTestSix025
     * @tc.desc Verify Int16Array.from mapfn return +Infinity becomes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return Number.POSITIVE_INFINITY;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_2600
     * @tc.name testInt16ArrayFromTestSix026
     * @tc.desc Verify Int16Array.from mapfn return -Infinity becomes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return -Number.POSITIVE_INFINITY;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_2700
     * @tc.name testInt16ArrayFromTestSix027
     * @tc.desc Verify Int16Array.from mapfn return 3.7 truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 3.7;
      });
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_2800
     * @tc.name testInt16ArrayFromTestSix028
     * @tc.desc Verify Int16Array.from mapfn return -3.7 truncates to -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return -3.7;
      });
      let r1: number = result.$_get(0);
      let e1: int = -3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_2900
     * @tc.name testInt16ArrayFromTestSix029
     * @tc.desc Verify Int16Array.from mapfn return 0 stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(100);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 0;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_3000
     * @tc.name testInt16ArrayFromTestSix030
     * @tc.desc Verify Int16Array.from mapfn Number.MAX_VALUE wraps to defined short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 1.7976931348623157e308;
      });
      let r1: boolean = result.$_get(0) !== undefined;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_3100
     * @tc.name testInt16ArrayFromTestSix031
     * @tc.desc Verify Int16Array.from Iterable with mapfn behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(10);
      source.add(20);
      source.add(30);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 99;
      });
      let r1: number = result.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 99;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 99;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_3200
     * @tc.name testInt16ArrayFromTestSix032
     * @tc.desc Verify Int16Array.from mapfn returns index k as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(10);
      source.add(20);
      source.add(30);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return k * 10;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 20;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_3300
     * @tc.name testInt16ArrayFromTestSix033
     * @tc.desc Verify Int16Array.from mapfn identity transform preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(50);
      source.add(100);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 100;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_3400
     * @tc.name testInt16ArrayFromTestSix034
     * @tc.desc Verify Int16Array.from Iterable with mapfn behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(10);
      source.add(20);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v + 5;
      });
      let r1: number = result.$_get(0);
      let e1: int = 15;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 25;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_3500
     * @tc.name testInt16ArrayFromTestSix035
     * @tc.desc Verify Int16Array.from mapfn multiplies source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      source.add(2);
      let factor: number = 100;
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v * factor;
      });
      let r1: number = result.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 200;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_3600
     * @tc.name testInt16ArrayFromTestSix036
     * @tc.desc Verify Int16Array.from mapfn identity transform preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      source.add(2);
      source.add(3);
      let callCount: number = 0;
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        callCount = callCount + 1;
        return v;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_3700
     * @tc.name testInt16ArrayFromTestSix037
     * @tc.desc Verify Int16Array.from mapfn multiplies source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(-5);
      source.add(5);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v < 0) {
          return -v;
        }
        return v * 2;
      });
      let r1: number = result.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_3800
     * @tc.name testInt16ArrayFromTestSix038
     * @tc.desc Verify Int16Array.from Iterable with mapfn length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v + 1;
      });
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_3900
     * @tc.name testInt16ArrayFromTestSix039
     * @tc.desc Verify Int16Array.from mapfn multiplies source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(7);
      let callCount: number = 0;
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        callCount = callCount + 1;
        return v * 2;
      });
      expect(callCount).assertEqual(1);
      let r1: number = result.$_get(0);
      let e1: int = 14;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_4000
     * @tc.name testInt16ArrayFromTestSix040
     * @tc.desc Verify Int16Array.from mapfn identity transform preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      for (let i: number = 0; i < 5; i++) {
        source.add(i);
      }
      let callCount: number = 0;
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        callCount = callCount + 1;
        return v;
      });
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_4100
     * @tc.name testInt16ArrayFromTestSix041
     * @tc.desc Verify Int16Array.from Iterable with mapfn behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(Number.NaN);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return 100;
      });
      let r1: number = result.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_4200
     * @tc.name testInt16ArrayFromTestSix042
     * @tc.desc Verify Int16Array.from mapfn identity transform preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(Number.NaN);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_4300
     * @tc.name testInt16ArrayFromTestSix043
     * @tc.desc Verify Int16Array.from mapfn identity transform preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(Number.POSITIVE_INFINITY);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === Number.POSITIVE_INFINITY) {
          return 200;
        }
        return v;
      });
      let r1: number = result.$_get(0);
      let e1: int = 200;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_4400
     * @tc.name testInt16ArrayFromTestSix044
     * @tc.desc Verify Int16Array.from mapfn return -32768 stays -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(-100);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return -32768;
      });
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_4500
     * @tc.name testInt16ArrayFromTestSix045
     * @tc.desc Verify Int16Array.from single-element Set returns Int16Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      let result: Int16Array = Int16Array.from(source);
      let r1: boolean = result instanceof Int16Array;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_4600
     * @tc.name testInt16ArrayFromTestSix046
     * @tc.desc Verify Int16Array.from multi-element Set length equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      source.add(2);
      source.add(3);
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_4700
     * @tc.name testInt16ArrayFromTestSix047
     * @tc.desc Verify Int16Array.from Iterable Set behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      source.add(2);
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.byteLength;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_4800
     * @tc.name testInt16ArrayFromTestSix048
     * @tc.desc Verify Int16Array.from Iterable Set behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      let result: Int16Array = Int16Array.from(source);
      try {
        result.$_get(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_4900
     * @tc.name testInt16ArrayFromTestSix049
     * @tc.desc Verify Int16Array.from Iterable Set behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      source.add(2);
      let result: Int16Array = Int16Array.from(source);
      result.fill(0);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_5000
     * @tc.name testInt16ArrayFromTestSix050
     * @tc.desc Verify Int16Array.from Iterable Set behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(100);
      let result: Int16Array = Int16Array.from(source);
      result.$_set(0, 999);
      let verify: Int16Array = Int16Array.from(source);
      let r1: number = verify.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_5100
     * @tc.name testInt16ArrayFromTestSix051
     * @tc.desc Verify Int16Array.from single-element Set with mapfn returns Int16Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v * 2;
      });
      let r1: boolean = result instanceof Int16Array;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_5200
     * @tc.name testInt16ArrayFromTestSix052
     * @tc.desc Verify Int16Array.from mapfn identity transform preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      source.add(2);
      source.add(3);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let r1: int = result.byteLength;
      let e1: int = 6;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_5300
     * @tc.name testInt16ArrayFromTestSix053
     * @tc.desc Verify Int16Array.from mapfn multiplies source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(5);
      source.add(10);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v * 10;
      });
      let r1: number = source.size;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let iterator: IterableIterator<number> = source.values();
      let first: IteratorResult<number> = iterator.next();
      let r2 = first.value;
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_5400
     * @tc.name testInt16ArrayFromTestSix054
     * @tc.desc Verify Int16Array.from Iterable Set behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(10);
      source.add(20);
      let fn: (v: number, k: number) => number = (v: number, k: number): number => {
        return v + 1;
      };
      let r1: Int16Array = Int16Array.from(source, fn);
      let r2: Int16Array = Int16Array.from(source, fn);
      let v1: number = r1.$_get(0);
      let e1: number = r2.$_get(0);
      expect(v1).assertEqual(e1);
      let v2: number = r1.$_get(1);
      let e2: number = r2.$_get(1);
      expect(v2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_5500
     * @tc.name testInt16ArrayFromTestSix055
     * @tc.desc Verify Int16Array.from mapfn transforms each element by v+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(10);
      source.add(20);
      source.add(30);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v + 1;
      }).reverse();
      let r1: number = result.$_get(0);
      let e1: int = 31;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 11;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_5600
     * @tc.name testInt16ArrayFromTestSix056
     * @tc.desc Verify Int16Array.from Iterable Set behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      source.add(2);
      source.add(3);
      let originalSize: number = source.size;
      let result: Int16Array = Int16Array.from(source);
      let r1: number = source.size;
      let e1: number = originalSize;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_5700
     * @tc.name testInt16ArrayFromTestSix057
     * @tc.desc Verify Int16Array.from mapfn transforms each element by v+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(50);
      source.add(100);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v + 1000;
      });
      let r1: boolean = source.has(50);
      expect(r1).assertTrue();
      let r2: boolean = source.has(100);
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_5800
     * @tc.name testInt16ArrayFromTestSix058
     * @tc.desc Verify Int16Array.from Iterable Set arity=1 length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(7);
      source.add(8);
      let result: Int16Array = Int16Array.from(source);
      source.add(9);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_5900
     * @tc.name testInt16ArrayFromTestSix059
     * @tc.desc Verify Int16Array.from invalid usage throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      source.add(2);
      try {
        Int16Array.from(source, (v: number, k: number): number => {
          if (v === undefined || v === null) {
            return 0;
          }
          throw new Error('mapfn error');
        });
        expect().assertFail();
      } catch (e) {
        let rNull: boolean = e !== null;
        expect(rNull).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_6000
     * @tc.name testInt16ArrayFromTestSix060
     * @tc.desc Verify Int16Array.from invalid usage throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1);
      source.add(2);
      source.add(3);
      let callCount: number = 0;
      try {
        Int16Array.from(source, (v: number, k: number): number => {
          if (v === undefined || v === null) {
            return 0;
          }
          callCount = callCount + 1;
          throw new Error('fail on first');
        });
        expect().assertFail();
      } catch (e) {
        let rNull: boolean = e !== null;
        expect(rNull).assertTrue();
      }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_6100
     * @tc.name testInt16ArrayFromTestSix061
     * @tc.desc Verify Int16Array.from mapfn identity transform preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(10);
      source.add(20);
      source.add(30);
      let callCount: number = 0;
      try {
        Int16Array.from(source, (v: number, k: number): number => {
          callCount = callCount + 1;
          if (k === 1) {
            throw new Error('fail at second');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        let rNull: boolean = e !== null;
        expect(rNull).assertTrue();
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_6200
     * @tc.name testInt16ArrayFromTestSix062
     * @tc.desc Verify Int16Array.from Iterable with mapfn length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      let called: boolean = false;
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        called = true;
        return v;
      });
      expect(called).assertFalse();
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_6300
     * @tc.name testInt16ArrayFromTestSix063
     * @tc.desc Verify Int16Array.from single-element Set length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(5);
      source.add(5);
      source.add(5);
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_6400
     * @tc.name testInt16ArrayFromTestSix064
     * @tc.desc Verify Int16Array.from single-element Set length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(0);
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_6500
     * @tc.name testInt16ArrayFromTestSix065
     * @tc.desc Verify Int16Array.from mapfn returns index k as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(100);
      source.add(200);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return k + 1;
      });
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_6600
     * @tc.name testInt16ArrayFromTestSix066
     * @tc.desc Verify Int16Array.from mapfn multiplies source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(10);
      source.add(20);
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v * 2;
      });
      result.fill(0);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_6700
     * @tc.name testInt16ArrayFromTestSix067
     * @tc.desc Verify Int16Array.from Iterable Set behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(50);
      let r1: Int16Array = Int16Array.from(source);
      let r2: Int16Array = Int16Array.from(source);
      r1.$_set(0, 99);
      let v1: number = r2.$_get(0);
      let e1: int = 50;
      expect(v1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_6800
     * @tc.name testInt16ArrayFromTestSix068
     * @tc.desc Verify Int16Array.from empty Array source length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: boolean = result instanceof Int16Array;
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_6900
     * @tc.name testInt16ArrayFromTestSix069
     * @tc.desc Verify Int16Array.from single element Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [42];
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 42;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_7000
     * @tc.name testInt16ArrayFromTestSix070
     * @tc.desc Verify Int16Array.from multi element Array keeps order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [10, 20, 30];
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = 20;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(2);
      let e4: int = 30;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_7100
     * @tc.name testInt16ArrayFromTestSix071
     * @tc.desc Verify Int16Array.from Array with int16 boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [32767, -32768, 32768, -32769];
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -32768;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = 32767;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_7200
     * @tc.name testInt16ArrayFromTestSix072
     * @tc.desc Verify Int16Array.from Array NaN Infinity become 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY];
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_7300
     * @tc.name testInt16ArrayFromTestSix073
     * @tc.desc Verify Int16Array.from Array float truncates toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [3.7, -3.7, 0.9, -0.9];
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -3;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = 0;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_7400
     * @tc.name testInt16ArrayFromTestSix074
     * @tc.desc Verify Int16Array.from large Array length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      for (let i: number = 0; i < 100; i++) {
        source.push(i);
      }
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(99);
      let e2: int = 99;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_7500
     * @tc.name testInt16ArrayFromTestSix075
     * @tc.desc Verify Int16Array.from with identity mapfn equals omit mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [10, 20, 30];
      let r1: Int16Array = Int16Array.from(source);
      let r2: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v;
      });
      let v1: number = r2.$_get(0);
      let e1: number = r1.$_get(0);
      expect(v1).assertEqual(e1);
      let v2: number = r2.$_get(1);
      let e2: number = r1.$_get(1);
      expect(v2).assertEqual(e2);
      let r3: number = r2.$_get(2);
      let e3: number = r1.$_get(2);
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_7600
     * @tc.name testInt16ArrayFromTestSix076
     * @tc.desc Verify Int16Array.from mapfn uses index k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [100, 200, 300];
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        return k;
      });
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_7700
     * @tc.name testInt16ArrayFromTestSix077
     * @tc.desc Verify Int16Array.from mapfn combines v and k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [5, 10, 15];
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v + k;
      });
      let r1: number = result.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 11;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 17;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_7800
     * @tc.name testInt16ArrayFromTestSix078
     * @tc.desc Verify Int16Array.from empty Array with mapfn not called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      let called: boolean = false;
      let result: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        if (v === undefined || v === null) {
          return 0;
        }
        called = true;
        return 0;
      });
      expect(called).assertFalse();
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_7900
     * @tc.name testInt16ArrayFromTestSix079
     * @tc.desc Verify Int16Array.from Int8Array source converts elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int8Array = new Int8Array([10, -10, 127, -128]);
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(1);
      let e3: int = -10;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(2);
      let e4: int = 127;
      expect(r4).assertEqual(e4);
      let r5: number = result.$_get(3);
      let e5: int = -128;
      expect(r5).assertEqual(e5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_SIX_8000
     * @tc.name testInt16ArrayFromTestSix080
     * @tc.desc Verify Int16Array.from empty Int8Array length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestSix080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int8Array = new Int8Array(0);
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });
  });
}
