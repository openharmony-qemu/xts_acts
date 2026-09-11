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

interface NumberInvalidObject {
  marker: string;
}

const NUMBER_INVALID_OBJECT: NumberInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<number> = [
  1, 100.5, -99.9, 0, Math.floor(1.5), 123.456, 0xcafebabe, 2 ** 3, 1.2e3, 1e3,
  2.5e-2, 0x12, 0x0102, 0x01020304, 0x3, 0o12, 0b1010, NaN, Infinity, -Infinity,
  -0, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MIN_VALUE, Number.MIN_VALUE - 1, Number.EPSILON,
  Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, -128, 127, -32768, 32767, -2147483648,
  2147483647, -9223372036854775808, 9223372036854775807, -1.40129846432481707e-45,
  1.40129846432481707e-45, -3.4028234663852886e38, 3.4028234663852886e38, 65535,
  -1, 999999.99, 13800138000, 123456, -100.5,
];

type NumberInvalidValue = string | null | undefined | NumberInvalidObject | Array<number> | boolean | bigint;
type NumberAllValue = number | NumberInvalidValue;

const ALL_VALUES: Array<NumberAllValue> = [
  ...VALID_VALUES,
  '123', '0x12', null, undefined, NUMBER_INVALID_OBJECT, [], true,
  BigInt('16045690984833335006'), BigInt('9007199254740991'),
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function arrayListNumberTest() {
  describe('ArrayListNumberTest', () => {
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
     * @tc.name   testArrayListNumberTest0100
     * @tc.number SUB_ARKTS_ARRAY_LIST_NUMBER_0100
     * @tc.desc   Verify ArrayList number constructor and add with boundary, special and mixed numeric values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListNumberTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: ArrayList<number> = new ArrayList<number>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: ArrayList<number> = new ArrayList<number>();
      for (let i = 0; i < VALID_VALUES.length; i++) {
        const added: boolean = list.add(VALID_VALUES[i]);
        expect(added).assertTrue();
      }
      expect(list.length).assertEqual(VALID_VALUES.length);
      expect(list[0]).assertEqual(1);
      expect(list.isEmpty()).assertFalse();

      const mixed: ArrayList<NumberAllValue> = new ArrayList<NumberAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(mixed.add(ALL_VALUES[i])).assertTrue();
      }
      expect(mixed.length).assertEqual(ALL_VALUES.length);
      expect(mixed[0]).assertEqual(1);
      expect(mixed[1]).assertEqual(100.5);
      expect(mixed[ALL_VALUES.length - 1]).assertEqual(BigInt('9007199254740991'));
    });

    /**
     * @tc.name   testArrayListNumberTest0200
     * @tc.number SUB_ARKTS_ARRAY_LIST_NUMBER_0200
     * @tc.desc   Verify ArrayList number has, getIndexOf, getLastIndexOf, insert, remove and NaN lookup behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListNumberTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<number> = new ArrayList<number>();
      list.add(2);
      list.add(4);
      list.add(5);
      list.add(2);
      list.add(1);
      list.add(2);
      list.add(4);

      expect(list.has(5)).assertTrue();
      expect(list.has(999)).assertFalse();
      expect(list.getIndexOf(2)).assertEqual(0);
      expect(list.getLastIndexOf(2)).assertEqual(5);
      expect(list.getIndexOf(999)).assertEqual(-1);
      expect(list.getLastIndexOf(999)).assertEqual(-1);
      expect(list[2]).assertEqual(5);

      list.insert(88, 0);
      expect(list[0]).assertEqual(88);
      expect(list.length).assertEqual(8);
      list.insert(99, list.length);
      expect(list[list.length - 1]).assertEqual(99);
      expect(list.length).assertEqual(9);

      const nanList: ArrayList<number> = new ArrayList<number>();
      nanList.add(NaN);
      expect(nanList.has(NaN)).assertTrue();
      expect(nanList.getIndexOf(NaN)).assertEqual(-1);

      expect(list.remove(2)).assertTrue();
      expect(list.getIndexOf(2)).assertEqual(3);
      expect(list.remove(777)).assertFalse();
    });

    /**
     * @tc.name   testArrayListNumberTest0300
     * @tc.number SUB_ARKTS_ARRAY_LIST_NUMBER_0300
     * @tc.desc   Verify ArrayList number removeByIndex, removeByRange, subArrayList, clone and convertToArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListNumberTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<number> = new ArrayList<number>();
      list.add(2);
      list.add(4);
      list.add(5);
      list.add(4);

      const removed: number = list.removeByIndex(2);
      expect(removed).assertEqual(5);
      expect(list.length).assertEqual(3);
      expect(list[2]).assertEqual(4);

      list.removeByRange(1, 3);
      expect(list.length).assertEqual(1);
      expect(list[0]).assertEqual(2);

      const src: ArrayList<number> = new ArrayList<number>();
      src.add(1);
      src.add(2);
      src.add(3);
      src.add(4);
      src.add(5);
      const sub: ArrayList<number> = src.subArrayList(1, 4);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(2);
      expect(sub[2]).assertEqual(4);
      expect(src.length).assertEqual(5);

      const cloned: ArrayList<number> = src.clone();
      expect(cloned.length).assertEqual(5);
      cloned.add(6);
      expect(src.length).assertEqual(5);
      expect(cloned[5]).assertEqual(6);

      const arr: Array<number> = src.convertToArray();
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr instanceof Array).assertTrue();
    });

    /**
     * @tc.name   testArrayListNumberTest0400
     * @tc.number SUB_ARKTS_ARRAY_LIST_NUMBER_0400
     * @tc.desc   Verify ArrayList number replaceAllElements, forEach, Symbol.iterator and for-of traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListNumberTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<number> = new ArrayList<number>();
      list.add(2);
      list.add(4);
      list.add(5);
      list.add(4);

      list.replaceAllElements((value: number): number => {
        return value * 2;
      });
      expect(list[0]).assertEqual(4);
      expect(list[1]).assertEqual(8);
      expect(list[3]).assertEqual(8);

      const visited: Array<number> = [];
      list.forEach((value: number) => {
        visited.push(value);
      });
      expect(visited.length).assertEqual(4);
      expect(visited[0]).assertEqual(4);
      expect(visited[3]).assertEqual(8);

      let indexSum: number = 0;
      list.forEach((value: number, index?: number) => {
        indexSum += index ?? 0;
      });
      expect(indexSum).assertEqual(6);

      const iterValues: Array<number> = [];
      const iter = list[Symbol.iterator]();
      let temp: IteratorResult<number> = iter.next();
      while (!temp.done) {
        iterValues.push(temp.value);
        temp = iter.next();
      }
      expect(iterValues.length).assertEqual(4);
      expect(iterValues[0]).assertEqual(4);

      let forOfCount: number = 0;
      for (const value of list) {
        forOfCount += value;
      }
      expect(forOfCount).assertEqual(30);
    });

    /**
     * @tc.name   testArrayListNumberTest0500
     * @tc.number SUB_ARKTS_ARRAY_LIST_NUMBER_0500
     * @tc.desc   Verify ArrayList number sort with comparator and default, getCapacity, increaseCapacityTo and trimToCurrentLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListNumberTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<number> = new ArrayList<number>();
      list.add(5);
      list.add(1);
      list.add(4);
      list.add(2);
      list.add(3);

      list.sort((a: number, b: number): number => {
        return a - b;
      });
      expect(list[0]).assertEqual(1);
      expect(list[4]).assertEqual(5);

      list.sort((a: number, b: number): number => {
        return b - a;
      });
      expect(list[0]).assertEqual(5);
      expect(list[4]).assertEqual(1);

      list.sort();
      expect(list[0]).assertEqual(1);
      expect(list[4]).assertEqual(5);

      expect(list.getCapacity()).assertEqual(10);
      list.increaseCapacityTo(20);
      expect(list.getCapacity() >= 20).assertTrue();
      list.increaseCapacityTo(2);
      expect(list.getCapacity() >= 20).assertTrue();
      list.add(6);
      expect(list.length).assertEqual(6);
      list.trimToCurrentLength();
      expect(list.length).assertEqual(6);
      expect(list[5]).assertEqual(6);
    });

    /**
     * @tc.name   testArrayListNumberTest0600
     * @tc.number SUB_ARKTS_ARRAY_LIST_NUMBER_0600
     * @tc.desc   Verify ArrayList number boundary access, out-of-range insert, removeByIndex and subArrayList throwing, clear and empty state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListNumberTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<number> = new ArrayList<number>();
      list.add(1);
      list.add(2);
      list.add(3);
      let accessThrew: boolean = false;
      try {
        const beyond: number = list[3];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(accessThrew || list.length === 3).assertTrue();
      expect(list.length).assertEqual(3);

      let insertFailed: boolean = false;
      try {
        list.insert(100, 99);
      } catch (e) {
        insertFailed = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(insertFailed).assertTrue();
      expect(list.has(100)).assertFalse();
      expect(list.length).assertEqual(3);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(3);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(3);

      let subThrew: boolean = false;
      try {
        list.subArrayList(2, 1);
      } catch (e) {
        subThrew = true;
      }
      expect(subThrew).assertTrue();

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.convertToArray().length).assertEqual(0);

      const emptyIter = list[Symbol.iterator]();
      const first: IteratorResult<number> = emptyIter.next();
      expect(first.done).assertTrue();

      const cloned: ArrayList<number> = list.clone();
      expect(cloned.length).assertEqual(0);
    });
  });
}
