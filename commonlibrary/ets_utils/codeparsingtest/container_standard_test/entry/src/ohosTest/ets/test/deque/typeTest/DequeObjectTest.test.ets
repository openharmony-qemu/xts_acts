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

interface DequeObjectItem {
  id: number;
  label: string;
  name?: string;
  age?: number;
  grade?: number;
  className?: string;
  extra?: number;
}

interface ObjectInvalidObject {
  marker: string;
}

const OBJECT_INVALID_OBJECT: ObjectInvalidObject = { marker: 'invalid' };

const OBJECT_A: DequeObjectItem = { id: 1, label: '', name: '测试', age: 20 };
const OBJECT_B: DequeObjectItem = { id: 2, label: '测试😀', grade: 3, className: 'A' };
const OBJECT_C: DequeObjectItem = { id: 3, label: 'a'.repeat(100), extra: Number.MAX_SAFE_INTEGER };
const OBJECT_D: DequeObjectItem = { id: 4, label: '13800138000', name: '138****8000' };
const OBJECT_E: DequeObjectItem = { id: 5, label: 'test@example.com' };
const OBJECT_F: DequeObjectItem = { id: 6, label: 'https://test.com', grade: -1 };

const VALID_VALUES: Array<DequeObjectItem> = [OBJECT_A, OBJECT_B, OBJECT_C, OBJECT_D, OBJECT_E, OBJECT_F, OBJECT_A];

type ObjectAllValue = DequeObjectItem | number | string | null | undefined | ObjectInvalidObject;

const ALL_VALUES: Array<ObjectAllValue> = [
  ...VALID_VALUES,
  123, 'test', null, undefined, OBJECT_INVALID_OBJECT,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function dequeObjectTest() {
  describe('DequeObjectTest', () => {
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
     * @tc.name   testDequeObjectTest0100
     * @tc.number SUB_ARKTS_DEQUE_OBJECT_0100
     * @tc.desc   Verify Deque constructor and insertEnd with object items and mixed invalid values, verifying length, element access, and getFirst/getLast.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Deque<DequeObjectItem> = new Deque<DequeObjectItem>();
      expect(empty.length).assertEqual(0);

      const list: Deque<DequeObjectItem> = new Deque<DequeObjectItem>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        list.insertEnd(VALID_VALUES[i]);
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(OBJECT_A);
      expect(list[6]).assertEqual(OBJECT_A);
      expect(list[2].label.length).assertEqual(100);
      expect(list.getFirst()).assertEqual(OBJECT_A);
      expect(list.getLast()).assertEqual(OBJECT_A);

      const mixed: Deque<ObjectAllValue> = new Deque<ObjectAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        mixed.insertEnd(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(OBJECT_A);
    });

    /**
     * @tc.name   testDequeObjectTest0200
     * @tc.number SUB_ARKTS_DEQUE_OBJECT_0200
     * @tc.desc   Verify insertFront/insertEnd ordering, getFirst/getLast, has() by reference identity, and single-element object deque behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeObjectItem> = new Deque<DequeObjectItem>();
      list.insertEnd(OBJECT_A);
      list.insertEnd(OBJECT_B);
      list.insertFront(OBJECT_C);
      list.insertEnd(OBJECT_A);

      expect(list.length).assertEqual(4);
      expect(list[0]).assertEqual(OBJECT_C);
      expect(list.getFirst()).assertEqual(OBJECT_C);
      expect(list.getLast()).assertEqual(OBJECT_A);
      expect(list.has(OBJECT_A)).assertTrue();
      expect(list.has(OBJECT_B)).assertTrue();
      expect(list.has({ id: 1, label: '', name: '测试', age: 20 })).assertFalse();

      const single: Deque<DequeObjectItem> = new Deque<DequeObjectItem>();
      single.insertFront(OBJECT_D);
      expect(single.getFirst()).assertEqual(OBJECT_D);
      expect(single.getLast()).assertEqual(OBJECT_D);
    });

    /**
     * @tc.name   testDequeObjectTest0300
     * @tc.number SUB_ARKTS_DEQUE_OBJECT_0300
     * @tc.desc   Verify popFirst/popLast removal from both ends including single-element deques, verifying returned objects and length updates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeObjectItem> = new Deque<DequeObjectItem>();
      list.insertEnd(OBJECT_A);
      list.insertEnd(OBJECT_B);
      list.insertEnd(OBJECT_C);
      list.insertEnd(OBJECT_D);

      const first: DequeObjectItem = list.popFirst();
      expect(first).assertEqual(OBJECT_A);
      expect(list.length).assertEqual(3);
      expect(list.getFirst()).assertEqual(OBJECT_B);

      const last: DequeObjectItem = list.popLast();
      expect(last).assertEqual(OBJECT_D);
      expect(list.length).assertEqual(2);
      expect(list.getLast()).assertEqual(OBJECT_C);

      const single: Deque<DequeObjectItem> = new Deque<DequeObjectItem>();
      single.insertEnd(OBJECT_E);
      expect(single.popFirst()).assertEqual(OBJECT_E);
      expect(single.length).assertEqual(0);

      single.insertEnd(OBJECT_F);
      expect(single.popLast()).assertEqual(OBJECT_F);
      expect(single.length).assertEqual(0);
    });

    /**
     * @tc.name   testDequeObjectTest0400
     * @tc.number SUB_ARKTS_DEQUE_OBJECT_0400
     * @tc.desc   Verify forEach callback with value and index, Symbol.iterator traversal, and for-of iteration over an object deque.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeObjectItem> = new Deque<DequeObjectItem>();
      list.insertEnd(OBJECT_A);
      list.insertEnd(OBJECT_B);
      list.insertEnd(OBJECT_C);

      const visited: Array<DequeObjectItem> = [];
      list.forEach((value: DequeObjectItem) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(OBJECT_A);
      expect(visited[2]).assertEqual(OBJECT_C);

      let indexSum: number = 0;
      list.forEach((value: DequeObjectItem, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<DequeObjectItem> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<DequeObjectItem> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(OBJECT_B);

      let forOfCount: number = 0;
      for (const value of list) {
        if (value === OBJECT_B) {
          forOfCount += 1;
        }
      }
      expect(forOfCount).assertEqual(1);
    });

    /**
     * @tc.name   testDequeObjectTest0500
     * @tc.number SUB_ARKTS_DEQUE_OBJECT_0500
     * @tc.desc   Verify indexed element access on an object deque including boundary, out-of-range, undefined results, and property access.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeObjectItem> = new Deque<DequeObjectItem>();
      list.insertEnd(OBJECT_A);
      list.insertEnd(OBJECT_B);
      list.insertEnd(OBJECT_C);
      list.insertFront(OBJECT_D);

      expect(list[0]).assertEqual(OBJECT_D);
      expect(list[1]).assertEqual(OBJECT_A);
      expect(list[3]).assertEqual(OBJECT_C);
      expect(list[list.length - 1]).assertEqual(OBJECT_C);
      let oobThrew: boolean = false;
      try {
        const oob: DequeObjectItem | undefined = list[list.length];
      } catch (e) {
        oobThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(oobThrew).assertTrue();
      let farThrew: boolean = false;
      try {
        const far: DequeObjectItem | undefined = list[44];
      } catch (e) {
        farThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(farThrew).assertTrue();
      expect(list[0].id).assertEqual(4);
    });

    /**
     * @tc.name   testDequeObjectTest0600
     * @tc.number SUB_ARKTS_DEQUE_OBJECT_0600
     * @tc.desc   Verify out-of-bounds index access, popFirst throwing on an empty deque, and empty deque iteration/forEach behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeObjectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<DequeObjectItem> = new Deque<DequeObjectItem>();
      list.insertEnd(OBJECT_A);
      list.insertEnd(OBJECT_B);
      let t2: boolean = false;
      try {
        const v2: DequeObjectItem | undefined = list[2];
      } catch (e) {
        t2 = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(t2).assertTrue();
      let negThrew: boolean = false;
      try {
        const v_neg: DequeObjectItem | undefined = list[-1];
      } catch (e) {
        negThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(negThrew).assertTrue();
      expect(list.length).assertEqual(2);

      const empty: Deque<DequeObjectItem> = new Deque<DequeObjectItem>();
      const popped: DequeObjectItem | undefined = empty.popFirst();
      expect(popped).assertUndefined();
      expect(empty.length).assertEqual(0);

      while (list.length > 0) {
        list.popFirst();
      }
      expect(list.length).assertEqual(0);
      let emptyIdxThrew: boolean = false;
      try {
        const v0: DequeObjectItem | undefined = list[0];
      } catch (e) {
        emptyIdxThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(emptyIdxThrew).assertTrue();

      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      let visitedCount: number = 0;
      list.forEach((value: DequeObjectItem) => {
        visitedCount += 1;
      });
      expect(visitedCount).assertEqual(0);
    });
  });
}
