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

interface MapInvalidObject {
  marker: string;
}

const MAP_INVALID_OBJECT: MapInvalidObject = { marker: 'invalid' };

const MAP_A: Map<string, number> = new Map<string, number>();
const MAP_B: Map<string, number> = new Map<string, number>();
const MAP_C: Map<string, number> = new Map<string, number>();
const MAP_D: Map<string, number> = new Map<string, number>();
const MAP_E: Map<string, number> = new Map<string, number>();
const MAP_F: Map<string, number> = new Map<string, number>();
const MAP_G: Map<string, number> = new Map<string, number>();

MAP_A.set('a', 1);
MAP_B.set('b', 2);
MAP_C.set('c', 3);
MAP_D.set('', 0);
MAP_E.set('​', -1);
MAP_F.set('max', Number.MAX_SAFE_INTEGER);

const VALID_VALUES: Array<Map<string, number>> = [MAP_A, MAP_B, MAP_C, MAP_D, MAP_E, MAP_F, MAP_G, MAP_A];

type MapInvalidValue = string | number | null | undefined | MapInvalidObject | Array<number>;
type MapAllValue = Map<string, number> | MapInvalidValue;

const ALL_VALUES: Array<MapAllValue> = [
  ...VALID_VALUES,
  'key', 123, null, undefined, MAP_INVALID_OBJECT, [],
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function dequeMapTest() {
  describe('DequeMapTest', () => {
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
     * @tc.name   testDequeMapTest0100
     * @tc.number SUB_ARKTS_DEQUE_MAP_0100
     * @tc.desc   Verify Deque Map construction, insertEnd of valid/mixed values, length and first/last access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeMapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: Deque<Map<string, number>> = new Deque<Map<string, number>>();
      expect(empty.length).assertEqual(0);

      const list: Deque<Map<string, number>> = new Deque<Map<string, number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        list.insertEnd(VALID_VALUES[i]);
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(MAP_A);
      expect(list[7]).assertEqual(MAP_A);
      expect(list[6].size).assertEqual(0);
      expect(list.getFirst()).assertEqual(MAP_A);
      expect(list.getLast()).assertEqual(MAP_A);

      const mixed: Deque<MapAllValue> = new Deque<MapAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        mixed.insertEnd(ALL_VALUES[i]);
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(MAP_A);
    });

    /**
     * @tc.name   testDequeMapTest0200
     * @tc.number SUB_ARKTS_DEQUE_MAP_0200
     * @tc.desc   Verify Deque Map insertEnd/insertFront ordering and reference-based has lookup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeMapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Map<string, number>> = new Deque<Map<string, number>>();
      list.insertEnd(MAP_A);
      list.insertEnd(MAP_B);
      list.insertFront(MAP_C);
      list.insertEnd(MAP_A);

      expect(list.length).assertEqual(4);
      expect(list[0]).assertEqual(MAP_C);
      expect(list.getFirst()).assertEqual(MAP_C);
      expect(list.getLast()).assertEqual(MAP_A);
      expect(list.has(MAP_A)).assertTrue();
      expect(list.has(MAP_B)).assertTrue();
      expect(list.has(new Map<string, number>())).assertFalse();

      const single: Deque<Map<string, number>> = new Deque<Map<string, number>>();
      single.insertFront(MAP_D);
      expect(single.getFirst()).assertEqual(MAP_D);
      expect(single.getLast()).assertEqual(MAP_D);
    });

    /**
     * @tc.name   testDequeMapTest0300
     * @tc.number SUB_ARKTS_DEQUE_MAP_0300
     * @tc.desc   Verify Deque Map popFirst/popLast behavior including single-element deque
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeMapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Map<string, number>> = new Deque<Map<string, number>>();
      list.insertEnd(MAP_A);
      list.insertEnd(MAP_B);
      list.insertEnd(MAP_C);
      list.insertEnd(MAP_D);

      const first: Map<string, number> = list.popFirst();
      expect(first).assertEqual(MAP_A);
      expect(list.length).assertEqual(3);
      expect(list.getFirst()).assertEqual(MAP_B);

      const last: Map<string, number> = list.popLast();
      expect(last).assertEqual(MAP_D);
      expect(list.length).assertEqual(2);
      expect(list.getLast()).assertEqual(MAP_C);

      const single: Deque<Map<string, number>> = new Deque<Map<string, number>>();
      single.insertEnd(MAP_E);
      expect(single.popFirst()).assertEqual(MAP_E);
      expect(single.length).assertEqual(0);

      single.insertEnd(MAP_F);
      expect(single.popLast()).assertEqual(MAP_F);
      expect(single.length).assertEqual(0);
    });

    /**
     * @tc.name   testDequeMapTest0400
     * @tc.number SUB_ARKTS_DEQUE_MAP_0400
     * @tc.desc   Verify Deque Map forEach with index, Symbol.iterator traversal and for-of counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeMapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Map<string, number>> = new Deque<Map<string, number>>();
      list.insertEnd(MAP_A);
      list.insertEnd(MAP_B);
      list.insertEnd(MAP_C);

      const visited: Array<Map<string, number>> = [];
      list.forEach((value: Map<string, number>) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(MAP_A);
      expect(visited[2]).assertEqual(MAP_C);

      let indexSum: number = 0;
      list.forEach((value: Map<string, number>, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(3);

      const iterValues: Array<Map<string, number>> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<Map<string, number>> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(3);
      expect(iterValues[1]).assertEqual(MAP_B);

      let forOfCount: number = 0;
      for (const value of list) {
        if (value === MAP_B) {
          forOfCount += 1;
        }
      }
      expect(forOfCount).assertEqual(1);
    });

    /**
     * @tc.name   testDequeMapTest0500
     * @tc.number SUB_ARKTS_DEQUE_MAP_0500
     * @tc.desc   Verify Deque Map index access within bounds and undefined beyond length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeMapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Map<string, number>> = new Deque<Map<string, number>>();
      list.insertEnd(MAP_A);
      list.insertEnd(MAP_B);
      list.insertEnd(MAP_C);
      list.insertFront(MAP_D);

      expect(list[0]).assertEqual(MAP_D);
      expect(list[1]).assertEqual(MAP_A);
      expect(list[3]).assertEqual(MAP_C);
      expect(list[list.length - 1]).assertEqual(MAP_C);
      let oobThrew: boolean = false;
      try {
        const oob: MapAllValue | undefined = list[list.length];
      } catch (e) {
        oobThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(oobThrew).assertTrue();
      let farThrew: boolean = false;
      try {
        const far: MapAllValue | undefined = list[88];
      } catch (e) {
        farThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(farThrew).assertTrue();
      expect(list[0].size).assertEqual(1);
    });

    /**
     * @tc.name   testDequeMapTest0600
     * @tc.number SUB_ARKTS_DEQUE_MAP_0600
     * @tc.desc   Verify Deque Map out-of-range index access, popFirst on empty deque throwing, and empty iteration behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDequeMapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: Deque<Map<string, number>> = new Deque<Map<string, number>>();
      list.insertEnd(MAP_A);
      list.insertEnd(MAP_B);
      let t2: boolean = false;
      try {
        const v2: MapAllValue | undefined = list[2];
      } catch (e) {
        t2 = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(t2).assertTrue();
      let negThrew: boolean = false;
      try {
        const v_neg: MapAllValue | undefined = list[-1];
      } catch (e) {
        negThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(negThrew).assertTrue();
      expect(list.length).assertEqual(2);

      const empty: Deque<Map<string, number>> = new Deque<Map<string, number>>();
      const popped: MapAllValue | undefined = empty.popFirst();
      expect(popped).assertUndefined();
      expect(empty.length).assertEqual(0);

      while (list.length > 0) {
        list.popFirst();
      }
      expect(list.length).assertEqual(0);
      let emptyIdxThrew: boolean = false;
      try {
        const v0: MapAllValue | undefined = list[0];
      } catch (e) {
        emptyIdxThrew = true;
        expect((e as Error).name).assertEqual('BusinessError');
      }
      expect(emptyIdxThrew).assertTrue();

      const emptyIter = list[Symbol.iterator]();
      expect(emptyIter.next().done).assertTrue();

      let visitedCount: number = 0;
      list.forEach((value: Map<string, number>) => {
        visitedCount += 1;
      });
      expect(visitedCount).assertEqual(0);
    });
  });
}
