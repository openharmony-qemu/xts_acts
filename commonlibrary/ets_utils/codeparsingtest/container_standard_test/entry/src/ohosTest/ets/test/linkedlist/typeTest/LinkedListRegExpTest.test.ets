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
import { LinkedList } from '@kit.ArkTS';

interface RegExpInvalidObject {
  marker: string;
}

const REGEXP_INVALID_OBJECT: RegExpInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<RegExp> = [
  /abc/gi, /def/m, /^test$/u, new RegExp(''), /测试😀/u, /[ -]/g, /abc/gi,
];

type RegExpInvalidValue = string | number | null | undefined | RegExpInvalidObject | Array<number>;
type RegExpAllValue = RegExp | RegExpInvalidValue;

const ALL_VALUES: Array<RegExpAllValue> = [
  ...VALID_VALUES,
  'abc', 123, null, undefined, REGEXP_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function linkedListRegExpTest() {
  describe('LinkedListRegExpTest', () => {
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
     * @tc.name   testLinkedListRegExpTest0100
     * @tc.number SUB_ARKTS_LINKED_LIST_REGEXP_0100
     * @tc.desc   Verify LinkedList RegExp constructor length, add, get and test method of stored regexes with valid, boundary and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListRegExpTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: LinkedList<RegExp> = new LinkedList<RegExp>();
      expect(empty.length).assertEqual(0);

      const list: LinkedList<RegExp> = new LinkedList<RegExp>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(VALID_VALUES[0]);
      expect(list.get(6).source).assertEqual(VALID_VALUES[0].source);
      expect(list.get(6).flags).assertEqual(VALID_VALUES[0].flags);
      expect(list.get(0).test('ABC')).assertTrue();

      const mixed: LinkedList<RegExpAllValue> = new LinkedList<RegExpAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name   testLinkedListRegExpTest0200
     * @tc.number SUB_ARKTS_LINKED_LIST_REGEXP_0200
     * @tc.desc   Verify LinkedList RegExp addFirst, has, getIndexOf, getLastIndexOf and insert operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListRegExpTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<RegExp> = new LinkedList<RegExp>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[0]);

      list.addFirst(VALID_VALUES[2]);
      expect(list.get(0)).assertEqual(VALID_VALUES[2]);
      expect(list.length).assertEqual(4);

      expect(list.has(VALID_VALUES[0])).assertTrue();
      expect(list.has(/abc/gi)).assertFalse();
      expect(list.getIndexOf(VALID_VALUES[0])).assertEqual(1);
      expect(list.getLastIndexOf(VALID_VALUES[0])).assertEqual(3);
      expect(list.getIndexOf(VALID_VALUES[5])).assertEqual(-1);

      list.insert(0, VALID_VALUES[3]);
      expect(list.get(0)).assertEqual(VALID_VALUES[3]);
      expect(list.length).assertEqual(5);
    });

    /**
     * @tc.name   testLinkedListRegExpTest0300
     * @tc.number SUB_ARKTS_LINKED_LIST_REGEXP_0300
     * @tc.desc   Verify LinkedList RegExp removeByIndex, remove, removeFirst, removeLast, removeFirstFound and removeLastFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListRegExpTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<RegExp> = new LinkedList<RegExp>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[2]);
      list.add(VALID_VALUES[3]);

      const removed: RegExp = list.removeByIndex(1);
      expect(removed).assertEqual(VALID_VALUES[1]);
      expect(list.length).assertEqual(3);

      expect(list.remove(VALID_VALUES[0])).assertTrue();
      expect(list.get(0)).assertEqual(VALID_VALUES[2]);
      expect(list.remove(VALID_VALUES[4])).assertFalse();

      const first: RegExp = list.removeFirst();
      expect(first).assertEqual(VALID_VALUES[2]);
      expect(list.length).assertEqual(1);

      const last: RegExp = list.removeLast();
      expect(last).assertEqual(VALID_VALUES[3]);
      expect(list.length).assertEqual(0);

      const dupList: LinkedList<RegExp> = new LinkedList<RegExp>();
      dupList.add(VALID_VALUES[5]);
      dupList.add(VALID_VALUES[4]);
      dupList.add(VALID_VALUES[5]);
      dupList.add(VALID_VALUES[5]);
      expect(dupList.removeFirstFound(VALID_VALUES[5])).assertTrue();
      expect(dupList.get(0)).assertEqual(VALID_VALUES[4]);
      expect(dupList.length).assertEqual(3);
      expect(dupList.removeLastFound(VALID_VALUES[5])).assertTrue();
      expect(dupList.getLastIndexOf(VALID_VALUES[5])).assertEqual(1);
      expect(dupList.length).assertEqual(2);
    });

    /**
     * @tc.name   testLinkedListRegExpTest0400
     * @tc.number SUB_ARKTS_LINKED_LIST_REGEXP_0400
     * @tc.desc   Verify LinkedList RegExp set, clone, convertToArray, forEach callback and iterator traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListRegExpTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<RegExp> = new LinkedList<RegExp>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[2]);

      const old: RegExp = list.set(1, VALID_VALUES[5]);
      expect(old.source).assertEqual(VALID_VALUES[5].source);
      expect(old.flags).assertEqual(VALID_VALUES[5].flags);
      expect(list.get(1).source).assertEqual(VALID_VALUES[5].source);
      expect(list.length).assertEqual(2);

      const cloned: LinkedList<RegExp> = list.clone();
      cloned.add(VALID_VALUES[4]);
      expect(list.length).assertEqual(2);
      expect(cloned.length).assertEqual(3);
      expect(cloned.get(0)).assertEqual(list.get(0));

      const arr: Array<RegExp> = list.convertToArray();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(VALID_VALUES[0]);
      expect(arr instanceof Array).assertTrue();

      const sources: Array<string> = [];
      list.forEach((value: RegExp) => {
        sources.push(value.source);
      });
      expect(sources.length).assertEqual(2);
      expect(sources[1]).assertEqual(VALID_VALUES[5].source);

      let indexSum: number = 0;
      list.forEach((value: RegExp, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(1);

      const iterValues: Array<RegExp> = [];
      for (const value of list) {
        iterValues.push(value);
      }
      expect(iterValues.length).assertEqual(2);
      expect(iterValues[1]).assertEqual(list.get(1));
    });

    /**
     * @tc.name   testLinkedListRegExpTest0500
     * @tc.number SUB_ARKTS_LINKED_LIST_REGEXP_0500
     * @tc.desc   Verify LinkedList RegExp getFirst, getLast, get and undefined result on out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListRegExpTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<RegExp> = new LinkedList<RegExp>();
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[2]);

      expect(list.getFirst()).assertEqual(VALID_VALUES[1]);
      expect(list.getLast()).assertEqual(VALID_VALUES[2]);
      expect(list.get(0)).assertEqual(VALID_VALUES[1]);
      expect(list.get(list.length - 1)).assertEqual(VALID_VALUES[2]);
      expect(list.get(1)).assertEqual(VALID_VALUES[0]);

      const single: LinkedList<RegExp> = new LinkedList<RegExp>();
      single.add(VALID_VALUES[3]);
      expect(single.getFirst()).assertEqual(VALID_VALUES[3]);
      expect(single.getLast()).assertEqual(VALID_VALUES[3]);

      expect(list.get(list.length)).assertUndefined();
      expect(list.get(77)).assertUndefined();
    });

    /**
     * @tc.name   testLinkedListRegExpTest0600
     * @tc.number SUB_ARKTS_LINKED_LIST_REGEXP_0600
     * @tc.desc   Verify LinkedList RegExp removeByIndex exception on invalid index, insert out-of-bounds no-op and clear behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLinkedListRegExpTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: LinkedList<RegExp> = new LinkedList<RegExp>();
      list.add(VALID_VALUES[0]);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(15);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(77, VALID_VALUES[1]);
      } catch (e) {
        insertThrew = true;
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.getFirst()).assertUndefined();
      expect(list.getLast()).assertUndefined();
      expect(list.clone().length).assertEqual(0);
    });
  });
}
