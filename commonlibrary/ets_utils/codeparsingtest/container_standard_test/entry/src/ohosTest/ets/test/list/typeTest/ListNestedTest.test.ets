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

interface NestedInvalidObject {
  marker: string;
}

const NESTED_INVALID_OBJECT: NestedInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<Array<number>> = [
  [1, 2, 3], [0, -1], [NaN, Infinity], new Array<number>(3), new Array<number>(),
  [Number.MAX_SAFE_INTEGER], [1, 2, 3],
];

type NestedAllValue = Array<number> | NestedInvalidObject | null | undefined;

const ALL_VALUES: Array<NestedAllValue> = [
  ...VALID_VALUES,
  [1, 2, 3], NESTED_INVALID_OBJECT, null, undefined,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function listNestedTest() {
  describe('ListNestedTest', () => {
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
     * @tc.name   testListNestedTest0100
     * @tc.number SUB_ARKTS_LIST_NESTED_0100
     * @tc.desc   Verify List array element constructor, add, length, get, getFirst and getLast with valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: List<Array<number>> = new List<Array<number>>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: List<Array<number>> = new List<Array<number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(VALID_VALUES[0]);
      expect(list.get(0)[1]).assertEqual(2);
      expect(list.get(4).length).assertEqual(0);
      expect(list.getFirst()).assertEqual(VALID_VALUES[0]);
      expect(list.getLast()).assertEqual(VALID_VALUES[6]);

      const mixed: List<NestedAllValue> = new List<NestedAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name   testListNestedTest0200
     * @tc.number SUB_ARKTS_LIST_NESTED_0200
     * @tc.desc   Verify List array element has, getIndexOf, getLastIndexOf, insert, remove and equal with reference equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Array<number>> = new List<Array<number>>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[0]);

      expect(list.has(VALID_VALUES[0])).assertTrue();
      expect(list.has(VALID_VALUES[5])).assertFalse();
      expect(list.getIndexOf(VALID_VALUES[0])).assertEqual(0);
      expect(list.getLastIndexOf(VALID_VALUES[0])).assertEqual(2);
      expect(list.getIndexOf(VALID_VALUES[5])).assertEqual(-1);

      list.insert(VALID_VALUES[2], 0);
      expect(list.get(0)).assertEqual(VALID_VALUES[2]);
      expect(list.length).assertEqual(4);

      expect(list.remove(VALID_VALUES[0])).assertTrue();
      expect(list.getIndexOf(VALID_VALUES[0])).assertEqual(2);
      expect(list.remove(VALID_VALUES[5])).assertFalse();

      const same: List<Array<number>> = new List<Array<number>>();
      same.add(VALID_VALUES[2]);
      same.add(VALID_VALUES[1]);
      same.add(VALID_VALUES[0]);
      expect(list.equal(same)).assertTrue();
      same.add(VALID_VALUES[0]);
      expect(list.equal(same)).assertFalse();
    });

    /**
     * @tc.name   testListNestedTest0300
     * @tc.number SUB_ARKTS_LIST_NESTED_0300
     * @tc.desc   Verify List array element removeByIndex, remove and getSubList independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Array<number>> = new List<Array<number>>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[2]);
      list.add(VALID_VALUES[3]);

      const removed: Array<number> = list.removeByIndex(2);
      expect(removed).assertEqual(VALID_VALUES[2]);
      expect(list.length).assertEqual(3);

      expect(list.remove(VALID_VALUES[0])).assertTrue();
      expect(list.length).assertEqual(2);

      const src: List<Array<number>> = new List<Array<number>>();
      src.add(VALID_VALUES[4]);
      src.add(VALID_VALUES[5]);
      const sub: List<Array<number>> = src.getSubList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub.get(1)[0]).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(src.length).assertEqual(2);
      sub.add(VALID_VALUES[0]);
      expect(src.length).assertEqual(2);
    });

    /**
     * @tc.name   testListNestedTest0400
     * @tc.number SUB_ARKTS_LIST_NESTED_0400
     * @tc.desc   Verify List array element set, replaceAllElements, forEach, iterator traversal and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Array<number>> = new List<Array<number>>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);

      const old: Array<number> = list.set(0, VALID_VALUES[5]);
      expect(old).assertEqual(VALID_VALUES[5]);
      expect(list.get(0)).assertEqual(VALID_VALUES[5]);
      expect(list.length).assertEqual(2);

      list.replaceAllElements((value: Array<number>): Array<number> => {
        const next: Array<number> = [];
        for (let i = 0; i < value.length; i++) {
          next.push(value[i] * 2);
        }
        return next;
      });
      expect(list.get(0)[0]).assertEqual(Number.MAX_SAFE_INTEGER * 2);
      expect(list.get(1)[0]).assertEqual(0);
      expect(list.get(1)[1]).assertEqual(-2);

      const totalLengths: Array<number> = [];
      list.forEach((value: Array<number>) => {
        totalLengths.push(value.length);
      });
      expect(totalLengths.length).assertEqual(2);
      expect(totalLengths[1]).assertEqual(2);

      let indexSum: number = 0;
      list.forEach((value: Array<number>, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(1);

      const iterValues: Array<Array<number>> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(2);
      expect(iterValues[0]).assertEqual(list.get(0));

      const arr: Array<Array<number>> = list.convertToArray();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(list.get(0));
    });

    /**
     * @tc.name   testListNestedTest0500
     * @tc.number SUB_ARKTS_LIST_NESTED_0500
     * @tc.desc   Verify List array element sort by length plus getFirst, getLast and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Array<number>> = new List<Array<number>>();
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[4]);

      list.sort((a: Array<number>, b: Array<number>): number => {
        return a.length - b.length;
      });
      expect(list.get(0).length).assertEqual(0);
      expect(list.get(2).length).assertEqual(3);

      expect(list.getFirst().length).assertEqual(0);
      expect(list.getLast().length).assertEqual(3);
      expect(list.isEmpty()).assertFalse();
    });

    /**
     * @tc.name   testListNestedTest0600
     * @tc.number SUB_ARKTS_LIST_NESTED_0600
     * @tc.desc   Verify List array element out-of-bounds get/insert/removeByIndex behavior, empty list access and clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListNestedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<Array<number>> = new List<Array<number>>();
      list.add(VALID_VALUES[0]);
      expect(list.get(1)).assertUndefined();
      expect(list[1]).assertUndefined();

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(12);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(VALID_VALUES[1], 21);
      } catch (e) {
        insertThrew = true;
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      const empty: List<Array<number>> = new List<Array<number>>();
      expect(empty.getFirst()).assertUndefined();
      expect(empty.getLast()).assertUndefined();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.convertToArray().length).assertEqual(0);
    });
  });
}
