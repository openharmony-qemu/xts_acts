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

interface SetInvalidObject {
  marker: string;
}

const SET_INVALID_OBJECT: SetInvalidObject = { marker: 'invalid' };

const SET_A: Set<number> = new Set<number>([1]);
const SET_B: Set<number> = new Set<number>([2]);
const SET_C: Set<number> = new Set<number>([3]);
const SET_D: Set<number> = new Set<number>([0, -1]);
const SET_E: Set<number> = new Set<number>([NaN, Infinity]);
const SET_F: Set<number> = new Set<number>([Number.MAX_SAFE_INTEGER]);
const SET_G: Set<number> = new Set<number>();

const VALID_VALUES: Array<Set<number>> = [SET_A, SET_B, SET_C, SET_D, SET_E, SET_F, SET_G, SET_A];

type SetInvalidValue = string | number | null | undefined | SetInvalidObject | Array<number>;
type SetAllValue = Set<number> | SetInvalidValue;

const ALL_VALUES: Array<SetAllValue> = [
  ...VALID_VALUES,
  '1', 123, null, undefined, SET_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function dequeSetTest() {
  describe('DequeSetTest', () => {
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
     * @tc.name   testDequeSetTest0100
     * @tc.number SUB_ARKTS_DEQUE_SET_0100
     * @tc.desc   Test Deque constructor and insertEnd with Set items and mixed invalid values, verifying length, element access, empty-set size, and getFirst/getLast.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeSetTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Deque<Set<number>> = new Deque<Set<number>>();
      expect(empty.length).assertEqual(0);

      const list: Deque<Set<number>> = new Deque<Set<number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        list.insertEnd(VALID_VALUES[i]);
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(SET_A);
      expect(list[7]).assertEqual(SET_A);
      expect(list[6].size).assertEqual(0);
      expect(list.getFirst()).assertEqual(SET_A);
      expect(list.getLast()).assertEqual(SET_A);

      const mixed: Deque<SetAllValue> = new Deque<SetAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        mixed.insertEnd(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(SET_A);
    });

    /**
     * @tc.name   testDequeSetTest0200
     * @tc.number SUB_ARKTS_DEQUE_SET_0200
     * @tc.desc   Test insertFront/insertEnd ordering, getFirst/getLast, has() by reference identity, and single-element Set deque behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeSetTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Set<number>> = new Deque<Set<number>>();
      list.insertEnd(SET_A);
      list.insertEnd(SET_B);
      list.insertFront(SET_C);
      list.insertEnd(SET_A);

      expect(list.length).assertEqual(4);
      expect(list[0]).assertEqual(SET_C);
      expect(list.getFirst()).assertEqual(SET_C);
      expect(list.getLast()).assertEqual(SET_A);
      expect(list.has(SET_A)).assertTrue();
      expect(list.has(SET_B)).assertTrue();
      expect(list.has(new Set<number>([1]))).assertFalse();

      const single: Deque<Set<number>> = new Deque<Set<number>>();
      single.insertFront(SET_D);
      expect(single.getFirst()).assertEqual(SET_D);
      expect(single.getLast()).assertEqual(SET_D);
    });

    /**
     * @tc.name   testDequeSetTest0300
     * @tc.number SUB_ARKTS_DEQUE_SET_0300
     * @tc.desc   Test popFirst/popLast removal from both ends including single-element deques, verifying returned Set objects and length updates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeSetTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Set<number>> = new Deque<Set<number>>();
      list.insertEnd(SET_A);
      list.insertEnd(SET_B);
      list.insertEnd(SET_C);
      list.insertEnd(SET_D);

      const first: Set<number> = list.popFirst();
      expect(first).assertEqual(SET_A);
      expect(list.length).assertEqual(3);
      expect(list.getFirst()).assertEqual(SET_B);

      const last: Set<number> = list.popLast();
      expect(last).assertEqual(SET_D);
      expect(list.length).assertEqual(2);
      expect(list.getLast()).assertEqual(SET_C);

      const single: Deque<Set<number>> = new Deque<Set<number>>();
      single.insertEnd(SET_E);
      expect(single.popFirst()).assertEqual(SET_E);
      expect(single.length).assertEqual(0);

      single.insertEnd(SET_F);
      expect(single.popLast()).assertEqual(SET_F);
      expect(single.length).assertEqual(0);
    });

    /**
     * @tc.name   testDequeSetTest0400
     * @tc.number SUB_ARKTS_DEQUE_SET_0400
     * @tc.desc   Test forEach callback with value and index, Symbol.iterator traversal, and for-of iteration over a Set deque.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeSetTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Set<number>> = new Deque<Set<number>>();
      list.insertEnd(SET_A);
      list.insertEnd(SET_B);
      list.insertEnd(SET_C);

      const visited: Array<Set<number>> = [];
      list.forEach((value: Set<number>) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(SET_A);
      expect(visited[2]).assertEqual(SET_C);

      let indexSum: number = 0;
      list.forEach((value: Set<number>, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<Set<number>> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<Set<number>> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(SET_B);

      let forOfCount: number = 0;
      for (const value of list) {
        if (value === SET_B) {
          forOfCount += 1;
        }
      }
      expect(forOfCount).assertEqual(1);
    });

    /**
     * @tc.name   testDequeSetTest0500
     * @tc.number SUB_ARKTS_DEQUE_SET_0500
     * @tc.desc   Test indexed element access on a Set deque including boundary, out-of-range, undefined results, and Set size verification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeSetTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Set<number>> = new Deque<Set<number>>();
      list.insertEnd(SET_A);
      list.insertEnd(SET_B);
      list.insertEnd(SET_C);
      list.insertFront(SET_D);

      expect(list[0]).assertEqual(SET_D);
      expect(list[1]).assertEqual(SET_A);
      expect(list[3]).assertEqual(SET_C);
      expect(list[list.length - 1]).assertEqual(SET_C);
      let oobThrew: boolean = false;
      try {
        const oob: SetAllValue | undefined = list[list.length];
      } catch (e) {
        oobThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(oobThrew).assertTrue();
      let farThrew: boolean = false;
      try {
        const far: SetAllValue | undefined = list[66];
      } catch (e) {
        farThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(farThrew).assertTrue();
      expect(list[0].size).assertEqual(2);
    });

    /**
     * @tc.name   testDequeSetTest0600
     * @tc.number SUB_ARKTS_DEQUE_SET_0600
     * @tc.desc   Test out-of-bounds index access, popFirst throwing on an empty deque, and empty deque iteration/forEach behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeSetTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Set<number>> = new Deque<Set<number>>();
      list.insertEnd(SET_A);
      list.insertEnd(SET_B);
      let t2: boolean = false;
      try {
        const v2: SetAllValue | undefined = list[2];
      } catch (e) {
        t2 = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(t2).assertTrue();
      let negThrew: boolean = false;
      try {
        const v_neg: SetAllValue | undefined = list[-1];
      } catch (e) {
        negThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(negThrew).assertTrue();
      expect(list.length).assertEqual(2);

      const empty: Deque<Set<number>> = new Deque<Set<number>>();
      const popped: SetAllValue | undefined = empty.popFirst();
      expect(popped).assertUndefined();
      expect(empty.length).assertEqual(0);

      while (list.length > 0) {
        list.popFirst();
      }
      expect(list.length).assertEqual(0);
      let emptyIdxThrew: boolean = false;
      try {
        const v0: SetAllValue | undefined = list[0];
      } catch (e) {
        emptyIdxThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(emptyIdxThrew).assertTrue();

      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      let visitedCount: number = 0;
      list.forEach((value: Set<number>) => {
        visitedCount += 1;
      });
      expect(visitedCount).assertEqual(0);
    });
  });
}
