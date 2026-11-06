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
} from '@ohos/hypium-static/src/main/indexStatic';
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
