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

export default function dequeNestedTest() {
  describe('DequeNestedTest', () => {
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
     * @tc.name   testDequeNestedTest0100
     * @tc.number SUB_ARKTS_DEQUE_NESTED_0100
     * @tc.desc   Verify Deque array construction, insertEnd of valid/mixed arrays and nested element access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeNestedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Deque<Array<number>> = new Deque<Array<number>>();
      expect(empty.length).assertEqual(0);

      const list: Deque<Array<number>> = new Deque<Array<number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        list.insertEnd(VALID_VALUES[i]);
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(VALID_VALUES[0]);
      expect(list[0][1]).assertEqual(2);
      expect(list[4].length).assertEqual(0);
      expect(list.getFirst()).assertEqual(VALID_VALUES[0]);
      expect(list.getLast().length).assertEqual(VALID_VALUES[0].length);
      expect(list.getLast()[0]).assertEqual(VALID_VALUES[0][0]);

      const mixed: Deque<NestedAllValue> = new Deque<NestedAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        mixed.insertEnd(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name   testDequeNestedTest0200
     * @tc.number SUB_ARKTS_DEQUE_NESTED_0200
     * @tc.desc   Verify Deque array insertEnd/insertFront ordering and reference-based has lookup rejecting equal-content arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeNestedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Array<number>> = new Deque<Array<number>>();
      list.insertEnd(VALID_VALUES[0]);
      list.insertEnd(VALID_VALUES[1]);
      list.insertFront(VALID_VALUES[2]);
      list.insertEnd(VALID_VALUES[0]);

      expect(list.length).assertEqual(4);
      expect(list[0]).assertEqual(VALID_VALUES[2]);
      expect(list.getFirst()).assertEqual(VALID_VALUES[2]);
      expect(list.getLast().length).assertEqual(VALID_VALUES[0].length);
      expect(list.getLast()[0]).assertEqual(VALID_VALUES[0][0]);
      expect(list.has(VALID_VALUES[0])).assertTrue();
      expect(list.has(VALID_VALUES[5])).assertFalse();
      expect(list.has([1, 2, 3])).assertFalse();

      const single: Deque<Array<number>> = new Deque<Array<number>>();
      single.insertFront(VALID_VALUES[3]);
      expect(single.getFirst()).assertEqual(VALID_VALUES[3]);
      expect(single.getLast()).assertEqual(VALID_VALUES[3]);
    });

    /**
     * @tc.name   testDequeNestedTest0300
     * @tc.number SUB_ARKTS_DEQUE_NESTED_0300
     * @tc.desc   Verify Deque array popFirst/popLast behavior including single-element deque
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeNestedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Array<number>> = new Deque<Array<number>>();
      list.insertEnd(VALID_VALUES[0]);
      list.insertEnd(VALID_VALUES[1]);
      list.insertEnd(VALID_VALUES[2]);
      list.insertEnd(VALID_VALUES[3]);

      const first: Array<number> = list.popFirst();
      expect(first).assertEqual(VALID_VALUES[0]);
      expect(list.length).assertEqual(3);
      expect(list.getFirst()).assertEqual(VALID_VALUES[1]);

      const last: Array<number> = list.popLast();
      expect(last).assertEqual(VALID_VALUES[3]);
      expect(list.length).assertEqual(2);
      expect(list.getLast()).assertEqual(VALID_VALUES[2]);

      const single: Deque<Array<number>> = new Deque<Array<number>>();
      single.insertEnd(VALID_VALUES[5]);
      expect(single.popFirst()).assertEqual(VALID_VALUES[5]);
      expect(single.length).assertEqual(0);

      single.insertEnd(VALID_VALUES[4]);
      expect(single.popLast()).assertEqual(VALID_VALUES[4]);
      expect(single.length).assertEqual(0);
    });

    /**
     * @tc.name   testDequeNestedTest0400
     * @tc.number SUB_ARKTS_DEQUE_NESTED_0400
     * @tc.desc   Verify Deque array forEach with index, Symbol.iterator traversal and for-of counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeNestedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Array<number>> = new Deque<Array<number>>();
      list.insertEnd(VALID_VALUES[0]);
      list.insertEnd(VALID_VALUES[1]);
      list.insertEnd(VALID_VALUES[2]);

      const visited: Array<Array<number>> = [];
      list.forEach((value: Array<number>) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(VALID_VALUES[0]);
      expect(visited[2]).assertEqual(VALID_VALUES[2]);

      let indexSum: number = 0;
      list.forEach((value: Array<number>, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<Array<number>> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<Array<number>> = iter.next();
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
     * @tc.name   testDequeNestedTest0500
     * @tc.number SUB_ARKTS_DEQUE_NESTED_0500
     * @tc.desc   Verify Deque array index access within bounds, undefined beyond length and nested array length access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeNestedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Array<number>> = new Deque<Array<number>>();
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
        const oob: NestedAllValue | undefined = list[list.length];
      } catch (e) {
        oobThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(oobThrew).assertTrue();
      let farThrew: boolean = false;
      try {
        const far: NestedAllValue | undefined = list[55];
      } catch (e) {
        farThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(farThrew).assertTrue();
      expect(list[0].length).assertEqual(3);
    });

    /**
     * @tc.name   testDequeNestedTest0600
     * @tc.number SUB_ARKTS_DEQUE_NESTED_0600
     * @tc.desc   Verify Deque array out-of-range index access, popFirst on empty deque throwing, and empty iteration behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeNestedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Array<number>> = new Deque<Array<number>>();
      list.insertEnd(VALID_VALUES[0]);
      list.insertEnd(VALID_VALUES[1]);
      let t2: boolean = false;
      try {
        const v2: NestedAllValue | undefined = list[2];
      } catch (e) {
        t2 = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(t2).assertTrue();
      let negThrew: boolean = false;
      try {
        const v_neg: NestedAllValue | undefined = list[-1];
      } catch (e) {
        negThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(negThrew).assertTrue();
      expect(list.length).assertEqual(2);

      const empty: Deque<Array<number>> = new Deque<Array<number>>();
      const popped: NestedAllValue | undefined = empty.popFirst();
      expect(popped).assertUndefined();
      expect(empty.length).assertEqual(0);

      while (list.length > 0) {
        list.popFirst();
      }
      expect(list.length).assertEqual(0);
      let emptyIdxThrew: boolean = false;
      try {
        const v0: NestedAllValue | undefined = list[0];
      } catch (e) {
        emptyIdxThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(emptyIdxThrew).assertTrue();

      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      let visitedCount: number = 0;
      list.forEach((value: Array<number>) => {
        visitedCount += 1;
      });
      expect(visitedCount).assertEqual(0);
    });
  });
}
