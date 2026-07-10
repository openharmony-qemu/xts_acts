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
import Utils from '../Util.test';

export default function float64ArrayKeysTest(): void {
  describe('Float64ArrayKeysTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_0100
     * @tc.name testFloat64ArrayKeys001
     * @tc.desc Verify keys method called with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const iter = arr.keys();
      const actVal1 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_0200
     * @tc.name testFloat64ArrayKeys002
     * @tc.desc Verify keys has single signature no overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(-2147483648);
      const iter = arr.keys();
      const actVal2 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal2).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_0300
     * @tc.name testFloat64ArrayKeys003
     * @tc.desc Verify keys iterator first next returns index 0 and active state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([0.1, 9007199254740991]);
      const iter = arr.keys();
      const result = iter.next();
      const actVal3 = result.value!;
      const expectVal = zeroValue;
      expect(actVal3).assertEqual(expectVal);
      const expectDone = false;
      expect(result.done).assertEqual(expectDone);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_0400
     * @tc.name testFloat64ArrayKeys004
     * @tc.desc Verify typed keys IterableIterator yields first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.5, 1.5);
      const iter: IterableIterator<int> = arr.keys();
      const actVal4 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal4).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_0500
     * @tc.name testFloat64ArrayKeys005
     * @tc.desc Verify empty array keys iterator done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const iter = arr.keys();
      const result = iter.next();
      const expectVal = true;
      expect(result.done).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_0600
     * @tc.name testFloat64ArrayKeys006
     * @tc.desc Verify single element keys first value is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768]);
      const iter = arr.keys();
      const result = iter.next();
      expect(result.value).assertEqual(zeroValue);
      const expectDone = false;
      expect(result.done).assertEqual(expectDone);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_0700
     * @tc.name testFloat64ArrayKeys007
     * @tc.desc Verify single element keys iteration complete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648);
      const iter = arr.keys();
      iter.next();
      const doneResult = iter.next();
      const expectDone = true;
      expect(doneResult.done).assertEqual(expectDone);
      expect(doneResult.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_0800
     * @tc.name testFloat64ArrayKeys008
     * @tc.desc Verify three-element keys first value is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const iter = arr.keys();
      const r0 = iter.next();
      const expectVal = zeroValue;
      expect(r0.value).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_0900
     * @tc.name testFloat64ArrayKeys009
     * @tc.desc Verify three-element keys second value is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const iter = arr.keys();
      iter.next();
      const r1 = iter.next();
      const expectVal = oneValue;
      expect(r1.value).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_1000
     * @tc.name testFloat64ArrayKeys010
     * @tc.desc Verify three-element keys third value is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([-32768, -128, 0]);
      const iter = arr.keys();
      iter.next();
      iter.next();
      const r2 = iter.next();
      const expectVal = twoValue;
      expect(r2.value).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_1100
     * @tc.name testFloat64ArrayKeys011
     * @tc.desc Verify keys on array from Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const numbers: Array<number> = [7.0, 8.0, 9.0];
      const arr = new Float64Array(numbers);
      const iter = arr.keys();
      const actVal5 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal5).assertEqual(expectVal);
      const actVal6 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal6).assertEqual(expectVal2);
      const actVal7 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal7).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_1200
     * @tc.name testFloat64ArrayKeys012
     * @tc.desc Verify keys on float64Array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const src = Float64Array.of(-2147483648, -1);
      const copied = new Float64Array(src);
      const iter = copied.keys();
      const actVal8 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal8).assertEqual(expectVal);
      const actVal9 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal9).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_1300
     * @tc.name testFloat64ArrayKeys013
     * @tc.desc Verify keys on ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const buf = new ArrayBuffer(24);
      const view = new Float64Array(buf, 0, 3);
      view.$_set(0, onePointZero);
      view.$_set(1, twoPointZero);
      view.$_set(2, threePointZero);
      const iter = view.keys();
      const actVal10 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal10).assertEqual(expectVal);
      const actVal11 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal11).assertEqual(expectVal2);
      const actVal12 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal12).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_1400
     * @tc.name testFloat64ArrayKeys014
     * @tc.desc Verify keys on ArrayBuffer non-zero offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const num200Pointzero: number = 200.0;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const buf = new ArrayBuffer(32);
      const view = new Float64Array(buf, 8, 2);
      view.$_set(0, hundredPointZero);
      view.$_set(1, num200Pointzero);
      const iter = view.keys();
      const actVal13 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal13).assertEqual(expectVal);
      const actVal14 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal14).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_1500
     * @tc.name testFloat64ArrayKeys015
     * @tc.desc Verify keys on ArrayBuffer full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf);
      const iter = view.keys();
      const actVal15 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal15).assertEqual(expectVal);
      const actVal16 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal16).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_1600
     * @tc.name testFloat64ArrayKeys016
     * @tc.desc Verify iterator next returns done false for active iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1);
      const iter = arr.keys();
      const r = iter.next();
      const expectVal = false;
      expect(r.done).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_1700
     * @tc.name testFloat64ArrayKeys017
     * @tc.desc Verify iterator next value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.5, 1.5);
      const iter = arr.keys();
      const r = iter.next();
      const expectVal = zeroValue;
      expect(r.value).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_1800
     * @tc.name testFloat64ArrayKeys018
     * @tc.desc Verify iterator consecutive next does not reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([-32768, -128, 0]);
      const iter = arr.keys();
      iter.next();
      iter.next();
      const r = iter.next();
      const expectVal = twoValue;
      expect(r.value).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_1900
     * @tc.name testFloat64ArrayKeys019
     * @tc.desc Verify iterator next after exhaustion returns done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648);
      const iter = arr.keys();
      iter.next();
      const r = iter.next();
      const expectDone = true;
      expect(r.done).assertEqual(expectDone);
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_2000
     * @tc.name testFloat64ArrayKeys020
     * @tc.desc Verify keys multiple calls return new iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991]);
      const iter1 = arr.keys();
      const iter2 = arr.keys();
      iter1.next();
      const actVal17 = iter1.next().done;
      const expectVal = false;
      expect(actVal17).assertEqual(expectVal);
      iter2.next();
      const actVal18 = iter2.next().done;
      const expectVal2 = false;
      expect(actVal18).assertEqual(expectVal2);
      expect(iter1).not().assertEqual(iter2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_2100
     * @tc.name testFloat64ArrayKeys021
     * @tc.desc Verify independent iterators traverse independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.5, 1.5);
      const iter1 = arr.keys();
      const iter2 = arr.keys();
      iter1.next();
      const r2 = iter2.next();
      const expectVal = zeroValue;
      expect(r2.value).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_2200
     * @tc.name testFloat64ArrayKeys022
     * @tc.desc Verify original array modification does not affect obtained iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const oneValue: number = 1;
      const arr = Float64Array.of(-32768, -128);
      const iter = arr.keys();
      iter.next();
      arr.$_set(0, num999Pointzero);
      const r = iter.next();
      const expectVal = oneValue;
      expect(r.value).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_2300
     * @tc.name testFloat64ArrayKeys023
     * @tc.desc Verify original array length change does not affect obtained iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const iter = arr.keys();
      const actVal19 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal19).assertEqual(expectVal);
      const actVal20 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal20).assertEqual(expectVal2);
      const actVal21 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal21).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_2400
     * @tc.name testFloat64ArrayKeys024
     * @tc.desc Verify keys with $_get validates index-value correspondence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne, 9007199254740991, 0]);
      const iter = arr.keys();
      const k0 = iter.next().value! as int;
      const actVal22 = arr.$_get(k0);
      const expectVal = pointOne;
      expect(actVal22).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_2500
     * @tc.name testFloat64ArrayKeys025
     * @tc.desc Verify keys with $_set validates index writing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const arr = new Float64Array(3);
      const iter = arr.keys();
      const k0 = iter.next().value! as int;
      arr.$_set(k0, fivePointZero);
      const actVal23 = arr.$_get(k0);
      const expectVal = fivePointZero;
      expect(actVal23).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_2600
     * @tc.name testFloat64ArrayKeys026
     * @tc.desc Verify three-element keys iteration ends with done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const iter = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      const r3 = iter.next();
      const expectVal = true;
      expect(r3.done).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_2700
     * @tc.name testFloat64ArrayKeys027
     * @tc.desc Verify 10-element keys first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroValue: number = 0;
      const arr = new Float64Array(10);
      for (let i = 0; i < 10; i = i + 1) {
        arr.$_set(i, i * onePointZero);
      }
      const iter = arr.keys();
      const first = iter.next();
      const expectVal = zeroValue;
      expect(first.value).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_2800
     * @tc.name testFloat64ArrayKeys028
     * @tc.desc Verify 10-element keys last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const nineValue: number = 9;
      const arr = new Float64Array(10);
      for (let i = 0; i < 10; i = i + 1) {
        arr.$_set(i, i * onePointZero);
      }
      const iter = arr.keys();
      let lastVal: number = -1;
      let lastDone: boolean = false;
      while (true) {
        const r = iter.next();
        if (r.done) {
          lastDone = true;
          break;
        }
        lastVal = r.value as int;
      }
      const expectVal = nineValue;
      expect(lastVal).assertEqual(expectVal);
      const expectVal2 = true;
      expect(lastDone).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_2900
     * @tc.name testFloat64ArrayKeys029
     * @tc.desc Verify 10-element keys total count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenValue: number = 10;
      const arr = new Float64Array(10);
      const iter = arr.keys();
      let count: number = 0;
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        count = count + 1;
      }
      const expectVal = tenValue;
      expect(count).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_3000
     * @tc.name testFloat64ArrayKeys030
     * @tc.desc Verify negative element array keys order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const iter = arr.keys();
      const actVal24 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal24).assertEqual(expectVal);
      const actVal25 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal25).assertEqual(expectVal2);
      const actVal26 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal26).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_3100
     * @tc.name testFloat64ArrayKeys031
     * @tc.desc Verify NaN element array keys order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const nanValue: number = Double.NaN;
      const arr = new Float64Array([nanValue, nanValue]);
      const iter = arr.keys();
      const actVal27 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal27).assertEqual(expectVal);
      const actVal28 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal28).assertEqual(expectVal2);
      const nanStored = Number.isNaN(arr[0]);
      const expectVal3 = true;
      expect(nanStored).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_3200
     * @tc.name testFloat64ArrayKeys032
     * @tc.desc Verify Infinity element array keys order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = new Float64Array([positiveInfinity, negativeInfinity]);
      const iter = arr.keys();
      const actVal29 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal29).assertEqual(expectVal);
      const actVal30 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal30).assertEqual(expectVal2);
      expect(arr[0]).assertEqual(positiveInfinity);
      expect(arr[1]).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_3300
     * @tc.name testFloat64ArrayKeys033
     * @tc.desc Verify zero-value array keys order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array([0.0, -0.0, 0.0]);
      const iter = arr.keys();
      const actVal31 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal31).assertEqual(expectVal);
      const actVal32 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal32).assertEqual(expectVal2);
      const actVal33 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal33).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_3400
     * @tc.name testFloat64ArrayKeys034
     * @tc.desc Verify MIN_VALUE element array keys order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const minValue: number = Double.MIN_VALUE;
      const arr = new Float64Array([minValue, minValue, minValue]);
      const iter = arr.keys();
      const actVal34 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal34).assertEqual(expectVal);
      const actVal35 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal35).assertEqual(expectVal2);
      const actVal36 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal36).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_3500
     * @tc.name testFloat64ArrayKeys035
     * @tc.desc Verify INT32 boundary element array keys order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MinValue: number = -2147483648;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, int32MaxValue);
      const iter = arr.keys();
      const actVal37 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal37).assertEqual(expectVal);
      const actVal38 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal38).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_3600
     * @tc.name testFloat64ArrayKeys036
     * @tc.desc Verify MAX_SAFE_INTEGER element array keys order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const maxSafeInteger: number = 9007199254740991;
      const arr = new Float64Array([maxSafeInteger]);
      const iter = arr.keys();
      const actVal39 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal39).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_3700
     * @tc.name testFloat64ArrayKeys037
     * @tc.desc Verify mixed positive-negative decimal array keys order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const threeValue: number = 3;
      const arr = Float64Array.of(-2147483648, -1, zeroValue, oneValue);
      const iter = arr.keys();
      const actVal40 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal40).assertEqual(expectVal);
      const actVal41 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal41).assertEqual(expectVal2);
      const actVal42 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal42).assertEqual(expectVal3);
      const actVal43 = iter.next().value!;
      const expectVal4 = threeValue;
      expect(actVal43).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_3800
     * @tc.name testFloat64ArrayKeys038
     * @tc.desc Verify hex literal array keys order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const hexValueFF: number = 0xFF;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(hexValue10, hexValueFF);
      const iter = arr.keys();
      const actVal44 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal44).assertEqual(expectVal);
      const actVal45 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal45).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_3900
     * @tc.name testFloat64ArrayKeys039
     * @tc.desc Verify octal literal array keys order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(0o10, 0o77);
      const iter = arr.keys();
      const actVal46 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal46).assertEqual(expectVal);
      const actVal47 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal47).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_4000
     * @tc.name testFloat64ArrayKeys040
     * @tc.desc Verify binary literal array keys order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1010: number = 0b1010;
      const binaryValue1111: number = 0b1111;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(binaryValue1010, binaryValue1111);
      const iter = arr.keys();
      const actVal48 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal48).assertEqual(expectVal);
      const actVal49 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal49).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_4100
     * @tc.name testFloat64ArrayKeys041
     * @tc.desc Verify keys on array from Float64Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const iter = arr.keys();
      const actVal50 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal50).assertEqual(expectVal);
      const actVal51 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal51).assertEqual(expectVal2);
      const actVal52 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal52).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_4200
     * @tc.name testFloat64ArrayKeys042
     * @tc.desc Verify keys on array from FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const numbers: FixedArray<number> = [5.0, 6.0];
      const arr = new Float64Array(numbers);
      const iter = arr.keys();
      const actVal53 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal53).assertEqual(expectVal);
      const actVal54 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal54).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_4300
     * @tc.name testFloat64ArrayKeys043
     * @tc.desc Verify keys on with-replaced array index invariant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const fillValue99: number = 99.0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const replaced = arr.with(1, fillValue99);
      const iter = replaced.keys();
      const actVal55 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal55).assertEqual(expectVal);
      const actVal56 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal56).assertEqual(expectVal2);
      const actVal57 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal57).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_4400
     * @tc.name testFloat64ArrayKeys044
     * @tc.desc Verify keys on set-filled array index invariant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array(3);
      arr.set(Float64Array.of(-2147483648, -1, zeroValue));
      const iter = arr.keys();
      const actVal58 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal58).assertEqual(expectVal);
      const actVal59 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal59).assertEqual(expectVal2);
      const actVal60 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal60).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_4500
     * @tc.name testFloat64ArrayKeys045
     * @tc.desc Verify keys iterator continues after includes call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const iter = arr.keys();
      const actVal61 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal61).assertEqual(expectVal);
      arr.includes(2.0, 1);
      const actVal62 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal62).assertEqual(expectVal2);
      const actVal63 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal63).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_4600
     * @tc.name testFloat64ArrayKeys046
     * @tc.desc Verify keys iterator continues after indexOf call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const iter = arr.keys();
      const actVal64 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal64).assertEqual(expectVal);
      arr.indexOf(20.0);
      const actVal65 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal65).assertEqual(expectVal2);
      const actVal66 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal66).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_4700
     * @tc.name testFloat64ArrayKeys047
     * @tc.desc Verify keys iterator continues after lastIndexOf call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array([zeroValue, -128, zeroValue]);
      const iter = arr.keys();
      const actVal67 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal67).assertEqual(expectVal);
      arr.lastIndexOf(onePointZero);
      const actVal68 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal68).assertEqual(expectVal2);
      const actVal69 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal69).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_4800
     * @tc.name testFloat64ArrayKeys048
     * @tc.desc Verify keys iterator continues after find call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const iter = arr.keys();
      const actVal70 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal70).assertEqual(expectVal);
      arr.find((val, idx) => idx === 1);
      const actVal71 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal71).assertEqual(expectVal2);
      const actVal72 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal72).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_4900
     * @tc.name testFloat64ArrayKeys049
     * @tc.desc Verify keys iterator continues after findLast call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const iter = arr.keys();
      const actVal73 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal73).assertEqual(expectVal);
      arr.findLast((val, idx) => idx >= 1);
      const actVal74 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal74).assertEqual(expectVal2);
      const actVal75 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal75).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_5000
     * @tc.name testFloat64ArrayKeys050
     * @tc.desc Verify keys iterator continues after findLastIndex call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const iter = arr.keys();
      const actVal76 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal76).assertEqual(expectVal);
      arr.findLastIndex((_val, _idx) => _idx < 2);
      const actVal77 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal77).assertEqual(expectVal2);
      const actVal78 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal78).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_5100
     * @tc.name testFloat64ArrayKeys051
     * @tc.desc Verify keys with from static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arr = Float64Array.from(src);
      const iter = arr.keys();
      const actVal79 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal79).assertEqual(expectVal);
      const actVal80 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal80).assertEqual(expectVal2);
      const actVal81 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal81).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_5200
     * @tc.name testFloat64ArrayKeys052
     * @tc.desc Verify keys with from and mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = Float64Array.from(["1", "2", "3"], (v: string, k: number): number => {
        return parseFloat(v) * (k + 1);
      })

      const iter = arr.keys();
      const actVal82 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal82).assertEqual(expectVal);
      const actVal83 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal83).assertEqual(expectVal2);
      const actVal84 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal84).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_5300
     * @tc.name testFloat64ArrayKeys053
     * @tc.desc Verify keys with of static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const threeValue: number = 3;
      const arr = new Float64Array([-32768, -128, zeroValue, 127]);
      const iter = arr.keys();
      const actVal85 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal85).assertEqual(expectVal);
      const actVal86 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal86).assertEqual(expectVal2);
      const actVal87 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal87).assertEqual(expectVal3);
      const actVal88 = iter.next().value!;
      const expectVal4 = threeValue;
      expect(actVal88).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_5400
     * @tc.name testFloat64ArrayKeys054
     * @tc.desc Verify keys count matches length property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(5);
      const iter = arr.keys();
      let count: number = 0;
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        count = count + 1;
      }
      const expectVal = arr.length;
      expect(count).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_5500
     * @tc.name testFloat64ArrayKeys055
     * @tc.desc Verify single element keys iterator reports done after exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648);
      const iter = arr.keys();
      iter.next();
      const actVal89 = iter.next().done;
      const expectVal = true;
      expect(actVal89).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_5600
     * @tc.name testFloat64ArrayKeys056
     * @tc.desc Verify keys large array iteration count equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const thousandValue: number = 1000;
      const arr = new Float64Array(1000);
      const iter = arr.keys();
      let count: number = 0;
      while (true) {
        const r = iter.next();
        if (r.done) {
          break;
        }
        count = count + 1;
      }
      const expectVal = thousandValue;
      expect(count).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_5700
     * @tc.name testFloat64ArrayKeys057
     * @tc.desc Verify repeated next calls after exhaustion keep done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1);
      const iter = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      const actVal90 = iter.next().done;
      const expectVal = true;
      expect(actVal90).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_5800
     * @tc.name testFloat64ArrayKeys058
     * @tc.desc Verify nested key iterators do not interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(0.5, 1.5);
      const outerIter = arr.keys();
      outerIter.next();
      const innerIter = arr.keys();
      const actVal91 = innerIter.next().value!;
      const expectVal = zeroValue;
      expect(actVal91).assertEqual(expectVal);
      const actVal92 = outerIter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal92).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_5900
     * @tc.name testFloat64ArrayKeys059
     * @tc.desc Verify keys iteration during array modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const num999Pointzero: number = 999.0;
      const oneValue: number = 1;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const iter = arr.keys();
      const actVal93 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal93).assertEqual(expectVal);
      arr.$_set(1, num999Pointzero);
      const actVal94 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal94).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_6000
     * @tc.name testFloat64ArrayKeys060
     * @tc.desc Verify keys iteration during fill modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const sevenPointZero: number = 7.0;
      const arr = new Float64Array(3);
      const iter = arr.keys();
      const actVal95 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal95).assertEqual(expectVal);
      arr.fill(sevenPointZero);
      const actVal96 = arr.$_get(0);
      const expectVal2 = sevenPointZero;
      expect(actVal96).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_6100
     * @tc.name testFloat64ArrayKeys061
     * @tc.desc Verify keys iteration during reverse modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const iter = arr.keys();
      const actVal97 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal97).assertEqual(expectVal);
      arr.reverse();
      const actVal98 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal98).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_6200
     * @tc.name testFloat64ArrayKeys062
     * @tc.desc Verify keys iteration during sort modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const iter = arr.keys();
      const actVal99 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal99).assertEqual(expectVal);
      arr.sort();
      const actVal100 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal100).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_6300
     * @tc.name testFloat64ArrayKeys063
     * @tc.desc Verify keys with at validates index correspondence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(0.5, 1.5);
      const iter = arr.keys();
      const k0 = iter.next().value! as int;
      arr.at(k0);
      const expectVal = zeroValue;
      expect(k0).assertEqual(expectVal);
      const actVal101 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal101).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_6400
     * @tc.name testFloat64ArrayKeys064
     * @tc.desc Verify keys with $_get after exhaustion returns done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768]);
      const iter = arr.keys();
      iter.next();
      const outOfBounds = iter.next();
      const expectVal = true;
      expect(outOfBounds.done).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_6500
     * @tc.name testFloat64ArrayKeys065
     * @tc.desc Verify keys on sliced array index range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(-2147483648, -1, zeroValue, oneValue);
      const sliced = arr.slice(1, 3);
      const iter = sliced.keys();
      const actVal102 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal102).assertEqual(expectVal);
      const actVal103 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal103).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_6600
     * @tc.name testFloat64ArrayKeys066
     * @tc.desc Verify keys on subarray index range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = new Float64Array([0.1, 9007199254740991, zeroValue, 3.141592653589793]);
      const sub = arr.subarray(1, 3);
      const iter = sub.keys();
      const actVal104 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal104).assertEqual(expectVal);
      const actVal105 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal105).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_6700
     * @tc.name testFloat64ArrayKeys067
     * @tc.desc Verify keys on filled array index invariant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array(3);
      arr.fill(sevenPointZero);
      const iter = arr.keys();
      const actVal106 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal106).assertEqual(expectVal);
      const actVal107 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal107).assertEqual(expectVal2);
      const actVal108 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal108).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_6800
     * @tc.name testFloat64ArrayKeys068
     * @tc.desc Verify keys on reversed array index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      arr.reverse();
      const iter = arr.keys();
      const actVal109 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal109).assertEqual(expectVal);
      const actVal110 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal110).assertEqual(expectVal2);
      const actVal111 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal111).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_6900
     * @tc.name testFloat64ArrayKeys069
     * @tc.desc Verify keys on sorted array index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      arr.sort();
      const iter = arr.keys();
      const actVal112 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal112).assertEqual(expectVal);
      const actVal113 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal113).assertEqual(expectVal2);
      const actVal114 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal114).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_7000
     * @tc.name testFloat64ArrayKeys070
     * @tc.desc Verify keys on mapped array index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = new Float64Array([-2147483648, -1]);
      const mapped = arr.map((val, idx) => val + idx);
      const iter = mapped.keys();
      const actVal115 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal115).assertEqual(expectVal);
      const actVal116 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal116).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_7100
     * @tc.name testFloat64ArrayKeys071
     * @tc.desc Verify keys on filtered array index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const filtered = arr.filter((val, idx) => idx < 2);
      const iter = filtered.keys();
      const actVal117 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal117).assertEqual(expectVal);
      const actVal118 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal118).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_7200
     * @tc.name testFloat64ArrayKeys072
     * @tc.desc Verify keys with entries index consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.5, 1.5);
      const keyIter = arr.keys();
      const entryIter = arr.entries();
      const k0 = keyIter.next().value! as int;
      const e0 = entryIter.next().value!;
      const expectVal = zeroValue;
      expect(k0).assertEqual(expectVal);
      expect(e0[0]).assertEqual(k0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_7300
     * @tc.name testFloat64ArrayKeys073
     * @tc.desc Verify keys with values index-element correspondence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const keyIter = arr.keys();
      const valIter = arr.values();
      const k0 = keyIter.next().value! as int;
      const v0 = valIter.next().value!;
      const actVal119 = arr.$_get(k0);
      const expectVal = v0;
      expect(actVal119).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_7400
     * @tc.name testFloat64ArrayKeys074
     * @tc.desc Verify keys with forEach index passing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-2147483648, -1]);
      let firstIndex: number = -1;
      arr.forEach((_value, index): void => {
        if (index === 0) {
          firstIndex = index;
        }
      });
      const keys = arr.keys();
      const first = keys.next();
      const expectDone = false;
      expect(first.done).assertEqual(expectDone);
      expect(first.value).assertEqual(zeroValue);
      expect(firstIndex).assertEqual(zeroValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_7500
     * @tc.name testFloat64ArrayKeys075
     * @tc.desc Verify keys returns first index with surrounding some scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const hasSecondIndex = arr.some((_value, index): boolean => index === 1);
      const keys = arr.keys();
      const first = keys.next();
      const expectDone = false;
      expect(first.done).assertEqual(expectDone);
      expect(first.value).assertEqual(zeroValue);
      const expectFound = true;
      expect(hasSecondIndex).assertEqual(expectFound);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_7600
     * @tc.name testFloat64ArrayKeys076
     * @tc.desc Verify keys returns first index with surrounding every scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const allIndexesInRange = arr.every((_value, index): boolean => index < arr.length);
      const keys = arr.keys();
      const first = keys.next();
      const expectDone = false;
      expect(first.done).assertEqual(expectDone);
      expect(first.value).assertEqual(0);
      const expectAll = true;
      expect(allIndexesInRange).assertEqual(expectAll);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_7700
     * @tc.name testFloat64ArrayKeys077
     * @tc.desc Verify keys returns first index with surrounding findIndex scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const foundIndex = arr.findIndex((_value, index): boolean => index === oneValue);
      const keys = arr.keys();
      const first = keys.next();
      const expectDone = false;
      expect(first.done).assertEqual(expectDone);
      expect(first.value).assertEqual(zeroValue);
      expect(foundIndex).assertEqual(oneValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_7800
     * @tc.name testFloat64ArrayKeys078
     * @tc.desc Verify keys returns first index with surrounding reduce scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const indexSum = arr.reduce((prev, _curr, index) => prev + index, 0.0);
      const keys = arr.keys();
      const first = keys.next();
      const expectDone = false;
      expect(first.done).assertEqual(expectDone);
      expect(first.value).assertEqual(zeroValue);
      expect(indexSum).assertEqual(threeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_7900
     * @tc.name testFloat64ArrayKeys079
     * @tc.desc Verify keys on copyWithin transformed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const threeValue: number = 3;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
      arr.copyWithin(0, 2, 4);
      const iter = arr.keys();
      const actVal120 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal120).assertEqual(expectVal);
      const actVal121 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal121).assertEqual(expectVal2);
      const actVal122 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal122).assertEqual(expectVal3);
      const actVal123 = iter.next().value!;
      const expectVal4 = threeValue;
      expect(actVal123).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_8000
     * @tc.name testFloat64ArrayKeys080
     * @tc.desc Verify keys on toReversed array index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const reversed = arr.toReversed();
      const iter = reversed.keys();
      const actVal124 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal124).assertEqual(expectVal);
      const actVal125 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal125).assertEqual(expectVal2);
      const actVal126 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal126).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_8100
     * @tc.name testFloat64ArrayKeys081
     * @tc.desc Verify keys on toSorted array index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const sorted = arr.toSorted();
      const iter = sorted.keys();
      const actVal127 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal127).assertEqual(expectVal);
      const actVal128 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal128).assertEqual(expectVal2);
      const actVal129 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal129).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_8200
     * @tc.name testFloat64ArrayKeys082
     * @tc.desc Verify keys iterates all indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      let keys = "";
      for (const key of values.keys()) {
        keys += key;
      }
      const expectVal = "012";
      expect(keys).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_8300
     * @tc.name testFloat64ArrayKeys083
     * @tc.desc Verify keys iterates empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array();
      let count = 0;
      for (const key of values.keys()) {
        count++;
      }
      const expectVal = zeroValue;
      expect(count).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_8400
     * @tc.name testFloat64ArrayKeys084
     * @tc.desc Verify keys iterates single element returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array([0.5]);
      for (const key of values.keys()) {
        const expectVal = zeroValue;
        expect(key).assertEqual(expectVal);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_8500
     * @tc.name testFloat64ArrayKeys085
     * @tc.desc Verify keys iterates n elements returns 0 to n-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const values = new Float64Array(5);
      let count = 0;
      for (const key of values.keys()) {
        const expectVal = count;
        expect(key).assertEqual(expectVal);
        count++;
      }
      const expectVal2 = fiveValue;
      expect(count).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_8600
     * @tc.name testFloat64ArrayKeys086
     * @tc.desc Verify keys iterable can be interrupted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const values = new Float64Array([-32768, -128, 0]);
      let count = 0;
      for (const key of values.keys()) {
        count++;
        break;
      }
      const expectVal = oneValue;
      expect(count).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_8700
     * @tc.name testFloat64ArrayKeys087
     * @tc.desc Verify keys iterator negative check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const iter = arr.keys();
      const actVal130 = iter.next().value! === 0;
      const expectVal = true;
      expect(actVal130).assertEqual(expectVal);
      const actVal131 = iter.next().value! === 0;
      const expectVal2 = false;
      expect(actVal131).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_8800
     * @tc.name testFloat64ArrayKeys088
     * @tc.desc Verify keys with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const zeroValue: number = 0;
      const arr = Float64Array.of(hexValueFF, hexValueAA);
      const iter = arr.keys();
      const actVal132 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal132).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_8900
     * @tc.name testFloat64ArrayKeys089
     * @tc.desc Verify keys with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const zeroValue: number = 0;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010);
      const iter = arr.keys();
      const actVal133 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal133).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_9000
     * @tc.name testFloat64ArrayKeys090
     * @tc.desc Verify keys with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const zeroValue: number = 0;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const iter = arr.keys();
      const actVal134 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal134).assertEqual(expectVal);
      const actVal135 = Number.isNaN(arr[0]);
      const expectVal2 = true;
      expect(actVal135).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_9100
     * @tc.name testFloat64ArrayKeys091
     * @tc.desc Verify keys with Double.POSITIVE_INFINITY and Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const zeroValue: number = 0;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const iter = arr.keys();
      const actVal136 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal136).assertEqual(expectVal);
      expect(arr[0]).assertEqual(positiveInfinity);
      expect(arr[1]).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_9200
     * @tc.name testFloat64ArrayKeys092
     * @tc.desc Verify keys with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const zeroValue: number = 0;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const iter = arr.keys();
      const actVal137 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal137).assertEqual(expectVal);
      expect(arr[0]).assertEqual(doubleMinValue);
      expect(arr[1]).assertEqual(doubleMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_9300
     * @tc.name testFloat64ArrayKeys093
     * @tc.desc Verify keys on empty array returns done true without value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const iter = arr.keys();
      const r = iter.next();
      const expectDone = true;
      expect(r.done).assertEqual(expectDone);
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_9400
     * @tc.name testFloat64ArrayKeys094
     * @tc.desc Verify keys iteration with slice does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      arr.slice(1, 2);
      const iter = arr.keys();
      const actVal138 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal138).assertEqual(expectVal);
      const actVal139 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal139).assertEqual(expectVal2);
      const actVal140 = iter.next().value!;
      const expectVal3 = twoValue;
      expect(actVal140).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_9500
     * @tc.name testFloat64ArrayKeys095
     * @tc.desc Verify keys iteration during copyWithin concurrent modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
      const iter = arr.keys();
      const actVal141 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal141).assertEqual(expectVal);
      arr.copyWithin(0, 2, 4);
      const actVal142 = iter.next().value!;
      const expectVal2 = oneValue;
      expect(actVal142).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_9600
     * @tc.name testFloat64ArrayKeys096
     * @tc.desc Verify keys iteration with set concurrent modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = new Float64Array(3);
      const iter = arr.keys();
      const k0 = iter.next().value! as int;
      arr.$_set(k0, onePointZero);
      arr.$_set(1, twoPointZero);
      arr.$_set(2, threePointZero);
      const actVal143 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal143).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_9700
     * @tc.name testFloat64ArrayKeys097
     * @tc.desc Verify keys with byteLength property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twentyfourValue: number = 24;
      const arr = new Float64Array(3);
      const iter = arr.keys();
      const actVal144 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal144).assertEqual(expectVal);
      expect(arr.byteLength).assertEqual(twentyfourValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_9800
     * @tc.name testFloat64ArrayKeys098
     * @tc.desc Verify keys with BYTES_PER_ELEMENT property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const eightValue: number = 8;
      const arr = Float64Array.of(0.1);
      const iter = arr.keys();
      const actVal145 = iter.next().value!;
      const expectVal = zeroValue;
      expect(actVal145).assertEqual(expectVal);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(eightValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_KEYS_9900
     * @tc.name testFloat64ArrayKeys099
     * @tc.desc Verify keys on nonzero byteOffset view uses local zero-based indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayKeys099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Float64Array(new ArrayBuffer(40), 16, 2);
      const iter = v.keys();
      const actVal146 = iter.next().value!;
      const expectVal = 0;
      expect(actVal146).assertEqual(expectVal);
      const actVal147 = iter.next().value!;
      const expectVal2 = 1;
      expect(actVal147).assertEqual(expectVal2);
      const actVal148 = iter.next().done;
      const expectVal3 = true;
      expect(actVal148).assertEqual(expectVal3);
    });

  })
}
