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
} from '../../../../hypium/index';
import Utils, {
  ABC,
  A,
  AnimalBase,
  AppError,
  B,
  Bird,
  Child,
  Counter,
  Dog,
  DogBase,
  FlagRecord,
  Flyable,
  HasGetName,
  IdObj,
  L1,
  MatrixObj,
  MyClass,
  NameDate,
  NameTags,
  NamedObj,
  Parent,
  Person,
  XY,
} from '../Util.test';
export default function BoxGenericConstructorTest5(): void {
  describe('BoxGenericConstructorTest5', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_0100
     * @tc.name testBoxGenericConstructorTestFive001
     * @tc.desc Verify default constructor of Box<string> stores null, get() throws cast error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<string>();
      try {
        box.get();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_0200
     * @tc.name testBoxGenericConstructorTestFive002
     * @tc.desc Verify Box<number> constructor stores NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const constructorBox = new Box<number>(Double.NaN);
      expect(constructorBox.get()).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_0300
     * @tc.name testBoxGenericConstructorTestFive003
     * @tc.desc Verify Box.box<number> stores a NaN value independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const factoryBox = Box.box<number>(Double.NaN);
      expect(factoryBox.get()).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_0400
     * @tc.name testBoxGenericConstructorTestFive004
     * @tc.desc Verify Box<object> constructor with 2D matrix array stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: MatrixObj = {
        matrix: [
          [1, 2],
          [3, 4],
        ],
      };
      const box = new Box<object>(obj);
      expect(box.get()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_0500
     * @tc.name testBoxGenericConstructorTestFive005
     * @tc.desc Verify Box<object> constructor with Date field stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: NameDate = { name: 'ArkTS', date: new Date(2026, 0, 1) };
      const box = new Box<object>(obj);
      expect(box.get()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_0600
     * @tc.name testBoxGenericConstructorTestFive006
     * @tc.desc Verify Box<number[][]> constructor with 2D array stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number[][]>([
        [1, 2],
        [3, 4],
      ]);
      const result = box.get();
      expect(result[0][0]).assertEqual(1);
      expect(result[0][1]).assertEqual(2);
      expect(result[1][0]).assertEqual(3);
      expect(result[1][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_0700
     * @tc.name testBoxGenericConstructorTestFive007
     * @tc.desc Verify Box<number[]> get() returns ref-equal array via strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const box = new Box<number[]>(arr);
      expect(box.get()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_0800
     * @tc.name testBoxGenericConstructorTestFive008
     * @tc.desc Verify Box<Map<string,number>> with 3-entry Map stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      const box = new Box<Map<string, number>>(map);
      expect(box.get().size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_0900
     * @tc.name testBoxGenericConstructorTestFive009
     * @tc.desc Verify Box<Map> get() returns ref-equal Map via strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('x', 100);
      const box = new Box<Map<string, number>>(map);
      expect(box.get()).assertEqual(map);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_1000
     * @tc.name testBoxGenericConstructorTestFive010
     * @tc.desc Verify Box<Set<string>> get().has() correctly checks element existence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['a', 'b', 'c']);
      const box = new Box<Set<string>>(set);
      expect(box.get().has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_1100
     * @tc.name testBoxGenericConstructorTestFive011
     * @tc.desc Verify Box<Date> constructor with current Date stores instance correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const now: Date = new Date();
      const box = new Box<Date>(now);
      expect(box.get().getTime()).assertEqual(now.getTime());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_1200
     * @tc.name testBoxGenericConstructorTestFive012
     * @tc.desc Verify Box<Date> constructor with specific date returns correct year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 0, 1);
      const box = new Box<Date>(date);
      expect(box.get().getFullYear()).assertEqual(2026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_1300
     * @tc.name testBoxGenericConstructorTestFive013
     * @tc.desc Verify Box<Date> get() returns ref-equal Date via strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      const box = new Box<Date>(date);
      expect(box.get()).assertEqual(date);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_1400
     * @tc.name testBoxGenericConstructorTestFive014
     * @tc.desc Verify Box<number|undefined> stores both undefined and number correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstBox = new Box<number | undefined>(undefined);
      const secondBox = new Box<number | undefined>(42);
      expect(firstBox.get()).assertUndefined();
      expect(secondBox.get()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_1500
     * @tc.name testBoxGenericConstructorTestFive015
     * @tc.desc Verify Box<Person> constructor with class instance stores its property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const person = new Person('Alice');
      const box = new Box<Person>(person);
      expect(box.get().name).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_1600
     * @tc.name testBoxGenericConstructorTestFive016
     * @tc.desc Verify Box<Counter> constructor with mutated instance stores updated count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Counter();
      c.increment();
      const box = new Box<Counter>(c);
      expect(box.get().count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_1700
     * @tc.name testBoxGenericConstructorTestFive017
     * @tc.desc Verify Box<Dog> constructor with subclass instance stores inherited property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new Dog();
      const box = new Box<Dog>(dog);
      expect(box.get().type).assertEqual('animal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_1800
     * @tc.name testBoxGenericConstructorTestFive018
     * @tc.desc Verify Box<AppError> constructor with custom error stores code property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new AppError('app error', 500);
      const box = new Box<AppError>(err);
      expect(box.get().erroCode).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_1900
     * @tc.name testBoxGenericConstructorTestFive019
     * @tc.desc Verify Box<RegExp> constructor with flags stores and flags property correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regex = new RegExp('arkts', 'i');
      const box = new Box<RegExp>(regex);
      expect(box.get().flags).assertEqual('i');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_2000
     * @tc.name testBoxGenericConstructorTestFive020
     * @tc.desc Verify Box<Promise<number>> constructor preserves the resolved Promise reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const promise: Promise<number> = Promise.resolve(42.0);
      const constructorBox = new Box<Promise<number>>(promise);
      expect(constructorBox.get()).assertEqual(promise);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_2100
     * @tc.name testBoxGenericConstructorTestFive021
     * @tc.desc Verify Box.box<Promise<number>> stores the Promise reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const promise: Promise<number> = Promise.resolve(42.0);
      const factoryBox = Box.box<Promise<number>>(promise);
      expect(factoryBox.get()).assertEqual(promise);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_2200
     * @tc.name testBoxGenericConstructorTestFive022
     * @tc.desc Verify Box<number> set() returns the new value assigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>(1);
      expect(box.set(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_2300
     * @tc.name testBoxGenericConstructorTestFive023
     * @tc.desc Verify default Box<number> constructor stores null, get() throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>();
      try {
        box.get();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_2400
     * @tc.name testBoxGenericConstructorTestFive024
     * @tc.desc Verify default Box<boolean> constructor stores null, get() throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<boolean>();
      try {
        box.get();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_2500
     * @tc.name testBoxGenericConstructorTestFive025
     * @tc.desc Verify default Box<number[]> constructor stores null, get() throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number[]>();
      try {
        box.get();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_2600
     * @tc.name testBoxGenericConstructorTestFive026
     * @tc.desc Verify default Box<MyClass> constructor stores null, get() throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<MyClass>();
      try {
        box.get();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_2700
     * @tc.name testBoxGenericConstructorTestFive027
     * @tc.desc Verify default Box<Map<string,number>> constructor stores null, get() throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Map<string, number>>();
      try {
        box.get();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_2800
     * @tc.name testBoxGenericConstructorTestFive028
     * @tc.desc Verify default Box<Set<number>> constructor stores null, get() throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Set<number>>();
      try {
        box.get();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_2900
     * @tc.name testBoxGenericConstructorTestFive029
     * @tc.desc Verify Box<Parent> constructor with Child subclass instance stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const child = new Child();
      const box = new Box<Parent>(child);
      expect(box.get()).assertEqual(child);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_3000
     * @tc.name testBoxGenericConstructorTestFive030
     * @tc.desc Verify Box<Record> with nested key-value entry stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Object> = {};
      const level0Val: NamedObj = { name: 'deep' };
      obj['level0'] = level0Val;
      const box = new Box<Record<string, Object>>(obj);
      expect(box.get()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_3100
     * @tc.name testBoxGenericConstructorTestFive031
     * @tc.desc Verify Box<object|null> null ctor then set non-null object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<object | null>(null);
      expect(box.get()).assertNull();
      box.set(42);
      expect(box.get()).assertEqual(42);
      box.set(null);
      expect(box.get()).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_3200
     * @tc.name testBoxGenericConstructorTestFive032
     * @tc.desc Verify Box<Error> is not null with Error instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<Error>(new Error('test'));
      expect(box.get().message).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_3300
     * @tc.name testBoxGenericConstructorTestFive033
     * @tc.desc Verify 100 Box<number> constructions in loop all return correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 100; i++) {
        const box = new Box<number>(i);
        expect(box.get()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_3400
     * @tc.name testBoxGenericConstructorTestFive034
     * @tc.desc Verify Box<string> constructor stores a string and get() returns it correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const stringBox: Box<string> = new Box<string>('s');
      expect(stringBox.get()).assertEqual('s');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_3500
     * @tc.name testBoxGenericConstructorTestFive035
     * @tc.desc Verify Box<number> constructor stores an integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberBox: Box<number> = new Box<number>(1);
      expect(numberBox.get()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_3600
     * @tc.name testBoxGenericConstructorTestFive036
     * @tc.desc Verify Box<boolean> constructor stores a true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const booleanBox: Box<boolean> = new Box<boolean>(true);
      expect(booleanBox.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_3700
     * @tc.name testBoxGenericConstructorTestFive037
     * @tc.desc Verify two Box<number> with different values are not reference-equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstBox = new Box<number>(1);
      const secondBox = new Box<number>(2);
      expect(firstBox).not().assertEqual(secondBox);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_3800
     * @tc.name testBoxGenericConstructorTestFive038
     * @tc.desc Verify set() on firstBox does not affect secondBox value, each box is independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstBox = new Box<number>(1);
      const secondBox = new Box<number>(2);
      firstBox.set(10);
      expect(firstBox.get()).assertEqual(10);
      expect(secondBox.get()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_3900
     * @tc.name testBoxGenericConstructorTestFive039
     * @tc.desc Verify Box<boolean> set(true) returns true via get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<boolean>(false);
      box.set(true);
      expect(box.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_4000
     * @tc.name testBoxGenericConstructorTestFive040
     * @tc.desc Verify Box<boolean> constructor initialization stores true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<boolean>(true);
      expect(box.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_4100
     * @tc.name testBoxGenericConstructorTestFive041
     * @tc.desc Verify Box.set stores Charlie and keeps another box unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstObject: NamedObj = { name: 'Alice' };
      const secondObject: NamedObj = { name: 'Bob' };
      const firstBox = new Box<NamedObj>(firstObject);
      const secondBox = new Box<NamedObj>(secondObject);
      const charlie: NamedObj = { name: 'Charlie' };
      firstBox.set(charlie);
      const firstBoxResult: NamedObj = firstBox.get();
      const secondBoxResult: NamedObj = secondBox.get();
      expect(firstBoxResult.name).assertEqual('Charlie');
      expect(secondBoxResult.name).assertEqual('Bob');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_4200
     * @tc.name testBoxGenericConstructorTestFive042
     * @tc.desc Verify set([5,6]) replaces Box<number[]> value without affecting other box
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstBox = new Box<number[]>([1, 2]);
      const secondBox = new Box<number[]>([3, 4]);
      firstBox.set([5, 6]);
      const firstResult = firstBox.get();
      expect(firstResult[0]).assertEqual(5);
      expect(firstResult[1]).assertEqual(6);
      const secondResult = secondBox.get();
      expect(secondResult[0]).assertEqual(3);
      expect(secondResult[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_4300
     * @tc.name testBoxGenericConstructorTestFive043
     * @tc.desc Verify array literal of two Box<string> instances has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const boxes: Box<string>[] = [new Box<string>('a'), new Box<string>('b')];
      const firstValue: string = boxes[0].get();
      const secondValue: string = boxes[1].get();
      expect(boxes.length).assertEqual(2);
      expect(firstValue).assertEqual('a');
      expect(secondValue).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_4400
     * @tc.name testBoxGenericConstructorTestFive044
     * @tc.desc Verify Box<number[]> get()[0] accesses first element directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number[]>([1, 2, 3]);
      expect(box.get()[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_4500
     * @tc.name testBoxGenericConstructorTestFive045
     * @tc.desc Verify Record with Box<boolean> flag field accessible via get().flag.get()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: FlagRecord = { flag: new Box<boolean>(true) };
      const box = new Box<FlagRecord>(rec);
      const flagBox = box.get().flag;
      const flagValue = flagBox.get();
      expect(flagValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_4600
     * @tc.name testBoxGenericConstructorTestFive046
     * @tc.desc Verify Box<AnimalBase> with DogBase subclass instance stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new DogBase();
      const box = new Box<AnimalBase>(dog);
      expect(box.get()).assertEqual(dog);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_4700
     * @tc.name testBoxGenericConstructorTestFive047
     * @tc.desc Verify Box<Flyable> with Bird implementation instance stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bird = new Bird();
      const box = new Box<Flyable>(bird);
      expect(box.get()).assertEqual(bird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_4800
     * @tc.name testBoxGenericConstructorTestFive048
     * @tc.desc Verify Box.box<string>() with special characters stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<string>('!@#$%^');
      expect(box.get()).assertEqual('!@#$%^');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_4900
     * @tc.name testBoxGenericConstructorTestFive049
     * @tc.desc Verify Box.box<string>() with newline escape character stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<string>('Line1\nLine2');
      expect(box.get()).assertEqual('Line1\nLine2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_5000
     * @tc.name testBoxGenericConstructorTestFive050
     * @tc.desc Verify Box.box<string>() with leading and trailing spaces stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<string>('  spaced  ');
      expect(box.get()).assertEqual('  spaced  ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_5100
     * @tc.name testBoxGenericConstructorTestFive051
     * @tc.desc Verify Box.box<ABC>() with three-field interface object stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ABC = { a: 1, b: 2, c: 3 };
      const box = Box.box<ABC>(obj);
      expect(box.get()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_5200
     * @tc.name testBoxGenericConstructorTestFive052
     * @tc.desc Verify Box.box<L1>() with deeply nested object stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: L1 = { l1: { l2: { name: 'deep' } } };
      const box = Box.box<L1>(obj);
      expect(box.get()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_5300
     * @tc.name testBoxGenericConstructorTestFive053
     * @tc.desc Verify Box.box<NameTags>() with tags array field stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: NameTags = { name: 'ArkTS', tags: ['ts', 'ark'] };
      const box = Box.box<NameTags>(obj);
      expect(box.get()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_5400
     * @tc.name testBoxGenericConstructorTestFive054
     * @tc.desc Verify Box.box<HasGetName>() with function-typed field stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: HasGetName = { getName: (): string => 'ArkTS' };
      const box = Box.box<HasGetName>(obj);
      expect(box.get()).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_5500
     * @tc.name testBoxGenericConstructorTestFive055
     * @tc.desc Verify Box.box<number[]>() with integer array stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<number[]>([1, 2, 3]);
      const result = box.get();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_5600
     * @tc.name testBoxGenericConstructorTestFive056
     * @tc.desc Verify Box.box<string[]>() with string array stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<string[]>(['a', 'b', 'c']);
      const result = box.get();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_5700
     * @tc.name testBoxGenericConstructorTestFive057
     * @tc.desc Verify Box.box<IdObj[]>() with object array stores correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: IdObj[] = [{ id: 1 }, { id: 2 }, { id: 3 }];
      const box = Box.box<IdObj[]>(arr);
      expect(box.get().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_5800
     * @tc.name testBoxGenericConstructorTestFive058
     * @tc.desc Verify Box.box<boolean[]>() with boolean array stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = Box.box<boolean[]>([true, false, true]);
      const result = box.get();
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
      expect(result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_5900
     * @tc.name testBoxGenericConstructorTestFive059
     * @tc.desc Verify Box.box<number[]>() get() mutation modifies original array via reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const box = Box.box<number[]>(arr);
      box.get()[0] = 100;
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_6000
     * @tc.name testBoxGenericConstructorTestFive060
     * @tc.desc Verify Box.box<XY>() with typed Record stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: XY = { x: 1, y: 2 };
      const box = Box.box<XY>(rec);
      expect(box.get()).assertEqual(rec);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_6100
     * @tc.name testBoxGenericConstructorTestFive061
     * @tc.desc Verify Box.box wraps Record<number,string> and preserves the first entry value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<number, string> = { 0: 'a', 1: 'b' };
      const box = Box.box<Record<number, string>>(rec);
      expect(box.get()[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_6200
     * @tc.name testBoxGenericConstructorTestFive062
     * @tc.desc Verify Box.box with Map<string,number> and get value by key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('a', 1);
      const box = Box.box<Map<string, number>>(map);
      const mapValue = box.get().get('a')!;
      expect(mapValue).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_6300
     * @tc.name testBoxGenericConstructorTestFive063
     * @tc.desc Verify Box.box with Map of 1000 entries has size 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>();
      for (let i = 0; i < 1000; i++) {
        const doubledValue: number = i * 2;
        map.set(i, doubledValue);
      }
      const box = Box.box<Map<number, number>>(map);
      expect(box.get().size).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_6400
     * @tc.name testBoxGenericConstructorTestFive064
     * @tc.desc Verify Box.box with nested Map structure returns correct nested Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Map<string, number>();
      inner.set('inner', 1);
      const outer = new Map<string, Map<string, number>>();
      outer.set('outer', inner);
      const box = Box.box<Map<string, Map<string, number>>>(outer);
      const innerMap = box.get().get('outer')!;
      const innerValue = innerMap.get('inner')!;
      expect(innerValue).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_6500
     * @tc.name testBoxGenericConstructorTestFive065
     * @tc.desc Verify Box.box with Set<number> of 3 items has size 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([1, 2, 3]);
      const box = Box.box<Set<number>>(set);
      expect(box.get().size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_6600
     * @tc.name testBoxGenericConstructorTestFive066
     * @tc.desc Verify Box<string> constructor preserves surrounding spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = '  value  ';
      const box = new Box<string>(value);
      expect(box.get()).assertEqual(value);
      expect(box.get().length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_6700
     * @tc.name testBoxGenericConstructorTestFive067
     * @tc.desc Verify Box<string> constructor preserves Unicode text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = 'Box-测试';
      const box = new Box<string>(text);
      expect(box.get()).assertEqual(text);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_6800
     * @tc.name testBoxGenericConstructorTestFive068
     * @tc.desc Verify Box<number> constructor preserves negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>(-0.0);
      expect(box.get()).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_6900
     * @tc.name testBoxGenericConstructorTestFive069
     * @tc.desc Verify Box<number> constructor preserves positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>(Double.POSITIVE_INFINITY);
      expect(box.get()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_7000
     * @tc.name testBoxGenericConstructorTestFive070
     * @tc.desc Verify Box<number[]> constructor preserves nested array rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rows: number[][] = [
        [1, 2],
        [3, 4],
      ];
      const box = new Box<number[][]>(rows);
      expect(box.get()[1][0]).assertEqual(3);
      expect(box.get().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_7100
     * @tc.name testBoxGenericConstructorTestFive071
     * @tc.desc Verify Box<Map<string,number>> constructor preserves key lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('score', 88);
      const box = new Box<Map<string, number>>(map);
      expect(box.get().get('score')).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_7200
     * @tc.name testBoxGenericConstructorTestFive072
     * @tc.desc Verify Box<Map<string,number>> preserves map size and absence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>();
      map.set('a', 1);
      map.set('b', 2);
      const box = new Box<Map<string, number>>(map);
      expect(box.get().size).assertEqual(2);
      expect(box.get().has('c')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_7300
     * @tc.name testBoxGenericConstructorTestFive073
     * @tc.desc Verify Box<Set<string>> constructor preserves membership
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['red', 'blue']);
      const box = new Box<Set<string>>(set);
      expect(box.get().has('blue')).assertTrue();
      expect(box.get().size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_7400
     * @tc.name testBoxGenericConstructorTestFive074
     * @tc.desc Verify Box<Record<number,string>> preserves numeric keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = { 0: 'zero', 1: 'one' };
      const box = new Box<Record<number, string>>(record);
      expect(box.get()[1]).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_7500
     * @tc.name testBoxGenericConstructorTestFive075
     * @tc.desc Verify Box<Date> constructor preserves the original date reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2026, 7, 25);
      const box = new Box<Date>(date);
      expect(box.get()).assertEqual(date);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_7600
     * @tc.name testBoxGenericConstructorTestFive076
     * @tc.desc Verify Box<Promise<string>> preserves resolved Promise reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const promise: Promise<string> = Promise.resolve('ready');
      const box = new Box<Promise<string>>(promise);
      expect(box.get()).assertEqual(promise);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_7700
     * @tc.name testBoxGenericConstructorTestFive077
     * @tc.desc Verify nested Box constructor preserves an inner array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Box<number[]>([1, 2, 3]);
      const outer = new Box<Box<number[]>>(inner);
      expect(outer.get().get().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_7800
     * @tc.name testBoxGenericConstructorTestFive078
     * @tc.desc Verify array of Box<string> instances preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const boxes: Box<string>[] = [new Box<string>('first'), new Box<string>('second')];
      expect(boxes[0].get()).assertEqual('first');
      expect(boxes[1].get()).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_7900
     * @tc.name testBoxGenericConstructorTestFive079
     * @tc.desc Verify default Box<number> becomes readable after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<number>();
      box.set(100);
      expect(box.get()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_8000
     * @tc.name testBoxGenericConstructorTestFive080
     * @tc.desc Verify Box<string|undefined> preserves undefined input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new Box<string | undefined>(undefined);
      expect(box.get()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_8100
     * @tc.name testBoxGenericConstructorTestFive081
     * @tc.desc Verify Box.box returns same Set reference via get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>([1, 2, 3]);
      const box = Box.box<Set<number>>(set);
      let sameSetReference: boolean = box.get() === set;
      expect(sameSetReference).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_8200
     * @tc.name testBoxGenericConstructorTestFive082
     * @tc.desc Verify Box.box returns same Date reference via get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      const box = Box.box<Date>(date);
      let sameDateReference: boolean = box.get() === date;
      expect(sameDateReference).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_8300
     * @tc.name testBoxGenericConstructorTestFive083
     * @tc.desc Verify Box.box returns same Error reference via get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new Error('test');
      const box = Box.box<Error>(err);
      let sameErrorReference: boolean = box.get() === err;
      expect(sameErrorReference).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_8400
     * @tc.name testBoxGenericConstructorTestFive084
     * @tc.desc Verify Box.box with subclass as parent type preserves reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new B();
      const box = Box.box<A>(b);
      let sameSubclassReference: boolean = box.get() === b;
      expect(sameSubclassReference).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_8500
     * @tc.name testBoxGenericConstructorTestFive085
     * @tc.desc Verify two Box<number[]> with same array are not reference-equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const firstBox = Box.box<number[]>(arr);
      const secondBox = Box.box<number[]>(arr);
      let differentBoxReferencesForSameArray: boolean = firstBox === secondBox;
      expect(differentBoxReferencesForSameArray).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_GENERICCONSTRUCTOR_FIVE_8600
     * @tc.name testBoxGenericConstructorTestFive086
     * @tc.desc Verify Box.box with subclass as parent type preserves reference equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxGenericConstructorTestFive086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new DogBase();
      const box = Box.box<AnimalBase>(dog);
      let sameDogReference: boolean = box.get() === dog;
      expect(sameDogReference).assertTrue();
    });

  });
}
