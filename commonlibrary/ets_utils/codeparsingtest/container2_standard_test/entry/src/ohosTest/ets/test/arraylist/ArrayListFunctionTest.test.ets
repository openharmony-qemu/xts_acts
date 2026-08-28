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
import { describe, expect, it, beforeAll, beforeEach, afterEach, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { ArrayList } from '@kit.ArkTS';

interface FunctionInvalidObject {
  marker: string;
}

const FUNCTION_INVALID_OBJECT: FunctionInvalidObject = { marker: 'invalid' };

type ArrayFunctionItem = (value: number) => number;

const FUNCTION_A: ArrayFunctionItem = (value: number): number => value + 1;
const FUNCTION_B: ArrayFunctionItem = (value: number): number => value + 2;
const FUNCTION_C: ArrayFunctionItem = (value: number): number => value + 3;
const FUNCTION_D: ArrayFunctionItem = (value: number): number => value * value;
const FUNCTION_E: ArrayFunctionItem = (value: number): number => Math.max(value, 0);
const FUNCTION_F: ArrayFunctionItem = (value: number): number => value - 100.5;

const VALID_VALUES: Array<ArrayFunctionItem> = [
  FUNCTION_A, FUNCTION_B, FUNCTION_C, FUNCTION_D, FUNCTION_E, FUNCTION_F, FUNCTION_A,
];

type FunctionInvalidValue = number | string | null | undefined | FunctionInvalidObject | Array<number>;
type FunctionAllValue = ArrayFunctionItem | FunctionInvalidValue;

const ALL_VALUES: Array<FunctionAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, FUNCTION_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function arrayListFunctionTest() {
  describe('ArrayListFunctionTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.name   testArrayListFunctionTest0100
     * @tc.number SUB_ARKTS_ARRAY_LIST_FUNCTION_0100
     * @tc.desc   Verify ArrayList function constructor and add with valid and mixed function values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListFunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: ArrayList<ArrayFunctionItem> = new ArrayList<ArrayFunctionItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: ArrayList<ArrayFunctionItem> = new ArrayList<ArrayFunctionItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(FUNCTION_A);
      expect(list[6]).assertEqual(FUNCTION_A);
      expect(list[0](1)).assertEqual(2);
      expect(list[3](3)).assertEqual(9);

      const mixed: ArrayList<FunctionAllValue> = new ArrayList<FunctionAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(FUNCTION_A);
    });

    /**
     * @tc.name   testArrayListFunctionTest0200
     * @tc.number SUB_ARKTS_ARRAY_LIST_FUNCTION_0200
     * @tc.desc   Verify ArrayList function has, getIndexOf, getLastIndexOf, insert and remove by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListFunctionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayFunctionItem> = new ArrayList<ArrayFunctionItem>();
      list.add(FUNCTION_A);
      list.add(FUNCTION_B);
      list.add(FUNCTION_A);

      expect(list.has(FUNCTION_A)).assertTrue();
      expect(list.has(FUNCTION_C)).assertFalse();
      expect(list.getIndexOf(FUNCTION_A)).assertEqual(0);
      expect(list.getLastIndexOf(FUNCTION_A)).assertEqual(2);
      expect(list.getIndexOf(FUNCTION_D)).assertEqual(-1);

      list.insert(FUNCTION_E, 0);
      expect(list[0]).assertEqual(FUNCTION_E);
      expect(list.length).assertEqual(4);

      expect(list.remove(FUNCTION_A)).assertTrue();
      expect(list.getIndexOf(FUNCTION_A)).assertEqual(2);
      expect(list.remove(FUNCTION_F)).assertFalse();
    });

    /**
     * @tc.name   testArrayListFunctionTest0300
     * @tc.number SUB_ARKTS_ARRAY_LIST_FUNCTION_0300
     * @tc.desc   Verify ArrayList function removeByIndex, removeByRange, subArrayList, clone and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListFunctionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayFunctionItem> = new ArrayList<ArrayFunctionItem>();
      list.add(FUNCTION_A);
      list.add(FUNCTION_B);
      list.add(FUNCTION_C);
      list.add(FUNCTION_D);

      const removed: ArrayFunctionItem = list.removeByIndex(3);
      expect(removed).assertEqual(FUNCTION_D);
      expect(list.length).assertEqual(3);

      list.removeByRange(0, 2);
      expect(list.length).assertEqual(1);
      expect(list[0]).assertEqual(FUNCTION_C);

      const src: ArrayList<ArrayFunctionItem> = new ArrayList<ArrayFunctionItem>();
      src.add(FUNCTION_E);
      src.add(FUNCTION_F);
      const sub: ArrayList<ArrayFunctionItem> = src.subArrayList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[1]).assertEqual(FUNCTION_F);
      expect(src.length).assertEqual(2);

      const cloned: ArrayList<ArrayFunctionItem> = src.clone();
      cloned.add(FUNCTION_A);
      expect(src.length).assertEqual(2);
      expect(cloned.length).assertEqual(3);

      const arr: Array<ArrayFunctionItem> = src.convertToArray();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(FUNCTION_E);
    });

    /**
     * @tc.name   testArrayListFunctionTest0400
     * @tc.number SUB_ARKTS_ARRAY_LIST_FUNCTION_0400
     * @tc.desc   Verify ArrayList function replaceAllElements and forEach invoking stored functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListFunctionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayFunctionItem> = new ArrayList<ArrayFunctionItem>();
      list.add(FUNCTION_A);
      list.add(FUNCTION_B);
      list.add(FUNCTION_C);

      list.replaceAllElements((value: ArrayFunctionItem): ArrayFunctionItem => {
        return FUNCTION_D;
      });
      expect(list[0]).assertEqual(FUNCTION_D);
      expect(list[0](2)).assertEqual(4);
      expect(list[2]).assertEqual(FUNCTION_D);

      const results: Array<number> = [];
      list.forEach((value: ArrayFunctionItem) => {
        results.push(value(3));
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual(9);
    });

    /**
     * @tc.name   testArrayListFunctionTest0500
     * @tc.number SUB_ARKTS_ARRAY_LIST_FUNCTION_0500
     * @tc.desc   Verify ArrayList function sort by return value, getCapacity, increaseCapacityTo and trimToCurrentLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayFunctionItem> = new ArrayList<ArrayFunctionItem>();
      list.add(FUNCTION_A);
      list.add(FUNCTION_E);
      list.add(FUNCTION_F);

      list.sort((a: ArrayFunctionItem, b: ArrayFunctionItem): number => {
        return a(0) - b(0);
      });
      expect(list.length).assertEqual(3);
      expect(list.has(FUNCTION_A)).assertTrue();
      expect(list.has(FUNCTION_E)).assertTrue();
      expect(list.has(FUNCTION_F)).assertTrue();

      expect(list.getCapacity()).assertEqual(10);
      list.increaseCapacityTo(14);
      expect(list.getCapacity() >= 14).assertTrue();
      list.trimToCurrentLength();
      expect(list.length).assertEqual(3);
    });

    /**
     * @tc.name   testArrayListFunctionTest0600
     * @tc.number SUB_ARKTS_ARRAY_LIST_FUNCTION_0600
     * @tc.desc   Verify ArrayList function boundary access, out-of-range removeByIndex and insert, clear and empty clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListFunctionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<ArrayFunctionItem> = new ArrayList<ArrayFunctionItem>();
      list.add(FUNCTION_A);
      let accessThrew: boolean = false;
      try {
        const beyond: ArrayFunctionItem = list[1];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(accessThrew || list.length === 1).assertTrue();
      expect(list.length).assertEqual(1);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(6);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(FUNCTION_B, 11);
      } catch (e) {
        insertThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.clone().length).assertEqual(0);
    });
  });
}
