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

export default function listRegExpTest() {
  describe('ListRegExpTest', () => {
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
     * @tc.name   testListRegExpTest0100
     * @tc.number SUB_ARKTS_LIST_REGEXP_0100
     * @tc.desc   Verify List RegExp constructor, add, length, get, getFirst and getLast with valid and mixed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListRegExpTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: List<RegExp> = new List<RegExp>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: List<RegExp> = new List<RegExp>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list.get(0)).assertEqual(VALID_VALUES[0]);
      expect(list.get(6).source).assertEqual(VALID_VALUES[0].source);
      expect(list.get(6).flags).assertEqual(VALID_VALUES[0].flags);
      expect(list.get(0).test('ABC')).assertTrue();
      expect(list.getFirst()).assertEqual(VALID_VALUES[0]);
      expect(list.getLast()).assertEqual(VALID_VALUES[6]);

      const mixed: List<RegExpAllValue> = new List<RegExpAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed.get(0)).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name   testListRegExpTest0200
     * @tc.number SUB_ARKTS_LIST_REGEXP_0200
     * @tc.desc   Verify List RegExp has, getIndexOf, getLastIndexOf, insert, remove and equal with reference equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListRegExpTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<RegExp> = new List<RegExp>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[0]);

      expect(list.has(VALID_VALUES[0])).assertTrue();
      expect(list.has(/abc/gi)).assertFalse();
      expect(list.getIndexOf(VALID_VALUES[0])).assertEqual(0);
      expect(list.getLastIndexOf(VALID_VALUES[0])).assertEqual(2);
      expect(list.getIndexOf(VALID_VALUES[5])).assertEqual(-1);

      list.insert(VALID_VALUES[2], 0);
      expect(list.get(0)).assertEqual(VALID_VALUES[2]);
      expect(list.length).assertEqual(4);

      expect(list.remove(VALID_VALUES[0])).assertTrue();
      expect(list.getIndexOf(VALID_VALUES[0])).assertEqual(2);
      expect(list.remove(VALID_VALUES[4])).assertFalse();

      const same: List<RegExp> = new List<RegExp>();
      same.add(VALID_VALUES[2]);
      same.add(VALID_VALUES[1]);
      same.add(VALID_VALUES[0]);
      expect(list.equal(same)).assertTrue();
      same.add(VALID_VALUES[0]);
      expect(list.equal(same)).assertFalse();
    });

    /**
     * @tc.name   testListRegExpTest0300
     * @tc.number SUB_ARKTS_LIST_REGEXP_0300
     * @tc.desc   Verify List RegExp removeByIndex, remove and getSubList independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListRegExpTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<RegExp> = new List<RegExp>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[2]);
      list.add(VALID_VALUES[3]);

      const removed: RegExp = list.removeByIndex(1);
      expect(removed).assertEqual(VALID_VALUES[1]);
      expect(list.length).assertEqual(3);

      expect(list.remove(VALID_VALUES[2])).assertTrue();
      expect(list.length).assertEqual(2);

      const src: List<RegExp> = new List<RegExp>();
      src.add(VALID_VALUES[4]);
      src.add(VALID_VALUES[5]);
      const sub: List<RegExp> = src.getSubList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub.get(0)).assertEqual(VALID_VALUES[4]);
      expect(src.length).assertEqual(2);
      sub.add(VALID_VALUES[0]);
      expect(src.length).assertEqual(2);
    });

    /**
     * @tc.name   testListRegExpTest0400
     * @tc.number SUB_ARKTS_LIST_REGEXP_0400
     * @tc.desc   Verify List RegExp set, replaceAllElements, forEach, iterator traversal and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListRegExpTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<RegExp> = new List<RegExp>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[2]);

      const old: RegExp = list.set(0, VALID_VALUES[5]);
      expect(old.source).assertEqual(VALID_VALUES[5].source);
      expect(old.flags).assertEqual(VALID_VALUES[5].flags);
      expect(list.get(0)).assertEqual(VALID_VALUES[5]);
      expect(list.length).assertEqual(2);

      list.replaceAllElements((value: RegExp): RegExp => {
        return new RegExp(value.source + 'X', value.flags);
      });
      expect(list.get(0).source).assertEqual('[ -]X');
      expect(list.get(1).source).assertEqual('^test$X');

      const sources: Array<string> = [];
      list.forEach((value: RegExp) => {
        sources.push(value.source);
      });
      expect(sources.length).assertEqual(2);
      expect(sources[0]).assertEqual('[ -]X');

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
      expect(iterValues[0]).assertEqual(list.get(0));

      const arr: Array<RegExp> = list.convertToArray();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(list.get(1));
    });

    /**
     * @tc.name   testListRegExpTest0500
     * @tc.number SUB_ARKTS_LIST_REGEXP_0500
     * @tc.desc   Verify List RegExp sort by source length plus getFirst, getLast and isEmpty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListRegExpTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<RegExp> = new List<RegExp>();
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[2]);

      list.sort((a: RegExp, b: RegExp): number => {
        return a.source.length - b.source.length;
      });
      expect(list.length).assertEqual(3);
      expect(list.has(VALID_VALUES[0])).assertTrue();
      expect(list.has(VALID_VALUES[2])).assertTrue();

      expect(list.getFirst()).assertEqual(VALID_VALUES[1]);
      expect(list.getLast()).assertEqual(VALID_VALUES[2]);
      expect(list.isEmpty()).assertFalse();
    });

    /**
     * @tc.name   testListRegExpTest0600
     * @tc.number SUB_ARKTS_LIST_REGEXP_0600
     * @tc.desc   Verify List RegExp out-of-bounds get/insert/removeByIndex behavior, empty list access and clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListRegExpTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: List<RegExp> = new List<RegExp>();
      list.add(VALID_VALUES[0]);
      expect(list.get(1)).assertUndefined();
      expect(list[1]).assertUndefined();

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
        list.insert(VALID_VALUES[1], 77);
      } catch (e) {
        insertThrew = true;
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      const empty: List<RegExp> = new List<RegExp>();
      expect(empty.getFirst()).assertUndefined();
      expect(empty.getLast()).assertUndefined();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.convertToArray().length).assertEqual(0);
    });
  });
}
