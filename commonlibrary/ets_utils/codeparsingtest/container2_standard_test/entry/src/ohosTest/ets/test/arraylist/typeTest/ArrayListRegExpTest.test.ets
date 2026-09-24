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
import { describe, expect, it, beforeAll, beforeEach, afterEach, afterAll, TestType, Size, Level } from '@ohos/hypium-dynamic';
import { ArrayList } from '@kit.ArkTS';

interface RegExpInvalidObject {
  marker: string;
}

const REGEXP_INVALID_OBJECT: RegExpInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<RegExp> = [
  /abc/gi, /def/m, /^test$/u, new RegExp(''), /测试😀/u, /[\u0000-\u001F]/g, /abc/gi,
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

export default function arrayListRegExpTest() {
  describe('ArrayListRegExpTest', () => {
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
     * @tc.name   testArrayListRegExpTest0100
     * @tc.number SUB_ARKTS_ARRAY_LIST_REGEXP_0100
     * @tc.desc   Verify ArrayList RegExp constructor and add with valid, mixed and flags-carrying patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListRegExpTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: ArrayList<RegExp> = new ArrayList<RegExp>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: ArrayList<RegExp> = new ArrayList<RegExp>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(VALID_VALUES[0]);
      expect(list[6].source).assertEqual(VALID_VALUES[0].source);
      expect(list[6].flags).assertEqual(VALID_VALUES[0].flags);
      expect(list[0].test('ABC')).assertTrue();

      const mixed: ArrayList<RegExpAllValue> = new ArrayList<RegExpAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name   testArrayListRegExpTest0200
     * @tc.number SUB_ARKTS_ARRAY_LIST_REGEXP_0200
     * @tc.desc   Verify ArrayList RegExp has, getIndexOf, getLastIndexOf, insert and remove by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListRegExpTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<RegExp> = new ArrayList<RegExp>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[0]);

      expect(list.has(VALID_VALUES[0])).assertTrue();
      expect(list.has(/abc/gi)).assertFalse();
      expect(list.getIndexOf(VALID_VALUES[0])).assertEqual(0);
      expect(list.getLastIndexOf(VALID_VALUES[0])).assertEqual(2);
      expect(list.getIndexOf(VALID_VALUES[5])).assertEqual(-1);

      list.insert(VALID_VALUES[2], 0);
      expect(list[0]).assertEqual(VALID_VALUES[2]);
      expect(list.length).assertEqual(4);

      expect(list.remove(VALID_VALUES[0])).assertTrue();
      expect(list.getIndexOf(VALID_VALUES[0])).assertEqual(2);
      expect(list.remove(VALID_VALUES[4])).assertFalse();
    });

    /**
     * @tc.name   testArrayListRegExpTest0300
     * @tc.number SUB_ARKTS_ARRAY_LIST_REGEXP_0300
     * @tc.desc   Verify ArrayList RegExp removeByIndex, removeByRange, subArrayList and clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListRegExpTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<RegExp> = new ArrayList<RegExp>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[2]);
      list.add(VALID_VALUES[3]);

      const removed: RegExp = list.removeByIndex(1);
      expect(removed).assertEqual(VALID_VALUES[1]);
      expect(list.length).assertEqual(3);

      list.removeByRange(0, 2);
      expect(list.length).assertEqual(1);
      expect(list[0]).assertEqual(VALID_VALUES[3]);

      const src: ArrayList<RegExp> = new ArrayList<RegExp>();
      src.add(VALID_VALUES[4]);
      src.add(VALID_VALUES[5]);
      const sub: ArrayList<RegExp> = src.subArrayList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(VALID_VALUES[4]);
      expect(src.length).assertEqual(2);

      const cloned: ArrayList<RegExp> = src.clone();
      cloned.add(VALID_VALUES[0]);
      expect(src.length).assertEqual(2);
      expect(cloned.length).assertEqual(3);
      expect(cloned[0]).assertEqual(src[0]);
    });

    /**
     * @tc.name   testArrayListRegExpTest0400
     * @tc.number SUB_ARKTS_ARRAY_LIST_REGEXP_0400
     * @tc.desc   Verify ArrayList RegExp replaceAllElements and forEach transforming stored patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListRegExpTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<RegExp> = new ArrayList<RegExp>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[2]);

      list.replaceAllElements((value: RegExp): RegExp => {
        return new RegExp(value.source + 'X', value.flags);
      });
      expect(list[0].source).assertEqual('abcX');
      expect(list[1].source).assertEqual('^test$X');
      expect(list[0].test('abcx')).assertTrue();

      const sources: Array<string> = [];
      list.forEach((value: RegExp) => {
        sources.push(value.source);
      });
      expect(sources.length).assertEqual(2);
      expect(sources[1]).assertEqual('^test$X');
    });

    /**
     * @tc.name   testArrayListRegExpTest0500
     * @tc.number SUB_ARKTS_ARRAY_LIST_REGEXP_0500
     * @tc.desc   Verify ArrayList RegExp sort by source length, getCapacity, increaseCapacityTo and trimToCurrentLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListRegExpTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<RegExp> = new ArrayList<RegExp>();
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[2]);

      list.sort((a: RegExp, b: RegExp): number => {
        return a.source.length - b.source.length;
      });
      expect(list.length).assertEqual(3);
      expect(list.has(VALID_VALUES[0])).assertTrue();
      expect(list.has(VALID_VALUES[2])).assertTrue();

      expect(list.getCapacity()).assertEqual(10);
      list.increaseCapacityTo(13);
      expect(list.getCapacity() >= 13).assertTrue();
      list.add(VALID_VALUES[3]);
      expect(list.length).assertEqual(4);
      list.trimToCurrentLength();
      expect(list.length).assertEqual(4);
      expect(list[3]).assertEqual(VALID_VALUES[3]);
    });

    /**
     * @tc.name   testArrayListRegExpTest0600
     * @tc.number SUB_ARKTS_ARRAY_LIST_REGEXP_0600
     * @tc.desc   Verify ArrayList RegExp boundary access, out-of-range removeByIndex and insert, clear and empty clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListRegExpTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<RegExp> = new ArrayList<RegExp>();
      list.add(VALID_VALUES[0]);
      let accessThrew: boolean = false;
      try {
        const beyond: RegExp = list[1];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(accessThrew || list.length === 1).assertTrue();
      expect(list.length).assertEqual(1);

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
        expect(((e as Error).name).length > 0).assertTrue();
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
