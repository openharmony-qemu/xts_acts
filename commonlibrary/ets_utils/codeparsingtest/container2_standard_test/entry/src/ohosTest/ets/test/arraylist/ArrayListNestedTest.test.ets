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
import { ArrayList } from '@kit.ArkTS';

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

export default function arrayListNestedTest() {
  describe('ArrayListNestedTest', () => {
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
     * @tc.name   testArrayListNestedTest0100
     * @tc.number SUB_ARKTS_ARRAY_LIST_NESTED_0100
     * @tc.desc   Verify ArrayList nested array constructor and add with valid and mixed array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListNestedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: ArrayList<Array<number>> = new ArrayList<Array<number>>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: ArrayList<Array<number>> = new ArrayList<Array<number>>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        expect(list.add(VALID_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(VALID_VALUES[0]);
      expect(list[0][1]).assertEqual(2);
      expect(list[4].length).assertEqual(0);

      const mixed: ArrayList<NestedAllValue> = new ArrayList<NestedAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(VALID_VALUES[0]);
    });

    /**
     * @tc.name   testArrayListNestedTest0200
     * @tc.number SUB_ARKTS_ARRAY_LIST_NESTED_0200
     * @tc.desc   Verify ArrayList nested array has, getIndexOf, getLastIndexOf, insert and remove by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListNestedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Array<number>> = new ArrayList<Array<number>>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[0]);

      expect(list.has(VALID_VALUES[0])).assertTrue();
      expect(list.has(VALID_VALUES[5])).assertFalse();
      expect(list.getIndexOf(VALID_VALUES[0])).assertEqual(0);
      expect(list.getLastIndexOf(VALID_VALUES[0])).assertEqual(2);
      expect(list.getIndexOf(VALID_VALUES[5])).assertEqual(-1);

      list.insert(VALID_VALUES[2], 0);
      expect(list[0]).assertEqual(VALID_VALUES[2]);
      expect(list.length).assertEqual(4);

      expect(list.remove(VALID_VALUES[0])).assertTrue();
      expect(list.getIndexOf(VALID_VALUES[0])).assertEqual(2);
      expect(list.remove(VALID_VALUES[5])).assertFalse();
    });

    /**
     * @tc.name   testArrayListNestedTest0300
     * @tc.number SUB_ARKTS_ARRAY_LIST_NESTED_0300
     * @tc.desc   Verify ArrayList nested array removeByIndex, removeByRange, subArrayList and clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListNestedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Array<number>> = new ArrayList<Array<number>>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[2]);
      list.add(VALID_VALUES[3]);

      const removed: Array<number> = list.removeByIndex(2);
      expect(removed).assertEqual(VALID_VALUES[2]);
      expect(list.length).assertEqual(3);

      list.removeByRange(0, 2);
      expect(list.length).assertEqual(1);
      expect(list[0]).assertEqual(VALID_VALUES[3]);

      const src: ArrayList<Array<number>> = new ArrayList<Array<number>>();
      src.add(VALID_VALUES[4]);
      src.add(VALID_VALUES[5]);
      const sub: ArrayList<Array<number>> = src.subArrayList(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[1][0]).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(src.length).assertEqual(2);

      const cloned: ArrayList<Array<number>> = src.clone();
      cloned.add(VALID_VALUES[0]);
      expect(src.length).assertEqual(2);
      expect(cloned.length).assertEqual(3);
      expect(cloned[0]).assertEqual(src[0]);
    });

    /**
     * @tc.name   testArrayListNestedTest0400
     * @tc.number SUB_ARKTS_ARRAY_LIST_NESTED_0400
     * @tc.desc   Verify ArrayList nested array replaceAllElements and forEach transforming inner arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListNestedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Array<number>> = new ArrayList<Array<number>>();
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[1]);

      list.replaceAllElements((value: Array<number>): Array<number> => {
        const next: Array<number> = [];
        for (let i = 0; i < value.length; i++) {
          next.push(value[i] * 2);
        }
        return next;
      });
      expect(list[0][0]).assertEqual(2);
      expect(list[0][2]).assertEqual(6);
      expect(list[1][0]).assertEqual(0);
      expect(list[1][1]).assertEqual(-2);

      const totalLengths: Array<number> = [];
      list.forEach((value: Array<number>) => {
        totalLengths.push(value.length);
      });
      expect(totalLengths.length).assertEqual(2);
      expect(totalLengths[0]).assertEqual(3);
    });

    /**
     * @tc.name   testArrayListNestedTest0500
     * @tc.number SUB_ARKTS_ARRAY_LIST_NESTED_0500
     * @tc.desc   Verify ArrayList nested array sort by length, getCapacity, increaseCapacityTo and trimToCurrentLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListNestedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Array<number>> = new ArrayList<Array<number>>();
      list.add(VALID_VALUES[1]);
      list.add(VALID_VALUES[0]);
      list.add(VALID_VALUES[4]);

      list.sort((a: Array<number>, b: Array<number>): number => {
        return a.length - b.length;
      });
      expect(list[0].length).assertEqual(0);
      expect(list[2].length).assertEqual(3);

      expect(list.getCapacity()).assertEqual(10);
      list.increaseCapacityTo(19);
      expect(list.getCapacity() >= 19).assertTrue();
      list.add(VALID_VALUES[2]);
      expect(list.length).assertEqual(4);
      list.trimToCurrentLength();
      expect(list.length).assertEqual(4);
    });

    /**
     * @tc.name   testArrayListNestedTest0600
     * @tc.number SUB_ARKTS_ARRAY_LIST_NESTED_0600
     * @tc.desc   Verify ArrayList nested array boundary access, out-of-range removeByIndex and insert, clear and empty clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListNestedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<Array<number>> = new ArrayList<Array<number>>();
      list.add(VALID_VALUES[0]);
      let accessThrew: boolean = false;
      try {
        const beyond: Array<number> = list[1];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(accessThrew || list.length === 1).assertTrue();
      expect(list.length).assertEqual(1);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(12);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(VALID_VALUES[1], 21);
      } catch (e) {
        insertThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
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
