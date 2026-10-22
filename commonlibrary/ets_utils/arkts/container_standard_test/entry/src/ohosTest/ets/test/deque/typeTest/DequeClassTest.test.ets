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

interface ClassInvalidObject {
  marker: string;
}

const CLASS_INVALID_OBJECT: ClassInvalidObject = { marker: 'invalid' };

class DequeClassItem {
  id: number;
  label: string;

  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

const CLASS_A = new DequeClassItem(1, '测试');
const CLASS_B = new DequeClassItem(0, '');
const CLASS_C = new DequeClassItem(-1, '测试😀');
const CLASS_D = new DequeClassItem(Number.MAX_SAFE_INTEGER, 'a'.repeat(100));
const CLASS_E = new DequeClassItem(13800138000, '13800138000');
const CLASS_F = new DequeClassItem(99999999, '<script>alert(1)</script>');

const VALID_VALUES: Array<DequeClassItem> = [CLASS_A, CLASS_B, CLASS_C, CLASS_D, CLASS_E, CLASS_F, CLASS_A];

type ClassInvalidValue = number | string | null | undefined | ClassInvalidObject | Array<number>;
type ClassAllValue = DequeClassItem | ClassInvalidValue;

const ALL_VALUES: Array<ClassAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, CLASS_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function dequeClassTest() {
  describe('DequeClassTest', () => {
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
     * @tc.name   testDequeClassTest0100
     * @tc.number SUB_ARKTS_DEQUE_CLASS_0100
     * @tc.desc   Verify Deque class instance insertEnd of valid and mixed values, length, element access and getFirst/getLast.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeClassTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Deque<DequeClassItem> = new Deque<DequeClassItem>();
      expect(empty.length).assertEqual(0);

      const list: Deque<DequeClassItem> = new Deque<DequeClassItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        list.insertEnd(VALID_VALUES[i]);
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(CLASS_A);
      expect(list[6]).assertEqual(CLASS_A);
      expect(list[3].label.length).assertEqual(100);
      expect(list.getFirst()).assertEqual(CLASS_A);
      expect(list.getLast()).assertEqual(CLASS_A);

      const mixed: Deque<ClassAllValue> = new Deque<ClassAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        mixed.insertEnd(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(CLASS_A);
    });

    /**
     * @tc.name   testDequeClassTest0200
     * @tc.number SUB_ARKTS_DEQUE_CLASS_0200
     * @tc.desc   Verify Deque class instance insertFront/insertEnd ordering, getFirst/getLast and has reference lookup including non-identical equal object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeClassTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeClassItem> = new Deque<DequeClassItem>();
      list.insertEnd(CLASS_A);
      list.insertEnd(CLASS_B);
      list.insertFront(CLASS_C);
      list.insertEnd(CLASS_A);

      expect(list.length).assertEqual(4);
      expect(list[0]).assertEqual(CLASS_C);
      expect(list.getFirst()).assertEqual(CLASS_C);
      expect(list.getLast()).assertEqual(CLASS_A);
      expect(list.has(CLASS_A)).assertTrue();
      expect(list.has(CLASS_B)).assertTrue();
      expect(list.has(new DequeClassItem(1, '测试'))).assertFalse();

      const single: Deque<DequeClassItem> = new Deque<DequeClassItem>();
      single.insertFront(CLASS_D);
      expect(single.getFirst()).assertEqual(CLASS_D);
      expect(single.getLast()).assertEqual(CLASS_D);
    });

    /**
     * @tc.name   testDequeClassTest0300
     * @tc.number SUB_ARKTS_DEQUE_CLASS_0300
     * @tc.desc   Verify Deque class instance popFirst and popLast return the correct object references and update length on multi and single element deques.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeClassTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeClassItem> = new Deque<DequeClassItem>();
      list.insertEnd(CLASS_A);
      list.insertEnd(CLASS_B);
      list.insertEnd(CLASS_C);
      list.insertEnd(CLASS_D);

      const first: DequeClassItem = list.popFirst();
      expect(first).assertEqual(CLASS_A);
      expect(list.length).assertEqual(3);
      expect(list.getFirst()).assertEqual(CLASS_B);

      const last: DequeClassItem = list.popLast();
      expect(last).assertEqual(CLASS_D);
      expect(list.length).assertEqual(2);
      expect(list.getLast()).assertEqual(CLASS_C);

      const single: Deque<DequeClassItem> = new Deque<DequeClassItem>();
      single.insertEnd(CLASS_E);
      expect(single.popFirst()).assertEqual(CLASS_E);
      expect(single.length).assertEqual(0);

      single.insertEnd(CLASS_F);
      expect(single.popLast()).assertEqual(CLASS_F);
      expect(single.length).assertEqual(0);
    });

    /**
     * @tc.name   testDequeClassTest0400
     * @tc.number SUB_ARKTS_DEQUE_CLASS_0400
     * @tc.desc   Verify Deque class instance forEach callback, Symbol.iterator traversal and for-of iteration visit all elements in order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeClassTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeClassItem> = new Deque<DequeClassItem>();
      list.insertEnd(CLASS_A);
      list.insertEnd(CLASS_B);
      list.insertEnd(CLASS_C);

      const visited: Array<DequeClassItem> = [];
      list.forEach((value: DequeClassItem) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(CLASS_A);
      expect(visited[2]).assertEqual(CLASS_C);

      let idSum: number = 0;
      list.forEach((value: DequeClassItem, index?: number) => {
        idSum += value.id + (index ?? 0) * 0;
      });
      expect(idSum).assertEqual(0);

      const iterValues: Array<DequeClassItem> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<DequeClassItem> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(CLASS_B);

      let forOfCount: number = 0;
      for (const value of list) {
        if (value === CLASS_B) {
          forOfCount += 1;
        }
      }
      expect(forOfCount).assertEqual(1);
    });

    /**
     * @tc.name   testDequeClassTest0500
     * @tc.number SUB_ARKTS_DEQUE_CLASS_0500
     * @tc.desc   Verify Deque class instance index element access including boundary, out-of-range undefined results and property reads on stored objects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeClassTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeClassItem> = new Deque<DequeClassItem>();
      list.insertEnd(CLASS_A);
      list.insertEnd(CLASS_B);
      list.insertEnd(CLASS_C);
      list.insertFront(CLASS_D);

      expect(list[0]).assertEqual(CLASS_D);
      expect(list[1]).assertEqual(CLASS_A);
      expect(list[3]).assertEqual(CLASS_C);
      expect(list[list.length - 1]).assertEqual(CLASS_C);
      let oobThrew: boolean = false;
      try {
        const oob: DequeClassItem | undefined = list[list.length];
      } catch (e) {
        oobThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(oobThrew).assertTrue();
      let farThrew: boolean = false;
      try {
        const far: DequeClassItem | undefined = list[99];
      } catch (e) {
        farThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(farThrew).assertTrue();
      expect(list[0].id).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.name   testDequeClassTest0600
     * @tc.number SUB_ARKTS_DEQUE_CLASS_0600
     * @tc.desc   Verify Deque class instance out-of-range access is undefined, popFirst on empty deque throws, and empty deque iteration/forEach visit nothing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeClassTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeClassItem> = new Deque<DequeClassItem>();
      list.insertEnd(CLASS_A);
      list.insertEnd(CLASS_B);
      let t2: boolean = false;
      try {
        const v2: DequeClassItem | undefined = list[2];
      } catch (e) {
        t2 = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(t2).assertTrue();
      let negThrew: boolean = false;
      try {
        const v_neg: DequeClassItem | undefined = list[-1];
      } catch (e) {
        negThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(negThrew).assertTrue();
      expect(list.length).assertEqual(2);

      const empty: Deque<DequeClassItem> = new Deque<DequeClassItem>();
      const popped: DequeClassItem | undefined = empty.popFirst();
      expect(popped).assertUndefined();
      expect(empty.length).assertEqual(0);

      while (list.length > 0) {
        list.popFirst();
      }
      expect(list.length).assertEqual(0);
      let emptyIdxThrew: boolean = false;
      try {
        const v0: DequeClassItem | undefined = list[0];
      } catch (e) {
        emptyIdxThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(emptyIdxThrew).assertTrue();

      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      let visitedCount: number = 0;
      list.forEach((value: DequeClassItem) => {
        visitedCount += 1;
      });
      expect(visitedCount).assertEqual(0);
    });
  });
}
