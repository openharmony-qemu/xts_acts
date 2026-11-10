'use static';

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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils, {
  ABC,
  ABObj,
  AObj,
  Base,
  BoxPerson,
  Calc,
  Data,
  DataVal,
  DeepNestedObject,
  DeepObj,
  Derived,
  Dog,
  IdObj,
  KeyVal,
  NameTags,
  Named,
  NamedObj,
  NamedPerson,
  NestedStringObject,
  OldNewObj,
  OptionalAB,
  OuterInner,
  OuterInnerWithInner,
  Point,
  UserAge,
  ValGetVal,
  XY,
  XYObj,
} from '../Util.test';

function readBox(b: Box<number>): number {
  return b.get();
}

export default function BoxGenericGetSetTest5(): void {
  describe('BoxGenericGetSetTest5', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0010
     * @tc.name testBoxGenericGetSetTestFive001
     * @tc.desc Verify Box<number[][]>.get returns 2D array correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number[][]>([[1, 2], [3, 4],]);
      expect(JSON.stringify(box.get())).assertEqual(JSON.stringify([[1, 2], [3, 4],]),);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0020
     * @tc.name testBoxGenericGetSetTestFive002
     * @tc.desc Verify Box<object|undefined> stores undefined and 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<object | undefined>(undefined);
      expect(box.get()).assertUndefined();
      box.set(42);
      expect(box.get()).assertEqual(42);
      box.set(undefined);
      expect(box.get()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0030
     * @tc.name testBoxGenericGetSetTestFive003
     * @tc.desc Verify Box<Point>.get preserves x and y properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pt = new Point();
      pt.x = 10;
      pt.y = 20;
      const box = new Box<Point>(pt);
      expect(box.get().x).assertEqual(10);
      expect(box.get().y).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0040
     * @tc.name testBoxGenericGetSetTestFive004
     * @tc.desc Verify Box<RegExp>.get preserves test method behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regex = new RegExp('^start');
      const box = new Box<RegExp>(regex);
      expect(box.get().test('start123')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0050
     * @tc.name testBoxGenericGetSetTestFive005
     * @tc.desc Verify Box<boolean>.get called 3 times returns same false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<boolean>(false);
      expect(box.get()).assertFalse();
      expect(box.get()).assertFalse();
      expect(box.get()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0060
     * @tc.name testBoxGenericGetSetTestFive006
     * @tc.desc Verify Box<Data>.get returns same instance reference and preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Data();
      d.value = 42;
      const box = new Box<Data>(d);
      expect(box.get()).assertEqual(d);
      expect(box.get().value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0070
     * @tc.name testBoxGenericGetSetTestFive007
     * @tc.desc Verify Box<number[]>.get returns value that is an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number[]>([1, 2, 3]);
      const val = box.get();
      expect(val[0]).assertEqual(1);
      expect(val[1]).assertEqual(2);
      expect(val[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0080
     * @tc.name testBoxGenericGetSetTestFive008
     * @tc.desc Verify Box<Date>.get returns Date with valid time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date: Date = new Date();
      const box = new Box<Date>(date);
      expect(box.get()).assertEqual(date);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0090
     * @tc.name testBoxGenericGetSetTestFive009
     * @tc.desc Verify Box<string>.get returns empty string with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<string>('');
      expect(box.get()).assertEqual('');
      expect(box.get().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0100
     * @tc.name testBoxGenericGetSetTestFive010
     * @tc.desc Verify Box<number>.set in loop of 50 iterations updates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>(0);
      for (let i = 0; i < 50; i++) {
        box.set(i);
        expect(box.get()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0110
     * @tc.name testBoxGenericGetSetTestFive011
     * @tc.desc Verify Box<NamedObj>.get returns object with correct name property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: NamedObj = { name: 'Old' };
      const box = new Box<NamedObj>(obj);
      expect(box.get().name).assertEqual('Old');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0120
     * @tc.name testBoxGenericGetSetTestFive012
     * @tc.desc Verify Box<number[]>.get allows mutation of original array through reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const box = new Box<number[]>(arr);
      box.get()[0] = 100;
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0130
     * @tc.name testBoxGenericGetSetTestFive013
     * @tc.desc Verify Box<Map<string,number>>.get allows mutation of original Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      const box = new Box<Map<string, number>>(map);
      box.get().set('newKey', 99);
      const mapValue = map.get('newKey')!;
      expect(mapValue).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0140
     * @tc.name testBoxGenericGetSetTestFive014
     * @tc.desc Verify Box<Set<number>>.get allows mutation of original Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([1]);
      const box = new Box<Set<number>>(set);
      box.get().add(2);
      expect(set.has(2)).assertTrue();
      expect(box.get().size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0150
     * @tc.name testBoxGenericGetSetTestFive015
     * @tc.desc Verify Box<Date>.get allows mutation of original Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 0, 1);
      const box = new Box<Date>(date);
      box.get().setFullYear(2027);
      expect(date.getFullYear()).assertEqual(2027);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0160
     * @tc.name testBoxGenericGetSetTestFive016
     * @tc.desc Verify Box.deep-get retrieves deeply nested object property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: DeepObj = { deep: { name: 'value' } };
      const box = new Box<DeepObj>(obj);
      const retrieved = box.get();
      expect(retrieved.deep.name).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0170
     * @tc.name testBoxGenericGetSetTestFive017
     * @tc.desc Verify two Box<number> instances have independent get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstBox = new Box<number>(1);
      const secondBox = new Box<number>(2);
      expect(firstBox.get()).assertEqual(1);
      expect(secondBox.get()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0180
     * @tc.name testBoxGenericGetSetTestFive018
     * @tc.desc Verify 10 Box<number> instances in array each get correct indexed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const boxes: Box<int>[] = [];
      for (let i = 0; i < 10; i++) {
        boxes.push(new Box<int>(i * 10));
      }
      for (let i = 0; i < 10; i++) {
        let left: int = boxes[i]!.get();
        let right: int = i * 10;
        expect(left).assertEqual(right);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0190
     * @tc.name testBoxGenericGetSetTestFive019
     * @tc.desc Verify Box.set on one Box does not affect another Box value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstObject: IdObj = { id: 1 };
      const secondObject: IdObj = { id: 2 };
      const firstBox = new Box<IdObj>(firstObject);
      const secondBox = new Box<IdObj>(secondObject);
      const thirdObject: IdObj = { id: 3 };
      firstBox.set(thirdObject);
      expect(firstBox.get().id).assertEqual(3);
      expect(secondBox.get().id).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0200
     * @tc.name testBoxGenericGetSetTestFive020
     * @tc.desc Verify Box.get reflects external mutation of stored object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: NamedObj = { name: 'ArkTS' };
      const box = new Box<NamedObj>(obj);
      obj.name = 'Changed';
      expect(box.get().name).assertEqual('Changed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0210
     * @tc.name testBoxGenericGetSetTestFive021
     * @tc.desc Verify Box.set does not mutate the old stored object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oldObj: NamedObj = { name: 'Old' };
      const box = new Box<NamedObj>(oldObj);
      const newObj: NamedObj = { name: 'New' };
      box.set(newObj);
      expect(oldObj.name).assertEqual('Old');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0220
     * @tc.name testBoxGenericGetSetTestFive022
     * @tc.desc Verify Box<number> shared reference set through one alias reflects in another
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>(0);
      const firstReference = box;
      const secondReference = box;
      firstReference.set(10);
      expect(secondReference.get()).assertEqual(10);
      secondReference.set(20);
      expect(firstReference.get()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0230
     * @tc.name testBoxGenericGetSetTestFive023
     * @tc.desc Verify Box wrapping another Box get via chained get returns inner value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Box<number>(42);
      const outer = new Box<Box<number>>(inner);
      const innerBox = outer.get();
      const innerValue = innerBox.get();
      expect(innerValue).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0240
     * @tc.name testBoxGenericGetSetTestFive024
     * @tc.desc Verify Box wrapping Map of Box values get via chained get returns inner value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Box<number>(88);
      const map = new Map<string, Box<number>>();
      map.set('score', inner);
      const box = new Box<Map<string, Box<number>>>(map);
      const scoreBox = box.get().get('score')!;
      const score = scoreBox.get();
      expect(score).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0250
     * @tc.name testBoxGenericGetSetTestFive025
     * @tc.desc Verify Box<Base> with Derived subclass get accesses base property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Derived();
      const box = new Box<Base>(d);
      expect(box.get().baseVal).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0260
     * @tc.name testBoxGenericGetSetTestFive026
     * @tc.desc Verify Box<Named> with BoxPerson implementation get returns getName result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new BoxPerson();
      const box = new Box<Named>(p);
      expect(box.get().getName()).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0270
     * @tc.name testBoxGenericGetSetTestFive027
     * @tc.desc Verify Box<number[]> get with 5000 elements returns first and last correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [];
      for (let i = 0; i < 5000; i++) {
        arr.push(i);
      }
      const box = new Box<number[]>(arr);
      const result = box.get();
      expect(result[0]).assertEqual(0);
      expect(result[4999]).assertEqual(4999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0280
     * @tc.name testBoxGenericGetSetTestFive028
     * @tc.desc Verify Box<Record> get nested object by key and returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Object> = {};
      const kv: NamedObj = { name: 'deep' };
      obj['k0'] = kv;
      const box = new Box<Record<string, Object>>(obj);
      expect(box.get()['k0']).assertEqual(kv);
      expect(box.get()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0290
     * @tc.name testBoxGenericGetSetTestFive029
     * @tc.desc Verify Box<string> get with mixed unicode and emoji characters correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mixed = 'Hello世界🚀';
      const box = new Box<string>(mixed);
      expect(box.get()).assertEqual(mixed);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0300
     * @tc.name testBoxGenericGetSetTestFive030
     * @tc.desc Verify Box<(number|string|boolean|null)[]> get with mixed type array returns length of 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<(number | string | boolean | null)[]>([1, 'two', true, null]);
      expect(box.get().length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0310
     * @tc.name testBoxGenericGetSetTestFive031
     * @tc.desc Verify Box<number> passed to function and get returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>(42);
      expect(readBox(box)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0320
     * @tc.name testBoxGenericGetSetTestFive032
     * @tc.desc Verify Box<string|null> alternating set between string and null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<string | null>('a');
      expect(box.get()).assertEqual('a');
      box.set(null);
      expect(box.get()).assertNull();
      box.set('b');
      expect(box.get()).assertEqual('b');
      box.set(null);
      expect(box.get()).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0330
     * @tc.name testBoxGenericGetSetTestFive033
     * @tc.desc Verify Box<number[]> get returns the stored array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrBox = new Box<number[]>([1, 2]);
      expect(arrBox.get().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0340
     * @tc.name testBoxGenericGetSetTestFive034
     * @tc.desc Verify Box<NamedObj> get returns the stored object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const kv: NamedObj = { name: 'v' };
      const objBox = new Box<NamedObj>(kv);
      expect(objBox.get()).assertEqual(kv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0350
     * @tc.name testBoxGenericGetSetTestFive035
     * @tc.desc Verify Box<OptionalAB> get returns user and age properties correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: OptionalAB = { a: 'Alice', b: 30 };
      const box = new Box<OptionalAB>(obj);
      expect(box.get().a).assertEqual('Alice');
      expect(box.get().b).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0360
     * @tc.name testBoxGenericGetSetTestFive036
     * @tc.desc Verify Box<AObj> get returns deeply nested property via chained access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: AObj = { a: { b: { name: 'deep' } } };
      const box = new Box<AObj>(obj);
      expect(box.get().a.b.name).assertEqual('deep');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0370
     * @tc.name testBoxGenericGetSetTestFive037
     * @tc.desc Verify Box<ValGetVal> get returns object with val property correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ValGetVal = { val: 42, getVal: (): number => 42 };
      const box = new Box<ValGetVal>(obj);
      expect(box.get().val).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0380
     * @tc.name testBoxGenericGetSetTestFive038
     * @tc.desc Verify Box<Map> get returns Map with size has and get operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('x', 10);
      map.set('y', 20);
      const box = new Box<Map<string, number>>(map);
      expect(box.get().size).assertEqual(2);
      expect(box.get().has('x')).assertTrue();
      const yValue = box.get().get('y')!;
      expect(yValue).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0390
     * @tc.name testBoxGenericGetSetTestFive039
     * @tc.desc Verify Box<Set> get returns Set with size and has operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([1, 2, 3, 4, 5]);
      const box = new Box<Set<number>>(set);
      expect(box.get().size).assertEqual(5);
      expect(box.get().has(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0400
     * @tc.name testBoxGenericGetSetTestFive040
     * @tc.desc Verify Box<number> set returns the newly set number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>(0);
      const result = box.set(42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0410
     * @tc.name testBoxGenericGetSetTestFive041
     * @tc.desc Verify Box<string> set to 1000-character string preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<string>('');
      box.set('x'.repeat(1000));
      expect(box.get().length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0420
     * @tc.name testBoxGenericGetSetTestFive042
     * @tc.desc Verify Box<number> set to NaN and isNaN returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>(0);
      box.set(Double.NaN);
      expect(box.get()).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0430
     * @tc.name testBoxGenericGetSetTestFive043
     * @tc.desc Verify Box<ABC> set to new object with fields and get returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const initVal: ABC = { a: 0, b: 0, c: 0 };
      const box = new Box<ABC>(initVal);
      const obj: ABC = { a: 1, b: 2, c: 3 };
      box.set(obj);
      expect(box.get()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0440
     * @tc.name testBoxGenericGetSetTestFive044
     * @tc.desc Verify Box<NameTags> set to object with tags array preserves tag count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const initVal: NameTags = { name: '', tags: [] };
      const box = new Box<NameTags>(initVal);
      const obj: NameTags = { name: 'ArkTS', tags: ['ts', 'ark'] };
      box.set(obj);
      expect(box.get().tags.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0450
     * @tc.name testBoxGenericGetSetTestFive045
     * @tc.desc Verify Box<Record> set with 1000 properties preserves first and last entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Record<string, number>>({});
      const obj: Record<string, number> = {};
      for (let i = 0; i < 1000; i++) {
        obj[`p${i}`] = i;
      }
      box.set(obj);
      const result = box.get();
      expect(result['p0']).assertEqual(0);
      expect(result['p999']).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0460
     * @tc.name testBoxGenericGetSetTestFive046
     * @tc.desc Verify Box<string[]> set to array and get returns string elements by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<string[]>([]);
      box.set(['a', 'b', 'c']);
      const result = box.get();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0470
     * @tc.name testBoxGenericGetSetTestFive047
     * @tc.desc Verify Box<number[][]> set to 2D array and get returns correct structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number[][]>([]);
      box.set([
        [1, 2],
        [3, 4],
      ]);
      expect(JSON.stringify(box.get())).assertEqual(
        JSON.stringify([
          [1, 2],
          [3, 4],
        ]),
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0480
     * @tc.name testBoxGenericGetSetTestFive048
     * @tc.desc Verify Box<(string|number)[]> set to mixed array and get returns elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<(string | number)[]>([]);
      box.set([1, 'a', 2, 'b']);
      const result = box.get();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual('a');
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0490
     * @tc.name testBoxGenericGetSetTestFive049
     * @tc.desc Verify Box<IdObj[]> set to array of objects preserves length of 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArr: IdObj[] = [];
      const box = new Box<IdObj[]>(emptyArr);
      const arr: IdObj[] = [{ id: 1 }, { id: 2 }];
      box.set(arr);
      expect(box.get().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0500
     * @tc.name testBoxGenericGetSetTestFive050
     * @tc.desc Verify Box.set with XY record updates get to return new record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const initVal: XY = { x: 0, y: 0 };
      const box = new Box<XY>(initVal);
      const newVal: XY = { x: 1, y: 2 };
      box.set(newVal);
      expect(box.get()).assertEqual(newVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0510
     * @tc.name testBoxGenericGetSetTestFive051
     * @tc.desc Verify Box.set with nested OuterInner object updates deep inner property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const initVal: OuterInner = { outer: { name: '' } };
      const box = new Box<OuterInner>(initVal);
      const newVal: OuterInner = { outer: { name: 'value' } };
      box.set(newVal);
      expect(box.get().outer.name).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0520
     * @tc.name testBoxGenericGetSetTestFive052
     * @tc.desc Verify Box.set with Set of numbers stores correct element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Set<number>>(new Set<number>());
      box.set(new Set<number>([1, 2, 3]));
      expect(box.get().size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0530
     * @tc.name testBoxGenericGetSetTestFive053
     * @tc.desc Verify Box.set with Set of strings and has() returns true for contained element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Set<string>>(new Set<string>());
      box.set(new Set<string>(['a', 'b']));
      expect(box.get().has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0540
     * @tc.name testBoxGenericGetSetTestFive054
     * @tc.desc Verify Box.set with 500-element Set stores all elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Set<number>>(new Set<number>());
      const set = new Set<number>();
      for (let i = 0; i < 500; i++) {
        set.add(i);
      }
      box.set(set);
      expect(box.get().size).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0550
     * @tc.name testBoxGenericGetSetTestFive055
     * @tc.desc Verify Box.set with Set returns same reference from get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Set<number>>(new Set<number>());
      const set = new Set<number>([1, 2, 3]);
      box.set(set);
      expect(box.get()).assertEqual(set);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0560
     * @tc.name testBoxGenericGetSetTestFive056
     * @tc.desc Verify Box.set with Date replaces stored instance and get returns updated Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Date>(new Date(2020, 0, 1));
      const newDate = new Date();
      box.set(newDate);
      expect(box.get().getTime()).assertEqual(newDate.getTime());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0570
     * @tc.name testBoxGenericGetSetTestFive057
     * @tc.desc Verify Box.set with Date returns correct full year from get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Date>(new Date());
      box.set(new Date(2026, 6, 7));
      expect(box.get().getFullYear()).assertEqual(2026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0580
     * @tc.name testBoxGenericGetSetTestFive058
     * @tc.desc Verify Box.set with timestamp Date returns correct getTime value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Date>(new Date());
      box.set(new Date(1700000000000));
      expect(box.get().getTime()).assertEqual(1700000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0590
     * @tc.name testBoxGenericGetSetTestFive059
     * @tc.desc Verify Box.set with Date returns same reference from get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Date>(new Date());
      const date = new Date(2026, 0, 1);
      box.set(date);
      expect(box.get()).assertEqual(date);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0600
     * @tc.name testBoxGenericGetSetTestFive060
     * @tc.desc Verify Box.set with Point class object updates x and y properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Point>(new Point());
      const pt = new Point();
      pt.x = 10;
      pt.y = 20;
      box.set(pt);
      expect(box.get().x).assertEqual(10);
      expect(box.get().y).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0610
     * @tc.name testBoxGenericGetSetTestFive061
     * @tc.desc Verify Box.set with Calc object preserves add method returning correct sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Calc>(new Calc());
      const c = new Calc();
      box.set(c);
      expect(box.get().add(2, 3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0620
     * @tc.name testBoxGenericGetSetTestFive062
     * @tc.desc Verify Box.set with Dog subclass preserves breed property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Dog>(new Dog());
      const dog = new Dog();
      dog.breed = 'husky';
      box.set(dog);
      expect(box.get().breed).assertEqual('husky');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0630
     * @tc.name testBoxGenericGetSetTestFive063
     * @tc.desc Verify Box.set with DataVal class returns same object reference from get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<DataVal>(new DataVal());
      const d = new DataVal();
      d.val = 99;
      box.set(d);
      expect(box.get()).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0640
     * @tc.name testBoxGenericGetSetTestFive064
     * @tc.desc Verify Box.set with TypeError inside Box<Error> preserves name property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Error>(new Error());
      box.set(new TypeError('type error'));
      expect(box.get().name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0650
     * @tc.name testBoxGenericGetSetTestFive065
     * @tc.desc Verify Box.set with RangeError inside Box<Error> preserves message property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Error>(new Error());
      box.set(new RangeError('range error'));
      expect(box.get().message).assertEqual('range error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0660
     * @tc.name testBoxGenericGetSetTestFive066
     * @tc.desc Verify Box.set returns the set array itself for number[] type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArr: number[] = [];
      const box = new Box<number[]>(emptyArr);
      const arr: number[] = [1, 2, 3];
      const result = box.set(arr);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0670
     * @tc.name testBoxGenericGetSetTestFive067
     * @tc.desc Verify Box.set return value equals get result for NamedObj object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const initVal: NamedObj = { name: '' };
      const box = new Box<NamedObj>(initVal);
      const obj: NamedObj = { name: 'value' };
      const setResult = box.set(obj);
      expect(box.get()).assertEqual(setResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0680
     * @tc.name testBoxGenericGetSetTestFive068
     * @tc.desc Verify ten consecutive Box.set calls keep the last set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>(0);
      for (let i = 1; i <= 10; i++) {
        box.set(i);
      }
      expect(box.get()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0690
     * @tc.name testBoxGenericGetSetTestFive069
     * @tc.desc Verify Box.set on Box<number[]> without constructor arg returns correct array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number[]>();
      box.set([1, 2, 3]);
      const result = box.get();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0700
     * @tc.name testBoxGenericGetSetTestFive070
     * @tc.desc Verify Box.set with undefined does not throw BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<object | undefined>({});
      box.set(undefined);
      expect(box.get()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0710
     * @tc.name testBoxGenericGetSetTestFive071
     * @tc.desc Verify mutating Set by add after Box.set reflects in Box.get size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Set<number>>(new Set<number>());
      const set = new Set<number>([1]);
      box.set(set);
      set.add(2);
      expect(box.get().size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0720
     * @tc.name testBoxGenericGetSetTestFive072
     * @tc.desc Verify Box.set on inner Box<number> via outer Box<Box<number>> works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Box<number>(0);
      const outer = new Box<Box<number>>(inner);
      const innerBox = outer.get();
      innerBox.set(42);
      const innerValue = innerBox.get();
      expect(innerValue).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0730
     * @tc.name testBoxGenericGetSetTestFive073
     * @tc.desc Verify two Box<number> in array set independently return correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const boxes = [new Box<number>(0), new Box<number>(0)];
      boxes[0]!.set(10);
      boxes[1]!.set(20);
      expect(boxes[0]!.get()).assertEqual(10);
      expect(boxes[1]!.get()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0740
     * @tc.name testBoxGenericGetSetTestFive074
     * @tc.desc Verify Map<string,Box<number>> entries set independently return correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Box<number>>();
      const firstMappedBox: Box<number> = new Box<number>(0);
      const secondMappedBox: Box<number> = new Box<number>(0);
      map.set('a', firstMappedBox);
      map.set('b', secondMappedBox);
      map.get('a')!.set(100);
      map.get('b')!.set(200);
      expect(map.get('a')!.get()).assertEqual(100);
      expect(map.get('b')!.get()).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0750
     * @tc.name testBoxGenericGetSetTestFive075
     * @tc.desc Verify Box<XY> set with different coordinates returns each correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<XY>({ x: 0, y: 0 });
      const firstPoint: XY = { x: 1, y: 2 };
      const secondPoint: XY = { x: 3, y: 4 };
      box.set(firstPoint);
      expect(box.get()).assertEqual(firstPoint);
      box.set(secondPoint);
      expect(box.get()).assertEqual(secondPoint);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0760
     * @tc.name testBoxGenericGetSetTestFive076
     * @tc.desc Verify Box<number[]> set empty array then content array then empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number[]>([1]);
      box.set([]);
      expect(box.get().length).assertEqual(0);
      box.set([1, 2, 3]);
      expect(box.get().length).assertEqual(3);
      box.set([]);
      expect(box.get().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0770
     * @tc.name testBoxGenericGetSetTestFive077
     * @tc.desc Verify Box<string> get old, transform, set new
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<string>('abc');
      const old: string = box.get();
      box.set(old.toUpperCase());
      expect(box.get()).assertEqual('ABC');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0780
     * @tc.name testBoxGenericGetSetTestFive078
     * @tc.desc Verify Box<NamedObj> copies value from another Box
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const boxA = new Box<NamedObj>({ name: 'from' });
      const boxB = new Box<NamedObj>({ name: 'to' });
      boxB.set(boxA.get());
      expect(boxB.get().name).assertEqual('from');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0790
     * @tc.name testBoxGenericGetSetTestFive079
     * @tc.desc Verify Box<number[]> copy array from one Box to another
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const boxA = new Box<number[]>([10, 20, 30]);
      const boxB = new Box<number[]>([]);
      boxB.set(boxA.get());
      expect(boxB.get().length).assertEqual(3);
      expect(boxB.get()[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0800
     * @tc.name testBoxGenericGetSetTestFive080
     * @tc.desc Verify Box<boolean> set/get in loop for 100 iterations toggle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<boolean>(false);
      for (let i = 0; i < 100; i++) {
        box.set(i % 2 === 0);
        let left: boolean = box.get();
        let right: boolean = i % 2 === 0;
        expect(left).assertEqual(right);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0810
     * @tc.name testBoxGenericGetSetTestFive081
     * @tc.desc Verify Box<NamedObj> set and get value equals expected name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<NamedObj>({ name: 'temp' });
      box.set({ name: 'verified' });
      expect(box.get().name).assertEqual('verified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0820
     * @tc.name testBoxGenericGetSetTestFive082
     * @tc.desc Verify Box<OldNewObj> set with new object and multiple field access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<OldNewObj>({ old: 'old', newVal: 'oldVal' });
      box.set({ old: 'new', newVal: 'newVal' });
      expect(box.get().old).assertEqual('new');
      expect(box.get().newVal).assertEqual('newVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0830
     * @tc.name testBoxGenericGetSetTestFive083
     * @tc.desc Verify Box<XY> set with optional fields and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<XY>({ x: 0, y: 0 });
      box.set({ x: 1, y: 2 });
      expect(box.get().x).assertEqual(1);
      expect(box.get().y).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0840
     * @tc.name testBoxGenericGetSetTestFive084
     * @tc.desc Verify Box<IdObj> set with id object and get returns correct id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<IdObj>({ id: 0 });
      box.set({ id: 999 });
      expect(box.get().id).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0850
     * @tc.name testBoxGenericGetSetTestFive085
     * @tc.desc Verify Box<string> set with very long string and verify first char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<string>('');
      const longStr = 'ArkTS'.repeat(2000);
      box.set(longStr);
      let res: char = c'A';
      expect(box.get().charAt(0)).assertEqual(res);
      expect(box.get().length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0860
     * @tc.name testBoxGenericGetSetTestFive086
     * @tc.desc Verify Box<number|undefined> set stores undefined after a number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number | undefined>(10);
      box.set(undefined);
      expect(box.get()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0870
     * @tc.name testBoxGenericGetSetTestFive087
     * @tc.desc Verify Box<number> set replaces zero with a negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>(0);
      box.set(-10);
      expect(box.get()).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0880
     * @tc.name testBoxGenericGetSetTestFive088
     * @tc.desc Verify Box<number[]> set replaces the complete array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number[]>([1, 2]);
      const next: number[] = [3, 4, 5];
      box.set(next);
      expect(box.get().length).assertEqual(3);
      expect(box.get()[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0890
     * @tc.name testBoxGenericGetSetTestFive089
     * @tc.desc Verify Box<Map<string,number>> set replaces map contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Map<string, number>>(new Map<string, number>());
      const map = new Map<string, number>();
      map.set('value', 7);
      box.set(map);
      expect(box.get().get('value')).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0900
     * @tc.name testBoxGenericGetSetTestFive090
     * @tc.desc Verify Box<Record<string,number>> set replaces a field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Record<string, number>>({ 'value': 1 });
      box.set({ 'value': 2 });
      expect(box.get()['value']).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0910
     * @tc.name testBoxGenericGetSetTestFive091
     * @tc.desc Verify Box<Record<string,string>> get returns nested fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Record<string, string> = { 'outer': 'value' };
      const box = new Box<Record<string, string>>(value);
      expect(box.get()['outer']).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0920
     * @tc.name testBoxGenericGetSetTestFive092
     * @tc.desc Verify nested Box get returns the innermost value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Box<number>(42);
      const outer = new Box<Box<number>>(inner);
      expect(outer.get().get()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0930
     * @tc.name testBoxGenericGetSetTestFive093
     * @tc.desc Verify Box<Error> set replaces the error message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Error>(new Error('old'));
      box.set(new Error('new'));
      expect(box.get().message).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0940
     * @tc.name testBoxGenericGetSetTestFive094
     * @tc.desc Verify Box<Date> set replaces the stored date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Date>(new Date(2025, 0, 1));
      box.set(new Date(2026, 7, 25));
      expect(box.get().getFullYear()).assertEqual(2026);
      expect(box.get().getMonth()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0950
     * @tc.name testBoxGenericGetSetTestFive095
     * @tc.desc Verify Box<string> set preserves a 100000-character value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<string>('');
      const value = 'z'.repeat(100000);
      box.set(value);
      expect(box.get().length).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0960
     * @tc.name testBoxGenericGetSetTestFive096
     * @tc.desc Verify Box<string> set return and get return are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<string>('old');
      const result: string = box.set('new');
      expect(result).assertEqual(box.get());
      expect(result).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0970
     * @tc.name testBoxGenericGetSetTestFive097
     * @tc.desc Verify Box<boolean> set changes true to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<boolean>(true);
      box.set(false);
      expect(box.get()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0980
     * @tc.name testBoxGenericGetSetTestFive098
     * @tc.desc Verify Box<number[][]> set replaces nested array rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number[][]>([[0]]);
      box.set([[1, 2], [3, 4]]);
      expect(box.get()[1][0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_0990
     * @tc.name testBoxGenericGetSetTestFive099
     * @tc.desc Verify Box<Set<string>> set replaces the stored set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Set<string>>(new Set<string>(['old']));
      box.set(new Set<string>(['new']));
      expect(box.get().has('new')).assertTrue();
      expect(box.get().has('old')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1000
     * @tc.name testBoxGenericGetSetTestFive100
     * @tc.desc Verify Box<Map<string,number>> set return is the new map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Map<string, number>>(new Map<string, number>());
      const map = new Map<string, number>();
      map.set('answer', 42);
      const result: Map<string, number> = box.set(map);
      expect(result).assertEqual(map);
      expect(box.get().get('answer')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1010
     * @tc.name testBoxGenericGetSetTestFive101
     * @tc.desc Verify Box<Record<string,string>> get reflects source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Record<string, string> = { 'state': 'before' };
      const box = new Box<Record<string, string>>(value);
      value['state'] = 'after';
      expect(box.get()['state']).assertEqual('after');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1020
     * @tc.name testBoxGenericGetSetTestFive102
     * @tc.desc Verify Box<number|undefined> set restores a number after undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number | undefined>(1);
      box.set(undefined);
      box.set(5);
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1030
     * @tc.name testBoxGenericGetSetTestFive103
     * @tc.desc Verify Box<number> set preserves NaN and later recovers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>(0);
      box.set(Double.NaN);
      expect(isNaN(box.get())).assertTrue();
      box.set(1);
      expect(box.get()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1040
     * @tc.name testBoxGenericGetSetTestFive104
     * @tc.desc Verify Box<string[]> set preserves Unicode element content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<string[]>(['old']);
      box.set(['测试', 'done']);
      expect(box.get()[0]).assertEqual('测试');
      expect(box.get().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1050
     * @tc.name testBoxGenericGetSetTestFive105
     * @tc.desc Verify nested Box set replaces its inner Box reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oldInner = new Box<number>(1);
      const box = new Box<Box<number>>(oldInner);
      const newInner = new Box<number>(2);
      box.set(newInner);
      expect(box.get()).assertEqual(newInner);
      expect(box.get().get()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1060
     * @tc.name testBoxGenericGetSetTestFive106
     * @tc.desc Verify Box<Error> get preserves the source error reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const error = new Error('source');
      const box = new Box<Error>(error);
      expect(box.get()).assertEqual(error);
      expect(box.get().message).assertEqual('source');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1070
     * @tc.name testBoxGenericGetSetTestFive107
     * @tc.desc Verify Box<XYObj> set with different coordinates returns each correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<XYObj>({ x: 0, y: 0 });
      const firstPoint: XYObj = { x: 1, y: 2 };
      const secondPoint: XYObj = { x: 3, y: 4 };
      box.set(firstPoint);
      expect(box.get()).assertEqual(firstPoint);
      box.set(secondPoint);
      expect(box.get()).assertEqual(secondPoint);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1080
     * @tc.name testBoxGenericGetSetTestFive108
     * @tc.desc Verify Box<number> get old, multiply, set, repeat - chain of operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>(2);
      let val: number = box.get();
      box.set(val * 3);
      val = box.get();
      expect(val).assertEqual(6);
      box.set(val + 4);
      expect(box.get()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1090
     * @tc.name testBoxGenericGetSetTestFive109
     * @tc.desc Verify Box<ABObj> set with optional fields and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<ABObj>({});
      box.set({ a: 1, b: 2 });
      expect(box.get().a).assertEqual(1);
      expect(box.get().b).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1100
     * @tc.name testBoxGenericGetSetTestFive110
     * @tc.desc Verify Box.set with nested OuterInner object updates deep inner property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const initVal: OuterInnerWithInner = { outer: { inner: '' } };
      const box = new Box<OuterInnerWithInner>(initVal);
      const newVal: OuterInnerWithInner = { outer: { inner: 'value' } };
      box.set(newVal);
      expect(box.get().outer.inner).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1110
     * @tc.name testBoxGenericGetSetTestFive111
     * @tc.desc Verify Box.set return value equals get result for KeyVal object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const initVal: KeyVal = { key: '' };
      const box = new Box<KeyVal>(initVal);
      const obj: KeyVal = { key: 'value' };
      const setResult = box.set(obj);
      expect(box.get()).assertEqual(setResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1120
     * @tc.name testBoxGenericGetSetTestFive112
     * @tc.desc Verify Box<Named> with Person implementation get returns getName result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new NamedPerson();
      const box = new Box<Named>(p);
      expect(box.get().getName()).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1130
     * @tc.name testBoxGenericGetSetTestFive113
     * @tc.desc Verify Box<KeyVal> get returns the second object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const kv: KeyVal = { key: 'v' };
      const objBox = new Box<KeyVal>(kv);
      expect(objBox.get()).assertEqual(kv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1140
     * @tc.name testBoxGenericGetSetTestFive114
     * @tc.desc Verify Box<number> get and set using get result in arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>(7);
      expect(box.get()).assertEqual(7);
      box.set(box.get() * 2);
      expect(box.get()).assertEqual(14);
      box.set(box.get() + 1);
      expect(box.get()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1150
     * @tc.name testBoxGenericGetSetTestFive115
     * @tc.desc Verify Box<UserAge> get returns user and age properties correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: UserAge = { user: 'Alice', age: 30 };
      const box = new Box<UserAge>(obj);
      expect(box.get().user).assertEqual('Alice');
      expect(box.get().age).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1160
     * @tc.name testBoxGenericGetSetTestFive116
     * @tc.desc Verify Box<NestedStringObject> get returns deeply nested property via chained access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: NestedStringObject = { a: { b: { c: 'deep' } } };
      const box = new Box<NestedStringObject>(obj);
      expect(box.get().a.b.c).assertEqual('deep');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1170
     * @tc.name testBoxGenericGetSetTestFive117
     * @tc.desc Verify Box<number[]>.get returns value that is an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number[]>([1, 2, 3]);
      const val = box.get();
      expect(Array.isArray(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICGETSET_FIVE_1180
     * @tc.name testBoxGenericGetSetTestFive118
     * @tc.desc Verify Box.deep-get retrieves deeply nested object property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericGetSetTestFive118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: DeepNestedObject = { deep: { nested: 'value' } };
      const box = new Box<DeepNestedObject>(obj);
      const retrieved = box.get();
      expect(retrieved.deep.nested).assertEqual('value');
    });
  });
}
