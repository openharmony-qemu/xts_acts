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
import { Deque } from '@kit.ArkTS';

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

export default function dequeRegExpTest() {
  describe('DequeRegExpTest', () => {
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
     * @tc.name   testDequeRegExpTest0100
     * @tc.number SUB_ARKTS_DEQUE_REGEXP_0100
     * @tc.desc   Verify Deque constructor and insertEnd with RegExp items and mixed invalid values, verifying length, element access, regex matching, and getFirst/getLast.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeRegExpTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Deque<RegExp> = new Deque<RegExp>();
      expect(empty.length).assertEqual(0);

      const list: Deque<RegExp> = new Deque<RegExp>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        list.insertEnd(VALID_VALUES[i]);
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(VALID_VALUES[0]);
      expect(list[6].source).assertEqual(VALID_VALUES[0].source);
      expect(list[6].flags).assertEqual(VALID_VALUES[0].flags);
      expect(list[0].test('ABC')).assertTrue();
      expect(list.getFirst()).assertEqual(VALID_VALUES[0]);
      expect(list.getLast().source).assertEqual(VALID_VALUES[0].source);
      expect(list.getLast().flags).assertEqual(VALID_VALUES[0].flags);

      const mixed: Deque<RegExpAllValue> = new Deque<RegExpAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        mixed.insertEnd(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name   testDequeRegExpTest0200
     * @tc.number SUB_ARKTS_DEQUE_REGEXP_0200
     * @tc.desc   Verify insertFront/insertEnd ordering, getFirst/getLast, has() by reference identity, and single-element RegExp deque behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeRegExpTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<RegExp> = new Deque<RegExp>();
      list.insertEnd(VALID_VALUES[0]);
      list.insertEnd(VALID_VALUES[1]);
      list.insertFront(VALID_VALUES[2]);
      list.insertEnd(VALID_VALUES[0]);

      expect(list.length).assertEqual(4);
      expect(list[0]).assertEqual(VALID_VALUES[2]);
      expect(list.getFirst()).assertEqual(VALID_VALUES[2]);
      expect(list.getLast().source).assertEqual(VALID_VALUES[0].source);
      expect(list.getLast().flags).assertEqual(VALID_VALUES[0].flags);
      expect(list.has(VALID_VALUES[0])).assertTrue();
      expect(list.has(VALID_VALUES[3])).assertFalse();
      expect(list.has(/abc/gi)).assertFalse();

      const single: Deque<RegExp> = new Deque<RegExp>();
      single.insertFront(VALID_VALUES[4]);
      expect(single.getFirst()).assertEqual(VALID_VALUES[4]);
      expect(single.getLast()).assertEqual(VALID_VALUES[4]);
    });

    /**
     * @tc.name   testDequeRegExpTest0300
     * @tc.number SUB_ARKTS_DEQUE_REGEXP_0300
     * @tc.desc   Verify popFirst/popLast removal from both ends including single-element deques, verifying returned RegExp objects and length updates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeRegExpTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<RegExp> = new Deque<RegExp>();
      list.insertEnd(VALID_VALUES[0]);
      list.insertEnd(VALID_VALUES[1]);
      list.insertEnd(VALID_VALUES[2]);
      list.insertEnd(VALID_VALUES[3]);

      const first: RegExp = list.popFirst();
      expect(first).assertEqual(VALID_VALUES[0]);
      expect(list.length).assertEqual(3);
      expect(list.getFirst()).assertEqual(VALID_VALUES[1]);

      const last: RegExp = list.popLast();
      expect(last).assertEqual(VALID_VALUES[3]);
      expect(list.length).assertEqual(2);
      expect(list.getLast()).assertEqual(VALID_VALUES[2]);

      const single: Deque<RegExp> = new Deque<RegExp>();
      single.insertEnd(VALID_VALUES[5]);
      expect(single.popFirst()).assertEqual(VALID_VALUES[5]);
      expect(single.length).assertEqual(0);

      single.insertEnd(VALID_VALUES[6]);
      expect(single.popLast()).assertEqual(VALID_VALUES[6]);
      expect(single.length).assertEqual(0);
    });

    /**
     * @tc.name   testDequeRegExpTest0400
     * @tc.number SUB_ARKTS_DEQUE_REGEXP_0400
     * @tc.desc   Verify forEach callback with value and index, Symbol.iterator traversal, and for-of iteration over a RegExp deque.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeRegExpTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<RegExp> = new Deque<RegExp>();
      list.insertEnd(VALID_VALUES[0]);
      list.insertEnd(VALID_VALUES[1]);
      list.insertEnd(VALID_VALUES[2]);

      const visited: Array<RegExp> = [];
      list.forEach((value: RegExp) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(VALID_VALUES[0]);
      expect(visited[2]).assertEqual(VALID_VALUES[2]);

      let indexSum: number = 0;
      list.forEach((value: RegExp, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<RegExp> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<RegExp> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(VALID_VALUES[1]);

      let forOfCount: number = 0;
      for (const value of list) {
        if (value === VALID_VALUES[1]) {
          forOfCount += 1;
        }
      }
      expect(forOfCount).assertEqual(1);
    });

    /**
     * @tc.name   testDequeRegExpTest0500
     * @tc.number SUB_ARKTS_DEQUE_REGEXP_0500
     * @tc.desc   Verify indexed element access on a RegExp deque including boundary, out-of-range, undefined results, and regex matching on stored elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeRegExpTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<RegExp> = new Deque<RegExp>();
      list.insertEnd(VALID_VALUES[0]);
      list.insertEnd(VALID_VALUES[1]);
      list.insertEnd(VALID_VALUES[2]);
      list.insertFront(VALID_VALUES[3]);

      expect(list[0]).assertEqual(VALID_VALUES[3]);
      expect(list[1]).assertEqual(VALID_VALUES[0]);
      expect(list[3]).assertEqual(VALID_VALUES[2]);
      expect(list[list.length - 1]).assertEqual(VALID_VALUES[2]);
      let oobThrew: boolean = false;
      try {
        const oob: RegExp | undefined = list[list.length];
      } catch (e) {
        oobThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(oobThrew).assertTrue();
      let farThrew: boolean = false;
      try {
        const far: RegExp | undefined = list[33];
      } catch (e) {
        farThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(farThrew).assertTrue();
      expect(list[1].source).assertEqual('abc');
    });

    /**
     * @tc.name   testDequeRegExpTest0600
     * @tc.number SUB_ARKTS_DEQUE_REGEXP_0600
     * @tc.desc   Verify out-of-bounds index access, popFirst throwing on an empty deque, and empty deque iteration/forEach behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeRegExpTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<RegExp> = new Deque<RegExp>();
      list.insertEnd(VALID_VALUES[0]);
      list.insertEnd(VALID_VALUES[1]);
      let t2: boolean = false;
      try {
        const v2: RegExp | undefined = list[2];
      } catch (e) {
        t2 = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(t2).assertTrue();
      let negThrew: boolean = false;
      try {
        const v_neg: RegExp | undefined = list[-1];
      } catch (e) {
        negThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(negThrew).assertTrue();
      expect(list.length).assertEqual(2);

      const empty: Deque<RegExp> = new Deque<RegExp>();
      const popped: RegExp | undefined = empty.popFirst();
      expect(popped).assertUndefined();
      expect(empty.length).assertEqual(0);

      while (list.length > 0) {
        list.popFirst();
      }
      expect(list.length).assertEqual(0);
      let emptyIdxThrew: boolean = false;
      try {
        const v0: RegExp | undefined = list[0];
      } catch (e) {
        emptyIdxThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(emptyIdxThrew).assertTrue();

      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      let visitedCount: number = 0;
      list.forEach((value: RegExp) => {
        visitedCount += 1;
      });
      expect(visitedCount).assertEqual(0);
    });
  });
}
