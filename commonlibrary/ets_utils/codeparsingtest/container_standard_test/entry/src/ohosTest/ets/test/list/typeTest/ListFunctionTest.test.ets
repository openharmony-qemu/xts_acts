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
import { List } from '@kit.ArkTS';

interface FunctionInvalidObject {
  marker: string;
}

const FUNCTION_INVALID_OBJECT: FunctionInvalidObject = { marker: 'invalid' };

type ListFunctionItem = (value: number) => number;

const FUNCTION_A: ListFunctionItem = (value: number): number => value + 1;
const FUNCTION_B: ListFunctionItem = (value: number): number => value + 2;
const FUNCTION_C: ListFunctionItem = (value: number): number => value + 3;
const FUNCTION_D: ListFunctionItem = (value: number): number => value * value;
const FUNCTION_E: ListFunctionItem = (value: number): number => Math.max(value, 0);
const FUNCTION_F: ListFunctionItem = (value: number): number => value - 100.5;

const VALID_VALUES: Array<ListFunctionItem> = [
  FUNCTION_A, FUNCTION_B, FUNCTION_C, FUNCTION_D, FUNCTION_E, FUNCTION_F, FUNCTION_A,
];

type FunctionInvalidValue = number | string | null | undefined | FunctionInvalidObject | Array<number>;
type FunctionAllValue = ListFunctionItem | FunctionInvalidValue;

const ALL_VALUES: Array<FunctionAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, FUNCTION_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function listFunctionTest() {
  describe('ListFunctionTest', () => {
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
     * @tc.name   testListFunctionTest0100
     * @tc.number SUB_ARKTS_LIST_FUNCTION_0100
     * @tc.desc   Verify List function constructor, add, length, get, getFirst and getLast with valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListFunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: List<ListFunctionItem> = new List<ListFunctionItem>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: List<ListFunctionItem> = new List<ListFunctionItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(FUNCTION_A);
      expect(list.get(6)).assertEqual(FUNCTION_A);
      expect(list.get(0)(1)).assertEqual(2);
      expect(list.get(3)(3)).assertEqual(9);
      expect(list.getFirst()).assertEqual(FUNCTION_A);
      expect(list.getLast()).assertEqual(FUNCTION_A);

      const mixed: List<FunctionAllValue> = new List<FunctionAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(FUNCTION_A);
    });

    /**
     * @tc.name   testListFunctionTest0200
     * @tc.number SUB_ARKTS_LIST_FUNCTION_0200
     * @tc.desc   Verify List function has, getIndexOf, getLastIndexOf, insert, remove and equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListFunctionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListFunctionItem> = new List<ListFunctionItem>();
      list.add(FUNCTION_A);
      list.add(FUNCTION_B);
      list.add(FUNCTION_A);

      expect(list.has(FUNCTION_A)).assertTrue();
      expect(list.has(FUNCTION_C)).assertFalse();
      expect(list.getIndexOf(FUNCTION_A)).assertEqual(0);
      expect(list.getLastIndexOf(FUNCTION_A)).assertEqual(2);
      expect(list.getIndexOf(FUNCTION_D)).assertEqual(-1);

      list.insert(FUNCTION_E, 0);
      expect(list.get(0)).assertEqual(FUNCTION_E);
      expect(list.length).assertEqual(4);

      expect(list.remove(FUNCTION_A)).assertTrue();
      expect(list.getIndexOf(FUNCTION_A)).assertEqual(2);
      expect(list.remove(FUNCTION_F)).assertFalse();

      const same: List<ListFunctionItem> = new List<ListFunctionItem>();
      same.add(FUNCTION_E);
      same.add(FUNCTION_B);
      same.add(FUNCTION_A);
      expect(list.equal(same)).assertTrue();
      same.add(FUNCTION_A);
      expect(list.equal(same)).assertFalse();
    });

    /**
     * @tc.name   testListFunctionTest0300
     * @tc.number SUB_ARKTS_LIST_FUNCTION_0300
     * @tc.desc   Verify List function removeByIndex, remove, getSubList independence and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListFunctionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListFunctionItem> = new List<ListFunctionItem>();
      list.add(FUNCTION_A);
      list.add(FUNCTION_B);
      list.add(FUNCTION_C);
      list.add(FUNCTION_D);

      const removed: ListFunctionItem = list.removeByIndex(3);
      expect(removed).assertEqual(FUNCTION_D);
      expect(list.length).assertEqual(3);

      expect(list.remove(FUNCTION_C)).assertTrue();
      expect(list.length).assertEqual(2);

      const src: List<ListFunctionItem> = new List<ListFunctionItem>();
      src.add(FUNCTION_E);
      src.add(FUNCTION_F);
      const sub: List<ListFunctionItem> = src.getSubList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub.get(1)).assertEqual(FUNCTION_F);
      expect(src.length).assertEqual(2);
      sub.add(FUNCTION_A);
      expect(src.length).assertEqual(2);

      const arr: Array<ListFunctionItem> = src.convertToArray();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(FUNCTION_E);
    });

    /**
     * @tc.name   testListFunctionTest0400
     * @tc.number SUB_ARKTS_LIST_FUNCTION_0400
     * @tc.desc   Verify List function set, replaceAllElements, forEach invocation and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListFunctionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListFunctionItem> = new List<ListFunctionItem>();
      list.add(FUNCTION_A);
      list.add(FUNCTION_B);
      list.add(FUNCTION_C);

      const old: ListFunctionItem = list.set(1, FUNCTION_E);
      expect(old).assertEqual(FUNCTION_E);
      expect(list.get(1)).assertEqual(FUNCTION_E);
      expect(list.length).assertEqual(3);

      list.replaceAllElements((value: ListFunctionItem): ListFunctionItem => {
        return FUNCTION_D;
      });
      expect(list.get(0)(2)).assertEqual(4);
      expect(list.get(2)(3)).assertEqual(9);

      const results: Array<number> = [];
      list.forEach((value: ListFunctionItem) => {
        results.push(value(3));
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual(9);

      let indexSum: number = 0;
      list.forEach((value: ListFunctionItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<ListFunctionItem> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[0]).assertEqual(FUNCTION_D);
    });

    /**
     * @tc.name   testListFunctionTest0500
     * @tc.number SUB_ARKTS_LIST_FUNCTION_0500
     * @tc.desc   Verify List function sort by invocation result plus getFirst, getLast and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListFunctionItem> = new List<ListFunctionItem>();
      list.add(FUNCTION_A);
      list.add(FUNCTION_E);
      list.add(FUNCTION_F);

      list.sort((a: ListFunctionItem, b: ListFunctionItem): number => {
        return a(0) - b(0);
      });
      expect(list.length).assertEqual(3);
      expect(list.has(FUNCTION_A)).assertTrue();
      expect(list.has(FUNCTION_E)).assertTrue();
      expect(list.has(FUNCTION_F)).assertTrue();

      expect(list.getFirst()(0)).assertEqual(-100.5);
      expect(list.getLast()(0)).assertEqual(1);
      expect(list.isEmpty()).assertFalse();
    });

    /**
     * @tc.name   testListFunctionTest0600
     * @tc.number SUB_ARKTS_LIST_FUNCTION_0600
     * @tc.desc   Verify List function out-of-bounds get/insert/removeByIndex behavior, empty list access and clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListFunctionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<ListFunctionItem> = new List<ListFunctionItem>();
      list.add(FUNCTION_A);
      expect(list.get(1)).assertUndefined();
      expect(list[1]).assertUndefined();

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
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      const empty: List<ListFunctionItem> = new List<ListFunctionItem>();
      expect(empty.getFirst()).assertUndefined();
      expect(empty.getLast()).assertUndefined();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.convertToArray().length).assertEqual(0);
    });
  });
}
