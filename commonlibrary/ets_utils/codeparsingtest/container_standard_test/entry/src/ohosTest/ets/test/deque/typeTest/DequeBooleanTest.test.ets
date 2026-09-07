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

interface BooleanInvalidObject {
  marker: string;
}

const BOOLEAN_INVALID_OBJECT: BooleanInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<boolean> = [true, false, true, false];

type BooleanInvalidValue = number | string | null | undefined | BooleanInvalidObject | Array<number>;
type BooleanAllValue = boolean | BooleanInvalidValue;

const ALL_VALUES: Array<BooleanAllValue> = [
  ...VALID_VALUES,
  1, 0, NaN, 'true', 'false', null, undefined, '', BOOLEAN_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function dequeBooleanTest() {
  describe('DequeBooleanTest', () => {
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
     * @tc.name   testDequeBooleanTest0100
     * @tc.number SUB_ARKTS_DEQUE_BOOLEAN_0100
     * @tc.desc   Verify Deque boolean constructor length, insertEnd of valid and mixed values, element access and getFirst/getLast.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeBooleanTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Deque<boolean> = new Deque<boolean>();
      expect(empty.length).assertEqual(0);

      const list: Deque<boolean> = new Deque<boolean>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        list.insertEnd(VALID_VALUES[i]);
      }
      expect(list.length).assertEqual(4);
      expect(list[0]).assertTrue();
      expect(list[1]).assertFalse();
      expect(list[2]).assertTrue();
      expect(list.getFirst()).assertTrue();
      expect(list.getLast()).assertFalse();

      const mixed: Deque<BooleanAllValue> = new Deque<BooleanAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        mixed.insertEnd(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[4]).assertEqual(1);
    });

    /**
     * @tc.name   testDequeBooleanTest0200
     * @tc.number SUB_ARKTS_DEQUE_BOOLEAN_0200
     * @tc.desc   Verify Deque boolean insertFront/insertEnd ordering, getFirst/getLast and has lookup on multi and single element deques.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeBooleanTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<boolean> = new Deque<boolean>();
      list.insertEnd(true);
      list.insertEnd(false);
      list.insertFront(false);
      list.insertFront(true);

      expect(list.length).assertEqual(4);
      expect(list[0]).assertTrue();
      expect(list[3]).assertFalse();
      expect(list.getFirst()).assertTrue();
      expect(list.getLast()).assertFalse();
      expect(list.has(true)).assertTrue();
      expect(list.has(false)).assertTrue();

      const single: Deque<boolean> = new Deque<boolean>();
      single.insertFront(true);
      expect(single.getFirst()).assertTrue();
      expect(single.getLast()).assertTrue();
      expect(single.has(true)).assertTrue();
      expect(single.has(false)).assertFalse();
    });

    /**
     * @tc.name   testDequeBooleanTest0300
     * @tc.number SUB_ARKTS_DEQUE_BOOLEAN_0300
     * @tc.desc   Verify Deque boolean popFirst and popLast remove the correct elements and update length on multi and single element deques.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeBooleanTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<boolean> = new Deque<boolean>();
      list.insertEnd(true);
      list.insertEnd(false);
      list.insertEnd(true);

      const first: boolean = list.popFirst();
      expect(first).assertTrue();
      expect(list.length).assertEqual(2);
      expect(list.getFirst()).assertFalse();

      const last: boolean = list.popLast();
      expect(last).assertTrue();
      expect(list.length).assertEqual(1);
      expect(list.getLast()).assertFalse();

      const single: Deque<boolean> = new Deque<boolean>();
      single.insertEnd(false);
      expect(single.popFirst()).assertFalse();
      expect(single.length).assertEqual(0);

      single.insertEnd(true);
      expect(single.popLast()).assertTrue();
      expect(single.length).assertEqual(0);
    });

    /**
     * @tc.name   testDequeBooleanTest0400
     * @tc.number SUB_ARKTS_DEQUE_BOOLEAN_0400
     * @tc.desc   Verify Deque boolean forEach callback, Symbol.iterator traversal and for-of iteration visit all elements in order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeBooleanTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<boolean> = new Deque<boolean>();
      list.insertEnd(true);
      list.insertEnd(false);
      list.insertEnd(true);

      const visited: Array<boolean> = [];
      list.forEach((value: boolean) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertTrue();
      expect(visited[1]).assertFalse();

      let trueCount: number = 0;
      list.forEach((value: boolean, index?: number) => {
        if (value && (index ?? 0) >= 0) {
          trueCount += 1;
        }
      });
      expect(trueCount).assertEqual(2);

      const iterValues: Array<boolean> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<boolean> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[2]).assertTrue();

      let forOfTrueCount: number = 0;
      for (const value of list) {
        if (value) {
          forOfTrueCount += 1;
        }
      }
      expect(forOfTrueCount).assertEqual(2);
    });

    /**
     * @tc.name   testDequeBooleanTest0500
     * @tc.number SUB_ARKTS_DEQUE_BOOLEAN_0500
     * @tc.desc   Verify Deque boolean index element access including boundary, out-of-range and undefined results on repeated values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeBooleanTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<boolean> = new Deque<boolean>();
      list.insertEnd(false);
      list.insertEnd(true);
      list.insertFront(true);

      expect(list[0]).assertTrue();
      expect(list[1]).assertFalse();
      expect(list[2]).assertTrue();
      expect(list[list.length - 1]).assertTrue();
      let endThrew: boolean = false;
      try {
        const end: boolean | undefined = list[list.length];
      } catch (e) {
        endThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(endThrew).assertTrue();
      expect(list.length).assertEqual(3);
      let farThrew: boolean = false;
      try {
        const far: boolean | undefined = list[10];
      } catch (e) {
        farThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(farThrew).assertTrue();
      expect(list.length).assertEqual(3);

      const repeated: Deque<boolean> = new Deque<boolean>();
      repeated.insertEnd(true);
      repeated.insertEnd(true);
      repeated.insertEnd(false);
      repeated.insertEnd(true);
      repeated.insertEnd(false);
      expect(repeated.length).assertEqual(5);
      expect(repeated[0]).assertTrue();
      expect(repeated[4]).assertFalse();
    });

    /**
     * @tc.name   testDequeBooleanTest0600
     * @tc.number SUB_ARKTS_DEQUE_BOOLEAN_0600
     * @tc.desc   Verify Deque boolean out-of-range access is undefined, popFirst on empty deque throws, and empty deque iteration/forEach visit nothing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeBooleanTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<boolean> = new Deque<boolean>();
      list.insertEnd(true);
      let endThrew: boolean = false;
      try {
        const end: boolean | undefined = list[1];
      } catch (e) {
        endThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(endThrew).assertTrue();
      expect(list.length).assertEqual(1);
      let negThrew: boolean = false;
      try {
        const neg: boolean | undefined = list[-1];
      } catch (e) {
        negThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(negThrew).assertTrue();
      expect(list.length).assertEqual(1);

      const empty: Deque<boolean> = new Deque<boolean>();
      const popped: boolean | undefined = empty.popFirst();
      expect(popped).assertUndefined();
      expect(empty.length).assertEqual(0);

      while (list.length > 0) {
        list.popFirst();
      }
      expect(list.length).assertEqual(0);
      let emptyIdxThrew: boolean = false;
      try {
        const v0: boolean | undefined = list[0];
      } catch (e) {
        emptyIdxThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(emptyIdxThrew).assertTrue();

      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      let visitedCount: number = 0;
      list.forEach((value: boolean) => {
        visitedCount += 1;
      });
      expect(visitedCount).assertEqual(0);
    });
  });
}
